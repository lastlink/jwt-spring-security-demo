-- initialize tables
DROP TABLE IF EXISTS `user_authority`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `authority`;


CREATE TABLE user
(
id integer NOT NULL,
username VARCHAR(50) NOT NULL,
password VARCHAR(100) NOT NULL,
firstname VARCHAR(50) NOT NULL,
lastname VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
enabled boolean,
lastpasswordresetdate timestamp NOT NULL,
CONSTRAINT user_pkey PRIMARY KEY (id)
);

DROP TABLE IF EXISTS `authority`;

CREATE TABLE authority
(
id integer NOT NULL,
name VARCHAR(50) NOT NULL,
CONSTRAINT authority_pkey PRIMARY KEY (id)
);

CREATE TABLE user_authority
(
user_id integer NOT NULL,
authority_id integer NOT NULL,
CONSTRAINT fk_authority_id_user_authority FOREIGN KEY (authority_id)
REFERENCES authority (id) MATCH SIMPLE
ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT fk_USER_user_authority FOREIGN KEY (user_id)
REFERENCES user (id) MATCH SIMPLE
ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- insert data
INSERT INTO user (ID, USERNAME, PASSWORD, FIRSTNAME, LASTNAME, EMAIL, ENABLED, LASTPASSWORDRESETDATE) VALUES (1, 'admin', '$2a$08$lDnHPz7eUkSi6ao14Twuau08mzhWrL4kyZGGU5xfiGALO/Vxd5DOi', 'admin', 'admin', 'admin@admin.com', 1, STR_TO_DATE('01/01/2016', '%c/%e/%Y %r'));
INSERT INTO user (ID, USERNAME, PASSWORD, FIRSTNAME, LASTNAME, EMAIL, ENABLED, LASTPASSWORDRESETDATE) VALUES (2, 'user', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'user', 'user', 'enabled@user.com', 1, STR_TO_DATE('01/01/2016','%c/%e/%Y %r'));
INSERT INTO user (ID, USERNAME, PASSWORD, FIRSTNAME, LASTNAME, EMAIL, ENABLED, LASTPASSWORDRESETDATE) VALUES (3, 'disabled', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'user', 'user', 'disabled@user.com', 0, STR_TO_DATE('01/01/2016','%c/%e/%Y %r'));

INSERT INTO authority (ID, NAME) VALUES (1, 'ROLE_USER');
INSERT INTO authority (ID, NAME) VALUES (2, 'ROLE_ADMIN');

INSERT INTO user_authority (USER_ID, AUTHORITY_ID) VALUES (1, 1);
INSERT INTO user_authority (USER_ID, AUTHORITY_ID) VALUES (1, 2);
INSERT INTO user_authority (USER_ID, AUTHORITY_ID) VALUES (2, 1);
INSERT INTO user_authority (USER_ID, AUTHORITY_ID) VALUES (3, 1);
