CREATE TYPE task_status AS ENUM('done', 'reject', 'pending', 'processing');
CREATE TABLE tasks(
    id serial PRIMARY KEY,
    body varchar(256) NOT NULL,
    user_id int REFERENCES users(id),
    deadline timestamp,
    status task_status
);
INSERT INTO tasks(body, user_id, deadline)
VALUES ('body1', 1, '2024-08-26'),
    ('body2', 11, '2024-08-26'),
    ('body3', 41, '2024-08-26');
INSERT INTO tasks(body, user_id, deadline, status)
VALUES ('new body task', 1, NULL, 'pending');


-- add new column
ALTER TABLE tasks
ADD COLUMN created_at timestamp NOT NULL DEFAULT current_timestamp;

-- delete new column
ALTER TABLE tasks DROP COLUMN created_at;

--add new constraint
ALTER TABLE tasks
ADD CHECK(created_at <= current_timestamp);

--delete new constraint
ALTER TABLE tasks
ADD CONSTRAINT "check_created_at" CHECK(created_at <= current_timestamp)
ALTER TABLE tasks DROP CONSTRAINT check_created_at;

--set not null
UPDATE tasks
SET status = 'done'
WHERE status IS NULL;
ALTER TABLE tasks
ALTER COLUMN status
SET NOT NULL;

--set default
ALTER TABLE tasks
ALTER COLUMN deadline
SET DEFAULT current_timestamp;

ALTER TABLE tasks
ALTER COLUMN status SET DEFAULT 'pending';

INSERT INTO tasks(body, user_id, status)
VALUES ('new body task', 19, 'processing');


--update type
ALTER TABLE tasks
ALTER COLUMN body TYPE text;

--rename
ALTER TABLE tasks
RENAME COLUMN body TO content

ALTER TABLE tasks
RENAME TO user_tasks

SELECT *
FROM user_tasks;