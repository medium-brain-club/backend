package main

import (
    "internal/pkg/handler"

    "log"
    "strings"
    "net/http"

    "github.com/gorilla/mux"
)

func main() {
    dbh := handler.DatabaseHandler {
        "assets/backend.db",
    } 

    apiPrefix := "/api"
    router := mux.NewRouter()
    apiRouter := router.PathPrefix(apiPrefix).Subrouter()

    apiRouter.HandleFunc("/", handler.GetDefault).Methods("GET")
    apiRouter.HandleFunc("/messages", dbh.GetMessages).Methods("GET")
    apiRouter.HandleFunc("/tags", dbh.GetTags).Methods("GET")

    http.Handle("/", apiRouter)

    log.Println("*** INFO: Available Routes")
    router.Walk(func(route *mux.Route, router *mux.Router, ancestors []*mux.Route) error {
        t, err := route.GetPathTemplate()
        if err != nil {
            return err
        }
        log.Println("*** INFO: " + t)
        return nil
    })
    log.Fatal(http.ListenAndServe(strings.Join([]string{":", "8080"}, ""), router))
}
