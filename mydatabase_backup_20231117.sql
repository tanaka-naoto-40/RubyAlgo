--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Homebrew)
-- Dumped by pg_dump version 14.8 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alarms; Type: TABLE; Schema: public; Owner: RubyAru
--

CREATE TABLE public.alarms (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    lesson_id bigint NOT NULL,
    alarm_time timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.alarms OWNER TO "RubyAru";

--
-- Name: alarms_id_seq; Type: SEQUENCE; Schema: public; Owner: RubyAru
--

CREATE SEQUENCE public.alarms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alarms_id_seq OWNER TO "RubyAru";

--
-- Name: alarms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: RubyAru
--

ALTER SEQUENCE public.alarms_id_seq OWNED BY public.alarms.id;


--
-- Name: answers; Type: TABLE; Schema: public; Owner: RubyAru
--

CREATE TABLE public.answers (
    id bigint NOT NULL,
    lesson_id bigint NOT NULL,
    content text NOT NULL,
    correct_code text,
    explanation text,
    answer boolean NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.answers OWNER TO "RubyAru";

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: RubyAru
--

CREATE SEQUENCE public.answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answers_id_seq OWNER TO "RubyAru";

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: RubyAru
--

ALTER SEQUENCE public.answers_id_seq OWNED BY public.answers.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: RubyAru
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO "RubyAru";

--
-- Name: bookmarks; Type: TABLE; Schema: public; Owner: RubyAru
--

CREATE TABLE public.bookmarks (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    lesson_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.bookmarks OWNER TO "RubyAru";

--
-- Name: bookmarks_id_seq; Type: SEQUENCE; Schema: public; Owner: RubyAru
--

CREATE SEQUENCE public.bookmarks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bookmarks_id_seq OWNER TO "RubyAru";

--
-- Name: bookmarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: RubyAru
--

ALTER SEQUENCE public.bookmarks_id_seq OWNED BY public.bookmarks.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: RubyAru
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    title character varying NOT NULL,
    content character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO "RubyAru";

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: RubyAru
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO "RubyAru";

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: RubyAru
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: RubyAru
--

CREATE TABLE public.courses (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    title character varying NOT NULL,
    content character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.courses OWNER TO "RubyAru";

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: RubyAru
--

CREATE SEQUENCE public.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_id_seq OWNER TO "RubyAru";

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: RubyAru
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: lessons; Type: TABLE; Schema: public; Owner: RubyAru
--

CREATE TABLE public.lessons (
    id bigint NOT NULL,
    course_id bigint NOT NULL,
    title character varying NOT NULL,
    content text NOT NULL,
    hints text,
    starter_code text,
    published boolean DEFAULT false,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.lessons OWNER TO "RubyAru";

--
-- Name: lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: RubyAru
--

CREATE SEQUENCE public.lessons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lessons_id_seq OWNER TO "RubyAru";

--
-- Name: lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: RubyAru
--

ALTER SEQUENCE public.lessons_id_seq OWNED BY public.lessons.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: RubyAru
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO "RubyAru";

--
-- Name: users; Type: TABLE; Schema: public; Owner: RubyAru
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    username character varying NOT NULL,
    email character varying NOT NULL,
    role integer DEFAULT 0 NOT NULL,
    crypted_password character varying,
    salt character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    line_user_id character varying
);


ALTER TABLE public.users OWNER TO "RubyAru";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: RubyAru
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "RubyAru";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: RubyAru
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: alarms id; Type: DEFAULT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.alarms ALTER COLUMN id SET DEFAULT nextval('public.alarms_id_seq'::regclass);


--
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.answers ALTER COLUMN id SET DEFAULT nextval('public.answers_id_seq'::regclass);


--
-- Name: bookmarks id; Type: DEFAULT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.bookmarks ALTER COLUMN id SET DEFAULT nextval('public.bookmarks_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: lessons id; Type: DEFAULT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.lessons ALTER COLUMN id SET DEFAULT nextval('public.lessons_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: alarms; Type: TABLE DATA; Schema: public; Owner: RubyAru
--

COPY public.alarms (id, user_id, lesson_id, alarm_time, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: RubyAru
--

COPY public.answers (id, lesson_id, content, correct_code, explanation, answer, created_at, updated_at) FROM stdin;
5	1	選択肢3	a	a	f	2023-10-06 13:56:37.015591	2023-10-06 13:56:37.015591
1	1	本文\n`[6, 10, 4, 8]`\n```rb\nuser = User.new\nputs "名前は#{user.name}です" if user || user.name \n```	コード	解説\n以下のコードを実行すると、[3, 4, 5, 6, 7]が表示される。\n```ruby\n numbers = [1, 2, 3, 4, 5]\n numbers.shift(2)\n p numbers\n```	t	2023-09-28 23:19:03.417542	2023-10-27 16:34:02.373365
11	5	a	a	a	t	2023-10-09 01:06:58.978548	2023-10-09 01:06:58.978548
12	5	aa	a	a	t	2023-10-09 01:07:12.897269	2023-10-09 01:07:12.897269
13	5	a	a	a	f	2023-10-09 01:07:20.461478	2023-10-09 01:07:20.461478
6	1	選択肢4	a		f	2023-10-06 13:57:20.114711	2023-10-30 16:37:33.553167
3	3	hello paizaラーニング	puts "hello paizaラーニング"\n	if文とelsif文を使用して、条件分岐を行います。これにより、各数字が特定の条件に合致するかどうかを判断することができます。\n\ni % 3 == 0 && i % 5 == 0:\n数字iが3の倍数かつ5の倍数であるかを判定しています。%はモジュロ演算子と呼ばれ、割り算の余りを返します。この条件が真である場合（つまり、数字が15の倍数である場合）には、FizzBuzzと出力します。\n\ni % 3 == 0:\n数字iが3の倍数であるかを判定しています。この条件が真である場合には、Fizzと出力します。\n\ni % 5 == 0:\n数字iが5の倍数であるかを判定しています。この条件が真である場合には、Buzzと出力します。\n\nelse:\n上記のいずれの条件も真でない場合（つまり、数字が3の倍数でも5の倍数でもない場合）には、数字そのものを出力します。	t	2023-09-29 00:01:48.509107	2023-11-01 14:55:14.278949
4	1	以下のような『4以下の数は2足して、そうでない数は2引く』コードを書いた。\n\n``` rb\nputs "Hello World"\nif num <= 4\n  num += 2\nelse\n  num -= 2\nend\n```\n後置ifを使用すると、上記コードは以下のように書き換えられる。\n\n```\nnum += 2　if num <= 4\nnum -= 2　if num > 4\n```	nul	あ	f	2023-10-06 13:56:17.717485	2023-10-16 21:48:45.478393
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: RubyAru
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-07-14 07:51:02.960804	2023-07-14 07:51:02.960804
\.


--
-- Data for Name: bookmarks; Type: TABLE DATA; Schema: public; Owner: RubyAru
--

COPY public.bookmarks (id, user_id, lesson_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: RubyAru
--

COPY public.categories (id, title, content, created_at, updated_at) FROM stdin;
1	基礎編	説明	2023-08-09 17:27:18.351323	2023-08-15 00:08:05.33862
2	応用編	説明	2023-08-09 17:27:18.355135	2023-08-15 00:08:09.918803
3	実践編	説明文	2023-08-14 00:10:34.672762	2023-08-15 00:08:15.223574
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: RubyAru
--

COPY public.courses (id, category_id, title, content, created_at, updated_at) FROM stdin;
1	1	String	Stringクラスに関する問題が出題される	2023-08-09 17:27:18.376116	2023-08-09 17:27:18.376116
2	1	Numeric	Numericクラスに関する問題が出題される	2023-08-09 17:27:18.38047	2023-08-09 17:27:18.38047
3	1	Array	Array	2023-08-09 17:27:18.383766	2023-08-09 17:27:18.383766
4	1	Hash	Hashクラスに関する問題が出題される	2023-08-09 17:27:18.387106	2023-08-16 15:23:34.08441
6	2	仮問題	説明文	2023-09-06 21:57:52.160721	2023-09-06 21:58:11.491557
7	2	z	z	2023-10-05 16:50:33.506032	2023-10-05 16:50:33.506032
\.


--
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: RubyAru
--

COPY public.lessons (id, course_id, title, content, hints, starter_code, published, created_at, updated_at) FROM stdin;
5	2	仮	あ	あ	あ	t	2023-10-09 01:05:40.183954	2023-10-09 01:05:40.183954
1	1	問題１	以下のコードがあります。\n```rb\n NUM = 42\n NUM += 5\n p NUM\n```\n実行結果として正しいものを選択してください。\n```rb\nary = [2,4,8,1,16]\np ary.__(1)__\n\n[出力]\n[16, 8, 4, 2, 1]\n```			t	2023-09-21 00:14:19.15886	2023-10-31 16:37:55.76567
3	6	 演習課題「エラー箇所を正しく修正しよう！Vol.1」	右側のコードエリアに表示されているプログラムは、このままではエラーになります。\nコードを修正して、「hello paizaラーニング」と出力されるように修正してください。\n\n```rb\nary = [2,4,8,1,16]\np ary.__(1)__\n```	・eachメソッドを使って、1から100までの数字を順番に処理してみましょう。\n・条件判定にはif文やelsif文を活用できます。	# Here your code !\nputs　"hello paizaラーニング"\n	t	2023-09-21 00:17:44.514729	2023-11-01 14:30:32.055032
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: RubyAru
--

COPY public.schema_migrations (version) FROM stdin;
20230719143757
20230726043042
20230720141339
20230724054709
20230714074610
20230929140756
20231105082305
20231116073718
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: RubyAru
--

COPY public.users (id, username, email, role, crypted_password, salt, created_at, updated_at, line_user_id) FROM stdin;
2	sample2	sample2@example.com	1	$2a$10$LUuwfYDuTvZjuXhOgCvaVOq5fyLBY/jgprOgK867HvPrU6KNhPKZS	aEn2wiX9yjzjxJFaEd64	2023-09-29 22:09:29.885379	2023-11-09 16:41:50.435068	\N
3	sample3	sample3@example.com	1	$2a$10$E2TuqhAMfNf6WeN4cqzo7eXWA9k.CoNnVMUk2BUMptc.q3U6S5LG6	Gss4ozCAMHB7gwMedJMj	2023-10-05 17:39:35.997476	2023-11-09 16:42:05.487021	\N
\.


--
-- Name: alarms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: RubyAru
--

SELECT pg_catalog.setval('public.alarms_id_seq', 1, false);


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: RubyAru
--

SELECT pg_catalog.setval('public.answers_id_seq', 13, true);


--
-- Name: bookmarks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: RubyAru
--

SELECT pg_catalog.setval('public.bookmarks_id_seq', 7, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: RubyAru
--

SELECT pg_catalog.setval('public.categories_id_seq', 40, true);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: RubyAru
--

SELECT pg_catalog.setval('public.courses_id_seq', 7, true);


--
-- Name: lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: RubyAru
--

SELECT pg_catalog.setval('public.lessons_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: RubyAru
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: alarms alarms_pkey; Type: CONSTRAINT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.alarms
    ADD CONSTRAINT alarms_pkey PRIMARY KEY (id);


--
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: bookmarks bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_alarms_on_lesson_id; Type: INDEX; Schema: public; Owner: RubyAru
--

CREATE INDEX index_alarms_on_lesson_id ON public.alarms USING btree (lesson_id);


--
-- Name: index_alarms_on_user_id; Type: INDEX; Schema: public; Owner: RubyAru
--

CREATE INDEX index_alarms_on_user_id ON public.alarms USING btree (user_id);


--
-- Name: index_answers_on_lesson_id; Type: INDEX; Schema: public; Owner: RubyAru
--

CREATE INDEX index_answers_on_lesson_id ON public.answers USING btree (lesson_id);


--
-- Name: index_bookmarks_on_lesson_id; Type: INDEX; Schema: public; Owner: RubyAru
--

CREATE INDEX index_bookmarks_on_lesson_id ON public.bookmarks USING btree (lesson_id);


--
-- Name: index_bookmarks_on_user_id; Type: INDEX; Schema: public; Owner: RubyAru
--

CREATE INDEX index_bookmarks_on_user_id ON public.bookmarks USING btree (user_id);


--
-- Name: index_bookmarks_on_user_id_and_lesson_id; Type: INDEX; Schema: public; Owner: RubyAru
--

CREATE UNIQUE INDEX index_bookmarks_on_user_id_and_lesson_id ON public.bookmarks USING btree (user_id, lesson_id);


--
-- Name: index_courses_on_category_id; Type: INDEX; Schema: public; Owner: RubyAru
--

CREATE INDEX index_courses_on_category_id ON public.courses USING btree (category_id);


--
-- Name: index_lessons_on_course_id; Type: INDEX; Schema: public; Owner: RubyAru
--

CREATE INDEX index_lessons_on_course_id ON public.lessons USING btree (course_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: RubyAru
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: alarms fk_rails_1ad8880549; Type: FK CONSTRAINT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.alarms
    ADD CONSTRAINT fk_rails_1ad8880549 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: answers fk_rails_421b8e04ed; Type: FK CONSTRAINT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT fk_rails_421b8e04ed FOREIGN KEY (lesson_id) REFERENCES public.lessons(id);


--
-- Name: lessons fk_rails_4bcdb571d9; Type: FK CONSTRAINT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT fk_rails_4bcdb571d9 FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: alarms fk_rails_62ea62d6c1; Type: FK CONSTRAINT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.alarms
    ADD CONSTRAINT fk_rails_62ea62d6c1 FOREIGN KEY (lesson_id) REFERENCES public.lessons(id);


--
-- Name: bookmarks fk_rails_c1ff6fa4ac; Type: FK CONSTRAINT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT fk_rails_c1ff6fa4ac FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: courses fk_rails_e072dca946; Type: FK CONSTRAINT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT fk_rails_e072dca946 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: bookmarks fk_rails_e7b1324506; Type: FK CONSTRAINT; Schema: public; Owner: RubyAru
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT fk_rails_e7b1324506 FOREIGN KEY (lesson_id) REFERENCES public.lessons(id);


--
-- PostgreSQL database dump complete
--

