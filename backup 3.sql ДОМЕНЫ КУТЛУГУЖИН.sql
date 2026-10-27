--
-- PostgreSQL database cluster dump
--

-- Started on 2026-10-27 16:31:36

\restrict 0KcuXxUEuGr5GiA0dFAlYtAjfO5N074ktjpYRPg8RZlVih3VjI7qhBFeZubZr8M

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE "Denis1";
ALTER ROLE "Denis1" WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:TzDmtU/ND7rgGk6Ig9/Tow==$l85sRCLOrXvTUv4yDdsBV3FdtfYbq5MJYBcZU5e4nrA=:7sOeGFvpORa+KCbjk0W/nbr8CiwHkRBJqpWggjEom2Y=';

--
-- User Configurations
--








\unrestrict 0KcuXxUEuGr5GiA0dFAlYtAjfO5N074ktjpYRPg8RZlVih3VjI7qhBFeZubZr8M

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict FcbMwpKyGmC0HCqZ7lPWz56cETlYtI8rPchLgTJDxjcf88xCJEhTlybHkBFTEJM

-- Dumped from database version 18.6 (Debian 18.6-1.pgdg13+2)
-- Dumped by pg_dump version 18.4

-- Started on 2026-10-27 16:31:36

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2026-10-27 16:31:36

--
-- PostgreSQL database dump complete
--

\unrestrict FcbMwpKyGmC0HCqZ7lPWz56cETlYtI8rPchLgTJDxjcf88xCJEhTlybHkBFTEJM

--
-- Database "PraktikaKutluguzhin" dump
--

--
-- PostgreSQL database dump
--

\restrict IjPgbn1w5sd6mwK0EtCnKxPi8t9RkkBknUMaQF9YglQCNm28mmAo4phHPLeMHJ4

-- Dumped from database version 18.6 (Debian 18.6-1.pgdg13+2)
-- Dumped by pg_dump version 18.4

-- Started on 2026-10-27 16:31:36

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3614 (class 1262 OID 16384)
-- Name: PraktikaKutluguzhin; Type: DATABASE; Schema: -; Owner: Denis1
--

CREATE DATABASE "PraktikaKutluguzhin" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "PraktikaKutluguzhin" OWNER TO "Denis1";

\unrestrict IjPgbn1w5sd6mwK0EtCnKxPi8t9RkkBknUMaQF9YglQCNm28mmAo4phHPLeMHJ4
\connect "PraktikaKutluguzhin"
\restrict IjPgbn1w5sd6mwK0EtCnKxPi8t9RkkBknUMaQF9YglQCNm28mmAo4phHPLeMHJ4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 908 (class 1247 OID 16576)
-- Name: dm_calories; Type: DOMAIN; Schema: public; Owner: Denis1
--

CREATE DOMAIN public.dm_calories AS numeric(8,2)
	CONSTRAINT dm_calories_check CHECK ((VALUE >= (0)::numeric));


ALTER DOMAIN public.dm_calories OWNER TO "Denis1";

--
-- TOC entry 932 (class 1247 OID 16594)
-- Name: dm_carbohydrates; Type: DOMAIN; Schema: public; Owner: Denis1
--

CREATE DOMAIN public.dm_carbohydrates AS numeric(7,2)
	CONSTRAINT dm_carbohydrates_check CHECK ((VALUE >= (0)::numeric));


ALTER DOMAIN public.dm_carbohydrates OWNER TO "Denis1";

--
-- TOC entry 940 (class 1247 OID 16600)
-- Name: dm_date; Type: DOMAIN; Schema: public; Owner: Denis1
--

CREATE DOMAIN public.dm_date AS date
	CONSTRAINT dm_date_check CHECK ((VALUE >= '1900-01-01'::date));


ALTER DOMAIN public.dm_date OWNER TO "Denis1";

--
-- TOC entry 896 (class 1247 OID 16567)
-- Name: dm_email; Type: DOMAIN; Schema: public; Owner: Denis1
--

