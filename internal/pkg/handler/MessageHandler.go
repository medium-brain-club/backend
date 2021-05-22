package handler

import(
    "log"
    //"strings"
    "html/template"
    "net/http"
    "path/filepath"
    //_ "github.com/mattn/go-sqlite3"
    //"database/sql"
)

type MessageHandler struct {
    DBPath string
    TemplateRootPath string
}

func (mh MessageHandler) GetDefault(w http.ResponseWriter, req *http.Request) {
    templatePath := filepath.Join(mh.TemplateRootPath, "index.html")
    t, err := template.ParseFiles(templatePath)
    if err != nil {
        log.Println(err)
        w.WriteHeader(http.StatusInternalServerError)
        return
    }

    t.Execute(w, nil)
}
