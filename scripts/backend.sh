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

CREATE TABLE IF NOT EXISTS Interaction (
    Id INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    Created_at INTEGER(4) NOT NULL DEFAULT (strftime('%s', 'now')),
    Deleted_at INTEGER(4) NULL
);

CREATE TABLE IF NOT EXISTS MessageToInteraction (
    Id INTEGER PRIMARY KEY,
    MessageUuid TEXT NOT NULL,
    InteractionId INTEGER NOT NULL,
    Created_at INTEGER(4) NOT NULL DEFAULT (strftime('%s', 'now')),
    Deleted_at INTEGER(4) NULL,
    FOREIGN KEY (MessageUuid) REFERENCES Message (Uuid),
    FOREIGN KEY (InteractionId) REFERENCES Interaction (Id)
);

CREATE VIEW IF NOT EXISTS v_FE_Message (
    Uuid,
    Title,
    Body,
    Created_at,
    Deleted_at,
    TagsList,
    LikeCount,
    SupportCount,
    LoveCount,
    InteractionCount
)
AS
    SELECT 
        m.Uuid
        , m.Title
        , m.Body
        , m.Created_at
        , m.Deleted_at
        , COALESCE(tt.TagsList, '') AS TagsList
        , COALESCE(ii.LikeCount, 0) AS LikeCount
        , COALESCE(ii.SupportCount, 0) AS SupportCount
        , COALESCE(ii.LoveCount, 0) AS LoveCount
        , COALESCE(ii.InteractionCount, 0) AS InteractionCount
    FROM
        Message m
    LEFT OUTER JOIN
        (
            SELECT
                MessageUuid
                , GROUP_CONCAT(Name) AS TagsList
            FROM
                MessageToTag mtt
            JOIN
                Tag t ON mtt.TagId = t.Id AND mtt.deleted_at IS NULL AND t.deleted_at IS NULL
            GROUP BY MessageUuid
        ) tt on m.Uuid = tt.MessageUuid
    LEFT OUTER JOIN
        (
            SELECT
                MessageUuid
                , i.Id
                , SUM(CASE WHEN i.Id = 1 THEN 1 ELSE 0 END) AS LikeCount
                , SUM(CASE WHEN i.Id = 2 THEN 1 ELSE 0 END) AS SupportCount
                , SUM(CASE WHEN i.Id = 3 THEN 1 ELSE 0 END) AS LoveCount
                , COUNT(*) AS InteractionCount
            FROM
                MessageToInteraction mti
            JOIN
                Interaction i ON mti.InteractionId = i.Id AND mti.deleted_at IS NULL AND i.deleted_at IS NULL
            GROUP BY MessageUuid
        ) ii ON m.Uuid = ii.MessageUuid
;
eof
