#!/bin/sh

sqlite3 "$1" <<eof
CREATE TABLE IF NOT EXISTS Message (
    Uuid TEXT PRIMARY KEY,
    Title TEXT,
    Body TEXT NOT NULL,
    Created_at INTEGER(4) NOT NULL DEFAULT (strftime('%s', 'now')),
    Deleted_at INTEGER(4) NULL
);

CREATE TABLE IF NOT EXISTS Tag (
    Id INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    Created_at INTEGER(4) NOT NULL DEFAULT (strftime('%s', 'now')),
    Deleted_at INTEGER(4) NULL
);

CREATE TABLE IF NOT EXISTS MessageToTag (
    MessageUuid TEXT NOT NULL,
    TagId INTEGER NOT NULL,
    Created_at INTEGER(4) NOT NULL DEFAULT (strftime('%s', 'now')),
    Deleted_at INTEGER(4) NULL,
    PRIMARY KEY (MessageUuid, TagId),
    FOREIGN KEY (MessageUuid) REFERENCES Message (Uuid),
    FOREIGN KEY (TagId) REFERENCES Tag (Id)
);
eof
