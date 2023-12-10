--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: attendance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attendance (
    roll_number character varying(255) NOT NULL,
    date character varying(255),
    present boolean NOT NULL,
    subject_id character varying(255)
);


ALTER TABLE public.attendance OWNER TO postgres;

--
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- Name: hibernate_sequences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hibernate_sequences (
    sequence_name character varying(255) NOT NULL,
    next_val bigint
);


ALTER TABLE public.hibernate_sequences OWNER TO postgres;

--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    roll_number character varying(255) NOT NULL,
    name character varying(255),
    semester integer NOT NULL,
    dept_id integer
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subjects (
    id character varying(255) NOT NULL,
    name character varying(255),
    semester integer NOT NULL,
    dept_id integer,
    teacher_id integer
);


ALTER TABLE public.subjects OWNER TO postgres;

--
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    dept_id integer,
    name character varying(255),
    username character varying(255)
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- Name: teachers_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teachers_seq OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    password character varying(255),
    role character varying(255),
    username character varying(255),
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['TEACHER'::character varying, 'ADMIN'::character varying])::text[])))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: attendance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attendance (roll_number, date, present, subject_id) FROM stdin;
1001	08-11-2023	t	CSE1817PE41
2001	08-11-2023	t	ME181701
3001	08-11-2023	t	CE181701
5001	08-11-2023	t	IE181701
3002	08-11-2023	t	CE181701
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (id, name) FROM stdin;
101	Computer Science and Engineering
102	Mechanical Engineering
103	Civil Engineering
104	Electrical Engineering
105	Instrumentation Engineering
\.


--
-- Data for Name: hibernate_sequences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hibernate_sequences (sequence_name, next_val) FROM stdin;
default	150
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (roll_number, name, semester, dept_id) FROM stdin;
1001	kuldeep singh	7	101
2001	kanika kathuria	7	102
3001	priya jain	7	103
4001	anjali juneja	7	104
5001	nitu kumari	7	105
3002	rishav borah	7	103
2002	randeep gogoi	7	102
1002	rajiv das	7	101
5002	disha malhotra	7	105
\.


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subjects (id, name, semester, dept_id, teacher_id) FROM stdin;
CSE1817PE41	Cloud Computing	7	101	1
ME181701	Vibration of Mechanical Systems	7	102	2
CE181701	Quantity Surveying	7	103	3
IE181701	Telemetry and Tele Control	7	105	5
CSE1817OE21	Machhine Learning	7	101	6
CSE181701	Database Management Systems	7	101	7
CSE181301	Data Structures and Algorithms	3	101	7
\.


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers (id, dept_id, name, username) FROM stdin;
1	101	Erin Santos	erinsantos
2	102	Walker Conley	walkerconley
3	103	Salem Gonzalez	salemgonzalez
4	104	Ethan Bautista	ethanbautista
5	105	Fox Carson	foxcarson
6	101	Nalani Barrera	nalanibarrera
7	101	Rupam Baruah	rupambaruah
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, password, role, username) FROM stdin;
1	$2a$10$q62d063Vl4CvHcl28y22GeeK1BTqjWdDtiAMib0dwNV1vjH/cNJcm	ADMIN	admin01
2	$2a$10$kSMYA5Q9pDGVMpBKuVqFcuyQZXWxNls3H4lhJRCxsEY5uVYikKv02	ADMIN	admin02
3	$2a$10$RLyts9rRa.cZHAaSI7sEbOkRIphRLInLtn58BVK0BsILhIyMQBfHS	TEACHER	erinsantos
4	$2a$10$SI/6IHXPEdBpBVGoUq7Ab.7tUNbokqp0O.RuT4QZYzPr47ShASdHS	TEACHER	walkerconley
5	$2a$10$VZYWYrlu9nfbCifrYh8nbuDfyt9YKRmgc3HOaKdlUa6yZG1sEp/OC	TEACHER	salemgonzalez
6	$2a$10$w7pD7E5Bv7tlDaLaHg53XuyxhCEk3jqUPZtD5nIdFa0Gkgp1P9Xd.	TEACHER	ethanbautista
7	$2a$10$tMFPCz6LR7AK3K7ayK3JY.jv9.nZMNw8mMWqxR6M6slvkYi8/o0Di	TEACHER	foxcarson
8	$2a$10$vNuQ61/jQnMfH8f9lTxPru1VqLc8S94kg9EXrPWU7Mbujkez2gHDm	TEACHER	nalanibarrera
9	$2a$10$5nfqJtlywmakPFGdDPI9k.jOb9oWqrOkzgYKU9c98JIa7vb9AHsh2	TEACHER	rupambaruah
52	$2a$10$Lhza/ohRsnrsvnB2mV.HeOL5oRouQmm4N3B4zsGIT.0ocaBMG7iWi	ADMIN	admin03
\.


--
-- Name: teachers_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_seq', 1, false);


--
-- Name: attendance attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_pkey PRIMARY KEY (roll_number);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: hibernate_sequences hibernate_sequences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hibernate_sequences
    ADD CONSTRAINT hibernate_sequences_pkey PRIMARY KEY (sequence_name);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (roll_number);


--
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- Name: teachers uk_eoxl6ynhdahri3g5qfrdhflwv; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT uk_eoxl6ynhdahri3g5qfrdhflwv UNIQUE (username);


--
-- Name: users uk_r43af9ap4edm43mmtq01oddj6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_r43af9ap4edm43mmtq01oddj6 UNIQUE (username);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: subjects fkagcibl3s2punqkd7e3shuct9c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT fkagcibl3s2punqkd7e3shuct9c FOREIGN KEY (dept_id) REFERENCES public.departments(id);


--
-- Name: attendance fkcjg1qkkmmy4dtktcdug457x4p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT fkcjg1qkkmmy4dtktcdug457x4p FOREIGN KEY (subject_id) REFERENCES public.subjects(id);


--
-- Name: students fki1trtove3brbpybgyeepb06nf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT fki1trtove3brbpybgyeepb06nf FOREIGN KEY (dept_id) REFERENCES public.departments(id);


--
-- Name: teachers fkpcs3f46wtj9hdjqy5yvjs21xb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT fkpcs3f46wtj9hdjqy5yvjs21xb FOREIGN KEY (username) REFERENCES public.users(username);


--
-- Name: subjects fksjy6ghvvelraa2w9mhv3bbnys; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT fksjy6ghvvelraa2w9mhv3bbnys FOREIGN KEY (teacher_id) REFERENCES public.teachers(id);


--
-- PostgreSQL database dump complete
--

