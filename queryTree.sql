SELECT
  tree_table.id AS tree_id, 
  tree_table.friendly_name AS tree_friendly_name, 
  tree_table.scientific_name AS tree_scientific_name, 
  user_table.name AS owner_name,
  COUNT(likes_table.tree_id) AS number_of_likes
FROM
  tree_table
INNER JOIN 
  user_table ON tree_table.owner_id = user_table.id,
  likes_table ON likes_table.tree_id = tree_table.id
WHERE
  user_table.email = adam@versett.com
GROUP BY tree_table.id;

SELECT
  tree_table.id AS tree_id, 
  tree_table.friendly_name AS tree_friendly_name, 
  tree_table.scientific_name AS tree_scientific_name, 
  user_table.name AS owner_name,
  COUNT(likes_table.tree_id) AS number_of_likes
FROM 
  tree_table
INNER JOIN 
  user_table ON tree_table.owner_id = user_table.id
  likes_table ON likes_table.tree_id = tree_table.id
WHERE
  user_table.email <> adam@versett.com
GROUP BY tree_table.id;

SELECT 
  tree_table.id AS tree_id, 
  tree_table.friendly_name AS tree_friendly_name, 
  tree_table.scientific_name AS tree_scientific_name, 
  user_table.name AS owner_name,
  COUNT(likes_table.tree_id) AS number_of_likes
FROM 
  tree_table
INNER JOIN 
  user_table ON tree_table.owner_id = user_table.id
  likes_table ON likes_table.tree_id = tree_table.id
GROUP BY tree_table.id
HAVING COUNT(likes_table.tree_id) > 3;
