package handler

import(
    "log"
    //"strings"
    "fmt"
    "net/http"
    "encoding/json"

    _ "github.com/mattn/go-sqlite3"
    "database/sql"
)

type DatabaseHandler struct {
    DBPath string
}

func (dbh DatabaseHandler) GetMessages(w http.ResponseWriter, req *http.Request) {
    var messages = dbh.readMessages()

    messagesJson, err := json.Marshal(messages)
    if err != nil {
        log.Fatal(err)
    }

    w.Header().Set("Content-Type", "application/json")
    fmt.Fprint(w, string(messagesJson))
}

type MessageRow struct {
    UUID        string
    Title       *string
    Body        string
    CreatedAt   int
}

func (mh DatabaseHandler) readMessages() ([]MessageRow) {
    var messages []MessageRow

    db, err := sql.Open("sqlite3", mh.DBPath)
    if err != nil {
        log.Fatal(err)
    }
    defer db.Close()

    rows, err := db.Query("SELECT uuid, body, created_at FROM message WHERE deleted_at IS NULL;")
    if err != nil {
        log.Fatal(err)
    }
    defer rows.Close()
    for rows.Next() {
        var row MessageRow
        
        err = rows.Scan(&row.UUID, &row.Title, &row.Body, &row.CreatedAt)
        if err != nil {
            log.Fatal(err)
        }
        messages = append(messages, row)
    }
    err = rows.Err()
    if err != nil {
        log.Fatal(err)
    }

    return messages
}

func (dbh DatabaseHandler) readTags() ([]TagRow) {
    var tags []TagRow

    db, err := sql.Open("sqlite3", dbh.DBPath)
    if err != nil {
        log.Fatal(err)
    }
    defer db.Close()

    rows, err := db.Query("SELECT Id, Name, Created_at FROM Tag WHERE Deleted_at IS NULL;")
    if err != nil {
        log.Fatal(err)
    }
    defer rows.Close()
    for rows.Next() {
        var row TagRow

        err = rows.Scan(&row.ID, &row.Name, &row.CreatedAt)
        if err != nil {
            log.Fatal(err)
        }
        tags = append(tags, row)
    }

    err = rows.Err()
    if err != nil {
        log.Fatal(err)
    }

    return tags
}

func (dbh DatabaseHandler) GetTags(w http.ResponseWriter, req *http.Request) {
    var tags = dbh.readTags()

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

type TagRow struct {
    ID          int
    Name        string
    CreatedAt   int
}
