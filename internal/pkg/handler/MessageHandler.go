package handler

import(
    "log"
    //"strings"
    "fmt"
    "html/template"
    "net/http"
    "encoding/json"

    _ "github.com/mattn/go-sqlite3"
    "database/sql"
)

type MessageHandler struct {
    DBPath string
}

func (mh MessageHandler) GetMessage(w http.ResponseWriter, req *http.Request) {
    var messages = mh.readMessages();

    messagesJson, err := json.Marshal(messages)
    if err != nil {
        log.Fatal(err)
    }

    w.Header().Set("Content-Type", "application/json")
    fmt.Fprint(w, string(messagesJson))
}

func GetDefault(w http.ResponseWriter, req *http.Request) {
    templatePath := "web/index.html"
    t, err := template.ParseFiles(templatePath)
    if err != nil {
        log.Println(err)
        w.WriteHeader(http.StatusInternalServerError)
        return
    }

    t.Execute(w, nil)
}

type MessageRow struct {
    RowID       int
    UUID        string
    Body        string
    CreatedAt   int
}

func (mh MessageHandler) readMessages() ([]MessageRow) {
    var messages []MessageRow

    db, err := sql.Open("sqlite3", mh.DBPath)
    if err != nil {
        log.Fatal(err)
    }
    defer db.Close()

    rows, err := db.Query("SELECT rowid, uuid, body, created_at FROM message WHERE deleted_at IS NULL;")
    if err != nil {
        log.Fatal(err)
    }
    defer rows.Close()
    for rows.Next() {
        var row MessageRow
        
        err = rows.Scan(&row.RowID, &row.UUID, &row.Body, &row.CreatedAt)
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
