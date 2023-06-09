CUSTOMER
4a-- insertar un nuevo custormer 
INSERT INTO customer (customer_id, store_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active)
VALUES (600, 2, 'juanito', 'rojas', 'sincorreo@estebanquito.com', '600', '1', to_date('20230608', 'YYYYMMDD'), now(), 1);

4b-- modificar un customer
UPDATE customer SET store_id = 2, first_name = 'marcelo', last_name = 'pereira',  email = 'hola@estebanquito.org',
    activebool = '1', create_date = to_date('20230608', 'YYYYMMDD'),last_update = now(), active = 0
WHERE customer_id = 1;

-- borrar un custormer
DELETE FROM customer
	WHERE <condition>;
	
STAFF
--INSERTAR STAFF
INSERT INTO staff(
	staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update, picture)
	VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--ACTUALIZAR STAFF
UPDATE staff
	SET staff_id=?, first_name=?, last_name=?, address_id=?, email=?, store_id=?, active=?, username=?, password=?, last_update=?, picture=?
	WHERE <condition>;

--BORRAR STAFF
DELETE FROM staff
	WHERE <condition>;

ACTOR

--insertar un actor
INSERT INTO public.actor(
	actor_id, first_name, last_name, last_update)
	VALUES (?, ?, ?, ?);

--modificar un actor
UPDATE public.actor
	SET actor_id=?, first_name=?, last_name=?, last_update=?
	WHERE <condition>;

--borrar un actor
DELETE FROM public.actor
	WHERE <condition>;

• Listar todas las “rental” con los datos del “customer” dado un año y mes.

SELECT r.rental_id, r.rental_date, c.first_name, c.last_name, c.email FROM rental r JOIN customer c ON r.customer_id = c.customer_id
WHERE EXTRACT(YEAR FROM r.rental_date) = 2005 AND EXTRACT(MONTH FROM r.rental_date) = 6;

• Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”.

SELECT payment_id, payment_date, amount
FROM payment;

• Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0.

SELECT * FROM film WHERE CAST(release_year as text) = '2006' AND rental_rate > 4.0;




5. Realiza un Diccionario de datos que contenga el nombre de las tablas y columnas, si
éstas pueden ser nulas, y su tipo de dato correspondiente


SELECT table_name, column_name, is_nullable, data_type
FROM information_schema.columns
WHERE table_schema = 'public';

o tambien 

SELECT
 t1.TABLE_NAME AS tabla_nombre,
 t1.COLUMN_NAME AS columna_nombre,
 t1.COLUMN_DEFAULT AS columna_defecto,
 t1.IS_NULLABLE AS columna_nulo,
 t1.DATA_TYPE AS columna_tipo_dato,
 COALESCE(t1.NUMERIC_PRECISION,
 t1.CHARACTER_MAXIMUM_LENGTH) AS columna_longitud,
 PG_CATALOG.COL_DESCRIPTION(t2.OID,
 t1.DTD_IDENTIFIER::int) AS columna_descripcion,
 t1.DOMAIN_NAME AS columna_dominio
FROM
 INFORMATION_SCHEMA.COLUMNS t1
 INNER JOIN PG_CLASS t2 ON (t2.RELNAME = t1.TABLE_NAME)
WHERE
 t1.TABLE_SCHEMA = 'public'
ORDER BY
 t1.TABLE_NAME;




  