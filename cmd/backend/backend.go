package main

import (
    "internal/pkg/handler"

    "log"
    "strings"
    "net/http"

    "github.com/gorilla/mux"
)

func headersMiddleware(next http.Handler) http.Handler {
    return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
        w.Header().Set("Access-Control-Allow-Origin", "*")
        next.ServeHTTP(w, r)
    })
}

func main() {
    dbh := handler.DatabaseHandler {
        "assets/backend.db",
    } 

    apiPrefix := "/api"
    router := mux.NewRouter()
    router.HandleFunc("/", handler.GetDefault).Methods("GET")
    apiRouter := router.PathPrefix(apiPrefix).Subrouter()
    apiRouter.HandleFunc("/messages", dbh.GetMessages).Methods("GET")
    apiRouter.HandleFunc("/messages", dbh.PostMessages).Methods("POST")
    apiRouter.HandleFunc("/tags", dbh.GetTags).Methods("GET")
    apiRouter.HandleFunc("/tags", dbh.PostTags).Methods("POST")
    apiRouter.Use(headersMiddleware)

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
