Ejemplos de consultas SQL con la bbdd Agrifood_DB


# ¿Qué estaciones meteorológicas hay en una provincia específica (por ejemplo, "Barcelona")?
SELECT * FROM weatherStation WHERE province="BARCELONA";

# datos de una estación determinada
SELECT *  FROM weatherData where station_id = 300

# INNER JOIN de estaciones y datos
SELECT *  FROM weatherStation s, weatherData d WHERE s.id = d.station_id

# Igual que la consulta anterior pero seleccionando los atributos a seleccionar
SELECT s.name, s.province, d.date, d.precipitation FROM weatherStation s, weatherData d WHERE s.id = d.station_id


# Agrupación por provincia y proporcionar la acumulación de precipitación por provincia 
SELECT 
    s.province, 
    SUM(d.precipitation) AS total_precipitation
FROM 
    weatherStation s
JOIN 
    weatherData d ON s.id = d.station_id
GROUP BY 
    s.province;


# Máximo de precipitacion por estación
SELECT 
    s.name, 
    MAX(d.precipitation) AS max_precipitation
FROM 
    weatherStation s
JOIN 
    weatherData d ON s.id = d.station_id
GROUP BY 
    s.name;

# Media de los indicadores metereológicos
SELECT s.name,
  AVG(avgAirTemperature) AS avgAvgAirTemperature,
  AVG(precipitation) AS avgPrecipitation,
  AVG(minAirTemperature) AS avgMinAirTemperature,
  AVG(maxAirTemperature) AS avgMaxAirTemperature
  FROM weatherStation s, weatherData d
  GROUP BY s.name;


Ejemplo de LEFT JOIN: mostrar todos los usuarios con sus estaciones (si tienen)
SELECT 
    u.name AS user_name,
    u.email,
    s.name AS station_name,
    s.province
FROM 
    User u
LEFT JOIN 
    user_station us ON u.id = us.user_id
LEFT JOIN 
    weatherStation s ON us.station_id = s.id;


Ejemplo RIGHT JOIN: mostrar todas las estaciones con sus usuarios (si tienen)
SELECT 
    s.name AS station_name,
    s.province,
    u.name AS user_name,
    u.email
FROM 
    weatherStation s
RIGHT JOIN 
    user_station us ON s.id = us.station_id
RIGHT JOIN 
    User u ON us.user_id = u.id;

Ejemplo INNER JOIN
SELECT 
    u.name AS user_name,
    u.email,
    s.name AS station_name,
    s.province
FROM 
    User u
INNER JOIN 
    user_station us ON u.id = us.user_id
INNER JOIN 
    weatherStation s ON us.station_id = s.id;