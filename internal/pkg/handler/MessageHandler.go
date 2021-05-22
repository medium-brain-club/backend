package handler

import(
    "log"
    //"strings"
    "html/template"
    "net/http"
    //_ "github.com/mattn/go-sqlite3"
    //"database/sql"
)

type MessageHandler struct {
    DBPath string
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
