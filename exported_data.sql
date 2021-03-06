--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: core_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_client (
    id bigint NOT NULL,
    "firstName" character varying(25) NOT NULL,
    "lastName" character varying(25) NOT NULL,
    email character varying(40) NOT NULL,
    phone character varying(20) NOT NULL,
    mobile character varying(20) NOT NULL,
    "companyName" character varying(250) NOT NULL,
    "dateCreated" timestamp with time zone NOT NULL,
    "dateUpdated" timestamp with time zone NOT NULL,
    "salesContact_id" bigint NOT NULL
);


ALTER TABLE public.core_client OWNER TO postgres;

--
-- Name: core_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_client_id_seq OWNER TO postgres;

--
-- Name: core_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_client_id_seq OWNED BY public.core_client.id;


--
-- Name: core_contract; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_contract (
    id bigint NOT NULL,
    "dateCreated" timestamp with time zone NOT NULL,
    "dateUpdated" timestamp with time zone NOT NULL,
    status boolean NOT NULL,
    amount double precision NOT NULL,
    "paiementDue" timestamp with time zone NOT NULL,
    client_id bigint NOT NULL,
    "salesContact_id" bigint NOT NULL
);


ALTER TABLE public.core_contract OWNER TO postgres;

--
-- Name: core_contract_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_contract_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_contract_id_seq OWNER TO postgres;

--
-- Name: core_contract_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_contract_id_seq OWNED BY public.core_contract.id;


--
-- Name: core_event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_event (
    id bigint NOT NULL,
    "dateCreated" timestamp with time zone NOT NULL,
    "dateUpdated" timestamp with time zone NOT NULL,
    attendees integer NOT NULL,
    "eventDate" timestamp with time zone NOT NULL,
    notes text NOT NULL,
    client_id bigint NOT NULL,
    "eventStatus_id" bigint NOT NULL,
    "supportContact_id" bigint NOT NULL
);


ALTER TABLE public.core_event OWNER TO postgres;

--
-- Name: core_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_event_id_seq OWNER TO postgres;

--
-- Name: core_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_event_id_seq OWNED BY public.core_event.id;


--
-- Name: core_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_status (
    id bigint NOT NULL,
    "eventIsOver" boolean NOT NULL
);


ALTER TABLE public.core_status OWNER TO postgres;

--
-- Name: core_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_status_id_seq OWNER TO postgres;

--
-- Name: core_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_status_id_seq OWNED BY public.core_status.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: users_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    "isAdmin" boolean NOT NULL,
    "isSale" boolean NOT NULL,
    "isSupport" boolean NOT NULL
);


ALTER TABLE public.users_user OWNER TO postgres;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO postgres;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO postgres;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO postgres;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: core_client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_client ALTER COLUMN id SET DEFAULT nextval('public.core_client_id_seq'::regclass);


--
-- Name: core_contract id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_contract ALTER COLUMN id SET DEFAULT nextval('public.core_contract_id_seq'::regclass);


--
-- Name: core_event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_event ALTER COLUMN id SET DEFAULT nextval('public.core_event_id_seq'::regclass);