CREATE DOMAIN public.dm_email AS character varying(255)
	CONSTRAINT dm_email_check CHECK (((VALUE)::text ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'::text));


ALTER DOMAIN public.dm_email OWNER TO "Denis1";

--
-- TOC entry 928 (class 1247 OID 16591)
-- Name: dm_fat; Type: DOMAIN; Schema: public; Owner: Denis1
--

CREATE DOMAIN public.dm_fat AS numeric(7,2)
	CONSTRAINT dm_fat_check CHECK ((VALUE >= (0)::numeric));


ALTER DOMAIN public.dm_fat OWNER TO "Denis1";

--
-- TOC entry 916 (class 1247 OID 16582)
-- Name: dm_height; Type: DOMAIN; Schema: public; Owner: Denis1
--

CREATE DOMAIN public.dm_height AS numeric(5,2)
	CONSTRAINT dm_height_check CHECK (((VALUE >= (30)::numeric) AND (VALUE <= (300)::numeric)));


ALTER DOMAIN public.dm_height OWNER TO "Denis1";

--
-- TOC entry 944 (class 1247 OID 16603)
-- Name: dm_meal_time; Type: DOMAIN; Schema: public; Owner: Denis1
--

CREATE DOMAIN public.dm_meal_time AS time without time zone;


ALTER DOMAIN public.dm_meal_time OWNER TO "Denis1";

--
-- TOC entry 904 (class 1247 OID 16573)
-- Name: dm_password_hash; Type: DOMAIN; Schema: public; Owner: Denis1
--

CREATE DOMAIN public.dm_password_hash AS character varying(255)
	CONSTRAINT dm_password_hash_check CHECK ((TRIM(BOTH FROM VALUE) <> ''::text));


ALTER DOMAIN public.dm_password_hash OWNER TO "Denis1";

--
-- TOC entry 936 (class 1247 OID 16597)
-- Name: dm_positive_id; Type: DOMAIN; Schema: public; Owner: Denis1
--

CREATE DOMAIN public.dm_positive_id AS integer
	CONSTRAINT dm_positive_id_check CHECK ((VALUE > 0));


ALTER DOMAIN public.dm_positive_id OWNER TO "Denis1";

--
-- TOC entry 924 (class 1247 OID 16588)
-- Name: dm_protein; Type: DOMAIN; Schema: public; Owner: Denis1
--

CREATE DOMAIN public.dm_protein AS numeric(7,2)
	CONSTRAINT dm_protein_check CHECK ((VALUE >= (0)::numeric));


ALTER DOMAIN public.dm_protein OWNER TO "Denis1";

--
-- TOC entry 920 (class 1247 OID 16585)
-- Name: dm_quantity; Type: DOMAIN; Schema: public; Owner: Denis1
--

CREATE DOMAIN public.dm_quantity AS numeric(8,2)
	CONSTRAINT dm_quantity_check CHECK ((VALUE > (0)::numeric));


ALTER DOMAIN public.dm_quantity OWNER TO "Denis1";

--
-- TOC entry 900 (class 1247 OID 16570)
-- Name: dm_username; Type: DOMAIN; Schema: public; Owner: Denis1
--

CREATE DOMAIN public.dm_username AS character varying(50)
	CONSTRAINT dm_username_check CHECK (((char_length(TRIM(BOTH FROM VALUE)) >= 3) AND (char_length(TRIM(BOTH FROM VALUE)) <= 50)));


ALTER DOMAIN public.dm_username OWNER TO "Denis1";

--
-- TOC entry 912 (class 1247 OID 16579)
-- Name: dm_weight; Type: DOMAIN; Schema: public; Owner: Denis1
--

CREATE DOMAIN public.dm_weight AS numeric(5,2)
	CONSTRAINT dm_weight_check CHECK (((VALUE >= (1)::numeric) AND (VALUE <= (500)::numeric)));


ALTER DOMAIN public.dm_weight OWNER TO "Denis1";

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 234 (class 1259 OID 16515)
-- Name: food_entries; Type: TABLE; Schema: public; Owner: Denis1
--

CREATE TABLE public.food_entries (
    entry_id integer NOT NULL,
    user_id integer NOT NULL,
    product_id integer NOT NULL,
    meal_type_id integer NOT NULL,
    entry_date date DEFAULT CURRENT_DATE NOT NULL,
    weight_grams numeric(6,1) NOT NULL,
    note character varying(200),
    CONSTRAINT ck_entries_weight CHECK (((weight_grams >= (1)::numeric) AND (weight_grams <= (5000)::numeric)))
);


ALTER TABLE public.food_entries OWNER TO "Denis1";

--
-- TOC entry 233 (class 1259 OID 16514)
-- Name: food_entries_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: Denis1
--

ALTER TABLE public.food_entries ALTER COLUMN entry_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.food_entries_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16400)
-- Name: goals; Type: TABLE; Schema: public; Owner: Denis1
--

CREATE TABLE public.goals (
    goal_id integer NOT NULL,
    goal_name character varying(40) NOT NULL
);


ALTER TABLE public.goals OWNER TO "Denis1";

--
-- TOC entry 221 (class 1259 OID 16399)
-- Name: goals_goal_id_seq; Type: SEQUENCE; Schema: public; Owner: Denis1
--

ALTER TABLE public.goals ALTER COLUMN goal_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.goals_goal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 16420)
-- Name: meal_types; Type: TABLE; Schema: public; Owner: Denis1
--

