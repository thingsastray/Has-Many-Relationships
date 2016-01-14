DROP USER IF EXISTS has_many_user;

CREATE USER has_many_user;

-- DROP DATABASE has_many_blogs;

CREATE DATABASE	has_many_blogs OWNER has_many_user;

\c has_many_blogs;

DROP TABLE IF EXISTS users, posts, comments;

CREATE TABLE users (
 id serial PRIMARY KEY not null,
 username char(90) not null,
 first_name char(90) null,
 last_name char (90) null,
 created_at timestamp not null DEFAULT now(),
 updated_at timestamp not null DEFAULT now(),

);

CREATE TABLE posts (
 id serial PRIMARY KEY not null,
 title char(180) null,
 url char(510) null,
 content text null,
 created_at timestamp not null DEFAULT now(),
 updated_at timestamp not null DEFAULT now(),
 user_id int REFERENCES users(id)
);

CREATE TABLE comments (
 id serial PRIMARY KEY not null,
 body char(510) null,
 created_at timestamp not null DEFAULT now(),
 updated_at timestamp not null DEFAULT now(),
 user_id int REFERENCES users(id),
 posts_id int REFERENCES posts(id)
);

