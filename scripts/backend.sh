#!/bin/sh

sqlite3 "$1" <<eof
CREATE TABLE IF NOT EXISTS message (
    id TEXT PRIMARY KEY DEFAULT (uuid()),
    body TEXT NOT NULL,
    created_at INTEGER(4) NOT NULL DEFAULT (strftime('%s', 'now')),
    deleted_at INTEGER(4) NULL
);
eof