CREATE TABLE public.meal_types (
    meal_type_id integer NOT NULL,
    meal_type_name character varying(30) NOT NULL
);


ALTER TABLE public.meal_types OWNER TO "Denis1";

--
-- TOC entry 225 (class 1259 OID 16419)
-- Name: meal_types_meal_type_id_seq; Type: SEQUENCE; Schema: public; Owner: Denis1
--

ALTER TABLE public.meal_types ALTER COLUMN meal_type_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.meal_types_meal_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16410)
-- Name: product_categories; Type: TABLE; Schema: public; Owner: Denis1
--

CREATE TABLE public.product_categories (
    category_id integer NOT NULL,
    category_name character varying(50) NOT NULL
);


ALTER TABLE public.product_categories OWNER TO "Denis1";

--
-- TOC entry 223 (class 1259 OID 16409)
-- Name: product_categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: Denis1
--

ALTER TABLE public.product_categories ALTER COLUMN category_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_categories_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 16430)
-- Name: product_statuses; Type: TABLE; Schema: public; Owner: Denis1
--

CREATE TABLE public.product_statuses (
    status_id integer NOT NULL,
    status_name character varying(30) NOT NULL
);


ALTER TABLE public.product_statuses OWNER TO "Denis1";

--
-- TOC entry 227 (class 1259 OID 16429)
-- Name: product_statuses_status_id_seq; Type: SEQUENCE; Schema: public; Owner: Denis1
--

ALTER TABLE public.product_statuses ALTER COLUMN status_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_statuses_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 16477)
-- Name: products; Type: TABLE; Schema: public; Owner: Denis1
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    category_id integer NOT NULL,
    status_id integer DEFAULT 1 NOT NULL,
    created_by_user_id integer NOT NULL,
    product_name character varying(100) NOT NULL,
    calories_100g numeric(6,1) NOT NULL,
    proteins_100g numeric(5,1) NOT NULL,
    fats_100g numeric(5,1) NOT NULL,
    carbs_100g numeric(5,1) NOT NULL,
    CONSTRAINT ck_products_cal CHECK (((calories_100g >= (0)::numeric) AND (calories_100g <= (900)::numeric))),
    CONSTRAINT ck_products_carb CHECK (((carbs_100g >= (0)::numeric) AND (carbs_100g <= (100)::numeric))),
    CONSTRAINT ck_products_fat CHECK (((fats_100g >= (0)::numeric) AND (fats_100g <= (100)::numeric))),
    CONSTRAINT ck_products_prot CHECK (((proteins_100g >= (0)::numeric) AND (proteins_100g <= (100)::numeric))),
    CONSTRAINT ck_products_sum CHECK ((((proteins_100g + fats_100g) + carbs_100g) <= (100)::numeric))
);


ALTER TABLE public.products OWNER TO "Denis1";

--
-- TOC entry 231 (class 1259 OID 16476)
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: Denis1
--

ALTER TABLE public.products ALTER COLUMN product_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16390)
-- Name: roles; Type: TABLE; Schema: public; Owner: Denis1
--

CREATE TABLE public.roles (
    role_id integer NOT NULL,
    role_name character varying(30) NOT NULL
);


ALTER TABLE public.roles OWNER TO "Denis1";

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: roles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: Denis1
--

