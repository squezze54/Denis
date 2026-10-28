SELECT 'users' AS t, COUNT(*) FROM users
UNION ALL SELECT 'products', COUNT(*) FROM products
UNION ALL SELECT 'food_entries', COUNT(*) FROM food_entries
UNION ALL SELECT 'weight_logs', COUNT(*) FROM weight_logs;