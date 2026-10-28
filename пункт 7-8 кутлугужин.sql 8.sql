-- ============================================================
-- Пункт 8. Создать backup базы данных
-- Тема: Трекер питания с подсчётом калорий
-- СУБД: PostgreSQL (pgAdmin 4)
-- ============================================================
-- Backup выполнен средствами pgAdmin 4:
--   правый клик на базе PraktikaKutluguzhin -> Backup...
--   Format: Custom, Encoding: UTF8
--   Data Options: Pre-data, Data, Post-data = Yes
--   Файл: calorie_tracker_backup.backup
--
-- Восстановление: создать пустую базу, правый клик -> Restore...,
--   Format: Custom or tar, выбрать файл calorie_tracker_backup.backup
--
-- Консольный вариант (pg_dump / pg_restore):
--   pg_dump -U Denis1 -F c -d PraktikaKutluguzhin -f calorie_tracker_backup.backup
--   pg_restore -U Denis1 -d test_restore3 calorie_tracker_backup.backup
-- ============================================================

-- Проверка восстановления backup (выполнено в базе test_restore3).
-- Результат: users 101, products 121, food_entries 601, weight_logs 150
SELECT 'users' AS t, COUNT(*) FROM users
UNION ALL SELECT 'products', COUNT(*) FROM products
UNION ALL SELECT 'food_entries', COUNT(*) FROM food_entries
UNION ALL SELECT 'weight_logs', COUNT(*) FROM weight_logs;
