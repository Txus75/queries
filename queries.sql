-- Ejercicio 1:

SELECT COUNT(*) FROM flights;

-- Ejercicio 2:

SELECT Origin, AVG(ArrDelay) AS "prom_llegadas", AVG (DepDelay) AS "prom_salidas"
FROM flights GROUP BY origin ORDER BY origin;

-- Ejercicio 3:

SELECT Origin, colYear, colMonth, AVG(ArrDelay) AS "prom_llegadas"
FROM flights GROUP BY Origin, colYear, colMonth ORDER BY Origin, colYear, colMonth;

-- Ejercicio 4:

SELECT city, colYear, colMonth, AVG(ArrDelay) AS "prom_llegadas"
FROM flights
INNER JOIN usairports ON flights.Origin = usairports.IATA
GROUP BY city, colYear, colMonth ORDER BY city, colYear, colMonth;

-- Ejercicio 5:

SELECT UniqueCarrier, colYear, colMonth, AVG(ArrDelay) AS "Promedio", SUM(Cancelled) AS "Cancelaciones"
FROM Flights
INNER JOIN USAirports
ON Origin = IATA
GROUP BY UniqueCarrier, colYear, colMonth
HAVING SUM(Cancelled) > 0
ORDER BY SUM(Cancelled) DESC;

-- Ejercicio 6:

SELECT TailNum, SUM(Distance) 
FROM flights 
WHERE TailNum NOT IN ("NA", "#?NOMBRE?")
GROUP BY TailNUm ORDER BY SUM(Distance) DESC
LIMIT 10

-- Ejercicio 7:

SELECT UniqueCarrier, AVG(ArrDelay) AS "avgDelay"
FROM flights 
GROUP BY UniqueCarrier 
HAVING AVG(ArrDelay) > 10
ORDER BY AVG(ArrDelay) DESC