/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id INT NOT NULL,
    name varchar(100) NULL,
    date_of_birth date NULL,
    escape_attempts INT NULL,
	neutered boolean NULL,
	weight_kg decimal,
	PRIMARY KEY (id)
);

ALTER TABLE animals
ADD species varchar(100) NULL;