ALTER TABLE public.roles ALTER COLUMN role_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.roles_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 16440)
-- Name: users; Type: TABLE; Schema: public; Owner: Denis1
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    login character varying(30) NOT NULL,
    password_hash character varying(64) NOT NULL,
    full_name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    birth_date date NOT NULL,
    height_cm smallint NOT NULL,
    goal_id integer NOT NULL,
    daily_calorie_goal smallint DEFAULT 2000 NOT NULL,
    role_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    gender character varying(20),
    CONSTRAINT ck_users_birth CHECK (((birth_date >= '1900-01-01'::date) AND (birth_date <= '2015-12-31'::date))),
    CONSTRAINT ck_users_cal CHECK (((daily_calorie_goal >= 800) AND (daily_calorie_goal <= 6000))),
    CONSTRAINT ck_users_email CHECK (((email)::text ~~ '%_@_%._%'::text)),
    CONSTRAINT ck_users_height CHECK (((height_cm >= 100) AND (height_cm <= 250)))
);


ALTER TABLE public.users OWNER TO "Denis1";

--
-- TOC entry 229 (class 1259 OID 16439)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: Denis1
--

ALTER TABLE public.users ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 236 (class 1259 OID 16544)
-- Name: weight_logs; Type: TABLE; Schema: public; Owner: Denis1
--

CREATE TABLE public.weight_logs (
    weight_log_id integer NOT NULL,
    user_id integer NOT NULL,
    log_date date DEFAULT CURRENT_DATE NOT NULL,
    weight_kg numeric(5,1) NOT NULL,
    CONSTRAINT ck_weight_kg CHECK (((weight_kg >= (30)::numeric) AND (weight_kg <= (300)::numeric)))
);


ALTER TABLE public.weight_logs OWNER TO "Denis1";

--
-- TOC entry 235 (class 1259 OID 16543)
-- Name: weight_logs_weight_log_id_seq; Type: SEQUENCE; Schema: public; Owner: Denis1
--

ALTER TABLE public.weight_logs ALTER COLUMN weight_log_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.weight_logs_weight_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3606 (class 0 OID 16515)
-- Dependencies: 234
-- Data for Name: food_entries; Type: TABLE DATA; Schema: public; Owner: Denis1
--

COPY public.food_entries (entry_id, user_id, product_id, meal_type_id, entry_date, weight_grams, note) FROM stdin;
\.


--
-- TOC entry 3594 (class 0 OID 16400)
-- Dependencies: 222
-- Data for Name: goals; Type: TABLE DATA; Schema: public; Owner: Denis1
--

COPY public.goals (goal_id, goal_name) FROM stdin;
1	Похудение
2	Поддержание веса
3	Набор массы
\.


--
-- TOC entry 3598 (class 0 OID 16420)
-- Dependencies: 226
-- Data for Name: meal_types; Type: TABLE DATA; Schema: public; Owner: Denis1
--

COPY public.meal_types (meal_type_id, meal_type_name) FROM stdin;
1	Завтрак
2	Обед
3	Ужин
4	Перекус
\.


--
-- TOC entry 3596 (class 0 OID 16410)
-- Dependencies: 224
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: Denis1
--

COPY public.product_categories (category_id, category_name) FROM stdin;
1	Мясо и птица
2	Рыба и морепродукты
3	Молочные продукты
4	Яйца
5	Крупы и каши
6	Хлеб и выпечка
7	Овощи
8	Фрукты и ягоды
9	Орехи и сухофрукты
10	Сладости
11	Напитки
12	Готовые блюда
17	Крупы и злаки
21	Орехи и семена
22	Масла и жиры
\.


--
-- TOC entry 3600 (class 0 OID 16430)
-- Dependencies: 228
-- Data for Name: product_statuses; Type: TABLE DATA; Schema: public; Owner: Denis1
--

COPY public.product_statuses (status_id, status_name) FROM stdin;
1	На рассмотрении
2	Одобрен
3	Отклонён
4	На проверке
\.


--
-- TOC entry 3604 (class 0 OID 16477)
-- Dependencies: 232
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: Denis1
--

COPY public.products (product_id, category_id, status_id, created_by_user_id, product_name, calories_100g, proteins_100g, fats_100g, carbs_100g) FROM stdin;
\.


--
-- TOC entry 3592 (class 0 OID 16390)
-- Dependencies: 220
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: Denis1
--

COPY public.roles (role_id, role_name) FROM stdin;
1	Администратор
2	Менеджер
3	Пользователь
\.


--
-- TOC entry 3602 (class 0 OID 16440)
-- Dependencies: 230
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Denis1
--

COPY public.users (user_id, login, password_hash, full_name, email, birth_date, height_cm, goal_id, daily_calorie_goal, role_id, created_at, gender) FROM stdin;
\.