--
-- Name: core_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_status ALTER COLUMN id SET DEFAULT nextval('public.core_status_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
2	SupportGroup
1	SalesGroup
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	33
2	1	21
3	1	22
4	1	24
6	1	26
7	1	28
8	2	24
9	2	34
10	2	36
12	1	25
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add client	6	add_client
22	Can change client	6	change_client
23	Can delete client	6	delete_client
24	Can view client	6	view_client
25	Can add contract	7	add_contract
26	Can change contract	7	change_contract
27	Can delete contract	7	delete_contract
28	Can view contract	7	view_contract
29	Can add status	8	add_status
30	Can change status	8	change_status
31	Can delete status	8	delete_status
32	Can view status	8	view_status
33	Can add event	9	add_event
34	Can change event	9	change_event
35	Can delete event	9	delete_event
36	Can view event	9	view_event
37	Can add user	10	add_user
38	Can change user	10	change_user
39	Can delete user	10	delete_user
40	Can view user	10	view_user
\.


--
-- Data for Name: core_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_client (id, "firstName", "lastName", email, phone, mobile, "companyName", "dateCreated", "dateUpdated", "salesContact_id") FROM stdin;
4	John	Doe	email1@company1.com	11	112	company1	2022-05-09 17:11:01+02	2022-05-09 17:11:01+02	2
5	Jim	Clark	jimclark@company2.com	22	221	company2	2022-05-10 09:13:50+02	2022-05-10 09:13:50+02	3
7	Bill	Doe	billdoe@company4.com	44	441	company4	2022-05-12 12:17:05+02	2022-05-12 12:17:05+02	2
8	jeff	jones	jeffjones@company1.com	55	551	company1	2022-05-12 12:18:23+02	2022-05-12 12:18:23+02	3
6	Joe	Lee	joelee@company3.com	33	331	company3	2022-05-12 12:15:55+02	2022-05-12 12:15:55+02	3
9	Clint	Bush	clintbush@company4.com	66	661	company4	2022-05-16 09:29:20.942377+02	2022-05-16 09:29:20.942377+02	3
10	Scott	Porter	scottporter@company4.com	77	771	company5	2022-03-13 12:10:00+01	2022-03-15 12:10:00+01	2
\.


--
-- Data for Name: core_contract; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_contract (id, "dateCreated", "dateUpdated", status, amount, "paiementDue", client_id, "salesContact_id") FROM stdin;
2	2022-05-10 09:25:20+02	2022-05-10 09:25:20+02	f	210	2022-06-25 09:25:20+02	5	3
3	2022-05-10 10:01:01+02	2022-05-10 10:01:01+02	f	220	2022-05-10 10:01:01+02	7	2
4	2022-05-12 12:21:22+02	2022-05-12 12:21:22+02	f	322	2022-05-12 12:21:22+02	8	3
1	2022-05-10 09:22:27+02	2022-05-10 09:22:27+02	t	220	2022-05-25 09:22:27+02	4	2
5	2022-05-12 12:21:47+02	2022-05-12 12:21:47+02	f	876	2022-05-12 12:21:47+02	6	3
6	2022-05-18 13:08:00+02	2022-05-18 13:08:00+02	t	248	2022-07-01 13:08:00+02	10	2
7	2022-05-18 13:29:00+02	2022-05-18 13:29:00+02	t	621	2022-07-04 13:29:00+02	7	2
8	2022-05-18 13:29:00+02	2022-05-18 13:29:00+02	f	799	2022-07-07 13:29:00+02	7	2
\.


--
-- Data for Name: core_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_event (id, "dateCreated", "dateUpdated", attendees, "eventDate", notes, client_id, "eventStatus_id", "supportContact_id") FROM stdin;
2	2022-05-10 09:30:24+02	2022-05-10 09:30:24+02	0	2022-05-10 09:30:24+02		4	2	4
3	2022-05-29 11:32:00+02	2022-05-29 11:32:00+02	28	2022-05-31 11:33:00+02	xx	4	1	5
4	2022-05-12 12:22:38+02	2022-05-12 12:22:38+02	55	2022-06-24 12:22:38+02		7	2	4
5	2022-05-12 12:23:10+02	2022-05-12 12:23:10+02	34	2022-05-12 12:23:10+02		8	2	5
6	2022-05-12 12:23:37+02	2022-05-12 12:23:37+02	45	2022-05-12 12:23:37+02		7	2	5
7	2022-05-12 12:25:25+02	2022-05-12 12:25:25+02	33	2022-05-12 12:25:25+02		6	1	4
9	2022-09-16 09:42:25.709209+02	2022-09-16 09:42:25.709209+02	28	2022-10-16 09:42:25.709209+02		8	2	4
10	2022-05-16 09:54:41.337246+02	2022-05-16 09:54:41.337246+02	0	2022-05-16 09:54:41.337246+02		6	2	4
8	2022-05-12 12:23:37+02	2022-05-12 12:23:37+02	45	2022-05-12 12:23:37+02		7	2	5
\.


--
-- Data for Name: core_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_status (id, "eventIsOver") FROM stdin;
2	f
1	t
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-05-05 15:12:18.960815+02	1	admin	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Admin user"]}}]	10	1
2	2022-05-09 10:17:59.245501+02	2	sales1	1	[{"added": {}}]	10	1
3	2022-05-09 10:18:21.035686+02	3	sales2	1	[{"added": {}}]	10	1
4	2022-05-09 10:18:42.975062+02	4	support1	1	[{"added": {}}]	10	1
5	2022-05-09 10:19:00.660596+02	5	support2	1	[{"added": {}}]	10	1
6	2022-05-09 10:24:04.552211+02	2	sales1	2	[{"changed": {"fields": ["Sale user"]}}]	10	1
7	2022-05-09 10:24:11.48913+02	3	sales2	2	[{"changed": {"fields": ["Sale user"]}}]	10	1
8	2022-05-09 10:24:18.519282+02	4	support1	2	[{"changed": {"fields": ["Support user"]}}]	10	1
9	2022-05-09 10:24:25.773377+02	5	support2	2	[{"changed": {"fields": ["Support user"]}}]	10	1
10	2022-05-09 14:00:21.779534+02	2	sales1	2	[{"changed": {"fields": ["password"]}}]	10	1
11	2022-05-09 14:13:44.306324+02	3	sales2	2	[{"changed": {"fields": ["password"]}}]	10	1
12	2022-05-09 16:35:28.428378+02	5	support2	2	[{"changed": {"fields": ["password"]}}]	10	1
13	2022-05-09 16:35:52.61675+02	4	support1	2	[{"changed": {"fields": ["password"]}}]	10	1
14	2022-05-10 09:13:07.683303+02	4	('Client1', 'Doe', <User: sales1>)	2	[{"changed": {"fields": ["LastName"]}}]	6	1
15	2022-05-10 09:13:31.711589+02	4	('John', 'Doe', <User: sales1>)	2	[{"changed": {"fields": ["FirstName"]}}]	6	1
16	2022-05-10 09:14:33.396445+02	5	('Jim', 'Clark', <User: sales2>)	1	[{"added": {}}]	6	1
17	2022-05-10 09:25:14.321086+02	1	(<User: sales1>, <Client: ('John', 'Doe', <User: sales1>)>, 110.0)	1	[{"added": {}}]	7	1
18	2022-05-10 09:25:38.830385+02	2	(<User: sales2>, <Client: ('Jim', 'Clark', <User: sales2>)>, 210.0)	1	[{"added": {}}]	7	1
19	2022-05-10 09:26:53.328413+02	1	Status object (1)	1	[{"added": {}}]	8	1
20	2022-05-10 09:27:11.226498+02	2	Status object (2)	1	[{"added": {}}]	8	1
21	2022-05-10 09:27:33.969161+02	3	Status object (3)	1	[{"added": {}}]	8	1
22	2022-05-10 09:27:50.772142+02	3	Status object (3)	2	[]	8	1
23	2022-05-10 09:27:57.997012+02	2	Status object (2)	2	[]	8	1
24	2022-05-10 09:28:04.252927+02	1	Status object (1)	2	[]	8	1
25	2022-05-10 09:28:20.517575+02	3	Status object (3)	3		8	1
26	2022-05-10 09:31:27.803733+02	2	(<User: support1>, <Client: ('John', 'Doe', <User: sales1>)>, <Status: Status object (2)>)	1	[{"added": {}}]	9	1
27	2022-05-10 09:49:43.590964+02	1	SalesGroup	1	[{"added": {}}]	3	1
28	2022-05-10 09:51:37.262849+02	2	SupportGroup	1	[{"added": {}}]	3	1
29	2022-05-10 09:52:26.063475+02	1	admin	2	[{"changed": {"fields": ["First name", "Last name"]}}]	10	1
30	2022-05-10 09:53:03.889078+02	2	sales1	2	[{"changed": {"fields": ["Groups"]}}]	10	1
31	2022-05-10 09:53:18.305279+02	3	sales2	2	[{"changed": {"fields": ["Groups"]}}]	10	1
32	2022-05-10 09:53:32.380449+02	4	support1	2	[{"changed": {"fields": ["Groups"]}}]	10	1
33	2022-05-10 09:53:42.09768+02	5	support2	2	[]	10	1
34	2022-05-10 10:03:30.665412+02	5	support2	2	[{"changed": {"fields": ["Groups"]}}]	10	1
35	2022-05-10 10:03:41.624067+02	4	support1	2	[]	10	1
36	2022-05-10 10:03:48.346524+02	5	support2	2	[]	10	1
37	2022-05-10 11:49:01.340312+02	3	sales2	2	[{"changed": {"fields": ["password"]}}]	10	1
38	2022-05-10 11:49:21.760407+02	4	support1	2	[{"changed": {"fields": ["password"]}}]	10	1
39	2022-05-10 11:49:43.633927+02	5	support2	2	[{"changed": {"fields": ["password"]}}]	10	1
40	2022-05-10 14:08:06.983821+02	1	SalesGroup	2	[{"changed": {"fields": ["Permissions"]}}]	3	1
41	2022-05-11 11:40:27.828227+02	1	SalesGroup	2	[{"changed": {"fields": ["Permissions"]}}]	3	1
42	2022-05-12 10:05:30.744197+02	3	(3, 'support2', <Client: (4, 'John', 'Doe', 'sales1')>, True)	2	[{"changed": {"fields": ["SupportContact"]}}]	9	1
43	2022-05-12 11:11:19.541279+02	1	SalesGroup	2	[{"changed": {"fields": ["Permissions"]}}]	3	1
44	2022-05-12 12:16:56.749193+02	6	(6, 'Joe', 'Lee', 'sales2')	1	[{"added": {}}]	6	1
45	2022-05-12 12:18:06.337757+02	7	(7, 'Bill', 'Doe', 'sales1')	1	[{"added": {}}]	6	1
46	2022-05-12 12:19:14.880696+02	8	(8, 'jeff', 'jones', 'sales2')	1	[{"added": {}}]	6	1
47	2022-05-12 12:19:39.241437+02	6	(6, 'Joe', 'Lee', 'sales2')	2	[{"changed": {"fields": ["Mobile"]}}]	6	1
48	2022-05-12 12:20:38.975674+02	3	(3, 'sales1', 7, 'Bill', 'Doe', 220.0)	2	[{"changed": {"fields": ["Client"]}}]	7	1
49	2022-05-12 12:21:43.338103+02	4	(4, 'sales2', 8, 'jeff', 'jones', 322.0)	1	[{"added": {}}]	7	1
50	2022-05-12 12:22:02.322264+02	5	(5, 'sales1', 6, 'Joe', 'Lee', 876.0)	1	[{"added": {}}]	7	1
51	2022-05-12 12:23:07.338968+02	4	(4, 'support1', 7, 'Bill', 'Doe', False)	1	[{"added": {}}]	9	1
52	2022-05-12 12:23:29.304131+02	5	(5, 'support2', 8, 'jeff', 'jones', False)	1	[{"added": {}}]	9	1
53	2022-05-12 12:23:57.349923+02	6	(6, 'support2', 8, 'jeff', 'jones', False)	1	[{"added": {}}]	9	1
54	2022-05-12 12:24:15.982617+02	6	(6, 'support2', 7, 'Bill', 'Doe', False)	2	[{"changed": {"fields": ["Client"]}}]	9	1
55	2022-05-12 12:25:48.360929+02	7	(7, 'support1', 6, 'Joe', 'Lee', True)	1	[{"added": {}}]	9	1
56	2022-05-17 16:00:42.273929+02	5	(5, 'sales2', 6, 'Joe', 'Lee', 876.0)	2	[{"changed": {"fields": ["SalesContact"]}}]	7	1
57	2022-05-18 11:04:45.219021+02	1	SalesGroup	2	[{"changed": {"fields": ["Permissions"]}}]	3	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	core	client
7	core	contract
8	core	status
9	core	event
10	users	user
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-05-05 14:59:39.700709+02
2	contenttypes	0002_remove_content_type_name	2022-05-05 14:59:39.713688+02
3	auth	0001_initial	2022-05-05 14:59:39.813034+02
4	auth	0002_alter_permission_name_max_length	2022-05-05 14:59:39.820031+02
5	auth	0003_alter_user_email_max_length	2022-05-05 14:59:39.829177+02
6	auth	0004_alter_user_username_opts	2022-05-05 14:59:39.835821+02
7	auth	0005_alter_user_last_login_null	2022-05-05 14:59:39.846649+02
8	auth	0006_require_contenttypes_0002	2022-05-05 14:59:39.84936+02
9	auth	0007_alter_validators_add_error_messages	2022-05-05 14:59:39.859364+02
10	auth	0008_alter_user_username_max_length	2022-05-05 14:59:39.867806+02
11	auth	0009_alter_user_last_name_max_length	2022-05-05 14:59:39.876338+02
12	auth	0010_alter_group_name_max_length	2022-05-05 14:59:39.887576+02
13	auth	0011_update_proxy_permissions	2022-05-05 14:59:39.896371+02
14	auth	0012_alter_user_first_name_max_length	2022-05-05 14:59:39.90337+02
15	users	0001_initial	2022-05-05 14:59:40.016473+02
16	admin	0001_initial	2022-05-05 14:59:40.066902+02
17	admin	0002_logentry_remove_auto_add	2022-05-05 14:59:40.076865+02
18	admin	0003_logentry_add_action_flag_choices	2022-05-05 14:59:40.086599+02
19	core	0001_initial	2022-05-05 14:59:40.179356+02
20	core	0002_initial	2022-05-05 14:59:40.259345+02
21	sessions	0001_initial	2022-05-05 14:59:40.293392+02
22	core	0003_alter_contract_salescontact	2022-05-12 10:21:15.202136+02
23	core	0004_alter_client_salescontact_and_more	2022-05-12 10:23:23.116119+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
r028rww039tlfphwtblqfh6unuywcu3n	.eJxVjDsOwjAQBe_iGllefxYvJX3OYPmLA8iW4qRC3B0ipYD2zcx7Mee3tbpt5MXNiV0YsNPvFnx85LaDdPft1nnsbV3mwHeFH3Twqaf8vB7u30H1o35rfRZAUSAZTChUiEVaQiCjbEBtgQRo0saWbGVRAiMmKIK01NJDKYa9P5yqNjc:1nrGw8:orAly35KLqJahQTsULu7gk7PkPsT1M1KBOBbs9VEqLA	2022-06-01 12:29:48.728001+02
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, "isAdmin", "isSale", "isSupport") FROM stdin;
3	pbkdf2_sha256$320000$bM0FBqcrguJ2veIx2Fzjdp$n65HZcBzK77MN8fYJccEpWVEUQQX/79xjPjKHFdzsX4=	2022-05-12 15:20:57.01513+02	f	sales2				f	t	2022-05-09 10:18:05+02	f	t	f
4	pbkdf2_sha256$320000$TbTM6zH3zoyXsD5coj9ImM$kE2fP/d9ABjhxn87GbCzgoSpC5rVY1g71isG0kq36wI=	2022-05-16 11:23:02.048255+02	f	support1				f	t	2022-05-09 10:18:26+02	f	f	t
2	pbkdf2_sha256$320000$azXBqL1ElGjNqjGwdmfkvw$DCSt5CHxvvXW2PVETlxTMa1L05GkejrgaBR4dhpSVDQ=	2022-05-18 11:22:15.202922+02	f	sales1				f	t	2022-05-09 10:17:24+02	f	t	f
1	pbkdf2_sha256$320000$4wrbU0f8LZNKtvNN3X3urO$3mXYUpr7UJTuJJGfjMBfdj/TNODKimXJqJnSENI06jQ=	2022-05-18 12:29:48.72394+02	t	admin	first_admin	last_admin	firstlast@epicevents.com	t	t	2022-05-05 15:00:57+02	t	f	f
5	pbkdf2_sha256$320000$KYIjtSEVlueoajkdvanz9w$ote21Vmi0qUf/9wARSxsA+Z0VkoZMG2mjEHvQeIuLcM=	2022-05-12 11:01:59.274284+02	f	support2				f	t	2022-05-09 10:18:47+02	f	f	t
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
1	2	1
2	3	1
3	4	2
4	5	2
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 12, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: core_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_client_id_seq', 10, true);


