DROP TABLE IF EXISTS endava_quizzes_taken;
-- select answers
DROP TABLE IF EXISTS endava_responses;
-- question answer options
DROP TABLE IF EXISTS endava_answers;
-- quiz questions
DROP TABLE IF EXISTS endava_questions;
-- select results
DROP TABLE IF EXISTS endava_results;
-- quizzes
DROP TABLE IF EXISTS endava_quizzes;
-- quiz cateogies
DROP TABLE IF EXISTS endava_quiz_categories;
-- quiz question types
DROP TABLE IF EXISTS endava_question_types;

DROP TABLE IF EXISTS endava_user_groups;
DROP TABLE IF EXISTS endava_users;
DROP TABLE IF EXISTS endava_groups;

CREATE TABLE IF NOT EXISTS endava_users (
  id SERIAL UNIQUE NOT NULL,
  user_name VARCHAR(100),
  user_email VARCHAR(100),
  user_password VARCHAR(70),
  user_first_name VARCHAR(100),
  user_last_name VARCHAR(100),
  enabled boolean default true,
  admin boolean default true,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS endava_groups (
  id SERIAL UNIQUE NOT NULL,
  group_name VARCHAR(100),
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS endava_user_groups (
  id SERIAL UNIQUE NOT NULL,
  id_user INTEGER REFERENCES endava_users(id),
  id_group INTEGER REFERENCES endava_groups(id),
  PRIMARY KEY(id)
);


INSERT INTO endava_groups (id, group_name) VALUES (nextval('endava_groups_id_seq'), 'ROLE_ADMIN');
INSERT INTO endava_groups (id, group_name) VALUES (nextval('endava_groups_id_seq'), 'ROLE_USER');


INSERT INTO endava_users (id, user_name, user_email, user_password, user_first_name, user_last_name, enabled, admin) VALUES (nextval('endava_users_id_seq'), 'ceva', 'vladu@endava.com', '1234', 'Vlad', 'Ungureanu', '1', '1');
INSERT INTO endava_users (id, user_name, user_email, user_password, user_first_name, user_last_name, enabled, admin) VALUES (nextval('endava_users_id_seq'), 'David', 'david@endava.com', '4297f44b13955235245b2497399d7a93', 'David', 'Endava', '1', '0');

INSERT INTO endava_user_groups (id, id_user, id_group) VALUES (nextval('endava_user_groups_id_seq'), 1, 1);
INSERT INTO endava_user_groups (id, id_user, id_group) VALUES (nextval('endava_user_groups_id_seq'), 2, 2);


CREATE TABLE IF NOT EXISTS endava_quiz_categories (
  id SERIAL UNIQUE NOT NULL,
  category_name VARCHAR(100),
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS endava_question_types(
  id SERIAL UNIQUE NOT NULL,
  question_type VARCHAR(100),
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS  endava_quizzes(
  id SERIAL UNIQUE NOT NULL,
  quiz_name VARCHAR(100),
  quiz_level VARCHAR(20),
  quiz_code VARCHAR(10),
  quiz_autoeval boolean default false,
  id_category integer REFERENCES endava_quiz_categories(id),
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS  endava_questions(
  id SERIAL UNIQUE NOT NULL,
  question text,
  question_image VARCHAR(100),
  question_url VARCHAR(100),
  question_autoeval boolean default true,
  question_score double precision default 0,
  id_quiz integer REFERENCES endava_quizzes(id),
  id_question_type integer REFERENCES endava_question_types(id),
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS  endava_answers(
  id SERIAL UNIQUE NOT NULL,
  answer text,
  answer_score double precision default 0,
  answer_image varchar(100),
  correct_answer boolean default false,
  id_question integer REFERENCES endava_questions(id),
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS  endava_results(
  id SERIAL UNIQUE NOT NULL,
  results double precision,
  statistics double precision,
  taken_on date,
  details text,
  id_quiz integer REFERENCES endava_quizzes(id),
  user_name varchar(100),
  user_details text,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS  endava_quizzes_taken(
  id SERIAL UNIQUE NOT NULL,
  user_name varchar(100),
  user_email varchar(100),
  user_phone varchar(100),
  user_details text,
  date_taken date,
  quiz_score double precision default 0,
  quiz_evaluated boolean default false,
  quiz_taken_code varchar(30),
  id_quiz integer REFERENCES endava_quizzes(id),
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS  endava_responses(
  id SERIAL UNIQUE NOT NULL,
  user_response text,
  selected_response boolean default false,
  correct_response boolean default false,
  id_question integer REFERENCES endava_questions(id),
  id_answer integer,
  id_quiz_taken integer REFERENCES endava_quizzes_taken(id),
  PRIMARY KEY(id)
);

INSERT INTO endava_quiz_categories(id, category_name) VALUES (nextval('endava_quiz_categories_id_seq'), 'Java Core');
INSERT INTO endava_quiz_categories(id, category_name) VALUES (nextval('endava_quiz_categories_id_seq'), 'Java Web');
INSERT INTO endava_quiz_categories(id, category_name) VALUES (nextval('endava_quiz_categories_id_seq'), 'SQL');
INSERT INTO endava_quiz_categories(id, category_name) VALUES (nextval('endava_quiz_categories_id_seq'), 'JPA');
INSERT INTO endava_quiz_categories(id, category_name) VALUES (nextval('endava_quiz_categories_id_seq'), 'Spring');
INSERT INTO endava_quiz_categories(id, category_name) VALUES (nextval('endava_quiz_categories_id_seq'), 'Spring Advanced');
INSERT INTO endava_quiz_categories(id, category_name) VALUES (nextval('endava_quiz_categories_id_seq'), 'J2EE');
INSERT INTO endava_quiz_categories(id, category_name) VALUES (nextval('endava_quiz_categories_id_seq'), 'JS');

INSERT INTO endava_question_types(id, question_type) VALUES (nextval('endava_question_types_id_seq'), 'Standard');
INSERT INTO endava_question_types(id, question_type) VALUES (nextval('endava_question_types_id_seq'), 'Multiple');
INSERT INTO endava_question_types(id, question_type) VALUES (nextval('endava_question_types_id_seq'), 'Text');
INSERT INTO endava_question_types(id, question_type) VALUES (nextval('endava_question_types_id_seq'), 'Line');

