package handler

import (
    "log"
    "net/http"
    "html/template"
)

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