--
-- Name: core_contract_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_contract_id_seq', 8, true);


--
-- Name: core_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_event_id_seq', 10, true);


--
-- Name: core_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_status_id_seq', 3, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 57, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 4, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 5, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: core_client core_client_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_client
    ADD CONSTRAINT core_client_email_key UNIQUE (email);


--
-- Name: core_client core_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_client
    ADD CONSTRAINT core_client_pkey PRIMARY KEY (id);


--
-- Name: core_contract core_contract_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_contract
    ADD CONSTRAINT core_contract_pkey PRIMARY KEY (id);


--
-- Name: core_event core_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_event
    ADD CONSTRAINT core_event_pkey PRIMARY KEY (id);


--
-- Name: core_status core_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_status
    ADD CONSTRAINT core_status_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: core_client_email_326fcfc6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_client_email_326fcfc6_like ON public.core_client USING btree (email varchar_pattern_ops);


--
-- Name: core_client_salesContact_id_fa477bc8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "core_client_salesContact_id_fa477bc8" ON public.core_client USING btree ("salesContact_id");


--
-- Name: core_contract_client_id_9c2cc304; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_contract_client_id_9c2cc304 ON public.core_contract USING btree (client_id);


--
-- Name: core_contract_salesContact_id_5f3b6a54; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "core_contract_salesContact_id_5f3b6a54" ON public.core_contract USING btree ("salesContact_id");


