--Getting total number of bookings for each user
SELECT  u.user_id, u.first_name, COUNT(b.booking_id) AS bookings
FROM "User" AS u
INNER JOIN booking AS b
ON u.user_id = b.user_id
GROUP BY u.user_id;

--Ranking properties based on bookings using RANK()
SELECT p.property_id, 
		p.name, 
		COUNT(b.booking_id) AS bookings, 
		RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM property AS p
LEFT JOIN booking AS b
ON p.property_id = b.property_id
GROUP BY p.property_id, p.name;

--Ranking properties based on bookings using ROW_NUMBER()
SELECT p.property_id, 
		p.name, 
		COUNT(b.booking_id) AS bookings, 
		ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM property AS p
LEFT JOIN booking AS b
ON p.property_id = b.property_id
GROUP BY p.property_id, p.name;


"GroupAggregate  (cost=15.92..16.06 rows=8 width=56) (actual time=0.727..0.731 rows=4 loops=1)"
"  Group Key: u.user_id"
"  ->  Sort  (cost=15.92..15.94 rows=8 width=64) (actual time=0.723..0.724 rows=8 loops=1)"
"        Sort Key: u.user_id"
"        Sort Method: quicksort  Memory: 25kB"
"        ->  Hash Join  (cost=1.18..15.80 rows=8 width=64) (actual time=0.058..0.062 rows=8 loops=1)"
"              Hash Cond: (u.user_id = b.user_id)"
"              ->  Seq Scan on ""User"" u  (cost=0.00..13.30 rows=330 width=48) (actual time=0.014..0.015 rows=8 loops=1)"
"              ->  Hash  (cost=1.08..1.08 rows=8 width=32) (actual time=0.038..0.038 rows=8 loops=1)"
"                    Buckets: 1024  Batches: 1  Memory Usage: 9kB"
"                    ->  Seq Scan on booking b  (cost=0.00..1.08 rows=8 width=32) (actual time=0.010..0.012 rows=8 loops=1)"
"Planning Time: 5.347 ms"
"Execution Time: 2.171 ms"