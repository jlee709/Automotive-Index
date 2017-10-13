-- entry point data base is justinlee709

\c justinlee709 

-- creates database if not exist
DROP DATABASE IF EXISTS indexed_cars;
DROP USER IF EXISTS indexed_cars_user;

CREATE USER indexed_cars_user;
CREATE DATABASE indexed_cars;

--connecting to index_car DB
\c indexed_cars

--run scr 10 times 
\i scripts/car_models.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;

--timing with this original data is 389.4 ms. First Run

--NOT SETTING INDEX 

-- \timing
-- SELECT DISTINCT(make_title) FROM car_models WHERE make_code LIKE 'LAM%';
-- \timing
-- --Time: 43.155 ms


-- \timing
-- -- SELECT model_title FROM car_models WHERE make_code LIKE 'NISSAN%' AND model_code LIKE 'GT-R%';
-- --Time: 41.697 ms
-- \timing


-- \timing 

-- SELECT DISTINCT(make_code), model_code, model_title, year  --40ms
-- FROM car_models WHERE make_code = 'LAM';

-- \timing



-- \timing
-- SELECT * FROM car_models WHERE year BETWEEN 2010 AND 2015; --Time: 77.380 ms
-- \timing



-- \timing
-- SELECT * FROM car_models WHERE year = 2010; --Time: 42.191 ms
-- \timing





-- USING INDEXES



CREATE make_title INDEX ON (car_models);

\timing
SELECT DISTINCT(make_title) FROM car_models WHERE make_code LIKE 'LAM%';
\timing














