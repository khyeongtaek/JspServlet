DROP DATABASE IF EXISTS db_mybatis;
CREATE DATABASE IF NOT EXISTS db_mybatis;
USE db_mybatis;

DROP TABLE IF EXISTS tbl_board;
DROP TABLE IF EXISTS tbl_user;

CREATE TABLE IF NOT EXISTS tbl_user
(
    uid      INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email    VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    nickname VARCHAR(100) NOT NULL,
    UNIQUE KEY (nickname),
    UNIQUE KEY (email)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS tbl_board
(
    bid         INT           NOT NULL AUTO_INCREMENT PRIMARY KEY,
    uid         INT,
    title       VARCHAR(1000) NOT NULL,
    content     TEXT,
    created_at  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP,
    FOREIGN KEY (uid) REFERENCES tbl_user (uid)
) ENGINE = InnoDB;