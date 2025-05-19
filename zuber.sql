
/* INTRODUCCIÓN:

- Estás trabajando como analista para Zuber, una nueva empresa de viajes compartidos que se está lanzando en Chicago.
Tu tarea es encontrar patrones en la información disponible.
Quieres comprender las preferencias de los pasajeros y el impacto de los factores externos en los viajes.
Estudiarás una base de datos, analizarás los datos de los competidores y probarás una hipótesis sobre 
el impacto del clima en la frecuencia de los viajes.
*/


/* 1.

Imprime el campo company_name. Encuentra la cantidad de viajes en taxi para cada compañía de taxis 
para el 15 y 16 de noviembre de 2017, asigna al campo resultante el nombre trips_amount e imprímelo también.
Ordena los resultados por el campo trips_amount en orden descendente.
*/

SELECT 
    cabs.company_name, 
    COUNT(trips.trip_id) AS trips_amount
FROM trips
JOIN cabs ON trips.cab_id = cabs.cab_id
WHERE trips.start_ts BETWEEN '2017-11-15 00:00:00' AND '2017-11-16 23:59:59'
GROUP BY cabs.company_name
ORDER BY trips_amount DESC;

/* 2.

Encuentra la cantidad de viajes para cada empresa de taxis cuyo nombre contenga las palabras "Yellow" o "Blue"
del 1 al 7 de noviembre de 2017. Nombra la variable resultante trips_amount. Agrupa los resultados por el campo company_name.
*/

SELECT 
    cabs.company_name, 
    COUNT(trips.trip_id) AS trips_amount
FROM trips
JOIN cabs ON trips.cab_id = cabs.cab_id
WHERE trips.start_ts BETWEEN '2017-11-01 00:00:00' AND '2017-11-07 23:59:59'
AND (cabs.company_name LIKE '%Yellow%' OR cabs.company_name LIKE '%Blue%')
GROUP BY cabs.company_name
ORDER BY trips_amount DESC;

/* 3.

Del 1 al 7 de noviembre de 2017, las empresas de taxis más populares fueron Flash Cab y Taxi Affiliation Services. 
Encuentra el número de viajes de estas dos empresas y asigna a la variable resultante el nombre trips_amount. 
Junta los viajes de todas las demás empresas en el grupo "Other". Agrupa los datos por nombres de empresas de taxis.
Asigna el nombre company al campo con nombres de empresas de taxis. Ordena el resultado en orden descendente por trips_amount.
*/

SELECT 
    CASE 
        WHEN cabs.company_name IN ('Flash Cab', 'Taxi Affiliation Services') THEN cabs.company_name 
        ELSE 'Other' 
    END AS company,
    COUNT(trips.trip_id) AS trips_amount
FROM trips
JOIN cabs ON trips.cab_id = cabs.cab_id
WHERE trips.start_ts BETWEEN '2017-11-01 00:00:00' AND '2017-11-07 23:59:59'
GROUP BY company
ORDER BY trips_amount DESC;

/* 4.

Recupera los identificadores de los barrios de O'Hare y Loop de la tabla neighborhoods.
*/

SELECT neighborhood_id, name
FROM neighborhoods
WHERE name IN ('O''Hare', 'Loop');

/* 5.

Para cada hora recupera los registros de condiciones meteorológicas de la tabla weather_records. 
Usando el operador CASE, divide todas las horas en dos grupos: Bad si el campo description contiene 
las palabras rain o storm, y Good para los demás. Nombra el campo resultante weather_conditions.
La tabla final debe incluir dos campos: fecha y hora (ts) y weather_conditions.
*/

SELECT 
    ts,
    CASE 
        WHEN description LIKE '%rain%' OR description LIKE '%storm%' THEN 'Bad'
        ELSE 'Good'
    END AS weather_conditions
FROM weather_records;

/* 6.

Recupera de la tabla de trips todos los viajes que comenzaron en el Loop (pickup_location_id: 50) 
el sábado y terminaron en O'Hare (dropoff_location_id: 63). Obtén las condiciones climáticas para 
cada viaje. Utiliza el método que aplicaste en la tarea anterior. 
Recupera también la duración de cada viaje. Ignora los viajes para los que no hay datos disponibles 
sobre las condiciones climáticas.

Las columnas de la tabla deben estar en el siguiente orden:

- start_ts
- weather_conditions
- duration_seconds

Ordena por trip_id.
*/

SELECT 
    t.start_ts,
    CASE 
        WHEN w.description LIKE '%rain%' OR w.description LIKE '%storm%' THEN 'Bad'
        ELSE 'Good'
    END AS weather_conditions,
    t.duration_seconds
FROM trips t
JOIN weather_records w 
    ON t.start_ts = w.ts
WHERE 
    t.pickup_location_id = 50 
    AND t.dropoff_location_id = 63
    AND EXTRACT(DOW FROM t.start_ts) = 6 -- 6 representa el sábado en PostgreSQL
ORDER BY t.trip_id;



