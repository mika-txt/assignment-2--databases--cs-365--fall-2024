DROP DATABASE IF EXISTS passwords;
CREATE DATABASE passwords DEFAULT CHARACTER SET utf8mb4;
USE passwords;

SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('y[HCka;7SM', 512));
SET @init_vector = RANDOM_BYTES(16);

CREATE TABLE IF NOT EXISTS website (
  site_name VARCHAR(128) NOT NULL,
  site_url VARCHAR(256) NOT NULL,
  PRIMARY KEY (site_url)
);

CREATE TABLE IF NOT EXISTS user_info (
  site_url VARCHAR(256) NOT NULL,
  first_name VARCHAR(128) NOT NULL,
  last_name VARCHAR(128) NOT NULL,
  username VARCHAR(128) NOT NULL,
  email VARCHAR(128) NOT NULL,
  PRIMARY KEY (site_url, username)
);

CREATE TABLE IF NOT EXISTS site_password (
  site_url VARCHAR(256) NOT NULL,
  my_password VARBINARY(512) NOT NULL,
  time_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (site_url, my_password)
);

CREATE TABLE IF NOT EXISTS comment (
  site_url VARCHAR(256) NOT NULL,
  comment VARCHAR(256) NOT NULL,
  PRIMARY KEY (site_url, comment)
);

INSERT INTO website VALUES ("MYSQL", "mysql.com");
INSERT INTO user_info VALUES ("mysql.com", "Mika", "D'Aloisio", "mika-txt", "mika@example.com");
INSERT INTO site_password (site_url, my_password) VALUES ("mysql.com", AES_ENCRYPT("b[!:s6W%=M", @key_str, @init_vector));
INSERT INTO comment VALUES ("mysql.com", "");

INSERT INTO website VALUES ("University of Hartford", "hartford.edu");
INSERT INTO user_info VALUES ("hartford.edu", "Mika", "D'Aloisio", "mika-txt", "mika@example.com");
INSERT INTO site_password (site_url, my_password) VALUES ("hartford.edu", AES_ENCRYPT("WpaC6_{/4d", @key_str, @init_vector));
INSERT INTO comment VALUES ("hartford.edu", "");

INSERT INTO website VALUES ("GitHub", "github.com");
INSERT INTO user_info VALUES ("github.com", "Mika", "D'Aloisio", "mika-txt", "mika@example.com");
INSERT INTO site_password (site_url, my_password) VALUES ("github.com", AES_ENCRYPT("E.5,?/mVN]", @key_str, @init_vector));
INSERT INTO comment VALUES ("github.com", "");

INSERT INTO website VALUES ("Microsoft Office", "office.com");
INSERT INTO user_info VALUES ("office.com", "Mika", "D'Aloisio", "mika-txt", "mika@example.com");
INSERT INTO site_password (site_url, my_password) VALUES ("office.com", AES_ENCRYPT("pZ4v@/A!-^", @key_str, @init_vector));
INSERT INTO comment VALUES ("office.com", "");

INSERT INTO website VALUES ("Google", "google.com");
INSERT INTO user_info VALUES ("google.com", "Mika", "D'Aloisio", "mika-txt", "mika@example.com");
INSERT INTO site_password (site_url, my_password) VALUES ("google.com", AES_ENCRYPT("pZ4v@/A!-^", @key_str, @init_vector));
INSERT INTO comment VALUES ("google.com", "");

INSERT INTO website VALUES ("X", "x.com");
INSERT INTO user_info VALUES ("x.com", "Mika", "D'Aloisio", "mika-txt", "mika@example.com");
INSERT INTO site_password (site_url, my_password) VALUES ("x.com", AES_ENCRYPT("ejgUZz+-7R", @key_str, @init_vector));
INSERT INTO comment VALUES ("x.com", "");

INSERT INTO website VALUES ("Linkedin", "linkedin.com");
INSERT INTO user_info VALUES ("linkedin.com", "Mika", "D'Aloisio", "mika-txt", "mika@example.com");
INSERT INTO site_password (site_url, my_password) VALUES ("linkedin.com", AES_ENCRYPT("Ey3w8gW_dp", @key_str, @init_vector));
INSERT INTO comment VALUES ("linkedin.com", "");

INSERT INTO website VALUES ("Discord", "discord.com");
INSERT INTO user_info VALUES ("discord.com", "Mika", "D'Aloisio", "mika-txt", "mika@example.com");
INSERT INTO site_password (site_url, my_password) VALUES ("discord.com", AES_ENCRYPT("F}P7ubAp/+", @key_str, @init_vector));
INSERT INTO comment VALUES ("discord.com", "");

INSERT INTO website VALUES ("Apple", "apple.com");
INSERT INTO user_info VALUES ("apple.com", "Mika", "D'Aloisio", "mika-txt", "mika@example.com");
INSERT INTO site_password (site_url, my_password) VALUES ("apple.com", AES_ENCRYPT("j/J(7Np;+)", @key_str, @init_vector));
INSERT INTO comment VALUES ("apple.com", "");

INSERT INTO website VALUES ("PayPal", "paypal.com");
INSERT INTO user_info VALUES ("paypal.com", "Mika", "D'Aloisio", "mika-txt", "mika@example.com");
INSERT INTO site_password (site_url, my_password) VALUES ("paypal.com", AES_ENCRYPT("f6(SU;gJ*h", @key_str, @init_vector));
INSERT INTO comment VALUES ("paypal.com", "");
