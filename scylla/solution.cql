CREATE TABLE posts_by_user (
    user_id int,
    post_id int,
    content text,
    username text,
    created_at timestamp,
    PRIMARY KEY (user_id, created_at)
) WITH CLUSTERING ORDER BY (created_at DESC);


CREATE TABLE posts_by_topic_and_day (
    topic_id int,
    post_date date,
    created_at timestamp,
    user_id int,
    username text,
    post_id int,
    PRIMARY KEY ((topic_id, post_date), created_at)
) WITH CLUSTERING ORDER BY (created_at DESC);

-- 1 запрос
SELECT post_id, content, created_at
FROM posts_by_user
WHERE user_id = 1;

-- 2 запрос
SELECT post_id, content, created_at, username
FROM posts_by_user
WHERE user_id = 1
LIMIT 1;

-- 3 запрос
SELECT post_id, content, created_at
FROM posts_by_user
WHERE user_id = 1 AND created_at > '2023-01-01 00:00:00';

-- 4 запрос
SELECT user_id, username, post_id, created_at
FROM posts_by_topic_and_day
WHERE topic_id = 10 AND post_date = '2023-10-27';