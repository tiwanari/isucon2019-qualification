SELECT
t1.id as id
, t1.seller_id as seller_id
, t2.id as "seller.id"
, t2.accountName as "seller.account_name"
, t2.num_sell_items as "seller.num_sell_items"
, t1.status as status
, t1.name as name
, t1.price as price
, t1.category_id as category_id
, '/upload/' || t1.image_name as image_url
FROM `items` t1
JOIN `users` t2
ON t1.seller_id = t2.id
WHERE status IN (?,?)
ORDER BY t1.created_at DESC, t1.id DESC LIMIT ?

SELECT
t1.id as id
, t1.seller_id as seller_id
, t2.id as "seller.id"
, t2.account_name as "seller.account_name"
, t2.num_sell_items as "seller.num_sell_items"
, t1.status as status
, t1.name as name
, t1.price as price
, t1.category_id as category_id
, '/upload/' || t1.image_name as image_url
FROM items t1
JOIN users t2
ON t1.seller_id = t2.id
WHERE status IN ('on_sale','sold_out')
AND (t1.created_at < 10000000  OR (t1.created_at <= 10000000 AND t1.id < 50000)) 
ORDER BY t1.created_at DESC, t1.id DESC LIMIT 10

SELECT
t1.id as id
, t1.seller_id as seller_id
, t2.id as "seller.id"
, t2.account_name as "seller.account_name"
, t2.num_sell_items as "seller.num_sell_items"
, t1.status as status
, t1.name as name
, t1.price as price
, t1.category_id as category_id
, '/upload/' || t1.image_name as image_url
FROM items t1
JOIN users t2
ON t1.seller_id = t2.id
JOIN categories t3
ON t1.category_id = t3.id
WHERE status IN ('on_sale','sold_out')
AND t3.parent_id = ?
AND (t1.created_at < 10000000  OR (t1.created_at <= 10000000 AND t1.id < 50000)) 
ORDER BY t1.created_at DESC, t1.id DESC LIMIT 10
