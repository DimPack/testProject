DROP TABLE IF EXISTS "comments";
DROP TABLE IF EXISTS "reactions";
DROP TABLE IF EXISTS "contents";

CREATE TABLE IF NOT EXISTS "contents"(
    "id" serial PRIMARY KEY,
    "name" VARCHAR(64) NOT NULL CHECK ("name" != '') UNIQUE,
    "description" text NOT NULL CHECK ("description" != ''),
    "author" INT REFERENCES "users"("id"),
    "createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS "reactions"(
  "nameContent" INT REFERENCES "contents"("id"),
  "userId" INT REFERENCES "users"("id"),
  "isLiked" BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS "comments"(
  "body" VARCHAR,
  "userId" INT REFERENCES "users"("id"),
  "nameContent" INT REFERENCES "contents"("id")
);