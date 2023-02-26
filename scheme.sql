DROP DATABASE IF EXISTS projekt;
CREATE DATABASE projekt;
CREATE USER 'projekt'@'localhost' IDENTIFIED BY 'zaq1@WSX';
GRANT ALL PRIVILEGES ON projekt.* TO 'projekt'@'localhost';
FLUSH PRIVILEGES;

USE projekt;

CREATE TABLE podatnicy (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE urzednicy (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    privileges INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (username) REFERENCES podatnicy(username)
);

CREATE TABLE podatki (
    id INT NOT NULL AUTO_INCREMENT,
    nazwa VARCHAR(255) NOT NULL,
    opis VARCHAR(255) NOT NULL,
    wielkosc DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE podatki_podatnicy (
    id INT NOT NULL AUTO_INCREMENT,
    podatnik_id INT NOT NULL,
    podatek_id INT NOT NULL,
    kwota_netto DECIMAL(10,2) NOT NULL,
    kwota_brutto DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (podatnik_id) REFERENCES podatnicy(id),
    FOREIGN KEY (podatek_id) REFERENCES podatki(id)
);