--
-- TOC entry 3608 (class 0 OID 16544)
-- Dependencies: 236
-- Data for Name: weight_logs; Type: TABLE DATA; Schema: public; Owner: Denis1
--

COPY public.weight_logs (weight_log_id, user_id, log_date, weight_kg) FROM stdin;
\.


--
-- TOC entry 3615 (class 0 OID 0)
-- Dependencies: 233
-- Name: food_entries_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Denis1
--

SELECT pg_catalog.setval('public.food_entries_entry_id_seq', 1, false);


--
-- TOC entry 3616 (class 0 OID 0)
-- Dependencies: 221
-- Name: goals_goal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Denis1
--

SELECT pg_catalog.setval('public.goals_goal_id_seq', 6, true);


--
-- TOC entry 3617 (class 0 OID 0)
-- Dependencies: 225
-- Name: meal_types_meal_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Denis1
--

SELECT pg_catalog.setval('public.meal_types_meal_type_id_seq', 8, true);


--
-- TOC entry 3618 (class 0 OID 0)
-- Dependencies: 223
-- Name: product_categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Denis1
--

SELECT pg_catalog.setval('public.product_categories_category_id_seq', 24, true);


--
-- TOC entry 3619 (class 0 OID 0)
-- Dependencies: 227
-- Name: product_statuses_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Denis1
--

SELECT pg_catalog.setval('public.product_statuses_status_id_seq', 6, true);


--
-- TOC entry 3620 (class 0 OID 0)
-- Dependencies: 231
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Denis1
--

SELECT pg_catalog.setval('public.products_product_id_seq', 1, false);


--
-- TOC entry 3621 (class 0 OID 0)
-- Dependencies: 219
-- Name: roles_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Denis1
--

SELECT pg_catalog.setval('public.roles_role_id_seq', 8, true);


--
-- TOC entry 3622 (class 0 OID 0)
-- Dependencies: 229
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Denis1
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- TOC entry 3623 (class 0 OID 0)
-- Dependencies: 235
-- Name: weight_logs_weight_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Denis1
--

SELECT pg_catalog.setval('public.weight_logs_weight_log_id_seq', 1, false);


--
-- TOC entry 3429 (class 2606 OID 16527)
-- Name: food_entries food_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.food_entries
    ADD CONSTRAINT food_entries_pkey PRIMARY KEY (entry_id);


--
-- TOC entry 3401 (class 2606 OID 16408)
-- Name: goals goals_goal_name_key; Type: CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT goals_goal_name_key UNIQUE (goal_name);


--
-- TOC entry 3403 (class 2606 OID 16406)
-- Name: goals goals_pkey; Type: CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT goals_pkey PRIMARY KEY (goal_id);


--
-- TOC entry 3409 (class 2606 OID 16428)
-- Name: meal_types meal_types_meal_type_name_key; Type: CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.meal_types
    ADD CONSTRAINT meal_types_meal_type_name_key UNIQUE (meal_type_name);


--
-- TOC entry 3411 (class 2606 OID 16426)
-- Name: meal_types meal_types_pkey; Type: CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.meal_types
    ADD CONSTRAINT meal_types_pkey PRIMARY KEY (meal_type_id);


--
-- TOC entry 3405 (class 2606 OID 16418)
-- Name: product_categories product_categories_category_name_key; Type: CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_category_name_key UNIQUE (category_name);


--
-- TOC entry 3407 (class 2606 OID 16416)
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (category_id);


--
-- TOC entry 3413 (class 2606 OID 16436)
-- Name: product_statuses product_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.product_statuses
    ADD CONSTRAINT product_statuses_pkey PRIMARY KEY (status_id);


--
-- TOC entry 3415 (class 2606 OID 16438)
-- Name: product_statuses product_statuses_status_name_key; Type: CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.product_statuses
    ADD CONSTRAINT product_statuses_status_name_key UNIQUE (status_name);


--
-- TOC entry 3425 (class 2606 OID 16496)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 3427 (class 2606 OID 16498)
-- Name: products products_product_name_key; Type: CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_name_key UNIQUE (product_name);


--
-- TOC entry 3397 (class 2606 OID 16396)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- TOC entry 3399 (class 2606 OID 16398)
-- Name: roles roles_role_name_key; Type: CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_role_name_key UNIQUE (role_name);


