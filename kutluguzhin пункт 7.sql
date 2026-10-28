-- 1. Вход в систему
SELECT user_id, login, role_id FROM users
WHERE login = 'user1' AND password_hash = md5('pass1');

-- 2. Регистрация нового пользователя (повторно не дублируется)
INSERT INTO users (login, password_hash, full_name, email, birth_date,
                   height_cm, goal_id, daily_calorie_goal, role_id, gender)
SELECT 'newuser', md5('123456'), 'Иван Иванов', 'ivan@example.com',
       DATE '2000-05-10', 175, (SELECT MIN(goal_id) FROM goals), 2200,
       (SELECT MAX(role_id) FROM roles), 'M'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE login = 'newuser');

-- 3. Роль пользователя (разделение функционала по ролям)
SELECT u.login, r.role_name
FROM users u JOIN roles r ON r.role_id = u.role_id
WHERE u.login = 'user1';

-- 4. Справочники для выпадающих списков
SELECT category_id, category_name FROM product_categories;
SELECT status_id, status_name FROM product_statuses;
SELECT meal_type_id, meal_type_name FROM meal_types;
SELECT goal_id, goal_name FROM goals;

-- 5. Создание продукта
INSERT INTO products (category_id, status_id, created_by_user_id, product_name,
                      calories_100g, proteins_100g, fats_100g, carbs_100g)
SELECT (SELECT MIN(category_id) FROM product_categories),
       (SELECT MIN(status_id) FROM product_statuses),
       3, 'Яблоко тест', 52, 0.3, 0.2, 14
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_name = 'Яблоко тест');

-- 6. Просмотр продуктов с категорией и статусом
SELECT p.product_id, p.product_name, c.category_name, s.status_name, p.calories_100g
FROM products p
JOIN product_categories c ON c.category_id = p.category_id
JOIN product_statuses s ON s.status_id = p.status_id
ORDER BY p.product_name;

-- 7. Изменение продукта (id не меняется)
UPDATE products SET calories_100g = 50 WHERE product_name = 'Яблоко тест';

-- 8. Удаление продукта
DELETE FROM products WHERE product_name = 'Яблоко тест';

-- 9. Поиск, фильтрация и сортировка по нескольким полям
SELECT p.product_name, c.category_name, p.calories_100g, p.proteins_100g
FROM products p
JOIN product_categories c ON c.category_id = p.category_id
WHERE (p.product_name ILIKE '%а%' OR c.category_name ILIKE '%а%')
  AND p.calories_100g BETWEEN 100 AND 400
ORDER BY p.calories_100g DESC, p.product_name ASC;

-- 10. Дневник питания пользователя (у кого больше всего записей) за 30 дней
SELECT fe.entry_date, mt.meal_type_name, p.product_name, fe.weight_grams,
       ROUND(p.calories_100g * fe.weight_grams / 100) AS kcal
FROM food_entries fe
JOIN products p ON p.product_id = fe.product_id
JOIN meal_types mt ON mt.meal_type_id = fe.meal_type_id
WHERE fe.user_id = (SELECT user_id FROM food_entries
                    GROUP BY user_id ORDER BY COUNT(*) DESC, user_id LIMIT 1)
  AND fe.entry_date >= CURRENT_DATE - 30
ORDER BY fe.entry_date DESC, mt.meal_type_id;

-- 11. Подсчёт калорий по дням и сравнение с нормой
SELECT u.full_name, fe.entry_date, u.daily_calorie_goal,
       ROUND(SUM(p.calories_100g * fe.weight_grams / 100)) AS eaten,
       u.daily_calorie_goal - ROUND(SUM(p.calories_100g * fe.weight_grams / 100)) AS left_kcal
FROM users u
JOIN food_entries fe ON fe.user_id = u.user_id
JOIN products p ON p.product_id = fe.product_id
WHERE u.user_id = (SELECT user_id FROM food_entries
                   GROUP BY user_id ORDER BY COUNT(*) DESC, user_id LIMIT 1)
GROUP BY u.full_name, fe.entry_date, u.daily_calorie_goal
ORDER BY fe.entry_date DESC;

-- 12. Динамика веса пользователя
SELECT log_date, weight_kg FROM weight_logs
WHERE user_id = 3 ORDER BY log_date;

-- 13a. Связанный процесс: пользователь предлагает продукт (статус "на проверке")
INSERT INTO products (category_id, status_id, created_by_user_id, product_name,
                      calories_100g, proteins_100g, fats_100g, carbs_100g)
SELECT (SELECT MIN(category_id) FROM product_categories),
       COALESCE((SELECT status_id FROM product_statuses WHERE status_name ILIKE '%провер%' LIMIT 1),
                (SELECT MIN(status_id) FROM product_statuses)),
3, 'Процесс тест', 105, 5, 5, 10
WHERE NOT EXISTS (SELECT 1 FROM products WHERE product_name = 'Процесс тест');

-- 13b. Менеджер смотрит продукты на проверке
SELECT p.product_id, p.product_name, u.login, s.status_name
FROM products p
JOIN users u ON u.user_id = p.created_by_user_id
JOIN product_statuses s ON s.status_id = p.status_id
WHERE p.product_name = 'Процесс тест';

-- 13c. Менеджер одобряет продукт
UPDATE products
SET status_id = COALESCE((SELECT status_id FROM product_statuses WHERE status_name ILIKE '%одобр%' LIMIT 1),
                         (SELECT MAX(status_id) FROM product_statuses))
WHERE product_name = 'Процесс тест';

-- 13d. Администратор правит данные (по необходимости)
UPDATE products SET calories_100g = 110 WHERE product_name = 'Процесс тест';

-- 13e. Пользователь добавляет одобренный продукт в дневник
INSERT INTO food_entries (user_id, product_id, meal_type_id, entry_date, weight_grams)
SELECT 3,
       (SELECT product_id FROM products WHERE product_name = 'Процесс тест'),
       (SELECT MIN(meal_type_id) FROM meal_types),
       CURRENT_DATE, 150
WHERE NOT EXISTS (SELECT 1 FROM food_entries
                  WHERE user_id = 3 AND entry_date = CURRENT_DATE
                    AND product_id = (SELECT product_id FROM products WHERE product_name = 'Процесс тест'));

-- 14. Отчёт для Excel/PDF: калории по пользователям и дням
SELECT u.full_name, fe.entry_date,
       ROUND(SUM(p.calories_100g * fe.weight_grams / 100)) AS kcal
FROM food_entries fe
JOIN users u ON u.user_id = fe.user_id
JOIN products p ON p.product_id = fe.product_id
WHERE fe.entry_date >= CURRENT_DATE - 30
GROUP BY u.full_name, fe.entry_date
ORDER BY u.full_name, fe.entry_date;

-- 15. Статистика для администратора
SELECT r.role_name, g.goal_name, COUNT(*) AS users_count
FROM users u
JOIN roles r ON r.role_id = u.role_id
JOIN goals g ON g.goal_id = u.goal_id
GROUP BY r.role_name, g.goal_name
ORDER BY r.role_name;
UPDATE users SET role_id = (SELECT MIN(role_id) FROM roles) WHERE user_id = 3;
UPDATE users SET role_id = (SELECT MIN(role_id) + 1 FROM roles) WHERE user_id = 4;
UPDATE users SET goal_id = (SELECT MAX(goal_id) FROM goals) WHERE user_id % 3 = 0;
UPDATE users SET goal_id = (SELECT MIN(goal_id) + 1 FROM goals) WHERE user_id % 3 = 1;






