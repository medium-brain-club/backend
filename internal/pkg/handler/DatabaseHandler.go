package handler

import(
    "log"
    "strings"
    "fmt"
    "net/http"
    "encoding/json"

    _ "github.com/mattn/go-sqlite3"
    "database/sql"
)

type DatabaseHandler struct {
    DBPath string
}

type MessageRow struct {
    UUID                string
    Title               *string
    Body                string
    CreatedAt           int
    Tags                []string
    LikeCount           int
    SupportCount        int
    LoveCount           int
    InteractionCount    int
}

func (dbh DatabaseHandler) GetMessages(w http.ResponseWriter, req *http.Request) {
    var messages []MessageRow
    
    db, err := sql.Open("sqlite3", dbh.DBPath)
    if err != nil {
        log.Fatal(err)
    }
    defer db.Close()

    rows, err := db.Query(`
        SELECT 
            m.Uuid
            , m.Title
            , m.Body
            , m.Created_at
            , GROUP_CONCAT(t.Name) AS TagsList
            , (SELECT COUNT(i.Id) FROM Interaction i JOIN MessageToInteraction mti ON i.Id = mti.InteractionId WHERE mti.MessageUuid = m.Uuid AND i.Id = 1) AS LikeCount
            , (SELECT COUNT(i.Id) FROM Interaction i JOIN MessageToInteraction mti ON i.Id = mti.InteractionId WHERE mti.MessageUuid = m.Uuid AND i.Id = 2) AS SupportCount
            , (SELECT COUNT(i.Id) FROM Interaction i JOIN MessageToInteraction mti ON i.Id = mti.InteractionId WHERE mti.MessageUuid = m.Uuid AND i.Id = 3) AS LoveCount
            , (SELECT COUNT(i.Id) FROM Interaction i JOIN MessageToInteraction mti ON i.Id = mti.InteractionId WHERE mti.MessageUuid = m.Uuid AND i.Id = 4) AS InteractionCount
        FROM
            Message m
        JOIN
            MessageToTag mtt ON m.Uuid = mtt.MessageUuid
        JOIN
            Tag t ON mtt.TagId = t.Id
        WHERE 
            m.deleted_at IS NULL AND t.deleted_at IS NULL
        GROUP BY
            m.Uuid;
    `)
    if err != nil {
        log.Fatal(err)
    }
    defer rows.Close()

    for rows.Next() {
        var message MessageRow
        var tagsList string

        err = rows.Scan(&message.UUID, &message.Title, &message.Body, &message.CreatedAt, &tagsList, &message.LikeCount, &message.SupportCount, &message.LoveCount, &message.InteractionCount)
        if err != nil {
            log.Fatal(err)
        }

        message.Tags = strings.Split(tagsList, ",")

        messages = append(messages, message)
    }

    err = rows.Err()
    if err != nil {
        log.Fatal(err)
    }

    messagesJson, err := json.Marshal(messages)
    if err != nil {
        log.Fatal(err)
    }

    w.Header().Set("Content-Type", "application/json")
    fmt.Fprint(w, string(messagesJson))
}

// ##################
// # BEGIN Tag
// ##################
type TagRow struct {
    ID          int
    Name        string
    CreatedAt   int
}

func (dbh DatabaseHandler) GetTags(w http.ResponseWriter, req *http.Request) {
    var tags []TagRow

    db, err := sql.Open("sqlite3", dbh.DBPath)
    if err != nil {
        log.Fatal(nil)
    }
    defer db.Close()

    rows, err := db.Query("SELECT Id, Name, Created_at FROM Tag WHERE Deleted_at IS NULL;")
    if err != nil {
        log.Fatal(err)
    }
    defer rows.Close()
    
    for rows.Next() {
        var tag TagRow

        err = rows.Scan(&tag.ID, &tag.Name, &tag.CreatedAt)
        if err != nil {
            log.Fatal(err)
        }
        tags = append(tags, tag)
    }

    tagsJson, err := json.Marshal(tags)
    if err != nil {
        log.Fatal(err)
    }

    w.Header().Set("Content-Type", "application/json")
    fmt.Fprint(w, string(tagsJson))
}

func (dbh DatabaseHandler) PostTags(w http.ResponseWriter, req *http.Request) {
    var tags []struct {
        Name string 
    }

    err := json.NewDecoder(req.Body).Decode(&tags)
    if err != nil {
        log.Fatal(err)
    }

    log.Printf("*** DEBUG POSTing new Tag entities with data:\n%#v\n", tags)

    db, err := sql.Open("sqlite3", dbh.DBPath)
    if err != nil {
        log.Fatal(err)
    }
    defer db.Close()

    // TODO: Check for existance of tags with matching names in the database
    //       and return an error if there is a conflict.

    for i := 0; i < len(tags); i++ {
        log.Printf("*** DEBUG POST Query:\nINSERT INTO Tag (Name) VALUES ( '%s' );\n", tags[i].Name)
        _, err := db.Exec("INSERT INTO Tag (Name) VALUES ( ? );", tags[i].Name)
        if err != nil {
            log.Fatal(err)
        }
    }

    dbh.GetTags(w, req)
}