--
-- TOC entry 3432 (class 2606 OID 16556)
-- Name: weight_logs uq_weight_user_date; Type: CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.weight_logs
    ADD CONSTRAINT uq_weight_user_date UNIQUE (user_id, log_date);


--
-- TOC entry 3417 (class 2606 OID 16465)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3419 (class 2606 OID 16463)
-- Name: users users_login_key; Type: CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_login_key UNIQUE (login);


--
-- TOC entry 3421 (class 2606 OID 16461)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3434 (class 2606 OID 16554)
-- Name: weight_logs weight_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.weight_logs
    ADD CONSTRAINT weight_logs_pkey PRIMARY KEY (weight_log_id);


--
-- TOC entry 3430 (class 1259 OID 16564)
-- Name: ix_entries_user_date; Type: INDEX; Schema: public; Owner: Denis1
--

CREATE INDEX ix_entries_user_date ON public.food_entries USING btree (user_id, entry_date);


--
-- TOC entry 3422 (class 1259 OID 16563)
-- Name: ix_products_category; Type: INDEX; Schema: public; Owner: Denis1
--

CREATE INDEX ix_products_category ON public.products USING btree (category_id, status_id);


--
-- TOC entry 3423 (class 1259 OID 16562)
-- Name: ix_products_name; Type: INDEX; Schema: public; Owner: Denis1
--

CREATE INDEX ix_products_name ON public.products USING btree (product_name);


--
-- TOC entry 3440 (class 2606 OID 16538)
-- Name: food_entries fk_entries_meal_types; Type: FK CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.food_entries
    ADD CONSTRAINT fk_entries_meal_types FOREIGN KEY (meal_type_id) REFERENCES public.meal_types(meal_type_id);


--
-- TOC entry 3441 (class 2606 OID 16533)
-- Name: food_entries fk_entries_products; Type: FK CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.food_entries
    ADD CONSTRAINT fk_entries_products FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 3442 (class 2606 OID 16528)
-- Name: food_entries fk_entries_users; Type: FK CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.food_entries
    ADD CONSTRAINT fk_entries_users FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 3437 (class 2606 OID 16499)
-- Name: products fk_products_categories; Type: FK CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_products_categories FOREIGN KEY (category_id) REFERENCES public.product_categories(category_id);


--
-- TOC entry 3438 (class 2606 OID 16504)
-- Name: products fk_products_statuses; Type: FK CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_products_statuses FOREIGN KEY (status_id) REFERENCES public.product_statuses(status_id);


--
-- TOC entry 3439 (class 2606 OID 16509)
-- Name: products fk_products_users; Type: FK CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_products_users FOREIGN KEY (created_by_user_id) REFERENCES public.users(user_id);


--
-- TOC entry 3435 (class 2606 OID 16466)
-- Name: users fk_users_goals; Type: FK CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_goals FOREIGN KEY (goal_id) REFERENCES public.goals(goal_id);


--
-- TOC entry 3436 (class 2606 OID 16471)
-- Name: users fk_users_roles; Type: FK CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_roles FOREIGN KEY (role_id) REFERENCES public.roles(role_id);


--
-- TOC entry 3443 (class 2606 OID 16557)
-- Name: weight_logs fk_weight_users; Type: FK CONSTRAINT; Schema: public; Owner: Denis1
--

ALTER TABLE ONLY public.weight_logs
    ADD CONSTRAINT fk_weight_users FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


-- Completed on 2026-10-27 16:31:36

--
-- PostgreSQL database dump complete
--

\unrestrict IjPgbn1w5sd6mwK0EtCnKxPi8t9RkkBknUMaQF9YglQCNm28mmAo4phHPLeMHJ4

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict o0fyZ6uAMp6SNcens6Yf0ORCu98tnfg69QKoFXf1ab2cTbNLyWGqLYnIDPWpXfT

-- Dumped from database version 18.6 (Debian 18.6-1.pgdg13+2)
-- Dumped by pg_dump version 18.4

-- Started on 2026-10-27 16:31:36

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2026-10-27 16:31:36

--
-- PostgreSQL database dump complete
--

\unrestrict o0fyZ6uAMp6SNcens6Yf0ORCu98tnfg69QKoFXf1ab2cTbNLyWGqLYnIDPWpXfT

-- Completed on 2026-10-27 16:31:36

--
-- PostgreSQL database cluster dump complete
--

