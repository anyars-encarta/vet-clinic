/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name like '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' or name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <=17.3;


BEGIN;

UPDATE animals
SET species = 'unspecified';

ROLLBACK;

SELECT * FROM animals;



BEGIN;

UPDATE animals SET species = 'digimon' WHERE name like '%mon';

UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

COMMIT;

SELECT * FROM animals;


BEGIN;

DELETE FROM animals;

ROLLBACK;

SELECT * FROM animals;


BEGIN;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT Point1;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TO Point1;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;

SELECT * FROM animals;


SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

SELECT species, date_of_birth, AVG(escape_attempts) AS average_escape_attempts
FROM animals GROUP BY date_of_birth, species
HAVING date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';