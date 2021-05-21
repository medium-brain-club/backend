package main

import (
    "log"
    "strings"
    "net/http"
    "github.com/gorilla/mux"
    "internal/pkg/handler"
)

func main() {
    mh := handler.MessageHandler {
        "/usr/share/messagedata"
        "/usr/share/web" 
    }

    apiPrefix := "/api"
    router := mux.NewRouter()
    apiRouter := router.PathPrefix(apiPrefix).Subrouter()

    apiRouter.HandleFunc("/", 

    http.Handle("/", apiRouter);

    defer log.Println("*** INFO: Backend API started.");
    log.Fatal(http.ListenAndServe(strings.Join([]string{":", "8080"}, ""), router));
}
