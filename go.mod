module project

go 1.14

require (
	github.com/google/uuid v1.2.0 // indirect
	github.com/gorilla/handlers v1.5.0 // indirect
	github.com/gorilla/mux v1.8.0 // indirect
	github.com/mattn/go-sqlite3 v2.0.3+incompatible // indirect
	internal/pkg/handler v1.0.0
)

replace internal/pkg/handler => ./internal/pkg/handler