--
-- Name: core_event_client_id_af854b4e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_event_client_id_af854b4e ON public.core_event USING btree (client_id);


--
-- Name: core_event_eventStatus_id_77cb68fd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "core_event_eventStatus_id_77cb68fd" ON public.core_event USING btree ("eventStatus_id");


--
-- Name: core_event_supportContact_id_56ad7052; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "core_event_supportContact_id_56ad7052" ON public.core_event USING btree ("supportContact_id");


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_client core_client_salesContact_id_fa477bc8_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_client
    ADD CONSTRAINT "core_client_salesContact_id_fa477bc8_fk_users_user_id" FOREIGN KEY ("salesContact_id") REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_contract core_contract_client_id_9c2cc304_fk_core_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_contract
    ADD CONSTRAINT core_contract_client_id_9c2cc304_fk_core_client_id FOREIGN KEY (client_id) REFERENCES public.core_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_contract core_contract_salesContact_id_5f3b6a54_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_contract
    ADD CONSTRAINT "core_contract_salesContact_id_5f3b6a54_fk_users_user_id" FOREIGN KEY ("salesContact_id") REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_event core_event_client_id_af854b4e_fk_core_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_event
    ADD CONSTRAINT core_event_client_id_af854b4e_fk_core_client_id FOREIGN KEY (client_id) REFERENCES public.core_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_event core_event_eventStatus_id_77cb68fd_fk_core_status_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_event
    ADD CONSTRAINT "core_event_eventStatus_id_77cb68fd_fk_core_status_id" FOREIGN KEY ("eventStatus_id") REFERENCES public.core_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_event core_event_supportContact_id_56ad7052_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_event
    ADD CONSTRAINT "core_event_supportContact_id_56ad7052_fk_users_user_id" FOREIGN KEY ("supportContact_id") REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

