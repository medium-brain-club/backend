package handler

import(
    "log"
    "strings"
    "fmt"
    "net/http"
    "encoding/json"

    "github.com/google/uuid"

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

    rows, err := db.Query("SELECT Uuid, Title, Body, Created_at, TagsList, LikeCount, SupportCount, LoveCount, InteractionCount FROM v_FE_Message m WHERE m.Deleted_at IS NULL")
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

func (dbh DatabaseHandler) PostMessages(w http.ResponseWriter, req *http.Request) {
    var messages []struct {
        Title   string
        Body    string
    }

    err := json.NewDecoder(req.Body).Decode(&messages)
    if err != nil {
        log.Fatal(err)
    }

    log.Printf("*** DEBUG: POSTing with data %+v\n", messages)

    db, err := sql.Open("sqlite3", dbh.DBPath)
    if err != nil {
        log.Fatal(err)
    }
    defer db.Close()

    _, err = db.Exec("INSERT INTO Message (Uuid, Title, Body) VALUES ( ?, ?, ? );", uuid.NewString(), messages[0].Title, messages[0].Body)

    dbh.GetMessages(w, req)
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
