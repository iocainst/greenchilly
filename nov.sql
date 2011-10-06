--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO lawgon;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO lawgon;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO lawgon;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO lawgon;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_message; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE auth_message (
    id integer NOT NULL,
    user_id integer NOT NULL,
    message text NOT NULL
);


ALTER TABLE public.auth_message OWNER TO lawgon;

--
-- Name: auth_message_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE auth_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_message_id_seq OWNER TO lawgon;

--
-- Name: auth_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE auth_message_id_seq OWNED BY auth_message.id;


--
-- Name: auth_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('auth_message_id_seq', 89, true);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO lawgon;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO lawgon;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('auth_permission_id_seq', 97, true);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    password character varying(128) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO lawgon;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO lawgon;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO lawgon;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO lawgon;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('auth_user_id_seq', 6, true);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO lawgon;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO lawgon;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO lawgon;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO lawgon;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 127, true);


--
-- Name: django_comment_flags; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE django_comment_flags (
    id integer NOT NULL,
    user_id integer NOT NULL,
    comment_id integer NOT NULL,
    flag character varying(30) NOT NULL,
    flag_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_comment_flags OWNER TO lawgon;

--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE django_comment_flags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_comment_flags_id_seq OWNER TO lawgon;

--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE django_comment_flags_id_seq OWNED BY django_comment_flags.id;


--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('django_comment_flags_id_seq', 1, false);


--
-- Name: django_comments; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE django_comments (
    id integer NOT NULL,
    content_type_id integer NOT NULL,
    object_pk text NOT NULL,
    site_id integer NOT NULL,
    user_id integer,
    user_name character varying(50) NOT NULL,
    user_email character varying(75) NOT NULL,
    user_url character varying(200) NOT NULL,
    comment text NOT NULL,
    submit_date timestamp with time zone NOT NULL,
    ip_address inet,
    is_public boolean NOT NULL,
    is_removed boolean NOT NULL
);


ALTER TABLE public.django_comments OWNER TO lawgon;

--
-- Name: django_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE django_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_comments_id_seq OWNER TO lawgon;

--
-- Name: django_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE django_comments_id_seq OWNED BY django_comments.id;


--
-- Name: django_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('django_comments_id_seq', 1, false);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO lawgon;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO lawgon;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('django_content_type_id_seq', 32, true);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO lawgon;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO lawgon;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO lawgon;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Name: web_course; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_course (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    shortname character varying(100) NOT NULL,
    description text,
    usga boolean NOT NULL
);


ALTER TABLE public.web_course OWNER TO lawgon;

--
-- Name: web_course_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_course_id_seq OWNER TO lawgon;

--
-- Name: web_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_course_id_seq OWNED BY web_course.id;


--
-- Name: web_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_course_id_seq', 5, true);


--
-- Name: web_currenthandicap; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_currenthandicap (
    id integer NOT NULL,
    member_id integer NOT NULL,
    handicap numeric(3,1) NOT NULL
);


ALTER TABLE public.web_currenthandicap OWNER TO lawgon;

--
-- Name: web_currenthandicap_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_currenthandicap_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_currenthandicap_id_seq OWNER TO lawgon;

--
-- Name: web_currenthandicap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_currenthandicap_id_seq OWNED BY web_currenthandicap.id;


--
-- Name: web_currenthandicap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_currenthandicap_id_seq', 77, true);


--
-- Name: web_draw; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_draw (
    id integer NOT NULL,
    tournament_id integer NOT NULL,
    day integer NOT NULL,
    groupsize integer NOT NULL,
    "interval" integer NOT NULL,
    done boolean NOT NULL,
    drawlist character varying(100)
);


ALTER TABLE public.web_draw OWNER TO lawgon;

--
-- Name: web_draw_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_draw_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_draw_id_seq OWNER TO lawgon;

--
-- Name: web_draw_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_draw_id_seq OWNED BY web_draw.id;


--
-- Name: web_draw_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_draw_id_seq', 24, true);


--
-- Name: web_handicap; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_handicap (
    id integer NOT NULL,
    player_id integer NOT NULL,
    handicap numeric(3,1) NOT NULL,
    valfrom date NOT NULL,
    valto date NOT NULL
);


ALTER TABLE public.web_handicap OWNER TO lawgon;

--
-- Name: web_handicap_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_handicap_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_handicap_id_seq OWNER TO lawgon;

--
-- Name: web_handicap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_handicap_id_seq OWNED BY web_handicap.id;


--
-- Name: web_handicap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_handicap_id_seq', 515, true);


--
-- Name: web_hole; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_hole (
    id integer NOT NULL,
    tee_id integer NOT NULL,
    number integer NOT NULL,
    par integer NOT NULL,
    strokeindex integer NOT NULL,
    yardage integer NOT NULL
);


ALTER TABLE public.web_hole OWNER TO lawgon;

--
-- Name: web_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_hole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_hole_id_seq OWNER TO lawgon;

--
-- Name: web_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_hole_id_seq OWNED BY web_hole.id;


--
-- Name: web_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_hole_id_seq', 90, true);


--
-- Name: web_matchentry; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_matchentry (
    id integer NOT NULL,
    tournament_id integer NOT NULL,
    player_id integer NOT NULL,
    tee_id integer NOT NULL,
    category character varying(1),
    round integer NOT NULL
);


ALTER TABLE public.web_matchentry OWNER TO lawgon;

--
-- Name: web_matchentry_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_matchentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_matchentry_id_seq OWNER TO lawgon;

--
-- Name: web_matchentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_matchentry_id_seq OWNED BY web_matchentry.id;


--
-- Name: web_matchentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_matchentry_id_seq', 1806, true);


--
-- Name: web_member; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_member (
    id integer NOT NULL,
    player_id integer NOT NULL
);


ALTER TABLE public.web_member OWNER TO lawgon;

--
-- Name: web_member_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_member_id_seq OWNER TO lawgon;

--
-- Name: web_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_member_id_seq OWNED BY web_member.id;


--
-- Name: web_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_member_id_seq', 275, true);


--
-- Name: web_partner; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_partner (
    id integer NOT NULL,
    member1_id integer NOT NULL,
    member2_id integer NOT NULL,
    tournament_id integer NOT NULL
);


ALTER TABLE public.web_partner OWNER TO lawgon;

--
-- Name: web_partner_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_partner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_partner_id_seq OWNER TO lawgon;

--
-- Name: web_partner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_partner_id_seq OWNED BY web_partner.id;


--
-- Name: web_partner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_partner_id_seq', 65, true);


--
-- Name: web_partnershiptrophy; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_partnershiptrophy (
    id integer NOT NULL,
    tournament_id integer NOT NULL,
    name character varying(100) NOT NULL,
    format character varying(2) NOT NULL,
    handicapmax integer NOT NULL,
    handicapmin integer NOT NULL
);


ALTER TABLE public.web_partnershiptrophy OWNER TO lawgon;

--
-- Name: web_partnershiptrophy_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_partnershiptrophy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_partnershiptrophy_id_seq OWNER TO lawgon;

--
-- Name: web_partnershiptrophy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_partnershiptrophy_id_seq OWNED BY web_partnershiptrophy.id;


--
-- Name: web_partnershiptrophy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_partnershiptrophy_id_seq', 10, true);


--
-- Name: web_player; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_player (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    homeclub_id integer NOT NULL,
    tee_id integer NOT NULL,
    photo character varying(100)
);


ALTER TABLE public.web_player OWNER TO lawgon;

--
-- Name: web_player_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_player_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_player_id_seq OWNER TO lawgon;

--
-- Name: web_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_player_id_seq OWNED BY web_player.id;


--
-- Name: web_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_player_id_seq', 575, true);


--
-- Name: web_practiceround; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_practiceround (
    id integer NOT NULL,
    rounddate date NOT NULL,
    member_id integer NOT NULL,
    tee_id integer NOT NULL,
    marker character varying(150) NOT NULL,
    scoretype character varying(2) NOT NULL,
    accepted boolean NOT NULL
);


ALTER TABLE public.web_practiceround OWNER TO lawgon;

--
-- Name: web_practiceround_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_practiceround_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_practiceround_id_seq OWNER TO lawgon;

--
-- Name: web_practiceround_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_practiceround_id_seq OWNED BY web_practiceround.id;


--
-- Name: web_practiceround_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_practiceround_id_seq', 517, true);


--
-- Name: web_pscore; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_pscore (
    id integer NOT NULL,
    practiceround_id integer NOT NULL,
    hole_id integer NOT NULL,
    score integer
);


ALTER TABLE public.web_pscore OWNER TO lawgon;

--
-- Name: web_pscore_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_pscore_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_pscore_id_seq OWNER TO lawgon;

--
-- Name: web_pscore_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_pscore_id_seq OWNED BY web_pscore.id;


--
-- Name: web_pscore_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_pscore_id_seq', 9177, true);


--
-- Name: web_round; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_round (
    id integer NOT NULL,
    startdate date NOT NULL,
    tournament_id integer NOT NULL,
    num integer NOT NULL
);


ALTER TABLE public.web_round OWNER TO lawgon;

--
-- Name: web_round_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_round_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_round_id_seq OWNER TO lawgon;

--
-- Name: web_round_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_round_id_seq OWNED BY web_round.id;


--
-- Name: web_round_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_round_id_seq', 11, true);


--
-- Name: web_score; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_score (
    id integer NOT NULL,
    matchentry_id integer NOT NULL,
    hole_id integer NOT NULL,
    score integer
);


ALTER TABLE public.web_score OWNER TO lawgon;

--
-- Name: web_score_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_score_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_score_id_seq OWNER TO lawgon;

--
-- Name: web_score_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_score_id_seq OWNED BY web_score.id;


--
-- Name: web_score_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_score_id_seq', 23814, true);


--
-- Name: web_scoringrecord; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_scoringrecord (
    id integer NOT NULL,
    scoredate date NOT NULL,
    member_id integer NOT NULL,
    tee_id integer NOT NULL,
    score integer NOT NULL,
    scoretype character varying(2) NOT NULL,
    sloperating integer NOT NULL,
    courserating numeric(3,1) NOT NULL
);


ALTER TABLE public.web_scoringrecord OWNER TO lawgon;

--
-- Name: web_scoringrecord_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_scoringrecord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_scoringrecord_id_seq OWNER TO lawgon;

--
-- Name: web_scoringrecord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_scoringrecord_id_seq OWNED BY web_scoringrecord.id;


--
-- Name: web_scoringrecord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_scoringrecord_id_seq', 5653, true);


--
-- Name: web_team; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_team (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    teamtrophy_id integer NOT NULL
);


ALTER TABLE public.web_team OWNER TO lawgon;

--
-- Name: web_team_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_team_id_seq OWNER TO lawgon;

--
-- Name: web_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_team_id_seq OWNED BY web_team.id;


--
-- Name: web_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_team_id_seq', 13, true);


--
-- Name: web_team_members; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_team_members (
    id integer NOT NULL,
    team_id integer NOT NULL,
    matchentry_id integer NOT NULL
);


ALTER TABLE public.web_team_members OWNER TO lawgon;

--
-- Name: web_team_members_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_team_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_team_members_id_seq OWNER TO lawgon;

--
-- Name: web_team_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_team_members_id_seq OWNED BY web_team_members.id;


--
-- Name: web_team_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_team_members_id_seq', 129, true);


--
-- Name: web_teamtrophy; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_teamtrophy (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    tournament_id integer NOT NULL,
    handlimit integer NOT NULL,
    best integer NOT NULL,
    format character varying(2) NOT NULL,
    CONSTRAINT web_teamtrophy_best_check CHECK ((best >= 0)),
    CONSTRAINT web_teamtrophy_handlimit_check CHECK ((handlimit >= 0))
);


ALTER TABLE public.web_teamtrophy OWNER TO lawgon;

--
-- Name: web_teamtrophy_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_teamtrophy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_teamtrophy_id_seq OWNER TO lawgon;

--
-- Name: web_teamtrophy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_teamtrophy_id_seq OWNED BY web_teamtrophy.id;


--
-- Name: web_teamtrophy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_teamtrophy_id_seq', 1, true);


--
-- Name: web_tee; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_tee (
    id integer NOT NULL,
    course_id integer NOT NULL,
    colour character varying(2) NOT NULL,
    description character varying(100) NOT NULL,
    sloperating integer NOT NULL,
    courserating numeric(4,1) NOT NULL
);


ALTER TABLE public.web_tee OWNER TO lawgon;

--
-- Name: web_tee_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_tee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_tee_id_seq OWNER TO lawgon;

--
-- Name: web_tee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_tee_id_seq OWNED BY web_tee.id;


--
-- Name: web_tee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_tee_id_seq', 6, true);


--
-- Name: web_teeoff; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_teeoff (
    id integer NOT NULL,
    draw_id integer NOT NULL,
    hole integer NOT NULL,
    starttime time without time zone NOT NULL,
    fourballs integer,
    threeballs integer,
    twoballs integer,
    singles integer,
    priority integer NOT NULL
);


ALTER TABLE public.web_teeoff OWNER TO lawgon;

--
-- Name: web_teeoff_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_teeoff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_teeoff_id_seq OWNER TO lawgon;

--
-- Name: web_teeoff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_teeoff_id_seq OWNED BY web_teeoff.id;


--
-- Name: web_teeoff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_teeoff_id_seq', 49, true);


--
-- Name: web_tempreg; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_tempreg (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    date date NOT NULL,
    code character varying(100)
);


ALTER TABLE public.web_tempreg OWNER TO lawgon;

--
-- Name: web_tempreg_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_tempreg_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_tempreg_id_seq OWNER TO lawgon;

--
-- Name: web_tempreg_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_tempreg_id_seq OWNED BY web_tempreg.id;


--
-- Name: web_tempreg_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_tempreg_id_seq', 1, false);


--
-- Name: web_tournament; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_tournament (
    id integer NOT NULL,
    startdate date NOT NULL,
    rounds integer NOT NULL,
    course_id integer NOT NULL,
    closed boolean NOT NULL
);


ALTER TABLE public.web_tournament OWNER TO lawgon;

--
-- Name: web_tournament_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_tournament_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_tournament_id_seq OWNER TO lawgon;

--
-- Name: web_tournament_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_tournament_id_seq OWNED BY web_tournament.id;


--
-- Name: web_tournament_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_tournament_id_seq', 31, true);


--
-- Name: web_trophy; Type: TABLE; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE TABLE web_trophy (
    id integer NOT NULL,
    tournament_id integer NOT NULL,
    name character varying(100) NOT NULL,
    format character varying(2) NOT NULL,
    handicapmax integer NOT NULL,
    handicapmin integer NOT NULL
);


ALTER TABLE public.web_trophy OWNER TO lawgon;

--
-- Name: web_trophy_id_seq; Type: SEQUENCE; Schema: public; Owner: lawgon
--

CREATE SEQUENCE web_trophy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_trophy_id_seq OWNER TO lawgon;

--
-- Name: web_trophy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lawgon
--

ALTER SEQUENCE web_trophy_id_seq OWNED BY web_trophy.id;


--
-- Name: web_trophy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lawgon
--

SELECT pg_catalog.setval('web_trophy_id_seq', 99, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE auth_message ALTER COLUMN id SET DEFAULT nextval('auth_message_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE django_comment_flags ALTER COLUMN id SET DEFAULT nextval('django_comment_flags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE django_comments ALTER COLUMN id SET DEFAULT nextval('django_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_course ALTER COLUMN id SET DEFAULT nextval('web_course_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_currenthandicap ALTER COLUMN id SET DEFAULT nextval('web_currenthandicap_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_draw ALTER COLUMN id SET DEFAULT nextval('web_draw_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_handicap ALTER COLUMN id SET DEFAULT nextval('web_handicap_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_hole ALTER COLUMN id SET DEFAULT nextval('web_hole_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_matchentry ALTER COLUMN id SET DEFAULT nextval('web_matchentry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_member ALTER COLUMN id SET DEFAULT nextval('web_member_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_partner ALTER COLUMN id SET DEFAULT nextval('web_partner_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_partnershiptrophy ALTER COLUMN id SET DEFAULT nextval('web_partnershiptrophy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_player ALTER COLUMN id SET DEFAULT nextval('web_player_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_practiceround ALTER COLUMN id SET DEFAULT nextval('web_practiceround_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_pscore ALTER COLUMN id SET DEFAULT nextval('web_pscore_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_round ALTER COLUMN id SET DEFAULT nextval('web_round_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_score ALTER COLUMN id SET DEFAULT nextval('web_score_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_scoringrecord ALTER COLUMN id SET DEFAULT nextval('web_scoringrecord_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_team ALTER COLUMN id SET DEFAULT nextval('web_team_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_team_members ALTER COLUMN id SET DEFAULT nextval('web_team_members_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_teamtrophy ALTER COLUMN id SET DEFAULT nextval('web_teamtrophy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_tee ALTER COLUMN id SET DEFAULT nextval('web_tee_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_teeoff ALTER COLUMN id SET DEFAULT nextval('web_teeoff_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_tempreg ALTER COLUMN id SET DEFAULT nextval('web_tempreg_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_tournament ALTER COLUMN id SET DEFAULT nextval('web_tournament_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lawgon
--

ALTER TABLE web_trophy ALTER COLUMN id SET DEFAULT nextval('web_trophy_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_message; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY auth_message (id, user_id, message) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add message	4	add_message
11	Can change message	4	change_message
12	Can delete message	4	delete_message
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add site	7	add_site
20	Can change site	7	change_site
21	Can delete site	7	delete_site
22	Can add comment	8	add_comment
23	Can change comment	8	change_comment
24	Can delete comment	8	delete_comment
25	Can moderate comments	8	can_moderate
26	Can add comment flag	9	add_commentflag
27	Can change comment flag	9	change_commentflag
28	Can delete comment flag	9	delete_commentflag
29	Can add tempreg	10	add_tempreg
30	Can change tempreg	10	change_tempreg
31	Can delete tempreg	10	delete_tempreg
32	Can add course	11	add_course
33	Can change course	11	change_course
34	Can delete course	11	delete_course
35	Can add tee	12	add_tee
36	Can change tee	12	change_tee
37	Can delete tee	12	delete_tee
38	Can add hole	13	add_hole
39	Can change hole	13	change_hole
40	Can delete hole	13	delete_hole
41	Can add tournament	14	add_tournament
42	Can change tournament	14	change_tournament
43	Can delete tournament	14	delete_tournament
44	Can add trophy	15	add_trophy
45	Can change trophy	15	change_trophy
46	Can delete trophy	15	delete_trophy
47	Can add player	16	add_player
48	Can change player	16	change_player
49	Can delete player	16	delete_player
50	Can add handicap	17	add_handicap
51	Can change handicap	17	change_handicap
52	Can delete handicap	17	delete_handicap
53	Can add draw	18	add_draw
54	Can change draw	18	change_draw
55	Can delete draw	18	delete_draw
56	Can add teeoff	19	add_teeoff
57	Can change teeoff	19	change_teeoff
58	Can delete teeoff	19	delete_teeoff
59	Can add matchentry	20	add_matchentry
60	Can change matchentry	20	change_matchentry
61	Can delete matchentry	20	delete_matchentry
62	Can add score	21	add_score
63	Can change score	21	change_score
64	Can delete score	21	delete_score
65	Can add log entry	22	add_logentry
66	Can change log entry	22	change_logentry
67	Can delete log entry	22	delete_logentry
68	Can add member	23	add_member
69	Can change member	23	change_member
70	Can delete member	23	delete_member
71	Can add practiceround	24	add_practiceround
72	Can change practiceround	24	change_practiceround
73	Can delete practiceround	24	delete_practiceround
74	Can add pscore	25	add_pscore
75	Can change pscore	25	change_pscore
76	Can delete pscore	25	delete_pscore
77	Can add scoringrecord	26	add_scoringrecord
78	Can change scoringrecord	26	change_scoringrecord
79	Can delete scoringrecord	26	delete_scoringrecord
80	Can add teamtrophy	27	add_teamtrophy
81	Can change teamtrophy	27	change_teamtrophy
82	Can delete teamtrophy	27	delete_teamtrophy
83	Can add team	28	add_team
84	Can change team	28	change_team
85	Can delete team	28	delete_team
86	Can add partnershiptrophy	29	add_partnershiptrophy
87	Can change partnershiptrophy	29	change_partnershiptrophy
88	Can delete partnershiptrophy	29	delete_partnershiptrophy
89	Can add partner	30	add_partner
90	Can change partner	30	change_partner
91	Can delete partner	30	delete_partner
92	Can add round	31	add_round
93	Can change round	31	change_round
94	Can delete round	31	delete_round
95	Can add currenthandicap	32	add_currenthandicap
96	Can change currenthandicap	32	change_currenthandicap
97	Can delete currenthandicap	32	delete_currenthandicap
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY auth_user (id, username, first_name, last_name, email, password, is_staff, is_active, is_superuser, last_login, date_joined) FROM stdin;
2	shyamsunder				sha1$64a9a$0e21400521965833d2db3520bbbc876ec0b3ad24	f	t	f	2010-02-19 06:53:52.480964+00	2010-02-17 07:48:53.154312+00
5	kostia				sha1$4a4c4$f374ab34ea613871f178ed9237fd64acca8e44ee	f	t	f	2010-08-12 11:23:02.344863+00	2010-08-12 11:19:24.548016+00
4	alwin				sha1$807f0$84a41be976e74e1cd4f065f00f18792232723a6c	f	t	f	2010-09-27 10:51:02.487888+00	2010-05-11 09:27:24.580036+00
1	lawgon			lawgon@thenilgiris.com	sha1$d0b6c$768a556fc3b2eceaf23b5f799b3edc99897760c0	t	t	t	2010-10-20 10:14:23.242365+00	2010-02-17 07:47:22.181403+00
6	pathy				sha1$3849c$717c7d6a19c0c726c66a8d1767c68e81610d4298	f	t	f	2010-11-03 11:48:24.755696+00	2010-09-29 06:52:08+00
3	princey				sha1$77eb3$8ff41d98e030c3aec4122bfa52df11720275ace4	f	t	f	2010-11-03 11:52:11.346596+00	2010-02-17 10:06:50.457756+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2010-02-17 07:48:53.172243+00	1	3	2	shyamsunder	1	
2	2010-02-17 10:06:50.464652+00	1	3	3	princey	1	
3	2010-02-19 08:12:02.082318+00	1	18	1	ogc: Ootacamund Gymkhana club 2010-02-20: rounds: 1 closed:False: Day 1	3	
4	2010-02-19 08:16:13.40631+00	1	18	2	ogc: Ootacamund Gymkhana club 2010-02-20: rounds: 1 closed:False: Day 1	3	
5	2010-02-19 08:43:09.904665+00	1	18	3	ogc: Ootacamund Gymkhana club 2010-02-20: rounds: 1 closed:False: Day 1	3	
6	2010-02-19 08:49:59.288974+00	1	18	4	ogc: Ootacamund Gymkhana club 2010-02-20: rounds: 1 closed:False: Day 1	3	
7	2010-03-04 10:57:40.171935+00	1	23	2	P.B.H Pawar	3	
8	2010-03-04 11:05:36.128559+00	1	11	1	ogc: Ootacamund Gymkhana club	2	Changed usga.
9	2010-03-22 06:03:35.530729+00	1	15	10	Dr Velappan memorial trophy max 24 strokes: ogc: Ootacamund Gymkhana club 2010-03-21: rounds: 1 closed:False	2	Changed name.
10	2010-03-22 06:04:12.378948+00	1	15	9	velappan 2: ogc: Ootacamund Gymkhana club 2010-03-21: rounds: 1 closed:False	3	
11	2010-03-22 06:04:12.497086+00	1	15	8	velappan  1: ogc: Ootacamund Gymkhana club 2010-03-21: rounds: 1 closed:False	3	
12	2010-03-22 06:04:35.588039+00	1	15	7	Dr Velappan trophy: ogc: Ootacamund Gymkhana club 2010-03-21: rounds: 1 closed:False	2	Changed name.
13	2010-03-22 06:08:30.344685+00	1	14	3	ogc: Ootacamund Gymkhana club 2010-03-21: rounds: 1 closed:False	2	Changed closed.
14	2010-03-23 10:56:59.020049+00	1	20	125	Mr. Steive: ogc: Ootacamund Gymkhana club 2010-03-21: rounds: 1 closed:False	3	
15	2010-03-23 10:56:59.172572+00	1	20	109	N Ramachandran: ogc: Ootacamund Gymkhana club 2010-03-21: rounds: 1 closed:False	3	
16	2010-03-23 10:56:59.174669+00	1	20	96	P Rangaswamy: ogc: Ootacamund Gymkhana club 2010-03-21: rounds: 1 closed:False	3	
17	2010-03-27 10:13:47.772056+00	1	24	131	M.P George: date 2010-03-21	3	
18	2010-03-27 10:13:49.688649+00	1	24	130	K.B Nanda: date 2010-03-21	3	
19	2010-03-27 10:13:49.691173+00	1	24	129	Zubair  Sait: date 2010-03-21	3	
20	2010-03-27 10:13:49.692977+00	1	24	128	Vijay prabhu: date 2010-03-21	3	
21	2010-03-27 10:13:49.694843+00	1	24	127	Murali Khemchand: date 2010-03-21	3	
22	2010-03-27 10:13:49.696548+00	1	24	126	N somasunder: date 2010-03-21	3	
23	2010-03-27 10:13:49.698293+00	1	24	125	N.K Mahesh: date 2010-03-21	3	
24	2010-03-27 10:13:49.700025+00	1	24	124	N.K Perumal: date 2010-03-21	3	
25	2010-03-27 10:13:49.701679+00	1	24	123	B.D Murali: date 2010-03-21	3	
26	2010-03-27 10:13:49.703536+00	1	24	122	Nitin  Suresh: date 2010-03-21	3	
27	2010-03-27 10:13:49.705335+00	1	24	121	P Suresh: date 2010-03-21	3	
28	2010-03-27 10:13:49.707046+00	1	24	120	Kenneth  Gonsalves: date 2010-03-21	3	
29	2010-03-27 10:13:49.708815+00	1	24	119	K Krishnakumar: date 2010-03-21	3	
30	2010-03-27 10:13:49.710543+00	1	24	118	R Veluswamy: date 2010-03-21	3	
31	2010-04-15 07:30:56.043248+00	1	20	158	Manthrachalam K: ogc: Ootacamund Gymkhana club 2010-04-16: rounds: 1 closed:False	3	
32	2010-04-15 07:30:56.197275+00	1	20	135	Viswanathan S: ogc: Ootacamund Gymkhana club 2010-04-16: rounds: 1 closed:False	3	
33	2010-04-15 07:30:56.199443+00	1	20	134	Kumaraswamy P: ogc: Ootacamund Gymkhana club 2010-04-16: rounds: 1 closed:False	3	
34	2010-04-15 07:30:56.201412+00	1	20	130	Pawar P.B.H: ogc: Ootacamund Gymkhana club 2010-04-16: rounds: 1 closed:False	3	
35	2010-04-17 22:46:36.954171+00	1	14	5	ogc: Ootacamund Gymkhana club 2010-04-17: rounds: 1 closed:False	2	Changed closed.
36	2010-04-17 22:52:17.187015+00	1	14	5	ogc: Ootacamund Gymkhana club 2010-04-17: rounds: 1 closed:True	2	Changed closed.
37	2010-04-25 08:38:22.452379+00	1	21	5910	Col CB Ponnappa .: ogc: Ootacamund Gymkhana club 2010-04-25: rounds: 1 closed:False: score 7	2	Changed score.
38	2010-04-26 06:40:07.050318+00	1	17	106	Sriram N. 17.0 2010-04-01 2010-04-17	3	
39	2010-04-26 06:42:32.940355+00	1	17	144	Sriram N. 16.0 2010-04-01 2010-04-30	2	Changed valfrom.
40	2010-05-01 09:02:32.123836+00	1	14	11	ogc: Ootacamund Gymkhana club 2010-05-01: rounds: 1 closed:False	2	Changed closed.
41	2010-05-11 09:27:24.719649+00	1	3	4	alwin	1	
42	2010-05-14 09:37:06.885637+00	1	30	4	Gopinath R & Ramakrishna V.	2	Changed member2.
43	2010-05-14 09:39:42.959997+00	1	30	20	Zubair  Sait . & Mohan Nambiar N.	2	Changed member2.
44	2010-05-14 09:42:26.134805+00	1	30	34	Sivakumar Mandradiar . & Somasunder N	2	Changed member2.
45	2010-05-15 06:58:57.354818+00	1	30	20	Zubair  Sait . & Rajendran V	2	Changed member2.
46	2010-05-25 05:32:51.673134+00	1	14	21	ogc: Ootacamund Gymkhana club 2010-05-22: rounds: 2 closed:True	2	Changed closed.
47	2010-05-25 05:32:59.308256+00	1	14	22	ogc: Ootacamund Gymkhana club 2010-05-23: rounds: 1 closed:True	2	Changed closed.
48	2010-06-17 04:33:29.564064+00	1	16	6	Kenneth  Gonsalves .	2	Changed photo.
49	2010-06-22 09:47:40.460317+00	1	23	79	Bharath Ram S.	2	Changed player.
50	2010-06-22 09:51:02.479895+00	1	23	69	Aswin chandran .	2	Changed player.
51	2010-06-22 09:54:35.067886+00	1	23	175	Rajendran V	2	Changed player.
52	2010-06-22 09:57:50.52115+00	1	23	127	Aruna Kulandaivel Mrs.	2	Changed player.
53	2010-06-22 10:12:18.286458+00	1	23	86	Chinnaswamy V	2	Changed player.
54	2010-06-22 10:13:02.44396+00	1	23	104	Goutham Selvaraj .	2	Changed player.
55	2010-06-22 10:13:41.401492+00	1	23	117	Joseph J Chakola .	2	Changed player.
56	2010-06-22 10:16:03.543497+00	1	23	131	LAKSHMINARAYANASWAMY  D 	3	
57	2010-06-22 10:16:27.157446+00	1	23	120	Kandavadivel K	2	Changed player.
58	2010-06-22 10:17:13.150006+00	1	23	135	Manthrachalam K	2	Changed player.
59	2010-06-22 10:18:16.997432+00	1	23	138	Mohan Nambiar N.	2	Changed player.
60	2010-06-22 10:18:38.052042+00	1	23	136	MEIYAPPAN RAMASWAMY  . 	3	
61	2010-06-22 10:19:31.270115+00	1	23	150	Naren Kumar V.R	2	Changed player.
62	2010-06-22 10:21:16.624804+00	1	23	160	PAWAR  P B H 	3	
63	2010-06-22 11:15:57.291924+00	1	23	115	JOHN KURIYAN  M 	3	
64	2010-06-22 11:16:13.370338+00	1	23	134	MANOHARAN   V  	3	
65	2010-06-22 11:18:20.418106+00	1	23	123	KONDASWAMY NAIDU  .	3	
66	2010-06-22 11:19:07.857591+00	1	23	130	Kumaraswamy P	2	Changed player.
67	2010-06-22 11:19:46.212039+00	1	23	43	MEIYAPPAN RAMASWAMY  M 	3	
68	2010-06-22 11:20:51.498802+00	1	23	162	Peeyush  Dr	2	Changed player.
69	2010-06-22 11:23:10.57792+00	1	23	166	Raamprasad Kota D	2	Changed player.
70	2010-06-22 11:24:06.731632+00	1	23	167	Ragavender Naidu .	2	Changed player.
71	2010-06-22 11:24:44.82777+00	1	23	163	Prabhakar V.S	2	Changed player.
72	2010-06-22 11:25:23.156974+00	1	23	174	Rajendran L.S	2	Changed player.
73	2010-06-22 11:26:02.406137+00	1	23	185	Ramakrishna V.	2	Changed player.
74	2010-06-22 11:26:32.285127+00	1	23	184	Ramachandran N	2	Changed player.
75	2010-06-22 11:27:18.773161+00	1	23	201	Sandy Camaroon .	2	Changed player.
76	2010-06-22 11:28:34.284148+00	1	23	206	Satish Balagopal .	2	Changed player.
77	2010-06-22 11:29:28.074413+00	1	23	220	Sivakumar Mandradiar .	2	Changed player.
78	2010-06-22 11:53:28.324507+00	1	23	186	Ramakrishnan P.R	2	Changed player.
79	2010-06-22 11:54:08.452405+00	1	23	187	Ramamoorthy A	2	Changed player.
80	2010-06-22 11:54:35.293552+00	1	23	178	Rajkumar Davidar .	2	Changed player.
81	2010-06-22 11:56:46.704683+00	1	23	224	Sounderrajan N	2	Changed player.
82	2010-06-22 13:02:53.890512+00	1	23	229	Sridhar S.A	2	Changed player.
83	2010-06-22 13:03:14.347098+00	1	23	231	Srinivasan Dr.K.V	2	Changed player.
84	2010-06-22 13:03:44.026297+00	1	23	233	Subramaniam N.	2	Changed player.
85	2010-06-22 13:04:13.127589+00	1	23	237	Suchindran M.R	2	Changed player.
86	2010-06-22 13:04:41.725445+00	1	23	238	Sudhev Sivakumar .	2	Changed player.
87	2010-06-22 13:05:11.970965+00	1	23	235	Subaramaniam K	2	Changed player.
88	2010-06-22 13:05:36.838502+00	1	23	241	Sunku Radesh Kumar .	2	Changed player.
89	2010-06-22 13:06:41.179078+00	1	23	236	Subramaniam V.	2	Changed player.
90	2010-06-22 13:07:26.186059+00	1	23	243	Surendran A	2	Changed player.
91	2010-06-22 13:08:36.256424+00	1	23	246	Suryakumar K	2	Changed player.
92	2010-06-22 13:09:06.209715+00	1	23	226	Thirumoorthi R.A	2	Changed player.
93	2010-06-22 13:09:45.427939+00	1	23	252	Vashista Pawar .	2	Changed player.
94	2010-06-22 13:10:30.951973+00	1	23	264	Vijaya Kumhar R.	2	Changed player.
95	2010-06-22 13:11:00.551978+00	1	23	253	Venkatachalam S.	2	Changed player.
96	2010-06-22 13:11:40.194515+00	1	23	269	Viswanathan S	2	Changed player.
97	2010-06-22 13:19:36.587683+00	1	16	358	BHARATH RAM  S 	3	
98	2010-06-22 13:19:36.58967+00	1	16	365	CHINNASWAMY  V 	3	
99	2010-06-22 13:21:55.727823+00	1	16	185	MEIYAPPAN RAMASWAMY  M 	3	
100	2010-06-22 13:21:55.729915+00	1	16	514	SUBRAMANIAM  N 	3	
101	2010-06-22 13:21:55.739336+00	1	16	515	SUCHINDRAN  M R 	3	
102	2010-06-22 13:21:55.740275+00	1	16	516	SUDHEV  SIVAKUMAR  .	3	
103	2010-06-22 13:21:55.741189+00	1	16	519	SUNKU  RADESH  KUMAR  .	3	
104	2010-06-22 13:21:55.742151+00	1	16	521	SURENDRAN  A 	3	
105	2010-06-22 13:21:55.743109+00	1	16	524	SURYA KUMAR  .	3	
106	2010-06-22 13:21:55.744031+00	1	16	526	THIRUMOORTI  R A 	3	
107	2010-06-22 13:21:55.744944+00	1	16	532	VASHISTA  S  PAWAR  .	3	
108	2010-06-22 13:21:55.745861+00	1	16	533	VENKATACHALAM  S 	3	
109	2010-06-22 13:23:55.130453+00	1	16	379	GOPINATH  R 	3	
110	2010-06-22 13:23:55.13242+00	1	16	381	GAUTHAM SELVARAJ  .	3	
111	2010-06-22 13:23:55.133401+00	1	16	393	JOSEPH CHAKOLA  S R 	3	
112	2010-06-22 13:23:55.13438+00	1	16	396	KANDAVADIVEL  K 	3	
113	2010-06-22 13:23:55.13536+00	1	16	400	KONDASWAMY NAIDU  .	3	
114	2010-06-22 13:23:55.136323+00	1	16	404	KULANDAIVELU A  MRS 	3	
115	2010-06-22 13:23:55.138127+00	1	16	407	KUMARASWAMY  P 	3	
116	2010-06-22 13:23:55.139158+00	1	16	412	MANTHRACHALAM  K 	3	
117	2010-06-22 13:23:55.140106+00	1	16	415	MOHAN NAMBIAR  N 	3	
118	2010-06-22 13:23:55.141048+00	1	16	427	NAREN KUMAR  V R 	3	
119	2010-06-22 13:27:53.754483+00	1	16	544	VIJAYAKUMHAR  R 	3	
120	2010-06-22 13:27:53.756545+00	1	16	549	VISWANATHAN  S 	3	
121	2010-06-22 13:28:59.019824+00	1	23	128	Kulandaivel V.S	2	Changed player.
122	2010-06-22 13:36:18.2658+00	1	16	408	LAKSHMINARAYANASWAMY  D 	3	
123	2010-06-22 13:36:18.267733+00	1	16	413	MEIYAPPAN RAMASWAMY  . 	3	
124	2010-06-22 13:52:29.365278+00	1	16	406	KUMARASWAMY  K 	3	
125	2010-08-12 11:19:24.57273+00	1	3	5	kostia	1	
126	2010-09-29 06:52:08.458509+00	1	3	6	pathy	1	
127	2010-09-29 06:52:30.55829+00	1	3	6	pathy	2	No fields changed.
\.


--
-- Data for Name: django_comment_flags; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY django_comment_flags (id, user_id, comment_id, flag, flag_date) FROM stdin;
\.


--
-- Data for Name: django_comments; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY django_comments (id, content_type_id, object_pk, site_id, user_id, user_name, user_email, user_url, comment, submit_date, ip_address, is_public, is_removed) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	message	auth	message
5	content type	contenttypes	contenttype
6	session	sessions	session
7	site	sites	site
8	comment	comments	comment
9	comment flag	comments	commentflag
10	tempreg	web	tempreg
11	course	web	course
12	tee	web	tee
13	hole	web	hole
14	tournament	web	tournament
15	trophy	web	trophy
16	player	web	player
17	handicap	web	handicap
18	draw	web	draw
19	teeoff	web	teeoff
20	matchentry	web	matchentry
21	score	web	score
22	log entry	admin	logentry
23	member	web	member
24	practiceround	web	practiceround
25	pscore	web	pscore
26	scoringrecord	web	scoringrecord
27	teamtrophy	web	teamtrophy
28	team	web	team
29	partnershiptrophy	web	partnershiptrophy
30	partner	web	partner
31	round	web	round
32	currenthandicap	web	currenthandicap
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
05c855ede9eb4df66dd871710fa1414e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-04 06:06:37.362704+00
ff65113be656b153909c7074a3ed7d0e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-04 07:41:40.352392+00
31b0ed8c063cb7aa14745739ac7b5bbc	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-04 10:27:16.336401+00
f8099611207e0cdc86ac2ea1880caeca	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-04 15:20:35.811462+00
661b07fd1cb8af8ff9b973613745dd06	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-04 17:37:13.468643+00
fa863454a0680ecaace9c74314b2fb82	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-04 18:39:26.467835+00
936ab06ce36f44c6b98ff67865e41803	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-04 22:25:03.767043+00
816aec8f6c4875f17305fb159ff3a63f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-03 11:52:24.185793+00
f773bb4e3329d004ccde7147437b6995	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-09 05:43:07.468475+00
eda56123eb44546cd406a97c11fb475c	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-05 10:12:57.946659+00
9a7454d69037acfbb653bc91b2797cc5	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-09 05:59:05.735464+00
6f1fb02795bcfd9e46e4af01476cf646	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-04 14:12:56.896198+00
7995550f83b0948835ec503c3a039876	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-09 11:08:59.344725+00
c13ffebf24632535171c2da01bf19d9c	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-05 14:39:29.661469+00
88247ac28ddf359085688a9dbfea6fa7	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-05 17:07:20.816711+00
18ef4ad6a15036df500f95d295a41e28	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-10 05:32:29.920748+00
2787911ea1e4f8987b482b7769b58221	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-06 08:11:07.93769+00
1aaab8dd36842d1ccbfaee7ea13b5965	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-10 21:51:52.871009+00
d828459ace331b82ad91d186c94aea88	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-05 04:49:29.852711+00
d5c72951fa64eaeaa67ac2288027a308	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-10 23:41:06.178534+00
423d5124d1c7f4c34df27413d3abbc90	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjUxZTJhOGEwZTExZWU5YTU4Yzll\nYzgzYTQ3ZjZhNzg0\n	2010-03-03 07:55:07.344067+00
5c629b9a6eed330a6efef323122dce43	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-11 01:30:21.464946+00
eadd85727f1eb8a671a423a50de28593	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwJ1LmY5OTlmZDg5ZmZkZGM4NzI4MmUx\nZjE4YTE5ZThmYTc2\n	2010-03-05 06:53:52.669334+00
fd5041c18b7d34877579e5ec6dcf865d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-11 05:40:01.161013+00
73f55bd190262bf33ef3050291353233	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-07 07:14:24.016926+00
678220754affe998205450e56b260dcc	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-21 12:43:55.093301+00
db5ee5951433705bac33c916368b7fd4	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-22 14:37:45.110867+00
4bcb3ce51ea99d16519f179b80b06020	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-05 07:22:59.899984+00
3cfe296277c3765e646203b10a19c946	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-11 06:09:03.319359+00
0ac9b05cec18a05df3b08419ca11638e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-11 06:39:54.267384+00
71ad66d050f0663cc7199d44019c50f3	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-11 07:44:51.631843+00
f1a54e31e8a4b2ab27340715f664e94d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-11 07:55:33.329729+00
ac652b27bca4e4b33f19c2a817124d41	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-11 09:11:50.334618+00
f51bb1eb0e167db36408e4d3fa7860d4	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-11 09:15:09.76109+00
7ccb33ad93704788a498382bfb10b104	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-11 11:54:28.270729+00
673ccb0305e332631c6a10564c7b5aef	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-11 15:25:28.69025+00
834489b4056c92a35188da9f024d7e52	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-11 16:23:57.454654+00
02eb0b9930ce5ceb47a316be6589b2b4	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-11 20:20:13.80377+00
84b1186ded7ca36d3845180dd5b1ff7f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-11 23:29:27.405822+00
b5f12f024f797d5149eeefb304c86ff6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-12 02:12:43.853886+00
f565faa00a7c45262826aa04d4d361d6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-12 12:16:39.52862+00
65d9bb0a75618c6277634de7d7e1dd95	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-12 09:29:19.82448+00
ca7eeb45f2a8c74cb1785b822d75b585	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-12 16:34:07.083153+00
6caebb285e334499fc65b78004d1699a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-14 14:11:34.964076+00
9df423834e004b96fb98c65bbaecc374	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-13 08:12:33.654026+00
b59864708a9588fcde7dbe5515245e32	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-14 17:00:54.549099+00
35612b226b800a810998cec9e35dd343	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-14 21:53:29.533486+00
a753ff9d7daebad2c3aa7d888732c999	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-15 04:45:42.594913+00
46d8dda277b6161fad798387d50d5dab	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-15 06:28:47.496679+00
423c59d2a5cde30cd369822a8d97cdd7	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-15 09:54:53.123345+00
1237bbe440d283cd4a9c06ac6a5a3226	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-15 10:52:39.033789+00
023c68dcff00ceece151c192a0c54198	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-15 14:38:16.961287+00
562011da74e9574ef1da3e6ca2fdbadb	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-17 07:53:07.410106+00
55695b7d610f3ceb10ed5367a127754b	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-17 08:47:21.186638+00
289571bdc4e19cb27978b3bb5c958b1e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-16 13:38:25.545516+00
8655d14f515f9186d4c4704d7ad3e5ae	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-17 18:05:10.774105+00
8d3125f65293ac6a38951ddf0e64e51c	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-15 11:25:54.95656+00
672c16b040eb0cf3c128ac637fbe8d3c	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-15 14:12:29.172514+00
38342d01487e36978f6933b3a82270f0	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-17 21:08:33.239425+00
b48684ddcf3e937a5112866efa49486b	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-18 00:11:51.893+00
24aace666deca196038cd5fd4e976e7d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-18 07:47:39.012187+00
56000f880f241f4fb5b58348e2e05018	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-18 08:06:25.33373+00
50a450e9d04b40d860c06a100d7cf70d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-19 07:06:10.897625+00
4464d74cefdad758712f1e4dee78bd7e	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjUxZTJhOGEwZTExZWU5YTU4Yzll\nYzgzYTQ3ZjZhNzg0\n	2010-03-18 10:41:09.794811+00
ca8a058f34dfd512fe52e90b55d4294f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-20 03:45:31.389838+00
36a2397107b6fbf95516ca3c35362961	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-20 06:31:40.100686+00
bb5f3dd66130ba07057771a410a894b4	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-19 11:23:32.5301+00
afce97c175d1d269c18cb6eac9e3ee78	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-27 13:06:55.276576+00
d99ac6439d6fd3d342ce2652616e68ce	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-02 13:23:22.378587+00
6babc75891a1aba2ada2b2d802341e05	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-22 02:04:15.810003+00
210e8e011123ee2267da83c644749922	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-23 02:28:27.037137+00
2237a46c1075608d86b469117398b1d5	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-20 08:16:31.627494+00
a233cb0f72b981713c9349d5d8bafbf7	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-24 13:12:27.65197+00
342735c77afebde1256f458395d6e75a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-25 08:42:43.148916+00
4374d486fafa17be17b42bde637d07db	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-25 14:00:28.381755+00
55920781691496dad8725f538c2ca0f0	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-03-20 09:22:07.780534+00
bda40b6354fdacb1c74fc10b5d75c662	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-25 20:54:10.077999+00
33bd0e41c0fd303382fe34cd7bbd8422	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-03-20 09:26:24.558022+00
bc92bbd75aead12bf6755bf419c98ce6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-25 22:21:10.165649+00
3a98d12a3b461b87ec6f7d823d7b3cc0	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-26 01:33:37.126954+00
cb76ca39a0df8dabc333cf019090ef18	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-26 04:52:20.848197+00
012fe85a1e2537f67888619ce5903b5c	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-26 07:46:05.405907+00
6342ad79f9fc98ed48ce9f082ae7201d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-29 17:42:39.329158+00
72e60148439ed5d8963148be2b006c4f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-30 01:33:19.348957+00
d393057e3e2468dfeb817f1cfb9c3d97	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-29 09:10:33.188131+00
f20d0f3a024d82b9f30b81f0714ee0cf	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-30 14:47:22.113297+00
13d9b9c50423acac56fc84037640571d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-30 18:04:23.908964+00
2be7c6ca1390bb20ecbb91828642be40	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjUxZTJhOGEwZTExZWU5YTU4Yzll\nYzgzYTQ3ZjZhNzg0\n	2010-03-26 12:05:13.131678+00
ecd83db67890f32295f5fb33e44e5fd2	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-26 14:08:15.623074+00
60af2d209f801b50d1445173b6dcccc7	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-26 14:09:17.420618+00
f35b32a10479e108c686fdf9d7df7fae	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-30 22:20:50.459399+00
e301db6e5b55e2e20dbc808f55cfc523	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-31 19:54:54.647518+00
4b1014f5133d843cfb6bea4900eabab6	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjUxZTJhOGEwZTExZWU5YTU4Yzll\nYzgzYTQ3ZjZhNzg0\n	2010-03-30 08:41:21.859557+00
e6bf2ab60b75a015b38dac67ee2caaa9	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-31 19:54:54.803982+00
98c044c6268479a3f67065780392ace1	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-31 19:54:54.934562+00
84be5b350145c0cf2ef3752f6516a991	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-31 19:54:55.057051+00
bd426c40aeff3b9673e8040a9fd49ce4	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-31 19:54:55.25395+00
8921a0fe2c8c573aa77b5464a5180622	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-31 19:54:55.377551+00
a1696cbdcebc4732d5989c7b29555254	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-03-31 23:47:49.022373+00
8dc914ac90f017a29fc15459ed2af8db	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-01 03:11:25.889275+00
36e90915582eb1fa2b25ad2965f79908	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-01 07:25:59.522114+00
b63ac7d68795e38e664be8e057b9a75f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-01 14:06:47.438053+00
0551ed63562fffb35f355dde0a9606fe	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-02 17:45:18.117145+00
6caaa5403766d323c282b018558ac87d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-02 23:23:01.237324+00
5928d136b54a70df648ded63e0b01e01	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-03 13:31:16.670621+00
fb253a7af01d468219337ab5eae3626c	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjUxZTJhOGEwZTExZWU5YTU4Yzll\nYzgzYTQ3ZjZhNzg0\n	2010-04-02 06:27:48.273165+00
b4630e3ef566098a2af09baac0ddb90e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-04 05:27:33.037147+00
088f901009c15a3afa3a3fb01652ac91	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-05 00:53:24.742087+00
36402f797b89bb2396cd395bc63e6ac4	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-05 03:25:19.143204+00
711698aff34436c7a53fb7eb39a4911f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-06 00:51:08.948672+00
c3628de9cc7398ae53f41b24cf9613e5	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-06 05:09:07.409347+00
5db5f0211475fe18df4e78bd1dc02552	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-04-14 09:46:24.345748+00
93ec5d55c58077347353602c49a088f3	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-06 12:03:06.378562+00
3a95fd0c892637d734bcb3b79f3aacd2	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-07 00:09:37.116268+00
97e1e26ac3f04ff9dde967fe2df020df	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-07 14:41:29.257789+00
dc7a01a9b9b25f13d16a5d91775f71ff	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-07 22:02:25.072772+00
4f4b9b7960f02fa7da0a14948d46aea5	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-08 04:31:18.78366+00
b2e29ae443b1ed451a1926f255817a91	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-09 02:25:18.194439+00
2061e6be07ae2585d96af69b77f7de73	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-10 13:13:05.935617+00
9b9773f5973f0f0e5f3fd4a287520a48	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-12 00:52:27.582292+00
6dc7766d1ea9a6114280ea770c922ca6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-12 16:38:30.750982+00
c9b55e707615b5270fa3dbc30d904355	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-10 18:10:59.461732+00
78ffe4ca60ffff5d5420e35e67a811f3	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-11 12:58:30.794081+00
901e6567946e73a395b2f422845e1ae2	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-13 06:22:59.984444+00
92fdb3a240f46589bd4f144faeee93a0	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-13 10:38:33.252013+00
ec8ab715699effd2bf1cf6294390f8a6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-13 15:14:36.628563+00
7c76fda8e697873e68d98c9f57556184	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-14 07:08:29.060155+00
44c5361dbda49d1d39ac718952386709	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-15 12:59:56.806877+00
41387bd98f14242c96f28a3b7993674b	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-17 04:41:07.750702+00
56492cbde06d5e75ab66f34d7adf66fb	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-18 16:42:19.418428+00
91db01ca8b249e6382bfb782cdc83f97	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-19 05:28:34.591671+00
f90cd101a049306834754e5112e70cf1	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-17 04:41:31.723358+00
531b3b93251bb7b7d428440a05ffa261	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-17 04:49:04.657016+00
d69947cd3db1502ac5a229944b8de5e9	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-17 04:49:30.436824+00
f45f2c41c05f82eb1b30b40a49da7637	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-19 06:47:42.824156+00
a92f0262db67c7628820996cee165f3a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-19 14:00:55.368687+00
1959a8df56c885219a38b11a0893e337	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-19 14:18:27.014847+00
f47af71442727126a3b08a3d8269df28	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-20 04:34:11.231433+00
cab2bf340241c87060dca0a96d143099	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-20 10:15:44.182994+00
a0dbfbf53dc8176b4f3869db3dd89e06	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjUxZTJhOGEwZTExZWU5YTU4Yzll\nYzgzYTQ3ZjZhNzg0\n	2010-04-20 05:26:29.224655+00
7b191f38b307502a1182cd727a80a653	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-21 09:14:06.277133+00
cafb0306626afe0038676079388078b3	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-21 11:39:09.08297+00
deda699b83ecd549592db25201e94787	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-22 21:15:13.892814+00
6899971238eba9a27fe052678274eba5	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-23 09:55:35.76112+00
0a0d0dd089feb35aff8bb16545aafb0e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-24 08:42:01.822294+00
38acdac485acec3bf1d30e3d9f2c75ae	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-25 16:09:49.92166+00
8dedc4558c139c91b9b210e96367a0d5	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-26 10:34:20.149923+00
a06d0e61bbb6f64320d5ab57f37f09bd	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-26 10:34:44.490232+00
9d4ba6b5ca98bc2d9705106ba33c542e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-30 16:01:38.980932+00
8220eb762073c49a68a6e029e3cbe0bc	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-04-26 11:23:43.459537+00
20357a423324e1e90a877bd190d00ece	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-28 10:07:57.149987+00
037aea22bc95716626d76d5c03bfd675	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-26 13:06:54.013948+00
be506fcd33e1df0bba82028712520a30	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-01 06:13:34.816215+00
29b00a71c613747a24aac04507b284ab	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-04-27 07:06:57.225239+00
0f5e2a7e7a3ae5001bbc887e31e3d90a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-27 07:49:42.00131+00
00201efdc156cfb997ba79757f86f99a	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjUxZTJhOGEwZTExZWU5YTU4Yzll\nYzgzYTQ3ZjZhNzg0\n	2010-04-28 11:18:45.007034+00
73800708d769a981c433a3674327b41c	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-04-30 09:44:42.14431+00
d57a9cc34ff942a83b9522e145d1ed64	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-04-29 06:41:49.983309+00
62bcc0ba758695fa1d36b2794408eb61	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-01 15:06:42.073829+00
058a1278cbfbe29786887abb67edda2f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-02 00:07:47.734577+00
e56ba449c57973e6db1e6e9ebe5a4fb7	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-04-29 09:36:43.424008+00
b0df592d83efe15d1c86462f5523dab5	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-01 09:11:07.946642+00
edf427a3ebee805337384de680f35090	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-01 09:55:06.486281+00
9fa37146256fa641c945a7633f11a1a7	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-02 04:17:11.255846+00
3ff0bbbe82bcbda72045278981a72495	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-02 06:05:59.573217+00
3e24041f01948acefdda29fbc50c0650	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-02 06:06:52.549132+00
5e128cf171dae7968551225b006c950b	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-01 10:43:17.482934+00
28033defc3f042688a3fcc7ecee30b47	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-04-29 07:31:30.568033+00
412c18ce4dbe00324c0c1dad692f29eb	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-04-29 08:53:33.043076+00
ea1d68168c2d0c90417626b6268c18bd	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-02 06:07:44.901848+00
6de3eec39dc94c7ad5c3b2ac83da83e8	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-02 06:11:03.916814+00
585ad1f09d9e1e17f4f2123d070820b2	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-02 06:21:39.220863+00
0d9195a281d1150b86360f549892772f	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-01 11:04:21.548407+00
7f910a7853c88cefa190f81fdd0dc7a8	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-01 11:33:10.009986+00
95961dd73472b98ff4331f0a98ffa0dd	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-01 14:30:41.301463+00
f75117dc7799b7f55946f2f45500de8a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-02 06:43:20.332611+00
e855ea00267691771014c35fc4bd67c4	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-03 06:21:43.111811+00
ec9e8fb36c8502c40593948e5d4ae421	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-03 19:52:10.770893+00
59e6cb3c7905861676d996577ea365db	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-03 21:15:34.091073+00
27f86e1725b952881e6f7492c66d53ab	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-02 08:04:47.799867+00
82b1845bbead9cfe5e8851d6854d59ac	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-02 08:30:17.368977+00
74cf9a9e273053418b6dc2cc2df73647	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-03 21:56:39.625552+00
45aa169204319023ea70ced2533d577f	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-03 11:14:07.034668+00
241862ee3cd860f3d2652e139af06a38	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-03 22:38:31.813604+00
b533618850ec275a8c3626b03d51479a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-03 23:19:51.031528+00
4a916ec16eadca5097724c7fcfdcdd15	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-04 09:18:03.301219+00
9758571e8c19e28dd3a04bb7e6435d33	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-03 12:12:40.262152+00
55c6f78e6e5f8020bb826f58227cac69	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-03 14:00:54.425317+00
66bca444ea3e6b1aca3d978b2bbeb8a8	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-04 10:12:30.374365+00
ade7218fabc3cac2a67812a199924a8a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-04 10:56:13.480088+00
d5722843ce897d13de87bc827cf07e9e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-04 11:00:18.435272+00
7e493d0dc3ac9a77e3275937c41ceef5	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-04 12:42:35.685534+00
ca3d22c8aa4c37d019c05c596eca0351	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-04 14:06:30.53661+00
20fef987d21647d48898bcd601e8a53f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-04 14:24:48.096613+00
edd358e2e8f937833376b8055233c69b	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-05 10:50:37.154751+00
99cb8ed814564c1713058226d02b258e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-05 11:57:36.190259+00
ac6acef909cc705052895c33eebf045b	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-05 16:25:54.615902+00
d667b20faa001587111c52fc84a7186c	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-18 15:54:36.963053+00
147affc856abe0bb3d99f22dcb6863c0	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-18 15:54:46.68155+00
c96db86e45891ea3a458069d836232cb	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-06 04:23:01.805777+00
649ab7532248d20c23a25a0922582596	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:42:41.955978+00
b16a6b4a701919c042b338556d5a7c13	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-06 07:17:25.370386+00
abfde5cda927c000512eb79522249a94	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-06 09:23:25.725772+00
11dd6d1e8029c4f7fd0433012c689e13	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:23:36.544208+00
7dd3d9318bafe08e0e2e33af2e9c97ac	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-05-07 04:37:49.450966+00
10af245215d8f81adb9c7bed42033f74	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:44:43.674295+00
03f6bf199f7729844999964952e7edca	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-05-07 05:38:15.156528+00
c2f23a2f03ca48caaa8a3160e304985e	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-05-07 06:16:01.381364+00
126685d11e6be9d8f4cf578cf503b906	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 08:08:54.393789+00
0a4d2d63825cb5bf6f9adec1a07db493	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-05-07 06:57:57.884321+00
d7b8611ebce2c92b3c8e29e944e90117	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 08:58:17.420376+00
8b69b5ec9ac9ad4ae0b3bef1038b291a	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjUxZTJhOGEwZTExZWU5YTU4Yzll\nYzgzYTQ3ZjZhNzg0\n	2010-05-08 08:19:54.591813+00
e03345fc47b6cd5559cc167d4528294d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:19:46.378288+00
4bc75c06f0ba4643bbcb746f1aea9445	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 08:58:23.454965+00
1000d38b55df57a2677b65c1119d8e0e	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-07 09:25:21.767871+00
5920276520493a9d39a807a5aa37715c	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:14:27.52704+00
3248bb43da4d5330a01e20cd5c3c33f4	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 08:58:31.078694+00
0b9e44446abcbc8d5204915db6869327	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:17:51.385064+00
eb3be8483100a82126bb5cd2d022cc98	gAJ9cQEoVQp0ZXN0Y29va2llcQJVBndvcmtlZHEDVQ1fYXV0aF91c2VyX2lkcQRLA1USX2F1dGhf\ndXNlcl9iYWNrZW5kcQVVKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5k\ncQZ1LjllODhiMWM5Y2ZlODk3NWFjZTZlOGVjYTVjZWYzOGU2\n	2010-05-08 08:56:34.691202+00
b17c000af6a5db30c1e65f997e487159	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 08:58:37.702311+00
e02addb08d6f257c52c59bd42f63b0d8	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 08:56:48.80149+00
538d3ecf84e9f9b8dd740d6b6b8bff91	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:15:02.653207+00
fdc24d003974959dff026f9ec2509b46	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 08:57:00.893992+00
773bfce1e60d42887288502657c43e7f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 08:58:52.056585+00
e7f69065db51727ee99477384ec82e04	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 08:57:11.523176+00
7c434fdb06909a5d56f195c8afbd8c3d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:19:11.962919+00
96c4a7d082c292c869e32de5eac5fcb6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 08:57:18.27684+00
5270ba715effb8ffbe9dd1f4a090553e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:03:00.785931+00
77581e4f406207b43f4317de250d710f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 08:57:25.791279+00
4dac232db105e716e1562851c92b629f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:15:34.794351+00
295a660a343eed8633e86f4b614a7ac6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 08:57:32.871316+00
4572721c4bdc9ee2f14709ea82e8293d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:04:31.490907+00
5c598e1f30f1b69c49015e97541811cc	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 08:57:39.030927+00
93496c3ce1f7f5cd29fee4c8cae072b6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:18:13.724892+00
e38cdb8786d51743722519e066fc0689	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 08:57:45.419823+00
dd31e0fc7885b82543e3e82fbf29be96	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:05:12.271921+00
686ffa750f35e10975f993e9c81923de	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 08:57:55.323296+00
a7fa32d13d70fbb0eb758f735c78a23e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:16:12.666678+00
f9c2a0c7e5666106880cb8f3b326560e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 08:58:01.21141+00
dc6249e96282d14f2e79d585ce0d661a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:20:56.637737+00
75981cc6617ae02603c4e4fcec1b9c79	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:05:51.184226+00
fa1ae22b838ff7417d9a7cb03b58a4da	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:16:56.821172+00
fc123d9547621d01534d6a6da1cd23bb	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:11:01.647707+00
9578dd8489430ffa6d4859ffe63b225b	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:20:07.705796+00
a8cd46f16ed298b6231f0bae79abcdd5	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:11:59.61833+00
c898701ce489d1d7786bd517ddd8126b	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:17:28.109152+00
dc516892ba14adac3e8f0ea95e7f5fbf	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:13:18.787991+00
c221c608c5d656092d6e80aaf1f3d085	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:18:39.25013+00
85540e75531cc885b39d3094b298c0dd	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:13:52.426271+00
6984303b2dc54f489f69f97556d70771	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:21:17.610796+00
789fe573e8298f2ecb8f2d6cbcfaaf0e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:21:52.995077+00
1c1d3fae189ffbbc6d6298cae7c94614	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:22:21.397152+00
b35c0be1f19199855652b045f8260168	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 19:29:29.383456+00
145d4f08fc3185e6a51798bbba8a0522	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:23:59.349265+00
ebcfb8ff3dedd29dc417defa9cf99451	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:36:03.086538+00
e1d01582c4ceb984426ff0dbafa40085	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:24:24.983985+00
9cad8a67d21793a011301b99cea9395b	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-10 19:49:03.608666+00
ffe0692ebb53fcf99676095693ed0e50	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:24:35.354588+00
fba5843522f489c63ded84f5edda6d7a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-09 05:47:09.946142+00
2c24380767305a76f670640fa899059a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:25:14.668761+00
8ffd82002ce0acc74ea051cfda7546b9	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:25:34.20331+00
26bb0f38b3804413d22a9dc21fe31704	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:26:08.096874+00
88c51dcffad192b1a15bef907145dd03	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-09 05:47:22.222252+00
3fd5da60c820bcddbaf1cf4a3056159f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:26:19.780302+00
4e6fc7273779dda494eae956bf45742d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:27:53.878145+00
158be8129e65be277a96391fc4f07cc7	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-09 05:47:32.023903+00
2e236f24213d8e32d4d24c754146a8ca	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 09:46:07.106871+00
2be7d627172d8665ea721a676ffea5a3	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-09 09:11:47.30365+00
527230a22bdd8b4c358b40b2305ba6fd	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-09 05:47:53.861034+00
e2a5d80912443af802e4138f42d92e43	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-09 11:24:34.017378+00
de01a60e1df00671aaf359e845f08989	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-08 09:55:29.936666+00
d1e7af8b59bfea647aeeb2d173f9f558	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-09 05:48:00.5214+00
4dac8ac9c69cf18542df28c54a1fea5a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 10:07:33.409757+00
188194f05be0524a2637fd6fbcc6b741	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-09 16:22:57.000717+00
a240978a2e1da3edb26dfe2a5a5e1ccb	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 10:07:49.563772+00
b76f8eec8f0b3774c140e0d3474fc3c0	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-09 05:48:18.427636+00
c9376f44f9ebe5e2cf5f55f2cbe618b7	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 10:08:07.339944+00
0e4f94c69cf855f42b41dfe315768011	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-11 11:12:03.347101+00
6e6ea77be0d2968cc6a3be91d11ed075	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 10:11:37.483156+00
f7247a28c0c2fd3b2ce3f44b79955440	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-12 15:45:24.545706+00
28ded4b0ff7798d53f8af08495f5dbd4	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 10:28:19.144775+00
d6a6fb326d54809a49067504c67b4203	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-08 13:44:36.021131+00
661379f113ce5e92f843fec9b670e7a2	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-09 05:48:36.939874+00
e6aedc9a69f06fe74f8dcc96fb1b45f7	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-11 04:36:50.177755+00
c6be5294cd53808d20dadf28c93b1e5a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-09 05:48:58.158476+00
18225c5f46f2c0f9c326395777b27e10	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-09 05:49:18.949797+00
68cd44217359875639ce76a92f502cc5	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-09 05:49:20.139306+00
f29d9cd1af2573bf27614be57e414e68	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-12 21:53:47.536354+00
2f3a5bfcb5abe93186deb8dc758aed73	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-13 23:22:29.36734+00
796f2a2cbe4900f6043fccefa9bfc0c1	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-14 09:54:41.185874+00
0810ec55b6ee6ebc6f45f878a19e60dd	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-14 20:01:57.587336+00
55c60811a0eb2f3dd4dea30a61444d86	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-14 07:59:01.089029+00
45fa90b980f1cb9e713837782321b998	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-14 08:10:29.601582+00
8147a14c702c3952ea00647477c52240	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-14 20:46:36.280111+00
610b93772f1e99742572354d30f08df9	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-13 07:54:12.526101+00
d5d0da4c5d7021064a5f101bf8731100	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-24 04:58:58.268451+00
8361f5344ce7a8b34a2cf6988bfc4633	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-15 10:00:14.738874+00
743d38112a43a809c906c43c8dc64f97	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjUxZTJhOGEwZTExZWU5YTU4Yzll\nYzgzYTQ3ZjZhNzg0\n	2010-05-15 07:21:52.425721+00
c8afa66254eeb97c4eb81aae85035e8f	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-16 11:01:01.542575+00
fa585bbcd71e68b8dececff9c40808f3	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-16 11:01:24.722527+00
056a537d5359ffb8edfa540477b21d60	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-15 09:20:46.954745+00
1bedc0b9b2410cb73aa82ebfd9acc31f	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-16 11:01:24.853114+00
a6f76bd1fa303e07f00531cbb28f0ae2	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-16 11:27:47.083997+00
c4c6db06bbe0a5d8707be06b989a6ff1	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-16 11:47:31.740955+00
9c4ccfb29c9a3d28b2aa0164019d2257	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-18 13:00:26.999811+00
e096d3f5ac04753ccd5de5afa728c0d0	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-18 15:54:32.87401+00
cfc22b2e14936281c4b6825307b78179	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-18 15:54:41.503063+00
789723cb1463273b3fc99011213bd8e9	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-18 19:49:16.092363+00
771f462d64970078947f256150a82aea	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-19 01:40:27.965016+00
7155f888fb49a504375eb75a717f5d24	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-19 08:59:36.713332+00
bb6e5363a939e47e780cd7a11480b487	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-20 03:05:27.087216+00
e9d8d10d232183a7632ed8e78140afd3	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-05 18:05:50.87423+00
d35714e4b2312bdc539970af77e8f58c	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-05-20 08:43:50.601299+00
b69c101e2679d7ec93379c69eaa30df0	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-05-20 09:40:49.04752+00
9a29c3dddb0c54a2d4d6237f244637e1	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-26 15:33:17.891076+00
734e971daf7c1d615e812b6aec9a9e6e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-26 16:44:51.652019+00
51b6cab450998f3dd6b66423c2f9cb28	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-22 02:24:23.479923+00
271223cebf26c04573744db9c4d1ce02	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-23 21:48:23.713647+00
20e1334bd48546c30f704e4380c20089	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-24 06:09:58.8726+00
aa566499f4343c3b0f025e3aace8673a	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-05-21 05:51:37.830098+00
8c91bed6c0e72961a50b531c5d03abb3	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-24 08:31:07.884322+00
46b72f11905abd69240000799f51b7fe	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-05-22 07:54:09.443805+00
599d42e07c91a81b57c23d008692b927	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-23 08:13:30.400786+00
2c31eb3d6256e3b3bbba9f1f4de5fbd3	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-24 09:18:39.692404+00
e9c61a698fc6a6a43f651cb9cc1451a8	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-24 09:43:05.09675+00
f440279c6a7434be581fec94fcf47bfb	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-21 07:47:13.011825+00
d6c9c341ab63f6d03d9fb237d9e1c2ee	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-05-21 09:12:05.236276+00
28cca9b21ab074df3c12abce8c0758fa	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-23 13:32:43.762374+00
e8b6340e98dd20d1270ed7a92eab587a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-24 23:18:22.871445+00
6cbf87983901cc9de455a761ffa9da4a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-25 01:38:23.897054+00
2e2d1c794aaccb67ca20b8584716b122	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-26 19:43:42.267562+00
af6fa1565f465952c9fa029663e8f020	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-28 09:44:37.052664+00
2d0ecd1413756b5391d942315a563412	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-26 10:07:42.209894+00
410138f467fe340df01f293adef9b66c	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjUxZTJhOGEwZTExZWU5YTU4Yzll\nYzgzYTQ3ZjZhNzg0\n	2010-05-26 07:49:47.846699+00
50469217fac602e7db1b5b6d388a996d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-26 13:58:17.431419+00
3badd631ee30ebec31ebba3a793e97f6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-26 20:19:54.213049+00
5a6dc68084fdb8edf6b0f0430d4b5e2f	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-26 07:13:41.258563+00
31ed7a40f400dff95f4e3c77458fa69f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-26 21:31:08.590338+00
da090c3f50b3f5759186048e7f6486db	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-26 22:07:57.503138+00
1c266c66308befa0641026c85a4b0dec	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-27 05:03:48.458002+00
869dc4a02161004585b2bdf329679175	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-05-28 06:18:00.75835+00
38f670a48d1406a6af9f42630445ef34	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-05-27 07:25:29.97831+00
6343d507334d603504a4670d1c9faac6	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-01 11:51:05.961956+00
f3e3da6486ae86bcc827f1ec9efd676d	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-27 11:18:53.744055+00
df7863454865a11fce52239c4ba4d38a	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-29 09:33:57.377286+00
60f23047c0a7ddee1f7ce5880c1c0acd	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-29 08:19:49.374931+00
b658ae8dd7131a255d3ac584941eba55	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-28 10:30:11.734226+00
47c891cb7fc840c1adb3663fab7feb06	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-05-31 06:33:46.118526+00
7bbfdf38815af8275b56df0bcdd964e1	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-01 14:19:17.615775+00
2b148aa582bedde11adb5e1797c70cfd	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-05-29 09:18:49.711562+00
130b5f4d0ea7dea1608676004552cf39	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-31 15:38:37.499228+00
f7b015002eb7562d201c650c88b2abdb	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-30 07:42:38.105797+00
9e8fc0453b44becaf2546a4941442483	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-30 08:19:34.159851+00
4141f53264f0caa78850c87e944b8979	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-31 07:41:37.014322+00
34c99552bc9446a668fe7b6b9c8fc0df	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-05-31 07:55:22.735265+00
dea5f80d5541a6569c886a76f0bb1486	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-05-31 08:13:15.530279+00
f3bf19f38228ab420f85977dd20f81dc	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-05-31 11:53:15.621091+00
b8e378b1ce26c53daff972fc149447e0	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-01 04:59:35.227884+00
2252f1e6bccf95f62b56c1173be64b8b	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-01 12:47:06.431346+00
922f11c602be8d80e7d86d57130b69e0	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-01 16:07:58.417149+00
4edf3df929c56dc60efa1e956e2c8264	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-01 21:32:53.879905+00
cdb85484b6a3a55e68f4ac68f8ad0964	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-01 23:22:00.157371+00
72196193c32ab50a4cc379abb179745a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-02 12:13:44.579098+00
d5fb3d0774be076114c49d527be21180	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-02 16:27:26.415472+00
fa65ccc1c3627adbc55e0855688c0cad	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-02 01:09:34.886444+00
1ab6a7d8e23af7e0bc09a23a40f78c40	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-03 01:49:59.230437+00
8219a9a3a217f5852165bc37eaf5a968	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-03 02:37:16.833027+00
77430fe9d306b0882c87b8d47f2b5d30	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-03 05:47:16.66735+00
8f1cd61f1502f0c8cffb7a2f63c6b4ce	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-01 08:19:30.106922+00
d7932a97207415d638378d33d24f2459	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-02 06:12:04.59334+00
2018a7be3e6ce2097178778483ac9fa0	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-06-01 08:27:00.102139+00
75cd0717902fbeb5f23abbc3e679e00f	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-01 08:32:36.773619+00
ef355dab5efcd94063e1fa8a526dc26d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-01 08:34:31.412714+00
3e8c4c7b8ea89fab34ba6178940c0651	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-01 08:35:52.194871+00
df7ed523639980854f216bda8e0432a3	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-03 18:05:56.252495+00
03ca3722e4ad184c3134a0e40820d4b0	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-04 00:00:21.239951+00
83b0fe8c156091062eec29c96d1838f5	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-04 20:35:04.42888+00
e7f91b0106703c811b8be4571a09b86b	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-06-01 09:17:26.861228+00
71ba3b8ceb5e4b8309413c2c5b2eb270	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-03 06:15:30.22293+00
2a94553444abe86297fe276e124bd725	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-05 13:18:49.384789+00
12770ef7b5d8bb09b081f9699056ceab	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-02 09:14:25.935332+00
2293553a951cbfed34ad0293c949c607	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-06-03 06:33:54.622575+00
9686782aed259c72d7699b4176d97b30	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-06-04 05:32:06.850895+00
65aaf45851d64a1e9a4bd3ca8b322c0a	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-04 10:28:08.417332+00
396bcad6f25f6683c5357a71c9c7f3f5	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-06-05 05:39:04.201743+00
87fda87df5f0d68aca0dcda31b72a7fa	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-05 18:25:44.673466+00
23c95b0ac29738e33d0f0cc03c3db2c9	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-03 06:46:39.49163+00
a69fdd3a6c6dc5c1f1b447ceb316a41c	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-05 18:45:43.884749+00
758c24ae32faaebdc7490420b0eb3bff	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-06-05 05:43:52.390152+00
8d1ad253f6a3eb9c68fdb5102dbc54df	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-05 05:46:24.896374+00
b862cead218c898e3e6c75bb3ac40f08	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-05 19:06:15.508169+00
d470f83468f00c0d36e31b52bcd404d7	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-05 05:47:28.359352+00
a818ce3ccf85fa167f86e86163808185	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-06 23:38:26.406973+00
8b80763661fb830360e79027aa8851e6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-05 19:27:21.835801+00
3f135ac73c79f176d82e30844b1dc653	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-05 22:18:38.635668+00
65eaaf95649fab920880795a05b1d189	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-05 23:12:41.474334+00
72eb51d1209e889dad804eb7b5d42ca5	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-06 05:58:08.312292+00
b57e88fed5d996665cafc5b81103ae51	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-06-06 06:24:01.018965+00
a89df843780428fd081e994d84be39cb	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjUxZTJhOGEwZTExZWU5YTU4Yzll\nYzgzYTQ3ZjZhNzg0\n	2010-06-06 08:45:53.776711+00
b49ede797b79e66448a5cd89875453dc	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-06 15:14:17.734053+00
a4e10da8644934ba74719fdb7d905387	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-06 16:52:10.930025+00
360b89a35db042595b2c16bf6afc2f87	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-07 09:04:08.044579+00
f1a54b7c2d8faefb8f382beae03d6ff2	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-25 02:12:05.617996+00
7c1f55a4752c356357de3fad2cf605bc	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjUxZTJhOGEwZTExZWU5YTU4Yzll\nYzgzYTQ3ZjZhNzg0\n	2010-06-07 12:08:51.181206+00
67ff9aa636a3553d7a143404ae5fa46a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-07 18:29:20.075146+00
9b346c12e0a3615aecdf9d19fc04aec1	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-08 02:11:23.488566+00
bb324b5b5432b013508cdc1471457743	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-08 02:18:42.502114+00
78d40d8ce9be961cd0eb0077e92df3a9	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-06-08 06:25:25.728696+00
db616ac9691f005c4981b2b757970eee	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-08 10:37:26.777555+00
363ac5e915356290a4753b59540059fd	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-08 12:10:12.201411+00
5f81f09546e08fa54c10ee9a1cec1d72	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-09 00:37:26.725234+00
3df55fd9e6261874818471a2f08db8c6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-09 03:24:10.245175+00
b099ec5b9e156e199dccad9ac404785d	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjUxZTJhOGEwZTExZWU5YTU4Yzll\nYzgzYTQ3ZjZhNzg0\n	2010-06-09 07:57:17.406426+00
bd3f205d407f41959ee1efd505da07a3	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-09 08:23:55.086285+00
a1a66a60122b64ca42d866f178d645c4	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-06-09 09:19:36.920666+00
37ddf7371b0baa58ceeaf3fee916ac67	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-09 10:14:48.147277+00
aed249873a433e7c881cc47f91d35b5d	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-10 05:27:55.436977+00
d6a3c65f77fcb5295460f7e15dabd390	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-09 10:50:12.223023+00
c33b075cac4ffdaa7441f6a97d45f121	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-09 11:13:39.415841+00
2831e53c5ed71da3aa012590ed35f7fd	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-11 08:20:21.77163+00
2499457d4a225ae68a77d36475b0e137	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-10 07:38:57.903468+00
c553fc6349e5139b006699ad31196646	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-10 08:38:22.57731+00
d57d865c5bed9f7b3aed24a8db5ef03c	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-10 09:49:53.412399+00
1a988d887ef5525ab9f3dd06695f0178	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-10 10:44:17.264654+00
d039f5d7ccc0c60d873fc8782a51c126	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-10 12:59:00.771667+00
573c6e2d692b921fb0456042a08e4960	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-15 00:11:27.401474+00
146e6ddda926dd9d86c41ce2be934485	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-15 02:20:44.019762+00
1231da3ef3e4f07b355e76d7c07bef72	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-11 10:12:29.290287+00
456154a50bbdd71e8a01619537fdf2f2	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-11 10:53:25.373444+00
c003cd64d1146bd0414ffe1b31d11b73	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-12 06:46:28.558898+00
c68c1d60c1cde8b1fdb21bc2badcdf4e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-12 08:27:28.133081+00
b0a6c05b2d5abf0c49499264f5b68968	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-12 09:09:50.048863+00
87c8a7d4220616ab34c3ce978735fd45	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-12 19:13:24.331007+00
1c9141e474adce1d48b0fb271683babc	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-13 16:50:55.031462+00
c861c9aaac48f3a0e75de9f65717a778	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-13 20:44:49.414788+00
9d2c3ea8fdffc8df4f0b2abc278f3da3	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-14 00:15:08.68089+00
23e11aa196acb5dd06aab07cab64f60b	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-15 06:42:37.374537+00
6698b63bd243360b2db571c323662956	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-16 02:04:44.930399+00
6c062fa333830febf2b34c35f5fd53de	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-16 06:59:02.41456+00
d1851f69430aa9edc516c10d0c508c36	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-16 17:27:35.415765+00
7e1ffe23769fe6659b5e736831a82346	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-16 22:37:04.914817+00
6f7b8f9d1af4dbffd84311add28bc230	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-17 09:51:27.023437+00
95e981f51b44188ff7da9a543a62d8fe	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-18 12:06:06.847665+00
87123305bac6e966b2403776d2271670	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-19 08:23:00.54942+00
601d1ddbf7d795d4faff53d0ca908c5f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-22 08:41:10.752672+00
e78048e37e2b56c97b23f16901639911	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-21 19:36:56.672414+00
5baa164d3e9f08f7c56ba5b08dcbade1	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-22 01:09:59.474464+00
8c0d760ee6e4b853a1ec3dc261693ae7	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-22 02:07:40.196176+00
2d837d5fdc587007bec7ac4489f35d5f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-22 17:23:49.974555+00
d948b44048d09176f8ae1b5981cec18b	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-22 20:39:12.504297+00
eeb7a81b341cf66a21a41fafc4267ed1	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-22 22:24:02.533675+00
ce746168abdac98be4eb5ff5d73c4342	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-23 06:44:24.689703+00
87ff69fe779c1ab19eda421bc174a17c	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-24 07:38:13.255088+00
49b57fe8f37e02d0f3ea4294466c75b1	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-24 22:58:51.541709+00
1fb5bd7971066edae5ecff67e82dddad	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-25 21:08:55.071359+00
4731a4847b294900d5fdb76873e787ea	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-26 00:39:39.580392+00
ec58106579f5bb0d317630facbfb2dd1	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-10-14 07:09:46.747193+00
66963534c184623a2ee8df4d66f13b8d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-07 10:01:28.847481+00
405707ebd2fbf97399afb9d5ce7aa143	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-30 05:36:27.086272+00
d39d02327b8f6b3b17145cc02db124cb	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-07 13:09:52.465712+00
ceee15218b3f531ccd24d8e90a653996	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-26 09:32:58.640817+00
033d21c84884ce1025b3db5f2a538bd3	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-08 21:56:07.920918+00
1c14930520866c993221367b5bd56a06	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-06-26 11:28:28.108074+00
a3b7099624245746cc65e8bbf7823804	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-26 16:51:11.16234+00
af4ad5222daac7f29750252926119cc0	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-26 19:11:14.85118+00
6db0115e6d73d9fb5afca8f86444c3de	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-26 19:59:51.837244+00
84031da653b65a3a6f411316d7be2454	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-09 02:36:22.264646+00
ec5db0d7ffd4d12d17cdc4ea1b135fa6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-28 11:16:42.591591+00
3cb28571d7a4603eecf9c3f7ad6c0e91	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-29 04:19:34.31071+00
f6196294f8a990931a99389e3734defe	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-09 05:36:09.319619+00
d4153d1739e13a905c3ba66c383cadc3	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-29 12:29:08.226113+00
52448c80250f0266448f281f8cfac46c	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-29 15:11:32.673248+00
c8bbf523ff7860e9f12602d1d6de983e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-29 15:19:30.894569+00
5deb25f7c1022405bb05bfcf7fd916f5	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-29 19:24:40.158618+00
99f64d21945db77db5009478012432a2	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-06-29 19:40:29.823627+00
a03d46407833399a2627a9515fde55d1	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjUxZTJhOGEwZTExZWU5YTU4Yzll\nYzgzYTQ3ZjZhNzg0\n	2010-06-30 03:46:13.957061+00
ce7ca846f7706dd72eb74fec541c0cad	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-09 12:06:13.38394+00
e4606048e2c82a5d56409b03d89397af	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-09 15:11:00.206283+00
ca4c5e944572bc53c9c693c1786e7bcf	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-10 03:45:48.685854+00
0643f815f87c36edd4f3123948ed9c6d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-10 12:13:28.074791+00
850cbab1c1a9a08f4835aa82e9ad5710	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-10 18:08:15.595367+00
37370fab47d51cbd074e52e4e3b8634c	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-07-01 11:21:15.508434+00
3e7fac9c678d962ef76f85a5e502e22b	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-03 03:34:41.200305+00
05193b323bbf8edf76dc92426a313f13	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-05 21:35:16.188065+00
8ffc15582bb8f0f6b86ac4ce90200e4e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-06 16:46:12.701297+00
a682381af9418feb6353c00bc7db2f79	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-06 16:51:43.643637+00
af6f3a37b59230fd06806c9bf43c05f1	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-07 02:33:00.879046+00
84e75d54932270318617c291ff343c34	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-07 04:47:01.783499+00
10e24e855820d51ec3ee2ff98341e3b0	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-12 10:39:42.062079+00
c32e7efb4d6c132d7d14e245fd6866cc	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-16 12:17:36.880805+00
31ef8c9c048a3b8451e060df06640a1d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-14 01:12:07.435767+00
b11998a721cb2aae157d15340bc63308	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-14 02:37:54.864044+00
241c03431c54d2e3c3976e0db74d49b1	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-13 00:08:28.852865+00
f6992d27013cdeb92adfb8c780bf439a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-15 08:35:18.563626+00
d855c4f7523a72edee8cd9d58e3b412b	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-07-15 11:50:08.553805+00
066a1d9adb457cb0d2aaf6b6ff85c73a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-14 13:21:10.482701+00
c197888d3c71c79201918e754aad3c4f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-16 03:37:18.265541+00
a4b5de022524a989ad0089e62058bd25	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-16 23:24:57.076558+00
3f5b2f960ad405099b4bc05a0e3f796d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-16 04:32:34.29506+00
1c1bf88727b6195a93090c18cb112433	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-17 04:18:08.590647+00
a0081bcd77934f50e01330df75a2d4c4	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-18 13:38:08.445721+00
590dd38a84d5e9cfb825c9de696add87	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-18 19:52:16.423171+00
37eb579f1f6a3c6feff6d8cb7ae2b5f4	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-19 23:08:04.975874+00
13632e3f917f7614a0dc3c906ff91695	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-20 00:32:18.748674+00
5da64bcca2c5260576cf60833bf40542	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-20 08:37:13.008372+00
85f4cbc7dc6c33330fffcca12f95b890	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-10-14 10:41:41.745631+00
d03cef470718255fc3048f54b9e0c972	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-10-15 06:10:45.502183+00
07141d292737d3e45fb8aa3599a3e612	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwR1LmUyZWJmNGRhNjcwYmFlZjE2ODI3\nYWU1OTJmODk1NjE2\n	2010-07-22 07:25:06.743507+00
939b80a1282ad8e4e9a8730e6f40c0af	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-22 22:18:50.5937+00
fc02171dedb617640cb211cbabbcb0e8	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-23 01:30:01.088861+00
a8a78801d2ea853c8213404f22113cb6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-23 02:47:41.447421+00
f91a62b7747e51a888bfb7211f098b5d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-23 10:55:36.513774+00
ac9abc8477f67f94033edc5e59764b38	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-24 04:22:30.468108+00
5031f72acc133de347b2283800be5c2e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-10-15 13:48:42.566017+00
f086ceb29963ae576bad1ab9f7613110	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-07-25 05:16:49.575125+00
1166fd1adbff57039eb404b216d8f6e7	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwZ1LjU0OWE0OTEwNmRjNDA0MDllYjk3\nODU1YzE3ODM1NTVh\n	2010-10-25 14:04:27.634473+00
27d92e01f4888b3bfa624f52008a23c6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-10-22 21:54:41.067724+00
0442dc0a171f9c5f3344286a91e33441	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-25 06:45:13.610365+00
1c15524fc87dbeb13e6aef97c13b753e	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-07-25 07:38:22.401356+00
cb7887c422733d88bd8aa24517dc81b3	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-25 07:49:27.137927+00
0011a3047bd1f05ee8896754806bd228	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-25 10:25:58.88391+00
165b0065974aace0bd68e7ec8d556013	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-25 17:27:56.468642+00
886f89b2b053eebcc11c0b998fa43fe5	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-26 02:08:40.288639+00
500f97d05a19134c236f2d75042030e0	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-26 21:17:26.484215+00
0251a51cb77ac415952fadc37bcb40d9	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-27 11:31:30.939732+00
2455bf1bf2d0336d5be04870ffff7e2b	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-28 07:30:55.719393+00
a4ae21817f1bc13ea02abd382896bdc5	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-28 08:44:09.376713+00
a6ff5b3a6e37b8f202b5a2331783e229	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-29 00:05:44.058476+00
b1b6f01886e6f1f7e922e867ac810512	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-29 09:29:29.111671+00
e925ef72d5dbaacc6aa0ce7e5a330072	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-29 12:05:02.345837+00
c2ba3770c6294c6fe28c25506c32b4bb	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-29 16:23:59.771141+00
8cca81972a8e8b35bac2db3a632562c8	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-29 21:50:23.611529+00
266e0ab5aa621a031f8ceed7f0a5679f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-30 00:11:53.28111+00
b29fbc09dc9b2efad4f8179f449e7bc0	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-07-31 04:37:02.874708+00
df762f47a2dc1f8938db2e593b00d5e2	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-10-28 13:43:21.781021+00
7c7dfcf49070443b02a163297083b472	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjUxZTJhOGEwZTExZWU5YTU4Yzll\nYzgzYTQ3ZjZhNzg0\n	2010-07-31 07:59:56.649131+00
3458605510fa411068be179c14d17585	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-01 08:26:09.211764+00
ca1afe5d3d0251eb77f0d717f49a99ad	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-01 20:32:04.410534+00
51efdb19fce477acc3556ea89ab163e4	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-02 08:02:02.177461+00
80922a4abf29d92421fcd9b9ea8dc198	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-02 21:51:42.735644+00
6cc4fbde4546dd073b5d2c39037940de	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-04 03:20:15.004538+00
ea3bdd64ae7fb0cb193c64e4f5833dfd	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-04 11:04:07.509571+00
8d7b24a02a06e21b8fba86a2dc3a5a1b	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-05 03:43:15.076813+00
7756f5c5005eaa521d4759719efa82c9	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-05 20:05:36.80287+00
27d468bf687be0f634fbe2a3031cf7b2	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-05 20:40:32.876526+00
6d3f86061d1d3d44e56b0a0abc3d42c8	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-11-06 04:27:02.501795+00
c767f8dd915dcd4d3196bc1e80c8329e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-11-05 00:50:18.472398+00
b8dda1ff5026c4ebeea7d7bebc32185e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-11-07 15:10:08.449295+00
849e3277c9f3a21ab6482c8ab58a0542	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-11-14 19:13:36.03609+00
5bb987b84b239879a07842719f3fb8ad	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-11-15 03:25:42.689941+00
5c921d1450bf6fe5d762bec322c59fff	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-11-16 01:54:40.516892+00
6af1c12492e88f1b285b378d0be979e0	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-11-17 12:03:16.443697+00
83be5ee730167a9d34b812bb1b769fa7	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-05 21:15:20.607019+00
d9b3baf8e7493fd95bf700b96073c0ba	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-06 02:29:04.979223+00
e08dd3385339d37be804196ccde268c7	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-07 05:11:47.174403+00
45c6d35ec7c634544ab1230bc353726e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-07 09:27:50.801944+00
e01fb0c226fd42ec351a32f723aaaa4c	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-08 01:34:07.013598+00
204323abdb6006e76db52af92ae9ee4d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-08 18:43:20.876418+00
eaabe56ca9e6e9e49c99bdcc34070b19	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-10 05:35:46.831157+00
37a0fe344eeaed14c871d6146b58ad7f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-10 09:13:25.860398+00
d736397952276d393af0de8fbc576bd7	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-10 21:46:43.034638+00
c4d787fdeb592edd2f2272eec87e0dfa	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-11 10:35:26.799665+00
64719b6a775b0b786b2252a546073877	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-11 23:25:38.248172+00
26d6e7873dc9ef14663a344261e6bb4d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-12 21:00:51.360471+00
7cb2862add26ebd19d3aaf7abaa9d1cd	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-13 00:28:52.357006+00
ea0ff2a3d8bc6aeb6c259aa058d00d38	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-13 15:08:25.945545+00
0d23c48ba1d9b846fbd33a11489c6723	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-14 15:32:35.222692+00
f03d7fcc7d8a139ac35b1bfd7330b25d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-15 06:36:37.136153+00
de1a28edf8e9800966bab16ecce46827	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjRkMWM0NGRlNWM0NzI0YmFiZDhj\nMDA5NDNiYTA4ODkx\n	2010-10-14 09:03:15.347261+00
30f95ca9a21ebf3ee2ba4dd39218391e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-27 02:35:25.855272+00
b76c408d5ef3116c34584685e4ca1c68	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-10-15 08:28:35.647728+00
c2a2b34725bb8c8615511dc70ae94be6	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-08-19 17:53:15.329866+00
43ebebce2e80124f9ec13a6c2a638be4	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-10-16 04:38:08.275772+00
e69185aaaeb3c484c4a9ba65d9a5e1ab	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-10-16 09:55:36.933473+00
467232f47c71c0bf19c2d5a7b4ec72ad	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-08-21 07:26:40.602138+00
9e03150e8ba5a77df4828325cdbdbe36	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-21 11:04:39.901795+00
22d80a54ca7c54c6ca5853976d1e3ae3	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-21 19:23:37.087092+00
f43371adf0b893217d1dc60945e90fa4	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-22 06:59:57.888963+00
048c62b1663a1398ac8949f90064356d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-24 01:12:16.239007+00
00a177026625faf8d89e9b45b1722eb6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-24 12:16:50.964737+00
6d7c641350d0167c4f5323bcc0153079	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-25 07:03:24.019141+00
325b9e92f95446deed4c9c50a2bf2e7e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-08-25 17:00:27.289717+00
300101f3afed2c68a4b76b18302fbf21	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-10-23 17:23:46.127768+00
5ac4fc2427b940bba855642f224ef142	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-10-25 20:54:34.661916+00
b76badeaba0f7cf1670b9b56a2045ba0	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjUxZTJhOGEwZTExZWU5YTU4Yzll\nYzgzYTQ3ZjZhNzg0\n	2010-08-26 11:18:44.914961+00
818e3b78e270c55a4ba000439966c11f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-09-29 11:49:07.079365+00
d66e248ad130a29d166a11cef47b71cb	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwV1LmNlZTYyOGVkYjdlYThhZTM4MTk2\nZmY2ODIyNDE0NzQw\n	2010-08-26 11:23:02.362642+00
9c49bbdfb5c5e39953558a841a7a7855	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-09-29 13:32:49.071399+00
ef34c0d5d687e8677a53ce9f36183b3c	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-09-30 05:29:12.720349+00
aa97e04c5cc4051e2285323adb72042a	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-10-02 09:47:06.293664+00
7fca43e42358071a1f861977c3e484a2	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-10-02 14:00:15.22847+00
aa7ed75e10b4eca89f72fe7bb582c43e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-10-03 10:07:30.812992+00
a0069d013a43aeac93210648ef74d730	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-10-05 09:08:33.964725+00
8031f0dbb88867922df1d5a7d0f72b2b	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-10-05 09:31:09.664482+00
dd4e60e29a8e066f63e65d4325fde8e8	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-10-05 22:23:43.452067+00
fa33f992c8948e5b64fcb3952e923200	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-10-06 05:31:23.109101+00
1d83b43f738aaf501a50c45853b5aa51	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-10-08 06:30:55.493305+00
9f1bde568774d816e22b37de14ed446f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-10-08 09:29:09.798085+00
bdac016fad0ffab90f3eda4f4b982015	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-10-07 12:14:13.794662+00
8972b08372c9566e37b3561f885edd3b	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-10-08 14:11:22.921352+00
4d544bee90bd9c152b52a1c745f8a4ac	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-10-08 11:54:12.22664+00
da37942f13e41b72908fd7f4fc733d70	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-10-09 08:40:50.027818+00
2798726e3002f44acf6d18c82354e2c4	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-10-10 05:30:40.779678+00
71fe8f91feacba0107374b0186b67746	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-10-10 07:49:17.639711+00
ca9b61120d4a597893c69751fe631966	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwR1LmUyZWJmNGRhNjcwYmFlZjE2ODI3\nYWU1OTJmODk1NjE2\n	2010-10-11 10:51:02.521143+00
aec1a337cdedf8a94970d17b5234f0f0	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-11-17 12:09:35.396143+00
4a06603bb20c6378f8d0fbed46d426d4	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-11-17 15:14:22.562988+00
f6fe36957d01c993132d1f622ee9f470	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-11-20 13:49:53.058564+00
0c6789d8ec0a537da24f439f891fdafb	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-11-21 03:03:20.509399+00
7990a8ab1175c28f645ed2a4da9ec14e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-11-21 09:57:28.734638+00
38f8a54e365200d29b2d433fbf9e5482	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-11-28 15:33:11.528828+00
6b671425227752d54ae9adb7fc045145	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-11-29 06:58:37.351318+00
961507a1e6aebcd8b5ac4e58b388b2ab	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-12-01 19:24:14.050767+00
e75423f6e6a5892d801ad6e7acdd5ed3	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-12-02 02:50:55.387899+00
acf755c2b4e8dc437dff6363cf5cab4a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-12-05 05:51:34.282457+00
6211212c496f0c941a91900cc9edfbfb	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-12-07 13:47:28.179087+00
721c944ebdb5873b17963fa7e713f14c	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-12-07 20:36:46.504171+00
a544b98e5640c77e40e5f4084e5d3a13	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-12-07 20:40:57.651305+00
2bc13fa33514c13ba3c7b17c38e6c4fe	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-12-09 02:54:44.378153+00
f9623c2e9770a82caa97720775936719	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-10-16 05:08:40.186013+00
e9c77420e646a951a91a64b6b82ddbd8	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-10-20 02:20:36.202912+00
8ec4fc02dc25ad356a101e32321406e9	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwZ1LjU0OWE0OTEwNmRjNDA0MDllYjk3\nODU1YzE3ODM1NTVh\n	2010-10-13 06:56:13.538614+00
20bb08ca49643871e8841edb0a88846f	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-10-13 09:37:16.918586+00
0fc30f7402122c14a025b91c329d0280	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-10-27 16:28:13.452817+00
2a238c67576d10b3d7522217ff6189ed	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-10-14 06:10:06.409325+00
a97c1a8dca2ed0ca3aaafaf983b7149e	gAJ9cQEuMTM5MzZmZjljYTRlNzRkMzVlNGM2ZDhiY2E3YWY2ZDg=\n	2010-10-29 12:34:13.075425+00
1f22c0920c045d2891d16d3e85809c8b	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjUxZTJhOGEwZTExZWU5YTU4Yzll\nYzgzYTQ3ZjZhNzg0\n	2010-11-03 10:14:23.26554+00
3f6493931275f53655935af0b7e8d786	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-11-06 02:52:54.017976+00
46bde02a4343e682d6d2756d130403f2	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-11-06 09:44:33.804558+00
bd5bc493293dbb7be6812aa5a64548ac	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-11-12 20:36:46.233495+00
f8f175563b2e64ecbb8f90cf7d554bcd	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-11-14 23:09:24.123094+00
3216f200428b82cc46deb97223245e92	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjY3MjNjNDg4ODY0OTZlMzNhOWY4YmQ3OTQz\nMDIxZGEx\n	2010-11-15 08:58:08.98837+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: web_course; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_course (id, name, shortname, description, usga) FROM stdin;
4	Jayachamaraja Wadiyar Golf Club	JWGC		f
2	Coimbatore golf course	cgc	Coimbatore golf club	f
3	Wellington gymkhana	wgc	Wellington golf club	f
1	Ootacamund Gymkhana club	ogc	Ooty golf club	t
5	Bangalore Golf Club	BGC	Bangalore Golf Club\r\n	f
\.


--
-- Data for Name: web_currenthandicap; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_currenthandicap (id, member_id, handicap) FROM stdin;
38	135	21.0
65	46	14.9
29	42	9.4
26	31	20.5
39	138	7.2
7	6	15.3
15	16	21.5
14	15	25.2
34	127	12.1
69	47	9.9
64	79	3.3
35	86	25.1
70	88	17.3
28	39	9.1
12	13	25.2
63	273	7.1
36	104	12.0
10	10	20.2
17	18	20.0
40	150	9.8
24	28	11.7
20	22	14.9
23	25	19.2
71	36	14.1
4	3	17.5
43	162	13.3
8	8	24.6
66	163	17.3
37	117	7.7
3	7	18.5
22	24	29.8
5	4	28.8
31	49	14.8
16	17	13.3
62	128	25.5
42	130	13.1
44	166	11.7
45	167	5.1
72	168	14.1
46	174	10.9
41	175	12.3
47	184	23.0
48	185	2.0
51	186	3.6
52	187	12.2
13	14	24.9
27	37	16.9
73	195	14.1
49	206	13.1
67	35	12.3
74	217	7.4
33	272	13.1
18	20	24.2
50	220	24.7
21	23	28.2
53	224	8.7
54	229	18.9
75	230	14.1
55	231	15.5
25	30	13.6
56	233	19.9
57	238	21.6
58	243	13.4
9	9	7.1
59	246	8.5
60	226	14.4
30	44	15.8
76	52	18.2
2	1	20.2
77	33	18.2
19	21	15.9
68	263	14.1
61	269	16.1
6	5	13.9
11	12	12.1
32	53	16.3
\.


--
-- Data for Name: web_draw; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_draw (id, tournament_id, day, groupsize, "interval", done, drawlist) FROM stdin;
6	2	1	3	8	t	draw2010-02-211
7	3	1	3	8	t	draw2010-03-211
9	5	1	3	8	t	draw2010-04-171
10	6	1	3	8	t	draw2010-04-181
11	7	1	7	8	t	draw2010-04-231
8	4	1	3	8	t	draw2010-04-161
12	8	1	3	8	t	draw2010-04-241
13	9	1	21	8	f	
14	10	1	3	8	t	draw2010-04-301
5	1	1	3	8	t	draw2010-02-201
16	13	1	3	8	t	draw2010-05-071
15	11	1	3	8	t	draw2010-05-011
17	14	1	3	8	t	draw2010-05-081
19	17	1	4	10	f	
18	15	1	3	8	t	draw2010-05-091
20	21	1	3	8	t	draw2010-05-221
21	22	1	3	8	t	draw2010-05-231
22	23	1	3	8	t	draw2010-05-261
23	28	1	28	8	t	draw2010-09-261
24	29	1	3	8	t	draw2010-10-011
\.


--
-- Data for Name: web_handicap; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_handicap (id, player_id, handicap, valfrom, valto) FROM stdin;
1	1	17.0	2010-02-01	2010-02-28
77	36	16.0	2010-04-01	2010-04-30
78	75	22.0	2010-04-01	2010-04-30
46	1	18.0	2010-04-01	2010-04-30
144	95	16.0	2010-04-01	2010-04-30
79	72	16.0	2010-04-01	2010-04-30
80	73	18.0	2010-04-01	2010-04-30
3	3	13.0	2010-04-01	2010-04-30
47	30	5.0	2010-04-01	2010-04-30
81	68	16.0	2010-04-01	2010-04-30
5	6	28.0	2010-04-01	2010-04-30
151	127	23.0	2010-04-01	2010-04-30
13	14	15.0	2010-02-01	2010-02-28
82	70	12.0	2010-04-01	2010-04-30
7	8	20.0	2010-04-01	2010-04-30
145	125	15.0	2010-04-01	2010-04-30
121	102	18.0	2010-04-01	2010-04-30
10	11	27.0	2010-04-01	2010-04-30
11	12	27.0	2010-04-01	2010-04-30
12	13	11.0	2010-04-01	2010-04-30
14	15	20.0	2010-04-01	2010-04-30
23	24	20.0	2010-02-01	2010-02-28
83	71	15.0	2010-04-01	2010-04-30
15	16	15.0	2010-04-01	2010-04-30
16	17	22.0	2010-04-01	2010-04-30
17	18	16.0	2010-04-01	2010-04-30
18	19	14.0	2010-04-01	2010-04-30
29	30	4.0	2010-02-01	2010-02-28
30	31	13.0	2010-02-01	2010-02-28
31	32	19.0	2010-02-01	2010-02-28
84	69	5.0	2010-04-01	2010-04-30
33	34	19.0	2010-02-01	2010-02-28
34	35	18.0	2010-02-01	2010-02-28
20	20	21.0	2010-04-01	2010-04-30
85	76	18.0	2010-04-01	2010-04-30
146	124	9.0	2010-04-01	2010-04-30
21	22	26.0	2010-04-01	2010-04-30
35	4	13.0	2010-02-01	2010-02-28
86	67	15.0	2010-04-01	2010-04-30
22	23	14.0	2010-02-01	2010-02-28
87	74	26.0	2010-04-01	2010-04-30
122	108	12.0	2010-04-01	2010-04-30
39	41	27.0	2010-02-01	2010-02-28
89	79	9.0	2010-04-01	2010-04-30
41	40	14.0	2010-02-01	2010-02-28
90	78	14.0	2010-04-01	2010-04-30
123	107	18.0	2010-04-01	2010-04-30
44	45	14.0	2010-02-01	2010-02-28
92	80	22.0	2010-04-01	2010-04-30
93	84	11.0	2010-04-01	2010-04-30
88	77	18.0	2010-04-01	2010-04-21
74	23	15.0	2010-04-01	2010-04-30
24	25	16.0	2010-04-01	2010-04-30
25	26	9.0	2010-04-01	2010-04-30
117	77	17.0	2010-04-22	2010-04-30
4	5	24.0	2010-03-01	2010-03-31
97	87	12.0	2010-04-01	2010-04-30
98	86	0.0	2010-04-01	2010-04-30
100	90	24.0	2010-04-01	2010-04-30
101	92	15.0	2010-04-01	2010-04-30
102	91	10.0	2010-04-01	2010-04-30
103	93	12.0	2010-04-01	2010-04-30
104	89	27.0	2010-04-01	2010-04-30
8	9	14.0	2010-04-01	2010-04-24
94	82	7.0	2010-04-01	2010-04-18
95	85	14.0	2010-04-01	2010-04-30
147	121	17.0	2010-04-01	2010-04-30
107	96	13.0	2010-04-01	2010-04-30
108	94	14.0	2010-04-01	2010-04-30
109	97	14.0	2010-04-01	2010-04-30
110	52	15.0	2010-04-01	2010-04-17
148	122	9.0	2010-04-01	2010-04-30
111	82	6.0	2010-04-19	2010-04-30
26	27	24.0	2010-04-01	2010-04-30
96	83	8.0	2010-04-01	2010-04-18
112	83	7.0	2010-04-19	2010-04-30
6	7	11.0	2010-04-01	2010-04-18
113	7	9.0	2010-04-19	2010-04-30
114	98	10.0	2010-04-01	2010-04-30
91	81	17.0	2010-04-01	2010-04-23
118	81	21.0	2010-04-24	2010-04-30
9	10	16.0	2010-04-01	2010-04-23
119	10	14.0	2010-04-24	2010-04-30
69	58	17.0	2010-04-01	2010-04-23
120	58	15.0	2010-04-24	2010-04-30
124	118	16.0	2010-04-01	2010-04-30
125	117	18.0	2010-04-01	2010-04-30
126	116	18.0	2010-04-01	2010-04-30
127	114	12.0	2010-04-01	2010-04-30
128	111	18.0	2010-04-01	2010-04-30
129	113	15.0	2010-04-01	2010-04-30
130	115	16.0	2010-04-01	2010-04-30
131	110	9.0	2010-04-01	2010-04-30
132	109	17.0	2010-04-01	2010-04-30
133	112	6.0	2010-04-01	2010-04-30
134	104	16.0	2010-04-01	2010-04-30
135	106	18.0	2010-04-01	2010-04-30
136	119	14.0	2010-04-01	2010-04-30
137	101	10.0	2010-04-01	2010-04-30
138	120	12.0	2010-04-01	2010-04-30
139	105	16.0	2010-04-01	2010-04-30
2	2	15.0	2010-04-01	2010-04-24
27	28	27.0	2010-04-01	2010-04-30
28	29	23.0	2010-04-01	2010-04-30
36	37	22.0	2010-04-01	2010-04-30
51	32	19.0	2010-04-01	2010-04-30
32	33	20.0	2010-04-01	2010-04-30
52	34	19.0	2010-04-01	2010-04-30
53	41	26.0	2010-04-01	2010-04-30
54	35	22.0	2010-04-01	2010-04-30
55	31	14.0	2010-04-01	2010-04-30
38	42	25.0	2010-04-01	2010-04-30
40	38	13.0	2010-04-01	2010-04-30
37	39	20.0	2010-04-01	2010-04-30
56	40	15.0	2010-04-01	2010-04-30
43	44	21.0	2010-04-01	2010-04-30
42	43	18.0	2010-04-01	2010-04-30
57	45	12.0	2010-04-01	2010-04-30
45	46	24.0	2010-04-01	2010-04-30
58	47	18.0	2010-04-01	2010-04-30
59	48	16.0	2010-04-01	2010-04-30
60	49	27.0	2010-04-01	2010-04-30
61	50	16.0	2010-04-01	2010-04-30
62	51	14.0	2010-04-01	2010-04-30
149	123	13.0	2010-04-01	2010-04-30
64	53	12.0	2010-04-01	2010-04-30
65	54	13.0	2010-04-01	2010-04-30
66	55	14.0	2010-04-01	2010-04-30
67	56	18.0	2010-04-01	2010-04-30
68	57	24.0	2010-04-01	2010-04-30
70	59	22.0	2010-04-01	2010-04-30
71	60	12.0	2010-04-01	2010-04-30
72	61	14.0	2010-04-01	2010-04-30
73	62	17.0	2010-04-01	2010-04-30
140	2	13.0	2010-04-25	2010-04-30
75	64	20.0	2010-04-01	2010-04-30
76	66	20.0	2010-04-01	2010-04-30
19	21	7.0	2010-04-01	2010-04-24
141	21	6.0	2010-04-25	2010-04-30
63	52	13.0	2010-04-18	2010-04-24
142	52	11.0	2010-04-25	2010-04-30
143	9	12.0	2010-04-25	2010-04-30
150	126	25.0	2010-04-01	2010-04-30
152	128	30.0	2010-04-01	2010-04-30
116	100	5.0	2010-04-01	2010-04-25
153	100	4.0	2010-04-26	2010-04-30
115	99	11.0	2010-04-01	2010-04-25
154	99	9.0	2010-04-26	2010-04-30
155	129	29.0	2010-04-01	2010-04-30
156	56	17.0	2010-05-01	2010-05-31
157	125	12.0	2010-05-01	2010-05-31
310	53	12.0	2010-05-01	2010-05-31
162	128	29.0	2010-05-01	2010-05-31
163	81	22.0	2010-05-01	2010-05-31
164	23	16.0	2010-05-01	2010-05-31
99	88	17.0	2010-05-01	2010-05-31
165	123	13.0	2010-05-01	2010-05-31
309	42	26.0	2010-05-01	2010-05-31
167	1	19.0	2010-05-01	2010-05-31
168	77	17.0	2010-05-01	2010-05-31
169	2	15.0	2010-05-01	2010-05-31
311	47	18.0	2010-05-01	2010-05-31
308	74	22.0	2010-05-08	2010-05-15
312	66	20.0	2010-05-01	2010-05-31
173	135	14.0	2010-05-01	2010-05-31
174	13	12.0	2010-05-01	2010-05-31
175	129	29.0	2010-05-01	2010-05-31
176	58	16.0	2010-05-01	2010-05-31
177	139	11.0	2010-05-01	2010-05-31
313	93	13.0	2010-05-01	2010-05-31
179	136	10.0	2010-05-01	2010-05-31
180	124	9.0	2010-05-01	2010-05-31
181	83	8.0	2010-05-01	2010-05-31
182	101	12.0	2010-05-01	2010-05-31
183	6	30.0	2010-05-01	2010-05-31
184	57	24.0	2010-05-01	2010-05-31
281	170	20.0	2010-05-01	2010-05-31
186	62	19.0	2010-05-01	2010-05-31
187	16	15.0	2010-05-01	2010-05-31
188	127	23.0	2010-05-01	2010-05-31
189	61	15.0	2010-05-01	2010-05-31
190	92	14.0	2010-05-01	2010-05-31
191	141	16.0	2010-05-01	2010-05-31
192	155	20.0	2010-05-01	2010-05-31
193	49	28.0	2010-05-01	2010-05-31
287	19	12.0	2010-05-03	2010-05-15
282	33	19.0	2010-05-01	2010-05-31
330	183	18.0	2010-05-01	2010-05-31
197	68	16.0	2010-05-01	2010-05-31
198	130	10.0	2010-05-01	2010-05-31
199	154	24.0	2010-05-01	2010-05-31
200	143	18.0	2010-05-01	2010-05-31
201	96	14.0	2010-05-01	2010-05-31
202	137	14.0	2010-05-01	2010-05-31
203	69	5.0	2010-05-01	2010-05-31
204	70	12.0	2010-05-01	2010-05-31
205	148	18.0	2010-05-01	2010-05-31
206	7	10.0	2010-05-01	2010-05-31
207	126	24.0	2010-05-01	2010-05-31
208	132	14.0	2010-05-01	2010-05-31
209	150	22.0	2010-05-01	2010-05-31
210	147	18.0	2010-05-01	2010-05-31
211	45	11.0	2010-05-01	2010-05-31
212	90	24.0	2010-05-01	2010-05-31
283	12	29.0	2010-05-01	2010-05-31
214	144	22.0	2010-05-01	2010-05-31
215	140	23.0	2010-05-01	2010-05-31
216	102	18.0	2010-05-01	2010-05-31
217	145	18.0	2010-05-01	2010-05-31
219	3	13.0	2010-05-01	2010-05-31
220	131	16.0	2010-05-01	2010-05-31
221	17	23.0	2010-05-01	2010-05-31
222	35	23.0	2010-05-01	2010-05-31
223	152	24.0	2010-05-01	2010-05-31
224	153	24.0	2010-05-01	2010-05-31
225	55	14.0	2010-05-01	2010-05-31
226	157	17.0	2010-05-01	2010-05-31
227	156	24.0	2010-05-01	2010-05-31
228	20	23.0	2010-05-01	2010-05-31
229	134	14.0	2010-05-01	2010-05-31
230	146	19.0	2010-05-01	2010-05-31
231	80	22.0	2010-05-01	2010-05-31
232	151	18.0	2010-05-01	2010-05-31
314	11	26.0	2010-05-01	2010-05-31
249	167	28.0	2010-05-01	2010-05-31
250	161	10.0	2010-05-01	2010-05-31
236	122	8.0	2010-05-01	2010-05-31
237	14	15.0	2010-05-01	2010-05-31
284	98	11.0	2010-05-01	2010-05-31
239	18	15.0	2010-05-01	2010-05-31
240	149	18.0	2010-05-01	2010-05-31
241	84	11.0	2010-05-01	2010-05-31
242	133	15.0	2010-05-01	2010-05-31
293	60	11.0	2010-05-04	2010-05-15
244	87	13.0	2010-05-01	2010-05-31
245	158	16.0	2010-05-01	2010-05-31
246	159	10.0	2010-05-01	2010-05-31
247	79	10.0	2010-05-01	2010-05-31
248	160	20.0	2010-05-01	2010-05-31
251	166	13.0	2010-05-01	2010-05-31
264	64	20.0	2010-05-02	2010-05-15
253	106	18.0	2010-05-01	2010-05-31
254	164	18.0	2010-05-01	2010-05-31
255	110	9.0	2010-05-01	2010-05-31
256	115	16.0	2010-05-01	2010-05-31
257	113	15.0	2010-05-01	2010-05-31
258	109	17.0	2010-05-01	2010-05-31
259	117	18.0	2010-05-01	2010-05-31
213	97	15.0	2010-04-30	2010-05-01
261	162	23.0	2010-05-01	2010-05-31
243	74	27.0	2010-04-30	2010-05-01
315	59	23.0	2010-05-01	2010-05-31
195	142	24.0	2010-04-30	2010-05-01
263	142	22.0	2010-05-02	2010-05-31
185	64	21.0	2010-04-30	2010-05-01
260	97	13.0	2010-05-02	2010-05-21
238	21	6.0	2010-04-30	2010-05-01
265	21	5.0	2010-05-02	2010-05-31
266	40	15.0	2010-05-01	2010-05-31
267	104	16.0	2010-05-01	2010-05-31
268	71	15.0	2010-05-01	2010-05-31
269	72	15.0	2010-05-01	2010-05-31
270	26	11.0	2010-05-01	2010-05-31
271	37	21.0	2010-05-01	2010-05-31
272	99	11.0	2010-05-01	2010-05-31
273	41	28.0	2010-05-01	2010-05-31
274	29	25.0	2010-05-01	2010-05-31
275	22	27.0	2010-05-01	2010-05-31
276	27	24.0	2010-05-01	2010-05-31
277	10	15.0	2010-05-01	2010-05-31
278	15	22.0	2010-05-01	2010-05-31
279	30	5.0	2010-05-01	2010-05-31
280	34	19.0	2010-05-01	2010-05-31
218	138	11.0	2010-05-01	2010-05-31
316	76	18.0	2010-05-01	2010-05-31
317	28	27.0	2010-05-01	2010-05-31
318	94	13.0	2010-05-01	2010-05-31
170	32	20.0	2010-05-01	2010-05-02
290	32	18.0	2010-05-03	2010-05-31
319	38	12.0	2010-05-01	2010-05-31
178	19	13.0	2010-05-01	2010-05-03
172	9	14.0	2010-05-01	2010-05-03
286	52	13.0	2010-05-03	2010-05-16
166	60	12.0	2010-05-01	2010-05-03
161	52	15.0	2010-05-01	2010-05-03
233	8	20.0	2010-05-01	2010-05-03
295	36	16.0	2010-05-01	2010-05-31
296	44	20.0	2010-05-01	2010-05-31
297	75	23.0	2010-05-01	2010-05-31
298	82	7.0	2010-05-01	2010-05-31
299	43	17.0	2010-05-01	2010-05-31
300	51	14.0	2010-05-01	2010-05-31
301	25	15.0	2010-05-01	2010-05-31
302	91	10.0	2010-05-01	2010-05-31
304	173	21.0	2010-05-01	2010-05-31
305	172	26.0	2010-05-01	2010-05-31
306	171	19.0	2010-05-01	2010-05-31
307	48	16.0	2010-05-01	2010-05-31
262	74	25.0	2010-05-02	2010-05-07
320	39	19.0	2010-05-01	2010-05-31
321	67	15.0	2010-05-01	2010-05-31
322	89	29.0	2010-05-01	2010-05-31
323	54	12.0	2010-05-01	2010-05-31
324	100	6.0	2010-05-01	2010-05-31
325	46	23.0	2010-05-01	2010-05-31
303	73	18.0	2010-05-01	2010-05-10
171	31	14.0	2010-05-01	2010-05-10
294	8	18.0	2010-05-04	2010-05-31
292	9	12.0	2010-05-04	2010-05-31
326	50	15.0	2010-05-01	2010-05-31
196	95	14.0	2010-05-01	2010-05-31
327	175	13.0	2010-05-01	2010-05-31
328	174	17.0	2010-05-01	2010-05-31
329	182	14.0	2010-05-01	2010-05-31
331	184	16.0	2010-05-01	2010-05-31
194	85	15.0	2010-05-01	2010-05-10
332	85	12.0	2010-05-11	2010-05-31
333	73	15.0	2010-05-11	2010-05-31
334	31	13.0	2010-05-11	2010-05-31
336	188	15.0	2010-05-01	2010-05-31
335	189	17.0	2010-05-01	2010-05-31
337	190	11.0	2010-05-01	2010-05-31
338	192	17.0	2010-05-01	2010-05-31
339	194	11.0	2010-05-01	2010-05-31
340	193	2.0	2010-05-01	2010-05-31
341	195	18.0	2010-05-01	2010-05-31
342	191	10.0	2010-05-01	2010-05-31
343	74	27.0	2010-05-16	2010-05-31
344	19	13.0	2010-05-16	2010-05-31
345	60	12.0	2010-05-16	2010-05-31
346	199	19.0	2010-05-01	2010-05-31
347	201	20.0	2010-05-01	2010-05-31
350	97	15.0	2010-05-22	2010-05-31
351	304	4.0	2010-05-01	2010-05-31
353	300	0.0	2010-05-01	2010-05-31
354	303	12.0	2010-05-01	2010-05-31
355	299	8.0	2010-05-01	2010-05-31
356	198	16.0	2010-05-01	2010-05-31
352	301	5.0	2010-05-01	2010-05-31
363	307	26.0	2010-05-01	2010-05-31
364	308	15.0	2010-05-01	2010-05-31
365	327	10.0	2010-05-01	2010-05-31
366	322	16.0	2010-05-01	2010-05-31
367	309	24.0	2010-05-01	2010-05-31
370	302	10.0	2010-05-01	2010-05-31
371	298	10.0	2010-05-01	2010-05-31
349	200	12.0	2010-05-01	2010-05-24
372	200	13.0	2010-05-25	2010-05-31
373	311	22.0	2010-05-01	2010-05-31
374	319	24.0	2010-05-01	2010-05-31
375	310	8.0	2010-05-01	2010-05-31
376	314	17.0	2010-05-01	2010-05-31
377	313	3.0	2010-05-01	2010-05-31
378	317	6.0	2010-05-01	2010-05-31
379	330	8.0	2010-05-01	2010-05-31
380	316	9.0	2010-05-01	2010-05-31
381	329	8.0	2010-05-01	2010-05-31
382	312	2.0	2010-05-01	2010-05-31
383	328	18.0	2010-05-01	2010-05-31
384	305	18.0	2010-05-01	2010-05-31
385	323	13.0	2010-05-01	2010-05-31
386	324	12.0	2010-05-01	2010-05-31
387	321	3.0	2010-05-01	2010-05-31
388	325	10.0	2010-05-01	2010-05-31
357	52	15.0	2010-05-18	2010-05-24
389	52	12.0	2010-05-25	2010-05-31
390	342	10.0	2010-05-01	2010-05-31
160	121	17.0	2010-05-01	2010-05-24
391	121	20.0	2010-05-25	2010-05-31
392	341	22.0	2010-05-01	2010-05-31
466	356	12.0	2010-10-01	2010-10-31
369	326	18.0	2010-05-01	2010-05-31
467	21	7.0	2010-10-01	2010-10-31
368	320	20.0	2010-05-01	2010-05-31
348	64	21.0	2010-05-16	2010-05-25
393	64	19.0	2010-05-26	2010-05-31
394	56	16.0	2010-07-01	2010-07-31
395	31	13.0	2010-07-01	2010-07-31
396	489	14.0	2010-07-01	2010-07-31
397	356	13.0	2010-07-01	2010-07-31
400	1	19.0	2010-09-01	2010-09-30
401	12	28.0	2010-09-01	2010-09-30
402	19	14.0	2010-09-01	2010-09-30
403	2	16.0	2010-09-01	2010-09-30
404	39	23.0	2010-09-01	2010-09-30
405	34	19.0	2010-09-01	2010-09-30
406	41	27.0	2010-09-01	2010-09-30
407	54	14.0	2010-09-01	2010-09-30
408	555	27.0	2010-09-01	2010-09-30
409	32	18.0	2010-09-01	2010-09-30
410	16	15.0	2010-09-01	2010-09-30
411	18	18.0	2010-09-01	2010-09-30
412	17	23.0	2010-09-01	2010-09-30
413	21	6.0	2010-09-01	2010-09-30
414	13	11.0	2010-09-01	2010-09-30
415	52	16.0	2010-09-01	2010-09-30
416	20	24.0	2010-09-01	2010-09-30
417	29	26.0	2010-09-01	2010-09-30
418	37	23.0	2010-09-01	2010-09-30
419	10	11.0	2010-09-01	2010-09-30
420	22	27.0	2010-09-01	2010-09-30
421	59	24.0	2010-09-01	2010-09-30
422	28	28.0	2010-09-01	2010-09-30
423	49	28.0	2010-09-01	2010-09-30
424	89	25.0	2010-09-01	2010-09-30
425	65	25.0	2010-09-01	2010-09-30
428	8	16.0	2010-09-01	2010-09-30
429	383	28.0	2010-09-01	2010-09-30
430	456	24.0	2010-09-01	2010-09-30
431	453	16.0	2010-09-01	2010-09-30
432	554	30.0	2010-09-01	2010-09-30
433	438	16.0	2010-09-01	2010-09-30
434	98	11.0	2010-10-01	2010-10-31
435	13	11.0	2010-10-01	2010-10-31
436	32	19.0	2010-10-01	2010-10-31
437	459	14.0	2010-10-01	2010-10-31
438	58	14.0	2010-10-01	2010-10-31
442	556	9.0	2010-10-01	2010-10-31
443	198	17.0	2010-10-01	2010-10-31
444	68	16.0	2010-10-01	2010-10-31
445	559	16.0	2010-10-01	2010-10-31
446	2	15.0	2010-10-01	2010-10-31
447	438	15.0	2010-10-01	2010-10-31
448	1	19.0	2010-10-01	2010-10-31
449	300	0.0	2010-10-01	2010-10-31
450	57	25.0	2010-10-01	2010-10-31
452	35	24.0	2010-10-01	2010-10-31
453	460	24.0	2010-10-01	2010-10-31
454	22	28.0	2010-10-01	2010-10-31
455	19	14.0	2010-10-01	2010-10-31
456	10	10.0	2010-10-01	2010-10-31
458	557	19.0	2010-10-01	2010-10-31
459	39	23.0	2010-10-01	2010-10-31
460	561	6.0	2010-10-01	2010-10-31
462	82	5.0	2010-10-01	2010-10-31
464	92	15.0	2010-10-01	2010-10-31
465	187	12.0	2010-10-01	2010-10-31
468	110	9.0	2010-10-01	2010-10-31
469	558	14.0	2010-10-01	2010-10-31
470	48	16.0	2010-10-01	2010-10-31
471	64	17.0	2010-10-01	2010-10-31
472	506	17.0	2010-10-01	2010-10-31
473	560	14.0	2010-10-01	2010-10-31
474	96	10.0	2010-10-01	2010-10-31
475	306	16.0	2010-10-01	2010-10-31
476	8	16.0	2010-10-01	2010-10-31
479	562	7.0	2010-10-01	2010-10-31
480	53	14.0	2010-10-01	2010-10-31
481	555	24.0	2010-10-01	2010-10-31
482	85	15.0	2010-10-01	2010-10-31
483	454	15.0	2010-10-01	2010-10-31
484	50	16.0	2010-10-01	2010-10-31
485	539	16.0	2010-10-01	2010-10-31
486	95	14.0	2010-10-01	2010-10-31
451	405	25.0	2010-09-30	2010-10-01
487	405	24.0	2010-10-02	2010-10-31
488	29	24.0	2010-10-01	2010-10-31
489	130	10.0	2010-10-01	2010-10-31
490	81	20.0	2010-10-01	2010-10-31
491	564	9.0	2010-10-01	2010-10-31
492	565	10.0	2010-10-01	2010-10-31
252	105	16.0	2010-04-01	2010-05-31
440	453	16.0	2010-09-30	2010-10-01
463	20	23.0	2010-09-30	2010-10-01
461	538	4.0	2010-09-30	2010-10-01
457	6	28.0	2010-09-30	2010-10-01
493	566	15.0	2010-10-01	2010-10-31
494	567	12.0	2010-10-01	2010-10-31
495	568	19.0	2010-10-01	2010-10-31
496	569	21.0	2010-10-01	2010-10-31
497	570	18.0	2010-10-01	2010-10-31
498	571	24.0	2010-10-01	2010-10-31
499	572	24.0	2010-10-01	2010-10-31
500	573	24.0	2010-10-01	2010-10-31
501	62	18.0	2010-10-01	2010-10-31
502	60	14.0	2010-10-01	2010-10-31
503	59	24.0	2010-10-01	2010-10-31
504	456	24.0	2010-10-01	2010-10-31
505	481	13.0	2010-10-01	2010-10-31
506	574	24.0	2010-10-01	2010-10-31
439	304	3.0	2010-10-01	2010-10-31
507	79	8.0	2010-10-01	2010-10-31
508	443	13.0	2010-10-01	2010-10-31
509	12	24.0	2010-10-01	2010-10-31
510	88	17.0	2010-10-01	2010-10-31
511	453	14.0	2010-10-02	2010-10-31
441	52	16.0	2010-09-30	2010-10-01
512	52	14.0	2010-10-02	2010-10-31
513	20	20.0	2010-10-02	2010-10-31
514	538	3.0	2010-10-02	2010-10-31
515	6	24.0	2010-10-02	2010-10-31
\.


--
-- Data for Name: web_hole; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_hole (id, tee_id, number, par, strokeindex, yardage) FROM stdin;
1	1	1	5	13	586
2	1	2	3	11	223
3	1	3	4	3	367
4	1	4	4	15	367
5	1	5	5	9	500
6	1	6	4	1	432
7	1	7	3	7	198
8	1	8	4	17	294
9	1	9	3	5	215
10	1	10	4	10	314
11	1	11	3	14	212
12	1	12	4	18	327
13	1	13	4	2	385
14	1	14	3	6	208
15	1	15	4	12	308
16	1	16	5	8	576
17	1	17	4	16	328
18	1	18	4	4	370
20	3	2	4	9	373
21	3	3	4	7	405
22	3	4	3	5	180
23	3	5	5	3	528
24	3	6	4	15	388
25	3	7	3	11	197
26	3	8	4	1	433
27	3	9	5	17	515
28	3	10	5	2	601
29	3	11	4	10	425
30	3	12	4	12	391
31	3	13	5	6	555
32	3	14	3	14	209
33	3	15	4	18	330
34	3	16	3	16	190
35	3	17	4	8	412
36	3	18	4	4	451
19	3	1	4	13	390
37	4	1	4	13	321
38	4	2	4	9	319
39	4	3	4	7	354
40	4	4	3	5	143
41	4	5	5	3	465
42	4	6	4	15	347
43	4	7	3	11	141
44	4	8	4	1	375
45	4	9	5	17	443
46	4	10	5	2	512
47	4	11	4	10	374
48	4	12	4	12	329
49	4	13	5	6	460
50	4	14	3	14	162
51	4	15	4	18	287
52	4	16	3	16	139
53	4	17	4	8	360
54	4	18	4	4	399
55	5	1	4	4	357
56	5	2	3	18	165
57	5	3	4	16	320
58	5	4	5	14	521
59	5	5	3	10	175
60	5	6	4	6	324
61	5	7	3	8	210
62	5	8	5	2	551
63	5	9	4	12	338
64	5	10	4	13	317
65	5	11	3	17	178
66	5	12	4	15	322
67	5	13	5	3	557
68	5	14	4	1	386
69	5	15	3	9	201
70	5	16	4	5	365
71	5	17	4	11	359
72	5	18	4	7	377
73	2	1	5	13	500
74	2	2	3	11	123
75	2	3	4	3	456
76	2	4	4	15	456
77	2	5	5	9	478
78	2	6	4	1	468
79	2	7	3	7	159
80	2	8	4	17	321
81	2	9	3	5	180
82	2	10	4	10	312
83	2	11	3	14	200
84	2	12	4	18	311
85	2	13	4	2	311
86	2	14	3	6	175
87	2	15	4	12	290
88	2	16	5	8	469
89	2	17	4	16	250
90	2	18	4	4	333
\.


--
-- Data for Name: web_matchentry; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_matchentry (id, tournament_id, player_id, tee_id, category, round) FROM stdin;
985	20	209	1	E	1
992	20	246	2	E	1
999	20	267	2	F	1
1006	20	286	1	D	1
1012	20	281	1	D	1
1224	21	71	1	\N	1
1229	21	200	1	\N	1
1234	21	57	1	\N	1
1239	21	52	1	\N	1
1249	21	301	1	\N	1
1254	21	110	1	\N	1
1289	22	69	1	\N	1
1294	22	1	1	\N	1
1299	22	175	1	\N	1
1304	22	27	1	\N	1
1309	22	29	1	\N	1
1314	22	95	1	\N	1
1319	22	303	1	\N	1
1324	22	307	1	\N	1
979	19	248	1	B	1
986	20	214	1	E	1
993	20	252	2	E	1
1000	20	268	2	F	1
1007	20	287	2	D	1
1013	20	289	1	D	1
1225	21	64	1	\N	1
1235	21	130	1	\N	1
1240	21	34	1	\N	1
1245	21	298	1	\N	1
1250	21	303	1	\N	1
1256	21	200	1	\N	2
1257	21	57	1	\N	2
1258	21	52	1	\N	2
1260	21	301	1	\N	2
1261	21	110	1	\N	2
1262	21	64	1	\N	2
1264	21	130	1	\N	2
1265	21	34	1	\N	2
1266	21	298	1	\N	2
1267	21	303	1	\N	2
1269	21	15	1	\N	2
1270	21	193	1	\N	2
1271	21	27	1	\N	2
1272	21	302	1	\N	2
1273	21	304	1	\N	2
1274	21	13	1	\N	2
1275	21	123	1	\N	2
1276	21	198	1	\N	2
1277	21	68	1	\N	2
1278	21	299	1	\N	2
1279	21	305	1	\N	2
1280	21	69	1	\N	2
1281	21	1	1	\N	2
1282	21	175	1	\N	2
1283	21	97	1	\N	2
1284	21	300	1	\N	2
1285	21	306	1	\N	2
1290	22	300	1	\N	1
1295	22	123	1	\N	1
1300	22	52	1	\N	1
1305	22	74	1	\N	1
1310	22	22	1	\N	1
1315	22	68	1	\N	1
1320	22	130	1	\N	1
1325	22	308	1	\N	1
980	19	234	1	B	1
987	20	207	1	E	1
994	20	253	2	E	1
1001	20	280	1	D	1
1008	20	288	1	D	1
1014	19	248	1	B	2
1015	19	234	1	B	2
1016	19	265	1	C	2
1017	19	269	1	C	2
1018	19	233	1	B	2
1019	19	203	1	A	2
1020	19	205	1	A	2
1021	19	206	1	A	2
1022	19	208	1	A	2
1023	19	210	1	A	2
1024	19	211	1	A	2
1025	19	212	1	A	2
1026	19	213	1	A	2
1027	19	216	1	A	2
1028	19	218	1	A	2
1029	19	220	1	A	2
1030	19	221	1	A	2
1031	19	222	1	A	2
1032	19	223	1	A	2
1033	19	224	1	A	2
1034	19	225	1	A	2
1035	19	226	1	A	2
1036	19	292	1	A	2
1037	19	227	1	B	2
1038	19	228	1	B	2
1039	19	229	1	B	2
1040	19	230	1	B	2
1041	19	231	1	B	2
1042	19	232	1	B	2
1043	19	235	1	B	2
1044	19	236	1	B	2
1045	19	237	1	B	2
1046	19	240	1	B	2
1047	19	241	1	B	2
1048	19	243	1	B	2
1049	19	245	1	B	2
1050	19	247	1	B	2
1051	19	249	1	B	2
1052	19	250	1	B	2
1053	19	251	1	B	2
1054	19	294	1	B	2
1055	19	254	1	C	2
1056	19	258	1	C	2
1057	19	259	1	C	2
1058	19	263	1	C	2
1059	19	270	1	C	2
1060	19	272	1	C	2
1061	19	275	1	C	2
1062	19	277	1	C	2
1063	19	279	1	C	2
1064	19	248	1	B	3
1065	19	234	1	B	3
1066	19	265	1	C	3
1067	19	269	1	C	3
1068	19	233	1	B	3
1069	19	203	1	A	3
1070	19	205	1	A	3
1071	19	206	1	A	3
1072	19	208	1	A	3
1073	19	210	1	A	3
1074	19	211	1	A	3
1075	19	212	1	A	3
1076	19	213	1	A	3
1077	19	216	1	A	3
1078	19	218	1	A	3
1079	19	220	1	A	3
1080	19	221	1	A	3
1081	19	222	1	A	3
1082	19	223	1	A	3
1083	19	224	1	A	3
1084	19	225	1	A	3
1085	19	226	1	A	3
1086	19	292	1	A	3
1087	19	227	1	B	3
1088	19	228	1	B	3
1089	19	229	1	B	3
1090	19	230	1	B	3
1091	19	231	1	B	3
1092	19	232	1	B	3
1093	19	235	1	B	3
1094	19	236	1	B	3
1095	19	237	1	B	3
1096	19	240	1	B	3
1097	19	241	1	B	3
1098	19	243	1	B	3
1099	19	245	1	B	3
1100	19	247	1	B	3
1101	19	249	1	B	3
1102	19	250	1	B	3
1103	19	251	1	B	3
1104	19	294	1	B	3
1105	19	254	1	C	3
1106	19	258	1	C	3
1107	19	259	1	C	3
1108	19	263	1	C	3
1109	19	270	1	C	3
1110	19	272	1	C	3
1111	19	275	1	C	3
1112	19	277	1	C	3
1113	19	279	1	C	3
1114	19	248	1	B	4
1115	19	234	1	B	4
1116	19	265	1	C	4
1117	19	269	1	C	4
1118	19	233	1	B	4
1119	19	203	1	A	4
1120	19	205	1	A	4
1121	19	206	1	A	4
1122	19	208	1	A	4
1123	19	210	1	A	4
1124	19	211	1	A	4
1125	19	212	1	A	4
1126	19	213	1	A	4
1127	19	216	1	A	4
1128	19	218	1	A	4
1129	19	220	1	A	4
1130	19	221	1	A	4
1131	19	222	1	A	4
1132	19	223	1	A	4
1133	19	224	1	A	4
1134	19	225	1	A	4
1135	19	226	1	A	4
1136	19	292	1	A	4
1137	19	227	1	B	4
1138	19	228	1	B	4
1139	19	229	1	B	4
1140	19	230	1	B	4
1141	19	231	1	B	4
1142	19	232	1	B	4
1143	19	235	1	B	4
1144	19	236	1	B	4
1145	19	237	1	B	4
1146	19	240	1	B	4
1147	19	241	1	B	4
1148	19	243	1	B	4
1149	19	245	1	B	4
1150	19	247	1	B	4
1151	19	249	1	B	4
1152	19	250	1	B	4
1153	19	251	1	B	4
1154	19	294	1	B	4
1155	19	254	1	C	4
1156	19	258	1	C	4
1157	19	259	1	C	4
1158	19	263	1	C	4
1159	19	270	1	C	4
1160	19	272	1	C	4
1161	19	275	1	C	4
1162	19	277	1	C	4
981	19	265	1	C	1
988	20	215	1	E	1
995	20	293	2	E	1
1002	20	282	1	D	1
1009	20	290	1	D	1
1163	19	279	1	C	4
1231	21	15	1	\N	1
1236	21	193	1	\N	1
1241	21	27	1	\N	1
1246	21	302	1	\N	1
1251	21	304	1	\N	1
1286	22	96	1	\N	1
1291	22	301	1	\N	1
1296	22	57	1	\N	1
1301	22	304	1	\N	1
1306	22	128	1	\N	1
1311	22	110	1	\N	1
1316	22	97	1	\N	1
1321	22	6	1	\N	1
982	19	269	1	C	1
989	20	238	1	E	1
996	20	295	2	E	1
1003	20	283	1	D	1
1010	20	291	2	D	1
1227	21	13	1	\N	1
1232	21	123	1	\N	1
1237	21	198	1	\N	1
1242	21	68	1	\N	1
1247	21	299	1	\N	1
1252	21	305	1	\N	1
1287	22	64	1	\N	1
1292	22	122	1	\N	1
1297	22	193	1	\N	1
1302	22	37	1	\N	1
1307	22	79	1	\N	1
1312	22	40	1	\N	1
1317	22	12	1	\N	1
1322	22	10	1	\N	1
983	19	233	1	B	1
990	20	239	1	E	1
997	20	257	2	F	1
1004	20	284	2	D	1
129	4	13	1	\N	1
80	2	4	1	\N	1
163	4	77	1	\N	1
131	4	21	1	\N	1
132	4	19	1	\N	1
133	4	61	1	\N	1
164	4	78	1	\N	1
165	4	79	1	\N	1
136	4	69	1	\N	1
137	4	67	1	\N	1
138	4	9	1	\N	1
139	4	60	1	\N	1
140	4	68	1	\N	1
141	4	72	1	\N	1
142	4	70	1	\N	1
143	4	71	1	\N	1
144	4	36	1	\N	1
83	3	1	1	\N	1
145	4	1	1	\N	1
146	4	74	1	\N	1
147	4	64	1	\N	1
148	4	22	1	\N	1
149	4	47	1	\N	1
150	4	42	1	\N	1
151	4	10	1	\N	1
152	4	73	1	\N	1
214	5	20	1	\N	1
154	4	8	1	\N	1
155	4	27	1	\N	1
156	4	15	1	\N	1
157	4	75	1	\N	1
166	5	64	1	\N	1
215	5	74	1	\N	1
160	4	20	1	\N	1
161	4	32	1	\N	1
162	4	6	1	\N	1
167	5	1	1	\N	1
168	5	47	1	\N	1
169	5	10	1	\N	1
170	5	62	1	\N	1
171	5	6	1	\N	1
172	5	12	1	\N	1
173	5	27	1	\N	1
174	5	15	1	\N	1
175	5	75	1	\N	1
176	5	76	1	\N	1
177	5	17	1	\N	1
178	5	49	1	\N	1
179	5	81	1	\N	1
180	5	80	1	\N	1
181	5	13	1	\N	1
182	5	7	1	\N	1
3	1	3	1	\N	1
82	2	37	1	\N	1
6	1	6	1	\N	1
7	1	7	1	\N	1
8	1	8	1	\N	1
9	1	9	1	\N	1
10	1	10	1	\N	1
11	1	11	1	\N	1
85	3	19	1	\N	1
13	1	13	1	\N	1
14	1	14	1	\N	1
86	3	13	1	\N	1
16	1	16	1	\N	1
17	1	17	1	\N	1
18	1	18	1	\N	1
19	1	19	1	\N	1
87	3	23	1	\N	1
21	1	21	1	\N	1
22	1	22	1	\N	1
23	1	23	1	\N	1
88	3	18	1	\N	1
90	3	20	1	\N	1
91	3	34	1	\N	1
92	3	10	1	\N	1
93	3	31	1	\N	1
30	2	1	1	\N	1
94	3	9	1	\N	1
95	3	6	1	\N	1
183	5	69	1	\N	1
97	3	12	1	\N	1
35	2	6	1	\N	1
36	2	7	1	\N	1
37	2	8	1	\N	1
98	3	17	1	\N	1
39	2	10	1	\N	1
40	2	11	1	\N	1
99	3	16	1	\N	1
42	2	13	1	\N	1
100	3	32	1	\N	1
101	3	21	1	\N	1
45	2	16	1	\N	1
102	3	27	1	\N	1
50	2	18	1	\N	1
51	2	19	1	\N	1
52	2	20	1	\N	1
53	2	21	1	\N	1
54	2	22	1	\N	1
55	2	23	1	\N	1
103	3	40	1	\N	1
57	2	25	1	\N	1
58	2	26	1	\N	1
59	2	27	1	\N	1
60	2	28	1	\N	1
104	3	45	1	\N	1
62	1	30	1	\N	1
105	3	22	1	\N	1
64	1	31	1	\N	1
65	1	32	1	\N	1
106	3	41	1	\N	1
67	1	34	1	\N	1
68	1	35	1	\N	1
69	2	30	1	\N	1
107	3	26	1	\N	1
108	3	30	1	\N	1
72	2	32	1	\N	1
73	1	1	1	\N	1
74	1	2	1	\N	1
75	1	4	1	\N	1
184	5	67	1	\N	1
77	1	33	1	\N	1
110	3	47	1	\N	1
79	1	20	1	\N	1
111	3	48	1	\N	1
112	3	49	1	\N	1
113	3	50	1	\N	1
114	3	51	1	\N	1
115	3	52	1	\N	1
116	3	53	1	\N	1
117	3	54	1	\N	1
118	3	55	1	\N	1
119	3	56	1	\N	1
120	3	57	1	\N	1
121	3	59	1	\N	1
122	3	60	1	\N	1
123	3	61	1	\N	1
124	3	62	1	\N	1
185	5	9	1	\N	1
126	3	58	1	\N	1
127	3	64	1	\N	1
186	5	21	1	\N	1
216	5	88	1	\N	1
188	5	19	1	\N	1
189	5	61	1	\N	1
190	5	60	1	\N	1
191	5	68	1	\N	1
192	5	72	1	\N	1
193	5	70	1	\N	1
194	5	71	1	\N	1
195	5	36	1	\N	1
196	5	16	1	\N	1
197	5	18	1	\N	1
198	5	82	1	\N	1
199	5	83	1	\N	1
200	5	84	1	\N	1
201	5	85	1	\N	1
202	5	32	1	\N	1
203	5	52	1	\N	1
204	5	29	1	\N	1
217	6	64	1	\N	1
206	5	86	1	\N	1
207	5	87	1	\N	1
208	5	79	1	\N	1
209	5	8	1	\N	1
210	5	2	1	\N	1
211	5	77	1	\N	1
212	5	78	1	\N	1
213	5	35	1	\N	1
218	6	1	1	\N	1
219	6	47	1	\N	1
220	6	10	1	\N	1
221	6	81	1	\N	1
222	6	62	1	\N	1
223	6	6	1	\N	1
224	6	88	1	\N	1
225	6	12	1	\N	1
226	6	8	1	\N	1
227	6	17	1	\N	1
228	6	76	1	\N	1
229	6	49	1	\N	1
230	6	35	1	\N	1
231	6	80	1	\N	1
232	6	28	1	\N	1
233	6	87	1	\N	1
234	6	29	1	\N	1
235	6	34	1	\N	1
236	6	20	1	\N	1
237	6	90	1	\N	1
238	6	22	1	\N	1
239	6	74	1	\N	1
240	6	41	1	\N	1
241	6	89	1	\N	1
242	6	86	1	\N	1
243	6	77	1	\N	1
244	6	95	1	\N	1
245	6	91	1	\N	1
246	6	13	1	\N	1
247	6	82	1	\N	1
248	6	7	1	\N	1
249	6	69	1	\N	1
250	6	67	1	\N	1
251	6	9	1	\N	1
252	6	21	1	\N	1
253	6	92	1	\N	1
254	6	2	1	\N	1
255	6	19	1	\N	1
256	6	61	1	\N	1
257	6	60	1	\N	1
258	6	83	1	\N	1
259	6	71	1	\N	1
260	6	16	1	\N	1
261	6	18	1	\N	1
262	6	85	1	\N	1
263	6	84	1	\N	1
264	6	79	1	\N	1
265	6	52	1	\N	1
266	6	93	1	\N	1
267	6	94	1	\N	1
268	6	3	1	\N	1
274	7	21	1	\N	1
270	6	78	1	\N	1
271	6	96	1	\N	1
272	6	97	1	\N	1
273	6	68	1	\N	1
275	7	10	1	\N	1
276	7	31	1	\N	1
277	7	69	1	\N	1
278	7	30	1	\N	1
279	7	9	1	\N	1
280	7	68	1	\N	1
281	7	61	1	\N	1
282	7	60	1	\N	1
283	7	98	1	\N	1
284	7	99	1	\N	1
285	7	58	1	\N	1
286	7	57	1	\N	1
287	7	64	1	\N	1
288	7	74	1	\N	1
289	7	20	1	\N	1
290	7	47	1	\N	1
291	7	1	1	\N	1
292	7	81	1	\N	1
293	7	15	1	\N	1
294	7	77	1	\N	1
295	7	8	1	\N	1
296	7	32	1	\N	1
297	7	52	1	\N	1
298	7	67	1	\N	1
299	8	74	1	\N	1
300	8	64	1	\N	1
301	8	20	1	\N	1
302	8	35	1	\N	1
303	8	47	1	\N	1
304	8	27	1	\N	1
305	8	12	1	\N	1
306	8	81	1	\N	1
307	8	49	1	\N	1
308	8	62	1	\N	1
309	8	77	1	\N	1
310	8	1	1	\N	1
311	8	6	1	\N	1
312	8	42	1	\N	1
313	8	41	1	\N	1
314	8	67	1	\N	1
315	8	21	1	\N	1
316	8	52	1	\N	1
317	8	2	1	\N	1
318	8	10	1	\N	1
319	8	31	1	\N	1
320	8	69	1	\N	1
321	8	98	1	\N	1
322	8	30	1	\N	1
323	8	9	1	\N	1
324	8	13	1	\N	1
325	8	68	1	\N	1
326	8	61	1	\N	1
327	8	60	1	\N	1
328	8	26	1	\N	1
329	8	72	1	\N	1
330	8	19	1	\N	1
331	8	100	1	\N	1
332	8	79	1	\N	1
333	8	87	1	\N	1
334	8	8	1	\N	1
335	9	67	1	\N	1
336	9	21	1	\N	1
337	9	52	1	\N	1
338	9	71	1	\N	1
339	9	2	1	\N	1
340	9	100	1	\N	1
341	9	10	1	\N	1
342	9	31	1	\N	1
343	9	69	1	\N	1
344	9	13	1	\N	1
345	9	98	1	\N	1
346	9	30	1	\N	1
347	9	9	1	\N	1
348	9	95	1	\N	1
349	9	68	1	\N	1
399	9	77	1	\N	1
351	9	61	1	\N	1
352	9	60	1	\N	1
353	9	26	1	\N	1
354	9	72	1	\N	1
355	9	99	1	\N	1
356	9	19	1	\N	1
357	9	18	1	\N	1
358	9	16	1	\N	1
359	9	45	1	\N	1
360	9	101	1	\N	1
361	9	64	1	\N	1
362	9	20	1	\N	1
363	9	74	1	\N	1
364	9	58	1	\N	1
365	9	57	1	\N	1
366	9	27	1	\N	1
367	9	37	1	\N	1
368	9	47	1	\N	1
369	9	12	1	\N	1
370	9	1	1	\N	1
371	9	35	1	\N	1
372	9	49	1	\N	1
373	9	62	1	\N	1
374	9	32	1	\N	1
375	9	41	1	\N	1
376	9	8	1	\N	1
377	9	17	1	\N	1
378	9	89	1	\N	1
379	9	34	1	\N	1
380	9	102	1	\N	1
381	9	87	1	\N	1
382	9	108	1	\N	1
383	9	107	1	\N	1
384	9	118	1	\N	1
385	9	116	1	\N	1
386	9	114	1	\N	1
387	9	111	1	\N	1
388	9	113	1	\N	1
389	9	115	1	\N	1
390	9	110	1	\N	1
391	9	117	1	\N	1
392	9	109	1	\N	1
393	9	112	1	\N	1
394	9	106	1	\N	1
395	9	104	1	\N	1
396	9	105	1	\N	1
397	9	119	1	\N	1
398	9	120	1	\N	1
400	9	6	1	\N	1
401	10	21	1	\N	1
402	10	83	1	\N	1
403	10	19	1	\N	1
404	10	13	1	\N	1
405	10	23	1	\N	1
406	10	77	1	\N	1
407	10	58	1	\N	1
408	10	52	1	\N	1
409	10	9	1	\N	1
410	10	99	1	\N	1
411	10	69	1	\N	1
412	10	61	1	\N	1
413	10	60	1	\N	1
414	10	72	1	\N	1
415	10	45	1	\N	1
416	10	95	1	\N	1
417	10	68	1	\N	1
418	10	31	1	\N	1
419	10	1	1	\N	1
420	10	20	1	\N	1
421	10	41	1	\N	1
422	10	74	1	\N	1
423	10	56	1	\N	1
424	10	8	1	\N	1
425	10	32	1	\N	1
426	10	15	1	\N	1
427	10	125	1	\N	1
428	10	124	1	\N	1
429	10	123	1	\N	1
430	10	122	1	\N	1
440	11	21	1	\N	1
432	10	10	1	\N	1
433	10	64	1	\N	1
434	10	57	1	\N	1
435	10	126	1	\N	1
436	10	127	1	\N	1
437	10	128	1	\N	1
438	10	79	1	\N	1
439	10	129	1	\N	1
441	11	83	1	\N	1
442	11	96	1	\N	1
443	11	19	1	\N	1
444	11	13	1	\N	1
445	11	23	1	\N	1
446	11	77	1	\N	1
447	11	58	1	\N	1
448	11	52	1	\N	1
449	11	9	1	\N	1
450	11	101	1	\N	1
451	11	2	1	\N	1
452	11	70	1	\N	1
453	11	124	1	\N	1
454	11	55	1	\N	1
455	11	122	1	\N	1
456	11	7	1	\N	1
457	11	123	1	\N	1
458	11	69	1	\N	1
459	11	41	1	\N	1
460	11	61	1	\N	1
461	11	60	1	\N	1
462	11	14	1	\N	1
463	11	45	1	\N	1
464	11	95	1	\N	1
465	11	68	1	\N	1
466	11	84	1	\N	1
467	11	31	1	\N	1
468	11	85	1	\N	1
469	11	1	1	\N	1
470	11	20	1	\N	1
471	11	74	1	\N	1
472	11	8	1	\N	1
473	11	35	1	\N	1
474	11	64	1	\N	1
475	11	57	1	\N	1
476	11	49	1	\N	1
477	11	128	1	\N	1
478	11	56	1	\N	1
479	11	12	1	\N	1
480	11	121	1	\N	1
481	11	126	1	\N	1
482	11	80	1	\N	1
483	11	127	1	\N	1
484	11	6	1	\N	1
485	11	90	1	\N	1
486	11	97	1	\N	1
487	11	129	1	\N	1
488	11	62	1	\N	1
489	11	102	1	\N	1
490	11	32	1	\N	1
491	11	130	1	\N	1
492	11	142	1	\N	1
493	11	143	1	\N	1
494	11	144	1	\N	1
495	11	145	1	\N	1
496	11	146	1	\N	1
497	11	147	1	\N	1
498	11	148	1	\N	1
499	11	149	1	\N	1
500	11	150	1	\N	1
501	11	151	1	\N	1
502	11	152	1	\N	1
503	11	153	1	\N	1
504	11	154	1	\N	1
505	11	155	1	\N	1
506	11	156	1	\N	1
507	11	157	1	\N	1
508	11	131	1	\N	1
509	11	132	1	\N	1
510	11	133	1	\N	1
511	11	134	1	\N	1
512	11	135	1	\N	1
513	11	136	1	\N	1
514	11	137	1	\N	1
515	11	138	1	\N	1
516	11	139	1	\N	1
517	11	140	1	\N	1
518	11	141	1	\N	1
519	11	103	1	\N	1
520	11	3	1	\N	1
521	11	125	1	\N	1
522	11	87	1	\N	1
523	11	17	1	\N	1
524	11	81	1	\N	1
525	11	16	1	\N	1
526	11	18	1	\N	1
527	11	79	1	\N	1
528	11	159	1	\N	1
529	11	92	1	\N	1
530	11	160	1	\N	1
531	11	158	1	\N	1
532	12	32	1	\N	1
533	12	52	1	\N	1
534	12	104	1	\N	1
535	12	123	1	\N	1
536	12	2	1	\N	1
537	12	58	1	\N	1
538	12	16	1	\N	1
539	12	1	1	\N	1
540	12	71	1	\N	1
541	12	81	1	\N	1
542	12	72	1	\N	1
543	12	97	1	\N	1
544	12	61	1	\N	1
545	12	49	1	\N	1
546	12	26	1	\N	1
547	12	160	1	\N	1
548	12	148	1	\N	1
549	12	37	1	\N	1
550	12	99	1	\N	1
551	12	144	1	\N	1
552	12	147	1	\N	1
553	12	122	1	\N	1
554	12	139	1	\N	1
555	12	101	1	\N	1
556	12	60	1	\N	1
557	12	151	1	\N	1
558	12	7	1	\N	1
559	12	62	1	\N	1
560	12	130	1	\N	1
561	12	141	1	\N	1
562	12	14	1	\N	1
563	12	41	1	\N	1
564	12	105	1	\N	1
565	12	29	1	\N	1
566	12	18	1	\N	1
567	12	138	1	\N	1
568	12	113	1	\N	1
569	12	124	1	\N	1
570	12	140	1	\N	1
571	12	45	1	\N	1
572	12	8	1	\N	1
573	12	56	1	\N	1
574	12	74	1	\N	1
575	12	69	1	\N	1
576	12	159	1	\N	1
577	12	3	1	\N	1
578	12	133	1	\N	1
579	12	92	1	\N	1
580	12	126	1	\N	1
581	12	23	1	\N	1
582	12	9	1	\N	1
583	12	135	1	\N	1
584	12	137	1	\N	1
585	12	102	1	\N	1
586	12	22	1	\N	1
587	12	136	1	\N	1
588	12	96	1	\N	1
589	12	153	1	\N	1
590	12	115	1	\N	1
591	12	154	1	\N	1
592	12	83	1	\N	1
593	12	127	1	\N	1
594	12	156	1	\N	1
595	12	132	1	\N	1
596	12	152	1	\N	1
597	12	27	1	\N	1
598	12	149	1	\N	1
599	12	142	1	\N	1
600	12	70	1	\N	1
601	12	55	1	\N	1
602	12	10	1	\N	1
603	12	106	1	\N	1
604	12	15	1	\N	1
605	12	158	1	\N	1
606	12	6	1	\N	1
607	12	109	1	\N	1
608	12	20	1	\N	1
609	12	150	1	\N	1
610	12	157	1	\N	1
611	12	131	1	\N	1
612	12	19	1	\N	1
613	12	17	1	\N	1
614	12	30	1	\N	1
615	12	68	1	\N	1
616	12	64	1	\N	1
617	12	40	1	\N	1
618	12	13	1	\N	1
619	12	35	1	\N	1
620	12	87	1	\N	1
621	12	77	1	\N	1
622	12	80	1	\N	1
623	12	95	1	\N	1
624	12	134	1	\N	1
625	12	121	1	\N	1
626	12	110	1	\N	1
627	12	34	1	\N	1
628	12	21	1	\N	1
629	12	85	1	\N	1
630	12	31	1	\N	1
631	12	146	1	\N	1
632	12	164	1	\N	1
633	12	161	1	\N	1
634	12	162	1	\N	1
635	12	165	1	\N	1
636	12	163	1	\N	1
637	12	167	1	\N	1
638	12	166	1	\N	1
639	12	168	1	\N	1
640	12	90	1	\N	1
641	12	117	1	\N	1
642	13	19	1	\N	1
643	13	58	1	\N	1
644	13	52	1	\N	1
645	13	98	1	\N	1
646	13	10	1	\N	1
647	13	123	1	\N	1
648	13	21	1	\N	1
649	13	45	1	\N	1
650	13	9	1	\N	1
651	13	60	1	\N	1
652	13	31	1	\N	1
653	13	61	1	\N	1
654	13	85	1	\N	1
655	13	20	1	\N	1
656	13	74	1	\N	1
657	13	57	1	\N	1
658	13	64	1	\N	1
659	13	128	1	\N	1
660	13	32	1	\N	1
661	13	12	1	\N	1
662	13	8	1	\N	1
663	13	170	1	\N	1
664	13	33	1	\N	1
665	13	6	1	\N	1
666	13	71	1	\N	1
667	13	73	1	\N	1
668	14	1	1	\N	1
669	14	20	1	\N	1
670	14	74	1	\N	1
671	14	57	1	\N	1
672	14	64	1	\N	1
673	14	22	1	\N	1
674	14	12	1	\N	1
675	14	6	1	\N	1
676	14	35	1	\N	1
677	14	41	1	\N	1
678	14	81	1	\N	1
679	14	19	1	\N	1
680	14	58	1	\N	1
681	14	98	1	\N	1
682	14	52	1	\N	1
683	14	10	1	\N	1
684	14	123	1	\N	1
685	14	45	1	\N	1
686	14	21	1	\N	1
687	14	9	1	\N	1
688	14	170	1	\N	1
689	14	60	1	\N	1
690	14	13	1	\N	1
691	14	61	1	\N	1
692	14	85	1	\N	1
693	14	48	1	\N	1
694	14	97	1	\N	1
695	14	31	1	\N	1
696	14	171	1	\N	1
697	14	173	1	\N	1
698	14	172	1	\N	1
699	15	1	1	\N	1
700	15	20	1	\N	1
701	15	74	1	\N	1
702	15	57	1	\N	1
703	15	64	1	\N	1
704	15	22	1	\N	1
748	14	30	1	\N	1
706	15	34	1	\N	1
707	15	128	1	\N	1
708	15	27	1	\N	1
709	15	37	1	\N	1
710	15	32	1	\N	1
711	15	8	1	\N	1
712	15	35	1	\N	1
713	15	6	1	\N	1
714	15	172	1	\N	1
715	15	173	1	\N	1
716	15	171	1	\N	1
717	15	81	1	\N	1
718	15	41	1	\N	1
719	15	162	1	\N	1
720	15	146	1	\N	1
721	15	29	1	\N	1
749	14	8	1	\N	1
723	15	12	1	\N	1
724	15	15	1	\N	1
725	15	96	1	\N	1
726	15	19	1	\N	1
727	15	52	1	\N	1
728	15	98	1	\N	1
729	15	58	1	\N	1
730	15	10	1	\N	1
731	15	123	1	\N	1
732	15	21	1	\N	1
733	15	45	1	\N	1
734	15	60	1	\N	1
735	15	170	1	\N	1
736	15	71	1	\N	1
737	15	13	1	\N	1
738	15	61	1	\N	1
739	15	85	1	\N	1
740	15	48	1	\N	1
750	15	175	1	\N	1
742	15	30	1	\N	1
743	15	95	1	\N	1
744	15	130	1	\N	1
745	15	31	1	\N	1
746	15	102	1	\N	1
747	15	174	1	\N	1
751	16	1	1	\N	1
752	16	6	1	\N	1
753	16	74	1	\N	1
754	16	57	1	\N	1
755	16	128	1	\N	1
756	16	64	1	\N	1
757	16	15	1	\N	1
758	16	20	1	\N	1
759	16	28	1	\N	1
760	16	22	1	\N	1
761	16	41	1	\N	1
762	16	69	1	\N	1
763	16	68	1	\N	1
764	16	58	1	\N	1
765	16	52	1	\N	1
766	16	21	1	\N	1
767	16	45	1	\N	1
768	16	13	1	\N	1
769	16	23	1	\N	1
770	16	98	1	\N	1
771	16	10	1	\N	1
772	16	174	1	\N	1
773	16	73	1	\N	1
774	16	61	1	\N	1
775	16	60	1	\N	1
776	16	175	1	\N	1
777	16	123	1	\N	1
778	16	19	1	\N	1
779	16	40	1	\N	1
780	16	47	1	\N	1
781	16	30	1	\N	1
782	16	122	1	\N	1
787	16	189	1	\N	1
784	16	183	1	\N	1
785	16	182	1	\N	1
786	16	184	1	\N	1
788	16	188	1	\N	1
789	16	71	1	\N	1
790	17	19	1	\N	1
791	17	98	1	\N	1
792	17	13	1	\N	1
793	17	23	1	\N	1
794	17	52	1	\N	1
795	17	10	1	\N	1
796	17	175	1	\N	1
797	17	123	1	\N	1
798	17	53	1	\N	1
799	17	54	1	\N	1
800	17	95	1	\N	1
801	17	130	1	\N	1
802	17	79	1	\N	1
803	17	60	1	\N	1
804	17	61	1	\N	1
805	17	184	1	\N	1
806	17	47	1	\N	1
807	17	69	1	\N	1
808	17	68	1	\N	1
809	17	30	1	\N	1
810	17	122	1	\N	1
811	17	8	1	\N	1
812	17	40	1	\N	1
813	17	174	1	\N	1
831	17	18	1	\N	1
815	17	191	1	\N	1
816	17	192	1	\N	1
817	17	193	1	\N	1
818	17	194	1	\N	1
819	17	1	1	\N	1
820	17	6	1	\N	1
821	17	74	1	\N	1
822	17	57	1	\N	1
823	17	128	1	\N	1
824	17	162	1	\N	1
825	17	64	1	\N	1
826	17	15	1	\N	1
827	17	81	1	\N	1
828	17	62	1	\N	1
829	17	190	1	\N	1
830	17	195	1	\N	1
832	17	16	1	\N	1
833	17	17	1	\N	1
834	18	6	1	\N	1
835	18	1	1	\N	1
836	18	74	1	\N	1
837	18	57	1	\N	1
838	18	128	1	\N	1
839	18	162	1	\N	1
840	18	34	1	\N	1
841	18	17	1	\N	1
842	18	64	1	\N	1
843	18	15	1	\N	1
844	18	81	1	\N	1
845	18	62	1	\N	1
846	18	28	1	\N	1
847	18	20	1	\N	1
848	18	68	1	\N	1
849	18	69	1	\N	1
850	18	8	1	\N	1
851	18	195	1	\N	1
852	18	22	1	\N	1
853	18	41	1	\N	1
854	18	37	1	\N	1
855	18	174	1	\N	1
856	18	96	1	\N	1
857	18	23	1	\N	1
858	18	13	1	\N	1
859	18	98	1	\N	1
860	18	10	1	\N	1
861	18	175	1	\N	1
862	18	123	1	\N	1
863	18	53	1	\N	1
864	18	54	1	\N	1
865	18	95	1	\N	1
866	18	130	1	\N	1
867	18	183	1	\N	1
868	18	182	1	\N	1
869	18	19	1	\N	1
870	18	40	1	\N	1
871	18	79	1	\N	1
872	18	190	1	\N	1
873	18	60	1	\N	1
874	18	61	1	\N	1
875	18	47	1	\N	1
876	18	184	1	\N	1
877	18	30	1	\N	1
878	18	122	1	\N	1
879	18	191	1	\N	1
880	18	192	1	\N	1
881	18	194	1	\N	1
882	18	199	1	\N	1
883	18	200	1	\N	1
884	18	201	1	\N	1
885	18	18	1	\N	1
886	18	16	1	\N	1
890	19	203	1	A	1
891	19	205	1	A	1
892	19	206	1	A	1
893	19	208	1	A	1
894	19	210	1	A	1
895	19	211	1	A	1
896	19	212	1	A	1
897	19	213	1	A	1
898	19	216	1	A	1
899	19	218	1	A	1
900	19	220	1	A	1
901	19	221	1	A	1
902	19	222	1	A	1
903	19	223	1	A	1
904	19	224	1	A	1
905	19	225	1	A	1
906	19	226	1	A	1
907	19	292	1	A	1
908	19	227	1	B	1
909	19	228	1	B	1
910	19	229	1	B	1
911	19	230	1	B	1
912	19	231	1	B	1
913	19	232	1	B	1
914	19	235	1	B	1
915	19	236	1	B	1
916	19	237	1	B	1
917	19	240	1	B	1
918	19	241	1	B	1
919	19	243	1	B	1
920	19	245	1	B	1
921	19	247	1	B	1
922	19	249	1	B	1
923	19	250	1	B	1
924	19	251	1	B	1
925	19	294	1	B	1
926	19	254	1	C	1
927	19	258	1	C	1
928	19	259	1	C	1
929	19	263	1	C	1
984	20	204	1	E	1
991	20	244	2	E	1
932	19	270	1	C	1
933	19	272	1	C	1
934	19	275	1	C	1
935	19	277	1	C	1
936	19	279	1	C	1
1228	21	69	1	\N	1
1005	20	285	1	D	1
1011	20	296	2	D	1
1164	20	209	1	E	2
1165	20	246	2	E	2
1166	20	267	2	F	2
1167	20	286	1	D	2
1168	20	281	1	D	2
1169	20	214	1	E	2
1170	20	252	2	E	2
1171	20	268	2	F	2
1172	20	287	2	D	2
1173	20	289	1	D	2
1174	20	207	1	E	2
1175	20	253	2	E	2
1176	20	280	1	D	2
1177	20	288	1	D	2
1178	20	215	1	E	2
1179	20	293	2	E	2
1180	20	282	1	D	2
1181	20	290	1	D	2
1182	20	238	1	E	2
1183	20	295	2	E	2
1184	20	283	1	D	2
1185	20	291	2	D	2
1186	20	239	1	E	2
1187	20	257	2	F	2
1188	20	284	2	D	2
1189	20	204	1	E	2
1190	20	244	2	E	2
1233	21	1	1	\N	1
1192	20	285	1	D	2
1193	20	296	2	D	2
1194	20	209	1	E	3
1195	20	246	2	E	3
1196	20	267	2	F	3
1197	20	286	1	D	3
1198	20	281	1	D	3
1199	20	214	1	E	3
1200	20	252	2	E	3
1201	20	268	2	F	3
1202	20	287	2	D	3
1203	20	289	1	D	3
1204	20	207	1	E	3
1205	20	253	2	E	3
1206	20	280	1	D	3
1207	20	288	1	D	3
1208	20	215	1	E	3
1209	20	293	2	E	3
1210	20	282	1	D	3
1211	20	290	1	D	3
1212	20	238	1	E	3
1213	20	295	2	E	3
1214	20	283	1	D	3
1215	20	291	2	D	3
1216	20	239	1	E	3
1217	20	257	2	F	3
1218	20	284	2	D	3
1219	20	204	1	E	3
1220	20	244	2	E	3
1221	20	266	2	F	3
1222	20	285	1	D	3
1223	20	296	2	D	3
1238	21	175	1	\N	1
1243	21	97	1	\N	1
1248	21	300	1	\N	1
1253	21	306	1	\N	1
1288	22	13	1	\N	1
1293	22	15	1	\N	1
1298	22	198	1	\N	1
1303	22	34	1	\N	1
1308	22	32	1	\N	1
1313	22	41	1	\N	1
1318	22	299	1	\N	1
1323	22	71	1	\N	1
1326	23	327	1	\N	1
1327	23	91	1	\N	1
1328	23	322	1	\N	1
1329	23	309	1	\N	1
1330	23	325	1	\N	1
1331	23	326	1	\N	1
1332	23	320	1	\N	1
1335	23	303	1	\N	1
1337	23	200	1	\N	1
1338	23	323	1	\N	1
1339	23	311	1	\N	1
1340	23	319	1	\N	1
1343	23	69	1	\N	1
1344	23	299	1	\N	1
1345	23	300	1	\N	1
1346	23	304	1	\N	1
1347	23	301	1	\N	1
1349	23	1	1	\N	1
1351	23	313	1	\N	1
1352	23	324	1	\N	1
1354	23	312	1	\N	1
1355	23	193	1	\N	1
1356	23	321	1	\N	1
1357	23	20	1	\N	1
1358	23	317	1	\N	1
1361	23	329	1	\N	1
1363	23	314	1	\N	1
1364	23	314	1	\N	2
1365	23	329	1	\N	2
1366	23	305	1	\N	2
1367	23	317	1	\N	2
1368	23	20	1	\N	2
1369	23	321	1	\N	2
1370	23	193	1	\N	2
1371	23	312	1	\N	2
1372	23	316	1	\N	2
1373	23	324	1	\N	2
1374	23	313	1	\N	2
1375	23	52	1	\N	2
1376	23	1	1	\N	2
1377	23	301	1	\N	2
1378	23	304	1	\N	2
1379	23	300	1	\N	2
1380	23	299	1	\N	2
1381	23	69	1	\N	2
1382	23	319	1	\N	2
1383	23	311	1	\N	2
1384	23	323	1	\N	2
1385	23	200	1	\N	2
1386	23	298	1	\N	2
1387	23	303	1	\N	2
1388	23	302	1	\N	2
1389	23	320	1	\N	2
1390	23	326	1	\N	2
1391	23	325	1	\N	2
1392	23	309	1	\N	2
1393	23	322	1	\N	2
1394	23	91	1	\N	2
1395	23	327	1	\N	2
1396	23	314	1	\N	3
1397	23	329	1	\N	3
1398	23	305	1	\N	3
1399	23	317	1	\N	3
1400	23	20	1	\N	3
1401	23	321	1	\N	3
1402	23	193	1	\N	3
1403	23	312	1	\N	3
1404	23	316	1	\N	3
1405	23	324	1	\N	3
1406	23	313	1	\N	3
1407	23	52	1	\N	3
1408	23	1	1	\N	3
1409	23	301	1	\N	3
1410	23	304	1	\N	3
1411	23	300	1	\N	3
1412	23	299	1	\N	3
1413	23	69	1	\N	3
1414	23	319	1	\N	3
1415	23	311	1	\N	3
1416	23	323	1	\N	3
1417	23	200	1	\N	3
1418	23	298	1	\N	3
1419	23	303	1	\N	3
1421	23	320	1	\N	3
1422	23	326	1	\N	3
1423	23	325	1	\N	3
1424	23	309	1	\N	3
1425	23	322	1	\N	3
1426	23	91	1	\N	3
1427	23	327	1	\N	3
1428	23	314	1	\N	4
1429	23	329	1	\N	4
1430	23	305	1	\N	4
1431	23	317	1	\N	4
1432	23	20	1	\N	4
1433	23	321	1	\N	4
1434	23	193	1	\N	4
1435	23	312	1	\N	4
1436	23	316	1	\N	4
1437	23	324	1	\N	4
1438	23	313	1	\N	4
1439	23	52	1	\N	4
1440	23	1	1	\N	4
1441	23	301	1	\N	4
1442	23	304	1	\N	4
1443	23	300	1	\N	4
1444	23	299	1	\N	4
1445	23	69	1	\N	4
1446	23	319	1	\N	4
1447	23	311	1	\N	4
1448	23	323	1	\N	4
1449	23	200	1	\N	4
1450	23	298	1	\N	4
1451	23	303	1	\N	4
1452	23	302	1	\N	4
1453	23	320	1	\N	4
1454	23	326	1	\N	4
1455	23	325	1	\N	4
1456	23	309	1	\N	4
1457	23	322	1	\N	4
1458	23	91	1	\N	4
1459	23	327	1	\N	4
1460	24	1	1	\N	1
1461	24	52	1	\N	1
1462	24	20	1	\N	1
1463	24	88	1	\N	1
1464	24	121	1	\N	1
1465	24	175	1	\N	1
1466	24	123	1	\N	1
1467	24	314	1	\N	1
1468	24	329	1	\N	1
1469	24	13	1	\N	1
1470	24	323	1	\N	1
1471	24	91	1	\N	1
1472	24	342	1	\N	1
1473	24	341	1	\N	1
1474	24	341	1	\N	2
1475	24	342	1	\N	2
1476	24	91	1	\N	2
1477	24	323	1	\N	2
1478	24	13	1	\N	2
1479	24	329	1	\N	2
1480	24	314	1	\N	2
1481	24	123	1	\N	2
1482	24	175	1	\N	2
1483	24	121	1	\N	2
1484	24	88	1	\N	2
1485	24	20	1	\N	2
1486	24	52	1	\N	2
1487	24	1	1	\N	2
1488	24	341	1	\N	3
1489	24	342	1	\N	3
1490	24	91	1	\N	3
1491	24	323	1	\N	3
1492	24	13	1	\N	3
1493	24	329	1	\N	3
1494	24	314	1	\N	3
1495	24	123	1	\N	3
1496	24	175	1	\N	3
1497	24	121	1	\N	3
1498	24	88	1	\N	3
1499	24	20	1	\N	3
1500	24	52	1	\N	3
1501	24	1	1	\N	3
1502	25	28	1	\N	1
1504	25	58	1	\N	1
1505	25	80	1	\N	1
1506	25	175	1	\N	1
1507	25	52	1	\N	1
1508	25	341	1	\N	1
1509	25	20	1	\N	1
1510	25	1	1	\N	1
1511	25	121	1	\N	1
1512	25	314	1	\N	1
1513	25	123	1	\N	1
1514	25	13	1	\N	1
1515	25	91	1	\N	1
1516	25	299	1	\N	1
1517	25	69	1	\N	1
1518	25	321	1	\N	1
1519	25	301	1	\N	1
1520	25	313	1	\N	1
1521	25	300	1	\N	1
1522	25	193	1	\N	1
1523	25	304	1	\N	1
1524	25	302	1	\N	1
1526	25	88	1	\N	1
1527	25	309	1	\N	1
1529	25	319	1	\N	1
1530	25	320	1	\N	1
1531	25	322	1	\N	1
1532	25	326	1	\N	1
1533	25	311	1	\N	1
1534	25	325	1	\N	1
1535	25	200	1	\N	1
1536	25	303	1	\N	1
1537	25	324	1	\N	1
1538	25	327	1	\N	1
1539	25	317	1	\N	1
1540	25	312	1	\N	1
1541	25	6	1	\N	1
1542	25	32	1	\N	1
1543	25	85	1	\N	1
1544	25	22	1	\N	1
1545	25	64	1	\N	1
1547	25	127	1	\N	1
1548	25	97	1	\N	1
1549	25	27	1	\N	1
1550	25	60	1	\N	1
1551	25	170	1	\N	1
1552	25	71	1	\N	1
1553	25	40	1	\N	1
1554	25	7	1	\N	1
1555	25	34	1	\N	1
1556	25	68	1	\N	1
1557	25	8	1	\N	1
1558	25	79	1	\N	1
1559	25	61	1	\N	1
1560	25	17	1	\N	1
1561	25	23	1	\N	1
1562	25	29	1	\N	1
1563	25	16	1	\N	1
1564	25	10	1	\N	1
1565	27	31	3	\N	1
1566	27	489	3	\N	1
1567	27	187	3	\N	1
1568	27	338	3	\N	1
1569	27	52	3	\N	1
1571	27	83	3	\N	1
1572	27	23	3	\N	1
1573	27	48	3	\N	1
1575	27	72	3	\N	1
1576	27	131	3	\N	1
1577	27	186	3	\N	1
1578	27	91	3	\N	1
1579	27	51	3	\N	1
1580	27	2	3	\N	1
1581	27	16	3	\N	1
1582	27	377	3	\N	1
1583	27	419	3	\N	1
1584	27	58	3	\N	1
1585	27	202	3	\N	1
1586	27	68	3	\N	1
1587	27	70	3	\N	1
1588	27	60	3	\N	1
1589	27	76	3	\N	1
1590	27	82	3	\N	1
1591	27	132	3	\N	1
1592	27	418	3	\N	1
1593	27	339	3	\N	1
1594	27	172	3	\N	1
1595	27	74	3	\N	1
1596	27	547	3	\N	1
1597	27	425	3	\N	1
1598	27	495	3	\N	1
1599	27	137	3	\N	1
1600	27	497	3	\N	1
1601	27	13	3	\N	1
1602	27	499	3	\N	1
1603	27	159	3	\N	1
1606	27	18	3	\N	1
1607	27	510	3	\N	1
1608	27	197	3	\N	1
1609	27	540	3	\N	1
1610	27	352	3	\N	1
1611	27	56	3	\N	1
1612	27	369	3	\N	1
1613	27	370	3	\N	1
1614	27	380	3	\N	1
1615	27	87	3	\N	1
1616	27	389	3	\N	1
1617	27	390	3	\N	1
1618	27	61	3	\N	1
1619	27	405	3	\N	1
1620	27	17	3	\N	1
1621	27	431	3	\N	1
1622	27	439	3	\N	1
1623	27	170	3	\N	1
1624	27	448	3	\N	1
1625	27	500	3	\N	1
1626	27	59	3	\N	1
1627	27	478	3	\N	1
1628	27	146	3	\N	1
1629	27	451	3	\N	1
1630	27	177	3	\N	1
1632	27	343	3	\N	1
1633	27	167	3	\N	1
1634	27	75	3	\N	1
1635	27	55	3	\N	1
1636	27	467	3	\N	1
1637	27	94	3	\N	1
1638	27	212	3	\N	1
1639	27	536	3	\N	1
1640	27	184	3	\N	1
1641	28	12	1	\N	1
1642	28	1	1	\N	1
1643	28	19	1	\N	1
1644	28	438	1	\N	1
1645	28	34	1	\N	1
1646	28	41	1	\N	1
1647	28	54	1	\N	1
1648	28	32	1	\N	1
1649	28	16	1	\N	1
1650	28	18	1	\N	1
1651	28	17	1	\N	1
1652	28	21	1	\N	1
1653	28	39	1	\N	1
1654	28	13	1	\N	1
1655	28	453	1	\N	1
1656	28	20	1	\N	1
1657	28	37	1	\N	1
1658	28	29	1	\N	1
1659	28	10	1	\N	1
1660	28	22	1	\N	1
1661	28	456	1	\N	1
1662	28	28	1	\N	1
1663	28	383	1	\N	1
1664	28	89	1	\N	1
1665	28	65	1	\N	1
1666	28	8	1	\N	1
1667	28	554	1	\N	1
1668	28	555	1	\N	1
1669	29	13	1	\N	1
1670	29	1	1	\N	1
1671	29	68	1	\N	1
1672	29	8	1	\N	1
1673	29	2	1	\N	1
1674	29	19	1	\N	1
1675	29	6	1	\N	1
1676	29	39	1	\N	1
1677	29	538	1	\N	1
1678	29	96	1	\N	1
1679	29	92	1	\N	1
1680	29	187	1	\N	1
1681	29	21	1	\N	1
1682	29	88	1	\N	1
1683	29	82	1	\N	1
1684	29	198	1	\N	1
1685	29	32	1	\N	1
1686	29	20	1	\N	1
1687	29	98	1	\N	1
1688	29	52	1	\N	1
1689	29	459	1	\N	1
1690	29	57	1	\N	1
1691	29	58	1	\N	1
1692	29	22	1	\N	1
1693	29	10	1	\N	1
1694	29	110	1	\N	1
1695	29	306	1	\N	1
1696	29	48	1	\N	1
1697	29	35	1	\N	1
1698	29	64	1	\N	1
1699	29	561	1	\N	1
1700	29	558	1	\N	1
1701	29	559	1	\N	1
1702	29	560	1	\N	1
1703	29	556	1	\N	1
1704	29	557	1	\N	1
1705	29	562	1	\N	1
1706	30	538	1	\N	1
1707	30	1	1	\N	1
1708	30	8	1	\N	1
1709	30	53	1	\N	1
1710	30	555	1	\N	1
1711	30	2	1	\N	1
1712	30	19	1	\N	1
1713	30	96	1	\N	1
1714	30	92	1	\N	1
1715	30	187	1	\N	1
1716	30	556	1	\N	1
1717	30	557	1	\N	1
1718	30	21	1	\N	1
1719	30	88	1	\N	1
1720	30	13	1	\N	1
1721	30	82	1	\N	1
1722	30	85	1	\N	1
1723	30	50	1	\N	1
1724	30	32	1	\N	1
1725	30	95	1	\N	1
1726	30	561	1	\N	1
1727	30	562	1	\N	1
1728	30	20	1	\N	1
1729	30	98	1	\N	1
1730	30	52	1	\N	1
1731	30	57	1	\N	1
1732	30	58	1	\N	1
1733	30	29	1	\N	1
1734	30	130	1	\N	1
1735	30	81	1	\N	1
1736	30	12	1	\N	1
1737	30	64	1	\N	1
1738	30	62	1	\N	1
1739	30	459	1	\N	1
1740	30	59	1	\N	1
1741	30	481	1	\N	1
1745	30	304	1	\N	1
1746	30	300	1	\N	1
1747	30	48	1	\N	1
1748	30	10	1	\N	1
1749	30	563	1	\N	1
1750	30	564	1	\N	1
1751	30	565	1	\N	1
1752	30	566	1	\N	1
1753	30	567	1	\N	1
1754	30	568	1	\N	1
1755	30	571	1	\N	1
1756	30	569	1	\N	1
1757	30	572	1	\N	1
1758	30	573	1	\N	1
1759	30	574	1	\N	1
1760	30	79	1	\N	1
1761	30	443	1	\N	1
1762	30	6	1	\N	1
1763	30	575	1	\N	1
1764	31	64	1	\N	1
1765	31	1	1	\N	1
1766	31	8	1	\N	1
1767	31	2	1	\N	1
1768	31	19	1	\N	1
1769	31	538	1	\N	1
1770	31	96	1	\N	1
1771	31	92	1	\N	1
1772	31	556	1	\N	1
1773	31	187	1	\N	1
1774	31	557	1	\N	1
1775	31	21	1	\N	1
1776	31	88	1	\N	1
1777	31	539	1	\N	1
1778	31	32	1	\N	1
1779	31	95	1	\N	1
1780	31	561	1	\N	1
1781	31	562	1	\N	1
1782	31	20	1	\N	1
1783	31	98	1	\N	1
1784	31	52	1	\N	1
1785	31	57	1	\N	1
1786	31	58	1	\N	1
1787	31	29	1	\N	1
1788	31	563	1	\N	1
1789	31	130	1	\N	1
1790	31	53	1	\N	1
1791	31	555	1	\N	1
1792	31	81	1	\N	1
1793	31	12	1	\N	1
1794	31	59	1	\N	1
1795	31	79	1	\N	1
1796	31	443	1	\N	1
1797	31	6	1	\N	1
1798	31	304	1	\N	1
1799	31	300	1	\N	1
1800	29	304	1	\N	1
1801	29	300	1	\N	1
1802	30	559	1	\N	1
1803	30	68	1	\N	1
1804	30	198	1	\N	1
1805	30	570	1	\N	1
1806	30	35	1	\N	1
\.


--
-- Data for Name: web_member; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_member (id, player_id) FROM stdin;
1	1
7	15
3	8
4	6
5	10
6	19
8	20
9	21
10	22
11	25
12	26
13	27
14	28
15	29
16	37
17	32
18	34
19	38
20	39
21	40
22	2
23	41
24	42
25	43
26	44
27	11
28	45
29	46
30	65
31	66
32	149
33	176
34	177
35	146
36	51
37	81
38	179
39	3
40	180
41	181
42	87
44	72
45	50
46	186
47	187
48	196
49	47
50	197
51	198
52	172
53	202
54	331
55	332
56	333
57	334
58	335
59	336
60	337
61	338
62	339
63	340
64	343
65	344
66	345
67	346
68	347
70	349
71	350
72	351
73	352
74	353
75	354
76	355
77	356
78	357
80	359
81	360
82	361
83	362
84	363
85	364
87	203
88	552
89	366
90	367
91	368
92	369
93	370
94	371
95	372
96	373
97	374
98	375
99	376
100	377
101	378
103	380
105	382
106	383
107	384
108	385
109	386
110	387
111	388
112	389
113	390
114	391
116	394
118	395
119	397
121	398
122	399
124	401
125	402
126	403
132	409
133	410
137	414
139	416
140	417
141	418
142	419
143	420
144	421
145	422
146	423
147	424
148	425
149	426
151	429
152	430
153	431
154	432
155	433
156	434
157	435
158	436
159	437
161	439
164	517
165	442
168	447
169	448
170	449
171	450
172	451
173	452
176	455
177	478
179	457
180	458
181	443
182	444
183	445
188	465
189	464
190	466
191	467
192	468
193	469
194	470
195	471
196	473
197	472
198	474
199	479
200	480
202	482
203	483
204	484
205	486
207	487
208	492
209	490
210	493
211	489
212	488
213	491
214	494
215	495
216	496
217	497
219	499
221	501
222	502
223	504
225	505
227	411
79	82
69	84
175	52
127	58
86	12
104	31
117	91
120	53
135	17
138	98
150	79
130	16
162	68
166	60
167	69
163	170
174	85
185	122
184	35
201	136
206	9
220	128
186	83
187	23
178	59
224	7
226	97
128	57
228	428
230	507
232	509
234	511
239	527
240	518
242	520
244	522
245	523
247	525
248	528
249	529
250	530
251	531
254	534
255	535
256	536
257	537
258	538
259	539
260	543
261	540
262	541
263	542
265	545
266	546
267	548
268	547
270	550
271	551
272	13
229	64
231	67
233	80
237	55
238	74
235	162
241	184
236	89
243	61
246	54
252	100
264	169
253	158
269	18
273	30
274	56
275	103
\.


--
-- Data for Name: web_partner; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_partner (id, member1_id, member2_id, tournament_id) FROM stdin;
1	751	752	16
2	753	754	16
3	764	765	16
20	795	794	17
5	768	769	16
6	756	757	16
7	758	759	16
8	766	767	16
9	762	763	16
10	770	771	16
11	774	775	16
12	772	773	16
13	778	779	16
14	788	789	16
15	776	777	16
16	780	786	16
17	787	785	16
18	791	790	17
19	793	792	17
38	832	831	17
21	796	797	17
22	799	798	17
23	801	800	17
24	829	802	17
25	804	803	17
26	806	805	17
27	808	807	17
4	781	810	16
28	810	809	17
29	815	816	17
30	818	812	17
31	813	817	17
32	820	819	17
33	821	822	17
39	856	855	18
35	825	826	17
36	827	828	17
40	858	857	18
37	811	830	17
34	823	761	17
41	859	860	18
42	862	861	18
43	864	863	18
44	865	866	18
45	868	867	18
46	869	870	18
47	872	871	18
48	849	848	18
49	849	848	18
50	873	874	18
51	875	876	18
52	877	878	18
53	879	879	18
54	881	883	18
55	882	884	18
56	836	837	18
57	838	839	18
58	840	841	18
59	842	843	18
60	844	845	18
61	847	846	18
62	850	851	18
63	835	834	18
64	852	853	18
65	886	885	18
\.


--
-- Data for Name: web_partnershiptrophy; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_partnershiptrophy (id, tournament_id, name, format, handicapmax, handicapmin) FROM stdin;
1	16	The Bali Cup 	NT	18	0
2	16	The Bali Cup 1	NT	30	19
4	17	Good Shepherd International School Trophy 	SC	18	0
6	17	Good Shepherd International School Trophy 2	SG	30	0
5	17	Good Shepherd International School Trophy 1	SC	30	19
7	18	Centwin Trophy	NT	18	0
9	18	Centwin Trophy 1	NT	30	19
10	18	Centwin 2	GR	30	0
\.


--
-- Data for Name: web_player; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_player (id, first_name, last_name, homeclub_id, tee_id, photo) FROM stdin;
554	dr.v.p	subbian	1	1	
103	.	a	1	1	
125	d.	ajay kumar	2	3	
44	a	akash	1	1	
36	j.	anand	2	3	
37	dr.n.	anandamoorthy	1	1	
29	r	ananth kumar	1	1	
126	.	anoop shroff	2	3	
5	.	arun prasad	2	1	
58	mrs.	aruna kulandaivel	2	4	
14	.	ashim kaula	1	1	
75	n.	athimoolam naidu	2	3	
90	.	balagurunathan	2	3	
82	s.	bharath ram	2	3	
108	.	brig kn nair	3	1	
107	.	brig rs jamwal	3	1	
118	.	cdr alok anand	3	1	
88	l.	chinchankar	1	1	
12	v	chinnaswamy	2	1	
116	.	col cb ponnappa	3	1	
114	.	col gs panaich	3	1	
111	.	col jj mathews	3	1	
113	.	col pawan bajaj	3	1	
110	.	col s bahl	3	1	
109	.	col ss rai	3	1	
3	a.l	gandeepan	2	1	
124	.	ganesh kumar	2	3	
27	m.p	george	1	1	
30	r	gopinath	2	1	
31	.	goutham selvaraj	2	1	
49	n.	govindarajan	2	3	
112	.	gp capt s dhankar, vm	3	1	
24	mrs.	hardwick	1	2	
43	j	hursh chordia	1	1	
51	m.v	jaganathan	2	3	
8	j	jinesh golecha	1	1	
91	.	joseph j chakola	2	3	
77	.	joseph vellapally	1	1	
15	.	junaid ali sait	1	1	
92	.	kadhar khan	2	3	
53	k	kandavadivel	2	3	
134	dr.m.	kolanchi babu	1	1	
47	.	kondaswamy naidu	2	3	
32	k	krishnakumar	1	1	
131	t.s.	krishnakumar	2	3	
57	v.s	kulandaivel	2	3	
16	p	kumaraswamy	2	1	
104	.	lt.gen hps klair, sm	3	1	
26	n.k	mahesh	1	1	
106	.	maj gen um rajavelu, sm	3	1	
119	.	maj js aswal	3	1	
120	.	maj rs bhullar	3	1	
102	.	manoj kumar jain	2	3	
17	k	manthrachalam	2	1	
87	.	meiyappan ramaswamy	2	3	
98	n.	mohan nambiar	2	3	
73	.	muneer sait	3	1	
19	b.d	murali	1	1	
22	.	murali khemchand	1	1	
101	n.	nagesh	1	1	
93	.	nakual prakash	2	3	
121	.	narayan bhat	5	1	
79	v.r	naren kumar	2	3	
129	.	neelakanta rao	5	1	
45	.	nitin  suresh	1	1	
86	.	patel	1	1	
2	p.b.h	pawar	2	1	
68	dr	peeyush 	2	3	
11	r	prabhu kumar	1	1	
70	.	pradeep rajaram	2	3	
99	.	praveen bardia	3	1	
138	.	prushothaman	2	3	
60	d	raamprasad kota	2	3	
69	.	ragavender naidu	2	3	
48	g.m	rajamani	2	3	
127	b.	rajashekar	2	3	
85	l.s	rajendran	2	3	
52	v	rajendran	2	3	
59	.	rajkumar davidar	2	3	
35	n	ramachandran	2	1	
122	v.	ramakrishna	2	3	
23	a	ramamoorthy	2	1	
71	v.	ramaswamy	2	3	
76	n.	ramesh	2	3	
130	.	ramneek singh	3	1	
28	p	rangaswamy	1	1	
81	dr.s.r	rao	2	3	
4	.	richard hardwick	3	1	
94	.	sakthi saravanan	2	3	
96	.	saravana muthukumar	2	3	
9	.	satish balagopal	2	1	
38	.	shaid sait	1	1	
137	b.	shanmugasundaram	2	3	
13	r	shyam sunder	2	1	
39	g	siddarth	1	1	
41	n	somasunder	1	1	
7	n	sounderrajan	2	1	
62	r.	sri  hari ram	2	3	
64	s.a	sridhar	2	3	
67	dr.k.v	srinivasan	2	3	
95	n.	sriram	3	1	
63	.	steive	1	1	
80	n.	subramaniam	2	3	
89	v.	subramaniam	2	3	
55	m.r	suchindran	2	3	
74	.	sudhev sivakumar	2	3	
61	a	surendran	2	3	
21	p	suresh	1	1	
54	k	suryakumar	1	1	
97	r.a	thirumoorthi	2	3	
135	.	umapathy	2	3	
100	.	vashista pawar	2	3	
46	n.k	vasudev	1	1	
1	r	veluswamy	1	1	
40	.	vijay prabhu	1	1	
33	r	vijayakumhar	2	1	
133	.	vikram	2	3	
123	j.	vikram dev rao	5	1	
18	s	viswanathan	2	1	
10	.	zubair  sait	1	1	
132	k.k.	chandrasekar	2	3	
254	.	aaryamaan ingle	1	1	
227	.	abhishek shankar	1	1	
266	.	aditi ashok	1	1	
243	.	akash  modi	1	1	
242	.	akash srinivasan	1	1	
228	.	akshat  vidyanath	1	1	
224	.	allaap.i.l	1	1	
203	.	aman raj	1	1	
260	.	aniruddh kedlaya	1	1	
273	.	arjun prasad	1	1	
255	.	arjun puri	1	1	
218	.	arjun sharma	1	1	
217	.	arjun singh 	1	1	
237	.	arjun tandon	1	1	
240	.	arrush ahuja	1	1	
239	.	astha madan	1	1	
251	.	atreya sinha	1	1	
167	.	ashwin asher	2	3	
171	v.	ayyaswamy	2	3	
187	r	balasubramaniam	2	3	
140	.	balachander	2	3	
164	.	brig dhillon	3	1	
145	.	brig joo	2	3	
195	.	col mathew	3	1	
248	.	doppalapudi venkat gautham	1	1	
161	.	deepak krishnan	2	3	
165	a	deswal	2	3	
182	gen	gauthama	3	1	
199	.	gayathri ram	2	3	
216	.	harman virk	1	1	
275	.	harsh gangwar	1	1	
270	.	harshath.b	1	1	
245	.	honey baisoya	1	1	
271	.	jaiveer singh	1	1	
181	jayen	jayen menon 	2	3	
196	.	john kuriyan 	2	3	
173	b.	jagan mohan	2	3	
192	.	jothi ramalingam	5	1	
232	.	karan arjun	1	1	
272	.	karan sharma	1	1	
215	.	kasvi malik	1	1	
247	.	kelly rao	1	1	
142	k	kalaiamurthy	2	3	
155	.	krishna kadika	2	3	
160	.	krishna khandige	2	3	
157	.	krishna prasad	2	3	
180	k 	kumaraswamy 	2	3	
144	r	lakshmanan	2	3	
202	v 	manoharan 	2	3	
186	a 	mathialagan 	2	3	
168	.	maj rajev khan	3	1	
148	k	manoharan	2	3	
149	t.	murali	2	3	
244	.	natasha gill	1	1	
241	.	nikhil mohan	1	1	
267	.	nishtha madan	1	1	
205	.	niyant gurwara	1	1	
143	t.r	natarajan	2	3	
219	.	phadke raksha sanjay	1	1	
274	.	phadke rishabh sanjay	1	1	
256	.	piyush sangwan	1	1	
220	.	prashob nair	1	1	
170	v.s	prabhakar	2	3	
156	.	pranav prasad	2	3	
249	.	raghu bir choudhary	1	1	
225	.	rahul ravi	1	1	
214	.	raksha sanjay phadke	1	1	
206	.	rohit  limaye	1	1	
208	.	roshan raj	1	1	
153	v.p.	rajkumar	2	3	
150	p	ramesh	2	3	
152	s.	rasavanian	2	3	
229	.	samar singh sandhu	1	1	
230	.	sanil khare	1	1	
236	.	sanjit sarkar	1	1	
198	a v 	saravanan 	2	3	
197	s n 	saravanan 	2	3	
213	.	sarhan italia	1	1	
210	.	sayed saquib ahmad	1	1	
257	.	sehar atwal	1	1	
263	.	shaurya shah	1	1	
262	.	shreyas chandra	1	1	
258	.	siddharth.k	1	1	
222	.	simranpreet singh	1	1	
226	.	sumedh sachin gangal	1	1	
259	.	suryakumar.k	1	1	
175	.	sam chenoy	5	1	
201	.	sanjay	2	3	
154	r	santhamoorthy	2	3	
141	s	selvaraj	2	3	
146	m	senthilkumar	2	3	
190	a.	senthilnathan	2	3	
159	v.	somasundaram	2	3	
194	.	srinath rajaram	1	1	
162	k	subaramaniam	2	3	
191	c.s	subramaniam	5	1	
200	.	sumanth subramaniam	2	3	
189	.	suraj metha	3	1	
235	.	tapendra ghai	1	1	
246	.	tavleen batra	1	1	
223	.	trishul chinnappa	1	1	
238	.	tvesa malik	1	1	
193	.	tarun veeraraghavan	1	1	
250	.	udayvir wadhwa	1	1	
172	v.	unnikrishnan	2	3	
207	.	vani kapoor	1	1	
212	.	vashista s pawar	1	1	
252	.	vidushi sinha	1	1	
234	.	viraj khanna	1	1	
233	.	vishesh khanna	1	1	
253	.	vrishali sinha	1	1	
298	.	varun jois	3	1	
158	s.	venkatachalam	2	3	
188	.	vijay raichand	3	1	
139	k	vishal bhat	5	1	
151	p.	viswanathan	2	3	
211	.	yashash chandra	1	1	
177	c a	chandy	2	3	
178	m v 	jaganathan	2	3	
179	t r 	krishnan	2	3	
176	c	venkatesh	2	3	
345	v.s	arun 	2	3	
555	.	shivakaran	1	1	
331	.	abhishek nair 	2	3	
332	.	abhishek ramesh 	2	3	
333	s 	ajay alagar 	2	3	
334	j 	ajay kumar 	2	3	
335	.	ajay rajinikanth 	2	3	
336	k  j 	akil 	2	3	
310	.	ali akbar	2	1	
337	.	ambrish pathak 	2	3	
295	.	amrita sarna	1	1	
338	j 	anand 	2	3	
339	n 	anand 	2	3	
315	k	anantha padmanabhan	2	1	
277	.	aneesh pandey	1	1	
340	.	anil shah 	2	3	
276	.	anmol mahajan	1	1	
343	.	anoop vk shroff	2	3	
344	k 	aravindakshan 	2	3	
289	.	aryamaan j puri	1	1	
346	t r 	ashok 	2	3	
347	.	ashwin asher 	2	3	
348	.	ashwin chandran 	2	3	
349	s	ashwin kumar 	2	3	
350	.	ashwin venkatraman 	2	3	
351	n 	athimoolam naidu 	2	3	
352	v	ayyachamy 	2	3	
309	.	ajai golaya	2	1	
320	.	anmol murthy	2	1	
299	.	arvind k.gurudev	2	1	
353	v s 	balachander 	2	3	
354	g n 	balachander 	2	3	
355	.	balaji jagadeesan 	2	3	
356	r 	balasubramaniam  	2	3	
357	r  dr 	baskaren 	2	3	
359	.	bharath tantia 	2	3	
322	s	balasai 	2	1	
360	k 	chandran 	2	3	
362	k k 	chandrasekar 	2	3	
361	s 	chandrasekar 	2	3	
363	v  brig 	chandrasekaran 	2	3	
364	c  a 	chandy 	2	3	
311	cdr h.s 	chahal	2	1	
307	c.s	chandrasekar	2	3	
330	.	chandrasekhar.lt	1	1	
366	n 	damodharan 	2	3	
367	dr 	david v rajan 	2	3	
368	d k 	desai 	2	3	
280	.	devansh chadha	1	1	
369	dr 	devdas madhavan 	2	3	
370	k s 	dhanan 	2	3	
371	p 	divakaran 	2	3	
372	.	doulathram l  ahuja 	2	3	
373	m 	duraiswamy 	2	3	
312	.	darshan veeraraghavan	2	1	
313	.	david d souza	2	1	
374	m m 	elango 	2	3	
279	.	ganapathy.b.c	1	1	
375	a l 	gandeepan 	2	3	
376	g v 	gandhi 	2	3	
377	j 	ganesh kumar 	2	3	
378	s 	gnanasambantham 	2	3	
380	.	goutham nahar 	2	3	
382	i k 	govind 	2	3	
383	n 	govindarajan 	2	3	
293	.	gurbani singh	1	1	
341	.	govind swaminathan	1	1	
384	.	harikhemchand 	2	3	
385	j 	harishchandravel 	2	3	
282	.	harshjeet singh sethi	1	1	
386	b 	jagan mohan 	2	3	
290	.	jansher s gill	1	1	
388	s	jayakumar 	2	3	
390	v 	jayaraman 	2	3	
389	b 	jayaraman 	2	3	
391	.	jayen menon 	2	3	
392	m 	john kuriyan 	2	3	
394	.	joseph lawrence 	2	3	
314	.	jagan m seshadri	2	1	
304	.	jahangir	3	1	
397	s	kathar khan 	2	3	
398	j d 	khona 	2	3	
399	.	kishore jain 	2	3	
288	.	krishiv lalit tekchandani	1	1	
401	t s 	krishnakumar  	2	3	
403	t r  dr 	krishnan 	2	3	
286	.	kshitj naveed kaul	1	1	
405	v s	kulandaivelu	2	3	
317	k	kumaran	2	1	
316	.	kunal banker  	2	1	
318	.	lokesh	2	1	
292	.	manpreet mann	1	1	
204	.	mehar atwal	1	1	
300	n.	maheswaran	3	1	
326	svr 	murthy	2	1	
209	.	nikita arjun	1	1	
306	.	namon malik	3	1	
321	.	nitish ponappa 	2	1	
283	.	prateek nagaprasad 	1	1	
319	lt.cdr 	pathak	2	1	
296	.	ridhima dilawar	1	1	
287	.	riya ahuja	1	1	
342	.	raghu varma	1	1	
302	h.b.	raju	1	1	
305	cdr	rakesh kumar	3	1	
323	.	riad fyzee 	2	1	
285	.	sai venkat.c	1	1	
284	.	shruthi shenoy	1	1	
297	.	srinivasan.s	1	1	
324	.	sagar muthappa 	2	3	
325	.	samith tilak 	2	1	
301	.	sardhar	3	1	
327	v.m.	shah	2	1	
303	.	siddharath sharma	1	1	
308	k.c	sukumar	1	1	
291	.	vrinda agarwal	1	1	
329	.	vijay methani	1	1	
517	m.m	sundaram 	2	3	
409	.	madan lund 	2	3	
410	.	madhav murali	2	3	
411	.	manoj rajani	2	3	
414	v 	mohan murali	2	3	
418	p m. dr 	murali	2	3	
416	d 	murali manohar 	2	3	
417	.	murali menon 	2	3	
419	t r c	muralidharan 	2	3	
420	n 	muthukumaran 	2	3	
421	.	nakul prakash 	2	3	
422	r k 	nanda 	2	3	
423	.	nandlal ahuja 	2	3	
424	.	nanik sachdev 	2	3	
425	c j 	narayan 	2	3	
426	.	narayanan krishnan 	2	3	
429	v 	narendran 	2	3	
428	s 	narendran 	2	3	
430	.	nikhil sunil 	2	3	
431	.	omkar shanker 	2	3	
432	m 	padmanabhan 	2	3	
433	h s 	padmaraj 	2	3	
434	m 	palaninathan 	2	3	
435	n 	palanisamy 	2	3	
436	a 	palaniswamy 	2	3	
437	.	palati sai prakash 	2	3	
438	p b h 	pawar 	2	3	
439	.	peerooze hataria 	2	3	
440	dr 	peeyush maniyambath	2	3	
441	v s 	prabhakar  	2	3	
443	s	pradeep 	2	3	
442	.	pradeep rajaram 	2	3	
444	.	pradip asher 	2	3	
445	. 	prathap gokuldas 	2	3	
476	mrs.	priya khanna	1	1	
459	.	raam prasad d kota 	2	3	
446	.	ragavendhar naidu 	2	3	
447	dr 	ragavendra rao 	2	3	
448	.	rahul nahar 	2	3	
449	.	raj  j   gwalani 	2	3	
450	g m 	rajamani  	2	3	
451	b 	rajasekar 	2	3	
452	s 	rajasekhar 	2	3	
453	v 	rajendran 	2	3	
454	l s 	rajendran 	2	3	
455	v 	rajkumar 	2	3	
456	.	rajkumar davidar 	2	3	
457	c v 	raju 	2	3	
458	r 	ram kutty 	2	3	
460	n 	ramachandran 	2	3	
462	v 	ramakrishna 	2	3	
461	p r 	ramakrishnan 	2	3	
463	a 	ramamoorthi 	2	3	
465	g 	ramaswamy 	2	3	
464	m  dr 	ramaswamy 	2	3	
466	n 	ramesh 	2	3	
467	m 	ramu 	2	3	
468	a j 	rao 	2	3	
469	p r 	rathanam 	2	3	
470	m 	rayappan 	2	3	
471	.	robinson solomon 	2	3	
473	.	rohit jagan mohan 	2	3	
472	.	rohit raj 	2	3	
478	.	sachin  kumar  bhimani 	2	3	
474	.	sachin kumar bhimani 	2	3	
479	k s d 	sakthi saravanan  	2	3	
480	k 	sampath kumar  	2	3	
481	. 	sandy  cameron 	2	3	
482	a	sanjana 	2	3	
483	l 	santhosh 	2	3	
484	.	sarabindh pawar	2	3	
486	j 	satish 	2	3	
485	.	satish  balagopal 	2	3	
487	.	satish  nahar 	2	3	
492	s 	senthil  saravanan   	2	3	
488	m 	senthil kumar 	2	3	
490	v 	senthil kumar 	2	3	
489	s k 	senthil kumar 	2	3	
493	b 	senthil kumar 	2	3	
491	a 	senthil nathan 	2	3	
494	r c m 	sesha gobal 	2	3	
495	b  dr 	shanker 	2	3	
496	b 	shanmugasundaram 	2	3	
497	d 	sharathram 	2	3	
499	s 	sidhartha 	2	3	
500	a 	sivakumar  mandradiar 	2	3	
501	v 	somasundaram 	2	3	
502	.	somnath  iyer 	2	3	
503	n 	soundararajan 	2	3	
504	k 	soundararajan 	2	3	
505	.	sreedharan  chandran 	2	3	
506	s a 	sridhar 	2	3	
507	r 	srihariram 	2	3	
509	c b 	srinivasan 	2	3	
508	k v 	srinivasan 	4	3	
510	v 	srinivasan 	2	3	
512	k s 	subramaniam 	2	3	
511	k 	subramaniam 	2	3	
513	v  (ramani)	subramaniam 	2	3	
518	.	sunil haridass 	2	3	
520	.	surendra  kumbla 	2	3	
522	g 	surendran 	2	3	
523	.	suresh  gokuldass 	2	3	
525	.	sushil  chugh 	2	3	
475	.	sundaram.col	1	1	
527	.	thomas  alexander 	2	3	
528	n 	udhyakumar  	2	3	
529	v 	unnikrishnan 	2	3	
530	s 	varadarajan 	2	3	
531	s 	varun  alagar 	2	3	
535	c 	venkatesh 	2	3	
536	p 	venkateswaran 	2	3	
537	.	vignesh  devarajan 	2	3	
538	.	vignesh  ranga  rao 	2	3	
539	k 	vijaya bhaskar  	2	3	
540	g k 	vijayakumar   	2	3	
477	.	viraj survana	1	1	
556	a.	arjunan	1	1	
557	k.	prabhu shankar	1	1	
559	col.	prasad	1	1	
560	col.s.	mallik	1	1	
561	cdr.	rohit gorg	1	1	
558	lt.cdr	shanga	1	1	
562	p.	chandrasekar	1	1	
563	l.	murali	1	1	
564	.	arjun kapoor	1	1	
565	b.s.v	kumar	1	1	
566	v.s.	thyagarajan	1	1	
567	.	pavan kapoor	1	1	
221	.	akhil rao	1	1	
261	.	ankita kedlaya	1	1	
56	.	abhishek ramesh	2	3	
84	.	aswin chandran	2	3	
552	 m r 	chinnaswamy 	2	3	
117	.	cdr atul deswal	3	1	
147	v.t.	chandrasekaran	2	3	
115	.	col ravin khosla, vsm	3	1	
163	.	gurriner khanna	2	3	
387	m v 	jaganathan 	2	3	
395	.	justin alfred manna 	2	3	
25	m	jayanthilal	1	1	
42	.	junaize kemappa	1	1	
265	.	karandeep singh kochhar	1	1	
402	s	krishnamurthy  rao 	2	3	
6	.	kenneth  gonsalves	1	1	photos/kg3.jpg
72	d.	lakshminarayanaswamy	2	3	
183	mrs.	lalitha gauthama	3	2	
553	v  	manoharan  	2	3	
294	.	manu gandas	1	1	
66	dr.k	mohamed ali	1	3	
34	k.b	nanda	1	1	
174	.	narayana adige	1	1	
20	n.k	perumal	1	1	
105	.	r adm venkat shankar, vsm	3	1	
328	lt cdr 	rakesh kumar	2	1	
264	.	rishabh phadke	1	1	
83	p.r	ramakrishnan	2	3	
231	.	shivnaren srinivasan	1	1	
268	.	suchitra ramesh	1	1	
136	.	sandy camaroon	2	3	
166	b	senthil kumar	2	3	
128	.	sivakumar mandradiar	2	3	
65	.	subramani srikantan	1	1	
184	.	sunku radesh kumar	2	3	
78	.	thomas vellapally	1	1	
534	g 	venkataraman 	2	3	
543	s 	vijayakumar 	2	3	
541	.	vijayakumar  sheroff 	2	3	
542	.	vijayakumar  verma 	2	3	
545	s b 	vijayaraghavan 	2	3	
546	.	vikash  goyal 	2	3	
548	p 	vikram 	2	3	
547	.	vikram  j  khona 	2	3	
269	.	viraj madappa	1	1	
278	.	virajeet shashank sandu	1	1	
50	.	vijaya baskaran	2	3	
169	r.	vijaya kumhar	2	3	
550	.	weber  erika 	2	3	
551	.	weber werner 	2	3	
568	c.p	rangacher	1	1	
569	.	vijay bhatt	1	1	
570	k.	madhukar shetty	1	1	
571	dr.	ravindra shetty	1	1	
572	.	vinod sawhney	1	1	
573	.	karthik kapoor	1	1	
574	.	mary camron	1	1	
575	k.	rajarathnam	1	1	
281	.	aadil bedi	1	1	
\.


--
-- Data for Name: web_practiceround; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_practiceround (id, rounddate, member_id, tee_id, marker, scoretype, accepted) FROM stdin;
62	2010-03-14	4	1	y	N	t
46	2009-12-23	20	1	y	N	t
17	2010-01-06	6	1	nanda	N	t
69	2010-01-06	14	1	y	N	t
76	2010-01-03	8	1	y	N	t
37	2009-12-21	20	1	Y	N	t
39	2009-12-20	16	1	Y	N	t
5	2009-12-13	5	1	y	N	t
43	2009-12-11	25	1	y	N	t
11	2009-12-13	12	1	y	T	t
32	2009-12-19	24	1	y	N	t
63	2010-03-14	5	1	y	N	t
72	2010-03-14	3	1	y	N	t
90	2009-12-10	25	1	y	N	t
36	2009-12-10	19	1	Y	N	t
59	2010-03-13	8	1	Y	N	t
58	2010-03-13	6	1	Y	N	t
28	2009-12-18	24	1	y	N	t
42	2009-12-08	25	1	y	N	t
60	2010-03-12	20	1	Y	N	t
47	2010-03-12	25	1	y	N	t
26	2009-12-17	24	1	y	N	t
54	2010-03-10	20	1	Y	N	t
51	2010-03-07	4	1	Y	N	t
73	2010-03-03	13	1	y	N	t
1	2010-03-01	1	1	y	N	t
77	2010-01-31	16	1	y	N	t
65	2010-01-17	1	1	y	T	t
117	2010-01-31	25	1	y	N	t
88	2010-01-31	20	1	y	N	t
87	2010-01-30	11	1	y	N	t
78	2010-01-28	5	1	y	N	t
79	2010-01-26	6	1	y	N	t
80	2010-01-26	8	1	y	N	t
81	2010-01-26	26	1	y	N	t
85	2010-01-24	18	1	y	N	t
57	2010-03-10	8	1	Y	N	t
83	2010-01-24	26	1	y	N	t
67	2010-01-24	16	1	y	N	t
97	2010-01-17	17	1	y	T	t
74	2010-01-03	5	1	y	N	t
38	2009-12-16	20	1	Y	N	t
75	2010-01-03	12	1	y	N	t
56	2010-03-09	6	1	Y	N	t
66	2010-01-20	1	1	y	N	t
101	2010-01-17	15	1	y	T	t
10	2009-12-13	20	1	Shaid sait	T	t
12	2009-12-13	6	1	y	T	t
13	2009-12-13	13	1	y	T	t
102	2010-01-17	23	1	y	T	t
105	2010-01-17	5	1	y	T	t
106	2010-01-17	3	1	y	T	t
107	2010-01-17	10	1	y	T	t
108	2010-01-17	4	1	y	T	t
52	2010-03-07	10	1	Y	N	t
116	2010-01-16	29	1	y	T	t
53	2010-03-07	23	1	Y	N	t
100	2010-01-16	12	1	y	T	t
64	2010-01-16	1	1	y	T	t
111	2010-01-16	9	1	y	T	t
93	2010-01-03	18	1	y	N	t
44	2009-12-31	25	1	y	N	t
20	2009-12-30	7	1	y	N	t
15	2009-12-30	13	1	junaid	N	t
40	2009-12-29	1	3	Y	N	t
18	2009-12-06	18	1	zubair	N	t
31	2009-12-06	24	1	y	N	t
14	2009-12-13	21	1	y	T	t
19	2009-12-06	5	1	murali	N	t
45	2009-12-06	25	1	y	N	t
146	2010-03-29	3	1	y	N	t
147	2010-03-28	21	1	y	N	t
148	2010-03-28	18	1	y	N	t
9	2009-12-13	10	1	y	T	t
8	2009-12-13	16	1	y	T	t
7	2009-12-13	8	1	surya	T	t
48	2010-03-07	6	1	y	N	t
49	2010-03-07	8	1	y	N	t
16	2009-12-29	19	1	y	N	t
99	2010-01-16	4	1	y	T	t
109	2010-01-16	23	1	y	T	t
50	2010-03-07	14	1	y	N	t
25	2009-12-29	23	1	y	N	t
2	2009-12-27	6	1	y	T	t
6	2009-12-13	19	1	y	T	t
112	2010-01-16	3	1	y	T	t
113	2010-01-16	6	1	y	T	t
114	2010-01-16	15	1	y	T	t
115	2010-01-16	5	1	y	T	t
23	2010-01-15	23	1	george	N	t
21	2010-01-15	8	1	junaid	N	t
22	2010-01-15	13	1	sunder	N	t
70	2010-01-14	5	1	y	N	t
86	2010-01-14	11	1	y	N	t
95	2010-01-12	28	1	y	N	t
91	2010-01-07	25	1	y	N	t
29	2009-12-25	24	1	y	N	t
24	2009-12-23	5	1	y	N	t
92	2010-01-07	5	1	y	N	t
104	2010-01-16	14	1	y	T	t
98	2010-01-16	17	1	y	T	t
96	2010-01-06	28	1	y	N	t
68	2010-01-06	5	1	y	N	t
4	2009-12-13	18	1	y	N	t
3	2009-12-13	7	1	y	N	t
33	2009-12-13	24	1	Y	N	t
41	2009-12-12	5	1	Y	N	t
27	2009-12-12	24	1	y	N	t
34	2009-12-11	24	1	Y	N	t
35	2009-12-06	13	1	Y	N	t
30	2009-12-05	24	1	y	N	t
84	2010-03-24	26	1	y	N	t
82	2010-03-24	27	1	y	N	t
71	2010-03-14	9	1	y	N	t
55	2010-03-14	8	1	Y	N	t
61	2010-03-14	18	1	Y	N	t
140	2010-03-24	5	1	Y	N	t
143	2010-03-22	31	1	Y	N	t
139	2010-03-20	8	1	Y	N	t
142	2010-03-20	31	1	Y	N	t
137	2010-03-19	8	1	Y	N	t
144	2010-03-19	31	1	Y	N	t
136	2010-03-18	5	1	Y	N	t
133	2010-03-17	1	3	Y	N	t
138	2010-03-17	3	1	Y	N	t
132	2010-03-16	14	1	Y	N	t
149	2010-03-28	4	1	y	N	t
150	2010-03-28	8	1	y	N	t
151	2010-03-28	5	1	y	N	t
152	2010-03-28	6	1	y	N	t
155	2010-03-28	14	1	y	N	t
153	2010-03-28	13	1	y	N	t
145	2010-03-26	1	3	y	N	t
154	2010-03-22	14	1	y	N	t
141	2010-03-22	30	1	Y	N	t
135	2010-03-18	30	1	Y	N	t
134	2010-03-16	30	1	Y	N	t
162	2010-04-08	3	1	y	N	t
160	2010-04-07	30	1	y	N	t
163	2010-04-04	18	1	y	N	t
159	2010-04-01	8	1	y	N	t
156	2010-04-01	30	1	y	N	t
158	2010-04-01	5	1	y	N	t
157	2010-03-27	14	1	y	N	t
161	2010-04-08	30	1	y	N	t
165	2010-04-06	30	1	y	N	t
167	2010-04-05	31	1	y	N	t
170	2010-04-04	14	1	y	N	t
164	2010-04-04	5	1	y	N	t
166	2010-04-04	31	1	y	N	t
168	2010-04-04	8	1	y	N	t
169	2010-04-04	6	1	y	N	t
171	2010-04-29	32	3	n	N	t
172	2010-04-29	33	3	chandy	N	t
173	2010-04-29	34	3	venkatesh c	N	t
174	2010-04-30	35	3	prabhu shanker	N	t
175	2010-04-30	36	3	manoharan v 	N	t
176	2010-04-30	37	3	krishnan dr 	N	t
182	2010-05-09	42	3	Y	N	t
180	2010-05-02	40	3	y	N	t
194	2010-05-05	51	3	Y	N	t
183	2010-05-09	44	3	Y	N	t
184	2010-05-09	45	3	Y	N	t
185	2010-05-09	46	3	Y	N	t
186	2010-05-09	39	3	Y	N	t
187	2010-05-09	47	3	Y	N	t
189	2010-05-07	48	3	Y	N	t
190	2010-05-05	37	3	Y	N	t
191	2010-05-05	38	3	Y	N	t
192	2010-05-04	49	3	Y	N	t
193	2010-05-04	50	3	Y	N	t
195	2010-05-04	52	3	y	N	t
196	2010-05-04	46	3	y	N	t
197	2010-05-04	53	3	Y	N	t
259	2010-06-05	86	3	y	N	t
199	2010-05-23	33	3	y	N	t
200	2010-05-23	49	3	y	N	t
260	2010-06-05	177	3	y	N	t
204	2010-05-28	53	3	jayaram	N	t
205	2010-06-01	100	3	y	N	t
206	2010-06-01	88	3	y 	N	t
207	2010-06-01	77	3	y	N	t
208	2010-06-01	174	3	y	N	t
209	2010-06-01	243	3	y	N	t
261	2010-06-05	125	3	y	N	t
211	2010-06-01	259	3	y	N	t
212	2010-06-01	47	3	y	N	t
213	2010-06-01	55	3	y	N	t
290	2010-06-08	224	3	y	N	t
216	2010-06-01	217	3	y	N	t
217	2010-06-01	263	3	y	N	t
218	2010-06-01	255	3	y	N	t
219	2010-06-01	46	3	y	N	t
220	2010-06-01	53	3	y	N	t
222	2010-06-02	84	3	y	N	t
223	2010-06-02	53	3	y	N	t
224	2010-06-02	246	3	y	N	t
225	2010-06-02	168	3	y	N	t
226	2010-06-02	149	3	y	N	t
227	2010-06-02	217	3	y	N	t
228	2010-06-02	117	3	y	N	t
229	2010-06-02	69	3	y	N	t
230	2010-06-02	167	3	y	N	t
231	2010-06-02	206	3	y	N	t
233	2010-06-02	243	3	y	N	t
234	2010-06-02	51	3	y	N	t
235	2010-06-02	107	3	y	N	t
236	2010-06-03	130	3	y	N	t
237	2010-06-02	269	3	y	N	t
238	2010-06-03	135	3	y	N	t
239	2010-06-03	263	3	y	N	t
240	2010-06-03	93	3	y	N	t
241	2010-06-03	63	3	y	N	t
242	2010-06-03	255	3	y	N	t
243	2010-06-03	221	3	y	N	t
244	2010-06-03	46	3	y	N	t
245	2010-06-03	210	3	y	N	t
246	2010-06-03	83	3	y	N	t
247	2010-06-03	98	3	y	N	t
248	2010-06-03	216	3	y	N	t
249	2010-06-03	167	3	y	N	t
250	2010-06-04	79	3	y	N	t
291	2010-06-08	49	3	y	N	t
252	2010-06-04	243	3	y	N	t
253	2010-06-04	230	3	y	N	t
254	2010-06-04	163	3	y	N	t
255	2010-06-04	117	3	y	N	t
256	2010-06-05	175	3	y	N	t
257	2010-06-05	178	3	y	N	t
258	2010-06-05	127	3	y	N	t
262	2010-06-05	211	3	y	N	t
263	2010-06-05	165	3	y	N	t
264	2010-06-05	156	3	y	N	t
265	2010-06-05	65	3	y	N	t
266	2010-06-05	117	3	y	N	t
267	2010-06-05	174	3	y	N	t
268	2010-06-05	242	3	y	N	t
269	2010-06-05	141	3	y	N	t
270	2010-06-05	205	3	y	N	t
271	2010-06-05	53	3	y	N	t
272	2010-06-05	246	3	y	N	t
274	2010-06-20	66	3	y	N	t
292	2010-06-08	233	3	y	N	t
276	2010-06-06	80	3	y	N	t
277	2010-06-06	39	3	y	N	t
278	2010-06-06	46	3	y	N	t
279	2010-06-06	156	3	y	N	t
280	2010-06-06	117	3	y	N	t
281	2010-06-06	40	3	y	N	t
282	2010-06-06	132	3	y	N	t
283	2010-06-06	92	3	y	N	t
284	2010-06-06	47	3	y	N	t
285	2010-06-06	263	3	y	N	t
286	2010-06-07	117	3	y	N	t
287	2010-06-06	214	3	y	N	t
288	2010-06-07	142	3	y	N	t
289	2010-06-07	232	3	y	N	t
294	2010-06-08	195	3	y	N	t
295	2010-06-08	39	3	y	N	t
296	2010-06-08	46	3	y	N	t
297	2010-06-08	212	3	y	N	t
298	2010-06-08	175	3	y	N	t
299	2010-06-08	178	3	y	N	t
300	2010-06-08	86	3	y	N	t
301	2010-06-08	174	3	y	N	t
302	2010-06-08	243	3	y	N	t
303	2010-06-08	47	3	y	N	t
304	2010-06-09	38	3	y	N	t
305	2010-06-09	168	3	y	N	t
306	2010-06-09	109	3	y	N	t
308	2010-06-09	196	3	y	N	t
309	2010-06-09	248	3	y	N	t
310	2010-06-09	192	3	y	N	t
311	2010-06-09	187	3	y	N	t
312	2010-06-09	179	3	y	N	t
313	2010-06-09	112	3	y	N	t
314	2010-06-10	49	3	y	N	t
315	2010-06-10	167	3	y	N	t
316	2010-06-10	124	3	y	N	t
317	2010-06-10	162	3	y	N	t
318	2010-06-10	221	3	y	N	t
319	2010-06-10	65	3	y	N	t
320	2010-06-09	221	3	y	N	t
321	2010-06-09	210	3	y	N	t
322	2010-06-09	124	3	y	N	t
323	2010-06-09	150	3	y	N	t
324	2010-06-09	167	3	y	N	t
325	2010-06-09	88	3	y	N	t
326	2010-06-09	217	3	y	N	t
327	2010-06-09	152	3	y	N	t
328	2010-06-09	107	3	y	N	t
329	2010-06-09	51	3	y	N	t
330	2010-06-09	49	3	y	N	t
331	2010-06-09	243	3	y	N	t
332	2010-06-10	93	3	y	N	t
333	2010-06-10	96	3	y	N	t
334	2010-06-10	263	3	y	N	t
335	2010-06-10	125	3	y	N	t
336	2010-06-10	177	3	y	N	t
337	2010-06-10	33	3	y	N	t
338	2010-06-10	105	3	y	N	t
339	2010-06-10	179	3	y	N	t
340	2010-06-10	61	3	y	N	t
341	2010-06-10	108	3	y	N	t
342	2010-06-11	148	3	y	N	t
343	2010-06-11	168	3	y	N	t
344	2010-06-11	38	3	y	N	t
345	2010-06-11	180	3	y	N	t
346	2010-06-11	81	3	y	N	t
347	2010-06-11	36	3	y	N	t
348	2010-06-11	49	3	y	N	t
349	2010-06-11	217	3	y	N	t
350	2010-06-11	230	3	y	N	t
351	2010-06-09	83	3	y	N	t
352	2010-06-09	216	3	y	N	t
353	2010-06-12	216	3	y	N	t
354	2010-06-12	83	3	y	N	t
355	2010-06-12	97	3	y	N	t
356	2010-06-12	120	3	y	N	t
357	2010-06-12	230	3	y	N	t
358	2010-06-12	36	3	y	N	t
359	2010-06-12	263	3	y	N	t
360	2010-06-12	96	3	y	N	t
361	2010-06-12	93	3	y	N	t
362	2010-06-12	221	3	y	N	t
363	2010-06-12	210	3	y	N	t
364	2010-06-12	124	3	y	N	t
365	2010-06-12	194	3	y	N	t
366	2010-06-12	88	3	y	N	t
367	2010-06-13	33	3	y	N	t
408	2010-06-26	148	3	y	N	t
369	2010-06-13	171	3	y	N	t
370	2010-06-13	109	3	y	N	t
371	2010-06-24	133	3	y	N	t
372	2010-06-24	88	3	y	N	t
373	2010-06-24	163	3	y	N	t
374	2010-06-24	79	3	y	N	t
375	2010-06-24	233	3	y	N	t
376	2010-06-24	195	3	y	N	t
377	2010-06-24	232	3	y	N	t
378	2010-06-24	224	3	y	N	t
379	2010-06-25	35	3	y	N	t
380	2010-06-25	119	3	y	N	t
381	2010-06-25	226	3	y	N	t
382	2010-06-25	48	3	y	N	t
383	2010-06-25	195	3	y	N	t
384	2010-06-25	233	3	y	N	t
385	2010-06-25	174	3	y	N	t
386	2010-06-25	232	3	y	N	t
387	2010-06-25	224	3	y	N	t
388	2010-06-24	59	3	y	N	t
389	2010-06-25	274	3	y	N	t
390	2010-06-25	46	3	y	N	t
391	2010-06-25	53	3	y	N	t
392	2010-06-25	100	3	y	N	t
393	2010-06-25	162	3	y	N	t
394	2010-06-25	230	3	y	N	t
395	2010-06-25	69	3	y	N	t
397	2010-06-25	49	3	y	N	t
398	2010-06-25	79	3	y	N	t
399	2010-06-25	167	3	y	N	t
400	2010-06-25	168	3	y	N	t
409	2010-06-26	216	3	y	N	t
402	2010-06-25	126	3	y	N	t
403	2010-06-26	125	3	y	N	t
404	2010-06-26	175	3	y	N	t
405	2010-06-26	178	3	y	N	t
406	2010-06-26	127	3	y	N	t
407	2010-06-26	53	3	y	N	t
410	2010-06-26	210	3	y	N	t
411	2010-06-26	124	3	y	N	t
412	2010-06-26	46	3	y	N	t
413	2010-06-26	39	3	y	N	t
414	2010-06-26	52	3	y	N	t
415	2010-06-26	128	3	y	N	t
416	2010-06-26	86	3	y	N	t
417	2010-06-26	186	3	y	N	t
418	2010-06-26	215	3	y	N	t
419	2010-08-01	186	3	y	N	t
420	2010-08-01	219	3	y	N	t
421	2010-08-01	39	3	y	N	t
422	2010-08-01	269	3	y	N	t
423	2010-08-01	168	3	y	N	t
424	2010-08-01	241	3	y	N	t
425	2010-08-01	238	3	y	N	t
426	2010-08-01	106	3	y	N	t
427	2010-08-01	268	3	y	N	t
428	2010-08-01	148	3	y	N	t
429	2010-08-01	130	3	y	N	t
430	2010-08-01	34	3	y	N	t
431	2010-08-01	135	3	y	N	t
432	2010-08-01	33	3	y	N	t
433	2010-08-01	47	3	y	N	t
434	2010-08-01	36	3	y	N	t
435	2010-08-01	206	3	y	N	t
436	2010-08-01	72	3	y	N	t
437	2010-08-01	224	3	y	N	t
438	2010-08-01	100	3	y	N	t
439	2010-08-01	225	3	y	N	t
440	2010-08-01	61	3	y	N	t
441	2010-08-01	172	3	y	N	t
442	2010-08-01	22	3	y	N	t
443	2010-08-01	259	3	y	N	t
444	2010-08-01	128	3	y	N	t
445	2010-08-01	202	3	y	N	t
446	2010-08-01	230	3	y	N	t
447	2010-08-01	243	3	y	N	t
448	2010-08-01	42	3	y	N	t
449	2010-08-01	95	3	y	N	t
450	2010-08-01	215	3	y	N	t
451	2010-08-01	245	3	y	N	t
452	2010-08-01	142	3	y	N	t
453	2010-08-01	256	3	y	N	t
454	2010-08-01	109	3	y	N	t
455	2010-08-01	212	3	y	N	t
456	2010-08-01	80	3	y	N	t
457	2010-08-01	86	3	y	N	t
458	2010-08-01	166	3	y	N	t
459	2010-08-01	88	3	y	N	t
460	2010-08-01	103	3	y	N	t
461	2010-08-01	169	3	y	N	t
462	2010-08-01	171	3	y	N	t
463	2010-08-01	261	3	y	N	t
464	2010-08-01	44	3	y	N	t
465	2010-08-01	132	3	y	N	t
466	2010-08-01	113	3	y	N	t
467	2010-08-01	112	3	y	N	t
468	2010-08-01	62	3	y	N	t
469	2010-08-01	127	3	y	N	t
470	2010-08-01	217	3	y	N	t
471	2010-08-01	104	3	y	N	t
472	2010-08-01	190	3	y	N	t
473	2010-08-01	53	3	y	N	t
474	2010-08-01	46	3	y	N	t
475	2010-08-01	79	3	y	N	t
476	2010-08-01	252	3	y	N	t
477	2010-08-01	52	3	y	N	t
478	2010-08-01	165	3	y	N	t
479	2010-08-01	96	3	y	N	t
480	2010-08-01	175	3	y	N	t
481	2010-08-01	231	3	y	N	t
482	2010-08-01	117	3	y	N	t
483	2010-08-01	64	3	y	N	t
484	2010-08-02	219	3	y	N	t
485	2010-08-02	217	3	y	N	t
486	2010-08-02	133	3	y	N	t
487	2010-08-03	82	3	y	N	t
488	2010-08-03	192	3	y	N	t
489	2010-08-03	180	3	y	N	t
490	2010-08-03	179	3	y	N	t
491	2010-08-03	193	3	y	N	t
492	2010-08-01	59	3	y	N	t
493	2010-08-01	174	3	y	N	t
494	2010-08-03	259	3	y	N	t
495	2010-08-02	187	3	y	N	t
497	2010-08-03	226	3	y	N	t
499	2010-08-03	47	3	y	N	t
500	2010-08-03	108	3	y	N	t
501	2010-08-02	192	3	y	N	t
502	2010-08-03	126	3	y	N	t
503	2010-08-02	232	3	y	N	t
504	2010-08-02	195	3	y	N	t
505	2010-08-02	233	3	y	N	t
506	2010-08-01	114	3	y	N	t
507	2010-08-01	140	3	y	N	t
508	2010-08-01	263	3	y	N	t
509	2010-08-03	33	3	y	N	t
510	2010-08-02	105	3	y	N	t
511	2010-08-03	141	3	y	N	t
512	2010-08-03	46	3	y	N	t
514	2010-08-03	39	3	y	N	t
515	2010-09-01	109	3	y	N	f
516	2010-09-01	196	3	y	N	f
517	2010-09-19	274	3	y	N	f
\.


--
-- Data for Name: web_pscore; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_pscore (id, practiceround_id, hole_id, score) FROM stdin;
1	1	1	4
2	1	2	4
3	1	3	4
4	1	4	4
5	1	5	4
6	1	6	4
7	1	7	4
8	1	8	7
9	1	9	8
10	1	10	9
11	1	11	10
12	1	12	4
13	1	13	5
14	1	14	6
15	1	15	4
16	1	16	4
17	1	17	4
18	1	18	4
19	2	1	7
20	2	2	4
21	2	3	4
22	2	4	4
23	2	5	7
24	2	6	8
25	2	7	3
26	2	8	6
27	2	9	3
28	2	10	3
29	2	11	5
30	2	12	4
31	2	13	4
32	2	14	4
33	2	15	5
34	2	16	6
35	2	17	5
36	2	18	4
37	3	1	0
38	3	2	3
39	3	3	0
40	3	4	0
41	3	5	5
42	3	6	6
43	3	7	5
44	3	8	6
45	3	9	3
46	3	10	6
47	3	11	0
48	3	12	0
49	3	13	4
50	3	14	4
51	3	15	5
52	3	16	0
53	3	17	5
54	3	18	4
55	5	1	0
56	5	2	0
57	5	3	5
58	5	4	6
59	5	5	6
60	5	6	0
61	5	7	3
62	5	8	4
63	5	9	3
64	5	10	6
65	5	11	4
66	5	12	5
67	5	13	4
68	5	14	3
69	5	15	5
70	5	16	5
71	5	17	5
72	5	18	5
73	4	1	5
74	4	2	3
75	4	3	6
76	4	4	4
77	4	5	7
78	4	6	6
79	4	7	6
80	4	8	5
81	4	9	5
82	4	10	4
83	4	11	3
84	4	12	5
85	4	13	5
86	4	14	4
87	4	15	5
88	4	16	5
89	4	17	5
90	4	18	5
91	6	1	7
92	6	2	4
93	6	3	6
94	6	4	5
95	6	5	0
96	6	6	0
97	6	7	4
98	6	8	6
99	6	9	7
100	6	10	0
101	6	11	4
102	6	12	4
103	6	13	5
104	6	14	5
105	6	15	5
106	6	16	7
107	6	17	0
108	6	18	5
109	7	1	6
110	7	2	4
111	7	3	8
112	7	4	4
113	7	5	5
114	7	6	5
115	7	7	4
116	7	8	6
117	7	9	4
118	7	10	4
119	7	11	4
120	7	12	5
121	7	13	6
122	7	14	6
123	7	15	6
124	7	16	6
125	7	17	4
126	7	18	6
127	8	1	6
128	8	2	4
129	8	3	6
130	8	4	5
131	8	5	6
132	8	6	7
133	8	7	3
134	8	8	5
135	8	9	4
136	8	10	4
137	8	11	6
138	8	12	5
139	8	13	4
140	8	14	5
141	8	15	6
142	8	16	6
143	8	17	6
144	8	18	4
145	9	1	0
2338	141	1	4
146	9	2	6
147	9	3	5
148	9	4	5
149	9	5	0
150	9	6	6
151	9	7	7
152	9	8	5
153	9	9	0
154	9	10	5
155	9	11	5
156	9	12	5
157	9	13	6
158	9	14	0
159	9	15	0
160	9	16	7
161	9	17	6
162	9	18	6
163	10	1	7
164	10	2	5
165	10	3	5
166	10	4	5
167	10	5	7
168	10	6	6
169	10	7	3
170	10	8	5
171	10	9	0
172	10	10	0
173	10	11	5
174	10	12	3
175	10	13	5
176	10	14	6
177	10	15	0
178	10	16	0
179	10	17	5
180	10	18	6
181	11	1	5
182	11	2	0
183	11	3	5
184	11	4	0
185	11	5	6
186	11	6	5
187	11	7	3
188	11	8	4
189	11	9	3
190	11	10	0
191	11	11	3
192	11	12	5
193	11	13	4
194	11	14	4
195	11	15	5
196	11	16	6
197	11	17	5
198	11	18	5
199	12	1	5
200	12	2	4
201	12	3	5
202	12	4	5
203	12	5	6
204	12	6	0
205	12	7	4
206	12	8	6
207	12	9	4
208	12	10	5
209	12	11	3
210	12	12	5
211	12	13	4
212	12	14	3
213	12	15	6
214	12	16	8
215	12	17	5
216	12	18	5
217	13	1	6
218	13	2	4
219	13	3	5
220	13	4	6
221	13	5	8
222	13	6	6
223	13	7	4
224	13	8	0
225	13	9	5
226	13	10	7
227	13	11	2
228	13	12	5
229	13	13	5
230	13	14	0
231	13	15	0
232	13	16	8
233	13	17	6
234	13	18	7
235	14	1	7
236	14	2	3
237	14	3	6
238	14	4	4
239	14	5	6
240	14	6	4
241	14	7	3
242	14	8	4
243	14	9	3
244	14	10	0
245	14	11	4
246	14	12	3
247	14	13	6
248	14	14	5
249	14	15	0
250	14	16	6
251	14	17	5
252	14	18	0
253	15	1	8
254	15	2	4
255	15	3	6
256	15	4	7
257	15	5	7
258	15	6	5
259	15	7	3
260	15	8	6
261	15	9	4
262	15	10	5
263	15	11	3
264	15	12	5
265	15	13	6
266	15	14	5
267	15	15	7
268	15	16	6
269	15	17	5
270	15	18	7
271	16	1	8
272	16	2	6
273	16	3	5
274	16	4	7
275	16	5	9
276	16	6	5
277	16	7	4
278	16	8	7
279	16	9	4
280	16	10	5
281	16	11	5
282	16	12	6
283	16	13	7
284	16	14	6
285	16	15	5
286	16	16	6
287	16	17	5
288	16	18	6
289	18	1	5
290	18	2	5
291	18	3	6
292	18	4	4
293	18	5	5
294	18	6	5
295	18	7	4
296	18	8	6
297	18	9	5
298	18	10	6
299	18	11	4
300	18	12	4
301	18	13	5
302	18	14	4
303	18	15	6
304	18	16	6
305	18	17	4
306	18	18	6
307	17	1	6
308	17	2	3
309	17	3	6
310	17	4	5
311	17	5	6
312	17	6	5
313	17	7	5
314	17	8	4
315	17	9	5
316	17	10	5
317	17	11	5
318	17	12	4
319	17	13	5
320	17	14	3
321	17	15	5
322	17	16	6
323	17	17	5
324	17	18	5
325	19	1	8
326	19	2	4
327	19	3	7
328	19	4	5
329	19	5	8
330	19	6	5
331	19	7	6
332	19	8	5
333	19	9	6
334	19	10	5
335	19	11	4
336	19	12	4
337	19	13	5
338	19	14	5
339	19	15	5
340	19	16	7
341	19	17	5
342	19	18	6
389	22	11	4
390	22	12	7
391	22	13	0
392	22	14	4
393	22	15	5
353	20	11	0
354	20	12	0
355	20	13	0
356	20	14	0
357	20	15	0
358	20	16	0
359	20	17	0
360	20	18	0
394	22	16	0
395	22	17	4
396	22	18	5
397	21	1	7
398	21	2	4
343	20	1	7
344	20	2	5
345	20	3	5
346	20	4	5
347	20	5	7
348	20	6	4
349	20	7	5
350	20	8	6
351	20	9	5
352	20	10	7
361	23	1	7
362	23	2	4
363	23	3	5
364	23	4	6
365	23	5	0
366	23	6	6
367	23	7	0
368	23	8	6
369	23	9	5
370	23	10	0
371	23	11	5
372	23	12	0
373	23	13	6
374	23	14	4
375	23	15	6
376	23	16	5
377	23	17	5
378	23	18	0
379	22	1	7
380	22	2	4
381	22	3	4
382	22	4	5
383	22	5	6
384	22	6	0
385	22	7	4
386	22	8	4
387	22	9	5
388	22	10	5
399	21	3	0
400	21	4	0
401	21	5	7
402	21	6	5
403	21	7	4
404	21	8	5
405	21	9	5
406	21	10	6
407	21	11	5
408	21	12	0
409	21	13	6
410	21	14	4
411	21	15	6
412	21	16	5
413	21	17	5
414	21	18	0
415	24	1	7
416	24	2	3
417	24	3	4
418	24	4	4
419	24	5	5
420	24	6	6
421	24	7	4
422	24	8	5
423	24	9	5
424	24	10	7
425	24	11	4
426	24	12	5
427	24	13	7
428	24	14	3
429	24	15	4
430	24	16	6
431	24	17	4
432	24	18	5
433	25	1	6
434	25	2	5
435	25	3	6
436	25	4	7
437	25	5	7
438	25	6	8
439	25	7	3
440	25	8	7
441	25	9	5
442	25	10	7
443	25	11	5
444	25	12	5
445	25	13	4
446	25	14	4
447	25	15	7
448	25	16	7
449	25	17	6
450	25	18	6
451	26	1	6
452	26	2	4
453	26	3	6
454	26	4	6
455	26	5	6
456	26	6	5
457	26	7	6
458	26	8	5
459	26	9	5
460	26	10	5
461	26	11	4
462	26	12	5
463	26	13	6
464	26	14	6
465	26	15	6
466	26	16	6
467	26	17	6
468	26	18	6
469	27	1	7
470	27	2	5
471	27	3	5
472	27	4	6
473	27	5	6
474	27	6	6
475	27	7	5
476	27	8	7
477	27	9	5
478	27	10	6
479	27	11	6
480	27	12	5
481	27	13	4
482	27	14	5
483	27	15	5
484	27	16	6
485	27	17	5
486	27	18	5
487	28	1	7
488	28	2	5
489	28	3	5
490	28	4	5
491	28	5	7
492	28	6	6
493	28	7	5
494	28	8	5
495	28	9	5
496	28	10	5
497	28	11	5
498	28	12	5
499	28	13	6
500	28	14	5
501	28	15	7
502	28	16	6
503	28	17	6
504	28	18	6
505	29	1	7
506	29	2	5
507	29	3	5
508	29	4	6
509	29	5	6
510	29	6	7
511	29	7	5
512	29	8	7
513	29	9	5
514	29	10	6
515	29	11	4
516	29	12	6
517	29	13	6
518	29	14	6
519	29	15	5
520	29	16	7
521	29	17	6
522	29	18	6
523	30	1	6
524	30	2	4
525	30	3	5
526	30	4	5
527	30	5	6
528	30	6	7
529	30	7	6
530	30	8	6
531	30	9	6
532	30	10	5
533	30	11	5
534	30	12	6
535	30	13	5
536	30	14	6
537	30	15	6
538	30	16	7
539	30	17	5
540	30	18	5
541	31	1	6
542	31	2	5
543	31	3	5
544	31	4	5
545	31	5	6
546	31	6	6
547	31	7	6
548	31	8	5
549	31	9	5
550	31	10	4
551	31	11	5
552	31	12	5
553	31	13	6
554	31	14	6
555	31	15	6
556	31	16	5
557	31	17	7
558	31	18	6
559	32	1	7
560	32	2	5
561	32	3	6
562	32	4	6
563	32	5	6
564	32	6	5
565	32	7	7
566	32	8	4
567	32	9	5
568	32	10	6
569	32	11	6
570	32	12	4
571	32	13	5
572	32	14	5
573	32	15	6
574	32	16	6
575	32	17	6
576	32	18	5
757	43	1	8
578	33	2	5
579	33	3	6
580	33	4	6
581	33	5	6
582	33	6	5
758	43	2	4
660	37	12	5
661	37	13	6
662	37	14	7
663	37	15	7
664	37	16	6
665	37	17	7
577	33	1	7
583	33	7	7
584	33	8	4
585	33	9	5
586	33	10	5
587	33	11	4
588	33	12	4
589	33	13	6
590	33	14	6
591	33	15	6
592	33	16	5
593	33	17	7
594	33	18	5
595	34	1	6
596	34	2	4
597	34	3	6
598	34	4	6
599	34	5	6
600	34	6	5
601	34	7	6
602	34	8	6
603	34	9	6
604	34	10	4
605	34	11	6
606	34	12	6
607	34	13	5
608	34	14	4
609	34	15	9
610	34	16	5
611	34	17	5
612	34	18	5
613	35	1	7
614	35	2	3
615	35	3	6
616	35	4	5
617	35	5	8
618	35	6	6
619	35	7	4
620	35	8	7
621	35	9	4
622	35	10	5
623	35	11	3
624	35	12	6
625	35	13	5
626	35	14	3
627	35	15	7
628	35	16	5
629	35	17	5
630	35	18	7
631	36	1	5
632	36	2	4
633	36	3	5
634	36	4	7
635	36	5	7
636	36	6	8
637	36	7	3
638	36	8	6
639	36	9	4
640	36	10	5
641	36	11	5
642	36	12	5
643	36	13	5
644	36	14	6
645	36	15	5
646	36	16	6
647	36	17	5
648	36	18	6
649	37	1	6
650	37	2	4
651	37	3	5
652	37	4	5
653	37	5	7
654	37	6	7
655	37	7	4
656	37	8	6
657	37	9	4
658	37	10	5
659	37	11	5
666	37	18	7
667	38	1	8
668	38	2	5
669	38	3	6
670	38	4	5
671	38	5	6
672	38	6	7
673	38	7	4
674	38	8	5
675	38	9	5
676	38	10	5
677	38	11	5
678	38	12	4
679	38	13	5
680	38	14	6
681	38	15	6
682	38	16	8
683	38	17	5
684	38	18	6
685	39	1	6
686	39	2	4
687	39	3	5
688	39	4	5
689	39	5	7
690	39	6	6
691	39	7	7
692	39	8	6
693	39	9	6
694	39	10	6
695	39	11	5
696	39	12	3
697	39	13	6
698	39	14	4
699	39	15	6
700	39	16	8
701	39	17	5
702	39	18	5
703	40	19	5
704	40	20	4
705	40	21	5
706	40	22	4
707	40	23	7
708	40	24	5
709	40	25	5
710	40	26	5
711	40	27	7
712	40	28	7
713	40	29	5
714	40	30	5
715	40	31	6
716	40	32	4
717	40	33	4
718	40	34	4
719	40	35	0
720	40	36	6
724	41	4	6
725	41	5	5
726	41	6	5
727	41	7	3
728	41	8	5
729	41	9	3
759	43	3	5
739	42	1	7
740	42	2	4
741	42	3	6
742	42	4	4
721	41	1	5
722	41	2	4
723	41	3	5
730	41	10	5
731	41	11	4
732	41	12	4
733	41	13	7
734	41	14	5
735	41	15	6
736	41	16	6
737	41	17	4
738	41	18	5
743	42	5	7
744	42	6	5
745	42	7	5
746	42	8	5
747	42	9	4
748	42	10	4
749	42	11	4
750	42	12	5
751	42	13	6
752	42	14	4
753	42	15	5
754	42	16	5
755	42	17	4
756	42	18	6
760	43	4	6
761	43	5	7
762	43	6	6
763	43	7	4
764	43	8	6
765	43	9	5
766	43	10	4
767	43	11	5
768	43	12	6
769	43	13	5
770	43	14	4
771	43	15	5
772	43	16	6
773	43	17	6
774	43	18	6
775	44	1	7
776	44	2	7
777	44	3	6
778	44	4	6
779	44	5	6
780	44	6	7
781	44	7	5
782	44	8	7
783	44	9	5
784	44	10	6
785	44	11	5
786	44	12	4
787	44	13	6
788	44	14	7
789	44	15	6
790	44	16	6
791	44	17	5
792	44	18	6
793	45	1	7
794	45	2	6
795	45	3	6
796	45	4	7
797	45	5	5
798	45	6	6
799	45	7	4
800	45	8	4
801	45	9	6
802	45	10	5
803	45	11	4
804	45	12	6
805	45	13	6
806	45	14	3
807	45	15	7
808	45	16	7
809	45	17	8
810	45	18	7
811	46	1	8
812	46	2	5
813	46	3	8
814	46	4	6
815	46	5	0
816	46	6	7
817	46	7	0
818	46	8	6
819	46	9	5
820	46	10	5
821	46	11	4
822	46	12	4
823	46	13	6
824	46	14	5
825	46	15	6
826	46	16	6
827	46	17	6
828	46	18	6
829	47	1	6
830	47	2	5
831	47	3	5
832	47	4	5
833	47	5	5
834	47	6	4
835	47	7	5
836	47	8	5
837	47	9	3
838	47	10	5
839	47	11	4
840	47	12	5
841	47	13	5
842	47	14	4
843	47	15	6
844	47	16	6
845	47	17	5
846	47	18	5
847	48	1	7
848	48	2	5
849	48	3	6
850	48	4	6
851	48	5	7
852	48	6	5
853	48	7	4
854	48	8	5
855	48	9	4
856	48	10	4
857	48	11	3
858	48	12	5
859	48	13	5
860	48	14	4
861	48	15	6
862	48	16	7
863	48	17	5
864	48	18	5
865	49	1	7
866	49	2	3
867	49	3	6
868	49	4	6
869	49	5	7
870	49	6	6
871	49	7	5
872	49	8	6
873	49	9	5
874	49	10	4
875	49	11	5
876	49	12	4
1153	65	1	7
877	49	13	6
878	49	14	5
879	49	15	7
880	49	16	7
881	49	17	4
882	49	18	6
883	50	1	8
884	50	2	6
885	50	3	5
886	50	4	5
887	50	5	7
888	50	6	6
889	50	7	5
890	50	8	6
891	50	9	5
892	50	10	7
893	50	11	4
894	50	12	6
895	50	13	6
896	50	14	4
897	50	15	6
898	50	16	7
899	50	17	6
900	50	18	8
901	51	1	9
902	51	2	5
903	51	3	5
904	51	4	5
905	51	5	5
906	51	6	7
907	51	7	5
908	51	8	0
909	51	9	7
910	51	10	6
911	51	11	5
912	51	12	4
913	51	13	0
914	51	14	5
915	51	15	0
916	51	16	0
917	51	17	7
918	51	18	6
919	52	1	7
920	52	2	6
921	52	3	6
922	52	4	6
923	52	5	6
924	52	6	7
925	52	7	4
926	52	8	5
927	52	9	0
928	52	10	5
929	52	11	6
930	52	12	8
931	52	13	6
932	52	14	4
933	52	15	4
934	52	16	7
935	52	17	7
936	52	18	0
937	53	1	6
938	53	2	4
939	53	3	6
940	53	4	6
941	53	5	7
942	53	6	7
943	53	7	4
944	53	8	7
945	53	9	0
946	53	10	6
947	53	11	5
948	53	12	6
949	53	13	5
950	53	14	0
951	53	15	6
952	53	16	7
953	53	17	6
954	53	18	0
955	54	1	6
956	54	2	4
957	54	3	4
958	54	4	3
959	54	5	7
960	54	6	7
961	54	7	5
962	54	8	5
963	54	9	5
964	54	10	6
965	54	11	5
966	54	12	4
967	54	13	5
968	54	14	4
969	54	15	5
970	54	16	5
971	54	17	6
972	54	18	7
973	55	1	8
974	55	2	4
975	55	3	6
976	55	4	5
977	55	5	8
978	55	6	7
979	55	7	5
980	55	8	4
981	55	9	5
982	55	10	6
983	55	11	4
984	55	12	5
985	55	13	6
986	55	14	5
987	55	15	6
988	55	16	6
989	55	17	5
990	55	18	7
991	56	1	5
992	56	2	3
993	56	3	6
994	56	4	5
995	56	5	6
996	56	6	7
997	56	7	3
998	56	8	4
999	56	9	4
1000	56	10	6
1001	56	11	3
1002	56	12	5
1003	56	13	4
1004	56	14	3
1005	56	15	4
1006	56	16	6
1007	56	17	5
1008	56	18	5
1009	57	1	8
1010	57	2	4
1011	57	3	5
1012	57	4	6
1013	57	5	7
1014	57	6	5
1015	57	7	5
1016	57	8	4
1017	57	9	5
1018	57	10	4
1019	57	11	5
1020	57	12	7
1021	57	13	6
1022	57	14	5
1023	57	15	5
1024	57	16	7
1025	57	17	5
1026	57	18	6
1027	58	1	6
1028	58	2	5
1029	58	3	5
1030	58	4	6
1031	58	5	7
1032	58	6	4
1033	58	7	6
1034	58	8	5
1035	58	9	5
1036	58	10	6
1037	58	11	5
1038	58	12	6
1039	58	13	4
1040	58	14	5
1041	58	15	4
1042	58	16	7
1043	58	17	5
1044	58	18	6
1045	59	1	7
1046	59	2	5
1047	59	3	6
1048	59	4	5
1049	59	5	8
1050	59	6	6
1051	59	7	5
1052	59	8	6
1053	59	9	5
1054	59	10	7
1055	59	11	5
1056	59	12	5
1057	59	13	6
1058	59	14	7
1059	59	15	5
1060	59	16	6
1061	59	17	5
1062	59	18	8
1063	60	1	6
1064	60	2	4
1065	60	3	5
1066	60	4	5
1067	60	5	7
1068	60	6	7
1069	60	7	5
1070	60	8	5
1071	60	9	7
1072	60	10	5
1073	60	11	7
1074	60	12	5
1075	60	13	5
1076	60	14	5
1077	60	15	5
1078	60	16	6
1079	60	17	7
1080	60	18	5
1081	61	1	5
1082	61	2	4
1083	61	3	7
1084	61	4	5
1085	61	5	7
1086	61	6	6
1087	61	7	4
1088	61	8	0
1089	61	9	4
1090	61	10	4
1091	61	11	5
1092	61	12	5
1093	61	13	5
1094	61	14	3
1095	61	15	0
1096	61	16	5
1097	61	17	7
1098	61	18	6
1099	62	1	8
1100	62	2	6
1101	62	3	7
1102	62	4	0
1103	62	5	6
1104	62	6	6
1105	62	7	7
1106	62	8	0
1107	62	9	5
1108	62	10	6
1109	62	11	4
1110	62	12	6
1111	62	13	0
1112	62	14	0
1113	62	15	5
1114	62	16	10
1115	62	17	8
1116	62	18	6
1117	63	1	7
1118	63	2	4
1119	63	3	6
1120	63	4	4
1121	63	5	5
1122	63	6	7
1123	63	7	3
1124	63	8	5
1125	63	9	5
1126	63	10	6
1127	63	11	2
1128	63	12	5
1129	63	13	5
1130	63	14	3
1131	63	15	5
1132	63	16	6
1133	63	17	4
1134	63	18	5
1136	64	2	3
1137	64	3	6
1138	64	4	0
1139	64	5	8
1140	64	6	5
1141	64	7	5
1142	64	8	0
1143	64	9	0
1144	64	10	0
1145	64	11	3
1146	64	12	4
1147	64	13	6
1148	64	14	4
1149	64	15	5
1150	64	16	7
1151	64	17	5
1152	64	18	4
2590	149	1	7
1154	65	2	0
1155	65	3	5
1156	65	4	5
1157	65	5	7
1158	65	6	6
1159	65	7	0
1160	65	8	5
1161	65	9	6
1162	65	10	0
1163	65	11	4
1164	65	12	0
1165	65	13	0
1166	65	14	0
1167	65	15	6
1168	65	16	8
1135	64	1	6
1169	65	17	5
1170	65	18	5
1171	66	1	4
1172	66	2	5
1173	66	3	6
1174	66	4	4
1175	66	5	7
1176	66	6	5
1177	66	7	4
1178	66	8	6
1179	66	9	6
1180	66	10	7
1181	66	11	6
1182	66	12	6
1183	66	13	7
1184	66	14	5
1185	66	15	4
1186	66	16	3
1187	66	17	5
1188	66	18	5
1189	67	1	7
1190	67	2	5
1191	67	3	5
1192	67	4	6
1193	67	5	7
1194	67	6	5
1195	67	7	5
1196	67	8	5
1197	67	9	4
1198	67	10	5
1199	67	11	5
1200	67	12	6
1201	67	13	5
1202	67	14	6
1203	67	15	5
1204	67	16	7
1205	67	17	5
1206	67	18	5
1207	68	1	5
1208	68	2	3
1209	68	3	5
1210	68	4	4
1211	68	5	6
1212	68	6	6
1213	68	7	3
1214	68	8	7
1215	68	9	5
1216	68	10	5
1217	68	11	4
1218	68	12	4
1219	68	13	5
1220	68	14	4
1221	68	15	4
1222	68	16	5
1223	68	17	5
1224	68	18	6
1225	69	1	7
1226	69	2	5
1227	69	3	7
1228	69	4	5
1229	69	5	8
1230	69	6	8
1231	69	7	5
1232	69	8	6
1233	69	9	5
1234	69	10	7
1235	69	11	6
1236	69	12	6
1237	69	13	6
1238	69	14	6
1239	69	15	6
1240	69	16	8
1241	69	17	5
1242	69	18	6
1243	70	1	6
1244	70	2	5
1245	70	3	4
1246	70	4	4
1247	70	5	6
1248	70	6	5
1249	70	7	3
1250	70	8	5
1251	70	9	3
1252	70	10	7
1253	70	11	3
1254	70	12	4
1255	70	13	5
1256	70	14	7
1257	70	15	5
1258	70	16	6
1259	70	17	4
1260	70	18	5
1261	71	1	5
1262	71	2	5
1263	71	3	5
1264	71	4	4
1265	71	5	4
1266	71	6	5
1267	71	7	4
1268	71	8	4
1269	71	9	3
1270	71	10	5
1271	71	11	4
1272	71	12	3
1273	71	13	5
1274	71	14	4
1275	71	15	5
1276	71	16	6
1277	71	17	4
1278	71	18	5
1279	72	1	5
1280	72	2	4
1281	72	3	6
1282	72	4	5
1283	72	5	7
1284	72	6	4
1285	72	7	7
1286	72	8	5
1287	72	9	4
1288	72	10	7
1289	72	11	3
1290	72	12	4
1291	72	13	4
1292	72	14	2
1293	72	15	5
1294	72	16	6
1295	72	17	5
1296	72	18	5
1297	73	1	7
1298	73	2	5
1299	73	3	5
1300	73	4	5
1301	73	5	9
1302	73	6	6
1303	73	7	3
1304	73	8	5
1305	73	9	4
1306	73	10	4
1307	73	11	5
1308	73	12	5
1309	73	13	6
1310	73	14	4
1311	73	15	7
1312	73	16	6
1313	73	17	5
1314	73	18	6
1315	74	1	5
1316	74	2	4
1317	74	3	6
1318	74	4	5
1319	74	5	7
1320	74	6	5
1321	74	7	3
1322	74	8	5
1323	74	9	4
1324	74	10	5
1325	74	11	3
1326	74	12	5
1327	74	13	7
1328	74	14	5
1329	74	15	4
1330	74	16	7
1331	74	17	4
1332	74	18	5
1333	75	1	8
1334	75	2	4
1335	75	3	6
1336	75	4	5
1337	75	5	6
1338	75	6	5
1339	75	7	3
1340	75	8	5
1341	75	9	4
1342	75	10	6
1343	75	11	3
1344	75	12	6
1345	75	13	5
1346	75	14	3
1347	75	15	5
1348	75	16	6
1349	75	17	4
1350	75	18	5
1351	76	1	7
1352	76	2	4
1353	76	3	7
1354	76	4	6
1355	76	5	6
1356	76	6	8
1357	76	7	5
1358	76	8	5
1359	76	9	7
1360	76	10	5
1361	76	11	5
1362	76	12	5
1363	76	13	3
1364	76	14	4
1365	76	15	6
1366	76	16	5
1367	76	17	6
1368	76	18	5
1369	77	1	7
1370	77	2	5
1371	77	3	5
1372	77	4	6
1373	77	5	6
1374	77	6	5
1375	77	7	4
1376	77	8	6
1377	77	9	5
1378	77	10	6
1379	77	11	5
1380	77	12	6
1381	77	13	6
1382	77	14	5
1383	77	15	6
1384	77	16	6
1385	77	17	5
1386	77	18	4
1387	78	1	6
1388	78	2	7
1389	78	3	4
1390	78	4	4
1391	78	5	8
1392	78	6	5
1393	78	7	5
1394	78	8	4
1395	78	9	5
1396	78	10	4
1397	78	11	5
1398	78	12	7
1399	78	13	4
1400	78	14	5
1401	78	15	5
1402	78	16	4
1403	78	17	4
1404	78	18	6
1405	79	1	6
1406	79	2	4
1407	79	3	6
1408	79	4	5
1409	79	5	7
1410	79	6	6
1411	79	7	4
1412	79	8	6
1413	79	9	4
1414	79	10	6
1415	79	11	4
1416	79	12	4
1417	79	13	6
1418	79	14	5
1419	79	15	6
1420	79	16	7
1421	79	17	5
1422	79	18	6
1423	80	1	7
1424	80	2	4
1425	80	3	5
1426	80	4	7
1427	80	5	5
1428	80	6	6
1429	80	7	5
1430	80	8	6
1431	80	9	5
1432	80	10	7
1433	80	11	4
1434	80	12	5
1435	80	13	6
1436	80	14	5
1437	80	15	7
1438	80	16	7
1439	80	17	6
1440	80	18	5
1441	81	1	7
1442	81	2	4
1443	81	3	7
1444	81	4	6
1445	81	5	6
1446	81	6	5
1447	81	7	5
1448	81	8	5
1449	81	9	3
1450	81	10	4
1451	81	11	4
1452	81	12	5
1453	81	13	0
1454	81	14	0
1455	81	15	0
1456	81	16	7
1457	81	17	4
1458	81	18	5
1459	82	1	9
1460	82	2	4
1461	82	3	5
1462	82	4	5
1463	82	5	6
1464	82	6	5
1465	82	7	4
1466	82	8	4
1467	82	9	5
1468	82	10	6
1469	82	11	4
1470	82	12	5
1471	82	13	5
1472	82	14	4
1473	82	15	6
1474	82	16	8
1475	82	17	5
1476	82	18	6
1477	83	1	6
1478	83	2	4
1479	83	3	6
1480	83	4	6
1481	83	5	8
1482	83	6	5
1483	83	7	4
1484	83	8	3
1485	83	9	5
1486	83	10	5
1487	83	11	5
1488	83	12	5
1489	83	13	5
1490	83	14	5
1491	83	15	6
1492	83	16	4
1493	83	17	5
1494	83	18	4
1495	85	1	6
1496	85	2	4
1497	85	3	6
1498	85	4	5
1499	85	5	7
1500	85	6	5
1501	85	7	3
1502	85	8	5
1503	85	9	6
1504	85	10	5
1505	85	11	3
1506	85	12	3
1507	85	13	5
1508	85	14	3
1509	85	15	5
1510	85	16	4
1511	85	17	7
1512	85	18	8
1513	86	1	7
1514	86	2	5
1515	86	3	5
1516	86	4	5
1517	86	5	6
1518	86	6	6
1519	86	7	4
1520	86	8	6
1521	86	9	4
1522	86	10	5
1523	86	11	4
1524	86	12	5
1525	86	13	5
1526	86	14	4
1527	86	15	5
1528	86	16	5
1529	86	17	4
1530	86	18	7
1531	87	1	7
1532	87	2	4
1533	87	3	6
1534	87	4	5
1535	87	5	6
1536	87	6	5
1537	87	7	5
1538	87	8	5
1539	87	9	5
1540	87	10	5
1541	87	11	5
1542	87	12	5
1543	87	13	5
1544	87	14	6
1545	87	15	5
1546	87	16	6
1547	87	17	5
1548	87	18	5
1549	88	1	6
1550	88	2	5
1551	88	3	6
1552	88	4	6
1553	88	5	6
1554	88	6	8
1555	88	7	7
1556	88	8	5
1557	88	9	5
1558	88	10	6
1559	88	11	5
1560	88	12	5
1561	88	13	6
1562	88	14	6
1563	88	15	7
1564	88	16	7
1565	88	17	5
1566	88	18	7
1567	84	1	6
1568	84	2	4
1569	84	3	6
1570	84	4	7
1571	84	5	6
1572	84	6	6
1573	84	7	4
1574	84	8	4
1575	84	9	4
1576	84	10	5
1577	84	11	4
1578	84	12	5
1579	84	13	5
1580	84	14	4
1581	84	15	6
1582	84	16	6
1583	84	17	5
1584	84	18	6
1585	90	1	8
1586	90	2	3
1587	90	3	5
1588	90	4	6
1589	90	5	5
1590	90	6	6
1591	90	7	4
1592	90	8	6
1593	90	9	4
1594	90	10	4
1595	90	11	4
1596	90	12	6
1597	90	13	7
1598	90	14	6
1599	90	15	6
1600	90	16	6
1601	90	17	5
1602	90	18	6
1603	91	1	6
1604	91	2	5
1605	91	3	8
1606	91	4	6
1607	91	5	5
1608	91	6	5
1609	91	7	3
1610	91	8	5
1611	91	9	4
1612	91	10	4
1613	91	11	5
1614	91	12	6
1615	91	13	7
1616	91	14	5
1617	91	15	6
1618	91	16	6
1619	91	17	5
1620	91	18	6
1621	92	1	5
1622	92	2	4
1623	92	3	4
1624	92	4	4
1625	92	5	5
1626	92	6	5
1627	92	7	4
1628	92	8	4
1629	92	9	3
1630	92	10	5
1631	92	11	4
1632	92	12	6
1633	92	13	5
1634	92	14	4
1635	92	15	5
1636	92	16	5
1637	92	17	5
1638	92	18	5
1639	93	1	8
1640	93	2	4
1641	93	3	6
1642	93	4	6
1643	93	5	6
1644	93	6	6
1645	93	7	6
1646	93	8	3
1647	93	9	6
1648	93	10	6
1649	93	11	7
1650	93	12	4
1651	93	13	5
1652	93	14	6
1653	93	15	5
1654	93	16	4
1655	93	17	8
1656	93	18	5
1657	95	1	5
1658	95	2	5
1659	95	3	5
1660	95	4	6
1661	95	5	5
1662	95	6	6
1663	95	7	5
1664	95	8	3
1665	95	9	5
1666	95	10	3
1667	95	11	5
1668	95	12	5
1669	95	13	4
1670	95	14	7
1671	95	15	4
1672	95	16	6
1673	95	17	7
1674	95	18	6
1675	96	1	7
1676	96	2	4
1677	96	3	7
1678	96	4	5
1679	96	5	4
1680	96	6	4
1681	96	7	4
1682	96	8	5
1683	96	9	6
1684	96	10	3
1685	96	11	5
1686	96	12	4
1687	96	13	5
1688	96	14	6
1689	96	15	6
1690	96	16	5
1691	96	17	7
1692	96	18	6
1693	97	1	5
1694	97	2	4
1695	97	3	6
1696	97	4	5
1697	97	5	8
1698	97	6	5
1699	97	7	4
1700	97	8	5
1701	97	9	4
1702	97	10	5
1703	97	11	5
1704	97	12	5
1705	97	13	4
1706	97	14	6
1707	97	15	7
1708	97	16	8
1709	97	17	6
1710	97	18	5
1711	98	1	6
1712	98	2	5
1713	98	3	5
1714	98	4	4
1715	98	5	5
1716	98	6	0
1717	98	7	0
1718	98	8	5
1719	98	9	0
1720	98	10	0
1721	98	11	3
1722	98	12	4
1723	98	13	0
1724	98	14	4
1725	98	15	0
1726	98	16	7
1727	98	17	0
1728	98	18	5
1729	99	1	7
1730	99	2	0
1731	99	3	0
1732	99	4	5
1733	99	5	0
1734	99	6	0
1735	99	7	0
1736	99	8	5
1737	99	9	5
1738	99	10	0
1739	99	11	0
1740	99	12	0
1741	99	13	6
1742	99	14	4
1743	99	15	0
1744	99	16	0
1745	99	17	0
1746	99	18	0
1747	100	1	6
1748	100	2	0
1749	100	3	5
1750	100	4	4
2680	145	19	6
1751	100	5	5
1752	100	6	5
1753	100	7	0
1754	100	8	5
1755	100	9	3
1756	100	10	5
1757	100	11	2
1758	100	12	5
1759	100	13	6
1760	100	14	0
1761	100	15	0
1762	100	16	6
1763	100	17	5
1764	100	18	4
1765	101	1	6
1766	101	2	5
1767	101	3	0
1768	101	4	6
1769	101	5	0
1770	101	6	0
1771	101	7	6
1772	101	8	5
1773	101	9	0
1774	101	10	5
1775	101	11	4
1776	101	12	5
1777	101	13	6
1778	101	14	4
1779	101	15	5
1780	101	16	0
1781	101	17	6
1782	101	18	6
1783	102	1	0
1784	102	2	4
1785	102	3	7
1786	102	4	5
1787	102	5	8
1788	102	6	5
1789	102	7	6
1790	102	8	6
1791	102	9	0
1792	102	10	0
1793	102	11	3
1794	102	12	6
1795	102	13	6
1796	102	14	0
1797	102	15	7
1798	102	16	0
1799	102	17	6
1800	102	18	0
1801	104	1	0
1802	104	2	4
1803	104	3	0
1804	104	4	7
1805	104	5	0
1806	104	6	7
1807	104	7	5
1808	104	8	6
1809	104	9	4
1810	104	10	5
1811	104	11	5
1812	104	12	6
1813	104	13	6
1814	104	14	5
1815	104	15	0
1816	104	16	0
1817	104	17	0
1818	104	18	0
1819	105	1	7
1820	105	2	4
1821	105	3	0
1822	105	4	6
1823	105	5	6
1824	105	6	6
1825	105	7	0
1826	105	8	4
1827	105	9	3
1828	105	10	4
1829	105	11	2
1830	105	12	5
1831	105	13	4
1832	105	14	4
1833	105	15	6
1834	105	16	6
1835	105	17	4
1836	105	18	5
1837	106	1	6
1838	106	2	5
1839	106	3	0
1840	106	4	6
1841	106	5	5
1842	106	6	5
1843	106	7	0
1844	106	8	0
1845	106	9	3
1846	106	10	0
1847	106	11	6
1848	106	12	5
1849	106	13	5
1850	106	14	5
1851	106	15	5
1852	106	16	8
1853	106	17	5
1854	106	18	4
1855	107	1	0
1856	107	2	3
1857	107	3	6
1858	107	4	6
1859	107	5	7
1860	107	6	0
1861	107	7	5
1862	107	8	4
1863	107	9	0
1864	107	10	4
1865	107	11	5
1866	107	12	5
1867	107	13	5
1868	107	14	5
1869	107	15	0
1870	107	16	0
1871	107	17	6
1872	107	18	6
1873	108	1	0
1874	108	2	4
1875	108	3	5
1876	108	4	6
1877	108	5	7
1878	108	6	6
1879	108	7	5
1880	108	8	7
1881	108	9	5
1882	108	10	6
1883	108	11	4
1884	108	12	6
1885	108	13	4
1886	108	14	4
1887	108	15	5
1888	108	16	7
1889	108	17	6
1890	108	18	6
1891	109	1	7
1892	109	2	4
1893	109	3	6
1894	109	4	7
1895	109	5	6
1896	109	6	6
1897	109	7	5
1898	109	8	5
1899	109	9	5
1900	109	10	5
1901	109	11	4
1902	109	12	7
1903	109	13	5
1904	109	14	0
1905	109	15	0
1906	109	16	7
1907	109	17	0
1908	109	18	6
2591	149	2	8
1960	113	1	0
2592	149	3	7
1961	113	2	3
2593	149	4	7
1962	113	3	6
2594	149	5	7
1963	113	4	0
2595	149	6	8
1964	113	5	6
2596	149	7	7
1965	113	6	5
2597	149	8	8
1966	113	7	3
2598	149	9	7
1967	113	8	5
1968	113	9	4
1969	113	10	5
1970	113	11	0
1971	113	12	5
1972	113	13	4
1973	113	14	3
1974	113	15	4
1975	113	16	5
1976	113	17	4
1977	113	18	5
1978	114	1	6
1979	114	2	6
1980	114	3	5
2599	149	10	7
2600	149	11	6
2601	149	12	6
2602	149	13	6
2603	149	14	5
2604	149	15	8
2605	149	16	0
1924	111	1	6
1925	111	2	3
1926	111	3	6
1927	111	4	4
1928	111	5	5
1929	111	6	5
1930	111	7	4
1931	111	8	4
1932	111	9	3
1933	111	10	4
1934	111	11	4
1935	111	12	5
1936	111	13	4
1937	111	14	3
1938	111	15	4
1939	111	16	5
1940	111	17	0
1941	111	18	5
1942	112	1	0
1943	112	2	4
1944	112	3	6
1945	112	4	6
1946	112	5	7
1947	112	6	7
1948	112	7	4
1949	112	8	7
1950	112	9	5
1951	112	10	6
1952	112	11	4
1953	112	12	3
1954	112	13	6
1955	112	14	0
1956	112	15	5
1957	112	16	6
1958	112	17	5
1959	112	18	5
1981	114	4	6
1982	114	5	8
1983	114	6	0
1984	114	7	0
1985	114	8	0
1986	114	9	0
1987	114	10	0
1988	114	11	5
1989	114	12	5
1990	114	13	5
1991	114	14	3
1992	114	15	0
1993	114	16	0
1994	114	17	6
1995	114	18	0
1996	115	1	6
1997	115	2	3
1998	115	3	6
1999	115	4	6
2000	115	5	6
2001	115	6	5
2002	115	7	3
2003	115	8	5
2004	115	9	0
2005	115	10	5
2006	115	11	3
2007	115	12	4
2008	115	13	5
2009	115	14	4
2010	115	15	0
2011	115	16	6
2012	115	17	5
2013	115	18	4
2014	116	1	6
2015	116	2	0
2016	116	3	6
2017	116	4	6
2018	116	5	0
2019	116	6	7
2020	116	7	0
2021	116	8	0
2022	116	9	6
2023	116	10	6
2024	116	11	4
2025	116	12	7
2026	116	13	0
2027	116	14	0
2028	116	15	0
2029	116	16	0
2030	116	17	0
2031	116	18	0
2032	117	1	6
2033	117	2	3
2034	117	3	5
2035	117	4	5
2036	117	5	6
2037	117	6	5
2038	117	7	3
2039	117	8	6
2040	117	9	5
2041	117	10	5
2042	117	11	4
2043	117	12	5
2044	117	13	5
2045	117	14	5
2046	117	15	4
2047	117	16	4
2048	117	17	6
2049	117	18	5
2536	146	1	6
2537	146	2	5
2538	146	3	5
2539	146	4	6
2540	146	5	7
2541	146	6	5
2542	146	7	4
2543	146	8	5
2544	146	9	4
2545	146	10	5
2546	146	11	3
2547	146	12	4
2548	146	13	6
2549	146	14	5
2550	146	15	5
2551	146	16	5
2552	146	17	4
2553	146	18	6
2606	149	17	0
2607	149	18	0
2644	151	1	6
2645	151	2	4
2646	151	3	5
2647	151	4	3
2648	151	5	8
2649	151	6	5
2650	151	7	7
2651	151	8	4
2652	151	9	3
2653	151	10	8
2654	151	11	4
2655	151	12	8
2656	151	13	4
2657	151	14	4
2658	151	15	8
2659	151	16	5
2660	151	17	5
2661	151	18	4
2681	145	20	6
2682	145	21	5
2683	145	22	5
2684	145	23	7
2685	145	24	5
2686	145	25	4
2687	145	26	6
2688	145	27	7
2689	145	28	7
2690	145	29	6
2691	145	30	5
2692	145	31	7
2693	145	32	4
2694	145	33	5
2695	145	34	4
2696	145	35	5
2697	145	36	6
2734	156	1	5
2735	156	2	4
2736	156	3	5
2737	156	4	4
2738	156	5	6
2739	156	6	5
2740	156	7	4
2741	156	8	5
2742	156	9	6
2743	156	10	5
2744	156	11	4
2745	156	12	5
2746	156	13	5
2747	156	14	3
2748	156	15	3
2749	156	16	6
2750	156	17	5
2751	156	18	5
2788	159	1	7
2789	159	2	4
2790	159	3	6
2791	159	4	5
2792	159	5	8
2793	159	6	6
2794	159	7	4
2795	159	8	4
2796	159	9	5
2797	159	10	6
2798	159	11	4
2799	159	12	5
2800	159	13	6
2801	159	14	5
2802	159	15	6
2803	159	16	7
2804	159	17	4
2805	159	18	6
2824	161	1	6
2825	161	2	4
2826	161	3	5
2827	161	4	4
2828	161	5	5
2829	161	6	5
2830	161	7	4
2831	161	8	5
2832	161	9	3
2833	161	10	4
2834	161	11	4
2835	161	12	5
2836	161	13	5
2837	161	14	4
2838	161	15	4
2839	161	16	5
2840	161	17	5
2841	161	18	5
2885	163	8	5
2886	163	9	5
2887	163	10	4
2888	163	11	4
2889	163	12	4
2890	163	13	5
2891	163	14	5
2892	163	15	5
2893	163	16	7
2860	164	1	7
2861	164	2	4
2862	164	3	5
2863	164	4	5
2864	164	5	5
2865	164	6	5
2866	164	7	4
2867	164	8	5
2868	164	9	4
2869	164	10	5
2870	164	11	4
2871	164	12	4
2872	164	13	5
2873	164	14	4
2874	164	15	7
2875	164	16	5
2876	164	17	3
2877	164	18	5
2894	163	17	4
2895	163	18	4
2896	165	1	5
2554	147	1	7
2555	147	2	4
2556	147	3	6
2557	147	4	8
2558	147	5	7
2559	147	6	6
2560	147	7	5
2561	147	8	5
2562	147	9	4
2563	147	10	6
2564	147	11	5
2565	147	12	5
2566	147	13	6
2567	147	14	5
2568	147	15	6
2569	147	16	6
2570	147	17	6
2571	147	18	5
2608	150	1	5
2609	150	2	3
2610	150	3	5
2611	150	4	9
2612	150	5	9
2613	150	6	5
2614	150	7	4
2615	150	8	4
2616	150	9	5
2617	150	10	6
2618	150	11	4
2619	150	12	5
2620	150	13	6
2621	150	14	4
2622	150	15	5
2623	150	16	6
2624	150	17	5
2625	150	18	7
2662	153	1	6
2663	153	2	4
2664	153	3	6
2665	153	4	7
2666	153	5	7
2667	153	6	8
2668	153	7	6
2669	153	8	4
2670	153	9	4
2671	153	10	5
2672	153	11	4
2673	153	12	4
2674	153	13	5
2675	153	14	4
2676	153	15	8
2677	153	16	7
2678	153	17	5
2679	153	18	7
2698	154	1	6
2699	154	2	5
2700	154	3	4
2701	154	4	8
2702	154	5	7
2703	154	6	5
2704	154	7	3
2705	154	8	4
2706	154	9	4
2707	154	10	6
2708	154	11	5
2709	154	12	6
2710	154	13	6
2711	154	14	6
2712	154	15	3
2713	154	16	7
2714	154	17	5
2715	154	18	5
2339	141	2	3
2340	141	3	6
2341	141	4	6
2342	141	5	7
2343	141	6	7
2344	141	7	5
2345	141	8	8
2346	141	9	4
2347	141	10	6
2348	141	11	5
2349	141	12	6
2350	141	13	5
2351	141	14	5
2752	157	1	7
2753	157	2	6
2754	157	3	6
2755	157	4	7
2756	157	5	9
2757	157	6	8
2758	157	7	6
2759	157	8	7
2760	157	9	5
2761	157	10	6
2762	157	11	4
2763	157	12	5
2764	157	13	7
2765	157	14	6
2766	157	15	6
2767	157	16	7
2768	157	17	8
2769	157	18	6
2302	132	1	8
2303	132	2	6
2304	132	3	7
2305	132	4	5
2306	132	5	8
2307	132	6	6
2308	132	7	6
2309	132	8	7
2310	132	9	5
2311	132	10	6
2312	132	11	6
2313	132	12	7
2314	132	13	8
2315	132	14	5
2316	132	15	6
2317	132	16	8
2318	132	17	6
2319	132	18	7
2320	133	19	5
2321	133	20	5
2322	133	21	6
2323	133	22	4
2324	133	23	7
2325	133	24	5
2326	133	25	3
2327	133	26	6
2328	133	27	7
2329	133	28	9
2330	133	29	5
2331	133	30	5
2332	133	31	0
2333	133	32	5
2334	133	33	6
2335	133	34	2
2336	133	35	5
2337	133	36	5
2806	160	1	6
2807	160	2	5
2808	160	3	5
2809	160	4	5
2810	160	5	5
2811	160	6	5
3022	172	19	6
2353	141	16	7
2354	141	17	6
2355	141	18	6
3076	175	19	5
2356	135	1	6
2357	135	2	4
2358	135	3	6
2359	135	4	7
2360	135	5	6
2361	135	6	6
2362	135	7	4
2363	135	8	4
2364	135	9	3
2365	135	10	6
2366	135	11	4
2367	135	12	4
2368	135	13	5
2369	135	14	4
2370	135	15	6
2371	135	16	7
2372	135	17	4
2373	135	18	6
2374	134	1	4
2375	134	2	3
2376	134	3	4
2377	134	4	6
2378	134	5	6
2379	134	6	4
2380	134	7	4
2381	134	8	4
2382	134	9	3
2383	134	10	6
2384	134	11	4
2385	134	12	5
2386	134	13	6
2387	134	14	4
2388	134	15	4
2389	134	16	5
2390	134	17	5
2391	134	18	4
2392	138	1	7
2393	138	2	5
2394	138	3	5
2395	138	4	5
2396	138	5	7
2397	138	6	5
2398	138	7	4
2399	138	8	5
2400	138	9	3
2401	138	10	5
2402	138	11	4
2403	138	12	4
2404	138	13	6
2405	138	14	4
2406	138	15	4
2407	138	16	6
2408	138	17	4
2409	138	18	5
2410	140	1	6
2411	140	2	4
2412	140	3	6
2413	140	4	4
2414	140	5	7
2415	140	6	5
2416	140	7	5
2417	140	8	7
2418	140	9	4
2419	140	10	5
2420	140	11	5
2421	140	12	5
2422	140	13	5
2423	140	14	5
2424	140	15	7
2425	140	16	5
2426	140	17	4
2427	140	18	6
2428	142	1	8
2429	142	2	4
2430	142	3	5
2431	142	4	5
2432	142	5	9
2433	142	6	6
2434	142	7	5
2435	142	8	5
2436	142	9	3
2437	142	10	5
2438	142	11	4
2439	142	12	5
2440	142	13	5
2441	142	14	5
2442	142	15	4
2443	142	16	5
2444	142	17	6
2445	142	18	5
2446	143	1	7
2447	143	2	4
2448	143	3	6
2449	143	4	6
2450	143	5	7
2451	143	6	6
2452	143	7	5
2453	143	8	4
2454	143	9	4
2455	143	10	5
2456	143	11	4
2457	143	12	4
2458	143	13	6
2459	143	14	5
2460	143	15	5
2461	143	16	8
2462	143	17	4
2463	143	18	7
2464	144	1	8
2465	144	2	5
2466	144	3	7
2467	144	4	6
2468	144	5	7
2469	144	6	7
2470	144	7	4
2471	144	8	4
2472	144	9	4
2473	144	10	4
2474	144	11	4
2475	144	12	4
2476	144	13	5
2477	144	14	5
2478	144	15	6
2479	144	16	7
2480	144	17	5
2481	144	18	6
2482	136	1	5
2483	136	2	3
2484	136	3	8
2485	136	4	4
2486	136	5	8
2487	136	6	5
2488	136	7	5
2489	136	8	5
2490	136	9	3
2491	136	10	8
2492	136	11	5
2493	136	12	4
2494	136	13	5
2495	136	14	5
2496	136	15	4
2352	141	15	6
2497	136	16	6
2498	136	17	4
2499	136	18	4
2500	139	1	7
2501	139	2	5
2502	139	3	5
2503	139	4	6
2504	139	5	7
2505	139	6	6
2506	139	7	3
2507	139	8	6
2508	139	9	4
2509	139	10	6
2510	139	11	7
2511	139	12	4
2512	139	13	5
2513	139	14	5
2514	139	15	5
2515	139	16	6
2516	139	17	5
2517	139	18	5
2518	137	1	7
2519	137	2	3
2520	137	3	5
2521	137	4	7
2522	137	5	8
2523	137	6	7
2524	137	7	4
2525	137	8	8
2526	137	9	4
2527	137	10	4
2528	137	11	5
2529	137	12	5
2530	137	13	6
2531	137	14	4
2532	137	15	5
2533	137	16	7
2534	137	17	4
2535	137	18	0
2572	148	1	8
2573	148	2	3
2574	148	3	8
2575	148	4	3
2576	148	5	7
2577	148	6	7
2578	148	7	4
2579	148	8	5
2580	148	9	5
2581	148	10	5
2582	148	11	5
2583	148	12	5
2584	148	13	5
2585	148	14	4
2586	148	15	6
2587	148	16	5
2588	148	17	6
2589	148	18	5
2626	152	1	6
2627	152	2	4
2628	152	3	6
2629	152	4	6
2630	152	5	6
2631	152	6	4
2632	152	7	4
2633	152	8	5
2634	152	9	3
2635	152	10	4
2636	152	11	2
2637	152	12	4
2638	152	13	4
2639	152	14	6
2640	152	15	7
2641	152	16	6
2642	152	17	4
2643	152	18	6
2716	155	1	5
2717	155	2	4
2718	155	3	6
2719	155	4	7
2720	155	5	8
2721	155	6	6
2722	155	7	3
2723	155	8	6
2724	155	9	3
2725	155	10	5
2726	155	11	6
2727	155	12	7
2728	155	13	3
2729	155	14	3
2730	155	15	5
2731	155	16	6
2732	155	17	3
2733	155	18	4
2770	158	1	5
2771	158	2	3
2772	158	3	5
2773	158	4	5
2774	158	5	7
2775	158	6	5
2776	158	7	3
2777	158	8	5
2778	158	9	2
2779	158	10	4
2780	158	11	3
2781	158	12	4
2782	158	13	6
2783	158	14	7
2784	158	15	5
2785	158	16	5
2786	158	17	5
2787	158	18	5
2812	160	7	6
2813	160	8	9
2814	160	9	6
2815	160	10	5
2816	160	11	3
2817	160	12	5
2818	160	13	4
2819	160	14	5
2820	160	15	6
2821	160	16	6
2822	160	17	6
2823	160	18	6
2842	162	1	6
2843	162	2	5
2844	162	3	6
2845	162	4	4
2846	162	5	7
2847	162	6	5
2848	162	7	3
2849	162	8	6
2850	162	9	4
2851	162	10	6
2852	162	11	3
2853	162	12	4
2854	162	13	6
2855	162	14	4
2856	162	15	6
2857	162	16	5
2858	162	17	6
2859	162	18	5
2878	163	1	5
2879	163	2	4
2880	163	3	6
2881	163	4	5
2882	163	5	6
2883	163	6	5
2884	163	7	4
2897	165	2	3
2898	165	3	5
2899	165	4	6
2900	165	5	6
2901	165	6	7
2902	165	7	5
2903	165	8	5
2904	165	9	4
2905	165	10	5
2906	165	11	4
2907	165	12	4
2908	165	13	5
2909	165	14	4
2910	165	15	5
2911	165	16	6
2912	165	17	5
2913	165	18	5
2914	166	1	6
2915	166	2	3
2916	166	3	6
2917	166	4	5
2918	166	5	7
2919	166	6	6
2920	166	7	5
2921	166	8	6
2922	166	9	4
2923	166	10	5
2924	166	11	4
2925	166	12	4
2926	166	13	6
2927	166	14	5
2928	166	15	5
2929	166	16	6
2930	166	17	5
2931	166	18	6
2932	167	1	5
2933	167	2	4
2934	167	3	6
2935	167	4	5
2936	167	5	5
2937	167	6	6
2938	167	7	5
2939	167	8	5
2940	167	9	4
2941	167	10	6
2942	167	11	4
2943	167	12	4
2944	167	13	4
2945	167	14	5
2946	167	15	5
2947	167	16	6
2948	167	17	6
2949	167	18	4
2950	168	1	6
2951	168	2	3
2952	168	3	5
2953	168	4	4
2954	168	5	8
2955	168	6	6
2956	168	7	5
2957	168	8	5
2958	168	9	4
2959	168	10	4
2960	168	11	4
2961	168	12	6
2962	168	13	6
2963	168	14	5
2964	168	15	6
2965	168	16	10
2966	168	17	5
2967	168	18	6
2968	169	1	8
2969	169	2	4
2970	169	3	5
2971	169	4	4
2972	169	5	6
2973	169	6	4
2974	169	7	5
2975	169	8	4
2976	169	9	4
2977	169	10	6
2978	169	11	5
2979	169	12	5
2980	169	13	6
2981	169	14	5
2982	169	15	5
2983	169	16	9
2984	169	17	6
2985	169	18	6
2986	170	1	6
2987	170	2	4
2988	170	3	7
2989	170	4	7
2990	170	5	6
2991	170	6	8
2992	170	7	5
2993	170	8	8
2994	170	9	5
2995	170	10	7
2996	170	11	5
2997	170	12	6
2998	170	13	6
2999	170	14	6
3000	170	15	5
3001	170	16	10
3002	170	17	5
3003	170	18	7
3004	171	19	5
3005	171	20	4
3006	171	21	4
3007	171	22	5
3008	171	23	4
3009	171	24	6
3010	171	25	4
3011	171	26	5
3012	171	27	5
3013	171	28	7
3014	171	29	5
3015	171	30	5
3016	171	31	7
3017	171	32	4
3018	171	33	5
3019	171	34	4
3020	171	35	5
3021	171	36	5
3023	172	20	6
3024	172	21	6
3025	172	22	5
3026	172	23	7
3027	172	24	6
3028	172	25	5
3029	172	26	6
3030	172	27	7
3031	172	28	7
3032	172	29	5
3033	172	30	6
3034	172	31	7
3035	172	32	5
3036	172	33	5
3037	172	34	3
3038	172	35	5
3039	172	36	6
3040	173	19	5
3041	173	20	4
3042	173	21	5
3043	173	22	5
3044	173	23	7
3045	173	24	7
3046	173	25	4
3047	173	26	0
3048	173	27	0
3049	173	28	6
3050	173	29	6
3051	173	30	5
3052	173	31	8
3053	173	32	4
3054	173	33	4
3055	173	34	3
3056	173	35	5
3057	173	36	6
3058	174	19	6
3059	174	20	5
3060	174	21	4
3061	174	22	4
3062	174	23	6
3063	174	24	4
3064	174	25	4
3065	174	26	6
3066	174	27	6
3067	174	28	6
3068	174	29	5
3069	174	30	5
3070	174	31	6
3071	174	32	3
3072	174	33	4
3073	174	34	0
3074	174	35	0
3075	174	36	0
3077	175	20	5
3078	175	21	5
3079	175	22	4
3080	175	23	7
3081	175	24	6
3082	175	25	5
3083	175	26	5
3084	175	27	7
3085	175	28	7
3086	175	29	5
3087	175	30	5
3088	175	31	6
3089	175	32	4
3090	175	33	0
3091	175	34	4
3092	175	35	5
3093	175	36	5
3094	176	19	5
3095	176	20	7
3096	176	21	5
3097	176	22	0
3098	176	23	6
3099	176	24	5
3100	176	25	2
3101	176	26	5
3102	176	27	7
3103	176	28	5
3104	176	29	7
3105	176	30	5
3106	176	31	8
3107	176	32	4
3108	176	33	5
3109	176	34	0
3110	176	35	0
3111	176	36	0
3184	182	19	6
3185	182	20	4
3186	182	21	5
3187	182	22	3
3188	182	23	8
3189	182	24	5
3190	182	25	4
3191	182	26	6
3192	182	27	7
3193	182	28	5
3194	182	29	5
3195	182	30	5
3196	182	31	7
3197	182	32	3
3198	182	33	4
3199	182	34	3
3200	182	35	5
3201	182	36	4
3166	180	19	6
3167	180	20	6
3168	180	21	6
3169	180	22	4
3170	180	23	7
3171	180	24	5
3172	180	25	4
3173	180	26	6
3174	180	27	7
3175	180	28	7
3176	180	29	5
3177	180	30	5
3178	180	31	7
3179	180	32	4
3180	180	33	5
3181	180	34	4
3182	180	35	6
3183	180	36	6
3202	183	19	6
3203	183	20	6
3204	183	21	5
3205	183	22	4
3206	183	23	6
3207	183	24	4
3208	183	25	4
3209	183	26	5
3210	183	27	6
3211	183	28	6
3212	183	29	6
3213	183	30	5
3214	183	31	6
3215	183	32	4
3216	183	33	5
3217	183	34	3
3218	183	35	6
3219	183	36	4
3221	184	20	6
3235	184	34	3
3236	184	35	5
3237	184	36	0
3238	185	19	6
3239	185	20	0
3240	185	21	5
3241	185	22	4
3242	185	23	7
3243	185	24	6
3244	185	25	4
3220	184	19	6
3222	184	21	4
3223	184	22	4
3224	184	23	6
3225	184	24	4
3226	184	25	3
3227	184	26	5
3228	184	27	5
3229	184	28	6
3230	184	29	7
3231	184	30	4
3232	184	31	7
3233	184	32	3
3234	184	33	4
3245	185	26	0
3246	185	27	7
3247	185	28	7
3248	185	29	5
3249	185	30	5
3250	185	31	6
3251	185	32	4
3252	185	33	5
3253	185	34	4
3254	185	35	5
3255	185	36	0
3256	186	19	4
3257	186	20	5
3258	186	21	5
3259	186	22	4
3260	186	23	6
3261	186	24	4
3262	186	25	3
3263	186	26	5
3264	186	27	6
3265	186	28	7
3266	186	29	5
3267	186	30	6
3268	186	31	7
3269	186	32	4
3270	186	33	5
3271	186	34	4
3272	186	35	6
3273	186	36	5
3274	187	19	4
3275	187	20	4
3276	187	21	4
3277	187	22	4
3278	187	23	7
3279	187	24	5
3280	187	25	4
3281	187	26	5
3282	187	27	5
3283	187	28	5
3284	187	29	4
3285	187	30	5
3286	187	31	7
3287	187	32	4
3288	187	33	5
3289	187	34	4
3290	187	35	5
3291	187	36	6
3418	195	19	5
3350	191	23	7
3419	195	20	6
3351	191	24	7
3420	195	21	6
3352	191	25	3
3421	195	22	5
3353	191	26	7
3422	195	23	6
3354	191	27	9
3423	195	24	5
3355	191	28	7
3424	195	25	4
3356	191	29	5
3425	195	26	0
3357	191	30	5
3426	195	27	6
3358	191	31	8
3310	189	19	6
3311	189	20	5
3312	189	21	6
3313	189	22	4
3314	189	23	7
3315	189	24	6
3316	189	25	4
3317	189	26	0
3318	189	27	0
3319	189	28	8
3320	189	29	6
3321	189	30	5
3322	189	31	7
3323	189	32	4
3324	189	33	6
3325	189	34	4
3326	189	35	6
3327	189	36	5
3328	190	19	6
3329	190	20	6
3330	190	21	5
3331	190	22	4
3332	190	23	0
3333	190	24	4
3334	190	25	4
3335	190	26	0
3336	190	27	7
3337	190	28	7
3338	190	29	6
3339	190	30	6
3340	190	31	6
3341	190	32	4
3342	190	33	5
3343	190	34	0
3344	190	35	0
3345	190	36	0
3346	191	19	4
3347	191	20	6
3348	191	21	7
3349	191	22	4
3359	191	32	4
3360	191	33	5
3361	191	34	0
3362	191	35	0
3363	191	36	0
3364	192	19	4
3365	192	20	5
3366	192	21	6
3367	192	22	3
3368	192	23	6
3369	192	24	5
3370	192	25	5
3371	192	26	6
3372	192	27	7
3373	192	28	7
3374	192	29	4
3375	192	30	5
3376	192	31	8
3377	192	32	3
3378	192	33	5
3379	192	34	3
3380	192	35	5
3381	192	36	5
3382	193	19	4
3383	193	20	5
3384	193	21	5
3385	193	22	3
3386	193	23	0
3387	193	24	5
3388	193	25	4
3389	193	26	4
3390	193	27	5
3391	193	28	5
3392	193	29	5
3393	193	30	5
3394	193	31	5
3395	193	32	3
3396	193	33	5
3397	193	34	3
3398	193	35	6
3427	195	28	7
3399	193	36	4
3400	194	19	4
3401	194	20	5
3402	194	21	6
3403	194	22	4
3404	194	23	8
3405	194	24	5
3406	194	25	4
3407	194	26	0
3408	194	27	5
3409	194	28	7
3410	194	29	5
3411	194	30	6
3412	194	31	0
3413	194	32	4
3414	194	33	4
3415	194	34	4
3416	194	35	4
3417	194	36	0
3428	195	29	5
3429	195	30	0
3430	195	31	7
3431	195	32	3
3432	195	33	5
3433	195	34	3
3434	195	35	5
3435	195	36	6
3436	196	19	5
3437	196	20	5
3438	196	21	6
3439	196	22	5
3440	196	23	6
3441	196	24	4
3442	196	25	4
3443	196	26	6
3444	196	27	6
3445	196	28	7
3446	196	29	5
3447	196	30	6
3448	196	31	6
3449	196	32	3
3450	196	33	5
3451	196	34	3
3452	196	35	6
3453	196	36	0
3454	197	19	5
3455	197	20	8
3456	197	21	5
3457	197	22	4
3458	197	23	6
3459	197	24	5
3460	197	25	4
3461	197	26	6
3462	197	27	6
3463	197	28	6
3464	197	29	5
3465	197	30	5
3466	197	31	8
3467	197	32	4
3468	197	33	5
3469	197	34	4
3470	197	35	5
3471	197	36	6
3626	206	29	5
3627	206	30	5
3490	199	19	6
3491	199	20	5
3492	199	21	5
3493	199	22	4
3494	199	23	7
3495	199	24	5
3496	199	25	4
3497	199	26	6
3498	199	27	6
3499	199	28	7
3500	199	29	6
3501	199	30	6
3502	199	31	7
3503	199	32	4
3504	199	33	5
3505	199	34	3
3506	199	35	5
3507	199	36	5
3508	200	19	5
3509	200	20	5
3510	200	21	4
3511	200	22	5
3512	200	23	7
3513	200	24	5
3514	200	25	3
3515	200	26	0
3516	200	27	8
3517	200	28	7
3518	200	29	6
3519	200	30	5
3520	200	31	7
3521	200	32	3
3522	200	33	4
3523	200	34	3
3524	200	35	7
3525	200	36	5
3628	206	31	6
3629	206	32	4
3630	206	33	5
3631	206	34	3
3632	206	35	5
3580	204	19	5
3581	204	20	5
3582	204	21	6
3583	204	22	5
3584	204	23	7
3585	204	24	5
3586	204	25	4
3587	204	26	9
3633	206	36	5
3634	207	19	5
3588	204	27	6
3589	204	28	9
3590	204	29	5
3591	204	30	5
3592	204	31	6
3593	204	32	4
3594	204	33	5
3595	204	34	4
3596	204	35	5
3597	204	36	5
3598	205	19	4
3599	205	20	4
3600	205	21	5
3601	205	22	4
3602	205	23	7
3603	205	24	4
3604	205	25	3
3605	205	26	5
3606	205	27	5
3607	205	28	6
3608	205	29	4
3609	205	30	5
3610	205	31	4
3611	205	32	3
3612	205	33	5
3613	205	34	4
3614	205	35	4
3615	205	36	4
3616	206	19	5
3617	206	20	5
3618	206	21	5
3619	206	22	5
3620	206	23	7
3621	206	24	6
3622	206	25	4
3623	206	26	6
3624	206	27	0
3625	206	28	6
3635	207	20	5
3636	207	21	5
3637	207	22	3
3638	207	23	8
3639	207	24	5
3640	207	25	4
3641	207	26	6
3642	207	27	6
3643	207	28	6
3644	207	29	5
3645	207	30	4
3646	207	31	6
3647	207	32	3
3648	207	33	5
3649	207	34	3
3650	207	35	5
3651	207	36	4
3652	208	19	4
3653	208	20	4
3654	208	21	6
3655	208	22	3
3656	208	23	8
3657	208	24	4
3658	208	25	3
3659	208	26	6
3660	208	27	7
3661	208	28	7
3662	208	29	5
3663	208	30	6
3664	208	31	5
3665	208	32	4
3666	208	33	4
3667	208	34	4
3668	208	35	5
3669	208	36	4
3670	209	19	4
3671	209	20	4
3672	209	21	6
3673	209	22	3
3674	209	23	7
3675	209	24	5
3676	209	25	4
3677	209	26	6
3678	209	27	6
3679	209	28	8
3680	209	29	6
3681	209	30	4
3682	209	31	6
3683	209	32	4
3684	209	33	5
3685	209	34	4
3686	209	35	5
3687	209	36	5
3742	213	19	6
3743	213	20	0
3744	213	21	6
3745	213	22	4
3746	213	23	0
3747	213	24	4
3748	213	25	4
3749	213	26	6
3750	213	27	5
3706	211	19	5
3707	211	20	6
3708	211	21	5
3709	211	22	4
3710	211	23	8
3711	211	24	6
3712	211	25	4
3713	211	26	0
3714	211	27	6
3715	211	28	7
3716	211	29	5
3717	211	30	4
3718	211	31	5
3719	211	32	4
3720	211	33	4
3721	211	34	6
3722	211	35	6
3723	211	36	0
3724	212	19	5
3725	212	20	5
3726	212	21	5
3727	212	22	3
3728	212	23	8
3729	212	24	5
3730	212	25	4
3731	212	26	6
3732	212	27	6
3733	212	28	6
3734	212	29	5
3735	212	30	4
3736	212	31	6
3737	212	32	3
3738	212	33	5
3739	212	34	3
3740	212	35	5
3741	212	36	4
3751	213	28	7
3752	213	29	0
3753	213	30	4
3754	213	31	6
3755	213	32	5
3756	213	33	4
3757	213	34	4
3758	213	35	5
3759	213	36	5
3796	216	19	5
3797	216	20	0
3798	216	21	4
3799	216	22	4
3800	216	23	6
3801	216	24	4
3802	216	25	4
3803	216	26	6
3804	216	27	6
3805	216	28	6
3806	216	29	6
3807	216	30	4
3808	216	31	6
3809	216	32	4
3810	216	33	4
3811	216	34	4
3812	216	35	4
3813	216	36	5
3814	217	19	4
3815	217	20	5
3816	217	21	6
3817	217	22	4
3818	217	23	6
3819	217	24	5
3820	217	25	5
3821	217	26	5
3822	217	27	6
3823	217	28	7
3824	217	29	5
3825	217	30	6
3826	217	31	7
3827	217	32	4
3828	217	33	5
3829	217	34	5
3830	217	35	5
3831	217	36	5
3832	218	19	5
3833	218	20	5
3834	218	21	5
3835	218	22	4
3836	218	23	7
3837	218	24	5
3838	218	25	4
3839	218	26	6
3840	218	27	7
3841	218	28	7
3842	218	29	5
3843	218	30	5
3844	218	31	7
3845	218	32	4
3846	218	33	5
3847	218	34	3
3848	218	35	6
3849	218	36	6
3850	219	19	5
3851	219	20	6
3852	219	21	5
3853	219	22	5
3854	219	23	8
3855	219	24	4
3856	219	25	4
3857	219	26	6
3858	219	27	6
3859	219	28	5
3860	219	29	5
3861	219	30	6
3862	219	31	6
3863	219	32	4
3864	219	33	5
3865	219	34	4
3866	219	35	5
3867	219	36	5
3868	220	19	6
3869	220	20	6
3870	220	21	5
3871	220	22	4
3872	220	23	6
3873	220	24	5
3874	220	25	4
3875	220	26	6
3876	220	27	6
3877	220	28	7
3878	220	29	5
3879	220	30	5
3880	220	31	6
3881	220	32	4
3882	220	33	5
3883	220	34	4
3884	220	35	5
3885	220	36	5
3886	222	19	5
3887	222	20	5
3888	222	21	6
3889	222	22	4
3890	222	23	7
3891	222	24	5
3892	222	25	3
3893	222	26	6
3894	222	27	7
3895	222	28	7
3896	222	29	5
3897	222	30	6
3898	222	31	6
3899	222	32	4
3900	222	33	5
3901	222	34	4
3902	222	35	6
3903	222	36	5
3904	223	19	6
3905	223	20	6
3906	223	21	5
3907	223	22	4
3908	223	23	6
3909	223	24	5
3910	223	25	4
3911	223	26	6
3912	223	27	6
3913	223	28	7
3914	223	29	5
3915	223	30	5
3916	223	31	6
3917	223	32	4
3918	223	33	6
3919	223	34	4
3920	223	35	5
3921	223	36	5
3922	224	19	4
3923	224	20	5
3924	224	21	5
3925	224	22	4
3926	224	23	5
3927	224	24	4
3928	224	25	4
3929	224	26	0
3930	224	27	0
3931	224	28	7
3932	224	29	5
3933	224	30	5
3934	224	31	5
3935	224	32	2
3936	224	33	5
3937	224	34	3
3938	224	35	5
3939	224	36	4
3940	225	19	5
3941	225	20	6
3942	225	21	5
3943	225	22	6
3944	225	23	7
3945	225	24	7
3946	225	25	4
3947	225	26	7
3948	225	27	8
3949	225	28	8
3950	225	29	5
3951	225	30	7
3952	225	31	9
3953	225	32	4
3954	225	33	6
3955	225	34	0
3956	225	35	0
3957	225	36	0
3958	226	19	5
3959	226	20	6
3960	226	21	0
3961	226	22	5
3962	226	23	9
3963	226	24	6
3964	226	25	4
3965	226	26	7
3966	226	27	8
3967	226	28	9
3968	226	29	5
3969	226	30	8
3970	226	31	9
3971	226	32	4
3972	226	33	6
3973	226	34	0
3974	226	35	0
3975	226	36	0
3976	227	19	5
3977	227	20	4
3978	227	21	4
3979	227	22	4
3980	227	23	6
3981	227	24	6
3982	227	25	4
3983	227	26	5
3984	227	27	5
3985	227	28	6
3986	227	29	4
3987	227	30	4
3988	227	31	0
3989	227	32	3
3990	227	33	3
3991	227	34	4
3992	227	35	5
3993	227	36	5
3994	228	19	4
3995	228	20	6
3996	228	21	5
3997	228	22	2
3998	228	23	6
3999	228	24	4
4000	228	25	2
4001	228	26	6
4002	228	27	5
4003	228	28	5
4004	228	29	6
4005	228	30	5
4006	228	31	5
4007	228	32	5
4008	228	33	4
4009	228	34	4
4010	228	35	5
4011	228	36	4
4012	229	19	6
4013	229	20	6
4014	229	21	5
4015	229	22	3
4016	229	23	5
4017	229	24	5
4018	229	25	4
4019	229	26	5
4020	229	27	0
4021	229	28	7
4022	229	29	5
4023	229	30	5
4024	229	31	0
4025	229	32	4
4026	229	33	4
4027	229	34	4
4028	229	35	5
4029	229	36	0
4030	230	19	7
4031	230	20	4
4032	230	21	4
4033	230	22	4
4034	230	23	7
4035	230	24	5
4036	230	25	3
4037	230	26	0
4038	230	27	7
4039	230	28	5
4040	230	29	5
4041	230	30	4
4042	230	31	6
4043	230	32	3
4044	230	33	4
4045	230	34	3
4046	230	35	0
4047	230	36	5
4048	231	19	7
4049	231	20	6
4050	231	21	0
4051	231	22	5
4052	231	23	8
4053	231	24	4
4054	231	25	3
4055	231	26	0
4056	231	27	6
4057	231	28	6
4058	231	29	5
4059	231	30	5
4060	231	31	6
4061	231	32	3
4062	231	33	4
4063	231	34	0
4064	231	35	0
4065	231	36	0
4084	233	19	4
4085	233	20	5
4086	233	21	4
4087	233	22	4
4088	233	23	4
4089	233	24	5
4090	233	25	3
4091	233	26	4
4092	233	27	5
4093	233	28	6
4094	233	29	4
4095	233	30	5
4096	233	31	5
4097	233	32	4
4098	233	33	4
4099	233	34	4
4100	233	35	6
4101	233	36	4
4102	234	19	6
4103	234	20	7
4104	234	21	5
4105	234	22	4
4106	234	23	5
4107	234	24	4
4108	234	25	4
4109	234	26	6
4110	234	27	5
4111	234	28	6
4112	234	29	5
4113	234	30	4
4114	234	31	5
4115	234	32	3
4116	234	33	6
4117	234	34	3
4118	234	35	6
4119	234	36	6
4120	235	19	6
4121	235	20	7
4122	235	21	6
4123	235	22	4
4124	235	23	6
4125	235	24	6
4126	235	25	4
4127	235	26	6
4128	235	27	6
4129	235	28	6
4130	235	29	5
4131	235	30	6
4132	235	31	7
4133	235	32	5
4134	235	33	5
4135	235	34	4
4136	235	35	5
4137	235	36	5
4138	236	19	5
4139	236	20	5
4140	236	21	4
4141	236	22	4
4142	236	23	7
4143	236	24	0
4144	236	25	6
4145	236	26	6
4146	236	27	7
4147	236	28	7
4148	236	29	5
4149	236	30	4
4150	236	31	6
4151	236	32	4
4152	236	33	7
4153	236	34	4
4154	236	35	5
4155	236	36	5
4156	237	19	4
4157	237	20	6
4158	237	21	5
4159	237	22	6
4160	237	23	6
4161	237	24	4
4162	237	25	5
4163	237	26	7
4164	237	27	6
4165	237	28	5
4166	237	29	7
4167	237	30	7
4168	237	31	9
4169	237	32	3
4170	237	33	5
4171	237	34	3
4172	237	35	5
4173	237	36	5
4174	238	19	6
4175	238	20	5
4176	238	21	4
4177	238	22	4
4178	238	23	4
4179	238	24	5
4180	238	25	7
4181	238	26	5
4182	238	27	7
4183	238	28	7
4184	238	29	6
4185	238	30	5
4186	238	31	6
4187	238	32	3
4188	238	33	6
4189	238	34	4
4190	238	35	5
4191	238	36	5
4192	239	19	4
4193	239	20	6
4194	239	21	6
4195	239	22	3
4196	239	23	6
4197	239	24	4
4198	239	25	4
4199	239	26	0
4200	239	27	0
4201	239	28	8
4202	239	29	5
4203	239	30	5
4204	239	31	7
4205	239	32	4
4206	239	33	5
4207	239	34	4
4208	239	35	5
4209	239	36	4
4210	240	19	4
4211	240	20	5
4212	240	21	6
4213	240	22	4
4214	240	23	7
4215	240	24	6
4216	240	25	4
4217	240	26	0
4218	240	27	0
4219	240	28	8
4220	240	29	5
4221	240	30	5
4222	240	31	7
4223	240	32	4
4224	240	33	5
4225	240	34	4
4226	240	35	5
4227	240	36	4
4228	241	19	6
4229	241	20	6
4230	241	21	7
4231	241	22	5
4232	241	23	8
4233	241	24	6
4234	241	25	4
4235	241	26	6
4236	241	27	6
4237	241	28	8
4238	241	29	6
4239	241	30	6
4240	241	31	6
4241	241	32	3
4242	241	33	4
4243	241	34	3
4244	241	35	6
4245	241	36	5
4246	242	19	6
4247	242	20	6
4248	242	21	6
4249	242	22	4
4250	242	23	7
4251	242	24	5
4252	242	25	3
4253	242	26	6
4254	242	27	7
4255	242	28	7
4256	242	29	6
4257	242	30	5
4258	242	31	7
4259	242	32	4
4260	242	33	5
4261	242	34	5
4262	242	35	6
4263	242	36	4
4264	243	19	5
4265	243	20	5
4266	243	21	6
4267	243	22	0
4268	243	23	5
4269	243	24	4
4270	243	25	4
4271	243	26	6
4272	243	27	7
4273	243	28	5
4274	243	29	6
4275	243	30	6
4276	243	31	6
4277	243	32	4
4278	243	33	5
4279	243	34	4
4280	243	35	4
4281	243	36	4
4282	244	19	7
4283	244	20	6
4284	244	21	7
4285	244	22	4
4286	244	23	6
4287	244	24	5
4288	244	25	4
4289	244	26	7
4290	244	27	6
4291	244	28	7
4292	244	29	5
4293	244	30	6
4294	244	31	7
4295	244	32	4
4296	244	33	5
4297	244	34	5
4298	244	35	5
4299	244	36	6
4300	245	19	5
4301	245	20	5
4302	245	21	5
4303	245	22	4
4304	245	23	5
4305	245	24	5
4306	245	25	4
4307	245	26	5
4308	245	27	6
4309	245	28	5
4310	245	29	4
4311	245	30	7
4312	245	31	5
4313	245	32	5
4314	245	33	0
4315	245	34	4
4316	245	35	5
4317	245	36	6
4318	246	19	4
4319	246	20	6
4320	246	21	5
4321	246	22	4
4322	246	23	0
4323	246	24	6
4324	246	25	3
4325	246	26	7
4326	246	27	5
4327	246	28	0
4328	246	29	4
4329	246	30	5
4330	246	31	5
4331	246	32	3
4332	246	33	5
4333	246	34	4
4334	246	35	0
4335	246	36	5
4336	247	19	4
4337	247	20	5
4338	247	21	5
4339	247	22	5
4340	247	23	5
4341	247	24	5
4342	247	25	4
4343	247	26	5
4344	247	27	5
4345	247	28	6
4346	247	29	4
4347	247	30	4
4348	247	31	6
4349	247	32	3
4350	247	33	6
4351	247	34	2
4352	247	35	4
4353	247	36	5
4354	248	19	4
4355	248	20	5
4356	248	21	5
4357	248	22	0
4358	248	23	8
4359	248	24	4
4360	248	25	3
4361	248	26	6
4362	248	27	7
4363	248	28	7
4364	248	29	0
4365	248	30	5
4366	248	31	0
4367	248	32	4
4368	248	33	7
4369	248	34	4
4370	248	35	4
4371	248	36	5
4372	249	19	4
4373	249	20	5
4374	249	21	5
4375	249	22	4
4376	249	23	3
4377	249	24	5
4378	249	25	3
4379	249	26	3
4380	249	27	5
4381	249	28	6
4382	249	29	6
4383	249	30	5
4384	249	31	5
4385	249	32	3
4386	249	33	3
4387	249	34	4
4388	249	35	5
4389	249	36	4
4390	250	19	4
4391	250	20	6
4392	250	21	4
4393	250	22	4
4394	250	23	5
4395	250	24	3
4396	250	25	4
4397	250	26	6
4398	250	27	5
4399	250	28	5
4400	250	29	5
4401	250	30	4
4402	250	31	4
4403	250	32	3
4404	250	33	3
4405	250	34	4
4406	250	35	4
4407	250	36	4
4426	252	19	6
4427	252	20	4
4428	252	21	7
4429	252	22	4
4430	252	23	7
4431	252	24	4
4432	252	25	4
4433	252	26	7
4434	252	27	6
4435	252	28	7
4436	252	29	5
4437	252	30	5
4438	252	31	7
4439	252	32	5
4440	252	33	0
4441	252	34	3
4442	252	35	5
4443	252	36	5
4444	253	19	7
4445	253	20	6
4446	253	21	6
4447	253	22	3
4448	253	23	6
4449	253	24	7
4450	253	25	4
4451	253	26	0
4452	253	27	5
4453	253	28	6
4454	253	29	5
4455	253	30	5
4456	253	31	5
4457	253	32	4
4458	253	33	6
4459	253	34	5
4460	253	35	5
4461	253	36	5
4462	254	19	4
4463	254	20	6
4464	254	21	5
4465	254	22	6
4466	254	23	0
4467	254	24	4
4468	254	25	4
4469	254	26	7
4470	254	27	8
4471	254	28	5
4472	254	29	5
4473	254	30	4
4474	254	31	8
4475	254	32	4
4476	254	33	4
4477	254	34	4
4478	254	35	4
4479	254	36	5
4480	255	19	6
4481	255	20	6
4482	255	21	3
4483	255	22	4
4484	255	23	6
4485	255	24	6
4486	255	25	4
4487	255	26	5
4488	255	27	6
4489	255	28	5
4490	255	29	4
4491	255	30	5
4492	255	31	5
4493	255	32	4
4494	255	33	4
4495	255	34	4
4496	255	35	4
4497	255	36	5
4498	256	19	4
4499	256	20	3
4500	256	21	6
4501	256	22	4
4502	256	23	6
4503	256	24	5
4504	256	25	5
4505	256	26	5
4506	256	27	6
4507	256	28	6
4508	256	29	4
4509	256	30	5
4510	256	31	6
4511	256	32	4
4512	256	33	4
4513	256	34	4
4514	256	35	5
4515	256	36	5
4516	257	19	6
4517	257	20	7
4518	257	21	6
4519	257	22	4
4520	257	23	7
4521	257	24	6
4522	257	25	4
4523	257	26	5
4524	257	27	7
4525	257	28	6
4526	257	29	5
4527	257	30	6
4528	257	31	7
4529	257	32	5
4530	257	33	4
4531	257	34	4
4532	257	35	5
4533	257	36	5
4534	258	19	4
4535	258	20	5
4536	258	21	4
4537	258	22	4
4538	258	23	7
4539	258	24	6
4540	258	25	4
4541	258	26	5
4542	258	27	6
4543	258	28	6
4544	258	29	5
4545	258	30	4
4546	258	31	6
4547	258	32	3
4548	258	33	5
4549	258	34	4
4550	258	35	5
4551	258	36	5
4552	259	19	5
4553	259	20	6
4554	259	21	6
4555	259	22	3
4556	259	23	7
4557	259	24	5
4558	259	25	5
4559	259	26	6
4560	259	27	6
4561	259	28	7
4562	259	29	5
4563	259	30	5
4564	259	31	6
4565	259	32	5
4566	259	33	5
4567	259	34	4
4568	259	35	6
4569	259	36	6
4570	260	19	6
4571	260	20	6
4572	260	21	7
4573	260	22	4
4574	260	23	6
4575	260	24	6
4576	260	25	5
4577	260	26	7
4578	260	27	7
4579	260	28	7
4580	260	29	5
4581	260	30	5
4582	260	31	7
4583	260	32	4
4584	260	33	5
4585	260	34	4
4586	260	35	6
4587	260	36	6
4588	261	19	7
4589	261	20	6
4590	261	21	6
4591	261	22	5
4592	261	23	6
4593	261	24	7
4594	261	25	4
4595	261	26	6
4596	261	27	8
4597	261	28	7
4598	261	29	6
4599	261	30	6
4600	261	31	7
4601	261	32	6
4602	261	33	6
4603	261	34	4
4604	261	35	6
4605	261	36	6
4606	262	19	0
4607	262	20	0
4608	262	21	7
4609	262	22	3
4610	262	23	5
4611	262	24	5
4612	262	25	4
4613	262	26	6
4614	262	27	0
4615	262	28	6
4616	262	29	5
4617	262	30	4
4618	262	31	0
4619	262	32	3
4620	262	33	6
4621	262	34	3
4622	262	35	6
4623	262	36	5
4624	263	19	5
4625	263	20	6
4626	263	21	5
4627	263	22	4
4628	263	23	7
4629	263	24	0
4630	263	25	5
4631	263	26	4
4632	263	27	7
4633	263	28	5
4634	263	29	4
4635	263	30	5
4636	263	31	5
4637	263	32	3
4638	263	33	4
4639	263	34	3
4640	263	35	4
4641	263	36	4
4642	264	19	4
4643	264	20	6
4644	264	21	5
4645	264	22	4
4646	264	23	0
4647	264	24	4
4648	264	25	5
4649	264	26	5
4650	264	27	6
4651	264	28	7
4652	264	29	4
4653	264	30	7
4654	264	31	6
4655	264	32	3
4656	264	33	5
4657	264	34	5
4658	264	35	0
4659	264	36	0
4660	265	19	5
4661	265	20	5
4662	265	21	6
4663	265	22	5
4664	265	23	5
4665	265	24	5
4666	265	25	5
4667	265	26	0
4668	265	27	7
4669	265	28	6
4670	265	29	5
4671	265	30	4
4672	265	31	7
4673	265	32	4
4674	265	33	4
4675	265	34	3
4676	265	35	0
4677	265	36	0
4678	266	19	6
4679	266	20	4
4680	266	21	4
4681	266	22	4
4682	266	23	6
4683	266	24	4
4684	266	25	4
4685	266	26	6
4686	266	27	5
4687	266	28	5
4688	266	29	4
4689	266	30	5
4690	266	31	7
4691	266	32	4
4692	266	33	4
4693	266	34	2
4694	266	35	0
4695	266	36	0
4696	267	19	4
4697	267	20	0
4698	267	21	6
4699	267	22	4
4700	267	23	7
4701	267	24	4
4702	267	25	4
4703	267	26	5
4704	267	27	6
4705	267	28	6
4706	267	29	5
4707	267	30	5
4708	267	31	5
4709	267	32	0
4710	267	33	4
4711	267	34	4
4712	267	35	5
4713	267	36	5
4714	268	19	4
4715	268	20	4
4716	268	21	5
4717	268	22	3
4718	268	23	6
4719	268	24	4
4720	268	25	4
4721	268	26	7
4722	268	27	6
4723	268	28	7
4724	268	29	7
4725	268	30	5
4726	268	31	6
4727	268	32	4
4728	268	33	6
4729	268	34	3
4730	268	35	4
4731	268	36	5
4732	269	19	6
4733	269	20	5
4734	269	21	5
4735	269	22	4
4736	269	23	6
4737	269	24	5
4738	269	25	4
4739	269	26	0
4740	269	27	5
4741	269	28	6
4742	269	29	6
4743	269	30	4
4744	269	31	0
4745	269	32	7
4746	269	33	5
4747	269	34	4
4748	269	35	4
4749	269	36	5
4750	270	19	4
4751	270	20	4
4752	270	21	5
4753	270	22	4
4754	270	23	7
4755	270	24	6
4756	270	25	5
4757	270	26	6
4758	270	27	7
4759	270	28	6
4760	270	29	4
4761	270	30	4
4762	270	31	5
4763	270	32	4
4764	270	33	4
4765	270	34	3
4766	270	35	6
4767	270	36	6
4768	271	19	5
4769	271	20	7
4770	271	21	5
4771	271	22	4
4772	271	23	6
4773	271	24	5
4774	271	25	4
4775	271	26	6
4776	271	27	6
4777	271	28	6
4778	271	29	5
4779	271	30	5
4780	271	31	6
4781	271	32	4
4782	271	33	5
4783	271	34	4
4784	271	35	5
4785	271	36	5
4786	272	19	4
4787	272	20	5
4788	272	21	5
4789	272	22	3
4790	272	23	6
4791	272	24	5
4792	272	25	4
4793	272	26	4
4794	272	27	5
4795	272	28	6
4796	272	29	5
4797	272	30	4
4798	272	31	5
4799	272	32	7
4800	272	33	5
4801	272	34	0
4802	272	35	0
4803	272	36	0
4834	274	31	6
4835	274	32	4
4836	274	33	4
4837	274	34	3
4838	274	35	5
4839	274	36	5
4822	274	19	5
4823	274	20	5
4824	274	21	5
4825	274	22	4
4826	274	23	6
4827	274	24	5
4828	274	25	4
4829	274	26	5
4830	274	27	6
4831	274	28	6
4832	274	29	5
4833	274	30	5
4933	280	22	4
4934	280	23	4
4935	280	24	4
4936	280	25	3
4858	276	19	0
4859	276	20	6
4860	276	21	6
4861	276	22	6
4862	276	23	7
4863	276	24	4
4864	276	25	3
4865	276	26	8
4866	276	27	6
4867	276	28	7
4868	276	29	5
4869	276	30	0
4870	276	31	0
4871	276	32	5
4872	276	33	4
4873	276	34	6
4874	276	35	5
4875	276	36	0
4876	277	19	4
4877	277	20	4
4878	277	21	5
4879	277	22	4
4880	277	23	6
4881	277	24	4
4882	277	25	3
4883	277	26	5
4884	277	27	8
4885	277	28	6
4886	277	29	5
4887	277	30	4
4888	277	31	6
4889	277	32	3
4890	277	33	4
4891	277	34	4
4892	277	35	5
4893	277	36	5
4894	278	19	5
4895	278	20	6
4896	278	21	5
4897	278	22	4
4898	278	23	7
4899	278	24	5
4900	278	25	4
4901	278	26	6
4902	278	27	6
4903	278	28	6
4904	278	29	5
4905	278	30	5
4906	278	31	6
4907	278	32	4
4908	278	33	5
4909	278	34	4
4910	278	35	5
4911	278	36	5
4912	279	19	5
4913	279	20	5
4914	279	21	6
4915	279	22	5
4916	279	23	7
4917	279	24	5
4918	279	25	5
4919	279	26	7
4920	279	27	5
4921	279	28	6
4922	279	29	5
4923	279	30	5
4924	279	31	6
4925	279	32	3
4926	279	33	4
4927	279	34	5
4928	279	35	6
4929	279	36	6
4930	280	19	3
4931	280	20	6
4932	280	21	4
4937	280	26	6
4938	280	27	7
4939	280	28	5
4940	280	29	4
4941	280	30	4
4942	280	31	6
4943	280	32	4
4944	280	33	5
4945	280	34	4
4946	280	35	4
4947	280	36	4
4948	281	19	5
4949	281	20	5
4950	281	21	6
4951	281	22	4
4952	281	23	7
4953	281	24	6
4954	281	25	4
4955	281	26	6
4956	281	27	7
4957	281	28	7
4958	281	29	5
4959	281	30	5
4960	281	31	6
4961	281	32	3
4962	281	33	5
4963	281	34	3
4964	281	35	6
4965	281	36	5
4966	282	19	6
4967	282	20	6
4968	282	21	7
4969	282	22	4
4970	282	23	8
4971	282	24	3
4972	282	25	4
4973	282	26	7
4974	282	27	6
4975	282	28	6
4976	282	29	5
4977	282	30	5
4978	282	31	6
4979	282	32	5
4980	282	33	4
4981	282	34	5
4982	282	35	5
4983	282	36	5
4984	283	19	5
4985	283	20	5
4986	283	21	7
4987	283	22	4
4988	283	23	9
4989	283	24	4
4990	283	25	5
4991	283	26	7
4992	283	27	6
4993	283	28	7
4994	283	29	6
4995	283	30	4
4996	283	31	7
4997	283	32	3
4998	283	33	4
4999	283	34	4
5000	283	35	5
5001	283	36	5
5002	284	19	4
5003	284	20	5
5004	284	21	4
5005	284	22	4
5006	284	23	6
5007	284	24	5
5008	284	25	3
5009	284	26	6
5010	284	27	6
5011	284	28	6
5012	284	29	5
5013	284	30	6
5014	284	31	5
5015	284	32	3
5016	284	33	4
5017	284	34	4
5018	284	35	5
5019	284	36	5
5020	285	19	5
5021	285	20	5
5022	285	21	4
5023	285	22	4
5024	285	23	7
5025	285	24	5
5026	285	25	0
5027	285	26	6
5028	285	27	6
5029	285	28	7
5030	285	29	5
5031	285	30	6
5032	285	31	7
5033	285	32	4
5034	285	33	5
5035	285	34	4
5036	285	35	5
5037	285	36	5
5038	286	19	3
5039	286	20	4
5040	286	21	4
5041	286	22	4
5042	286	23	5
5043	286	24	4
5044	286	25	4
5045	286	26	6
5046	286	27	4
5047	286	28	5
5048	286	29	5
5049	286	30	4
5050	286	31	6
5051	286	32	4
5052	286	33	4
5053	286	34	3
5054	286	35	4
5055	286	36	4
5056	287	19	5
5057	287	20	4
5058	287	21	5
5059	287	22	4
5060	287	23	6
5061	287	24	5
5062	287	25	3
5063	287	26	5
5064	287	27	7
5065	287	28	6
5066	287	29	4
5067	287	30	5
5068	287	31	6
5069	287	32	3
5070	287	33	5
5071	287	34	4
5072	287	35	4
5073	287	36	5
5074	288	19	5
5075	288	20	5
5076	288	21	6
5077	288	22	4
5078	288	23	5
5079	288	24	3
5080	288	25	4
5081	288	26	0
5082	288	27	7
5083	288	28	7
5084	288	29	4
5085	288	30	5
5086	288	31	0
5087	288	32	4
5088	288	33	5
5089	288	34	4
5090	288	35	5
5091	288	36	5
5092	289	19	6
5093	289	20	6
5094	289	21	4
5095	289	22	5
5096	289	23	8
5097	289	24	8
5098	289	25	4
5099	289	26	0
5100	289	27	7
5101	289	28	6
5102	289	29	4
5103	289	30	5
5104	289	31	5
5105	289	32	4
5106	289	33	6
5107	289	34	4
5108	289	35	5
5109	289	36	6
5110	290	19	4
5111	290	20	5
5112	290	21	6
5113	290	22	4
5114	290	23	6
5115	290	24	4
5116	290	25	4
5117	290	26	6
5118	290	27	5
5119	290	28	6
5120	290	29	6
5121	290	30	5
5122	290	31	5
5123	290	32	3
5124	290	33	5
5125	290	34	5
5126	290	35	6
5127	290	36	4
5128	291	19	6
5129	291	20	5
5130	291	21	6
5131	291	22	4
5132	291	23	7
5133	291	24	5
5134	291	25	4
5135	291	26	7
5136	291	27	6
5137	291	28	6
5138	291	29	5
5139	291	30	6
5140	291	31	7
5141	291	32	4
5142	291	33	5
5143	291	34	4
5144	291	35	5
5145	291	36	5
5146	292	19	4
5147	292	20	7
5148	292	21	7
5149	292	22	4
5150	292	23	6
5151	292	24	0
5152	292	25	5
5153	292	26	6
5154	292	27	5
5155	292	28	8
5156	292	29	5
5157	292	30	0
5158	292	31	0
5159	292	32	4
5160	292	33	0
5161	292	34	5
5162	292	35	5
5163	292	36	6
5219	296	20	4
5220	296	21	5
5221	296	22	4
5222	296	23	7
5223	296	24	5
5224	296	25	4
5225	296	26	0
5226	296	27	6
5227	296	28	8
5228	296	29	6
5229	296	30	5
5230	296	31	6
5231	296	32	4
5232	296	33	5
5233	296	34	4
5234	296	35	5
5235	296	36	6
5262	298	27	5
5182	294	19	5
5183	294	20	5
5184	294	21	5
5185	294	22	4
5186	294	23	7
5187	294	24	4
5188	294	25	3
5189	294	26	6
5190	294	27	5
5191	294	28	6
5192	294	29	7
5193	294	30	6
5194	294	31	5
5195	294	32	4
5196	294	33	5
5197	294	34	4
5198	294	35	4
5199	294	36	5
5200	295	19	4
5201	295	20	5
5202	295	21	4
5203	295	22	4
5204	295	23	6
5205	295	24	5
5206	295	25	4
5207	295	26	5
5208	295	27	7
5209	295	28	7
5210	295	29	0
5211	295	30	0
5212	295	31	6
5213	295	32	4
5214	295	33	3
5215	295	34	4
5216	295	35	5
5217	295	36	4
5218	296	19	5
5263	298	28	7
5264	298	29	5
5265	298	30	5
5266	298	31	7
5267	298	32	4
5268	298	33	4
5269	298	34	4
5270	298	35	5
5236	297	19	7
5237	297	20	6
5238	297	21	5
5239	297	22	5
5240	297	23	3
5241	297	24	0
5242	297	25	3
5243	297	26	0
5244	297	27	6
5245	297	28	7
5246	297	29	6
5247	297	30	5
5248	297	31	0
5249	297	32	5
5250	297	33	5
5251	297	34	5
5252	297	35	7
5253	297	36	6
5254	298	19	4
5255	298	20	5
5256	298	21	6
5257	298	22	3
5258	298	23	6
5259	298	24	5
5260	298	25	4
5261	298	26	5
5271	298	36	5
5272	299	19	4
5273	299	20	7
5274	299	21	7
5275	299	22	4
5276	299	23	7
5277	299	24	6
5278	299	25	5
5279	299	26	0
5280	299	27	7
5281	299	28	8
5282	299	29	6
5283	299	30	6
5284	299	31	5
5285	299	32	4
5286	299	33	0
5287	299	34	4
5288	299	35	5
5289	299	36	6
5290	300	19	6
5291	300	20	6
5292	300	21	6
5293	300	22	5
5294	300	23	8
5295	300	24	5
5296	300	25	4
5297	300	26	6
5298	300	27	0
5299	300	28	6
5300	300	29	6
5301	300	30	6
5302	300	31	7
5303	300	32	4
5304	300	33	0
5305	300	34	4
5306	300	35	6
5307	300	36	6
5308	301	19	5
5309	301	20	4
5310	301	21	6
5311	301	22	0
5312	301	23	7
5313	301	24	5
5314	301	25	3
5315	301	26	6
5316	301	27	7
5317	301	28	7
5318	301	29	4
5319	301	30	5
5320	301	31	6
5321	301	32	3
5322	301	33	4
5323	301	34	4
5324	301	35	7
5325	301	36	4
5326	302	19	5
5327	302	20	5
5328	302	21	5
5329	302	22	4
5330	302	23	5
5331	302	24	6
5332	302	25	3
5333	302	26	0
5334	302	27	4
5335	302	28	6
5336	302	29	5
5337	302	30	0
5338	302	31	5
5339	302	32	3
5340	302	33	4
5341	302	34	3
5342	302	35	6
5343	302	36	5
5344	303	19	5
5345	303	20	5
5346	303	21	6
5347	303	22	5
5348	303	23	6
5349	303	24	4
5350	303	25	4
5351	303	26	7
5352	303	27	5
5353	303	28	7
5354	303	29	5
5355	303	30	5
5356	303	31	7
5357	303	32	3
5358	303	33	4
5359	303	34	4
5360	303	35	4
5361	303	36	5
5362	304	19	7
5363	304	20	6
5364	304	21	8
5365	304	22	6
5366	304	23	8
5367	304	24	6
5368	304	25	4
5369	304	26	4
5370	304	27	7
5371	304	28	6
5372	304	29	5
5373	304	30	6
5374	304	31	8
5375	304	32	4
5376	304	33	5
5377	304	34	5
5378	304	35	6
5379	304	36	6
5380	305	19	6
5381	305	20	5
5382	305	21	8
5383	305	22	5
5384	305	23	6
5385	305	24	6
5386	305	25	4
5387	305	26	5
5388	305	27	7
5389	305	28	6
5390	305	29	6
5391	305	30	4
5392	305	31	8
5393	305	32	3
5394	305	33	5
5395	305	34	4
5396	305	35	5
5397	305	36	6
5398	306	19	5
5399	306	20	6
5400	306	21	5
5401	306	22	4
5402	306	23	7
5403	306	24	5
5404	306	25	4
5405	306	26	6
5406	306	27	6
5407	306	28	7
5408	306	29	4
5409	306	30	5
5410	306	31	7
5411	306	32	3
5412	306	33	5
5413	306	34	0
5414	306	35	0
5415	306	36	0
5438	308	23	6
5439	308	24	5
5440	308	25	4
5441	308	26	5
5442	308	27	6
5443	308	28	7
5444	308	29	5
5445	308	30	5
5446	308	31	6
5434	308	19	6
5435	308	20	6
5436	308	21	5
5437	308	22	4
5447	308	32	3
5448	308	33	5
5449	308	34	0
5450	308	35	0
5451	308	36	0
5452	309	19	6
5453	309	20	6
5454	309	21	5
5455	309	22	4
5456	309	23	7
5457	309	24	6
5458	309	25	5
5459	309	26	6
5460	309	27	8
5461	309	28	7
5462	309	29	6
5463	309	30	6
5464	309	31	8
5465	309	32	4
5466	309	33	4
5467	309	34	5
5468	309	35	6
5469	309	36	5
5470	310	19	7
5471	310	20	5
5472	310	21	6
5473	310	22	3
5474	310	23	8
5475	310	24	6
5476	310	25	4
5477	310	26	6
5478	310	27	6
5479	310	28	8
5480	310	29	6
5481	310	30	6
5482	310	31	6
5483	310	32	5
5484	310	33	6
5485	310	34	3
5486	310	35	7
5487	310	36	6
5488	311	19	6
5489	311	20	5
5490	311	21	5
5491	311	22	5
5492	311	23	6
5493	311	24	4
5494	311	25	4
5495	311	26	6
5496	311	27	6
5497	311	28	7
5498	311	29	5
5499	311	30	5
5500	311	31	6
5501	311	32	4
5502	311	33	4
5503	311	34	4
5504	311	35	5
5505	311	36	4
5506	312	19	5
5507	312	20	6
5508	312	21	5
5509	312	22	4
5510	312	23	6
5511	312	24	4
5512	312	25	4
5513	312	26	6
5514	312	27	6
5515	312	28	7
5516	312	29	6
5517	312	30	5
5518	312	31	7
5519	312	32	4
5520	312	33	5
5521	312	34	3
5522	312	35	5
5523	312	36	5
5524	313	19	7
5525	313	20	5
5526	313	21	0
5527	313	22	5
5528	313	23	7
5529	313	24	4
5530	313	25	5
5531	313	26	5
5532	313	27	7
5533	313	28	8
5534	313	29	5
5535	313	30	5
5536	313	31	8
5537	313	32	4
5538	313	33	5
5539	313	34	4
5540	313	35	0
5541	313	36	4
5542	314	19	4
5543	314	20	6
5544	314	21	6
5545	314	22	4
5546	314	23	8
5547	314	24	5
5548	314	25	3
5549	314	26	0
5550	314	27	6
5551	314	28	7
5552	314	29	5
5553	314	30	6
5554	314	31	6
5555	314	32	2
5556	314	33	4
5557	314	34	4
5558	314	35	6
5559	314	36	5
5560	315	19	4
5561	315	20	6
5562	315	21	5
5563	315	22	4
5564	315	23	8
5565	315	24	4
5566	315	25	4
5567	315	26	7
5568	315	27	6
5569	315	28	6
5570	315	29	4
5571	315	30	3
5572	315	31	5
5573	315	32	3
5574	315	33	6
5575	315	34	4
5576	315	35	4
5577	315	36	4
5578	316	19	6
5579	316	20	5
5580	316	21	7
5581	316	22	4
5582	316	23	6
5583	316	24	6
5584	316	25	4
5585	316	26	6
5586	316	27	6
5587	316	28	6
5588	316	29	6
5589	316	30	5
5590	316	31	6
5591	316	32	3
5592	316	33	7
5593	316	34	5
5594	316	35	5
5595	316	36	4
5596	317	19	4
5597	317	20	6
5598	317	21	6
5599	317	22	4
5600	317	23	6
5601	317	24	5
5602	317	25	4
5603	317	26	5
5604	317	27	6
5605	317	28	7
5606	317	29	6
5607	317	30	5
5608	317	31	7
5609	317	32	4
5610	317	33	4
5611	317	34	3
5612	317	35	5
5613	317	36	5
5614	318	19	4
5615	318	20	7
5616	318	21	7
5617	318	22	3
5618	318	23	5
5619	318	24	4
5620	318	25	0
5621	318	26	5
5622	318	27	4
5623	318	28	6
5624	318	29	5
5625	318	30	5
5626	318	31	6
5627	318	32	3
5628	318	33	5
5629	318	34	0
5630	318	35	5
5631	318	36	5
5632	319	19	0
5633	319	20	6
5634	319	21	6
5635	319	22	4
5636	319	23	6
5637	319	24	5
5638	319	25	4
5639	319	26	0
5640	319	27	5
5641	319	28	7
5642	319	29	4
5643	319	30	5
5644	319	31	7
5645	319	32	4
5646	319	33	5
5647	319	34	3
5648	319	35	4
5649	319	36	0
5650	320	19	4
5651	320	20	4
5652	320	21	5
5653	320	22	4
5654	320	23	5
5655	320	24	3
5656	320	25	3
5657	320	26	5
5658	320	27	4
5659	320	28	6
5660	320	29	5
5661	320	30	5
5662	320	31	5
5663	320	32	3
5664	320	33	4
5665	320	34	4
5666	320	35	5
5667	320	36	4
5668	321	19	4
5669	321	20	4
5670	321	21	5
5671	321	22	4
5672	321	23	6
5673	321	24	7
5674	321	25	4
5675	321	26	5
5676	321	27	6
5677	321	28	0
5678	321	29	6
5679	321	30	7
5680	321	31	5
5681	321	32	3
5682	321	33	4
5683	321	34	4
5684	321	35	5
5685	321	36	6
5686	322	19	4
5687	322	20	4
5688	322	21	7
5689	322	22	4
5690	322	23	6
5691	322	24	6
5692	322	25	4
5693	322	26	6
5694	322	27	6
5695	322	28	6
5696	322	29	4
5697	322	30	6
5698	322	31	5
5699	322	32	5
5700	322	33	5
5701	322	34	4
5702	322	35	6
5703	322	36	5
5704	323	19	4
5705	323	20	5
5706	323	21	5
5707	323	22	4
5708	323	23	5
5709	323	24	5
5710	323	25	3
5711	323	26	5
5712	323	27	5
5713	323	28	6
5714	323	29	6
5715	323	30	5
5716	323	31	6
5717	323	32	3
5718	323	33	4
5719	323	34	3
5720	323	35	4
5721	323	36	4
5722	324	19	3
5723	324	20	4
5724	324	21	4
5725	324	22	4
5726	324	23	5
5727	324	24	4
5728	324	25	4
5729	324	26	6
5730	324	27	4
5731	324	28	7
5732	324	29	5
5733	324	30	4
5734	324	31	4
5735	324	32	5
5736	324	33	4
5737	324	34	4
5738	324	35	4
5739	324	36	4
5740	325	19	4
5741	325	20	0
5742	325	21	6
5743	325	22	4
5744	325	23	0
5745	325	24	5
5746	325	25	4
5747	325	26	8
5748	325	27	6
5749	325	28	8
5750	325	29	6
5751	325	30	6
5752	325	31	6
5753	325	32	4
5754	325	33	4
5755	325	34	4
5756	325	35	6
5757	325	36	4
5758	326	19	4
5759	326	20	6
5760	326	21	4
5761	326	22	4
5762	326	23	7
5763	326	24	5
5764	326	25	4
5765	326	26	5
5766	326	27	7
5767	326	28	7
5768	326	29	4
5769	326	30	4
5770	326	31	5
5771	326	32	3
5772	326	33	4
5773	326	34	4
5774	326	35	5
5775	326	36	5
5776	327	19	5
5777	327	20	5
5778	327	21	5
5779	327	22	6
5780	327	23	5
5781	327	24	5
5782	327	25	5
5783	327	26	4
5784	327	27	7
5785	327	28	6
5786	327	29	5
5787	327	30	4
5788	327	31	5
5789	327	32	3
5790	327	33	4
5791	327	34	4
5792	327	35	6
5793	327	36	3
5794	328	19	4
5795	328	20	4
5796	328	21	5
5797	328	22	3
5798	328	23	7
5799	328	24	7
5800	328	25	4
5801	328	26	5
5802	328	27	6
5803	328	28	8
5804	328	29	6
5805	328	30	5
5806	328	31	7
5807	328	32	3
5808	328	33	7
5809	328	34	4
5810	328	35	7
5811	328	36	5
5812	329	19	4
5813	329	20	7
5814	329	21	5
5815	329	22	4
5816	329	23	6
5817	329	24	4
5818	329	25	4
5819	329	26	5
5820	329	27	6
5821	329	28	7
5822	329	29	5
5823	329	30	6
5824	329	31	5
5825	329	32	4
5826	329	33	7
5827	329	34	2
5828	329	35	5
5829	329	36	5
5830	330	19	4
5831	330	20	5
5832	330	21	5
5833	330	22	4
5834	330	23	7
5835	330	24	6
5836	330	25	5
5837	330	26	7
5838	330	27	7
5839	330	28	7
5840	330	29	5
5841	330	30	7
5842	330	31	7
5843	330	32	3
5844	330	33	6
5845	330	34	3
5846	330	35	6
5847	330	36	5
5848	331	19	4
5849	331	20	6
5850	331	21	6
5851	331	22	4
5852	331	23	6
5853	331	24	6
5854	331	25	5
5855	331	26	5
5856	331	27	6
5857	331	28	8
5858	331	29	4
5859	331	30	5
5860	331	31	7
5861	331	32	4
5862	331	33	4
5863	331	34	5
5864	331	35	5
5865	331	36	4
5866	332	19	5
5867	332	20	6
5868	332	21	6
5869	332	22	4
5870	332	23	5
5871	332	24	5
5872	332	25	4
5873	332	26	7
5874	332	27	6
5875	332	28	7
5876	332	29	5
5877	332	30	6
5878	332	31	7
5879	332	32	4
5880	332	33	5
5881	332	34	0
5882	332	35	0
5883	332	36	0
5884	333	19	6
5885	333	20	4
5886	333	21	6
5887	333	22	4
5888	333	23	7
5889	333	24	5
5890	333	25	4
5891	333	26	7
5892	333	27	7
5893	333	28	6
5894	333	29	5
5895	333	30	6
5896	333	31	8
5897	333	32	4
5898	333	33	6
5899	333	34	0
5900	333	35	0
5901	333	36	0
5902	334	19	5
5903	334	20	5
5904	334	21	4
5905	334	22	5
5906	334	23	6
5907	334	24	5
5908	334	25	5
5909	334	26	5
5910	334	27	6
5911	334	28	0
5912	334	29	6
5913	334	30	5
5914	334	31	7
5915	334	32	3
5916	334	33	5
5917	334	34	0
5918	334	35	0
5919	334	36	0
5920	335	19	6
5921	335	20	7
5922	335	21	7
5923	335	22	4
5924	335	23	7
5925	335	24	6
5926	335	25	5
5927	335	26	6
5928	335	27	7
5929	335	28	7
5930	335	29	6
5931	335	30	6
5932	335	31	8
5933	335	32	4
5934	335	33	4
5935	335	34	4
5936	335	35	5
5937	335	36	5
5938	336	19	6
5939	336	20	5
5940	336	21	6
5941	336	22	5
5942	336	23	7
5943	336	24	5
5944	336	25	5
5945	336	26	6
5946	336	27	8
5947	336	28	6
5948	336	29	6
5949	336	30	6
5950	336	31	7
5951	336	32	4
5952	336	33	5
5953	336	34	3
5954	336	35	5
5955	336	36	5
5956	337	19	6
5957	337	20	5
5958	337	21	6
5959	337	22	4
5960	337	23	7
5961	337	24	5
5962	337	25	4
5963	337	26	5
5964	337	27	6
5965	337	28	7
5966	337	29	5
5967	337	30	5
5968	337	31	7
5969	337	32	4
5970	337	33	5
5971	337	34	4
5972	337	35	5
5973	337	36	6
5974	338	19	7
5975	338	20	5
5976	338	21	5
5977	338	22	5
5978	338	23	6
5979	338	24	7
5980	338	25	4
5981	338	26	5
5982	338	27	7
5983	338	28	8
5984	338	29	6
5985	338	30	5
5986	338	31	7
5987	338	32	5
5988	338	33	6
5989	338	34	5
5990	338	35	7
5991	338	36	5
5992	339	19	5
5993	339	20	6
5994	339	21	5
5995	339	22	4
5996	339	23	7
5997	339	24	4
5998	339	25	4
5999	339	26	5
6000	339	27	7
6001	339	28	6
6002	339	29	5
6003	339	30	5
6004	339	31	7
6005	339	32	3
6006	339	33	5
6007	339	34	4
6008	339	35	6
6009	339	36	5
6012	340	21	6
6013	340	22	3
6028	341	19	5
6029	341	20	7
6030	341	21	6
6031	341	22	4
6032	341	23	6
6033	341	24	5
6034	341	25	3
6035	341	26	6
6010	340	19	5
6011	340	20	6
6014	340	23	6
6015	340	24	4
6016	340	25	5
6017	340	26	0
6018	340	27	7
6019	340	28	7
6020	340	29	6
6021	340	30	5
6022	340	31	4
6023	340	32	3
6024	340	33	5
6025	340	34	4
6026	340	35	6
6027	340	36	7
6036	341	27	6
6037	341	28	7
6038	341	29	6
6039	341	30	5
6040	341	31	4
6041	341	32	3
6042	341	33	5
6043	341	34	4
6044	341	35	6
6045	341	36	7
6046	342	19	5
6047	342	20	6
6048	342	21	5
6049	342	22	4
6050	342	23	0
6051	342	24	6
6052	342	25	4
6053	342	26	5
6054	342	27	7
6055	342	28	7
6056	342	29	5
6057	342	30	4
6058	342	31	6
6059	342	32	4
6060	342	33	6
6061	342	34	3
6062	342	35	5
6063	342	36	5
6064	343	19	6
6065	343	20	5
6066	343	21	4
6067	343	22	4
6068	343	23	7
6069	343	24	4
6070	343	25	4
6071	343	26	5
6072	343	27	6
6073	343	28	6
6074	343	29	5
6075	343	30	5
6076	343	31	7
6077	343	32	4
6078	343	33	4
6079	343	34	4
6080	343	35	5
6081	343	36	5
6082	344	19	6
6083	344	20	5
6084	344	21	6
6085	344	22	5
6086	344	23	6
6087	344	24	5
6088	344	25	5
6089	344	26	5
6090	344	27	7
6091	344	28	6
6092	344	29	5
6093	344	30	5
6094	344	31	7
6095	344	32	4
6096	344	33	5
6097	344	34	4
6098	344	35	6
6099	344	36	4
6100	345	19	6
6101	345	20	5
6102	345	21	7
6103	345	22	4
6104	345	23	8
6105	345	24	5
6106	345	25	4
6107	345	26	6
6108	345	27	7
6109	345	28	8
6110	345	29	6
6111	345	30	7
6112	345	31	8
6113	345	32	4
6114	345	33	4
6115	345	34	5
6116	345	35	6
6117	345	36	6
6118	346	19	7
6119	346	20	6
6120	346	21	6
6121	346	22	3
6122	346	23	7
6123	346	24	5
6124	346	25	5
6125	346	26	6
6126	346	27	7
6127	346	28	7
6128	346	29	6
6129	346	30	7
6130	346	31	9
6131	346	32	5
6132	346	33	5
6133	346	34	5
6134	346	35	5
6135	346	36	7
6136	347	19	6
6137	347	20	5
6138	347	21	5
6139	347	22	4
6140	347	23	6
6141	347	24	5
6142	347	25	4
6143	347	26	6
6144	347	27	6
6145	347	28	6
6146	347	29	5
6147	347	30	5
6148	347	31	7
6149	347	32	4
6150	347	33	4
6151	347	34	4
6152	347	35	6
6153	347	36	6
6154	348	19	5
6155	348	20	6
6156	348	21	5
6157	348	22	4
6158	348	23	5
6159	348	24	6
6160	348	25	4
6161	348	26	6
6162	348	27	6
6163	348	28	7
6164	348	29	5
6165	348	30	5
6166	348	31	6
6167	348	32	3
6168	348	33	6
6169	348	34	3
6170	348	35	6
6171	348	36	5
6172	349	19	4
6173	349	20	5
6174	349	21	5
6175	349	22	3
6176	349	23	6
6177	349	24	4
6178	349	25	4
6179	349	26	5
6180	349	27	5
6181	349	28	6
6182	349	29	5
6183	349	30	4
6184	349	31	6
6185	349	32	4
6186	349	33	4
6187	349	34	3
6188	349	35	6
6189	349	36	4
6190	350	19	5
6191	350	20	7
6192	350	21	5
6193	350	22	4
6194	350	23	6
6195	350	24	6
6196	350	25	3
6197	350	26	6
6198	350	27	5
6199	350	28	0
6200	350	29	5
6201	350	30	5
6202	350	31	4
6203	350	32	3
6204	350	33	5
6205	350	34	3
6206	350	35	5
6207	350	36	6
6208	351	19	6
6209	351	20	6
6210	351	21	6
6211	351	22	4
6212	351	23	6
6213	351	24	5
6214	351	25	4
6215	351	26	6
6216	351	27	7
6217	351	28	8
6218	351	29	4
6219	351	30	4
6220	351	31	7
6221	351	32	3
6222	351	33	5
6223	351	34	4
6224	351	35	5
6225	351	36	5
6226	352	19	6
6227	352	20	5
6228	352	21	4
6229	352	22	4
6230	352	23	6
6231	352	24	5
6232	352	25	4
6233	352	26	6
6234	352	27	6
6235	352	28	6
6236	352	29	6
6237	352	30	5
6238	352	31	0
6239	352	32	4
6240	352	33	4
6241	352	34	4
6242	352	35	5
6243	352	36	4
6244	353	19	4
6245	353	20	7
6246	353	21	5
6247	353	22	6
6248	353	23	6
6249	353	24	5
6250	353	25	4
6251	353	26	0
6252	353	27	5
6253	353	28	0
6254	353	29	5
6255	353	30	5
6256	353	31	7
6257	353	32	4
6258	353	33	5
6259	353	34	4
6260	353	35	4
6261	353	36	5
6262	354	19	7
6263	354	20	5
6264	354	21	6
6265	354	22	4
6266	354	23	6
6267	354	24	5
6268	354	25	3
6269	354	26	7
6270	354	27	7
6271	354	28	8
6272	354	29	4
6273	354	30	0
6274	354	31	6
6275	354	32	4
6276	354	33	4
6277	354	34	3
6278	354	35	5
6279	354	36	4
6280	355	19	7
6281	355	20	6
6282	355	21	5
6283	355	22	4
6284	355	23	8
6285	355	24	6
6286	355	25	5
6287	355	26	0
6288	355	27	7
6289	355	28	7
6290	355	29	5
6291	355	30	5
6292	355	31	6
6293	355	32	4
6294	355	33	5
6295	355	34	4
6296	355	35	6
6297	355	36	4
6298	356	19	7
6299	356	20	5
6300	356	21	5
6301	356	22	4
6302	356	23	6
6303	356	24	4
6304	356	25	5
6305	356	26	5
6306	356	27	5
6307	356	28	6
6308	356	29	5
6309	356	30	5
6310	356	31	6
6311	356	32	5
6312	356	33	4
6313	356	34	5
6314	356	35	5
6315	356	36	6
6316	357	19	4
6317	357	20	5
6318	357	21	5
6319	357	22	3
6320	357	23	7
6321	357	24	5
6322	357	25	4
6323	357	26	5
6324	357	27	7
6325	357	28	9
6326	357	29	5
6327	357	30	6
6328	357	31	7
6329	357	32	3
6330	357	33	5
6331	357	34	4
6332	357	35	5
6333	357	36	5
6334	358	19	6
6335	358	20	5
6336	358	21	5
6337	358	22	4
6338	358	23	7
6339	358	24	5
6340	358	25	4
6341	358	26	6
6342	358	27	6
6343	358	28	7
6344	358	29	5
6345	358	30	6
6346	358	31	8
6347	358	32	4
6348	358	33	6
6349	358	34	0
6350	358	35	0
6351	358	36	0
6352	359	19	6
6353	359	20	5
6354	359	21	6
6355	359	22	4
6356	359	23	5
6357	359	24	5
6358	359	25	4
6359	359	26	5
6360	359	27	8
6361	359	28	7
6362	359	29	6
6363	359	30	5
6364	359	31	5
6365	359	32	4
6366	359	33	5
6367	359	34	4
6368	359	35	5
6369	359	36	4
6370	360	19	5
6371	360	20	6
6372	360	21	5
6373	360	22	4
6374	360	23	7
6375	360	24	5
6376	360	25	4
6377	360	26	7
6378	360	27	7
6379	360	28	6
6380	360	29	6
6381	360	30	6
6382	360	31	7
6383	360	32	4
6384	360	33	6
6385	360	34	4
6386	360	35	6
6387	360	36	5
6388	361	19	5
6389	361	20	6
6390	361	21	6
6391	361	22	3
6392	361	23	6
6393	361	24	4
6394	361	25	4
6395	361	26	5
6396	361	27	7
6397	361	28	7
6398	361	29	5
6399	361	30	5
6400	361	31	6
6401	361	32	4
6402	361	33	4
6403	361	34	4
6404	361	35	6
6405	361	36	5
6406	362	19	0
6407	362	20	7
6408	362	21	4
6409	362	22	3
6410	362	23	7
6411	362	24	4
6412	362	25	3
6413	362	26	6
6414	362	27	6
6415	362	28	6
6416	362	29	4
6417	362	30	4
6418	362	31	5
6419	362	32	3
6420	362	33	5
6421	362	34	3
6422	362	35	4
6423	362	36	5
6424	363	19	5
6425	363	20	7
6426	363	21	6
6427	363	22	4
6428	363	23	6
6429	363	24	5
6430	363	25	4
6431	363	26	5
6432	363	27	5
6433	363	28	5
6434	363	29	5
6435	363	30	5
6436	363	31	4
6437	363	32	3
6438	363	33	5
6439	363	34	6
6440	363	35	6
6441	363	36	4
6442	364	19	5
6443	364	20	6
6444	364	21	7
6445	364	22	4
6446	364	23	6
6447	364	24	4
6448	364	25	3
6449	364	26	5
6450	364	27	6
6451	364	28	7
6452	364	29	4
6453	364	30	5
6454	364	31	6
6455	364	32	3
6456	364	33	4
6457	364	34	3
6458	364	35	6
6459	364	36	5
6460	365	19	5
6461	365	20	6
6462	365	21	5
6463	365	22	5
6464	365	23	7
6465	365	24	6
6466	365	25	3
6467	365	26	7
6468	365	27	6
6469	365	28	6
6470	365	29	5
6471	365	30	5
6472	365	31	6
6473	365	32	2
6474	365	33	5
6475	365	34	4
6476	365	35	0
6477	365	36	6
6478	366	19	6
6479	366	20	6
6480	366	21	5
6481	366	22	4
6482	366	23	7
6483	366	24	5
6484	366	25	4
6485	366	26	0
6486	366	27	6
6487	366	28	7
6488	366	29	6
6489	366	30	5
6490	366	31	6
6491	366	32	4
6492	366	33	5
6493	366	34	4
6494	366	35	6
6495	366	36	5
6496	367	19	7
6497	367	20	5
6498	367	21	5
6499	367	22	5
6500	367	23	7
6501	367	24	5
6502	367	25	4
6503	367	26	5
6504	367	27	6
6505	367	28	7
6506	367	29	5
6507	367	30	6
6508	367	31	6
6509	367	32	3
6510	367	33	6
6511	367	34	3
6512	367	35	5
6513	367	36	6
6556	370	25	4
6557	370	26	8
6558	370	27	7
6559	370	28	7
6560	370	29	5
6561	370	30	5
6562	370	31	7
6563	370	32	4
6564	370	33	4
6532	369	19	4
6533	369	20	6
6534	369	21	6
6535	369	22	4
6536	369	23	0
6537	369	24	4
6538	369	25	4
6539	369	26	0
6540	369	27	4
6541	369	28	7
6542	369	29	6
6543	369	30	6
6544	369	31	0
6545	369	32	2
6546	369	33	0
6547	369	34	6
6548	369	35	4
6549	369	36	5
6550	370	19	5
6551	370	20	6
6552	370	21	6
6553	370	22	5
6554	370	23	8
6555	370	24	6
6565	370	34	4
6566	370	35	7
6567	370	36	6
6568	371	19	6
6569	371	20	5
6570	371	21	6
6571	371	22	4
6572	371	23	8
6573	371	24	6
6574	371	25	4
6575	371	26	7
6576	371	27	7
6577	371	28	7
6578	371	29	6
6579	371	30	6
6580	371	31	7
6581	371	32	4
6582	371	33	5
6583	371	34	4
6584	371	35	6
6585	371	36	6
6586	372	19	5
6587	372	20	7
6588	372	21	5
6589	372	22	5
6590	372	23	6
6591	372	24	6
6592	372	25	5
6593	372	26	6
6594	372	27	6
6595	372	28	7
6596	372	29	5
6597	372	30	0
6598	372	31	6
6599	372	32	4
6600	372	33	5
6601	372	34	0
6602	372	35	5
6603	372	36	5
6609	373	24	5
6610	373	25	4
6611	373	26	6
6612	373	27	7
6613	373	28	7
6619	373	34	3
6620	373	35	7
6621	373	36	7
6622	374	19	5
6623	374	20	6
6624	374	21	5
6625	374	22	3
6626	374	23	5
6604	373	19	5
6605	373	20	6
6606	373	21	5
6607	373	22	5
6608	373	23	6
6614	373	29	5
6615	373	30	5
6616	373	31	6
6617	373	32	3
6618	373	33	5
6627	374	24	4
6628	374	25	3
6629	374	26	4
6630	374	27	6
6631	374	28	7
6632	374	29	5
6633	374	30	3
6634	374	31	5
6635	374	32	4
6636	374	33	3
6637	374	34	3
6638	374	35	5
6639	374	36	4
6640	375	19	4
6641	375	20	6
6642	375	21	5
6643	375	22	4
6644	375	23	7
6645	375	24	4
6646	375	25	4
6647	375	26	5
6648	375	27	6
6649	375	28	9
6650	375	29	5
6651	375	30	5
6652	375	31	7
6653	375	32	4
6654	375	33	5
6655	375	34	5
6656	375	35	5
6657	375	36	6
6658	376	19	6
6659	376	20	5
6660	376	21	5
6661	376	22	3
6662	376	23	7
6663	376	24	6
6664	376	25	5
6665	376	26	0
6666	376	27	6
6667	376	28	6
6668	376	29	4
6669	376	30	4
6670	376	31	5
6671	376	32	4
6672	376	33	6
6673	376	34	5
6674	376	35	0
6675	376	36	5
6676	377	19	6
6677	377	20	6
6678	377	21	6
6679	377	22	4
6680	377	23	7
6681	377	24	4
6682	377	25	4
6683	377	26	6
6684	377	27	5
6685	377	28	6
6686	377	29	5
6687	377	30	5
6688	377	31	0
6689	377	32	3
6690	377	33	5
6691	377	34	2
6692	377	35	6
6693	377	36	4
6694	378	19	5
6695	378	20	5
6696	378	21	4
6697	378	22	4
6698	378	23	5
6699	378	24	4
6700	378	25	3
6701	378	26	6
6702	378	27	5
6703	378	28	6
6704	378	29	3
6705	378	30	6
6706	378	31	5
6707	378	32	4
6708	378	33	4
6709	378	34	3
6710	378	35	5
6711	378	36	3
6712	379	19	5
6713	379	20	6
6714	379	21	5
6715	379	22	3
6716	379	23	7
6717	379	24	5
6718	379	25	3
6719	379	26	5
6720	379	27	7
6721	379	28	7
6722	379	29	5
6723	379	30	6
6724	379	31	7
6725	379	32	4
6726	379	33	4
6727	379	34	0
6728	379	35	0
6729	379	36	0
6730	380	19	6
6731	380	20	5
6732	380	21	6
6733	380	22	4
6734	380	23	7
6735	380	24	5
6736	380	25	4
6737	380	26	6
6738	380	27	6
6739	380	28	6
6740	380	29	6
6741	380	30	6
6742	380	31	4
6743	380	32	5
6744	380	33	0
6745	380	34	0
6746	380	35	0
6747	380	36	0
6748	381	19	5
6749	381	20	6
6750	381	21	5
6751	381	22	4
6752	381	23	8
6753	381	24	7
6754	381	25	4
6755	381	26	0
6756	381	27	6
6757	381	28	6
6758	381	29	5
6759	381	30	3
6760	381	31	7
6761	381	32	4
6762	381	33	5
6763	381	34	0
6764	381	35	0
6765	381	36	0
6766	382	19	5
6767	382	20	6
6768	382	21	6
6769	382	22	4
6770	382	23	8
6771	382	24	6
6772	382	25	4
6773	382	26	0
6774	382	27	0
6775	382	28	7
6776	382	29	5
6777	382	30	5
6778	382	31	7
6779	382	32	4
6780	382	33	5
6781	382	34	4
6782	382	35	7
6783	382	36	6
6784	383	19	5
6785	383	20	5
6786	383	21	5
6787	383	22	3
6788	383	23	5
6789	383	24	0
6790	383	25	4
6791	383	26	6
6792	383	27	5
6793	383	28	7
6794	383	29	5
6795	383	30	5
6796	383	31	6
6797	383	32	4
6798	383	33	0
6799	383	34	5
6800	383	35	5
6801	383	36	6
6802	384	19	7
6803	384	20	5
6804	384	21	5
6805	384	22	5
6806	384	23	7
6807	384	24	6
6808	384	25	0
6809	384	26	6
6810	384	27	7
6811	384	28	7
6812	384	29	4
6813	384	30	5
6814	384	31	6
6815	384	32	4
6816	384	33	7
6817	384	34	4
6818	384	35	5
6819	384	36	4
6820	385	19	7
6821	385	20	5
6822	385	21	4
6823	385	22	0
6824	385	23	7
6825	385	24	4
6826	385	25	4
6827	385	26	6
6828	385	27	0
6829	385	28	6
6830	385	29	6
6831	385	30	5
6832	385	31	6
6833	385	32	3
6834	385	33	6
6835	385	34	3
6836	385	35	6
6837	385	36	5
6838	386	19	5
6839	386	20	6
6840	386	21	6
6841	386	22	5
6842	386	23	5
6843	386	24	5
6844	386	25	3
6845	386	26	6
6846	386	27	5
6847	386	28	6
6848	386	29	4
6849	386	30	5
6850	386	31	6
6851	386	32	3
6852	386	33	5
6853	386	34	4
6854	386	35	5
6855	386	36	5
6856	387	19	5
6857	387	20	5
6858	387	21	5
6859	387	22	4
6860	387	23	6
6861	387	24	5
6862	387	25	3
6863	387	26	6
6864	387	27	6
6865	387	28	6
6866	387	29	5
6867	387	30	4
6868	387	31	7
6869	387	32	4
6870	387	33	5
6871	387	34	4
6872	387	35	5
6873	387	36	4
6874	388	19	4
6875	388	20	5
6876	388	21	5
6877	388	22	3
6878	388	23	7
6879	388	24	5
6880	388	25	3
6881	388	26	5
6882	388	27	6
6883	388	28	7
6884	388	29	5
6885	388	30	5
6886	388	31	6
6887	388	32	4
6888	388	33	4
6889	388	34	4
6890	388	35	4
6891	388	36	6
6892	389	19	5
6893	389	20	5
6894	389	21	4
6895	389	22	3
6896	389	23	6
6897	389	24	5
6898	389	25	4
6899	389	26	5
6900	389	27	5
6901	389	28	7
6902	389	29	4
6903	389	30	4
6904	389	31	5
6905	389	32	4
6906	389	33	5
6907	389	34	4
6908	389	35	6
6909	389	36	5
6910	390	19	5
6911	390	20	4
6912	390	21	4
6913	390	22	3
6914	390	23	7
6915	390	24	5
6916	390	25	5
6917	390	26	6
6918	390	27	7
6919	390	28	7
6920	390	29	5
6921	390	30	4
6922	390	31	5
6923	390	32	3
6924	390	33	4
6925	390	34	0
6926	390	35	0
6927	390	36	0
6928	391	19	5
6929	391	20	5
6930	391	21	5
6931	391	22	4
6932	391	23	6
6933	391	24	5
6934	391	25	4
6935	391	26	5
6936	391	27	6
6937	391	28	6
6938	391	29	5
6939	391	30	5
6940	391	31	7
6941	391	32	4
6942	391	33	5
6943	391	34	4
6944	391	35	6
6945	391	36	5
6946	392	19	4
6947	392	20	6
6948	392	21	5
6949	392	22	4
6950	392	23	4
6951	392	24	4
6952	392	25	3
6953	392	26	5
6954	392	27	5
6955	392	28	6
6956	392	29	5
6957	392	30	6
6958	392	31	5
6959	392	32	3
6960	392	33	5
6961	392	34	3
6962	392	35	6
6963	392	36	4
6964	393	19	5
6965	393	20	5
6966	393	21	5
6967	393	22	4
6968	393	23	6
6969	393	24	4
6970	393	25	3
6971	393	26	5
6972	393	27	6
6973	393	28	5
6974	393	29	5
6975	393	30	5
6976	393	31	6
6977	393	32	3
6978	393	33	4
6979	393	34	4
6980	393	35	5
6981	393	36	4
6982	394	19	4
6983	394	20	7
6984	394	21	5
6985	394	22	4
6986	394	23	6
6987	394	24	4
6988	394	25	4
6989	394	26	5
6990	394	27	5
6991	394	28	8
6992	394	29	5
6993	394	30	5
6994	394	31	8
6995	394	32	5
6996	394	33	5
6997	394	34	4
6998	394	35	5
6999	394	36	4
7000	395	19	6
7001	395	20	5
7002	395	21	6
7003	395	22	4
7004	395	23	5
7005	395	24	5
7006	395	25	4
7007	395	26	7
7008	395	27	6
7009	395	28	6
7010	395	29	5
7011	395	30	4
7012	395	31	4
7013	395	32	4
7014	395	33	4
7015	395	34	3
7016	395	35	4
7017	395	36	4
7039	397	22	5
7040	397	23	7
7041	397	24	5
7042	397	25	4
7043	397	26	6
7044	397	27	6
7045	397	28	6
7046	397	29	5
7047	397	30	5
7036	397	19	6
7037	397	20	4
7038	397	21	4
7048	397	31	7
7049	397	32	4
7050	397	33	4
7051	397	34	3
7052	397	35	6
7053	397	36	5
7054	398	19	5
7055	398	20	5
7056	398	21	8
7057	398	22	3
7058	398	23	6
7059	398	24	6
7060	398	25	3
7061	398	26	5
7062	398	27	6
7063	398	28	6
7064	398	29	4
7065	398	30	4
7066	398	31	6
7067	398	32	4
7068	398	33	4
7069	398	34	4
7070	398	35	4
7071	398	36	4
7072	399	19	4
7073	399	20	5
7074	399	21	4
7075	399	22	3
7076	399	23	4
7077	399	24	4
7078	399	25	4
7079	399	26	4
7080	399	27	5
7081	399	28	5
7082	399	29	4
7083	399	30	4
7084	399	31	8
7085	399	32	3
7086	399	33	5
7087	399	34	4
7088	399	35	5
7089	399	36	3
7090	400	19	5
7091	400	20	6
7092	400	21	4
7093	400	22	3
7094	400	23	8
7095	400	24	6
7096	400	25	3
7097	400	26	6
7098	400	27	6
7099	400	28	7
7100	400	29	5
7101	400	30	7
7102	400	31	6
7103	400	32	5
7104	400	33	5
7105	400	34	3
7106	400	35	5
7107	400	36	5
7156	403	31	7
7157	403	32	5
7158	403	33	6
7159	403	34	4
7160	403	35	6
7161	403	36	7
7162	404	19	5
7163	404	20	6
7164	404	21	5
7126	402	19	0
7127	402	20	5
7128	402	21	7
7129	402	22	4
7130	402	23	7
7131	402	24	5
7132	402	25	4
7133	402	26	5
7134	402	27	6
7135	402	28	6
7136	402	29	5
7137	402	30	6
7138	402	31	6
7139	402	32	4
7140	402	33	4
7141	402	34	3
7142	402	35	7
7143	402	36	6
7144	403	19	6
7145	403	20	5
7146	403	21	6
7147	403	22	5
7148	403	23	7
7149	403	24	6
7150	403	25	4
7151	403	26	6
7152	403	27	7
7153	403	28	8
7154	403	29	7
7155	403	30	7
7165	404	22	4
7166	404	23	5
7167	404	24	4
7168	404	25	4
7169	404	26	6
7170	404	27	5
7171	404	28	6
7172	404	29	5
7173	404	30	4
7174	404	31	7
7175	404	32	3
7176	404	33	4
7177	404	34	4
7178	404	35	6
7179	404	36	5
7180	405	19	4
7181	405	20	6
7182	405	21	6
7183	405	22	4
7184	405	23	6
7185	405	24	6
7186	405	25	3
7187	405	26	5
7188	405	27	6
7189	405	28	5
7190	405	29	6
7191	405	30	6
7192	405	31	7
7193	405	32	4
7194	405	33	4
7195	405	34	4
7196	405	35	6
7197	405	36	5
7198	406	19	5
7199	406	20	4
7200	406	21	4
7201	406	22	4
7202	406	23	6
7203	406	24	5
7204	406	25	3
7205	406	26	5
7206	406	27	5
7207	406	28	7
7208	406	29	6
7209	406	30	5
7210	406	31	6
7211	406	32	4
7212	406	33	4
7213	406	34	4
7214	406	35	5
7215	406	36	6
7216	407	19	5
7217	407	20	5
7218	407	21	6
7219	407	22	4
7220	407	23	6
7221	407	24	5
7222	407	25	4
7223	407	26	6
7224	407	27	6
7225	407	28	6
7226	407	29	5
7227	407	30	5
7228	407	31	6
7229	407	32	4
7230	407	33	5
7231	407	34	4
7232	407	35	6
7233	407	36	5
7234	408	19	5
7235	408	20	5
7236	408	21	5
7237	408	22	5
7238	408	23	6
7239	408	24	5
7240	408	25	3
7241	408	26	0
7242	408	27	6
7243	408	28	6
7244	408	29	4
7245	408	30	5
7246	408	31	5
7247	408	32	3
7248	408	33	5
7249	408	34	4
7250	408	35	6
7251	408	36	5
7252	409	19	6
7253	409	20	7
7254	409	21	5
7255	409	22	4
7256	409	23	0
7257	409	24	6
7258	409	25	3
7259	409	26	0
7260	409	27	5
7261	409	28	8
7262	409	29	4
7263	409	30	5
7264	409	31	5
7265	409	32	4
7266	409	33	4
7267	409	34	3
7268	409	35	7
7269	409	36	5
7270	410	19	6
7271	410	20	0
7272	410	21	4
7273	410	22	3
7274	410	23	4
7275	410	24	5
7276	410	25	0
7277	410	26	5
7278	410	27	5
7279	410	28	7
7280	410	29	4
7281	410	30	4
7282	410	31	6
7283	410	32	5
7284	410	33	4
7285	410	34	4
7286	410	35	6
7287	410	36	4
7288	411	19	4
7289	411	20	5
7290	411	21	6
7291	411	22	3
7292	411	23	0
7293	411	24	3
7294	411	25	4
7295	411	26	0
7296	411	27	6
7297	411	28	6
7298	411	29	5
7299	411	30	5
7300	411	31	7
7301	411	32	3
7302	411	33	6
7303	411	34	4
7304	411	35	6
7305	411	36	5
7306	412	19	6
7307	412	20	5
7308	412	21	4
7309	412	22	3
7310	412	23	6
7311	412	24	5
7312	412	25	3
7313	412	26	6
7314	412	27	6
7315	412	28	7
7316	412	29	5
7317	412	30	4
7318	412	31	6
7319	412	32	4
7320	412	33	4
7321	412	34	5
7322	412	35	5
7323	412	36	6
7324	413	19	5
7325	413	20	5
7326	413	21	5
7327	413	22	4
7328	413	23	6
7329	413	24	5
7330	413	25	4
7331	413	26	5
7332	413	27	5
7333	413	28	6
7334	413	29	6
7335	413	30	5
7336	413	31	7
7337	413	32	4
7338	413	33	4
7339	413	34	3
7340	413	35	4
7341	413	36	4
7342	414	19	4
7343	414	20	6
7344	414	21	5
7345	414	22	3
7346	414	23	6
7347	414	24	6
7348	414	25	5
7349	414	26	6
7350	414	27	6
7351	414	28	7
7352	414	29	6
7353	414	30	5
7354	414	31	7
7355	414	32	5
7356	414	33	5
7357	414	34	5
7358	414	35	6
7359	414	36	6
7360	415	19	6
7361	415	20	6
7362	415	21	4
7363	415	22	3
7364	415	23	6
7365	415	24	6
7366	415	25	4
7367	415	26	5
7368	415	27	6
7369	415	28	7
7370	415	29	6
7371	415	30	5
7372	415	31	7
7373	415	32	3
7374	415	33	5
7375	415	34	0
7376	415	35	0
7377	415	36	0
7378	416	19	6
7379	416	20	8
7380	416	21	5
7381	416	22	4
7382	416	23	7
7383	416	24	6
7384	416	25	4
7385	416	26	6
7386	416	27	6
7387	416	28	7
7388	416	29	6
7389	416	30	7
7390	416	31	7
7391	416	32	4
7392	416	33	5
7393	416	34	0
7394	416	35	0
7395	416	36	0
7396	417	19	4
7397	417	20	5
7398	417	21	4
7399	417	22	3
7400	417	23	6
7401	417	24	4
7402	417	25	3
7403	417	26	0
7404	417	27	0
7405	417	28	6
7406	417	29	5
7407	417	30	5
7408	417	31	5
7409	417	32	4
7410	417	33	4
7411	417	34	3
7412	417	35	5
7413	417	36	4
7414	418	19	5
7415	418	20	0
7416	418	21	6
7417	418	22	5
7418	418	23	6
7419	418	24	4
7420	418	25	4
7421	418	26	0
7422	418	27	0
7423	418	28	7
7424	418	29	4
7425	418	30	5
7426	418	31	0
7427	418	32	4
7428	418	33	4
7429	418	34	4
7430	418	35	4
7431	418	36	5
7432	419	19	3
7433	419	20	4
7434	419	21	5
7435	419	22	3
7436	419	23	4
7437	419	24	4
7438	419	25	2
7439	419	26	5
7440	419	27	6
7441	419	28	7
7442	419	29	4
7443	419	30	4
7444	419	31	5
7445	419	32	2
7446	419	33	4
7447	419	34	4
7448	419	35	5
7449	419	36	4
7450	420	19	4
7451	420	20	5
7452	420	21	6
7453	420	22	4
7454	420	23	6
7455	420	24	4
7456	420	25	4
7457	420	26	5
7458	420	27	5
7459	420	28	5
7460	420	29	4
7461	420	30	4
7462	420	31	4
7463	420	32	3
7464	420	33	4
7465	420	34	4
7466	420	35	5
7467	420	36	4
7468	421	19	6
7469	421	20	6
7470	421	21	4
7471	421	22	4
7472	421	23	5
7473	421	24	3
7474	421	25	3
7475	421	26	5
7476	421	27	5
7477	421	28	6
7478	421	29	5
7479	421	30	5
7480	421	31	4
7481	421	32	3
7482	421	33	4
7483	421	34	3
7484	421	35	5
7485	421	36	5
7486	422	19	4
7487	422	20	5
7488	422	21	8
7489	422	22	6
7490	422	23	6
7491	422	24	4
7492	422	25	4
7493	422	26	7
7494	422	27	6
7495	422	28	6
7496	422	29	5
7497	422	30	5
7498	422	31	5
7499	422	32	3
7500	422	33	6
7501	422	34	4
7502	422	35	4
7503	422	36	4
7504	423	19	5
7505	423	20	5
7506	423	21	9
7507	423	22	3
7508	423	23	6
7509	423	24	5
7510	423	25	3
7511	423	26	5
7512	423	27	6
7513	423	28	6
7514	423	29	6
7515	423	30	5
7516	423	31	7
7517	423	32	3
7518	423	33	3
7519	423	34	3
7520	423	35	6
7521	423	36	6
7522	424	19	5
7523	424	20	5
7524	424	21	5
7525	424	22	5
7526	424	23	6
7527	424	24	6
7528	424	25	4
7529	424	26	10
7530	424	27	5
7531	424	28	9
7532	424	29	5
7533	424	30	6
7534	424	31	7
7535	424	32	4
7536	424	33	5
7537	424	34	4
7538	424	35	5
7539	424	36	4
7540	425	19	8
7541	425	20	6
7542	425	21	6
7543	425	22	6
7544	425	23	8
7545	425	24	5
7546	425	25	4
7547	425	26	10
7548	425	27	5
7549	425	28	9
7550	425	29	5
7551	425	30	7
7552	425	31	5
7553	425	32	6
7554	425	33	7
7555	425	34	5
7556	425	35	6
7557	425	36	5
7558	426	19	5
7559	426	20	6
7560	426	21	6
7561	426	22	10
7562	426	23	6
7563	426	24	6
7564	426	25	5
7565	426	26	8
7566	426	27	8
7567	426	28	9
7568	426	29	6
7569	426	30	6
7570	426	31	7
7571	426	32	4
7572	426	33	5
7573	426	34	4
7574	426	35	7
7575	426	36	5
7576	427	19	4
7577	427	20	7
7578	427	21	5
7579	427	22	5
7580	427	23	7
7581	427	24	4
7582	427	25	5
7583	427	26	6
7584	427	27	6
7585	427	28	6
7586	427	29	6
7587	427	30	5
7588	427	31	6
7589	427	32	4
7590	427	33	4
7591	427	34	4
7592	427	35	6
7593	427	36	5
7594	428	19	7
7595	428	20	0
7596	428	21	5
7597	428	22	5
7598	428	23	6
7599	428	24	5
7600	428	25	5
7601	428	26	7
7602	428	27	6
7603	428	28	7
7604	428	29	5
7605	428	30	4
7606	428	31	6
7607	428	32	5
7608	428	33	7
7609	428	34	4
7610	428	35	0
7611	428	36	6
7612	429	19	5
7613	429	20	6
7614	429	21	5
7615	429	22	4
7616	429	23	7
7617	429	24	5
7618	429	25	3
7619	429	26	5
7620	429	27	6
7621	429	28	7
7622	429	29	6
7623	429	30	5
7624	429	31	5
7625	429	32	4
7626	429	33	5
7627	429	34	4
7628	429	35	5
7629	429	36	5
7630	430	19	5
7631	430	20	5
7632	430	21	5
7633	430	22	3
7634	430	23	5
7635	430	24	5
7636	430	25	5
7637	430	26	6
7638	430	27	7
7639	430	28	6
7640	430	29	5
7641	430	30	5
7642	430	31	6
7643	430	32	4
7644	430	33	6
7645	430	34	4
7646	430	35	5
7647	430	36	5
7648	431	19	6
7649	431	20	8
7650	431	21	4
7651	431	22	5
7652	431	23	5
7653	431	24	6
7654	431	25	4
7655	431	26	8
7656	431	27	6
7657	431	28	8
7658	431	29	6
7659	431	30	7
7660	431	31	7
7661	431	32	4
7662	431	33	4
7663	431	34	4
7664	431	35	5
7665	431	36	6
7666	432	19	6
7667	432	20	6
7668	432	21	7
7669	432	22	6
7670	432	23	7
7671	432	24	5
7672	432	25	4
7673	432	26	8
7674	432	27	7
7675	432	28	9
7676	432	29	6
7677	432	30	5
7678	432	31	9
7679	432	32	4
7680	432	33	6
7681	432	34	4
7682	432	35	7
7683	432	36	6
7684	433	19	5
7685	433	20	5
7686	433	21	5
7687	433	22	5
7688	433	23	7
7689	433	24	4
7690	433	25	4
7691	433	26	8
7692	433	27	5
7693	433	28	6
7694	433	29	5
7695	433	30	6
7696	433	31	6
7697	433	32	3
7698	433	33	5
7699	433	34	4
7700	433	35	6
7701	433	36	4
7702	434	19	6
7703	434	20	9
7704	434	21	5
7705	434	22	3
7706	434	23	5
7707	434	24	6
7708	434	25	3
7709	434	26	6
7710	434	27	6
7711	434	28	5
7712	434	29	5
7713	434	30	4
7714	434	31	7
7715	434	32	4
7716	434	33	4
7717	434	34	4
7718	434	35	4
7719	434	36	6
7720	435	19	5
7721	435	20	6
7722	435	21	6
7723	435	22	6
7724	435	23	5
7725	435	24	6
7726	435	25	4
7727	435	26	6
7728	435	27	6
7729	435	28	6
7730	435	29	5
7731	435	30	4
7732	435	31	7
7733	435	32	4
7734	435	33	5
7735	435	34	4
7736	435	35	5
7737	435	36	5
7738	436	19	4
7739	436	20	5
7740	436	21	4
7741	436	22	5
7742	436	23	10
7743	436	24	4
7744	436	25	4
7745	436	26	7
7746	436	27	5
7747	436	28	7
7748	436	29	8
7749	436	30	7
7750	436	31	8
7751	436	32	6
7752	436	33	4
7753	436	34	4
7754	436	35	5
7755	436	36	5
7756	437	19	4
7757	437	20	4
7758	437	21	5
7759	437	22	4
7760	437	23	6
7761	437	24	5
7762	437	25	5
7763	437	26	5
7764	437	27	6
7765	437	28	6
7766	437	29	5
7767	437	30	4
7768	437	31	6
7769	437	32	3
7770	437	33	4
7771	437	34	4
7772	437	35	5
7773	437	36	5
7774	438	19	7
7775	438	20	5
7776	438	21	4
7777	438	22	4
7778	438	23	5
7779	438	24	4
7780	438	25	6
7781	438	26	6
7782	438	27	7
7783	438	28	5
7784	438	29	5
7785	438	30	4
7786	438	31	5
7787	438	32	4
7788	438	33	6
7789	438	34	4
7790	438	35	6
7791	438	36	5
7792	439	19	5
7793	439	20	6
7794	439	21	7
7795	439	22	5
7796	439	23	6
7797	439	24	5
7798	439	25	4
7799	439	26	7
7800	439	27	5
7801	439	28	5
7802	439	29	7
7803	439	30	4
7804	439	31	6
7805	439	32	4
7806	439	33	5
7807	439	34	4
7808	439	35	4
7809	439	36	5
7810	440	19	4
7811	440	20	5
7812	440	21	6
7813	440	22	5
7814	440	23	6
7815	440	24	4
7816	440	25	4
7817	440	26	6
7818	440	27	7
7819	440	28	8
7820	440	29	4
7821	440	30	5
7822	440	31	5
7823	440	32	5
7824	440	33	4
7825	440	34	6
7826	440	35	5
7827	440	36	4
7828	441	19	5
7829	441	20	4
7830	441	21	5
7831	441	22	6
7832	441	23	5
7833	441	24	6
7834	441	25	4
7835	441	26	6
7836	441	27	6
7837	441	28	8
7838	441	29	6
7839	441	30	5
7840	441	31	7
7841	441	32	5
7842	441	33	5
7843	441	34	4
7844	441	35	6
7845	441	36	4
7846	442	19	9
7847	442	20	4
7848	442	21	5
7849	442	22	5
7850	442	23	6
7851	442	24	5
7852	442	25	4
7853	442	26	5
7854	442	27	6
7855	442	28	5
7856	442	29	5
7857	442	30	5
7858	442	31	6
7859	442	32	3
7860	442	33	6
7861	442	34	4
7862	442	35	5
7863	442	36	5
7864	443	19	4
7865	443	20	5
7866	443	21	5
7867	443	22	5
7868	443	23	6
7869	443	24	6
7870	443	25	4
7871	443	26	8
7872	443	27	7
7873	443	28	7
7874	443	29	4
7875	443	30	6
7876	443	31	5
7877	443	32	4
7878	443	33	4
7879	443	34	6
7880	443	35	8
7881	443	36	5
7882	444	19	6
7883	444	20	3
7884	444	21	6
7885	444	22	6
7886	444	23	7
7887	444	24	10
7888	444	25	4
7889	444	26	7
7890	444	27	0
7891	444	28	8
7892	444	29	6
7893	444	30	6
7894	444	31	7
7895	444	32	3
7896	444	33	6
7897	444	34	3
7898	444	35	7
7899	444	36	7
7900	445	19	6
7901	445	20	5
7902	445	21	5
7903	445	22	5
7904	445	23	6
7905	445	24	8
7906	445	25	4
7907	445	26	8
7908	445	27	5
7909	445	28	7
7910	445	29	4
7911	445	30	5
7912	445	31	7
7913	445	32	4
7914	445	33	8
7915	445	34	4
7916	445	35	6
7917	445	36	6
7918	446	19	5
7919	446	20	6
7920	446	21	5
7921	446	22	4
7922	446	23	8
7923	446	24	7
7924	446	25	5
7925	446	26	9
7926	446	27	5
7927	446	28	7
7928	446	29	6
7929	446	30	6
7930	446	31	6
7931	446	32	3
7932	446	33	5
7933	446	34	0
7934	446	35	0
7935	446	36	0
7936	447	19	4
7937	447	20	5
7938	447	21	4
7939	447	22	4
7940	447	23	10
7941	447	24	4
7942	447	25	4
7943	447	26	10
7944	447	27	6
7945	447	28	6
7946	447	29	5
7947	447	30	5
7948	447	31	8
7949	447	32	7
7950	447	33	5
7951	447	34	3
7952	447	35	5
7953	447	36	4
7954	448	19	4
7955	448	20	7
7956	448	21	7
7957	448	22	3
7958	448	23	6
7959	448	24	4
7960	448	25	5
7961	448	26	7
7962	448	27	5
7963	448	28	6
7964	448	29	7
7965	448	30	6
7966	448	31	5
7967	448	32	4
7968	448	33	4
7969	448	34	5
7970	448	35	5
7971	448	36	4
7972	449	19	5
7973	449	20	6
7974	449	21	6
7975	449	22	4
7976	449	23	6
7977	449	24	5
7978	449	25	5
7979	449	26	8
7980	449	27	6
7981	449	28	7
7982	449	29	6
7983	449	30	6
7984	449	31	6
7985	449	32	4
7986	449	33	4
7987	449	34	5
7988	449	35	5
7989	449	36	5
7990	450	19	4
7991	450	20	7
7992	450	21	7
7993	450	22	6
7994	450	23	5
7995	450	24	6
7996	450	25	3
7997	450	26	6
7998	450	27	5
7999	450	28	6
8000	450	29	5
8001	450	30	5
8002	450	31	6
8003	450	32	4
8004	450	33	5
8005	450	34	4
8006	450	35	8
8007	450	36	7
8008	451	19	5
8009	451	20	6
8010	451	21	5
8011	451	22	5
8012	451	23	7
8013	451	24	7
8014	451	25	4
8015	451	26	7
8016	451	27	6
8017	451	28	9
8018	451	29	6
8019	451	30	5
8020	451	31	7
8021	451	32	4
8022	451	33	6
8023	451	34	4
8024	451	35	7
8025	451	36	5
8026	452	19	7
8027	452	20	6
8028	452	21	6
8029	452	22	5
8030	452	23	7
8031	452	24	7
8032	452	25	4
8033	452	26	5
8034	452	27	6
8035	452	28	9
8036	452	29	6
8037	452	30	4
8038	452	31	6
8039	452	32	4
8040	452	33	5
8041	452	34	4
8042	452	35	5
8043	452	36	5
8044	453	19	4
8045	453	20	6
8046	453	21	5
8047	453	22	5
8048	453	23	5
8049	453	24	4
8050	453	25	4
8051	453	26	5
8052	453	27	7
8053	453	28	7
8054	453	29	5
8055	453	30	5
8056	453	31	6
8057	453	32	3
8058	453	33	4
8059	453	34	4
8060	453	35	6
8061	453	36	4
8062	454	19	5
8063	454	20	4
8064	454	21	6
8065	454	22	4
8066	454	23	5
8067	454	24	6
8068	454	25	7
8069	454	26	6
8070	454	27	7
8071	454	28	8
8072	454	29	7
8073	454	30	5
8074	454	31	7
8075	454	32	6
8076	454	33	5
8077	454	34	4
8078	454	35	7
8079	454	36	5
8080	455	19	5
8081	455	20	5
8082	455	21	3
8083	455	22	5
8084	455	23	7
8085	455	24	4
8086	455	25	4
8087	455	26	6
8088	455	27	9
8089	455	28	8
8090	455	29	6
8091	455	30	4
8092	455	31	7
8093	455	32	5
8094	455	33	5
8095	455	34	5
8096	455	35	5
8097	455	36	4
8098	456	19	7
8099	456	20	6
8100	456	21	5
8101	456	22	5
8102	456	23	6
8103	456	24	5
8104	456	25	4
8105	456	26	7
8106	456	27	8
8107	456	28	8
8108	456	29	5
8109	456	30	4
8110	456	31	5
8111	456	32	4
8112	456	33	6
8113	456	34	5
8114	456	35	5
8115	456	36	6
8116	457	19	5
8117	457	20	6
8118	457	21	6
8119	457	22	3
8120	457	23	7
8121	457	24	5
8122	457	25	5
8123	457	26	7
8124	457	27	7
8125	457	28	8
8126	457	29	5
8127	457	30	6
8128	457	31	7
8129	457	32	8
8130	457	33	4
8131	457	34	3
8132	457	35	6
8133	457	36	6
8134	458	19	4
8135	458	20	5
8136	458	21	4
8137	458	22	4
8138	458	23	11
8139	458	24	6
8140	458	25	4
8141	458	26	7
8142	458	27	6
8143	458	28	5
8144	458	29	5
8145	458	30	6
8146	458	31	6
8147	458	32	4
8148	458	33	5
8149	458	34	3
8150	458	35	5
8151	458	36	4
8152	459	19	5
8153	459	20	7
8154	459	21	6
8155	459	22	4
8156	459	23	8
8157	459	24	6
8158	459	25	4
8159	459	26	7
8160	459	27	7
8161	459	28	6
8162	459	29	4
8163	459	30	4
8164	459	31	8
8165	459	32	3
8166	459	33	5
8167	459	34	4
8168	459	35	5
8169	459	36	6
8170	460	19	6
8171	460	20	8
8172	460	21	8
8173	460	22	4
8174	460	23	5
8175	460	24	6
8176	460	25	5
8177	460	26	7
8178	460	27	8
8179	460	28	6
8180	460	29	5
8181	460	30	5
8182	460	31	7
8183	460	32	5
8184	460	33	4
8185	460	34	5
8186	460	35	5
8187	460	36	5
8188	461	19	4
8189	461	20	6
8190	461	21	5
8191	461	22	6
8192	461	23	6
8193	461	24	4
8194	461	25	4
8195	461	26	7
8196	461	27	6
8197	461	28	6
8198	461	29	7
8199	461	30	6
8200	461	31	7
8201	461	32	4
8202	461	33	5
8203	461	34	5
8204	461	35	5
8205	461	36	5
8229	463	24	6
8230	463	25	4
8231	463	26	10
8232	463	27	6
8233	463	28	8
8234	463	29	6
8235	463	30	5
8236	463	31	7
8237	463	32	3
8206	462	19	5
8207	462	20	6
8208	462	21	6
8209	462	22	5
8210	462	23	7
8211	462	24	5
8212	462	25	5
8213	462	26	6
8214	462	27	6
8215	462	28	6
8216	462	29	5
8217	462	30	4
8218	462	31	5
8219	462	32	3
8220	462	33	5
8221	462	34	3
8222	462	35	7
8223	462	36	5
8224	463	19	5
8225	463	20	4
8226	463	21	4
8227	463	22	4
8228	463	23	8
8238	463	33	5
8239	463	34	4
8240	463	35	5
8241	463	36	5
8242	464	19	5
8243	464	20	6
8244	464	21	6
8245	464	22	4
8246	464	23	7
8247	464	24	5
8248	464	25	4
8249	464	26	9
8250	464	27	6
8251	464	28	7
8252	464	29	3
8253	464	30	4
8254	464	31	8
8255	464	32	3
8256	464	33	6
8257	464	34	3
8258	464	35	6
8259	464	36	5
8260	465	19	4
8261	465	20	5
8262	465	21	6
8263	465	22	4
8264	465	23	6
8265	465	24	4
8266	465	25	5
8267	465	26	8
8268	465	27	5
8269	465	28	7
8270	465	29	5
8271	465	30	5
8272	465	31	6
8273	465	32	4
8274	465	33	7
8275	465	34	3
8276	465	35	6
8277	465	36	6
8278	466	19	5
8279	466	20	5
8280	466	21	5
8281	466	22	4
8282	466	23	6
8283	466	24	6
8284	466	25	3
8285	466	26	7
8286	466	27	5
8287	466	28	8
8288	466	29	5
8289	466	30	7
8290	466	31	6
8291	466	32	3
8292	466	33	5
8293	466	34	5
8294	466	35	7
8295	466	36	4
8296	467	19	5
8297	467	20	5
8298	467	21	5
8299	467	22	5
8300	467	23	7
8301	467	24	5
8302	467	25	4
8303	467	26	7
8304	467	27	8
8305	467	28	8
8306	467	29	5
8307	467	30	7
8308	467	31	8
8309	467	32	3
8310	467	33	5
8311	467	34	5
8312	467	35	5
8313	467	36	5
8314	468	19	6
8315	468	20	5
8316	468	21	4
8317	468	22	4
8318	468	23	6
8319	468	24	5
8320	468	25	4
8321	468	26	4
8322	468	27	6
8323	468	28	7
8324	468	29	5
8325	468	30	6
8326	468	31	6
8327	468	32	3
8328	468	33	6
8329	468	34	3
8330	468	35	5
8331	468	36	4
8332	469	19	4
8333	469	20	5
8334	469	21	5
8335	469	22	3
8336	469	23	6
8337	469	24	4
8338	469	25	3
8339	469	26	6
8340	469	27	6
8341	469	28	7
8342	469	29	5
8343	469	30	4
8344	469	31	7
8345	469	32	4
8346	469	33	4
8347	469	34	4
8348	469	35	5
8349	469	36	5
8350	470	19	4
8351	470	20	7
8352	470	21	4
8353	470	22	4
8354	470	23	5
8355	470	24	5
8356	470	25	3
8357	470	26	8
8358	470	27	5
8359	470	28	7
8360	470	29	6
8361	470	30	4
8362	470	31	5
8363	470	32	3
8364	470	33	5
8365	470	34	5
8366	470	35	6
8367	470	36	5
8368	471	19	5
8369	471	20	4
8370	471	21	6
8371	471	22	5
8372	471	23	5
8373	471	24	4
8374	471	25	3
8375	471	26	7
8376	471	27	6
8377	471	28	6
8378	471	29	5
8379	471	30	5
8380	471	31	6
8381	471	32	4
8382	471	33	4
8383	471	34	5
8384	471	35	4
8385	471	36	5
8386	472	19	4
8387	472	20	6
8388	472	21	6
8389	472	22	4
8390	472	23	6
8391	472	24	5
8392	472	25	3
8393	472	26	6
8394	472	27	7
8395	472	28	7
8396	472	29	5
8397	472	30	4
8398	472	31	6
8399	472	32	4
8400	472	33	4
8401	472	34	4
8402	472	35	5
8403	472	36	4
8404	473	19	5
8405	473	20	6
8406	473	21	5
8407	473	22	4
8408	473	23	6
8409	473	24	7
8410	473	25	5
8411	473	26	6
8412	473	27	6
8413	473	28	7
8414	473	29	6
8415	473	30	6
8416	473	31	8
8417	473	32	4
8418	473	33	4
8419	473	34	4
8420	473	35	4
8421	473	36	5
8422	474	19	4
8423	474	20	5
8424	474	21	5
8425	474	22	7
8426	474	23	9
8427	474	24	5
8428	474	25	3
8429	474	26	5
8430	474	27	9
8431	474	28	5
8432	474	29	6
8433	474	30	5
8434	474	31	8
8435	474	32	4
8436	474	33	5
8437	474	34	6
8438	474	35	5
8439	474	36	4
8440	475	19	5
8441	475	20	5
8442	475	21	4
8443	475	22	4
8444	475	23	4
8445	475	24	4
8446	475	25	3
8447	475	26	4
8448	475	27	5
8449	475	28	6
8450	475	29	6
8451	475	30	6
8452	475	31	6
8453	475	32	5
8454	475	33	5
8455	475	34	4
8456	475	35	6
8457	475	36	4
8458	476	19	6
8459	476	20	4
8460	476	21	4
8461	476	22	4
8462	476	23	6
8463	476	24	3
8464	476	25	4
8465	476	26	4
8466	476	27	5
8467	476	28	7
8468	476	29	5
8469	476	30	4
8470	476	31	6
8471	476	32	3
8472	476	33	7
8473	476	34	4
8474	476	35	6
8475	476	36	4
8476	477	19	5
8477	477	20	6
8478	477	21	7
8479	477	22	5
8480	477	23	7
8481	477	24	5
8482	477	25	4
8483	477	26	6
8484	477	27	9
8485	477	28	7
8486	477	29	6
8487	477	30	5
8488	477	31	7
8489	477	32	6
8490	477	33	6
8491	477	34	4
8492	477	35	6
8493	477	36	6
8494	478	19	4
8495	478	20	4
8496	478	21	4
8497	478	22	5
8498	478	23	6
8499	478	24	5
8500	478	25	4
8501	478	26	6
8502	478	27	6
8503	478	28	7
8504	478	29	4
8505	478	30	5
8506	478	31	6
8507	478	32	4
8508	478	33	5
8509	478	34	7
8510	478	35	4
8511	478	36	4
8512	479	19	6
8513	479	20	8
8514	479	21	6
8515	479	22	4
8516	479	23	8
8517	479	24	6
8518	479	25	4
8519	479	26	5
8520	479	27	6
8521	479	28	7
8522	479	29	6
8523	479	30	6
8524	479	31	6
8525	479	32	4
8526	479	33	4
8527	479	34	6
8528	479	35	5
8529	479	36	5
8530	480	19	4
8531	480	20	5
8532	480	21	4
8533	480	22	3
8534	480	23	7
8535	480	24	5
8536	480	25	5
8537	480	26	5
8538	480	27	5
8539	480	28	10
8540	480	29	6
8541	480	30	5
8542	480	31	6
8543	480	32	4
8544	480	33	4
8545	480	34	4
8546	480	35	6
8547	480	36	6
8548	481	19	0
8549	481	20	6
8550	481	21	4
8551	481	22	3
8552	481	23	6
8553	481	24	4
8554	481	25	3
8555	481	26	5
8556	481	27	5
8557	481	28	7
8558	481	29	6
8559	481	30	5
8560	481	31	8
8561	481	32	4
8562	481	33	6
8563	481	34	4
8564	481	35	6
8565	481	36	4
8566	482	19	5
8567	482	20	6
8568	482	21	4
8569	482	22	3
8570	482	23	6
8571	482	24	5
8572	482	25	4
8573	482	26	5
8574	482	27	8
8575	482	28	5
8576	482	29	5
8577	482	30	5
8578	482	31	5
8579	482	32	4
8580	482	33	4
8581	482	34	3
8582	482	35	5
8583	482	36	4
8584	483	19	3
8585	483	20	5
8586	483	21	5
8587	483	22	3
8588	483	23	9
8589	483	24	6
8590	483	25	6
8591	483	26	6
8592	483	27	5
8593	483	28	7
8594	483	29	6
8595	483	30	6
8596	483	31	7
8597	483	32	3
8598	483	33	3
8599	483	34	3
8600	483	35	8
8601	483	36	9
8602	484	19	4
8603	484	20	5
8604	484	21	4
8605	484	22	4
8606	484	23	6
8607	484	24	4
8608	484	25	3
8609	484	26	4
8610	484	27	5
8611	484	28	5
8612	484	29	4
8613	484	30	4
8614	484	31	4
8615	484	32	3
8616	484	33	4
8617	484	34	3
8618	484	35	4
8619	484	36	4
8620	485	19	4
8621	485	20	4
8622	485	21	5
8623	485	22	4
8624	485	23	5
8625	485	24	3
8626	485	25	4
8627	485	26	6
8628	485	27	6
8629	485	28	6
8630	485	29	6
8631	485	30	4
8632	485	31	6
8633	485	32	3
8634	485	33	4
8635	485	34	4
8636	485	35	4
8637	485	36	4
8638	486	19	5
8639	486	20	6
8640	486	21	5
8641	486	22	4
8642	486	23	7
8643	486	24	5
8644	486	25	4
8645	486	26	6
8646	486	27	7
8647	486	28	7
8648	486	29	5
8649	486	30	5
8650	486	31	7
8651	486	32	4
8652	486	33	5
8653	486	34	4
8654	486	35	6
8655	486	36	5
8656	487	19	6
8657	487	20	6
8658	487	21	7
8659	487	22	4
8660	487	23	8
8661	487	24	7
8662	487	25	4
8663	487	26	0
8664	487	27	0
8665	487	28	9
8666	487	29	7
8667	487	30	7
8668	487	31	7
8669	487	32	4
8670	487	33	5
8671	487	34	4
8672	487	35	6
8673	487	36	6
8674	488	19	6
8675	488	20	5
8676	488	21	5
8677	488	22	4
8678	488	23	6
8679	488	24	5
8680	488	25	4
8681	488	26	0
8682	488	27	0
8683	488	28	6
8684	488	29	5
8685	488	30	5
8686	488	31	6
8687	488	32	4
8688	488	33	5
8689	488	34	4
8690	488	35	6
8691	488	36	5
8692	489	19	5
8693	489	20	5
8694	489	21	6
8695	489	22	4
8696	489	23	6
8697	489	24	5
8698	489	25	4
8699	489	26	0
8700	489	27	0
8701	489	28	6
8702	489	29	5
8703	489	30	5
8704	489	31	6
8705	489	32	4
8706	489	33	5
8707	489	34	5
8708	489	35	5
8709	489	36	6
8710	490	19	5
8711	490	20	6
8712	490	21	6
8713	490	22	4
8714	490	23	6
8715	490	24	5
8716	490	25	3
8717	490	26	6
8718	490	27	7
8719	490	28	6
8720	490	29	5
8721	490	30	6
8722	490	31	7
8723	490	32	0
8724	490	33	0
8725	490	34	0
8726	490	35	0
8727	490	36	0
8728	491	19	6
8729	491	20	5
8730	491	21	5
8731	491	22	4
8732	491	23	7
8733	491	24	4
8734	491	25	4
8735	491	26	5
8736	491	27	4
8737	491	28	7
8738	491	29	5
8739	491	30	4
8740	491	31	7
8741	491	32	0
8742	491	33	0
8743	491	34	0
8744	491	35	0
8745	491	36	0
8746	492	19	5
8747	492	20	5
8748	492	21	4
8749	492	22	4
8750	492	23	6
8751	492	24	5
8752	492	25	4
8753	492	26	5
8754	492	27	7
8755	492	28	7
8756	492	29	4
8757	492	30	5
8758	492	31	6
8759	492	32	4
8760	492	33	5
8761	492	34	4
8762	492	35	5
8763	492	36	4
8764	493	19	5
8765	493	20	4
8766	493	21	0
8767	493	22	3
8768	493	23	0
8769	493	24	4
8770	493	25	4
8771	493	26	5
8772	493	27	5
8773	493	28	6
8774	493	29	6
8775	493	30	4
8776	493	31	5
8777	493	32	3
8778	493	33	4
8779	493	34	3
8780	493	35	6
8781	493	36	5
8782	494	19	5
8783	494	20	5
8784	494	21	7
8785	494	22	5
8786	494	23	7
8787	494	24	5
8788	494	25	3
8789	494	26	7
8790	494	27	5
8791	494	28	5
8792	494	29	5
8793	494	30	6
8794	494	31	5
8795	494	32	5
8796	494	33	6
8797	494	34	5
8798	494	35	6
8799	494	36	4
8800	495	19	4
8801	495	20	6
8802	495	21	6
8803	495	22	5
8804	495	23	7
8805	495	24	5
8806	495	25	3
8807	495	26	8
8808	495	27	5
8809	495	28	7
8810	495	29	5
8811	495	30	5
8812	495	31	6
8813	495	32	3
8814	495	33	4
8815	495	34	4
8816	495	35	6
8817	495	36	5
8818	497	19	4
8819	497	20	5
8820	497	21	5
8821	497	22	6
8822	497	23	6
8823	497	24	4
8824	497	25	3
8825	497	26	6
8826	497	27	6
8827	497	28	8
8828	497	29	6
8829	497	30	7
8830	497	31	5
8831	497	32	5
8832	497	33	4
8833	497	34	5
8834	497	35	4
8835	497	36	6
8836	499	19	4
8837	499	20	6
8838	499	21	7
8839	499	22	4
8840	499	23	6
8841	499	24	4
8842	499	25	3
8843	499	26	5
8844	499	27	5
8845	499	28	6
8846	499	29	4
8847	499	30	6
8848	499	31	6
8849	499	32	4
8850	499	33	4
8851	499	34	3
8852	499	35	5
8853	499	36	3
8854	500	19	6
8855	500	20	7
8856	500	21	5
8857	500	22	3
8858	500	23	6
8859	500	24	4
8860	500	25	5
8861	500	26	5
8862	500	27	6
8863	500	28	4
8864	500	29	5
8865	500	30	5
8866	500	31	7
8867	500	32	5
8868	500	33	4
8869	500	34	5
8870	500	35	5
8871	500	36	5
8872	501	19	5
8873	501	20	6
8874	501	21	6
8875	501	22	4
8876	501	23	8
8877	501	24	4
8878	501	25	4
8879	501	26	5
8880	501	27	8
8881	501	28	7
8882	501	29	5
8883	501	30	6
8884	501	31	7
8885	501	32	5
8886	501	33	4
8887	501	34	0
8888	501	35	0
8889	501	36	0
8890	502	19	6
8891	502	20	5
8892	502	21	5
8893	502	22	3
8894	502	23	7
8895	502	24	4
8896	502	25	4
8897	502	26	0
8898	502	27	7
8899	502	28	8
8900	502	29	5
8901	502	30	7
8902	502	31	5
8903	502	32	4
8904	502	33	6
8905	502	34	0
8906	502	35	0
8907	502	36	0
8908	503	19	5
8909	503	20	5
8910	503	21	6
8911	503	22	4
8912	503	23	6
8913	503	24	4
8914	503	25	3
8915	503	26	6
8916	503	27	7
8917	503	28	5
8918	503	29	5
8919	503	30	5
8920	503	31	6
8921	503	32	3
8922	503	33	5
8923	503	34	5
8924	503	35	6
8925	503	36	5
8926	504	19	5
8927	504	20	6
8928	504	21	4
8929	504	22	5
8930	504	23	4
8931	504	24	4
8932	504	25	5
8933	504	26	6
8934	504	27	5
8935	504	28	6
8936	504	29	4
8937	504	30	5
8938	504	31	0
8939	504	32	5
8940	504	33	5
8941	504	34	6
8942	504	35	6
8943	504	36	5
8944	505	19	4
8945	505	20	7
8946	505	21	6
8947	505	22	5
8948	505	23	8
8949	505	24	6
8950	505	25	5
8951	505	26	6
8952	505	27	6
8953	505	28	8
8954	505	29	6
8955	505	30	5
8956	505	31	7
8957	505	32	3
8958	505	33	4
8959	505	34	5
8960	505	35	5
8961	505	36	4
8962	506	19	0
8963	506	20	6
8964	506	21	7
8965	506	22	5
8966	506	23	6
8967	506	24	5
8968	506	25	6
8969	506	26	6
8970	506	27	7
8971	506	28	8
8972	506	29	5
8973	506	30	6
8974	506	31	5
8975	506	32	4
8976	506	33	7
8977	506	34	4
8978	506	35	5
8979	506	36	5
8980	507	19	8
8981	507	20	7
8982	507	21	6
8983	507	22	5
8984	507	23	0
8985	507	24	6
8986	507	25	5
8987	507	26	6
8988	507	27	5
8989	507	28	8
8990	507	29	4
8991	507	30	4
8992	507	31	6
8993	507	32	4
8994	507	33	6
8995	507	34	4
8996	507	35	6
8997	507	36	6
8998	508	19	5
8999	508	20	6
9000	508	21	5
9001	508	22	4
9002	508	23	5
9003	508	24	4
9004	508	25	4
9005	508	26	6
9006	508	27	7
9007	508	28	0
9008	508	29	5
9009	508	30	4
9010	508	31	6
9011	508	32	3
9012	508	33	6
9013	508	34	3
9014	508	35	4
9015	508	36	6
9016	509	19	6
9017	509	20	6
9018	509	21	6
9019	509	22	4
9020	509	23	6
9021	509	24	5
9022	509	25	4
9023	509	26	6
9024	509	27	6
9025	509	28	7
9026	509	29	5
9027	509	30	5
9028	509	31	6
9029	509	32	4
9030	509	33	5
9031	509	34	4
9032	509	35	5
9033	509	36	5
9043	510	28	8
9044	510	29	6
9045	510	30	5
9046	510	31	7
9047	510	32	5
9048	510	33	6
9049	510	34	4
9050	510	35	7
9051	510	36	6
9109	514	22	5
9110	514	23	6
9034	510	19	7
9035	510	20	7
9036	510	21	7
9037	510	22	5
9038	510	23	8
9039	510	24	6
9040	510	25	4
9041	510	26	7
9042	510	27	7
9052	511	19	4
9053	511	20	5
9054	511	21	5
9055	511	22	4
9056	511	23	4
9057	511	24	5
9058	511	25	5
9059	511	26	0
9060	511	27	7
9061	511	28	9
9062	511	29	5
9063	511	30	6
9064	511	31	6
9065	511	32	3
9066	511	33	5
9067	511	34	5
9068	511	35	4
9069	511	36	4
9070	512	19	5
9071	512	20	5
9072	512	21	5
9073	512	22	4
9074	512	23	7
9075	512	24	4
9076	512	25	4
9077	512	26	6
9078	512	27	5
9079	512	28	7
9080	512	29	5
9081	512	30	5
9082	512	31	6
9083	512	32	4
9084	512	33	6
9085	512	34	4
9086	512	35	6
9087	512	36	4
9111	514	24	4
9112	514	25	4
9113	514	26	5
9114	514	27	6
9115	514	28	5
9116	514	29	4
9117	514	30	5
9106	514	19	6
9107	514	20	4
9108	514	21	5
9118	514	31	5
9119	514	32	4
9120	514	33	4
9121	514	34	3
9122	514	35	5
9123	514	36	4
9125	515	20	5
9126	515	21	6
9124	515	19	6
9127	515	22	4
9128	515	23	6
9129	515	24	5
9130	515	25	3
9131	515	26	0
9132	515	27	0
9133	515	28	6
9134	515	29	5
9135	515	30	5
9136	515	31	7
9137	515	32	4
9138	515	33	4
9139	515	34	6
9140	515	35	5
9141	515	36	6
9142	516	19	6
9143	516	20	5
9144	516	21	6
9145	516	22	5
9146	516	23	6
9147	516	24	6
9148	516	25	4
9149	516	26	0
9150	516	27	0
9151	516	28	7
9152	516	29	6
9153	516	30	7
9154	516	31	7
9155	516	32	6
9156	516	33	5
9157	516	34	5
9158	516	35	6
9159	516	36	6
9160	517	19	4
9161	517	20	5
9162	517	21	5
9163	517	22	3
9164	517	23	7
9165	517	24	7
9166	517	25	3
9167	517	26	5
9168	517	27	5
9169	517	28	0
9170	517	29	0
9171	517	30	0
9172	517	31	0
9173	517	32	3
9174	517	33	6
9175	517	34	4
9176	517	35	5
9177	517	36	5
\.


--
-- Data for Name: web_round; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_round (id, startdate, tournament_id, num) FROM stdin;
1	2010-05-19	19	2
2	2010-05-20	19	3
3	2010-05-21	19	4
4	2010-05-20	20	2
5	2010-05-21	20	3
6	2010-05-23	21	2
7	2010-05-27	23	2
8	2010-05-28	23	3
9	2010-05-29	23	4
10	2010-05-28	24	2
11	2010-05-29	24	3
\.


--
-- Data for Name: web_score; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_score (id, matchentry_id, hole_id, score) FROM stdin;
1	6	1	0
2	6	2	4
3	6	3	5
4	6	4	0
5	6	5	8
6	6	6	8
7	6	7	5
8	6	8	0
9	6	9	4
10	6	10	7
11	6	11	6
12	6	12	6
13	6	13	5
14	6	14	4
15	6	15	0
16	6	16	7
17	6	17	7
18	6	18	0
19	7	1	4
20	7	2	4
21	7	3	5
22	7	4	4
23	7	5	5
24	7	6	5
25	7	7	4
26	7	8	4
27	7	9	4
28	7	10	6
29	7	11	4
30	7	12	4
31	7	13	5
32	7	14	0
33	7	15	0
34	7	16	8
35	7	17	4
36	7	18	0
75	13	3	5
76	13	4	3
77	13	5	6
78	13	6	5
79	13	7	0
80	13	8	4
81	13	9	3
82	13	10	4
83	13	11	4
84	13	12	5
37	65	1	0
38	65	2	4
39	65	3	6
40	65	4	6
41	65	5	0
42	65	6	6
43	65	7	4
44	65	8	4
45	65	9	4
46	65	10	0
47	65	11	5
48	65	12	5
49	65	13	4
50	65	14	4
51	65	15	7
52	65	16	6
53	65	17	5
54	65	18	6
55	8	1	6
56	8	2	4
57	8	3	5
58	8	4	6
59	8	5	5
60	8	6	5
61	8	7	4
62	8	8	5
63	8	9	3
64	8	10	5
65	8	11	5
66	8	12	5
67	8	13	6
68	8	14	4
69	8	15	5
70	8	16	5
71	8	17	4
72	8	18	5
73	13	1	5
74	13	2	5
85	13	13	6
86	13	14	4
87	13	15	5
88	13	16	6
89	13	17	4
90	13	18	5
91	22	1	5
92	22	2	5
93	22	3	4
94	22	4	7
95	22	5	7
96	22	6	8
97	22	7	3
98	22	8	6
99	22	9	6
100	22	10	0
101	22	11	0
102	22	12	0
103	22	13	6
104	22	14	3
105	22	15	0
106	22	16	0
107	22	17	5
108	22	18	5
109	3	1	5
110	3	2	4
111	3	3	6
112	3	4	5
113	3	5	6
114	3	6	5
115	3	7	4
116	3	8	5
117	3	9	4
118	3	10	5
119	3	11	4
120	3	12	6
121	3	13	5
122	3	14	4
123	3	15	4
124	3	16	6
125	3	17	4
126	3	18	5
128	18	2	4
129	18	3	4
130	18	4	4
131	18	5	6
132	18	6	5
133	18	7	4
134	18	8	4
135	18	9	4
136	18	10	5
137	18	11	4
138	18	12	5
139	18	13	6
140	18	14	5
141	18	15	5
142	18	16	7
143	18	17	6
144	18	18	7
415	73	1	6
145	16	1	5
2136	195	12	0
146	16	2	5
147	16	3	4
148	16	4	5
149	16	5	5
150	16	6	5
151	16	7	3
152	16	8	4
153	16	9	3
154	16	10	7
155	16	11	6
156	16	12	0
157	16	13	5
158	16	14	5
159	16	15	0
160	16	16	4
161	16	17	5
162	16	18	5
127	18	1	6
163	79	1	7
164	79	2	4
165	79	3	4
166	79	4	6
167	79	5	7
168	79	6	6
169	79	7	4
170	79	8	5
171	79	9	5
172	79	10	3
173	79	11	5
174	79	12	4
175	79	13	6
176	79	14	4
177	79	15	6
178	79	16	8
179	79	17	5
180	79	18	5
181	11	1	0
182	11	2	0
183	11	3	6
184	11	4	4
185	11	5	8
186	11	6	5
187	11	7	6
188	11	8	0
189	11	9	5
190	11	10	3
191	11	11	5
192	11	12	5
193	11	13	6
194	11	14	5
195	11	15	5
196	11	16	9
197	11	17	7
198	11	18	7
199	14	1	7
200	14	2	5
201	14	3	5
202	14	4	6
203	14	5	7
204	14	6	0
205	14	7	0
206	14	8	6
207	14	9	3
208	14	10	5
209	14	11	3
210	14	12	4
211	14	13	5
212	14	14	5
213	14	15	6
214	14	16	0
215	14	17	4
216	14	18	4
217	64	1	5
218	64	2	5
219	64	3	5
220	64	4	5
221	64	5	7
222	64	6	0
223	64	7	4
224	64	8	4
225	64	9	5
226	64	10	4
227	64	11	4
228	64	12	4
229	64	13	5
230	64	14	4
231	64	15	0
232	64	16	7
233	64	17	4
234	64	18	5
416	73	2	4
236	17	2	6
237	17	3	5
238	17	4	4
239	17	5	6
240	17	6	5
241	17	7	4
242	17	8	4
243	17	9	4
244	17	10	5
245	17	11	4
246	17	12	6
247	17	13	7
248	17	14	6
249	17	15	5
250	17	16	7
251	17	17	5
252	17	18	9
253	68	1	0
254	68	2	5
255	68	3	0
256	68	4	6
257	68	5	6
258	68	6	0
259	68	7	3
260	68	8	4
261	68	9	0
262	68	10	6
263	68	11	5
264	68	12	6
265	68	13	0
266	68	14	4
267	68	15	0
268	68	16	8
269	68	17	5
270	68	18	0
271	10	1	8
272	10	2	5
273	10	3	5
274	10	4	5
275	10	5	0
276	10	6	7
277	10	7	5
278	10	8	3
279	10	9	4
280	10	10	4
281	10	11	5
282	10	12	4
283	10	13	5
284	10	14	4
285	10	15	4
286	10	16	0
287	10	17	5
288	10	18	5
289	21	1	5
290	21	2	4
417	73	3	5
291	21	3	4
292	21	4	4
293	21	5	5
294	21	6	5
295	21	7	3
296	21	8	4
297	21	9	3
298	21	10	4
299	21	11	5
300	21	12	3
301	21	13	6
302	21	14	5
303	21	15	5
304	21	16	7
305	21	17	3
306	21	18	5
307	23	1	5
308	23	2	4
309	23	3	4
310	23	4	5
311	23	5	5
312	23	6	5
313	23	7	2
314	23	8	6
315	23	9	4
316	23	10	5
317	23	11	4
318	23	12	4
319	23	13	4
320	23	14	4
321	23	15	0
322	23	16	7
323	23	17	4
324	23	18	5
325	9	1	5
326	9	2	3
327	9	3	4
328	9	4	4
329	9	5	6
330	9	6	5
331	9	7	4
332	9	8	4
333	9	9	4
334	9	10	0
335	9	11	4
336	9	12	5
337	9	13	4
338	9	14	4
339	9	15	4
340	9	16	7
341	9	17	0
342	9	18	6
343	19	1	5
344	19	2	3
345	19	3	4
346	19	4	4
347	19	5	5
348	19	6	6
349	19	7	0
350	19	8	3
351	19	9	5
352	19	10	5
353	19	11	4
354	19	12	4
355	19	13	5
356	19	14	0
357	19	15	6
358	19	16	4
359	19	17	5
360	19	18	7
361	67	1	6
362	67	2	5
363	67	3	6
364	67	4	5
365	67	5	0
366	67	6	6
367	67	7	0
368	67	8	6
369	67	9	4
370	67	10	4
371	67	11	3
372	67	12	5
373	67	13	5
374	67	14	3
375	67	15	5
376	67	16	7
377	67	17	6
378	67	18	5
379	62	1	7
380	62	2	3
381	62	3	4
382	62	4	4
383	62	5	6
384	62	6	5
385	62	7	3
386	62	8	4
387	62	9	3
388	62	10	4
389	62	11	3
390	62	12	4
391	62	13	4
392	62	14	3
393	62	15	4
394	62	16	7
395	62	17	4
396	62	18	5
397	77	1	5
398	77	2	4
399	77	3	5
400	77	4	5
401	77	5	7
402	77	6	0
403	77	7	0
404	77	8	0
405	77	9	6
406	77	10	5
407	77	11	3
408	77	12	6
409	77	13	4
410	77	14	4
411	77	15	5
412	77	16	6
413	77	17	5
414	77	18	5
235	17	1	7
418	73	4	5
419	73	5	5
420	73	6	0
421	73	7	4
422	73	8	0
423	73	9	5
424	73	10	4
425	73	11	5
426	73	12	5
427	73	13	6
428	73	14	4
429	73	15	5
430	73	16	0
431	73	17	4
432	73	18	5
876	83	12	5
434	75	2	4
435	75	3	5
436	75	4	5
437	75	5	0
438	75	6	5
877	83	13	5
534	69	12	3
535	69	13	5
536	69	14	3
451	74	1	7
452	74	2	4
453	74	3	5
454	74	4	5
455	74	5	0
456	74	6	4
457	74	7	3
458	74	8	5
459	74	9	4
460	74	10	0
461	74	11	3
462	74	12	4
463	74	13	5
464	74	14	4
465	74	15	5
466	74	16	6
467	74	17	0
468	74	18	6
433	75	1	6
439	75	7	3
440	75	8	4
441	75	9	4
442	75	10	6
443	75	11	3
444	75	12	4
445	75	13	5
446	75	14	4
447	75	15	6
448	75	16	5
449	75	17	4
450	75	18	6
469	57	1	8
470	57	2	0
471	57	3	0
472	57	4	0
473	57	5	0
474	57	6	6
475	57	7	4
476	57	8	0
477	57	9	4
478	57	10	4
479	57	11	4
480	57	12	5
481	57	13	0
482	57	14	4
483	57	15	5
484	57	16	7
485	57	17	5
486	57	18	5
487	53	1	7
488	53	2	3
489	53	3	4
490	53	4	4
491	53	5	6
492	53	6	5
493	53	7	3
494	53	8	5
495	53	9	4
496	53	10	5
497	53	11	4
498	53	12	5
499	53	13	5
500	53	14	3
501	53	15	4
502	53	16	6
503	53	17	5
504	53	18	4
505	42	1	7
506	42	2	4
507	42	3	5
508	42	4	5
509	42	5	6
510	42	6	5
511	42	7	4
512	42	8	5
513	42	9	3
514	42	10	0
515	42	11	3
516	42	12	4
517	42	13	4
518	42	14	4
519	42	15	3
520	42	16	5
521	42	17	4
522	42	18	5
523	69	1	4
524	69	2	4
525	69	3	5
526	69	4	5
527	69	5	5
528	69	6	4
529	69	7	3
530	69	8	4
531	69	9	4
532	69	10	4
533	69	11	5
537	69	15	0
538	69	16	5
539	69	17	2
540	69	18	4
541	39	1	6
542	39	2	4
543	39	3	5
544	39	4	4
545	39	5	5
546	39	6	4
547	39	7	5
548	39	8	4
549	39	9	4
550	39	10	4
551	39	11	5
552	39	12	4
553	39	13	4
554	39	14	3
555	39	15	5
556	39	16	6
557	39	17	5
558	39	18	5
559	54	1	0
560	54	2	0
561	54	3	8
562	54	4	6
563	54	5	0
564	54	6	4
565	54	7	4
566	54	8	7
567	54	9	6
568	54	10	5
569	54	11	5
570	54	12	5
571	54	13	5
572	54	14	3
573	54	15	0
574	54	16	6
575	54	17	0
576	54	18	5
577	40	1	6
578	40	2	4
579	40	3	7
580	40	4	5
581	40	5	5
582	40	6	6
583	40	7	5
584	40	8	7
585	40	9	5
586	40	10	6
587	40	11	6
588	40	12	7
589	40	13	5
590	40	14	7
591	40	15	4
592	40	16	7
593	40	17	5
594	40	18	6
595	58	1	5
596	58	2	3
597	58	3	5
598	58	4	4
599	58	5	7
600	58	6	4
601	58	7	5
602	58	8	4
603	58	9	3
604	58	10	4
605	58	11	3
606	58	12	5
607	58	13	4
608	58	14	3
609	58	15	6
610	58	16	0
611	58	17	5
612	58	18	5
613	35	1	0
614	35	2	0
615	35	3	5
616	35	4	6
617	35	5	8
618	35	6	0
619	35	7	5
620	35	8	6
621	35	9	5
622	35	10	0
623	35	11	5
624	35	12	6
625	35	13	6
626	35	14	6
627	35	15	7
628	35	16	7
629	35	17	6
630	35	18	0
631	72	1	6
632	72	2	4
633	72	3	5
634	72	4	4
635	72	5	7
636	72	6	5
637	72	7	4
638	72	8	4
639	72	9	6
640	72	10	6
641	72	11	2
642	72	12	5
643	72	13	5
644	72	14	4
645	72	15	7
646	72	16	0
647	72	17	5
648	72	18	5
649	36	1	6
650	36	2	4
651	36	3	6
652	36	4	4
653	36	5	5
654	36	6	5
655	36	7	3
656	36	8	4
657	36	9	5
658	36	10	6
659	36	11	4
660	36	12	4
661	36	13	5
662	36	14	3
663	36	15	4
664	36	16	0
665	36	17	3
666	36	18	4
667	59	1	6
668	59	2	4
669	59	3	5
670	59	4	5
671	59	5	8
672	59	6	7
673	59	7	4
674	59	8	6
675	59	9	4
676	59	10	5
677	59	11	5
678	59	12	5
679	59	13	6
680	59	14	4
681	59	15	5
682	59	16	5
683	59	17	5
684	59	18	6
704	50	2	5
705	50	3	4
685	37	1	5
686	37	2	3
687	37	3	4
688	37	4	5
689	37	5	0
690	37	6	5
691	37	7	5
692	37	8	6
693	37	9	3
694	37	10	5
695	37	11	4
696	37	12	0
697	37	13	5
698	37	14	0
699	37	15	6
700	37	16	8
701	37	17	6
702	37	18	6
703	50	1	4
706	50	4	4
707	50	5	6
708	50	6	7
709	50	7	4
710	50	8	0
711	50	9	4
712	50	10	4
713	50	11	0
714	50	12	5
715	50	13	4
716	50	14	4
717	50	15	6
718	50	16	8
719	50	17	5
720	50	18	6
721	55	1	8
722	55	2	4
723	55	3	7
724	55	4	5
725	55	5	6
726	55	6	4
727	55	7	4
728	55	8	4
729	55	9	3
1297	102	1	6
730	55	10	5
731	55	11	4
732	55	12	5
733	55	13	4
734	55	14	0
735	55	15	6
736	55	16	6
737	55	17	4
738	55	18	4
739	51	1	5
740	51	2	3
741	51	3	5
742	51	4	5
743	51	5	7
744	51	6	7
745	51	7	4
746	51	8	4
747	51	9	5
748	51	10	0
749	51	11	0
750	51	12	5
751	51	13	5
752	51	14	4
753	51	15	6
754	51	16	5
755	51	17	5
756	51	18	6
757	52	1	6
758	52	2	3
759	52	3	5
760	52	4	5
761	52	5	6
762	52	6	6
763	52	7	4
764	52	8	6
765	52	9	4
766	52	10	5
767	52	11	5
768	52	12	5
769	52	13	6
770	52	14	5
771	52	15	8
772	52	16	7
773	52	17	4
774	52	18	6
805	60	13	0
806	60	14	4
807	60	15	0
808	60	16	0
809	60	17	6
810	60	18	6
811	80	1	6
812	80	2	4
813	80	3	5
775	30	1	6
776	30	2	4
777	30	3	6
778	30	4	4
779	30	5	8
780	30	6	5
781	30	7	3
782	30	8	6
783	30	9	4
784	30	10	5
785	30	11	3
786	30	12	4
787	30	13	5
788	30	14	0
789	30	15	5
790	30	16	6
791	30	17	5
792	30	18	6
793	60	1	8
794	60	2	4
795	60	3	8
796	60	4	6
797	60	5	6
798	60	6	8
799	60	7	4
800	60	8	7
801	60	9	0
802	60	10	0
803	60	11	4
804	60	12	6
814	80	4	5
815	80	5	6
816	80	6	0
817	80	7	0
818	80	8	5
819	80	9	4
820	80	10	5
821	80	11	5
822	80	12	5
823	80	13	4
824	80	14	3
825	80	15	5
826	80	16	7
827	80	17	4
828	80	18	6
829	45	1	6
830	45	2	4
831	45	3	6
832	45	4	5
833	45	5	8
834	45	6	5
835	45	7	3
836	45	8	6
837	45	9	4
838	45	10	0
839	45	11	5
840	45	12	0
841	45	13	5
842	45	14	4
843	45	15	6
844	45	16	5
845	45	17	4
846	45	18	5
847	82	1	8
848	82	2	5
849	82	3	6
850	82	4	5
851	82	5	7
852	82	6	6
853	82	7	3
854	82	8	5
855	82	9	6
856	82	10	5
857	82	11	6
858	82	12	5
859	82	13	6
860	82	14	5
861	82	15	6
862	82	16	8
863	82	17	5
864	82	18	0
865	83	1	6
866	83	2	3
867	83	3	5
868	83	4	6
869	83	5	7
870	83	6	5
871	83	7	4
872	83	8	8
873	83	9	4
874	83	10	5
875	83	11	7
878	83	14	4
879	83	15	6
880	83	16	6
881	83	17	9
882	83	18	4
883	85	1	8
884	85	2	4
885	85	3	6
886	85	4	5
887	85	5	6
888	85	6	4
889	85	7	4
890	85	8	5
891	85	9	4
892	85	10	0
893	85	11	5
894	85	12	5
895	85	13	5
896	85	14	4
897	85	15	6
898	85	16	6
899	85	17	4
900	85	18	7
901	86	1	7
902	86	2	4
903	86	3	5
904	86	4	4
905	86	5	6
906	86	6	5
907	86	7	3
908	86	8	5
909	86	9	3
910	86	10	4
911	86	11	3
912	86	12	4
913	86	13	5
914	86	14	5
915	86	15	5
916	86	16	5
917	86	17	5
918	86	18	5
919	95	1	9
920	95	2	4
921	95	3	7
922	95	4	6
923	95	5	10
924	95	6	9
925	95	7	7
926	95	8	7
927	95	9	5
928	95	10	7
929	95	11	7
930	95	12	8
931	95	13	7
932	95	14	7
933	95	15	8
934	95	16	10
935	95	17	6
936	95	18	6
938	111	2	5
1298	102	2	6
939	111	3	7
940	111	4	5
1299	102	3	6
941	111	5	0
942	111	6	0
1300	102	4	6
943	111	7	5
944	111	8	8
1301	102	5	8
945	111	9	4
946	111	10	5
1302	102	6	7
947	111	11	6
948	111	12	5
1303	102	7	5
949	111	13	6
950	111	14	4
1304	102	8	6
951	111	15	5
952	111	16	6
1305	102	9	4
953	111	17	5
954	111	18	0
1306	102	10	5
973	127	1	6
955	87	1	5
956	87	2	4
957	87	3	5
958	87	4	5
959	87	5	5
960	87	6	5
961	87	7	5
962	87	8	7
963	87	9	3
964	87	10	5
965	87	11	5
966	87	12	5
967	87	13	4
968	87	14	3
969	87	15	5
970	87	16	5
971	87	17	4
972	87	18	7
974	127	2	5
1307	102	11	4
975	127	3	7
976	127	4	4
1308	102	12	5
977	127	5	5
978	127	6	8
1309	102	13	6
979	127	7	4
980	127	8	4
1310	102	14	5
981	127	9	4
982	127	10	7
1311	102	15	6
983	127	11	4
984	127	12	5
1312	102	16	5
985	127	13	6
986	127	14	4
1313	102	17	5
987	127	15	7
988	127	16	8
1314	102	18	5
989	127	17	5
990	127	18	4
1351	92	1	9
991	120	1	6
992	120	2	4
1352	92	2	4
993	120	3	6
994	120	4	7
1353	92	3	6
995	120	5	8
996	120	6	7
1354	92	4	4
997	120	7	0
998	120	8	8
1355	92	5	9
999	120	9	5
1000	120	10	6
1356	92	6	6
1001	120	11	4
1002	120	12	5
1357	92	7	4
1003	120	13	6
1004	120	14	5
1358	92	8	5
1005	120	15	6
1006	120	16	7
1359	92	9	3
1007	120	17	5
1008	120	18	7
1360	92	10	4
1009	115	1	5
1010	115	2	3
1361	92	11	5
1011	115	3	4
1012	115	4	4
1362	92	12	7
1013	115	5	9
1014	115	6	5
1015	115	7	3
1016	115	8	5
1017	115	9	6
1018	115	10	6
1019	115	11	5
1020	115	12	6
1021	115	13	4
1022	115	14	7
1023	115	15	4
1153	126	1	6
1025	115	17	4
1154	126	2	3
1026	115	18	6
1155	126	3	6
1081	114	1	5
1027	107	1	7
1028	107	2	5
1029	107	3	6
1030	107	4	5
1031	107	5	4
1032	107	6	4
1033	107	7	4
1034	107	8	4
1035	107	9	6
1036	107	10	5
1037	107	11	3
1038	107	12	4
1039	107	13	4
1040	107	14	6
1041	107	15	6
1042	107	16	7
1043	107	17	4
1044	107	18	4
1045	90	1	8
1046	90	2	4
1047	90	3	4
1048	90	4	5
1049	90	5	7
1050	90	6	5
1051	90	7	5
1052	90	8	6
1053	90	9	4
1054	90	10	7
1055	90	11	5
1056	90	12	5
1057	90	13	4
1058	90	14	4
1059	90	15	5
1060	90	16	6
1061	90	17	4
1062	90	18	3
1063	100	1	7
1064	100	2	5
1065	100	3	8
1066	100	4	5
1067	100	5	6
1068	100	6	7
1069	100	7	4
1070	100	8	6
1071	100	9	6
1072	100	10	4
1073	100	11	4
1074	100	12	5
1075	100	13	5
1076	100	14	5
1077	100	15	5
1078	100	16	8
1079	100	17	6
1080	100	18	8
1156	126	4	4
1082	114	2	5
1157	126	5	4
1083	114	3	3
1158	126	6	6
1084	114	4	6
1159	126	7	3
1085	114	5	7
1160	126	8	6
1086	114	6	5
1161	126	9	4
1087	114	7	5
1162	126	10	4
1088	114	8	5
1163	126	11	3
1089	114	9	0
1164	126	12	4
1090	114	10	5
1165	126	13	6
1091	114	11	4
1166	126	14	5
1092	114	12	6
1167	126	15	5
1093	114	13	4
1168	126	16	5
1094	114	14	3
1095	114	15	4
1315	88	1	6
1096	114	16	5
1097	114	17	6
1316	88	2	5
1098	114	18	4
1317	88	3	6
1099	97	1	8
1100	97	2	5
1101	97	3	5
1102	97	4	6
1103	97	5	6
1104	97	6	6
1105	97	7	5
1106	97	8	6
1107	97	9	5
1108	97	10	6
1109	97	11	5
1110	97	12	7
1111	97	13	7
1112	97	14	5
1113	97	15	8
1114	97	16	7
1115	97	17	6
1116	97	18	6
1117	101	1	6
1118	101	2	4
1119	101	3	5
1120	101	4	3
1121	101	5	6
1122	101	6	5
1123	101	7	3
1124	101	8	4
1125	101	9	4
1126	101	10	5
1127	101	11	4
1128	101	12	3
1129	101	13	5
1130	101	14	3
1131	101	15	4
1132	101	16	5
1133	101	17	4
1134	101	18	6
1135	94	1	5
1136	94	2	4
1137	94	3	6
1138	94	4	4
1139	94	5	7
1140	94	6	5
1141	94	7	5
1142	94	8	6
1143	94	9	5
1144	94	10	4
1145	94	11	4
1146	94	12	7
1147	94	13	5
1148	94	14	5
1149	94	15	4
1150	94	16	7
1151	94	17	5
1152	94	18	6
1318	88	4	5
1319	88	5	8
1320	88	6	7
1321	88	7	4
1322	88	8	4
1323	88	9	5
1324	88	10	4
1325	88	11	5
1326	88	12	4
1327	88	13	6
1328	88	14	4
1329	88	15	6
1330	88	16	5
1331	88	17	5
1332	88	18	6
1363	92	13	5
1024	115	16	4
1333	91	1	4
1171	104	1	0
1172	104	2	5
1173	104	3	7
1174	104	4	7
1175	104	5	6
1176	104	6	6
1177	104	7	5
1178	104	8	0
1179	104	9	4
1180	104	10	6
1181	104	11	7
1182	104	12	7
1183	104	13	5
1184	104	14	5
1185	104	15	7
1186	104	16	7
1187	104	17	7
1188	104	18	7
1189	93	1	6
1190	93	2	4
1191	93	3	5
1192	93	4	5
1193	93	5	7
1194	93	6	5
1195	93	7	5
1196	93	8	4
1197	93	9	3
1198	93	10	4
1199	93	11	4
1200	93	12	5
1201	93	13	4
1202	93	14	3
1203	93	15	4
1204	93	16	5
1205	93	17	5
1206	93	18	4
1207	108	1	5
1208	108	2	5
1209	108	3	3
1210	108	4	4
1211	108	5	4
1212	108	6	5
1213	108	7	3
1214	108	8	4
1215	108	9	4
1216	108	10	8
1217	108	11	2
1218	108	12	4
1219	108	13	5
1220	108	14	4
1221	108	15	4
1222	108	16	7
1223	108	17	4
1224	108	18	4
1169	126	17	6
1272	118	12	6
1170	126	18	6
1273	118	13	5
1334	91	2	5
1274	118	14	4
1275	118	15	5
1335	91	3	5
1276	118	16	5
1277	118	17	4
1336	91	4	6
1278	118	18	7
1337	91	5	8
1338	91	6	6
1339	91	7	0
1340	91	8	0
1341	91	9	4
1342	91	10	4
1343	91	11	4
1344	91	12	4
1345	91	13	6
1346	91	14	3
1347	91	15	7
1348	91	16	7
1349	91	17	4
1350	91	18	4
1364	92	14	3
1365	92	15	4
1366	92	16	5
1367	92	17	7
1368	92	18	5
1369	98	1	9
1370	98	2	6
1371	98	3	5
1372	98	4	6
1373	98	5	6
1374	98	6	4
1375	98	7	5
1376	98	8	5
1377	98	9	4
1378	98	10	5
1379	98	11	8
1380	98	12	7
1381	98	13	6
1382	98	14	7
1383	98	15	7
1384	98	16	6
1385	98	17	5
1386	98	18	5
1387	99	1	7
1388	99	2	4
1389	99	3	5
1390	99	4	5
1391	99	5	4
1392	99	6	5
1393	99	7	4
1394	99	8	5
1395	99	9	7
1396	99	10	6
937	111	1	8
1225	121	1	5
1226	121	2	5
1227	121	3	7
1228	121	4	3
1229	121	5	6
1230	121	6	7
1231	121	7	7
1232	121	8	7
1233	121	9	5
1234	121	10	6
1235	121	11	7
1236	121	12	5
1237	121	13	6
1238	121	14	5
1239	121	15	5
1240	121	16	7
1241	121	17	6
1242	121	18	7
1243	112	1	7
1244	112	2	5
1245	112	3	6
1246	112	4	6
1247	112	5	6
1248	112	6	5
1249	112	7	4
1250	112	8	7
1251	112	9	5
1252	112	10	6
1253	112	11	5
1254	112	12	5
1255	112	13	4
1256	112	14	5
1257	112	15	5
1258	112	16	6
1259	112	17	6
1260	112	18	7
1261	118	1	8
1262	118	2	4
1263	118	3	7
1264	118	4	5
1265	118	5	8
1266	118	6	0
1267	118	7	4
1268	118	8	0
1269	118	9	3
1270	118	10	5
1271	118	11	6
1397	99	11	4
1398	99	12	4
1399	99	13	4
1400	99	14	4
1401	99	15	4
1402	99	16	6
1403	99	17	4
1404	99	18	6
1405	103	1	9
1406	103	2	6
1407	103	3	7
1408	103	4	6
1409	103	5	6
1410	103	6	7
1411	103	7	4
1412	103	8	5
1413	103	9	4
1414	103	10	7
1415	103	11	5
1416	103	12	5
1417	103	13	6
1418	103	14	4
1419	103	15	6
1420	103	16	0
1421	103	17	6
1422	103	18	5
1423	105	1	5
1424	105	2	7
1425	105	3	5
1426	105	4	10
1427	105	5	6
1428	105	6	7
1429	105	7	3
1430	105	8	7
1431	105	9	7
1432	105	10	6
1433	105	11	4
1434	105	12	5
1435	105	13	7
1436	105	14	9
1437	105	15	6
1438	105	16	8
1439	105	17	0
1440	105	18	0
1441	110	1	7
1442	110	2	4
1443	110	3	4
1444	110	4	5
1445	110	5	8
1446	110	6	8
1447	110	7	6
1448	110	8	6
1449	110	9	5
1450	110	10	5
1451	110	11	3
1452	110	12	5
1453	110	13	7
1454	110	14	4
1455	110	15	5
1456	110	16	0
1457	110	17	6
1458	110	18	6
1459	106	1	7
1460	106	2	5
1461	106	3	5
1462	106	4	5
1463	106	5	0
1464	106	6	6
1465	106	7	6
1466	106	8	7
1467	106	9	6
1468	106	10	7
1469	106	11	6
1470	106	12	6
1471	106	13	7
1472	106	14	5
1473	106	15	7
1474	106	16	5
1475	106	17	8
1476	106	18	6
1477	113	1	8
1478	113	2	5
1479	113	3	8
1480	113	4	4
1481	113	5	0
1482	113	6	5
1483	113	7	5
1484	113	8	8
1485	113	9	3
1486	113	10	4
1487	113	11	4
1488	113	12	0
1489	113	13	6
1490	113	14	3
1491	113	15	8
1492	113	16	0
1493	113	17	4
1494	113	18	0
1495	116	1	5
1496	116	2	3
1497	116	3	5
1498	116	4	5
1499	116	5	5
1500	116	6	6
1501	116	7	4
1502	116	8	4
1503	116	9	5
1504	116	10	5
1505	116	11	4
1506	116	12	5
1507	116	13	4
1508	116	14	4
1509	116	15	4
1510	116	16	8
1511	116	17	5
1512	116	18	5
1513	117	1	7
1514	117	2	4
1515	117	3	4
1516	117	4	6
1517	117	5	5
1518	117	6	5
1519	117	7	5
1520	117	8	5
1521	117	9	4
1522	117	10	4
1523	117	11	3
1524	117	12	5
1525	117	13	4
1526	117	14	3
1527	117	15	5
1528	117	16	5
1529	117	17	4
1530	117	18	5
1531	124	1	5
1532	124	2	6
1533	124	3	4
1534	124	4	6
1535	124	5	6
1536	124	6	6
1537	124	7	3
1538	124	8	6
1539	124	9	5
1540	124	10	5
1541	124	11	4
1542	124	12	8
1543	124	13	6
1544	124	14	3
1545	124	15	8
1546	124	16	9
1547	124	17	7
1548	124	18	6
1603	145	1	6
1550	122	2	4
1551	122	3	5
1552	122	4	5
1553	122	5	5
1604	145	2	4
1605	145	3	5
1606	145	4	0
1607	145	5	8
1608	145	6	7
1609	145	7	0
1610	145	8	4
1549	122	1	6
1554	122	6	5
1555	122	7	4
1556	122	8	4
1557	122	9	4
1558	122	10	4
1559	122	11	3
1560	122	12	0
1561	122	13	6
1562	122	14	4
1563	122	15	3
1564	122	16	5
1565	122	17	4
1566	122	18	6
1567	119	1	8
1568	119	2	5
1569	119	3	6
1570	119	4	4
1571	119	5	7
1572	119	6	6
1573	119	7	5
1574	119	8	0
1575	119	9	4
1576	119	10	8
1577	119	11	5
1578	119	12	5
1579	119	13	5
1580	119	14	4
1581	119	15	4
1582	119	16	5
1583	119	17	4
1584	119	18	5
1585	123	1	7
1586	123	2	3
1587	123	3	7
1588	123	4	6
1589	123	5	6
1590	123	6	5
1591	123	7	4
1592	123	8	4
1593	123	9	4
1594	123	10	5
1595	123	11	4
1596	123	12	5
1597	123	13	0
1598	123	14	3
1599	123	15	0
1600	123	16	8
1601	123	17	5
1602	123	18	7
1611	145	9	5
1612	145	10	4
1613	145	11	3
1614	145	12	6
1615	145	13	4
1616	145	14	3
1617	145	15	5
1618	145	16	5
1619	145	17	6
1620	145	18	5
1621	155	1	7
1622	155	2	4
1623	155	3	6
1624	155	4	6
1625	155	5	7
1626	155	6	5
1627	155	7	0
1628	155	8	6
1629	155	9	0
1630	155	10	7
1631	155	11	6
1632	155	12	7
1633	155	13	5
1634	155	14	4
1635	155	15	5
1636	155	16	6
1637	155	17	6
1638	155	18	6
1639	152	1	0
1640	152	2	4
1641	152	3	7
1642	152	4	5
1643	152	5	7
1644	152	6	7
1645	152	7	6
1646	152	8	6
1647	152	9	6
1648	152	10	4
1649	152	11	0
1650	152	12	5
1651	152	13	5
1652	152	14	5
1653	152	15	5
1654	152	16	7
1655	152	17	5
1656	152	18	7
1658	181	2	5
1659	181	3	5
1660	181	4	4
1661	181	5	5
1662	181	6	5
1663	181	7	3
1664	181	8	4
1665	181	9	3
1666	181	10	5
1667	181	11	0
1668	181	12	4
1669	181	13	5
1670	181	14	0
1671	181	15	0
1672	181	16	6
1673	181	17	4
1674	181	18	5
2935	243	1	7
1675	129	1	0
1676	129	2	4
1677	129	3	5
1678	129	4	5
1679	129	5	6
1680	129	6	6
1681	129	7	5
1682	129	8	5
1683	129	9	3
1684	129	10	4
1685	129	11	3
1686	129	12	4
1687	129	13	5
1688	129	14	3
1689	129	15	4
1690	129	16	5
1691	129	17	3
1692	129	18	4
1698	131	6	5
1699	131	7	4
1700	131	8	4
2137	195	13	4
1694	131	2	5
1695	131	3	5
1696	131	4	4
1697	131	5	6
1762	138	16	5
1763	138	17	4
1764	138	18	6
1765	149	1	6
1766	149	2	4
1767	149	3	4
1768	149	4	6
1769	149	5	0
1770	149	6	5
1771	149	7	5
1772	149	8	0
1773	149	9	5
1774	149	10	5
1775	149	11	0
1776	149	12	0
1777	149	13	6
1778	149	14	5
1779	149	15	5
1780	149	16	8
1781	149	17	6
1782	149	18	0
1783	164	1	5
1830	154	12	4
1831	154	13	5
1832	154	14	4
1833	154	15	5
1834	154	16	5
1835	154	17	0
1711	162	1	8
1712	162	2	3
1713	162	3	6
1714	162	4	7
1715	162	5	9
1716	162	6	8
1717	162	7	6
1718	162	8	8
1719	162	9	6
1720	162	10	7
1721	162	11	6
1722	162	12	5
1723	162	13	5
1724	162	14	7
1725	162	15	6
1726	162	16	9
1727	162	17	6
1728	162	18	7
1729	151	1	6
1730	151	2	4
1731	151	3	7
1732	151	4	6
1733	151	5	6
1734	151	6	6
1735	151	7	6
1736	151	8	4
1737	151	9	5
1738	151	10	5
1739	151	11	3
1740	151	12	5
1741	151	13	5
1742	151	14	4
1743	151	15	5
1744	151	16	7
1745	151	17	5
1746	151	18	5
1747	138	1	7
1748	138	2	4
1749	138	3	7
1750	138	4	5
1751	138	5	6
1752	138	6	5
1753	138	7	4
1754	138	8	4
1755	138	9	4
1756	138	10	6
1757	138	11	5
1758	138	12	4
1759	138	13	5
1760	138	14	5
1761	138	15	3
1784	164	2	3
1785	164	3	0
1786	164	4	8
1787	164	5	8
1788	164	6	0
1789	164	7	4
1790	164	8	5
1791	164	9	0
1792	164	10	6
1793	164	11	3
1794	164	12	3
1795	164	13	5
1796	164	14	4
1797	164	15	5
1798	164	16	5
1799	164	17	5
1800	164	18	4
1801	132	1	4
1802	132	2	0
1803	132	3	4
1804	132	4	4
1805	132	5	0
1806	132	6	4
1807	132	7	5
1808	132	8	4
1809	132	9	5
1810	132	10	4
1811	132	11	4
1812	132	12	5
1813	132	13	0
1814	132	14	4
1815	132	15	5
1816	132	16	5
1817	132	17	3
1818	132	18	5
1693	131	1	4
1701	131	9	4
1702	131	10	5
1703	131	11	3
1704	131	12	0
1705	131	13	7
1706	131	14	4
1707	131	15	4
1708	131	16	5
1709	131	17	5
1710	131	18	5
1820	154	2	6
1821	154	3	4
1822	154	4	5
1823	154	5	5
1824	154	6	5
1825	154	7	4
1826	154	8	6
1827	154	9	4
1828	154	10	0
1829	154	11	4
1836	154	18	7
2138	195	14	4
1837	163	1	8
1838	163	2	0
1839	163	3	5
1840	163	4	6
1841	163	5	7
1842	163	6	5
1843	163	7	0
1844	163	8	5
6031	425	1	6
1845	163	9	4
1846	163	10	0
1847	163	11	4
1848	163	12	4
1849	163	13	7
1850	163	14	0
1851	163	15	6
1852	163	16	8
1853	163	17	5
1854	163	18	5
1855	144	1	4
1856	144	2	3
1857	144	3	6
1858	144	4	0
1859	144	5	6
1860	144	6	0
1861	144	7	4
1862	144	8	4
1863	144	9	4
1864	144	10	5
1865	144	11	6
1866	144	12	4
1867	144	13	5
1868	144	14	4
1869	144	15	5
1870	144	16	5
1871	144	17	4
1872	144	18	5
1819	154	1	6
1873	141	1	6
1874	141	2	4
1875	141	3	5
1876	141	4	4
1877	141	5	7
1878	141	6	4
1879	141	7	4
1880	141	8	5
1881	141	9	5
1882	141	10	7
1883	141	11	4
1884	141	12	5
1885	141	13	4
1886	141	14	4
1887	141	15	5
1888	141	16	6
1889	141	17	4
1890	141	18	7
1891	140	1	7
1892	140	2	0
1893	140	3	5
1894	140	4	5
1895	140	5	0
1896	140	6	7
1897	140	7	0
1898	140	8	4
1899	140	9	0
1900	140	10	5
1901	140	11	0
1902	140	12	0
1903	140	13	0
1904	140	14	4
1905	140	15	5
1906	140	16	5
1907	140	17	5
1908	140	18	0
1909	150	1	10
1910	150	2	4
1911	150	3	0
1912	150	4	6
1913	150	5	0
1914	150	6	6
1915	150	7	5
1916	150	8	6
1917	150	9	4
1918	150	10	0
1919	150	11	4
1920	150	12	0
1921	150	13	4
1922	150	14	0
1923	150	15	0
1924	150	16	8
1925	150	17	6
1926	150	18	0
1927	147	1	8
1928	147	2	4
1929	147	3	6
1930	147	4	5
1931	147	5	7
1932	147	6	6
1933	147	7	4
1934	147	8	3
1935	147	9	4
1936	147	10	6
1937	147	11	5
1938	147	12	3
1939	147	13	5
1940	147	14	5
1941	147	15	7
1942	147	16	8
1943	147	17	6
1944	147	18	0
1945	136	1	5
1946	136	2	3
1947	136	3	4
1948	136	4	4
1949	136	5	0
1950	136	6	6
1951	136	7	3
1952	136	8	4
1953	136	9	5
1954	136	10	8
1955	136	11	2
1956	136	12	4
1957	136	13	5
1958	136	14	3
1959	136	15	4
1960	136	16	0
1961	136	17	5
1962	136	18	6
1963	157	1	6
1964	157	2	5
1965	157	3	6
1966	157	4	5
1967	157	5	0
1968	157	6	5
1969	157	7	0
1970	157	8	0
1971	157	9	5
1972	157	10	4
1973	157	11	4
1974	157	12	0
1975	157	13	0
1976	157	14	4
1977	157	15	6
1978	157	16	0
1979	157	17	4
1980	157	18	0
1981	148	1	6
1982	148	2	3
1983	148	3	7
1984	148	4	6
1985	148	5	8
1986	148	6	0
1987	148	7	5
1988	148	8	6
1989	148	9	0
2936	243	2	4
1990	148	10	8
1991	148	11	4
1992	148	12	5
1993	148	13	0
1994	148	14	5
1995	148	15	6
1996	148	16	7
1997	148	17	6
1998	148	18	8
1999	139	1	6
2000	139	2	3
2001	139	3	5
2002	139	4	4
2003	139	5	5
2004	139	6	5
2005	139	7	4
2006	139	8	5
2007	139	9	4
2008	139	10	4
2009	139	11	3
2010	139	12	5
2011	139	13	5
2012	139	14	4
2013	139	15	5
2014	139	16	0
2015	139	17	5
2016	139	18	5
2017	142	1	7
2018	142	2	4
2019	142	3	4
2020	142	4	6
2021	142	5	8
2022	142	6	0
2023	142	7	0
2024	142	8	0
2025	142	9	4
2026	142	10	0
2027	142	11	0
2028	142	12	0
2029	142	13	0
2030	142	14	0
2031	142	15	4
2032	142	16	6
2033	142	17	5
2034	142	18	5
2035	137	1	6
2036	137	2	4
2037	137	3	6
2038	137	4	5
2039	137	5	7
2040	137	6	8
2041	137	7	6
2042	137	8	5
2043	137	9	5
2044	137	10	0
2045	137	11	5
2046	137	12	4
2047	137	13	4
2048	137	14	4
2049	137	15	5
2050	137	16	9
2051	137	17	4
2052	137	18	5
2053	156	1	7
2054	156	2	4
2055	156	3	5
2056	156	4	0
2057	156	5	6
2058	156	6	5
2059	156	7	5
2060	156	8	4
2061	156	9	5
2062	156	10	6
2063	156	11	0
2064	156	12	4
2065	156	13	5
2066	156	14	0
2067	156	15	6
2068	156	16	0
2069	156	17	5
2070	156	18	0
2071	165	1	6
2072	165	2	4
2073	165	3	5
2074	165	4	0
2075	165	5	6
2076	165	6	5
2077	165	7	4
2078	165	8	0
2079	165	9	4
2080	165	10	0
2081	165	11	3
2082	165	12	5
2083	165	13	4
2084	165	14	3
2085	165	15	6
2086	165	16	5
2087	165	17	4
2088	165	18	5
2089	133	1	5
2090	133	2	4
2091	133	3	0
2092	133	4	4
2093	133	5	6
2094	133	6	6
2095	133	7	4
2096	133	8	5
2097	133	9	3
2098	133	10	5
2099	133	11	4
2100	133	12	5
2101	133	13	4
2102	133	14	3
2103	133	15	5
2104	133	16	7
2105	133	17	5
2106	133	18	6
2107	146	1	0
2108	146	2	0
2109	146	3	6
2110	146	4	0
2111	146	5	5
2112	146	6	0
2113	146	7	4
2114	146	8	5
2115	146	9	4
2116	146	10	5
2117	146	11	6
2118	146	12	4
2119	146	13	7
2120	146	14	5
2121	146	15	5
2122	146	16	5
2123	146	17	5
2124	146	18	0
2125	195	1	6
2126	195	2	3
2127	195	3	6
2128	195	4	6
2129	195	5	6
2130	195	6	5
2131	195	7	0
2132	195	8	3
2133	195	9	4
2134	195	10	5
2135	195	11	4
3835	287	1	0
2139	195	15	6
2140	195	16	6
2141	195	17	0
2142	195	18	5
2917	231	1	7
2144	172	2	5
2145	172	3	5
2146	172	4	7
2147	172	5	6
2148	172	6	8
2149	172	7	5
2150	172	8	7
2151	172	9	5
2152	172	10	6
2153	172	11	6
2154	172	12	6
2155	172	13	5
2156	172	14	4
2157	172	15	7
2158	172	16	8
2159	172	17	7
2160	172	18	6
2161	193	1	0
2162	193	2	5
2163	193	3	4
2164	193	4	5
2165	193	5	5
2166	193	6	5
2167	193	7	0
2168	193	8	4
2169	193	9	4
2170	193	10	6
2171	193	11	3
2172	193	12	4
2173	193	13	0
2174	193	14	4
2175	193	15	6
2176	193	16	5
2177	193	17	4
2178	193	18	6
2269	178	1	8
1657	181	1	6
2180	171	2	5
2181	171	3	7
2182	171	4	7
2183	171	5	8
2184	171	6	7
2185	171	7	4
2186	171	8	8
2187	171	9	6
2188	171	10	8
2189	171	11	4
2190	171	12	5
2191	171	13	6
2192	171	14	6
2193	171	15	6
2194	171	16	8
2195	171	17	5
2196	171	18	7
2197	180	1	0
2198	180	2	4
2199	180	3	6
2200	180	4	6
2201	180	5	7
2202	180	6	7
2203	180	7	4
2204	180	8	4
2205	180	9	5
2206	180	10	0
2207	180	11	4
2208	180	12	4
2209	180	13	6
2210	180	14	0
2211	180	15	6
2212	180	16	5
2213	180	17	0
2214	180	18	0
2215	182	1	0
2216	182	2	3
2217	182	3	4
2218	182	4	4
2219	182	5	0
2220	182	6	5
2221	182	7	3
2222	182	8	0
2223	182	9	4
2224	182	10	4
2225	182	11	0
2226	182	12	0
2227	182	13	0
2228	182	14	0
2229	182	15	4
2230	182	16	4
2231	182	17	5
2232	182	18	0
2233	201	1	6
2234	201	2	4
2235	201	3	4
2236	201	4	0
2237	201	5	5
2238	201	6	7
2239	201	7	4
2240	201	8	4
2241	201	9	4
2242	201	10	5
2243	201	11	4
2244	201	12	6
2245	201	13	5
2246	201	14	3
2247	201	15	4
2248	201	16	6
2249	201	17	5
2250	201	18	4
2251	191	1	7
2252	191	2	4
2253	191	3	5
2254	191	4	0
2255	191	5	0
2256	191	6	6
2257	191	7	0
2258	191	8	5
2259	191	9	3
2260	191	10	5
2261	191	11	4
2262	191	12	0
2263	191	13	6
2264	191	14	0
2265	191	15	5
2266	191	16	6
2267	191	17	0
2268	191	18	4
2270	178	2	4
2271	178	3	7
2272	178	4	5
2273	178	5	7
2274	178	6	0
2275	178	7	4
2276	178	8	0
2277	178	9	6
2278	178	10	0
2279	178	11	4
2280	178	12	5
2281	178	13	0
2282	178	14	3
2283	178	15	6
2179	171	1	6
2918	231	2	5
2919	231	3	5
2286	178	18	0
4285	325	1	5
2287	183	1	6
2288	183	2	5
2289	183	3	6
2290	183	4	4
2291	183	5	5
2292	183	6	0
2293	183	7	4
2294	183	8	4
2295	183	9	4
2296	183	10	5
2297	183	11	3
2298	183	12	4
2299	183	13	4
2300	183	14	3
2301	183	15	4
2302	183	16	7
2303	183	17	4
2304	183	18	5
2305	186	1	4
2306	186	2	3
2307	186	3	5
2308	186	4	0
2309	186	5	6
2310	186	6	5
2311	186	7	3
2312	186	8	4
2313	186	9	3
2314	186	10	4
2315	186	11	3
2316	186	12	4
2317	186	13	6
2318	186	14	4
2319	186	15	4
2320	186	16	5
2321	186	17	4
2322	186	18	6
2323	199	1	6
2324	199	2	4
2325	199	3	4
2326	199	4	4
2327	199	5	5
2328	199	6	4
2329	199	7	5
2330	199	8	5
2331	199	9	3
2332	199	10	5
2333	199	11	3
2334	199	12	4
2335	199	13	5
2336	199	14	4
2337	199	15	4
2338	199	16	6
2339	199	17	5
2340	199	18	4
2341	192	1	6
2342	192	2	0
2343	192	3	5
2344	192	4	5
2345	192	5	6
2346	192	6	8
2347	192	7	4
2348	192	8	5
2349	192	9	0
2350	192	10	7
2351	192	11	6
2352	192	12	5
2353	192	13	4
2354	192	14	4
2355	192	15	6
2356	192	16	0
2357	192	17	6
2358	192	18	7
2359	214	1	6
2360	214	2	3
2361	214	3	5
2362	214	4	0
2363	214	5	0
2364	214	6	7
2365	214	7	4
2366	214	8	5
2367	214	9	0
2368	214	10	5
2369	214	11	5
2370	214	12	0
2371	214	13	5
2372	214	14	0
2373	214	15	7
2374	214	16	7
2375	214	17	5
2376	214	18	6
2377	166	1	8
2378	166	2	4
2379	166	3	8
2380	166	4	5
2381	166	5	8
2382	166	6	6
2383	166	7	3
2384	166	8	5
2385	166	9	5
2386	166	10	5
2387	166	11	4
2388	166	12	5
2389	166	13	6
2390	166	14	6
2391	166	15	5
2392	166	16	0
2393	166	17	0
2394	166	18	5
2395	202	1	6
2396	202	2	4
2397	202	3	4
2398	202	4	6
2399	202	5	6
2400	202	6	5
2401	202	7	0
2402	202	8	4
2403	202	9	5
2404	202	10	5
2405	202	11	3
2406	202	12	5
2407	202	13	6
2408	202	14	4
2409	202	15	5
2410	202	16	7
2411	202	17	7
2412	202	18	6
2413	176	1	5
2414	176	2	4
2415	176	3	5
2416	176	4	5
2417	176	5	6
2418	176	6	4
2419	176	7	3
2420	176	8	6
2421	176	9	5
2422	176	10	5
2423	176	11	0
2424	176	12	0
2425	176	13	0
2426	176	14	4
2427	176	15	0
2428	176	16	0
2429	176	17	4
2430	176	18	5
2431	184	1	6
2432	184	2	3
2433	184	3	5
2434	184	4	4
2435	184	5	7
2436	184	6	5
2437	184	7	3
2438	184	8	7
2439	184	9	3
2440	184	10	4
2441	184	11	5
2442	184	12	5
2443	184	13	4
2444	184	14	4
2445	184	15	0
2446	184	16	8
2447	184	17	8
2448	184	18	0
2449	175	1	6
2450	175	2	5
2451	175	3	0
2452	175	4	6
2453	175	5	0
2454	175	6	6
2455	175	7	5
2456	175	8	5
2457	175	9	4
2458	175	10	5
2459	175	11	4
2460	175	12	6
2461	175	13	6
2462	175	14	0
2463	175	15	5
2464	175	16	0
2465	175	17	5
2466	175	18	0
2467	168	1	0
2468	168	2	3
2469	168	3	0
2470	168	4	0
2471	168	5	6
2472	168	6	0
2473	168	7	4
2474	168	8	0
2475	168	9	0
2476	168	10	3
2477	168	11	0
2478	168	12	6
2479	168	13	6
2480	168	14	0
2481	168	15	5
2482	168	16	0
2483	168	17	5
2484	168	18	0
2485	174	1	6
2486	174	2	4
2487	174	3	4
2488	174	4	5
2489	174	5	0
2490	174	6	0
2491	174	7	3
2492	174	8	4
2493	174	9	4
2494	174	10	0
2495	174	11	0
2496	174	12	4
2497	174	13	6
2498	174	14	4
2499	174	15	4
2500	174	16	6
2501	174	17	0
2502	174	18	0
2503	203	1	5
2504	203	2	3
2505	203	3	5
2506	203	4	5
2507	203	5	6
2508	203	6	3
2509	203	7	4
2510	203	8	5
2511	203	9	3
2512	203	10	4
2513	203	11	3
2514	203	12	0
2515	203	13	5
2516	203	14	3
2517	203	15	5
2518	203	16	5
2519	203	17	4
2520	203	18	0
2521	210	1	6
2522	210	2	7
2523	210	3	5
2524	210	4	4
2525	210	5	6
2526	210	6	4
2527	210	7	4
2528	210	8	6
2529	210	9	4
2530	210	10	7
2531	210	11	4
2532	210	12	7
2533	210	13	4
2534	210	14	4
2535	210	15	7
2536	210	16	7
2537	210	17	5
2538	210	18	7
2539	196	1	6
2540	196	2	4
2541	196	3	0
2542	196	4	5
2543	196	5	6
2544	196	6	0
2545	196	7	3
2546	196	8	4
2547	196	9	5
2548	196	10	4
2549	196	11	4
2550	196	12	4
2551	196	13	5
2552	196	14	5
2553	196	15	4
2554	196	16	5
2555	196	17	6
2556	196	18	4
2558	207	2	5
2559	207	3	5
2560	207	4	6
2561	207	5	0
2562	207	6	5
2563	207	7	3
2564	207	8	6
2565	207	9	4
2566	207	10	5
2567	207	11	4
2568	207	12	6
2569	207	13	5
2570	207	14	4
2571	207	15	7
2572	207	16	7
2573	207	17	5
2574	207	18	5
2920	231	4	5
2557	207	1	5
2575	170	1	5
2576	170	2	0
2577	170	3	7
2578	170	4	4
2579	170	5	6
2580	170	6	0
2581	170	7	0
2582	170	8	0
2583	170	9	4
2584	170	10	4
2585	170	11	5
2586	170	12	0
2587	170	13	6
2588	170	14	4
2589	170	15	0
2590	170	16	6
2591	170	17	7
2592	170	18	0
2593	167	1	6
2594	167	2	5
2595	167	3	0
2596	167	4	5
2597	167	5	6
2598	167	6	4
2599	167	7	4
2600	167	8	0
2601	167	9	5
2602	167	10	7
2603	167	11	4
2604	167	12	6
2605	167	13	5
2606	167	14	4
2607	167	15	5
2608	167	16	0
2609	167	17	4
2610	167	18	4
2611	169	1	7
2612	169	2	6
2613	169	3	5
2614	169	4	5
2615	169	5	0
2616	169	6	0
2617	169	7	4
2618	169	8	5
2619	169	9	4
2620	169	10	5
2621	169	11	4
2622	169	12	5
2623	169	13	6
2624	169	14	3
2625	169	15	4
2626	169	16	6
2627	169	17	4
2628	169	18	0
2629	208	1	7
2630	208	2	5
2631	208	3	5
2632	208	4	4
2633	208	5	6
2634	208	6	5
2635	208	7	3
2636	208	8	4
2637	208	9	4
2638	208	10	5
2639	208	11	5
2640	208	12	5
2641	208	13	6
2642	208	14	0
2643	208	15	0
2644	208	16	0
2645	208	17	5
2646	208	18	5
2647	189	1	6
2648	189	2	5
2649	189	3	5
2650	189	4	0
2651	189	5	6
2652	189	6	0
2653	189	7	5
2654	189	8	4
2655	189	9	0
2656	189	10	5
2657	189	11	0
2658	189	12	4
2659	189	13	5
2660	189	14	4
2661	189	15	0
2662	189	16	5
2663	189	17	0
2664	189	18	5
2665	179	1	9
2666	179	2	5
2667	179	3	4
2668	179	4	5
2669	179	5	6
2670	179	6	6
2671	179	7	3
2672	179	8	6
2673	179	9	4
2674	179	10	6
2675	179	11	3
2676	179	12	4
2677	179	13	4
2678	179	14	4
2679	179	15	6
2680	179	16	7
2681	179	17	0
2682	179	18	4
2683	173	1	8
2684	173	2	4
2685	173	3	7
2686	173	4	5
2687	173	5	0
2688	173	6	0
2689	173	7	4
2690	173	8	0
2691	173	9	5
2692	173	10	6
2693	173	11	0
2694	173	12	4
2695	173	13	7
2696	173	14	4
2697	173	15	0
2698	173	16	7
2699	173	17	5
2700	173	18	5
2701	213	1	6
2702	213	2	4
2703	213	3	5
2704	213	4	5
2705	213	5	6
2706	213	6	6
2707	213	7	4
2708	213	8	6
2709	213	9	3
2710	213	10	6
2711	213	11	0
2712	213	12	5
2713	213	13	5
2714	213	14	0
2715	213	15	5
2716	213	16	6
2717	213	17	5
2718	213	18	6
2719	190	1	5
2720	190	2	4
2721	190	3	5
2722	190	4	6
2723	190	5	5
2724	190	6	6
2725	190	7	3
2726	190	8	0
2727	190	9	4
2728	190	10	5
2729	190	11	4
2730	190	12	5
2731	190	13	5
2732	190	14	3
2733	190	15	4
2734	190	16	6
2735	190	17	4
2736	190	18	6
2737	197	1	7
2738	197	2	5
2739	197	3	7
2740	197	4	5
2741	197	5	6
2742	197	6	5
2743	197	7	7
2744	197	8	6
2745	197	9	5
2746	197	10	4
2747	197	11	4
2748	197	12	4
2749	197	13	5
2750	197	14	4
2751	197	15	5
2752	197	16	6
2753	197	17	6
2754	197	18	6
2143	172	1	0
2755	188	1	4
2756	188	2	0
2757	188	3	5
2758	188	4	5
2759	188	5	5
2760	188	6	6
2761	188	7	5
2762	188	8	0
2763	188	9	4
2764	188	10	4
2765	188	11	4
2766	188	12	5
2767	188	13	5
2768	188	14	3
2769	188	15	0
2770	188	16	5
2771	188	17	4
2772	188	18	0
2773	209	1	6
2774	209	2	0
2775	209	3	6
2776	209	4	4
2777	209	5	6
2778	209	6	6
2779	209	7	3
2780	209	8	5
2781	209	9	3
2782	209	10	0
2783	209	11	3
2784	209	12	5
2785	209	13	6
2786	209	14	4
2787	209	15	3
2788	209	16	0
2789	209	17	0
2790	209	18	6
2791	198	1	5
2792	198	2	4
2793	198	3	4
2794	198	4	4
2795	198	5	6
2796	198	6	5
2797	198	7	0
2798	198	8	0
2799	198	9	4
2800	198	10	0
2801	198	11	2
2802	198	12	4
2803	198	13	4
2804	198	14	4
2805	198	15	4
2806	198	16	5
2807	198	17	4
2808	198	18	5
2809	200	1	6
2810	200	2	3
2811	200	3	5
2812	200	4	5
2813	200	5	6
2814	200	6	6
2815	200	7	0
2816	200	8	4
2817	200	9	3
2818	200	10	4
2819	200	11	3
2820	200	12	4
2821	200	13	5
2822	200	14	3
2823	200	15	0
2824	200	16	5
2825	200	17	0
2826	200	18	4
2827	177	1	6
2828	177	2	0
2829	177	3	6
2830	177	4	8
2831	177	5	7
2832	177	6	0
2833	177	7	5
2834	177	8	7
2835	177	9	5
2836	177	10	4
2837	177	11	4
2838	177	12	6
2839	177	13	6
2840	177	14	2
2841	177	15	5
2842	177	16	5
2843	177	17	5
2844	177	18	6
2845	204	1	5
2846	204	2	0
2847	204	3	0
2848	204	4	5
2849	204	5	0
2850	204	6	5
2851	204	7	4
2852	204	8	4
2853	204	9	4
2854	204	10	8
2855	204	11	4
2856	204	12	6
2857	204	13	6
2858	204	14	5
2859	204	15	3
2860	204	16	8
2861	204	17	6
2862	204	18	5
2863	194	1	5
2864	194	2	2
2865	194	3	5
2866	194	4	6
2867	194	5	7
2868	194	6	5
2869	194	7	3
2870	194	8	4
2871	194	9	6
2872	194	10	4
2873	194	11	3
2874	194	12	4
2875	194	13	5
2876	194	14	4
2877	194	15	6
2878	194	16	4
2879	194	17	6
2880	194	18	7
2284	178	16	7
2285	178	17	3
2881	215	1	6
2882	215	2	3
2883	215	3	6
2884	215	4	0
2885	215	5	6
2886	215	6	0
2887	215	7	0
2888	215	8	0
2889	215	9	0
2890	215	10	7
2891	215	11	4
2892	215	12	4
2893	215	13	5
2894	215	14	4
2895	215	15	6
2896	215	16	5
2897	215	17	4
2898	215	18	7
2899	216	1	6
2900	216	2	4
2901	216	3	5
2902	216	4	6
2903	216	5	5
2904	216	6	6
2905	216	7	3
2906	216	8	3
2907	216	9	4
2908	216	10	5
2909	216	11	4
2910	216	12	5
2911	216	13	6
2912	216	14	5
2913	216	15	6
2914	216	16	0
2915	216	17	5
2916	216	18	6
2921	231	5	5
2922	231	6	5
2923	231	7	4
2924	231	8	7
2925	231	9	4
2926	231	10	5
2927	231	11	0
2928	231	12	6
2929	231	13	7
2930	231	14	3
2931	231	15	5
2932	231	16	5
2933	231	17	5
2934	231	18	5
2937	243	3	5
2938	243	4	7
2939	243	5	7
2940	243	6	5
2941	243	7	5
2942	243	8	5
2943	243	9	5
2944	243	10	7
2945	243	11	4
2946	243	12	4
2947	243	13	4
2948	243	14	0
2949	243	15	5
2950	243	16	4
2951	243	17	4
2952	243	18	5
2953	224	1	6
2954	224	2	5
2955	224	3	5
2956	224	4	5
2957	224	5	0
2958	224	6	0
2959	224	7	3
2960	224	8	6
2961	224	9	4
2962	224	10	5
2963	224	11	4
2964	224	12	5
2965	224	13	7
2966	224	14	3
2967	224	15	5
2968	224	16	6
2969	224	17	5
2970	224	18	5
2971	236	1	6
2972	236	2	4
2973	236	3	5
2974	236	4	5
2975	236	5	9
2976	236	6	6
2977	236	7	5
2978	236	8	0
2979	236	9	4
2980	236	10	4
2981	236	11	6
2982	236	12	6
2983	236	13	7
2984	236	14	3
2985	236	15	6
2986	236	16	5
2987	236	17	6
2988	236	18	9
2989	230	1	0
2990	230	2	6
2991	230	3	5
2992	230	4	6
2993	230	5	7
2994	230	6	6
2995	230	7	3
2996	230	8	0
2997	230	9	3
2998	230	10	5
2999	230	11	4
3000	230	12	4
3001	230	13	6
3002	230	14	0
3003	230	15	5
3004	230	16	0
3005	230	17	5
3006	230	18	0
3007	227	1	8
3008	227	2	6
3009	227	3	0
3010	227	4	4
3011	227	5	7
3012	227	6	5
3013	227	7	5
3014	227	8	0
3015	227	9	3
3836	287	2	4
3016	227	10	6
3017	227	11	4
3018	227	12	5
3019	227	13	6
3020	227	14	5
3021	227	15	6
3022	227	16	6
3023	227	17	5
3024	227	18	6
3025	219	1	6
3026	219	2	5
3027	219	3	6
3028	219	4	6
3029	219	5	0
3030	219	6	5
3031	219	7	5
3032	219	8	6
3033	219	9	4
3034	219	10	5
3035	219	11	4
3036	219	12	5
3037	219	13	5
3038	219	14	4
3039	219	15	6
3040	219	16	7
3041	219	17	4
3042	219	18	0
3043	217	1	6
3044	217	2	6
3045	217	3	4
3046	217	4	4
3047	217	5	6
3048	217	6	7
3049	217	7	6
3050	217	8	5
3051	217	9	6
3052	217	10	5
3053	217	11	0
3054	217	12	5
3055	217	13	5
3056	217	14	5
3057	217	15	6
3058	217	16	7
3059	217	17	5
3060	217	18	6
3061	232	1	8
3062	232	2	4
3063	232	3	6
3064	232	4	6
3065	232	5	8
3066	232	6	6
3067	232	7	3
3068	232	8	5
3069	232	9	7
3070	232	10	0
3071	232	11	4
3072	232	12	5
3073	232	13	7
3074	232	14	5
3075	232	15	6
3076	232	16	7
3077	232	17	6
3078	232	18	8
3079	218	1	6
3080	218	2	3
3081	218	3	7
3082	218	4	5
3083	218	5	0
3084	218	6	7
3085	218	7	4
3086	218	8	0
3087	218	9	4
3088	218	10	0
3089	218	11	0
3090	218	12	4
3091	218	13	4
3092	218	14	0
3093	218	15	6
3094	218	16	0
3095	218	17	0
3096	218	18	0
3097	237	1	0
3098	237	2	5
3099	237	3	7
3100	237	4	7
3101	237	5	9
3102	237	6	8
3103	237	7	4
3104	237	8	0
3105	237	9	4
3106	237	10	0
3107	237	11	5
3108	237	12	6
3109	237	13	6
3110	237	14	0
3111	237	15	7
3112	237	16	0
3113	237	17	8
3114	237	18	7
3115	247	1	0
3116	247	2	4
3117	247	3	4
3118	247	4	4
3119	247	5	5
3120	247	6	5
3121	247	7	3
3122	247	8	3
3123	247	9	3
3124	247	10	4
3125	247	11	3
3126	247	12	4
3127	247	13	4
3128	247	14	3
3129	247	15	5
3130	247	16	5
3131	247	17	4
3132	247	18	5
3133	261	1	7
3134	261	2	3
3135	261	3	6
3136	261	4	5
3137	261	5	7
3138	261	6	6
3139	261	7	3
3140	261	8	0
3141	261	9	3
3142	261	10	4
3143	261	11	3
3144	261	12	2
3145	261	13	5
3146	261	14	5
3147	261	15	5
3148	261	16	7
3149	261	17	4
3150	261	18	6
3151	249	1	5
3152	249	2	2
3153	249	3	5
3154	249	4	4
3155	249	5	5
3156	249	6	5
3157	249	7	2
3158	249	8	6
3159	249	9	4
3160	249	10	6
3161	249	11	3
3162	249	12	4
3163	249	13	4
3164	249	14	3
3165	249	15	4
3166	249	16	5
3167	249	17	4
3168	249	18	0
3169	246	1	5
3170	246	2	3
3171	246	3	5
3172	246	4	5
3173	246	5	6
3174	246	6	6
3175	246	7	4
3176	246	8	4
3177	246	9	4
3178	246	10	5
3179	246	11	5
3180	246	12	0
3181	246	13	5
3182	246	14	3
3183	246	15	4
3184	246	16	6
3185	246	17	5
3186	246	18	5
3187	271	1	0
3188	271	2	4
3189	271	3	5
3190	271	4	4
3191	271	5	5
3192	271	6	5
3193	271	7	0
3194	271	8	0
3195	271	9	4
3196	271	10	6
3197	271	11	4
3198	271	12	4
3199	271	13	4
3200	271	14	0
3201	271	15	5
3202	271	16	7
3203	271	17	4
3204	271	18	5
3205	233	1	0
3206	233	2	0
3207	233	3	5
3208	233	4	5
3209	233	5	0
3210	233	6	4
3211	233	7	4
3212	233	8	5
3213	233	9	5
3214	233	10	5
3215	233	11	4
3216	233	12	5
3217	233	13	0
3218	233	14	0
3219	233	15	0
3220	233	16	6
3221	233	17	4
3222	233	18	5
3223	250	1	0
3224	250	2	3
3225	250	3	5
3226	250	4	0
3227	250	5	0
3228	250	6	0
3229	250	7	0
3230	250	8	0
3231	250	9	0
3232	250	10	5
3233	250	11	7
3234	250	12	5
3235	250	13	6
3236	250	14	5
3237	250	15	4
3238	250	16	5
3239	250	17	7
3240	250	18	4
3241	221	1	7
3242	221	2	4
3243	221	3	6
3244	221	4	6
3245	221	5	6
3246	221	6	5
3247	221	7	0
3248	221	8	6
3249	221	9	5
3250	221	10	0
3251	221	11	6
3252	221	12	4
3253	221	13	5
3254	221	14	3
3255	221	15	5
3256	221	16	6
3257	221	17	6
3258	221	18	4
3259	238	1	5
3260	238	2	4
3261	238	3	6
3262	238	4	7
3263	238	5	7
3264	238	6	7
3265	238	7	6
3266	238	8	8
3267	238	9	6
3268	238	10	7
3269	238	11	3
3270	238	12	4
3271	238	13	6
3272	238	14	7
3273	238	15	0
3274	238	16	0
3275	238	17	6
3276	238	18	7
3277	270	1	7
3278	270	2	3
3279	270	3	5
3280	270	4	0
3281	270	5	6
3282	270	6	0
3283	270	7	4
3284	270	8	5
3285	270	9	4
3286	270	10	6
3287	270	11	3
3288	270	12	4
3289	270	13	5
3290	270	14	4
3291	270	15	5
3292	270	16	6
3293	270	17	4
3294	270	18	5
3295	265	1	6
3296	265	2	4
3297	265	3	4
3298	265	4	5
3299	265	5	6
3300	265	6	6
3301	265	7	0
3302	265	8	4
3303	265	9	5
3304	265	10	5
3305	265	11	0
3306	265	12	5
4915	367	1	6
3307	265	13	5
3308	265	14	3
3309	265	15	4
3310	265	16	5
3311	265	17	5
3312	265	18	5
3313	252	1	4
3314	252	2	3
3315	252	3	4
3316	252	4	3
3317	252	5	5
3318	252	6	5
3319	252	7	4
3320	252	8	5
3321	252	9	4
3322	252	10	5
3323	252	11	5
3324	252	12	4
3325	252	13	5
3326	252	14	3
3327	252	15	4
3328	252	16	5
3329	252	17	5
3330	252	18	5
3331	228	1	0
3332	228	2	0
3333	228	3	0
3334	228	4	0
3335	228	5	6
3336	228	6	6
3337	228	7	3
3338	228	8	4
3339	228	9	4
3340	228	10	5
3341	228	11	4
3342	228	12	5
3343	228	13	7
3344	228	14	4
3345	228	15	5
3346	228	16	0
3347	228	17	5
3348	228	18	0
3349	254	1	6
3350	254	2	4
3351	254	3	5
3352	254	4	7
3353	254	5	5
3354	254	6	4
3355	254	7	3
3356	254	8	0
3357	254	9	0
3358	254	10	7
3359	254	11	4
3360	254	12	6
3361	254	13	5
3362	254	14	0
3363	254	15	5
3364	254	16	0
3365	254	17	0
3366	254	18	0
3367	220	1	5
3368	220	2	3
3369	220	3	5
3370	220	4	4
3371	220	5	6
3372	220	6	4
3373	220	7	4
3374	220	8	5
3375	220	9	5
3376	220	10	6
3377	220	11	4
3378	220	12	6
3379	220	13	5
3380	220	14	3
3381	220	15	5
3382	220	16	5
3383	220	17	5
3384	220	18	6
3385	255	1	7
3386	255	2	4
3387	255	3	6
3388	255	4	4
3389	255	5	5
3390	255	6	6
3391	255	7	4
3392	255	8	4
3393	255	9	6
3394	255	10	6
3395	255	11	5
3396	255	12	5
3397	255	13	5
3398	255	14	4
3399	255	15	5
3400	255	16	6
3401	255	17	5
3402	255	18	6
3403	223	1	0
3404	223	2	0
3405	223	3	5
3406	223	4	0
3407	223	5	0
3408	223	6	6
3409	223	7	0
3410	223	8	0
3411	223	9	4
3412	223	10	0
3413	223	11	5
3414	223	12	6
3415	223	13	6
3416	223	14	5
3417	223	15	6
3418	223	16	8
3419	223	17	5
3420	223	18	0
3421	264	1	6
3422	264	2	3
3423	264	3	5
3424	264	4	5
3425	264	5	0
3426	264	6	4
3427	264	7	4
3428	264	8	3
3429	264	9	3
3430	264	10	0
3431	264	11	5
3432	264	12	4
3433	264	13	5
3434	264	14	4
3435	264	15	6
3436	264	16	5
3437	264	17	4
3438	264	18	5
3439	256	1	6
3440	256	2	4
3441	256	3	6
3442	256	4	5
3443	256	5	7
3444	256	6	5
3445	256	7	4
3446	256	8	4
3447	256	9	3
3448	256	10	6
3449	256	11	4
3450	256	12	4
3451	256	13	5
3452	256	14	4
3453	256	15	5
3454	256	16	0
3455	256	17	5
3456	256	18	6
3457	268	1	6
3458	268	2	4
3459	268	3	6
3460	268	4	6
3461	268	5	6
3462	268	6	4
3463	268	7	0
3464	268	8	5
3465	268	9	3
3466	268	10	0
3467	268	11	4
3468	268	12	4
3469	268	13	5
3470	268	14	0
3471	268	15	0
3472	268	16	0
3473	268	17	5
3474	268	18	5
3475	253	1	0
3476	253	2	0
3477	253	3	7
3478	253	4	0
3479	253	5	7
3480	253	6	6
3481	253	7	0
3482	253	8	6
3483	253	9	3
3484	253	10	6
3485	253	11	0
3486	253	12	6
3487	253	13	5
3488	253	14	4
3489	253	15	5
3490	253	16	6
3491	253	17	4
3492	253	18	0
3493	273	1	6
3494	273	2	5
3495	273	3	4
3496	273	4	6
3497	273	5	6
3498	273	6	0
3499	273	7	0
3500	273	8	0
3501	273	9	4
3502	273	10	0
3503	273	11	5
3504	273	12	5
3505	273	13	6
3506	273	14	5
3507	273	15	4
3508	273	16	6
3509	273	17	6
3510	273	18	5
3837	287	3	7
3512	258	2	3
3513	258	3	4
3514	258	4	5
3515	258	5	5
3516	258	6	4
3517	258	7	5
3518	258	8	4
3519	258	9	3
3520	258	10	4
3521	258	11	3
3522	258	12	4
3523	258	13	5
3524	258	14	3
3525	258	15	4
3526	258	16	6
3527	258	17	4
3528	258	18	4
3529	259	1	5
3530	259	2	3
3531	259	3	5
3532	259	4	5
3533	259	5	5
3534	259	6	6
3535	259	7	3
3536	259	8	5
3537	259	9	3
3538	259	10	4
3539	259	11	5
3540	259	12	5
3541	259	13	6
3542	259	14	3
3543	259	15	5
3544	259	16	5
3545	259	17	5
3546	259	18	7
3547	262	1	5
3548	262	2	3
3549	262	3	0
3550	262	4	6
3551	262	5	5
3552	262	6	7
3553	262	7	2
3554	262	8	4
3555	262	9	4
3556	262	10	0
3557	262	11	3
3558	262	12	5
3559	262	13	5
3560	262	14	3
3561	262	15	5
3562	262	16	6
3563	262	17	5
3564	262	18	5
3565	235	1	6
3566	235	2	5
3567	235	3	6
3568	235	4	7
3569	235	5	6
3570	235	6	5
3571	235	7	0
3572	235	8	0
3573	235	9	5
3574	235	10	4
3575	235	11	3
3576	235	12	5
3577	235	13	5
3578	235	14	5
3579	235	15	6
3580	235	16	5
3581	235	17	5
3582	235	18	6
3583	234	1	0
3584	234	2	4
3585	234	3	6
3586	234	4	7
3587	234	5	6
3588	234	6	6
3589	234	7	5
3590	234	8	4
3591	234	9	4
3592	234	10	0
3593	234	11	4
3594	234	12	5
3595	234	13	4
3596	234	14	0
3597	234	15	6
3838	287	4	5
3598	234	16	7
3599	234	17	0
3600	234	18	0
3601	229	1	6
3602	229	2	6
3603	229	3	6
3604	229	4	6
3605	229	5	0
3606	229	6	0
3607	229	7	4
3608	229	8	0
3609	229	9	5
3610	229	10	0
3611	229	11	5
3612	229	12	5
3613	229	13	0
3614	229	14	4
3615	229	15	6
3616	229	16	0
3617	229	17	5
3618	229	18	6
3619	248	1	5
3620	248	2	3
3621	248	3	5
3622	248	4	5
3623	248	5	6
3624	248	6	4
3625	248	7	4
3626	248	8	4
3627	248	9	4
3628	248	10	5
3629	248	11	4
3630	248	12	4
3631	248	13	4
3632	248	14	2
3633	248	15	5
3634	248	16	5
3635	248	17	5
3636	248	18	4
3511	258	1	5
3637	239	1	0
3638	239	2	0
3639	239	3	6
3640	239	4	4
3641	239	5	5
3642	239	6	8
3643	239	7	0
3644	239	8	5
3645	239	9	0
3646	239	10	0
3647	239	11	3
3648	239	12	5
3649	239	13	6
3650	239	14	0
3651	239	15	4
3652	239	16	5
3653	239	17	6
3654	239	18	0
3655	257	1	7
3656	257	2	3
3657	257	3	6
3658	257	4	5
3659	257	5	4
3660	257	6	5
3661	257	7	3
3662	257	8	3
3663	257	9	3
3664	257	10	4
3665	257	11	0
3666	257	12	4
3667	257	13	6
3668	257	14	4
3669	257	15	3
3670	257	16	5
3671	257	17	5
3672	257	18	0
3674	244	2	5
3675	244	3	5
3676	244	4	6
3677	244	5	6
3678	244	6	4
3679	244	7	6
3680	244	8	6
3681	244	9	3
3682	244	10	5
3683	244	11	5
3684	244	12	0
3685	244	13	4
3686	244	14	4
3687	244	15	5
3688	244	16	8
3689	244	17	5
3690	244	18	5
3839	287	5	6
3691	240	1	6
3692	240	2	5
3693	240	3	5
3694	240	4	6
3695	240	5	7
3696	240	6	7
3697	240	7	0
3698	240	8	7
3699	240	9	6
3700	240	10	0
3701	240	11	4
3702	240	12	5
3703	240	13	5
3704	240	14	0
3705	240	15	0
3706	240	16	5
3707	240	17	5
3708	240	18	5
3709	266	1	0
3710	266	2	4
3711	266	3	0
3712	266	4	6
3713	266	5	0
3714	266	6	6
3715	266	7	4
3716	266	8	5
3717	266	9	4
3718	266	10	5
3719	266	11	5
3720	266	12	6
3721	266	13	4
3722	266	14	0
3723	266	15	5
3724	266	16	7
3725	266	17	4
3726	266	18	6
3727	260	1	5
3728	260	2	5
3729	260	3	5
3730	260	4	0
3731	260	5	6
3732	260	6	4
3733	260	7	3
3734	260	8	6
3735	260	9	4
3736	260	10	4
3737	260	11	4
3738	260	12	4
3739	260	13	6
3740	260	14	0
3741	260	15	5
3742	260	16	7
4286	325	2	3
3743	260	17	5
3744	260	18	4
3745	241	1	6
3746	241	2	4
3747	241	3	6
3748	241	4	6
3749	241	5	7
3750	241	6	6
3751	241	7	4
3752	241	8	7
3753	241	9	0
3754	241	10	0
3755	241	11	5
3756	241	12	6
3757	241	13	0
3758	241	14	0
3759	241	15	6
3760	241	16	6
3761	241	17	0
3762	241	18	0
3763	226	1	0
3764	226	2	4
3765	226	3	4
3766	226	4	5
3767	226	5	7
3768	226	6	7
3769	226	7	0
3770	226	8	4
3771	226	9	5
3772	226	10	5
3773	226	11	3
3774	226	12	0
3775	226	13	3
3776	226	14	6
3777	226	15	5
3778	226	16	5
3779	226	17	6
3780	226	18	0
3781	222	1	7
3782	222	2	5
3783	222	3	6
3784	222	4	6
3785	222	5	6
3786	222	6	6
3787	222	7	5
3788	222	8	6
3789	222	9	4
3790	222	10	5
3791	222	11	4
3792	222	12	4
3793	222	13	6
3794	222	14	4
3795	222	15	0
3796	222	16	6
3797	222	17	0
3798	222	18	4
3799	225	1	0
3800	225	2	5
3801	225	3	5
3802	225	4	6
3803	225	5	7
3804	225	6	6
3805	225	7	4
3806	225	8	0
3807	225	9	5
3808	225	10	6
3809	225	11	4
3810	225	12	5
3811	225	13	5
3812	225	14	5
3813	225	15	7
3814	225	16	0
3815	225	17	7
3816	225	18	7
3817	245	1	5
3818	245	2	4
3819	245	3	4
3820	245	4	4
3821	245	5	5
3822	245	6	0
3823	245	7	3
3824	245	8	4
3825	245	9	4
3826	245	10	5
3827	245	11	5
3828	245	12	0
3829	245	13	5
3830	245	14	5
3831	245	15	5
3832	245	16	6
3833	245	17	4
3834	245	18	6
3673	244	1	5
3840	287	6	7
3841	287	7	4
3842	287	8	4
3843	287	9	6
3844	287	10	0
3845	287	11	3
3846	287	12	6
3847	287	13	6
3848	287	14	5
3849	287	15	6
3850	287	16	6
3851	287	17	5
3852	287	18	5
3853	286	1	8
3854	286	2	6
3855	286	3	5
3856	286	4	0
3857	286	5	0
3858	286	6	6
3859	286	7	5
3860	286	8	7
3861	286	9	5
3862	286	10	5
3863	286	11	5
3864	286	12	4
3865	286	13	5
3866	286	14	4
3867	286	15	4
3868	286	16	0
3869	286	17	6
3870	286	18	6
3871	295	1	7
3872	295	2	4
3873	295	3	5
3874	295	4	6
3875	295	5	7
3876	295	6	5
3877	295	7	3
3878	295	8	0
3879	295	9	0
3880	295	10	4
3881	295	11	3
3882	295	12	0
3883	295	13	6
3884	295	14	0
3885	295	15	0
3886	295	16	6
3887	295	17	0
3888	295	18	4
3889	293	1	5
3890	293	2	4
3891	293	3	0
3892	293	4	6
3893	293	5	7
3894	293	6	5
3895	293	7	5
3896	293	8	5
3897	293	9	4
3898	293	10	5
3899	293	11	0
3900	293	12	4
3901	293	13	6
3902	293	14	4
3903	293	15	0
3904	293	16	6
3905	293	17	4
3906	293	18	5
3907	296	1	5
3908	296	2	0
3909	296	3	6
3910	296	4	4
3911	296	5	7
3912	296	6	7
3913	296	7	5
3914	296	8	6
3915	296	9	5
3916	296	10	4
3917	296	11	4
3918	296	12	5
3919	296	13	5
3920	296	14	5
3921	296	15	5
3922	296	16	5
3923	296	17	6
3924	296	18	6
3925	289	1	5
3926	289	2	5
3927	289	3	5
3928	289	4	6
3929	289	5	6
3930	289	6	7
3931	289	7	5
3932	289	8	0
3933	289	9	5
3934	289	10	4
3935	289	11	4
3936	289	12	6
3937	289	13	6
3938	289	14	6
3939	289	15	5
3940	289	16	8
3941	289	17	6
3942	289	18	5
3943	274	1	3
3944	274	2	3
3945	274	3	6
3946	274	4	4
3947	274	5	4
3948	274	6	5
3949	274	7	4
3950	274	8	3
3951	274	9	4
3952	274	10	5
3953	274	11	3
3954	274	12	0
3955	274	13	5
3956	274	14	4
3957	274	15	6
3958	274	16	5
3959	274	17	5
3960	274	18	4
3961	284	1	5
3962	284	2	3
3963	284	3	4
3964	284	4	6
3965	284	5	6
3966	284	6	5
3967	284	7	4
3968	284	8	4
3969	284	9	4
3970	284	10	5
3971	284	11	4
3972	284	12	4
3973	284	13	5
3974	284	14	4
3975	284	15	4
3976	284	16	7
3977	284	17	5
3978	284	18	7
3979	275	1	6
3980	275	2	4
3981	275	3	5
3982	275	4	6
3983	275	5	6
3984	275	6	5
3985	275	7	4
3986	275	8	3
3987	275	9	3
3988	275	10	5
3989	275	11	3
3990	275	12	4
3991	275	13	7
3992	275	14	4
3993	275	15	4
3994	275	16	6
3995	275	17	5
3996	275	18	4
3997	280	1	6
3998	280	2	5
3999	280	3	4
4000	280	4	6
4001	280	5	7
4002	280	6	6
4003	280	7	0
4004	280	8	4
4005	280	9	4
4006	280	10	4
4007	280	11	4
4008	280	12	5
4009	280	13	5
4010	280	14	7
4011	280	15	7
4012	280	16	5
4013	280	17	4
4014	280	18	6
4015	298	1	8
4016	298	2	4
4017	298	3	4
4018	298	4	5
4019	298	5	6
4020	298	6	6
4021	298	7	0
4022	298	8	4
4023	298	9	4
4024	298	10	0
4025	298	11	4
4026	298	12	5
4027	298	13	4
4028	298	14	4
4029	298	15	6
4030	298	16	5
4031	298	17	4
4032	298	18	4
4034	276	2	5
4035	276	3	6
4036	276	4	5
4037	276	5	0
4038	276	6	6
4287	325	3	6
10022	642	14	4
4288	325	4	4
4041	276	9	5
4042	276	10	4
4043	276	11	3
4044	276	12	0
4045	276	13	4
4046	276	14	4
4047	276	15	6
4048	276	16	7
4049	276	17	4
4050	276	18	0
4289	325	5	6
4051	281	1	6
4052	281	2	4
4053	281	3	6
4054	281	4	5
4055	281	5	6
4056	281	6	0
4057	281	7	5
4058	281	8	5
4059	281	9	2
4060	281	10	6
4061	281	11	4
4062	281	12	5
4063	281	13	5
4064	281	14	3
4065	281	15	5
4066	281	16	6
4067	281	17	0
4068	281	18	0
4069	282	1	5
4070	282	2	6
4071	282	3	6
4072	282	4	3
4073	282	5	7
4074	282	6	6
4075	282	7	4
4076	282	8	5
4077	282	9	4
4078	282	10	0
4079	282	11	4
4080	282	12	4
4081	282	13	6
4082	282	14	4
4083	282	15	5
4084	282	16	7
4085	282	17	5
4086	282	18	6
4087	283	1	5
4088	283	2	4
4089	283	3	0
4090	283	4	0
4091	283	5	7
4092	283	6	6
4093	283	7	3
4094	283	8	5
4095	283	9	3
4096	283	10	5
4097	283	11	3
4098	283	12	4
4099	283	13	4
4100	283	14	4
4101	283	15	0
4102	283	16	5
4103	283	17	5
4104	283	18	0
4105	288	1	7
4106	288	2	5
4107	288	3	7
4108	288	4	6
4109	288	5	0
4110	288	6	0
4111	288	7	0
4112	288	8	0
4113	288	9	4
4114	288	10	6
4115	288	11	4
4116	288	12	6
4117	288	13	5
4118	288	14	6
4119	288	15	5
4120	288	16	8
4121	288	17	4
4122	288	18	6
4123	279	1	5
4124	279	2	3
4125	279	3	6
4126	279	4	0
4127	279	5	7
4128	279	6	6
4129	279	7	4
4130	279	8	4
4131	279	9	4
4132	279	10	5
4133	279	11	0
4134	279	12	0
4135	279	13	0
4136	279	14	4
4137	279	15	4
4138	279	16	5
4139	279	17	6
4140	279	18	0
4141	291	1	6
4142	291	2	0
4143	291	3	4
4144	291	4	4
4145	291	5	5
4146	291	6	5
4147	291	7	3
4148	291	8	4
4149	291	9	4
4150	291	10	5
4151	291	11	4
4152	291	12	4
4153	291	13	0
4154	291	14	4
4155	291	15	5
4156	291	16	6
4157	291	17	5
4158	291	18	0
4159	292	1	5
4160	292	2	5
4161	292	3	5
4162	292	4	6
4163	292	5	6
4164	292	6	4
4165	292	7	3
4166	292	8	0
4167	292	9	5
4168	292	10	5
4169	292	11	4
4170	292	12	4
4171	292	13	6
4172	292	14	3
4173	292	15	6
4174	292	16	6
4175	292	17	5
4176	292	18	5
4177	290	1	6
4178	290	2	5
4179	290	3	6
4180	290	4	6
4181	290	5	0
4182	290	6	5
4183	290	7	4
4184	290	8	5
4185	290	9	5
4186	290	10	5
4187	290	11	4
4188	290	12	6
4189	290	13	6
4190	290	14	4
4191	290	15	5
4192	290	16	0
4193	290	17	0
4194	290	18	5
4195	285	1	5
4196	285	2	3
4197	285	3	4
4198	285	4	5
4199	285	5	5
4200	285	6	4
4201	285	7	4
4202	285	8	6
4203	285	9	4
4204	285	10	4
4205	285	11	5
4206	285	12	4
4207	285	13	5
4208	285	14	5
4209	285	15	4
4210	285	16	5
4211	285	17	4
4212	285	18	5
4213	277	1	5
4214	277	2	2
4215	277	3	3
4216	277	4	4
4217	277	5	5
4218	277	6	4
4219	277	7	5
4220	277	8	5
4221	277	9	4
4222	277	10	5
4223	277	11	2
4224	277	12	5
4225	277	13	4
4226	277	14	4
4227	277	15	3
4228	277	16	6
4229	277	17	5
4230	277	18	5
4231	278	1	6
4232	278	2	3
4233	278	3	4
4234	278	4	4
4235	278	5	5
4236	278	6	5
4237	278	7	4
4238	278	8	4
4239	278	9	4
4240	278	10	4
4241	278	11	4
4242	278	12	4
4243	278	13	4
4244	278	14	4
4245	278	15	4
4246	278	16	6
4247	278	17	4
4248	278	18	5
4249	297	1	5
4250	297	2	3
4251	297	3	6
4252	297	4	0
4253	297	5	7
4254	297	6	4
4255	297	7	0
4256	297	8	5
4257	297	9	4
4258	297	10	0
4259	297	11	4
4260	297	12	4
4261	297	13	0
4262	297	14	0
4263	297	15	4
4264	297	16	6
4265	297	17	6
4266	297	18	6
4267	294	1	6
4268	294	2	2
4269	294	3	6
4270	294	4	5
4271	294	5	5
4272	294	6	5
4273	294	7	3
4274	294	8	6
4275	294	9	4
4276	294	10	6
4277	294	11	0
4278	294	12	5
4279	294	13	6
4280	294	14	3
4281	294	15	5
4282	294	16	6
4283	294	17	6
4284	294	18	6
4033	276	1	5
4039	276	7	4
4040	276	8	3
4290	325	6	5
4291	325	7	3
4292	325	8	5
4293	325	9	6
4294	325	10	5
4295	325	11	4
4296	325	12	5
4297	325	13	5
4298	325	14	5
4299	325	15	5
4300	325	16	5
4301	325	17	5
4302	325	18	4
4303	326	1	0
4304	326	2	6
4305	326	3	5
4306	326	4	5
4307	326	5	7
4308	326	6	4
4309	326	7	3
4310	326	8	5
4311	326	9	4
4312	326	10	8
4313	326	11	4
4314	326	12	4
4315	326	13	6
4316	326	14	5
4317	326	15	7
4318	326	16	6
4319	326	17	6
4320	326	18	5
4321	317	1	5
4322	317	2	4
4323	317	3	4
4324	317	4	4
4325	317	5	6
4326	317	6	6
4327	317	7	4
4328	317	8	5
4329	317	9	4
4330	317	10	4
4331	317	11	4
4332	317	12	4
4333	317	13	4
4334	317	14	4
4335	317	15	5
4336	317	16	5
4337	317	17	6
4338	317	18	5
4339	319	1	6
4340	319	2	4
4341	319	3	5
4342	319	4	5
4343	319	5	6
4344	319	6	5
4345	319	7	3
4346	319	8	4
4347	319	9	5
4348	319	10	4
4349	319	11	3
4350	319	12	5
4351	319	13	5
4352	319	14	3
4353	319	15	6
4354	319	16	7
4355	319	17	6
4356	319	18	5
4357	327	1	6
4358	327	2	3
4359	327	3	5
4360	327	4	4
4361	327	5	6
4362	327	6	5
4363	327	7	2
4364	327	8	5
4365	327	9	5
4366	327	10	7
4367	327	11	3
4368	327	12	4
4369	327	13	5
4370	327	14	4
4371	327	15	5
4372	327	16	6
4373	327	17	4
4374	327	18	4
4375	328	1	6
4376	328	2	5
4377	328	3	5
4378	328	4	4
4379	328	5	6
4380	328	6	7
4381	328	7	2
4382	328	8	0
4383	328	9	6
4384	328	10	0
4385	328	11	4
4386	328	12	4
4387	328	13	7
4388	328	14	4
4389	328	15	5
4390	328	16	6
4391	328	17	5
4392	328	18	4
4393	315	1	6
4394	315	2	3
4395	315	3	4
4396	315	4	5
4397	315	5	5
4398	315	6	4
4399	315	7	2
4400	315	8	4
4401	315	9	3
4402	315	10	3
4403	315	11	4
4404	315	12	4
4405	315	13	3
4406	315	14	2
4407	315	15	5
4408	315	16	4
4409	315	17	4
4410	315	18	4
4411	331	1	6
4412	331	2	4
4413	331	3	5
4414	331	4	4
4415	331	5	5
4416	331	6	5
4417	331	7	3
4418	331	8	4
4419	331	9	4
4420	331	10	5
4421	331	11	3
4422	331	12	4
4423	331	13	5
4424	331	14	6
4425	331	15	4
4426	331	16	5
4427	331	17	4
4428	331	18	4
4429	316	1	5
4430	316	2	3
4431	316	3	6
4432	316	4	3
4433	316	5	7
4434	316	6	6
4435	316	7	4
4436	316	8	4
4437	316	9	3
4438	316	10	4
4439	316	11	4
4440	316	12	5
4441	316	13	6
4442	316	14	6
4443	316	15	3
4444	316	16	4
4445	316	17	4
4446	316	18	4
4447	330	1	5
4448	330	2	4
4449	330	3	5
4450	330	4	4
4451	330	5	5
4452	330	6	6
4453	330	7	4
4454	330	8	4
4455	330	9	5
4456	330	10	6
4457	330	11	4
4458	330	12	0
4459	330	13	5
4460	330	14	3
4461	330	15	4
4462	330	16	5
4463	330	17	4
4464	330	18	6
4465	311	1	0
4466	311	2	0
4467	311	3	5
4468	311	4	4
4469	311	5	0
4470	311	6	6
4471	311	7	7
4472	311	8	0
4473	311	9	5
4474	311	10	0
4475	311	11	6
4476	311	12	6
4477	311	13	7
4478	311	14	0
4916	367	2	6
4479	311	15	0
4480	311	16	0
4481	311	17	6
4482	311	18	0
4483	310	1	6
4484	310	2	4
4485	310	3	4
4486	310	4	4
4487	310	5	7
4488	310	6	6
4489	310	7	5
4490	310	8	5
4491	310	9	4
4492	310	10	6
4493	310	11	4
4494	310	12	5
4495	310	13	5
4496	310	14	4
4497	310	15	0
4498	310	16	5
4499	310	17	5
4500	310	18	6
4501	333	1	0
4502	333	2	4
4503	333	3	5
4504	333	4	0
4505	333	5	5
4506	333	6	4
4507	333	7	4
4508	333	8	0
4509	333	9	2
4510	333	10	5
4511	333	11	2
4512	333	12	0
4513	333	13	4
4514	333	14	5
4515	333	15	5
4516	333	16	4
4517	333	17	0
4518	333	18	6
4519	299	1	5
4520	299	2	6
4521	299	3	5
4522	299	4	7
4523	299	5	0
4524	299	6	7
4525	299	7	6
4526	299	8	4
4527	299	9	4
4528	299	10	6
4529	299	11	6
4530	299	12	5
4531	299	13	6
4532	299	14	4
4533	299	15	0
4534	299	16	5
4535	299	17	5
4536	299	18	0
4537	309	1	5
4538	309	2	3
4539	309	3	6
4540	309	4	4
4541	309	5	7
4542	309	6	6
4543	309	7	4
4544	309	8	5
4545	309	9	5
4546	309	10	0
4547	309	11	3
4548	309	12	5
4549	309	13	4
4550	309	14	4
4551	309	15	5
4552	309	16	5
4553	309	17	5
4554	309	18	7
4555	306	1	7
4556	306	2	5
4557	306	3	6
4558	306	4	5
4559	306	5	5
4560	306	6	6
4561	306	7	4
4562	306	8	5
4563	306	9	3
4564	306	10	4
4565	306	11	0
4566	306	12	0
4567	306	13	4
4568	306	14	4
4569	306	15	6
4570	306	16	0
4571	306	17	5
4572	306	18	6
4573	324	1	6
4574	324	2	4
4575	324	3	5
4576	324	4	0
4577	324	5	6
4578	324	6	6
4579	324	7	3
4580	324	8	4
4581	324	9	5
4582	324	10	5
4583	324	11	3
4584	324	12	5
4585	324	13	6
4586	324	14	4
4587	324	15	5
4588	324	16	6
4589	324	17	4
4590	324	18	6
4591	334	1	8
4592	334	2	0
4593	334	3	5
4594	334	4	6
4595	334	5	0
4596	334	6	6
4597	334	7	0
4598	334	8	6
4599	334	9	5
4600	334	10	0
4601	334	11	2
4602	334	12	5
4603	334	13	6
4604	334	14	0
4605	334	15	5
4606	334	16	0
4607	334	17	4
4608	334	18	0
4609	321	1	5
4610	321	2	3
4611	321	3	5
4612	321	4	5
4613	321	5	7
4614	321	6	6
4615	321	7	4
4616	321	8	5
4617	321	9	4
4618	321	10	0
4619	321	11	4
4620	321	12	5
4621	321	13	5
4622	321	14	4
4623	321	15	4
4624	321	16	6
4625	321	17	5
4626	321	18	5
4627	304	1	6
4628	304	2	4
4629	304	3	6
4630	304	4	5
4631	304	5	9
4632	304	6	6
4633	304	7	3
4634	304	8	0
4635	304	9	5
4636	304	10	6
4637	304	11	5
4638	304	12	5
4639	304	13	5
4640	304	14	4
4641	304	15	6
4642	304	16	6
4643	304	17	7
4644	304	18	6
4645	307	1	8
4646	307	2	4
4647	307	3	4
4648	307	4	5
4649	307	5	7
4650	307	6	5
4651	307	7	5
4652	307	8	7
4653	307	9	4
4654	307	10	8
4655	307	11	3
4656	307	12	6
4657	307	13	7
4658	307	14	0
4659	307	15	7
4660	307	16	7
4661	307	17	6
4662	307	18	6
4663	329	1	5
4664	329	2	4
4665	329	3	6
4666	329	4	6
4667	329	5	5
4668	329	6	4
4669	329	7	3
4670	329	8	5
4671	329	9	5
4672	329	10	5
4673	329	11	5
4674	329	12	4
4675	329	13	4
4676	329	14	4
4677	329	15	4
4678	329	16	5
4679	329	17	6
4680	329	18	5
4681	301	1	6
4682	301	2	4
4683	301	3	7
4684	301	4	5
4685	301	5	7
4686	301	6	6
4687	301	7	5
4688	301	8	6
4689	301	9	4
4690	301	10	5
4691	301	11	5
4692	301	12	5
4693	301	13	6
4694	301	14	5
4695	301	15	0
4696	301	16	0
4697	301	17	7
4698	301	18	6
4699	303	1	8
4700	303	2	4
4701	303	3	5
4702	303	4	5
4703	303	5	5
4704	303	6	5
4705	303	7	4
4706	303	8	4
4707	303	9	4
4708	303	10	6
4709	303	11	5
4710	303	12	5
4711	303	13	4
4712	303	14	5
4713	303	15	7
4714	303	16	7
4715	303	17	6
4716	303	18	5
4717	318	1	7
4718	318	2	3
4719	318	3	4
4720	318	4	5
4721	318	5	6
4722	318	6	5
4723	318	7	4
4724	318	8	0
4725	318	9	0
4726	318	10	6
4727	318	11	3
4728	318	12	4
4729	318	13	6
4730	318	14	4
4731	318	15	4
4732	318	16	6
4733	318	17	5
4734	318	18	4
4735	308	1	5
4736	308	2	0
4737	308	3	5
4738	308	4	6
4739	308	5	0
4740	308	6	6
4741	308	7	5
4742	308	8	5
4743	308	9	4
4744	308	10	5
4745	308	11	4
4746	308	12	5
4747	308	13	0
4748	308	14	5
4749	308	15	5
4750	308	16	8
4751	308	17	5
4752	308	18	0
4753	314	1	7
4754	314	2	3
4755	314	3	5
4756	314	4	5
4757	314	5	6
4758	314	6	5
4759	314	7	2
4760	314	8	4
4761	314	9	3
4762	314	10	6
4763	314	11	5
4764	314	12	7
4765	314	13	5
4766	314	14	5
4767	314	15	4
4768	314	16	0
4769	314	17	5
6049	404	1	6
4770	314	18	5
4773	323	3	5
4774	323	4	5
4775	323	5	5
4776	323	6	5
4777	323	7	4
4778	323	8	4
4779	323	9	3
4780	323	10	4
4781	323	11	4
4782	323	12	3
4783	323	13	5
4784	323	14	4
4785	323	15	5
4786	323	16	7
4787	323	17	5
4788	323	18	5
4917	367	3	5
6643	480	1	5
4789	313	1	0
4790	313	2	0
4791	313	3	7
4792	313	4	0
4793	313	5	6
4794	313	6	7
4795	313	7	4
4796	313	8	6
4797	313	9	4
4798	313	10	6
4799	313	11	6
4800	313	12	6
4801	313	13	6
4802	313	14	0
4803	313	15	7
4804	313	16	8
4805	313	17	5
4806	313	18	6
4807	322	1	6
4808	322	2	3
4809	322	3	5
4810	322	4	6
4811	322	5	3
4812	322	6	6
4813	322	7	3
4814	322	8	4
4815	322	9	5
4816	322	10	3
4817	322	11	3
4818	322	12	4
4819	322	13	4
4820	322	14	4
4821	322	15	4
4822	322	16	5
4823	322	17	4
4824	322	18	6
4825	305	1	6
4826	305	2	5
4827	305	3	5
4828	305	4	6
4829	305	5	0
4830	305	6	7
4831	305	7	6
4832	305	8	5
4833	305	9	5
4834	305	10	6
4835	305	11	4
4836	305	12	5
4837	305	13	6
4838	305	14	4
4839	305	15	6
4840	305	16	0
4841	305	17	0
4842	305	18	7
4843	320	1	5
4844	320	2	2
4845	320	3	6
4846	320	4	4
4847	320	5	7
4848	320	6	6
4849	320	7	0
4850	320	8	5
4851	320	9	4
4852	320	10	4
4853	320	11	4
4854	320	12	4
4855	320	13	4
4856	320	14	4
4857	320	15	4
4858	320	16	6
4859	320	17	6
4860	320	18	4
4861	300	1	6
4862	300	2	4
4863	300	3	4
4864	300	4	5
4865	300	5	7
4866	300	6	6
4867	300	7	3
4868	300	8	5
4869	300	9	0
4870	300	10	4
4871	300	11	0
4872	300	12	4
4873	300	13	6
4874	300	14	0
4875	300	15	5
4876	300	16	6
4877	300	17	6
4878	300	18	6
4879	302	1	8
4880	302	2	5
4881	302	3	4
4882	302	4	6
4883	302	5	8
4884	302	6	6
4885	302	7	5
4886	302	8	7
4887	302	9	3
4888	302	10	6
4889	302	11	4
4890	302	12	4
4891	302	13	6
4892	302	14	0
4893	302	15	5
4894	302	16	5
4895	302	17	6
4896	302	18	7
4897	312	1	8
4898	312	2	0
4899	312	3	0
4900	312	4	6
4901	312	5	0
4902	312	6	6
4903	312	7	6
4904	312	8	0
4905	312	9	6
4906	312	10	0
4907	312	11	4
4908	312	12	7
4909	312	13	7
4910	312	14	6
4911	312	15	8
4912	312	16	8
4913	312	17	5
4914	312	18	0
4771	323	1	5
4772	323	2	4
4918	367	4	5
4919	367	5	9
4920	367	6	5
4921	367	7	4
4922	367	8	6
4923	367	9	6
4924	367	10	5
4925	367	11	5
4926	367	12	5
4927	367	13	5
4928	367	14	4
4929	367	15	6
4930	367	16	0
4931	367	17	6
4932	367	18	6
4933	391	1	6
4934	391	2	4
4935	391	3	6
4936	391	4	6
4937	391	5	6
4938	391	6	0
4939	391	7	4
4940	391	8	0
4941	391	9	0
4942	391	10	5
4943	391	11	4
4944	391	12	5
4945	391	13	6
4946	391	14	4
4947	391	15	0
4948	391	16	0
4949	391	17	3
4950	391	18	5
4951	344	1	0
4952	344	2	4
4953	344	3	5
4954	344	4	5
4955	344	5	6
4956	344	6	4
4957	344	7	4
4958	344	8	4
4959	344	9	4
4960	344	10	4
4961	344	11	4
4962	344	12	5
4963	344	13	5
4964	344	14	5
4965	344	15	5
4966	344	16	5
4967	344	17	5
4968	344	18	4
4969	348	1	6
4970	348	2	5
4971	348	3	5
4972	348	4	6
4973	348	5	6
4974	348	6	6
4975	348	7	3
4976	348	8	5
4977	348	9	5
4978	348	10	5
4979	348	11	4
4980	348	12	5
4981	348	13	6
4982	348	14	4
4983	348	15	4
4984	348	16	7
4985	348	17	5
4986	348	18	7
4987	399	1	0
4988	399	2	3
4989	399	3	5
4990	399	4	4
4991	399	5	0
4992	399	6	5
4993	399	7	3
4994	399	8	6
4995	399	9	4
4996	399	10	4
4997	399	11	4
4998	399	12	5
4999	399	13	5
5000	399	14	0
5001	399	15	6
5002	399	16	6
5003	399	17	4
5004	399	18	0
5005	351	1	4
5006	351	2	4
5007	351	3	6
5008	351	4	5
5009	351	5	4
5010	351	6	6
5011	351	7	4
5012	351	8	0
5013	351	9	5
5014	351	10	5
5015	351	11	4
5016	351	12	4
5017	351	13	6
5018	351	14	4
5019	351	15	0
5020	351	16	5
5021	351	17	4
5022	351	18	6
5023	381	1	6
5024	381	2	6
5025	381	3	4
5026	381	4	0
5027	381	5	5
5028	381	6	0
5029	381	7	3
5030	381	8	5
5031	381	9	4
5032	381	10	4
5033	381	11	3
5034	381	12	0
5035	381	13	4
5036	381	14	4
5037	381	15	4
5038	381	16	5
5039	381	17	3
5040	381	18	5
5041	363	1	0
5042	363	2	5
5043	363	3	7
5044	363	4	0
5045	363	5	6
5046	363	6	7
5047	363	7	6
5048	363	8	5
5049	363	9	3
5050	363	10	6
5051	363	11	4
5052	363	12	4
5053	363	13	4
5054	363	14	4
5055	363	15	0
5056	363	16	7
5057	363	17	6
5058	363	18	6
5059	397	1	5
5060	397	2	0
5061	397	3	4
5062	397	4	0
5063	397	5	7
5064	397	6	4
5065	397	7	3
5066	397	8	5
5067	397	9	6
5068	397	10	6
5069	397	11	0
5070	397	12	0
5071	397	13	4
5072	397	14	5
5073	397	15	4
5074	397	16	5
5075	397	17	6
5076	397	18	7
5077	346	1	5
5078	346	2	4
5079	346	3	5
5080	346	4	4
5081	346	5	6
5082	346	6	5
5083	346	7	5
5084	346	8	4
5085	346	9	3
5086	346	10	5
5087	346	11	3
5088	346	12	0
5089	346	13	4
5090	346	14	4
5091	346	15	3
5092	346	16	4
5093	346	17	4
5094	346	18	5
5095	374	1	5
5096	374	2	6
5097	374	3	4
5098	374	4	5
5099	374	5	5
5100	374	6	7
5101	374	7	5
5102	374	8	4
5103	374	9	4
5104	374	10	5
5105	374	11	3
5106	374	12	4
5107	374	13	4
5108	374	14	6
5109	374	15	6
5110	374	16	7
5111	374	17	6
5112	374	18	6
5113	369	1	7
5114	369	2	6
5115	369	3	5
5116	369	4	0
5117	369	5	6
5118	369	6	7
5119	369	7	4
5120	369	8	0
5121	369	9	5
5122	369	10	5
5123	369	11	5
5124	369	12	6
5125	369	13	5
5126	369	14	4
5127	369	15	5
5128	369	16	8
5129	369	17	5
5130	369	18	7
5131	362	1	0
5132	362	2	4
5133	362	3	6
5134	362	4	6
5135	362	5	5
5136	362	6	5
5137	362	7	3
5138	362	8	4
5139	362	9	4
5140	362	10	5
5141	362	11	5
5142	362	12	6
5143	362	13	5
5144	362	14	4
5145	362	15	5
5146	362	16	6
5147	362	17	5
5148	362	18	6
5149	345	1	6
5150	345	2	4
5151	345	3	4
5152	345	4	5
5153	345	5	7
5154	345	6	5
5155	345	7	3
5156	345	8	5
5157	345	9	4
5158	345	10	4
5159	345	11	3
5160	345	12	5
5161	345	13	5
5162	345	14	3
5163	345	15	4
5164	345	16	7
5165	345	17	6
5166	345	18	5
5167	338	1	6
5168	338	2	5
5169	338	3	5
5170	338	4	6
5171	338	5	6
5172	338	6	6
5173	338	7	3
5174	338	8	5
5175	338	9	3
5176	338	10	4
5177	338	11	3
5178	338	12	4
5179	338	13	6
5180	338	14	5
5181	338	15	4
5182	338	16	6
5183	338	17	5
5184	338	18	5
5185	336	1	6
5186	336	2	4
5187	336	3	3
5188	336	4	5
5189	336	5	5
5190	336	6	4
5191	336	7	3
5192	336	8	5
5193	336	9	2
5194	336	10	6
5195	336	11	4
5196	336	12	4
5197	336	13	5
5198	336	14	4
5199	336	15	3
5200	336	16	5
5201	336	17	5
5202	336	18	4
5203	388	1	6
5204	388	2	5
5205	388	3	5
5206	388	4	6
5207	388	5	0
5208	388	6	7
6050	404	2	4
5209	388	7	3
5210	388	8	5
5211	388	9	4
5212	388	10	5
5213	388	11	5
5214	388	12	5
5215	388	13	5
5216	388	14	4
5217	388	15	8
5218	388	16	7
5219	388	17	7
5220	388	18	5
5221	365	1	7
5222	365	2	6
5223	365	3	6
5224	365	4	5
5225	365	5	6
5226	365	6	6
5227	365	7	5
5228	365	8	4
5229	365	9	7
5230	365	10	5
5231	365	11	4
5232	365	12	6
5233	365	13	5
5234	365	14	4
5235	365	15	7
5236	365	16	7
5237	365	17	7
5238	365	18	6
5239	378	1	0
5240	378	2	5
5241	378	3	0
5242	378	4	6
5243	378	5	8
5244	378	6	0
5245	378	7	5
5246	378	8	0
5247	378	9	6
5248	378	10	0
5249	378	11	0
5250	378	12	6
5251	378	13	6
5252	378	14	5
5253	378	15	6
5254	378	16	8
5255	378	17	0
5256	378	18	0
5257	352	1	6
5258	352	2	3
5259	352	3	4
5260	352	4	4
5261	352	5	5
5262	352	6	6
5263	352	7	4
5264	352	8	4
5265	352	9	5
5266	352	10	0
5267	352	11	3
5268	352	12	4
5269	352	13	4
5270	352	14	3
5271	352	15	5
5272	352	16	0
5273	352	17	4
5274	352	18	5
5275	354	1	4
5276	354	2	0
5277	354	3	6
5278	354	4	5
5279	354	5	5
5280	354	6	5
5281	354	7	4
5282	354	8	7
5283	354	9	4
5284	354	10	5
5285	354	11	4
5286	354	12	5
5287	354	13	5
5288	354	14	5
5289	354	15	5
5290	354	16	6
5291	354	17	5
5292	354	18	4
5293	335	1	6
5294	335	2	5
5295	335	3	5
5296	335	4	4
5297	335	5	0
5298	335	6	5
5299	335	7	6
5300	335	8	5
5301	335	9	5
5302	335	10	0
5303	335	11	4
5304	335	12	4
5305	335	13	5
5306	335	14	4
5307	335	15	5
5308	335	16	7
5309	335	17	4
5310	335	18	5
5311	347	1	7
5312	347	2	3
5313	347	3	5
5314	347	4	6
5315	347	5	6
5316	347	6	5
5317	347	7	4
5318	347	8	4
5319	347	9	2
5320	347	10	4
5321	347	11	3
5322	347	12	4
5323	347	13	4
5324	347	14	3
5325	347	15	6
5326	347	16	6
5327	347	17	5
5328	347	18	4
5329	359	1	0
5330	359	2	5
5331	359	3	5
5332	359	4	6
5333	359	5	0
5334	359	6	6
5335	359	7	3
5336	359	8	4
5337	359	9	4
5338	359	10	5
5339	359	11	3
5340	359	12	4
5341	359	13	6
5342	359	14	0
5343	359	15	5
5344	359	16	7
5345	359	17	5
5346	359	18	6
5347	379	1	6
5348	379	2	3
5349	379	3	5
5350	379	4	5
5351	379	5	8
5352	379	6	5
5353	379	7	6
5354	379	8	6
5355	379	9	3
5356	379	10	4
5357	379	11	4
5358	379	12	4
5359	379	13	6
5360	379	14	4
5361	379	15	8
5362	379	16	5
5363	379	17	5
5364	379	18	5
5365	372	1	6
5366	372	2	3
5367	372	3	6
5368	372	4	6
5369	372	5	5
5370	372	6	7
5371	372	7	5
5372	372	8	7
5373	372	9	0
5374	372	10	6
5375	372	11	4
5376	372	12	5
5377	372	13	6
5378	372	14	5
5379	372	15	0
5380	372	16	6
5381	372	17	5
5382	372	18	0
5383	376	1	5
5384	376	2	5
5385	376	3	6
5386	376	4	6
5387	376	5	7
5388	376	6	5
5389	376	7	4
5390	376	8	5
5391	376	9	4
5392	376	10	0
5393	376	11	3
5394	376	12	5
5395	376	13	5
5396	376	14	4
5397	376	15	5
5398	376	16	7
5399	376	17	5
5400	376	18	5
5401	356	1	5
5402	356	2	4
5403	356	3	5
5404	356	4	4
5405	356	5	5
5406	356	6	6
5407	356	7	4
5408	356	8	5
5409	356	9	4
5410	356	10	4
5411	356	11	4
5412	356	12	4
5413	356	13	0
5414	356	14	6
5415	356	15	4
5416	356	16	7
5417	356	17	5
5418	356	18	5
5419	337	1	5
5420	337	2	4
5421	337	3	5
5422	337	4	4
5423	337	5	5
5424	337	6	6
5425	337	7	4
5426	337	8	5
5427	337	9	5
5428	337	10	3
5429	337	11	3
5430	337	12	5
5431	337	13	5
5432	337	14	3
5433	337	15	5
5434	337	16	7
5435	337	17	4
5436	337	18	5
5437	387	1	5
5438	387	2	3
5439	387	3	6
5440	387	4	0
5441	387	5	7
5442	387	6	5
5443	387	7	3
5444	387	8	7
5445	387	9	5
5446	387	10	6
5447	387	11	5
5448	387	12	5
5449	387	13	4
5450	387	14	4
5451	387	15	6
5452	387	16	5
5453	387	17	5
5454	387	18	0
5455	370	1	7
5456	370	2	2
5457	370	3	5
5458	370	4	5
5459	370	5	6
5460	370	6	6
5461	370	7	4
5462	370	8	6
5463	370	9	4
5464	370	10	0
5465	370	11	5
5466	370	12	5
5467	370	13	5
5468	370	14	0
5469	370	15	4
5470	370	16	5
5471	370	17	5
5472	370	18	5
5474	394	2	4
5475	394	3	6
5476	394	4	5
5477	394	5	5
5478	394	6	6
5479	394	7	5
5480	394	8	5
5481	394	9	3
5482	394	10	6
5483	394	11	4
5484	394	12	5
5485	394	13	7
5486	394	14	4
5487	394	15	6
5488	394	16	6
5489	394	17	6
5490	394	18	5
6051	404	3	6
5491	366	1	6
5492	366	2	4
5493	366	3	5
5494	366	4	5
5495	366	5	7
5496	366	6	7
5497	366	7	5
5498	366	8	5
5499	366	9	6
8155	614	1	0
5500	366	10	7
5501	366	11	5
5502	366	12	6
5503	366	13	6
5504	366	14	3
5505	366	15	6
5506	366	16	7
5507	366	17	4
5508	366	18	5
5509	357	1	5
5510	357	2	4
5511	357	3	5
5512	357	4	6
5513	357	5	6
5514	357	6	5
5515	357	7	3
5516	357	8	5
5517	357	9	4
5518	357	10	6
5519	357	11	4
5520	357	12	4
5521	357	13	4
5522	357	14	3
5523	357	15	4
5524	357	16	6
5525	357	17	5
5526	357	18	0
5527	364	1	6
5528	364	2	4
5529	364	3	5
5530	364	4	4
5531	364	5	6
5532	364	6	5
5533	364	7	3
5534	364	8	4
5535	364	9	5
5536	364	10	4
5537	364	11	3
5538	364	12	5
5539	364	13	0
5540	364	14	4
5541	364	15	6
5542	364	16	6
5543	364	17	4
5544	364	18	6
5545	371	1	7
5546	371	2	4
5547	371	3	5
5548	371	4	7
5549	371	5	7
5550	371	6	5
5551	371	7	5
5552	371	8	5
5553	371	9	5
5554	371	10	5
5555	371	11	3
5556	371	12	5
5557	371	13	5
5558	371	14	4
5559	371	15	6
5560	371	16	7
5561	371	17	8
5562	371	18	5
5563	355	1	5
5564	355	2	3
5565	355	3	5
5566	355	4	4
5567	355	5	5
5568	355	6	5
5569	355	7	3
5570	355	8	4
5571	355	9	4
5572	355	10	5
5573	355	11	3
5574	355	12	4
5575	355	13	4
5576	355	14	4
5577	355	15	4
5578	355	16	6
5579	355	17	4
5580	355	18	7
5581	375	1	0
5582	375	2	4
5583	375	3	5
5584	375	4	5
5585	375	5	8
5586	375	6	8
5587	375	7	6
5588	375	8	6
5589	375	9	5
5590	375	10	0
5591	375	11	4
5592	375	12	7
5593	375	13	6
5594	375	14	0
5595	375	15	0
5596	375	16	9
5597	375	17	6
5598	375	18	5
5599	353	1	6
5600	353	2	7
5601	353	3	5
5602	353	4	6
5603	353	5	5
5604	353	6	5
5605	353	7	5
5606	353	8	5
5607	353	9	0
5608	353	10	5
5609	353	11	3
5610	353	12	4
5611	353	13	5
5612	353	14	5
5613	353	15	5
5614	353	16	6
5615	353	17	4
5616	353	18	6
5617	400	1	6
5618	400	2	5
5619	400	3	8
5620	400	4	6
5621	400	5	9
5622	400	6	4
5623	400	7	6
5624	400	8	0
5625	400	9	0
5626	400	10	6
5627	400	11	4
5628	400	12	6
5629	400	13	6
5630	400	14	5
5631	400	15	7
5632	400	16	9
5633	400	17	7
5634	400	18	6
5635	368	1	6
5636	368	2	4
5637	368	3	6
5638	368	4	5
5639	368	5	8
5640	368	6	7
5641	368	7	4
5642	368	8	6
5643	368	9	0
5644	368	10	6
5645	368	11	3
5646	368	12	5
5647	368	13	5
5648	368	14	5
5649	368	15	6
5650	368	16	7
5651	368	17	6
5652	368	18	6
5653	373	1	7
5654	373	2	5
5655	373	3	5
5656	373	4	5
5657	373	5	0
5658	373	6	6
5659	373	7	5
5660	373	8	4
5661	373	9	5
5662	373	10	0
5663	373	11	0
5664	373	12	0
5665	373	13	6
5666	373	14	4
5667	373	15	0
5668	373	16	7
5669	373	17	5
5670	373	18	0
5671	377	1	8
5672	377	2	5
5673	377	3	0
5674	377	4	6
5675	377	5	7
5676	377	6	6
5677	377	7	3
5678	377	8	6
5679	377	9	0
5680	377	10	6
5681	377	11	0
5682	377	12	6
5683	377	13	6
5684	377	14	4
5685	377	15	6
5686	377	16	8
5687	377	17	5
5688	377	18	7
5689	349	1	6
5690	349	2	4
5691	349	3	5
5692	349	4	6
5693	349	5	7
5694	349	6	6
5695	349	7	4
5696	349	8	6
5697	349	9	4
5698	349	10	5
5699	349	11	3
5700	349	12	3
5701	349	13	4
5702	349	14	4
5703	349	15	5
5704	349	16	6
5705	349	17	4
5706	349	18	4
5707	343	1	5
5708	343	2	4
5709	343	3	5
5710	343	4	4
5711	343	5	4
5712	343	6	5
5713	343	7	2
5714	343	8	3
5715	343	9	3
5716	343	10	5
5717	343	11	3
5718	343	12	5
5719	343	13	5
5720	343	14	4
5721	343	15	5
5722	343	16	5
5723	343	17	4
5724	343	18	4
5725	340	1	5
5726	340	2	4
5727	340	3	5
5728	340	4	3
5729	340	5	4
5730	340	6	6
5731	340	7	3
5732	340	8	4
5733	340	9	4
5734	340	10	5
5735	340	11	3
5736	340	12	4
5737	340	13	4
5738	340	14	3
5739	340	15	4
5740	340	16	4
5741	340	17	4
5742	340	18	4
5743	342	1	5
5744	342	2	3
5745	342	3	5
5746	342	4	5
5747	342	5	5
5748	342	6	4
5749	342	7	3
5750	342	8	0
5751	342	9	5
5752	342	10	6
5753	342	11	3
5754	342	12	5
5755	342	13	5
5756	342	14	4
5757	342	15	0
5758	342	16	5
5759	342	17	4
5760	342	18	4
5761	390	1	6
5762	390	2	4
5763	390	3	6
5764	390	4	4
5765	390	5	4
5766	390	6	4
5767	390	7	3
5768	390	8	5
5769	390	9	4
5770	390	10	5
5771	390	11	4
5772	390	12	4
5773	390	13	4
5774	390	14	3
5775	390	15	4
5776	390	16	5
5777	390	17	4
5778	390	18	5
5779	393	1	5
5780	393	2	5
5781	393	3	4
5782	393	4	5
5783	393	5	5
5784	393	6	4
5785	393	7	3
5786	393	8	3
5787	393	9	3
5788	393	10	0
5789	393	11	4
5790	393	12	5
6644	480	2	3
5791	393	13	4
5792	393	14	2
5793	393	15	4
5794	393	16	7
5795	393	17	4
5796	393	18	5
5797	358	1	6
5798	358	2	3
5799	358	3	5
5800	358	4	4
5801	358	5	5
5802	358	6	0
5803	358	7	4
5804	358	8	4
5805	358	9	3
5806	358	10	6
5807	358	11	4
5808	358	12	5
5809	358	13	4
5810	358	14	4
5811	358	15	4
5812	358	16	5
5813	358	17	5
5814	358	18	7
5815	361	1	7
5816	361	2	5
5817	361	3	6
5818	361	4	6
5819	361	5	8
5820	361	6	5
5821	361	7	3
5822	361	8	4
5823	361	9	4
5824	361	10	5
5825	361	11	3
5826	361	12	4
5827	361	13	5
5828	361	14	4
5829	361	15	4
5830	361	16	6
5831	361	17	6
5832	361	18	6
5833	360	1	0
5834	360	2	2
5835	360	3	4
5836	360	4	5
5837	360	5	5
5838	360	6	5
5839	360	7	3
5840	360	8	5
5841	360	9	5
5842	360	10	4
5843	360	11	3
5844	360	12	5
5845	360	13	5
5846	360	14	4
5847	360	15	6
5848	360	16	5
5849	360	17	5
5850	360	18	4
5851	341	1	6
5852	341	2	4
5853	341	3	5
5854	341	4	5
5855	341	5	6
5856	341	6	4
5857	341	7	4
5858	341	8	4
5859	341	9	4
5860	341	10	0
5861	341	11	4
5862	341	12	5
5863	341	13	4
5864	341	14	4
5865	341	15	5
5866	341	16	7
5867	341	17	5
5868	341	18	4
5869	396	1	7
5870	396	2	4
5871	396	3	7
5872	396	4	5
5873	396	5	7
5874	396	6	6
5875	396	7	3
5876	396	8	4
5877	396	9	5
5878	396	10	0
5879	396	11	3
5880	396	12	5
5881	396	13	4
5882	396	14	4
5883	396	15	6
5884	396	16	4
5885	396	17	4
5886	396	18	4
5887	382	1	6
5888	382	2	4
5889	382	3	4
5890	382	4	5
5891	382	5	6
5892	382	6	4
5893	382	7	4
5894	382	8	4
5895	382	9	4
5896	382	10	6
5897	382	11	5
5898	382	12	5
5899	382	13	6
5900	382	14	3
5901	382	15	5
5902	382	16	7
5903	382	17	5
5904	382	18	3
5905	385	1	9
5906	385	2	4
5907	385	3	6
5908	385	4	6
5909	385	5	5
6645	480	3	0
5911	385	7	3
5912	385	8	5
5913	385	9	4
5914	385	10	5
5915	385	11	4
5916	385	12	4
5917	385	13	5
5918	385	14	4
5919	385	15	4
5920	385	16	8
5921	385	17	4
5922	385	18	6
5923	392	1	8
5924	392	2	5
5925	392	3	0
5926	392	4	0
5927	392	5	7
5928	392	6	5
5929	392	7	5
5930	392	8	5
5931	392	9	4
5932	392	10	6
5933	392	11	4
5934	392	12	0
5935	392	13	6
5936	392	14	0
5937	392	15	4
5938	392	16	5
5939	392	17	6
5940	392	18	0
5941	389	1	0
5942	389	2	0
5943	389	3	0
5944	389	4	6
5945	389	5	6
5946	389	6	0
5947	389	7	4
5948	389	8	5
5949	389	9	5
5950	389	10	4
5951	389	11	3
5952	389	12	6
5953	389	13	4
5954	389	14	4
5955	389	15	6
5956	389	16	0
5957	389	17	6
5958	389	18	0
5959	384	1	9
5960	384	2	4
5961	384	3	6
5962	384	4	6
5963	384	5	6
5964	384	6	4
5965	384	7	6
5966	384	8	4
5967	384	9	0
5968	384	10	5
5969	384	11	4
5970	384	12	4
5971	384	13	5
5972	384	14	0
5973	384	15	5
5974	384	16	8
5975	384	17	4
5976	384	18	9
5473	394	1	6
5977	395	1	0
5978	395	2	3
5979	395	3	6
5980	395	4	5
5981	395	5	5
5982	395	6	0
5983	395	7	4
5984	395	8	5
5985	395	9	0
5986	395	10	5
5987	395	11	3
5988	395	12	6
5989	395	13	6
5990	395	14	3
5991	395	15	6
5992	395	16	8
5993	395	17	5
5994	395	18	7
5995	383	1	6
5996	383	2	4
5997	383	3	6
5998	383	4	6
5999	383	5	0
6000	383	6	5
6001	383	7	5
6002	383	8	5
6003	383	9	0
6004	383	10	5
6005	383	11	4
6006	383	12	4
6007	383	13	6
6008	383	14	5
6009	383	15	0
6010	383	16	6
6011	383	17	6
6012	383	18	7
6013	398	1	7
6014	398	2	4
6015	398	3	6
6016	398	4	0
6017	398	5	7
6018	398	6	5
6019	398	7	3
6020	398	8	4
6021	398	9	4
6022	398	10	5
6023	398	11	5
6024	398	12	5
6025	398	13	5
6026	398	14	5
6027	398	15	0
6028	398	16	7
6029	398	17	5
6030	398	18	6
5910	385	6	6
6059	404	11	3
6060	404	12	4
6061	404	13	5
6062	404	14	4
6063	404	15	4
6064	404	16	5
6065	404	17	0
6066	404	18	6
6032	425	2	4
6033	425	3	5
6034	425	4	4
6035	425	5	6
6036	425	6	5
6037	425	7	5
6038	425	8	5
6039	425	9	3
6040	425	10	4
6041	425	11	3
6042	425	12	4
6043	425	13	4
6044	425	14	6
6045	425	15	0
6046	425	16	5
6047	425	17	4
6048	425	18	5
6052	404	4	5
6053	404	5	5
6054	404	6	3
6055	404	7	4
6056	404	8	5
6057	404	9	3
6058	404	10	6
6067	439	1	7
6068	439	2	4
6069	439	3	0
6070	439	4	7
6071	439	5	0
6072	439	6	5
6073	439	7	5
6074	439	8	8
6075	439	9	6
6076	439	10	8
6077	439	11	4
6078	439	12	5
6079	439	13	8
6080	439	14	0
6081	439	15	0
6082	439	16	7
6083	439	17	0
6084	439	18	0
6085	401	1	6
6086	401	2	3
6087	401	3	4
6088	401	4	4
6089	401	5	5
6090	401	6	4
6091	401	7	3
6092	401	8	3
6093	401	9	0
6094	401	10	4
6095	401	11	3
6096	401	12	4
6097	401	13	5
6098	401	14	4
6099	401	15	0
6100	401	16	5
6101	401	17	3
6102	401	18	6
6103	412	1	7
6104	412	2	4
6105	412	3	5
6106	412	4	4
6107	412	5	5
6108	412	6	4
6109	412	7	4
6110	412	8	6
6111	412	9	4
6112	412	10	5
6113	412	11	4
6114	412	12	5
6115	412	13	4
6116	412	14	2
6117	412	15	4
6118	412	16	8
6119	412	17	4
6120	412	18	6
6121	414	1	7
6122	414	2	4
6123	414	3	6
6124	414	4	4
6125	414	5	0
6126	414	6	5
6127	414	7	4
6128	414	8	6
6129	414	9	3
6130	414	10	0
6131	414	11	3
6132	414	12	4
6133	414	13	4
6134	414	14	3
6135	414	15	4
6136	414	16	6
6137	414	17	5
6138	414	18	6
6139	429	1	5
6140	429	2	4
6141	429	3	4
6142	429	4	5
6143	429	5	7
6144	429	6	5
6145	429	7	0
6146	429	8	5
6147	429	9	4
6148	429	10	5
6149	429	11	4
6150	429	12	4
6151	429	13	5
6152	429	14	4
6153	429	15	4
6154	429	16	5
6155	429	17	5
6156	429	18	6
6157	406	1	4
6158	406	2	3
6159	406	3	5
6160	406	4	5
6161	406	5	6
6162	406	6	5
6163	406	7	3
6164	406	8	6
6165	406	9	5
6166	406	10	6
6167	406	11	3
6168	406	12	3
6169	406	13	5
6170	406	14	5
6171	406	15	6
6172	406	16	6
6173	406	17	0
6174	406	18	5
6175	415	1	0
6176	415	2	5
6177	415	3	5
6178	415	4	5
6179	415	5	5
6180	415	6	4
6181	415	7	3
6182	415	8	5
6183	415	9	3
6184	415	10	5
6185	415	11	3
6186	415	12	5
6187	415	13	5
6188	415	14	3
6189	415	15	4
6190	415	16	6
6191	415	17	5
6192	415	18	6
6193	402	1	7
6194	402	2	3
6195	402	3	4
6196	402	4	4
6197	402	5	5
6198	402	6	0
6199	402	7	4
6200	402	8	5
6201	402	9	3
6202	402	10	5
6203	402	11	3
6204	402	12	4
6205	402	13	6
6206	402	14	4
6207	402	15	4
6208	402	16	5
6209	402	17	4
6210	402	18	6
6211	418	1	5
6212	418	2	3
6213	418	3	5
6214	418	4	5
6215	418	5	5
6216	418	6	4
6217	418	7	4
6218	418	8	4
6219	418	9	4
6220	418	10	4
6221	418	11	4
6222	418	12	0
6223	418	13	0
6224	418	14	4
6225	418	15	4
6226	418	16	6
6227	418	17	4
6228	418	18	0
6229	421	1	0
6230	421	2	4
6231	421	3	5
6232	421	4	5
6233	421	5	8
6234	421	6	6
6235	421	7	5
6236	421	8	4
6237	421	9	5
6238	421	10	7
6239	421	11	5
6240	421	12	5
6241	421	13	5
6242	421	14	3
6243	421	15	6
6244	421	16	6
6245	421	17	5
6246	421	18	7
6646	480	4	4
6248	419	2	4
6249	419	3	5
6250	419	4	4
6251	419	5	5
6252	419	6	5
6253	419	7	5
6254	419	8	6
6255	419	9	4
6256	419	10	3
6257	419	11	4
6258	419	12	5
6259	419	13	6
6260	419	14	4
6261	419	15	0
6262	419	16	6
6263	419	17	5
6264	419	18	7
6265	422	1	0
6266	422	2	4
6267	422	3	8
6268	422	4	4
6269	422	5	0
6270	422	6	0
6271	422	7	6
6272	422	8	6
6273	422	9	6
6274	422	10	5
6275	422	11	4
6276	422	12	5
6277	422	13	6
6278	422	14	6
6279	422	15	4
6280	422	16	0
6281	422	17	5
6282	422	18	7
6283	426	1	0
6284	426	2	4
6285	426	3	5
6286	426	4	5
6287	426	5	7
6288	426	6	5
6289	426	7	4
6290	426	8	0
6291	426	9	4
6292	426	10	4
6293	426	11	0
6294	426	12	5
6295	426	13	5
6296	426	14	0
6297	426	15	5
6298	426	16	0
6299	426	17	0
6300	426	18	6
6301	434	1	6
6302	434	2	4
6303	434	3	6
6304	434	4	6
6305	434	5	6
6306	434	6	0
6307	434	7	4
6308	434	8	4
6309	434	9	3
6310	434	10	8
6311	434	11	6
6312	434	12	6
6313	434	13	7
6314	434	14	4
6315	434	15	0
6316	434	16	8
6317	434	17	5
6318	434	18	7
6319	436	1	8
6320	436	2	5
6321	436	3	6
6322	436	4	0
6323	436	5	6
6324	436	6	6
6325	436	7	4
6326	436	8	6
6327	436	9	4
6328	436	10	6
6329	436	11	4
6330	436	12	4
6331	436	13	6
6332	436	14	4
6333	436	15	5
6334	436	16	6
6335	436	17	5
6336	436	18	7
6337	411	1	5
6338	411	2	4
6339	411	3	7
6340	411	4	4
6341	411	5	5
6342	411	6	5
6343	411	7	3
6344	411	8	4
6345	411	9	4
6346	411	10	0
6347	411	11	3
6348	411	12	4
6349	411	13	4
6350	411	14	4
6351	411	15	3
6352	411	16	4
6353	411	17	4
6354	411	18	4
6355	427	1	7
6356	427	2	4
6357	427	3	7
6358	427	4	5
6359	427	5	0
6360	427	6	7
6361	427	7	4
6362	427	8	0
6363	427	9	4
6364	427	10	0
6365	427	11	3
6366	427	12	6
6367	427	13	6
6368	427	14	3
6369	427	15	5
6370	427	16	6
6371	427	17	6
6372	427	18	6
6373	410	1	5
6374	410	2	4
6375	410	3	5
6647	480	5	7
6376	410	4	6
6377	410	5	7
6378	410	6	6
6379	410	7	4
6380	410	8	5
6381	410	9	4
6382	410	10	4
6383	410	11	4
6384	410	12	5
6385	410	13	5
6386	410	14	4
6387	410	15	5
6388	410	16	5
6389	410	17	5
6390	410	18	4
6391	403	1	6
6392	403	2	3
6393	403	3	5
6394	403	4	5
6395	403	5	5
6396	403	6	5
6397	403	7	5
6398	403	8	4
6399	403	9	4
6400	403	10	5
6401	403	11	4
6402	403	12	4
6403	403	13	5
6404	403	14	0
6405	403	15	0
6406	403	16	5
6407	403	17	5
6408	403	18	6
6409	438	1	7
6410	438	2	5
6411	438	3	4
6412	438	4	5
6413	438	5	7
6414	438	6	5
6415	438	7	5
6416	438	8	5
6417	438	9	4
6418	438	10	5
6419	438	11	4
6420	438	12	6
6421	438	13	5
6422	438	14	4
6423	438	15	4
6424	438	16	5
6425	438	17	4
6426	438	18	5
6427	407	1	5
6428	407	2	3
6429	407	3	5
6430	407	4	5
6431	407	5	6
6432	407	6	6
6433	407	7	3
6434	407	8	5
6435	407	9	4
6436	407	10	4
6437	407	11	5
6438	407	12	4
6439	407	13	5
6440	407	14	3
6441	407	15	5
6442	407	16	5
6443	407	17	4
6444	407	18	4
6445	424	1	7
6446	424	2	4
6447	424	3	5
6448	424	4	5
6449	424	5	6
6450	424	6	3
6451	424	7	5
6452	424	8	5
6453	424	9	5
6454	424	10	6
6455	424	11	2
6456	424	12	5
6457	424	13	5
6458	424	14	3
6459	424	15	4
6460	424	16	0
6461	424	17	5
6462	424	18	7
6463	405	1	5
6464	405	2	4
6465	405	3	5
6466	405	4	5
6467	405	5	7
6468	405	6	5
6469	405	7	3
6470	405	8	5
6471	405	9	4
6472	405	10	5
6473	405	11	4
6474	405	12	5
6475	405	13	5
6476	405	14	4
6477	405	15	5
6478	405	16	5
6479	405	17	5
6480	405	18	3
6481	430	1	5
6482	430	2	3
6483	430	3	5
6484	430	4	4
6485	430	5	6
6486	430	6	4
6487	430	7	2
6488	430	8	4
6489	430	9	3
6490	430	10	0
6491	430	11	4
6492	430	12	4
6493	430	13	4
6494	430	14	4
6495	430	15	5
6496	430	16	4
6497	430	17	4
6498	430	18	5
6499	420	1	7
6500	420	2	4
6501	420	3	7
6502	420	4	5
6503	420	5	8
6504	420	6	6
6505	420	7	4
6506	420	8	0
6507	420	9	4
6508	420	10	8
6509	420	11	4
6510	420	12	7
6511	420	13	6
6512	420	14	6
6513	420	15	0
6514	420	16	6
6515	420	17	5
6516	420	18	8
6517	417	1	5
6518	417	2	3
6519	417	3	5
6520	417	4	4
6521	417	5	6
6522	417	6	6
6523	417	7	4
6524	417	8	4
6525	417	9	5
6526	417	10	5
6527	417	11	4
6528	417	12	5
6529	417	13	5
6530	417	14	5
6531	417	15	6
6532	417	16	5
6533	417	17	5
6534	417	18	6
6247	419	1	11
6535	413	1	4
6536	413	2	3
6537	413	3	6
6538	413	4	7
6539	413	5	6
6540	413	6	5
6541	413	7	4
6542	413	8	4
6543	413	9	3
6544	413	10	6
6545	413	11	2
6546	413	12	4
6547	413	13	4
6548	413	14	4
6549	413	15	5
6550	413	16	6
6551	413	17	4
6552	413	18	6
6553	408	1	7
6554	408	2	3
6555	408	3	5
6556	408	4	5
6557	408	5	0
6558	408	6	6
6559	408	7	5
6560	408	8	4
6561	408	9	4
6562	408	10	5
6563	408	11	4
6564	408	12	5
6565	408	13	5
6566	408	14	4
6567	408	15	5
6568	408	16	7
6569	408	17	6
6570	408	18	5
6571	428	1	4
6572	428	2	3
6573	428	3	0
6574	428	4	4
6575	428	5	4
6576	428	6	5
6577	428	7	3
6578	428	8	5
6579	428	9	4
6580	428	10	0
6581	428	11	0
6582	428	12	4
6583	428	13	4
6584	428	14	4
6585	428	15	4
6586	428	16	4
6587	428	17	4
6588	428	18	6
6589	437	1	7
6590	437	2	0
6591	437	3	5
6592	437	4	7
6593	437	5	8
6594	437	6	7
6595	437	7	7
6596	437	8	7
6597	437	9	4
6598	437	10	6
6599	437	11	4
6600	437	12	6
6601	437	13	6
6602	437	14	6
6603	437	15	6
6604	437	16	8
6605	437	17	6
6606	437	18	7
6607	432	1	6
6608	432	2	4
6609	432	3	5
6610	432	4	4
6611	432	5	0
6612	432	6	4
6613	432	7	3
6614	432	8	3
6615	432	9	3
6616	432	10	5
6617	432	11	3
6618	432	12	4
6619	432	13	4
6620	432	14	4
6621	432	15	4
6622	432	16	6
6623	432	17	5
6624	432	18	5
6625	433	1	6
6626	433	2	4
6627	433	3	5
6628	433	4	6
6629	433	5	5
6630	433	6	6
6631	433	7	3
6632	433	8	6
6633	433	9	4
6634	433	10	4
6635	433	11	4
6636	433	12	4
6637	433	13	5
6638	433	14	4
6639	433	15	6
6640	433	16	7
6641	433	17	4
6642	433	18	5
6648	480	6	5
6649	480	7	4
6650	480	8	4
6651	480	9	5
6652	480	10	5
6653	480	11	4
6654	480	12	4
6655	480	13	0
6656	480	14	5
6657	480	15	4
6658	480	16	7
6659	480	17	5
6660	480	18	6
6661	448	1	6
6662	448	2	4
6663	448	3	5
6664	448	4	4
6665	448	5	6
6666	448	6	5
6667	448	7	4
6668	448	8	4
6669	448	9	3
6670	448	10	5
6671	448	11	4
6672	448	12	5
6673	448	13	4
6674	448	14	4
6675	448	15	6
6676	448	16	6
6677	448	17	4
6678	448	18	5
6679	445	1	5
6680	445	2	4
6681	445	3	5
6682	445	4	4
6683	445	5	7
6684	445	6	7
6685	445	7	4
6686	445	8	4
6687	445	9	4
6688	445	10	5
6689	445	11	3
6690	445	12	5
6691	445	13	4
6692	445	14	4
6693	445	15	6
6694	445	16	5
6695	445	17	5
6696	445	18	7
6697	467	1	7
6698	467	2	4
6699	467	3	4
6700	467	4	4
6701	467	5	0
6702	467	6	4
6703	467	7	3
6704	467	8	4
6705	467	9	4
6706	467	10	5
6707	467	11	3
6708	467	12	4
6709	467	13	0
6710	467	14	4
6711	467	15	4
6712	467	16	5
6713	467	17	4
6714	467	18	5
6715	447	1	4
6716	447	2	3
6717	447	3	5
6718	447	4	4
6719	447	5	6
6720	447	6	5
6721	447	7	4
6722	447	8	0
6723	447	9	4
6724	447	10	0
6725	447	11	3
6726	447	12	4
6727	447	13	6
6728	447	14	3
6729	447	15	5
6730	447	16	7
6731	447	17	4
6732	447	18	6
6733	518	1	7
6734	518	2	4
6735	518	3	5
6736	518	4	4
6737	518	5	6
6738	518	6	6
6739	518	7	0
6740	518	8	0
6741	518	9	5
6742	518	10	5
6743	518	11	4
6744	518	12	4
6745	518	13	5
6746	518	14	3
6747	518	15	6
6748	518	16	7
6749	518	17	6
6750	518	18	5
6751	512	1	8
6752	512	2	4
6753	512	3	0
6754	512	4	6
6755	512	5	0
6756	512	6	5
6757	512	7	4
6758	512	8	5
6759	512	9	4
6760	512	10	6
6761	512	11	0
6762	512	12	4
6763	512	13	0
6764	512	14	3
6765	512	15	0
6766	512	16	5
6767	512	17	0
6768	512	18	5
6769	443	1	7
6770	443	2	4
6771	443	3	5
6772	443	4	5
6773	443	5	6
6774	443	6	6
6775	443	7	4
6776	443	8	4
6777	443	9	5
6778	443	10	6
6779	443	11	4
6780	443	12	4
6781	443	13	6
6782	443	14	3
6783	443	15	0
6784	443	16	6
6785	443	17	6
6786	443	18	0
6787	516	1	0
6788	516	2	5
6789	516	3	4
6790	516	4	5
6791	516	5	8
6792	516	6	0
6793	516	7	3
6794	516	8	5
6795	516	9	4
6796	516	10	0
6797	516	11	4
6798	516	12	4
6799	516	13	4
6800	516	14	5
6801	516	15	4
6802	516	16	5
6803	516	17	0
6804	516	18	0
6805	444	1	0
6806	444	2	3
6807	444	3	4
6808	444	4	0
6809	444	5	5
6810	444	6	5
6811	444	7	4
6812	444	8	5
6813	444	9	4
6814	444	10	6
6815	444	11	4
6816	444	12	4
8156	614	2	3
6817	444	13	5
6818	444	14	4
6819	444	15	4
6820	444	16	7
6821	444	17	5
6822	444	18	6
6823	469	1	0
6824	469	2	4
6825	469	3	5
6826	469	4	6
6827	469	5	5
6828	469	6	5
6829	469	7	0
6830	469	8	4
6831	469	9	4
6832	469	10	5
6833	469	11	4
6834	469	12	6
6835	469	13	6
6836	469	14	4
6837	469	15	5
6838	469	16	6
6839	469	17	5
6840	469	18	5
6842	451	2	3
6843	451	3	4
6844	451	4	5
6845	451	5	6
6846	451	6	5
6847	451	7	5
6848	451	8	6
6849	451	9	5
6850	451	10	5
6851	451	11	4
6852	451	12	6
6853	451	13	6
6854	451	14	4
6855	451	15	5
6856	451	16	0
6857	451	17	5
6858	451	18	6
6913	476	1	7
6859	468	1	0
6860	468	2	4
6861	468	3	5
6862	468	4	4
6863	468	5	5
6864	468	6	4
6865	468	7	3
6866	468	8	4
6867	468	9	4
6868	468	10	0
6869	468	11	3
6870	468	12	4
6871	468	13	5
6872	468	14	3
6873	468	15	5
6874	468	16	7
6875	468	17	5
6876	468	18	7
6877	441	1	7
6878	441	2	3
6879	441	3	5
6880	441	4	5
6881	441	5	5
6882	441	6	4
6883	441	7	3
6884	441	8	4
6885	441	9	5
6886	441	10	6
6887	441	11	4
6888	441	12	4
6889	441	13	4
6890	441	14	4
6891	441	15	5
6892	441	16	6
6893	441	17	6
6894	441	18	5
6895	453	1	4
6896	453	2	4
6897	453	3	6
6898	453	4	4
6899	453	5	6
6900	453	6	5
6901	453	7	5
6902	453	8	4
6903	453	9	3
6904	453	10	4
6905	453	11	3
6906	453	12	5
6907	453	13	5
6908	453	14	5
6909	453	15	6
6910	453	16	7
6911	453	17	6
6912	453	18	5
6914	476	2	5
6915	476	3	6
6916	476	4	0
6917	476	5	7
6918	476	6	6
6919	476	7	5
6920	476	8	6
6921	476	9	5
6922	476	10	0
6923	476	11	6
6924	476	12	6
6925	476	13	5
6926	476	14	5
6927	476	15	6
6928	476	16	7
6929	476	17	4
6930	476	18	7
8157	614	3	5
6931	446	1	5
6932	446	2	2
6933	446	3	0
6934	446	4	5
6935	446	5	7
6936	446	6	7
6937	446	7	5
6938	446	8	4
6939	446	9	4
6940	446	10	5
6941	446	11	4
6942	446	12	5
6943	446	13	0
6944	446	14	5
6945	446	15	5
6946	446	16	5
6947	446	17	5
6948	446	18	5
6949	457	1	6
6950	457	2	5
6951	457	3	4
6952	457	4	5
6953	457	5	5
6954	457	6	0
6955	457	7	4
6956	457	8	0
6957	457	9	4
6958	457	10	5
6959	457	11	4
6960	457	12	4
6961	457	13	6
6962	457	14	4
6963	457	15	6
6964	457	16	6
6965	457	17	5
6966	457	18	6
6967	461	1	5
6968	461	2	4
6969	461	3	0
6970	461	4	5
6971	461	5	0
6972	461	6	5
6973	461	7	4
6974	461	8	5
6975	461	9	3
6976	461	10	4
6977	461	11	2
6978	461	12	4
6979	461	13	6
6980	461	14	5
6981	461	15	5
6982	461	16	0
6983	461	17	0
6984	461	18	6
6985	524	1	6
6986	524	2	6
6987	524	3	6
6988	524	4	6
6989	524	5	6
6990	524	6	7
6991	524	7	0
6992	524	8	5
6993	524	9	4
6994	524	10	4
6995	524	11	6
6996	524	12	5
6997	524	13	0
6998	524	14	4
6999	524	15	7
7000	524	16	7
7001	524	17	5
7002	524	18	0
7003	492	1	6
7004	492	2	3
7005	492	3	6
7006	492	4	4
7007	492	5	0
7008	492	6	4
7009	492	7	0
7010	492	8	0
7011	492	9	4
7012	492	10	4
7013	492	11	5
7014	492	12	4
7015	492	13	5
7016	492	14	5
7017	492	15	4
7018	492	16	6
7019	492	17	5
7020	492	18	6
7021	527	1	4
7022	527	2	4
7023	527	3	5
7024	527	4	4
7025	527	5	6
7026	527	6	6
7027	527	7	2
7028	527	8	5
7029	527	9	4
7030	527	10	5
7031	527	11	0
7032	527	12	5
7033	527	13	4
7034	527	14	4
7035	527	15	4
7036	527	16	4
7037	527	17	0
7038	527	18	7
7055	491	17	5
7056	491	18	4
7093	474	1	5
7094	474	2	6
7095	474	3	5
7096	474	4	5
7097	474	5	7
7098	474	6	6
7099	474	7	5
7104	474	12	4
7057	488	1	6
7058	488	2	3
7059	488	3	5
7060	488	4	6
7061	488	5	5
7062	488	6	6
7063	488	7	5
7064	488	8	6
7065	488	9	4
7066	488	10	0
7067	488	11	5
7068	488	12	4
7069	488	13	5
7070	488	14	5
7071	488	15	0
7072	488	16	6
7073	488	17	6
7074	488	18	5
7075	484	1	9
7076	484	2	5
7077	484	3	7
7078	484	4	7
7079	484	5	7
7080	484	6	5
7081	484	7	0
7082	484	8	0
7083	484	9	0
7084	484	10	7
7085	484	11	4
7086	484	12	5
7087	484	13	5
7088	484	14	0
7089	484	15	6
7090	484	16	0
7091	484	17	0
7092	484	18	6
6841	451	1	5
7039	491	1	6
7040	491	2	5
7041	491	3	4
7042	491	4	5
7043	491	5	5
7044	491	6	5
7045	491	7	3
7046	491	8	4
7047	491	9	5
7048	491	10	3
7049	491	11	4
7050	491	12	6
7051	491	13	5
7052	491	14	4
7053	491	15	5
7054	491	16	6
7100	474	8	5
7101	474	9	3
7102	474	10	4
7103	474	11	4
7105	474	13	4
7106	474	14	5
7107	474	15	5
7108	474	16	5
7109	474	17	5
7110	474	18	7
7111	506	1	7
7112	506	2	4
7113	506	3	5
7114	506	4	4
7115	506	5	8
7116	506	6	4
7117	506	7	0
7118	506	8	6
7119	506	9	3
7120	506	10	4
7121	506	11	4
7122	506	12	4
7123	506	13	4
7124	506	14	4
7125	506	15	6
7126	506	16	0
7127	506	17	5
7128	506	18	0
7129	456	1	7
7130	456	2	4
7131	456	3	5
7132	456	4	4
7133	456	5	6
7134	456	6	0
7135	456	7	4
7136	456	8	4
7137	456	9	2
7138	456	10	4
7139	456	11	2
7140	456	12	5
7141	456	13	5
7142	456	14	3
7143	456	15	5
7144	456	16	5
7145	456	17	4
7146	456	18	4
7147	465	1	6
7148	465	2	4
7149	465	3	5
7150	465	4	5
7151	465	5	0
7152	465	6	5
7153	465	7	5
7154	465	8	5
7155	465	9	4
7156	465	10	0
7157	465	11	4
7158	465	12	4
7159	465	13	6
7160	465	14	3
7161	465	15	4
7162	465	16	5
7163	465	17	5
7164	465	18	4
7165	475	1	8
7166	475	2	5
7167	475	3	6
7168	475	4	6
7169	475	5	6
7170	475	6	6
7171	475	7	4
7172	475	8	2
7173	475	9	4
7174	475	10	3
7175	475	11	5
7176	475	12	7
7177	475	13	6
7178	475	14	5
7179	475	15	5
7180	475	16	0
7181	475	17	5
7182	475	18	0
7183	470	1	8
7184	470	2	5
7185	470	3	5
7186	470	4	5
7187	470	5	8
7188	470	6	6
7189	470	7	5
7190	470	8	6
7191	470	9	4
7192	470	10	5
7193	470	11	4
7194	470	12	5
7195	470	13	5
7196	470	14	4
7197	470	15	5
7198	470	16	6
7199	470	17	5
7200	470	18	6
7201	440	1	6
7202	440	2	3
7203	440	3	4
7204	440	4	4
7205	440	5	5
7206	440	6	4
7207	440	7	4
7208	440	8	4
7209	440	9	3
7210	440	10	3
7211	440	11	3
7212	440	12	6
7213	440	13	3
7214	440	14	4
7215	440	15	4
7216	440	16	5
7217	440	17	3
7218	440	18	5
7219	455	1	5
7220	455	2	4
7221	455	3	4
7222	455	4	4
7223	455	5	5
7224	455	6	5
7225	455	7	4
7226	455	8	4
7227	455	9	5
7228	455	10	5
7229	455	11	3
7230	455	12	4
7231	455	13	4
7232	455	14	3
7233	455	15	4
7234	455	16	6
7235	455	17	5
7236	455	18	4
7237	526	1	6
7238	526	2	4
7239	526	3	5
7240	526	4	4
7241	526	5	5
7242	526	6	5
7243	526	7	4
7244	526	8	3
7245	526	9	5
7246	526	10	5
7247	526	11	3
7248	526	12	5
7249	526	13	4
7250	526	14	3
7251	526	15	6
7252	526	16	7
10023	642	15	0
7253	526	17	7
7254	526	18	5
7255	450	1	0
7256	450	2	4
7257	450	3	6
7258	450	4	5
7259	450	5	7
7260	450	6	0
7261	450	7	4
7262	450	8	4
7263	450	9	4
7264	450	10	4
7265	450	11	3
7266	450	12	4
7267	450	13	4
7268	450	14	4
7269	450	15	4
7270	450	16	6
7271	450	17	5
7272	450	18	5
7273	442	1	6
7274	442	2	4
7275	442	3	4
7276	442	4	5
7277	442	5	7
7278	442	6	4
7279	442	7	4
7280	442	8	4
7281	442	9	3
7282	442	10	0
7283	442	11	5
7284	442	12	6
7285	442	13	5
7286	442	14	5
7287	442	15	5
7288	442	16	6
7289	442	17	5
7290	442	18	5
7291	454	1	6
7292	454	2	3
7293	454	3	5
7294	454	4	0
7295	454	5	6
7296	454	6	4
7297	454	7	4
7298	454	8	6
7299	454	9	0
7300	454	10	4
7301	454	11	5
7302	454	12	5
7303	454	13	4
7304	454	14	4
7305	454	15	6
7306	454	16	5
7307	454	17	5
7308	454	18	5
7309	458	1	7
7310	458	2	2
7311	458	3	5
7312	458	4	5
7313	458	5	6
7314	458	6	5
7315	458	7	4
7316	458	8	4
7317	458	9	3
7318	458	10	5
7319	458	11	4
7320	458	12	4
7321	458	13	5
7322	458	14	4
7323	458	15	5
7324	458	16	5
7325	458	17	5
7326	458	18	4
7327	464	1	6
7328	464	2	3
7329	464	3	0
7330	464	4	5
7331	464	5	7
7332	464	6	0
7333	464	7	0
7334	464	8	0
7335	464	9	3
7336	464	10	5
7337	464	11	5
7338	464	12	0
7339	464	13	4
7340	464	14	3
7341	464	15	4
7342	464	16	7
7343	464	17	5
7344	464	18	5
7345	509	1	6
7346	509	2	4
7347	509	3	6
7348	509	4	0
7349	509	5	5
7350	509	6	5
7351	509	7	3
7352	509	8	5
7353	509	9	4
7354	509	10	4
7355	509	11	4
7356	509	12	5
7357	509	13	0
7358	509	14	3
7359	509	15	6
7360	509	16	6
7361	509	17	5
7362	509	18	4
7363	525	1	6
7364	525	2	5
7365	525	3	7
7366	525	4	5
7367	525	5	6
7368	525	6	0
7369	525	7	3
7370	525	8	4
7371	525	9	5
7372	525	10	5
7373	525	11	4
7374	525	12	5
7375	525	13	6
7376	525	14	4
7377	525	15	5
7378	525	16	6
7379	525	17	4
7380	525	18	5
7381	498	1	6
7382	498	2	4
7383	498	3	0
7384	498	4	5
7385	498	5	5
7386	498	6	8
7387	498	7	4
7388	498	8	6
7389	498	9	4
7390	498	10	0
7391	498	11	4
7392	498	12	5
7393	498	13	6
7394	498	14	4
7395	498	15	6
7396	498	16	6
7397	498	17	4
7398	498	18	7
7399	460	1	7
7400	460	2	4
7401	460	3	5
7402	460	4	5
7403	460	5	7
7404	460	6	0
7405	460	7	4
7406	460	8	5
7407	460	9	5
7408	460	10	6
7409	460	11	4
7410	460	12	4
7411	460	13	4
7412	460	14	2
7413	460	15	7
7414	460	16	0
7415	460	17	5
7416	460	18	6
7417	521	1	6
7418	521	2	4
7419	521	3	6
7420	521	4	5
7421	521	5	5
7422	521	6	6
7423	521	7	7
7424	521	8	7
7425	521	9	4
7426	521	10	0
7427	521	11	5
7428	521	12	6
7429	521	13	0
7430	521	14	0
7431	521	15	6
7432	521	16	6
7433	521	17	4
7434	521	18	9
7435	513	1	7
7436	513	2	4
7437	513	3	5
7438	513	4	5
7439	513	5	5
7440	513	6	4
7441	513	7	7
7442	513	8	0
7443	513	9	6
7444	513	10	5
7445	513	11	4
7446	513	12	4
7447	513	13	5
7448	513	14	0
7449	513	15	5
7450	513	16	5
7451	513	17	5
7452	513	18	5
7453	511	1	8
7454	511	2	4
7455	511	3	0
7456	511	4	5
7457	511	5	6
7458	511	6	5
7459	511	7	4
7460	511	8	4
7461	511	9	5
7462	511	10	5
7463	511	11	6
7464	511	12	4
7465	511	13	6
7466	511	14	6
7467	511	15	6
7468	511	16	6
7469	511	17	6
7470	511	18	6
7471	507	1	6
7472	507	2	4
7473	507	3	4
7474	507	4	6
7475	507	5	7
7476	507	6	5
7477	507	7	3
7478	507	8	5
7479	507	9	4
7480	507	10	6
7481	507	11	5
7482	507	12	3
7483	507	13	5
7484	507	14	3
7485	507	15	7
7486	507	16	7
7487	507	17	6
7488	507	18	8
7489	503	1	6
7490	503	2	4
7491	503	3	4
7492	503	4	7
7493	503	5	5
7494	503	6	7
7495	503	7	4
7496	503	8	7
7497	503	9	5
7498	503	10	7
7499	503	11	6
7500	503	12	4
7501	503	13	6
7502	503	14	4
7503	503	15	6
7504	503	16	11
7505	503	17	6
7506	503	18	7
7507	482	1	7
7508	482	2	3
7509	482	3	5
7510	482	4	5
7511	482	5	0
7512	482	6	5
7513	482	7	5
7514	482	8	5
7515	482	9	5
7516	482	10	0
7517	482	11	4
7518	482	12	6
7519	482	13	6
7520	482	14	4
7521	482	15	0
7522	482	16	0
7523	482	17	5
7524	482	18	5
7525	528	1	7
7526	528	2	3
7527	528	3	0
7528	528	4	4
7529	528	5	0
7530	528	6	0
7531	528	7	3
7532	528	8	4
7533	528	9	4
7534	528	10	0
7535	528	11	0
7536	528	12	4
7537	528	13	5
7538	528	14	5
7539	528	15	5
7540	528	16	6
7541	528	17	0
7542	528	18	0
7543	481	1	7
8158	614	4	4
7544	481	2	5
7545	481	3	5
7546	481	4	5
7547	481	5	6
7548	481	6	5
7549	481	7	3
7550	481	8	6
7551	481	9	5
7552	481	10	6
7553	481	11	4
7554	481	12	4
7555	481	13	7
7556	481	14	4
7557	481	15	5
7558	481	16	7
7559	481	17	5
7560	481	18	5
7561	463	1	6
7562	463	2	4
7563	463	3	6
7564	463	4	4
7565	463	5	5
7566	463	6	4
7567	463	7	3
7568	463	8	6
7569	463	9	4
7570	463	10	0
7571	463	11	3
7572	463	12	4
7573	463	13	4
7574	463	14	3
7575	463	15	5
7576	463	16	5
7577	463	17	4
7578	463	18	4
7579	496	1	0
7580	496	2	0
7581	496	3	7
7582	496	4	6
7583	496	5	6
7584	496	6	5
7585	496	7	3
7586	496	8	6
7587	496	9	5
7588	496	10	4
7589	496	11	5
7590	496	12	6
7591	496	13	0
7592	496	14	4
7593	496	15	4
7594	496	16	8
7595	496	17	0
7596	496	18	6
7597	504	1	7
7598	504	2	6
7599	504	3	5
7600	504	4	5
7601	504	5	10
7602	504	6	9
7603	504	7	5
7604	504	8	8
7605	504	9	5
7606	504	10	6
7607	504	11	6
7608	504	12	0
7609	504	13	6
7610	504	14	5
7611	504	15	7
7612	504	16	8
7613	504	17	6
7614	504	18	9
7615	514	1	6
7616	514	2	4
7617	514	3	5
7618	514	4	0
7619	514	5	0
7620	514	6	5
7621	514	7	5
7622	514	8	4
7623	514	9	0
7624	514	10	5
7625	514	11	3
7626	514	12	6
7627	514	13	0
7628	514	14	3
7629	514	15	0
7630	514	16	5
7631	514	17	6
7632	514	18	6
7633	472	1	0
7634	472	2	0
7635	472	3	5
7636	472	4	6
7637	472	5	0
7638	472	6	0
7639	472	7	5
7640	472	8	4
7641	472	9	4
7642	472	10	0
7643	472	11	4
7644	472	12	3
7645	472	13	4
7646	472	14	5
7647	472	15	5
7648	472	16	7
7649	472	17	4
7650	472	18	6
7651	483	1	7
7652	483	2	4
7653	483	3	6
7654	483	4	5
7655	483	5	6
7656	483	6	6
7657	483	7	3
7658	483	8	6
7659	483	9	4
7660	483	10	5
7661	483	11	4
7662	483	12	5
7663	483	13	5
7664	483	14	6
7665	483	15	0
7666	483	16	7
7667	483	17	6
7668	483	18	0
7669	501	1	8
7670	501	2	0
7671	501	3	6
7672	501	4	4
7673	501	5	7
7674	501	6	5
7675	501	7	5
7676	501	8	6
7677	501	9	5
7678	501	10	0
7679	501	11	0
7680	501	12	6
7681	501	13	6
7682	501	14	0
7683	501	15	7
7684	501	16	7
7685	501	17	6
7686	501	18	5
7687	462	1	0
7688	462	2	3
7689	462	3	5
7690	462	4	0
7691	462	5	6
7692	462	6	5
7693	462	7	5
7694	462	8	5
7695	462	9	2
7696	462	10	6
7697	462	11	5
7698	462	12	4
7699	462	13	7
7700	462	14	0
7701	462	15	4
7702	462	16	6
7703	462	17	4
7704	462	18	4
7705	452	1	6
7706	452	2	5
7707	452	3	4
7708	452	4	5
7709	452	5	5
7710	452	6	6
7711	452	7	5
7712	452	8	6
7713	452	9	3
7714	452	10	0
7715	452	11	4
7716	452	12	4
7717	452	13	5
7718	452	14	4
7719	452	15	7
7720	452	16	4
7721	452	17	6
7722	452	18	4
7723	486	1	7
7724	486	2	4
7725	486	3	5
7726	486	4	5
7727	486	5	5
7728	486	6	5
7729	486	7	3
7730	486	8	5
7731	486	9	4
7732	486	10	5
7733	486	11	3
7734	486	12	4
7735	486	13	5
7736	486	14	3
7737	486	15	4
7738	486	16	5
7739	486	17	4
7740	486	18	5
7741	471	1	6
7742	471	2	4
7743	471	3	6
7744	471	4	3
7745	471	5	6
7746	471	6	5
7747	471	7	6
7748	471	8	4
7749	471	9	5
7750	471	10	0
7751	471	11	3
7752	471	12	5
7753	471	13	5
7754	471	14	6
7755	471	15	6
7756	471	16	6
7757	471	17	4
7758	471	18	0
7759	466	1	5
7760	466	2	3
7761	466	3	0
7762	466	4	4
7763	466	5	5
7764	466	6	5
7765	466	7	2
7766	466	8	5
7767	466	9	4
7768	466	10	4
7769	466	11	0
7770	466	12	4
7771	466	13	5
7772	466	14	3
7773	466	15	4
7774	466	16	6
7775	466	17	5
7776	466	18	5
7777	499	1	5
7778	499	2	4
7779	499	3	6
7780	499	4	4
7781	499	5	6
7782	499	6	4
7783	499	7	3
7784	499	8	5
7785	499	9	4
7786	499	10	4
7787	499	11	4
7788	499	12	5
7789	499	13	5
7790	499	14	4
7791	499	15	7
7792	499	16	0
7793	499	17	6
7794	499	18	6
7795	517	1	0
7796	517	2	5
7797	517	3	5
7798	517	4	5
7799	517	5	7
7800	517	6	5
7801	517	7	3
7802	517	8	5
7803	517	9	3
7804	517	10	6
7805	517	11	5
7806	517	12	5
7807	517	13	0
7808	517	14	5
7809	517	15	6
7810	517	16	0
7811	517	17	6
7812	517	18	5
7813	522	1	8
7814	522	2	4
7815	522	3	3
7816	522	4	5
7817	522	5	5
7818	522	6	4
7819	522	7	3
7820	522	8	4
7821	522	9	4
7822	522	10	4
7823	522	11	5
7824	522	12	5
7825	522	13	4
7826	522	14	4
7827	522	15	5
7828	522	16	6
7829	522	17	4
7830	522	18	0
7831	495	1	5
7832	495	2	4
7833	495	3	6
7834	495	4	0
10441	742	1	5
7835	495	5	7
7836	495	6	6
7837	495	7	4
7838	495	8	0
7839	495	9	0
7840	495	10	5
7841	495	11	3
7842	495	12	5
7843	495	13	6
7844	495	14	4
7845	495	15	0
7846	495	16	8
7847	495	17	5
7848	495	18	6
7849	489	1	6
7850	489	2	3
7851	489	3	6
7852	489	4	6
7853	489	5	5
7854	489	6	0
7855	489	7	4
7856	489	8	4
7857	489	9	3
7858	489	10	4
7859	489	11	5
7860	489	12	0
7861	489	13	5
7862	489	14	4
7863	489	15	0
7864	489	16	7
7865	489	17	4
7866	489	18	6
7867	500	1	0
7868	500	2	4
7869	500	3	5
7870	500	4	4
7871	500	5	7
7872	500	6	6
7873	500	7	5
7874	500	8	0
7875	500	9	0
7876	500	10	6
7877	500	11	6
7878	500	12	6
7879	500	13	0
7880	500	14	3
7881	500	15	5
7882	500	16	0
7883	500	17	5
7884	500	18	6
7885	510	1	7
7886	510	2	5
7887	510	3	5
7888	510	4	6
7889	510	5	6
7890	510	6	5
7891	510	7	3
7892	510	8	4
7893	510	9	4
7894	510	10	5
7895	510	11	5
7896	510	12	5
7897	510	13	5
7898	510	14	3
7899	510	15	0
7900	510	16	8
7901	510	17	5
7902	510	18	0
7903	494	1	7
7904	494	2	5
7905	494	3	6
7906	494	4	6
7907	494	5	0
7908	494	6	0
7909	494	7	0
7910	494	8	0
7911	494	9	0
7912	494	10	8
7913	494	11	6
7914	494	12	6
7915	494	13	0
7916	494	14	0
7917	494	15	6
7918	494	16	0
7919	494	17	6
7920	494	18	0
7921	485	1	7
7922	485	2	4
7923	485	3	6
7924	485	4	0
7925	485	5	0
7926	485	6	0
7927	485	7	0
7928	485	8	0
7929	485	9	6
7930	485	10	0
7931	485	11	5
7932	485	12	5
7933	485	13	0
7934	485	14	0
7935	485	15	0
7936	485	16	0
7937	485	17	0
7938	485	18	0
7939	497	1	0
7940	497	2	5
7941	497	3	6
7942	497	4	4
7943	497	5	0
7944	497	6	0
7945	497	7	5
7946	497	8	7
7947	497	9	4
7948	497	10	0
7949	497	11	3
7950	497	12	5
7951	497	13	5
7952	497	14	0
7953	497	15	0
7954	497	16	7
7955	497	17	5
7956	497	18	0
7957	520	1	6
7958	520	2	4
7959	520	3	5
7960	520	4	6
7961	520	5	7
7962	520	6	6
7963	520	7	3
7964	520	8	4
7965	520	9	4
7966	520	10	4
7967	520	11	3
7968	520	12	6
7969	520	13	4
7970	520	14	4
7971	520	15	5
7972	520	16	5
7973	520	17	4
7974	520	18	5
7975	523	1	7
7976	523	2	4
7977	523	3	4
7978	523	4	4
7979	523	5	8
7980	523	6	5
7981	523	7	0
7982	523	8	6
7983	523	9	4
7984	523	10	7
7985	523	11	5
7986	523	12	4
7987	523	13	0
7988	523	14	4
7989	523	15	5
7990	523	16	0
7991	523	17	6
7992	523	18	5
7993	508	1	5
7994	508	2	6
7995	508	3	6
7996	508	4	5
7997	508	5	5
7998	508	6	5
7999	508	7	5
8000	508	8	4
8001	508	9	0
8002	508	10	6
8003	508	11	3
8004	508	12	3
8005	508	13	5
8006	508	14	4
8007	508	15	4
8008	508	16	0
8009	508	17	5
8010	508	18	7
8011	473	1	7
8012	473	2	4
8013	473	3	5
8014	473	4	6
8015	473	5	7
8016	473	6	6
8017	473	7	4
8018	473	8	0
8019	473	9	6
8020	473	10	7
8021	473	11	5
8022	473	12	5
8023	473	13	6
8024	473	14	4
8025	473	15	5
8026	473	16	7
8027	473	17	4
8028	473	18	6
8029	515	1	6
8030	515	2	4
8031	515	3	5
8032	515	4	0
8033	515	5	0
8034	515	6	5
8035	515	7	4
8036	515	8	4
8037	515	9	4
8038	515	10	4
8039	515	11	4
8040	515	12	6
8041	515	13	6
8042	515	14	0
8043	515	15	5
8044	515	16	6
8045	515	17	4
8046	515	18	6
8047	478	1	6
8048	478	2	4
8049	478	3	0
8050	478	4	6
8051	478	5	0
8052	478	6	4
8053	478	7	0
8054	478	8	4
8055	478	9	5
8056	478	10	7
8057	478	11	4
8058	478	12	5
8059	478	13	6
8060	478	14	3
8061	478	15	6
8062	478	16	5
8063	478	17	0
8064	478	18	0
8065	529	1	0
8066	529	2	5
8067	529	3	6
8068	529	4	7
8069	529	5	5
8070	529	6	6
8071	529	7	3
8072	529	8	5
8073	529	9	5
8074	529	10	0
8075	529	11	5
8076	529	12	5
8077	529	13	5
8078	529	14	0
8079	529	15	5
8080	529	16	0
8081	529	17	0
8082	529	18	5
8083	502	1	8
8084	502	2	4
8085	502	3	8
8086	502	4	0
8087	502	5	0
8088	502	6	7
8089	502	7	5
8090	502	8	0
8091	502	9	5
8092	502	10	0
8093	502	11	0
8094	502	12	6
8095	502	13	0
8096	502	14	6
8097	502	15	7
8098	502	16	8
8099	502	17	5
8100	502	18	6
8101	530	1	7
8102	530	2	3
8103	530	3	6
8104	530	4	6
8105	530	5	6
8106	530	6	5
8107	530	7	2
8108	530	8	5
8109	530	9	0
8110	530	10	6
8111	530	11	5
8112	530	12	6
8113	530	13	5
8114	530	14	4
8115	530	15	5
8116	530	16	7
8117	530	17	0
8118	530	18	0
8119	531	1	5
8120	531	2	4
8121	531	3	6
8122	531	4	6
8123	531	5	0
8124	531	6	7
8125	531	7	0
10024	642	16	0
8126	531	8	0
8127	531	9	4
8128	531	10	5
8129	531	11	3
8130	531	12	6
8131	531	13	6
8132	531	14	5
8133	531	15	0
8134	531	16	8
8135	531	17	5
8136	531	18	0
8211	545	3	6
8212	545	4	6
8213	545	5	6
8214	545	6	6
8215	545	7	5
8216	545	8	0
8217	545	9	5
8218	545	10	6
8219	545	11	4
8137	574	1	0
8138	574	2	0
8139	574	3	0
8140	574	4	0
8141	574	5	0
8142	574	6	0
8143	574	7	0
8144	574	8	0
8145	574	9	0
8146	574	10	0
8147	574	11	0
8148	574	12	0
8149	574	13	0
8150	574	14	0
8151	574	15	0
8152	574	16	0
8153	574	17	0
8154	574	18	0
8159	614	5	5
8160	614	6	6
8161	614	7	3
8162	614	8	4
8163	614	9	4
8164	614	10	3
8165	614	11	3
8166	614	12	4
8167	614	13	5
8168	614	14	3
8169	614	15	3
8170	614	16	0
8171	614	17	4
8172	614	18	5
8173	564	1	6
8174	564	2	5
8175	564	3	5
8176	564	4	5
8177	564	5	6
8178	564	6	6
8179	564	7	3
8180	564	8	7
8181	564	9	3
8182	564	10	6
8183	564	11	4
8184	564	12	6
8185	564	13	8
8186	564	14	4
8187	564	15	4
8188	564	16	0
8189	564	17	0
8190	564	18	0
8191	551	1	0
8192	551	2	0
8193	551	3	8
8194	551	4	7
8195	551	5	8
8196	551	6	6
8197	551	7	6
8198	551	8	0
8199	551	9	5
8200	551	10	0
8201	551	11	0
8202	551	12	0
8203	551	13	0
8204	551	14	0
8205	551	15	0
8206	551	16	0
8207	551	17	0
8208	551	18	0
8209	545	1	7
8210	545	2	5
8220	545	12	5
8221	545	13	7
8222	545	14	4
8223	545	15	6
8224	545	16	8
8225	545	17	5
8226	545	18	6
8227	533	1	5
8228	533	2	4
8229	533	3	4
8230	533	4	4
8231	533	5	6
8232	533	6	5
8233	533	7	4
8234	533	8	4
8235	533	9	4
8236	533	10	5
8237	533	11	4
8238	533	12	4
8239	533	13	5
8240	533	14	3
8241	533	15	4
8242	533	16	0
8243	533	17	5
8244	533	18	0
8245	532	1	5
8246	532	2	5
8247	532	3	5
8248	532	4	4
8249	532	5	6
8250	532	6	7
8251	532	7	5
8252	532	8	0
8253	532	9	3
8254	532	10	5
8255	532	11	3
8256	532	12	5
8257	532	13	6
8258	532	14	2
8259	532	15	5
8260	532	16	5
8261	532	17	3
8262	532	18	7
8263	612	1	6
8264	612	2	3
8265	612	3	4
8266	612	4	4
8267	612	5	6
8268	612	6	5
8269	612	7	3
8270	612	8	4
8271	612	9	4
8272	612	10	5
8273	612	11	3
8274	612	12	4
8275	612	13	4
11701	786	1	0
8276	612	14	5
8277	612	15	6
8278	612	16	6
8279	612	17	6
8280	612	18	5
8281	546	1	5
8282	546	2	5
8283	546	3	0
8284	546	4	6
8285	546	5	8
8286	546	6	6
8287	546	7	5
8288	546	8	5
8289	546	9	5
8290	546	10	6
8291	546	11	3
8292	546	12	5
8293	546	13	6
8294	546	14	4
8295	546	15	5
8296	546	16	6
8297	546	17	5
8298	546	18	5
8299	613	1	6
8300	613	2	4
8301	613	3	5
8302	613	4	5
8303	613	5	7
8304	613	6	6
8305	613	7	3
8306	613	8	0
8307	613	9	5
8308	613	10	6
8309	613	11	3
8310	613	12	5
8311	613	13	7
8312	613	14	3
8313	613	15	5
8314	613	16	0
8315	613	17	5
8316	613	18	4
8317	633	1	7
8318	633	2	6
8319	633	3	5
8320	633	4	5
8321	633	5	6
8322	633	6	7
8323	633	7	3
8324	633	8	4
8325	633	9	4
8326	633	10	4
8327	633	11	4
8328	633	12	5
8329	633	13	4
8330	633	14	3
8331	633	15	4
8332	633	16	7
8333	633	17	7
8334	633	18	4
8335	615	1	0
8336	615	2	5
8337	615	3	5
8338	615	4	4
8339	615	5	6
8340	615	6	5
8341	615	7	3
8342	615	8	5
8343	615	9	4
8344	615	10	0
8345	615	11	4
8346	615	12	0
8347	615	13	5
8348	615	14	3
8349	615	15	4
8350	615	16	6
8351	615	17	5
8352	615	18	5
8353	605	1	7
8354	605	2	4
8355	605	3	5
8356	605	4	6
8357	605	5	8
8358	605	6	0
8359	605	7	0
8360	605	8	4
8361	605	9	5
8362	605	10	4
8363	605	11	3
8364	605	12	4
8365	605	13	6
8366	605	14	4
8367	605	15	6
8368	605	16	6
8369	605	17	5
8370	605	18	5
8371	606	1	8
8372	606	2	0
8373	606	3	4
8374	606	4	6
8375	606	5	8
8376	606	6	0
8377	606	7	0
8378	606	8	0
8379	606	9	6
8380	606	10	6
8381	606	11	4
8382	606	12	6
8383	606	13	6
8384	606	14	6
8385	606	15	6
8386	606	16	0
8387	606	17	0
8388	606	18	7
8389	619	1	6
8390	619	2	6
8391	619	3	6
8392	619	4	6
8393	619	5	6
8394	619	6	6
8395	619	7	3
8396	619	8	0
8397	619	9	0
8398	619	10	0
8399	619	11	4
8400	619	12	4
8401	619	13	7
8402	619	14	5
8403	619	15	7
8404	619	16	0
8405	619	17	5
8406	619	18	6
8407	618	1	6
8408	618	2	4
8409	618	3	5
8410	618	4	5
8411	618	5	0
8412	618	6	6
8413	618	7	3
8414	618	8	4
8415	618	9	5
8416	618	10	4
8417	618	11	3
8418	618	12	5
8419	618	13	3
8420	618	14	4
8421	618	15	5
8422	618	16	6
8423	618	17	5
8424	618	18	5
8425	616	1	6
8426	616	2	3
8427	616	3	4
8428	616	4	6
8429	616	5	0
8430	616	6	6
8431	616	7	6
8432	616	8	7
8433	616	9	0
8434	616	10	6
8435	616	11	4
8436	616	12	5
8437	616	13	4
8438	616	14	5
8439	616	15	0
8440	616	16	0
8441	616	17	7
8442	616	18	6
8443	560	1	5
8444	560	2	4
8445	560	3	5
8446	560	4	6
8447	560	5	8
8448	560	6	6
8449	560	7	2
8450	560	8	5
8451	560	9	4
8452	560	10	5
8453	560	11	4
8454	560	12	4
8455	560	13	6
8456	560	14	3
8457	560	15	6
8458	560	16	6
8459	560	17	5
8460	560	18	5
8461	566	1	6
8462	566	2	4
8463	566	3	5
8464	566	4	0
8465	566	5	7
8466	566	6	5
8467	566	7	4
8468	566	8	0
8469	566	9	5
8470	566	10	4
8471	566	11	5
8472	566	12	5
8473	566	13	6
8474	566	14	4
8475	566	15	6
8476	566	16	7
8477	566	17	6
8478	566	18	5
8479	608	1	7
8480	608	2	5
8481	608	3	6
8482	608	4	6
8483	608	5	7
8484	608	6	6
8485	608	7	4
8486	608	8	5
8487	608	9	4
8488	608	10	5
8489	608	11	4
8490	608	12	5
8491	608	13	5
8492	608	14	4
8493	608	15	7
8494	608	16	7
8495	608	17	5
8496	608	18	6
8497	595	1	7
8498	595	2	5
8499	595	3	4
8500	595	4	0
8501	595	5	7
8502	595	6	7
8503	595	7	4
8504	595	8	0
8505	595	9	3
8506	595	10	6
8507	595	11	4
8508	595	12	3
8509	595	13	0
8510	595	14	3
8511	595	15	5
8512	595	16	6
8513	595	17	4
8514	595	18	7
8515	549	1	6
8516	549	2	4
8517	549	3	6
8518	549	4	4
8519	549	5	7
8520	549	6	8
8521	549	7	3
8522	549	8	4
8523	549	9	5
8524	549	10	6
8525	549	11	4
8526	549	12	6
8527	549	13	7
8528	549	14	4
8529	549	15	6
8530	549	16	8
8531	549	17	4
8532	549	18	6
8533	554	1	5
8534	554	2	0
8535	554	3	7
8536	554	4	6
8537	554	5	6
8538	554	6	5
8539	554	7	4
8540	554	8	4
8541	554	9	4
8542	554	10	0
8543	554	11	0
8544	554	12	4
8545	554	13	5
8546	554	14	4
8547	554	15	0
8548	554	16	6
8549	554	17	5
8550	554	18	4
8551	552	1	0
8552	552	2	0
8553	552	3	7
8554	552	4	6
8555	552	5	8
8556	552	6	5
8557	552	7	0
8558	552	8	0
8559	552	9	5
8560	552	10	6
8561	552	11	4
8562	552	12	5
8563	552	13	6
8564	552	14	4
8565	552	15	7
8566	552	16	0
10025	642	17	0
8567	552	17	5
8568	552	18	0
8569	628	1	5
8570	628	2	3
8571	628	3	6
8572	628	4	6
8573	628	5	5
8574	628	6	6
8575	628	7	3
8576	628	8	4
8577	628	9	3
8578	628	10	4
8579	628	11	2
8580	628	12	6
8581	628	13	5
8582	628	14	4
8583	628	15	4
8584	628	16	7
8585	628	17	3
8586	628	18	7
8587	558	1	0
8588	558	2	3
8589	558	3	5
8590	558	4	5
8591	558	5	5
8592	558	6	5
8593	558	7	4
8594	558	8	4
8595	558	9	3
8596	558	10	5
8597	558	11	3
8598	558	12	4
8599	558	13	5
8600	558	14	4
8601	558	15	5
8602	558	16	5
8603	558	17	4
8604	558	18	0
8605	594	1	0
8606	594	2	5
8607	594	3	6
8608	594	4	4
8609	594	5	0
8610	594	6	4
8611	594	7	4
8612	594	8	3
8613	594	9	2
8614	594	10	6
8615	594	11	5
8616	594	12	8
8617	594	13	6
8618	594	14	4
8619	594	15	4
8620	594	16	0
8621	594	17	5
8622	594	18	0
8623	569	1	0
8624	569	2	3
8625	569	3	4
8626	569	4	6
8627	569	5	5
8628	569	6	6
8629	569	7	0
8630	569	8	5
8631	569	9	4
8632	569	10	4
8633	569	11	4
8634	569	12	0
8635	569	13	4
8636	569	14	4
8637	569	15	4
8638	569	16	5
8639	569	17	4
8640	569	18	5
8641	621	1	6
8642	621	2	4
8643	621	3	6
8644	621	4	5
8645	621	5	6
8646	621	6	6
8647	621	7	4
8648	621	8	5
8649	621	9	4
8650	621	10	4
8651	621	11	5
8652	621	12	4
8653	621	13	5
8654	621	14	5
8655	621	15	6
8656	621	16	6
8657	621	17	4
8658	621	18	5
8659	547	1	7
8660	547	2	4
8661	547	3	5
8662	547	4	5
8663	547	5	5
8664	547	6	6
8665	547	7	3
8666	547	8	5
8667	547	9	0
8668	547	10	6
8669	547	11	4
8670	547	12	5
8671	547	13	6
8672	547	14	5
8673	547	15	6
8674	547	16	5
8675	547	17	6
8676	547	18	6
8677	553	1	5
8678	553	2	3
8679	553	3	5
8680	553	4	4
8681	553	5	6
8682	553	6	6
8683	553	7	4
8684	553	8	5
8685	553	9	5
8686	553	10	4
8687	553	11	4
8688	553	12	4
8689	553	13	5
8690	553	14	3
8691	553	15	3
8692	553	16	0
8693	553	17	5
8694	553	18	4
8695	617	1	7
8696	617	2	3
8697	617	3	5
8698	617	4	6
8699	617	5	7
8700	617	6	6
8701	617	7	7
8702	617	8	0
8703	617	9	6
8704	617	10	7
8705	617	11	3
8706	617	12	0
8707	617	13	5
8708	617	14	5
8709	617	15	5
8710	617	16	0
8711	617	17	5
8712	617	18	6
8714	550	2	4
8715	550	3	6
8716	550	4	5
8717	550	5	5
8718	550	6	5
8719	550	7	3
8720	550	8	4
8721	550	9	3
8722	550	10	4
8723	550	11	5
8724	550	12	4
8725	550	13	7
8726	550	14	3
8727	550	15	5
8728	550	16	4
8729	550	17	5
8730	550	18	5
10026	642	18	7
8731	575	1	4
8732	575	2	4
8733	575	3	4
8734	575	4	4
8735	575	5	6
8736	575	6	5
8737	575	7	4
8738	575	8	4
8739	575	9	3
8740	575	10	5
8741	575	11	3
8742	575	12	4
8743	575	13	5
8744	575	14	4
8745	575	15	4
8746	575	16	6
8747	575	17	4
8748	575	18	3
8749	622	1	7
8750	622	2	5
8751	622	3	6
8752	622	4	0
8753	622	5	6
8754	622	6	6
8755	622	7	5
8756	622	8	6
8757	622	9	0
8758	622	10	6
8759	622	11	5
8760	622	12	4
8761	622	13	6
8762	622	14	5
8763	622	15	5
8764	622	16	7
8765	622	17	4
8766	622	18	6
8767	568	1	7
8768	568	2	0
8769	568	3	5
8770	568	4	5
8771	568	5	6
8772	568	6	5
8773	568	7	4
8774	568	8	0
8775	568	9	4
8776	568	10	4
8777	568	11	0
8778	568	12	6
8779	568	13	6
8780	568	14	5
8781	568	15	4
8782	568	16	6
8783	568	17	5
8784	568	18	0
8785	620	1	7
8786	620	2	0
8787	620	3	6
8788	620	4	6
8789	620	5	5
8790	620	6	6
8791	620	7	3
8792	620	8	5
8793	620	9	4
8794	620	10	0
8795	620	11	3
8796	620	12	5
8797	620	13	5
8798	620	14	5
8799	620	15	6
8800	620	16	0
8801	620	17	5
8802	620	18	6
8803	640	1	7
8804	640	2	4
8805	640	3	0
8806	640	4	0
8807	640	5	0
8808	640	6	7
8809	640	7	0
8810	640	8	0
8811	640	9	0
8812	640	10	7
8813	640	11	6
8814	640	12	7
8815	640	13	7
8816	640	14	5
8817	640	15	0
8818	640	16	6
8819	640	17	0
8820	640	18	0
8821	632	1	7
8822	632	2	5
8823	632	3	5
8824	632	4	6
8825	632	5	5
8826	632	6	6
8827	632	7	3
8828	632	8	6
8829	632	9	4
8830	632	10	0
8831	632	11	4
8832	632	12	5
8833	632	13	6
8834	632	14	5
8835	632	15	0
8836	632	16	7
8837	632	17	0
8838	632	18	6
8839	634	1	6
8840	634	2	4
8841	634	3	6
8842	634	4	7
8843	634	5	6
8844	634	6	0
8845	634	7	0
8846	634	8	0
8847	634	9	5
8848	634	10	0
8849	634	11	3
8850	634	12	5
8851	634	13	6
8852	634	14	6
8853	634	15	4
8854	634	16	4
8855	634	17	6
8856	634	18	6
8857	559	1	6
10442	742	2	4
8858	559	2	5
8859	559	3	8
8860	559	4	6
8861	559	5	6
8862	559	6	5
8863	559	7	0
8864	559	8	5
8865	559	9	3
8866	559	10	6
8867	559	11	4
8868	559	12	5
8869	559	13	5
8870	559	14	0
8871	559	15	6
8872	559	16	7
8873	559	17	0
8874	559	18	8
8875	561	1	6
8876	561	2	4
8877	561	3	0
8878	561	4	5
8879	561	5	5
8880	561	6	6
8881	561	7	4
8882	561	8	4
8883	561	9	5
8884	561	10	6
8885	561	11	4
8886	561	12	4
8887	561	13	0
8888	561	14	3
8889	561	15	6
8890	561	16	0
8891	561	17	5
8892	561	18	0
8893	542	1	0
8894	542	2	5
8895	542	3	4
8896	542	4	4
8897	542	5	6
8898	542	6	0
8899	542	7	5
8900	542	8	5
8901	542	9	4
8902	542	10	6
8903	542	11	5
8904	542	12	5
8905	542	13	6
8906	542	14	3
8907	542	15	5
8908	542	16	6
8909	542	17	4
8910	542	18	5
8911	539	1	6
8912	539	2	0
8913	539	3	7
8914	539	4	5
8915	539	5	6
8916	539	6	6
8917	539	7	4
8918	539	8	0
8919	539	9	4
8920	539	10	5
8921	539	11	4
8922	539	12	5
8923	539	13	6
8924	539	14	5
8925	539	15	0
8926	539	16	0
8927	539	17	0
8928	539	18	5
8929	592	1	5
8930	592	2	4
8931	592	3	6
8932	592	4	5
8933	592	5	6
8934	592	6	5
8935	592	7	4
8936	592	8	4
8937	592	9	4
8938	592	10	5
8939	592	11	4
8940	592	12	4
8941	592	13	5
8942	592	14	4
8943	592	15	4
8944	592	16	5
8945	592	17	4
8946	592	18	5
8947	596	1	6
8948	596	2	4
8949	596	3	5
8950	596	4	7
8951	596	5	0
8952	596	6	6
8953	596	7	5
8954	596	8	0
8955	596	9	4
8956	596	10	6
8957	596	11	4
8958	596	12	6
8959	596	13	5
8960	596	14	3
8961	596	15	0
8962	596	16	8
8963	596	17	5
8964	596	18	7
8965	597	1	6
8966	597	2	4
8967	597	3	7
8968	597	4	5
8969	597	5	7
8970	597	6	7
8971	597	7	4
8972	597	8	5
8973	597	9	5
8974	597	10	6
8975	597	11	3
8976	597	12	4
8977	597	13	0
8978	597	14	5
8979	597	15	0
8980	597	16	6
8981	597	17	5
8982	597	18	6
8983	556	1	6
8984	556	2	4
8985	556	3	4
8986	556	4	4
8987	556	5	6
8988	556	6	4
8989	556	7	3
8990	556	8	5
8991	556	9	5
8992	556	10	3
8993	556	11	5
8994	556	12	3
8995	556	13	4
8996	556	14	4
8997	556	15	6
8998	556	16	6
8999	556	17	3
9000	556	18	0
9001	577	1	0
9002	577	2	0
9003	577	3	0
9004	577	4	0
9005	577	5	0
9006	577	6	0
9007	577	7	0
9008	577	8	7
9009	577	9	4
9010	577	10	5
9011	577	11	4
9012	577	12	5
9013	577	13	7
9014	577	14	5
9015	577	15	5
9016	577	16	0
9017	577	17	0
9018	577	18	0
9019	604	1	7
9020	604	2	5
9021	604	3	0
9022	604	4	5
9023	604	5	0
9024	604	6	5
9025	604	7	4
9026	604	8	6
9027	604	9	4
9028	604	10	0
9029	604	11	3
9030	604	12	6
9031	604	13	5
9032	604	14	0
9033	604	15	6
9034	604	16	0
9035	604	17	5
9036	604	18	6
9037	555	1	7
9038	555	2	3
9039	555	3	0
9040	555	4	4
9041	555	5	7
9042	555	6	4
9043	555	7	3
9044	555	8	4
9045	555	9	4
9046	555	10	5
9047	555	11	5
9048	555	12	5
9049	555	13	6
9050	555	14	4
9051	555	15	4
9052	555	16	6
9053	555	17	5
9054	555	18	4
9056	629	2	4
9057	629	3	6
9058	629	4	5
9059	629	5	6
9060	629	6	0
9061	629	7	5
9062	629	8	5
9063	629	9	4
9064	629	10	0
9065	629	11	3
9066	629	12	4
9067	629	13	5
9068	629	14	4
9069	629	15	5
9070	629	16	6
9071	629	17	5
9072	629	18	4
10027	657	1	6
9073	587	1	5
9074	587	2	4
9075	587	3	4
9076	587	4	5
9077	587	5	0
9078	587	6	0
9079	587	7	4
9080	587	8	4
9081	587	9	4
9082	587	10	5
9083	587	11	3
9084	587	12	5
9085	587	13	4
9086	587	14	0
9087	587	15	6
9088	587	16	6
9089	587	17	4
9090	587	18	5
9091	580	1	0
9092	580	2	4
9093	580	3	7
9094	580	4	5
9095	580	5	7
9096	580	6	7
9097	580	7	3
9098	580	8	4
9099	580	9	4
9100	580	10	5
9101	580	11	5
9102	580	12	6
9103	580	13	5
9104	580	14	4
9105	580	15	5
9106	580	16	5
9107	580	17	5
9108	580	18	7
9109	630	1	6
9110	630	2	4
9111	630	3	5
9112	630	4	4
9113	630	5	8
9114	630	6	4
9115	630	7	5
9116	630	8	4
9117	630	9	4
9118	630	10	0
9119	630	11	4
9120	630	12	4
9121	630	13	6
9122	630	14	4
9123	630	15	4
9124	630	16	0
9125	630	17	5
9126	630	18	6
9127	631	1	6
9128	631	2	5
9129	631	3	0
9130	631	4	4
9131	631	5	6
9132	631	6	5
9133	631	7	4
9134	631	8	0
9135	631	9	4
9136	631	10	4
9137	631	11	5
9138	631	12	4
9139	631	13	4
9140	631	14	4
9141	631	15	5
9142	631	16	5
9143	631	17	6
9144	631	18	6
9145	563	1	6
9146	563	2	3
9147	563	3	6
9148	563	4	5
12349	820	1	6
9149	563	5	7
9150	563	6	0
9151	563	7	4
9152	563	8	7
9153	563	9	5
9154	563	10	5
9155	563	11	3
9156	563	12	8
9157	563	13	7
9158	563	14	4
9159	563	15	6
9160	563	16	8
9161	563	17	7
9162	563	18	6
9163	607	1	7
9164	607	2	5
9165	607	3	5
9166	607	4	7
9167	607	5	6
9168	607	6	8
9169	607	7	0
9170	607	8	5
9171	607	9	4
9172	607	10	7
9173	607	11	4
9174	607	12	4
9175	607	13	6
9176	607	14	5
9177	607	15	6
9178	607	16	6
9179	607	17	5
9180	607	18	8
9181	571	1	6
9182	571	2	4
9183	571	3	0
9184	571	4	0
9185	571	5	6
9186	571	6	0
9187	571	7	3
9188	571	8	6
9189	571	9	5
9190	571	10	4
9191	571	11	0
9192	571	12	5
9193	571	13	4
9194	571	14	4
9195	571	15	4
9196	571	16	4
9197	571	17	4
9198	571	18	5
9199	535	1	6
9200	535	2	4
9201	535	3	5
9202	535	4	5
9203	535	5	6
9204	535	6	0
9205	535	7	0
9206	535	8	4
9207	535	9	4
9208	535	10	0
9209	535	11	4
9210	535	12	4
9211	535	13	0
9212	535	14	4
9213	535	15	6
9214	535	16	5
9215	535	17	6
9216	535	18	0
9217	582	1	5
9218	582	2	3
9219	582	3	4
9220	582	4	6
9221	582	5	3
9222	582	6	5
9223	582	7	3
9224	582	8	5
9225	582	9	4
9226	582	10	5
9227	582	11	4
9228	582	12	4
9229	582	13	6
9230	582	14	3
9231	582	15	4
9232	582	16	7
9233	582	17	5
9234	582	18	5
9262	598	10	4
9263	598	11	4
9264	598	12	6
9265	598	13	4
9266	598	14	5
9267	598	15	4
9268	598	16	7
9269	598	17	5
9270	598	18	5
9235	611	1	6
9236	611	2	0
9237	611	3	5
9238	611	4	5
9239	611	5	7
9240	611	6	6
9241	611	7	4
9242	611	8	5
9243	611	9	5
9244	611	10	0
9245	611	11	0
9246	611	12	4
9247	611	13	4
9248	611	14	4
9249	611	15	5
9250	611	16	7
9251	611	17	4
9252	611	18	4
9253	598	1	7
9254	598	2	0
9255	598	3	5
9256	598	4	4
9257	598	5	6
9258	598	6	5
9259	598	7	4
9260	598	8	6
9261	598	9	5
9271	638	1	7
9272	638	2	5
9273	638	3	6
9274	638	4	4
9275	638	5	6
9276	638	6	5
9277	638	7	6
9278	638	8	4
9279	638	9	4
9280	638	10	7
9281	638	11	5
9282	638	12	4
9283	638	13	4
9284	638	14	3
9285	638	15	4
9286	638	16	5
9287	638	17	4
9288	638	18	6
9289	541	1	6
9290	541	2	5
9291	541	3	6
9292	541	4	5
9293	541	5	6
9294	541	6	6
9295	541	7	4
9296	541	8	0
9297	541	9	3
9298	541	10	5
9299	541	11	3
9300	541	12	4
9301	541	13	5
9302	541	14	4
9303	541	15	6
9304	541	16	7
9305	541	17	6
9306	541	18	4
9307	543	1	5
9308	543	2	5
9309	543	3	5
9310	543	4	5
9311	543	5	6
9312	543	6	5
9313	543	7	6
9314	543	8	6
9315	543	9	3
9316	543	10	5
9317	543	11	4
9318	543	12	5
9319	543	13	6
9320	543	14	4
9321	543	15	6
9322	543	16	7
9323	543	17	7
9324	543	18	5
9325	581	1	5
9326	581	2	5
9327	581	3	5
9328	581	4	5
9329	581	5	6
9330	581	6	4
9331	581	7	4
9332	581	8	5
9333	581	9	5
9334	581	10	4
9335	581	11	5
9336	581	12	4
9337	581	13	4
9338	581	14	4
9339	581	15	5
9340	581	16	0
9341	581	17	4
9342	581	18	5
9343	602	1	7
9344	602	2	3
9345	602	3	4
9346	602	4	4
9347	602	5	6
9348	602	6	6
9349	602	7	5
9350	602	8	0
9351	602	9	5
9352	602	10	6
9353	602	11	0
9354	602	12	6
9355	602	13	5
9356	602	14	4
9357	602	15	6
9358	602	16	6
9359	602	17	5
9360	602	18	0
9361	624	1	0
9362	624	2	4
9363	624	3	5
9364	624	4	0
9365	624	5	6
9366	624	6	0
9367	624	7	4
9368	624	8	3
9369	624	9	4
9370	624	10	4
9371	624	11	3
9372	624	12	4
9373	624	13	6
9374	624	14	4
9375	624	15	6
9376	624	16	6
9377	624	17	4
9378	624	18	5
9379	538	1	4
9380	538	2	4
9381	538	3	4
9382	538	4	6
9383	538	5	0
9384	538	6	5
9385	538	7	4
9386	538	8	4
9387	538	9	5
9388	538	10	4
9389	538	11	4
9390	538	12	4
9391	538	13	0
9392	538	14	4
9393	538	15	4
9394	538	16	6
9395	538	17	5
9396	538	18	6
9397	536	1	6
9398	536	2	5
9399	536	3	6
9400	536	4	5
9401	536	5	6
9402	536	6	6
9403	536	7	4
9404	536	8	4
9405	536	9	5
9406	536	10	4
9407	536	11	0
9408	536	12	3
9409	536	13	5
9410	536	14	3
9411	536	15	5
9412	536	16	6
9413	536	17	5
9414	536	18	6
9415	540	1	5
9416	540	2	4
9417	540	3	6
9418	540	4	4
9419	540	5	6
9420	540	6	6
9421	540	7	3
9422	540	8	5
9423	540	9	4
9424	540	10	7
9425	540	11	5
9426	540	12	4
9427	540	13	5
9428	540	14	3
9429	540	15	6
9430	540	16	6
9431	540	17	7
9432	540	18	6
9433	565	1	7
9434	565	2	4
9435	565	3	6
9436	565	4	8
9437	565	5	0
9438	565	6	8
9439	565	7	5
10028	657	2	4
9440	565	8	6
9441	565	9	6
9442	565	10	5
9443	565	11	6
9444	565	12	5
9445	565	13	6
9446	565	14	4
9447	565	15	4
9448	565	16	6
9449	565	17	7
9450	565	18	7
9451	572	1	7
9452	572	2	4
9453	572	3	5
9454	572	4	4
9455	572	5	0
9456	572	6	6
9457	572	7	4
9458	572	8	3
9459	572	9	5
9460	572	10	4
9461	572	11	4
9462	572	12	4
9463	572	13	6
9464	572	14	4
9465	572	15	5
9466	572	16	5
9467	572	17	4
9468	572	18	0
9469	573	1	7
9470	573	2	5
9471	573	3	6
9472	573	4	0
9473	573	5	7
9474	573	6	6
9475	573	7	0
9476	573	8	0
9477	573	9	5
9478	573	10	5
9479	573	11	4
9480	573	12	6
9481	573	13	5
9482	573	14	4
9483	573	15	0
9484	573	16	0
9485	573	17	6
9486	573	18	6
9487	584	1	7
9488	584	2	3
9489	584	3	4
9490	584	4	5
9491	584	5	0
9492	584	6	5
9493	584	7	0
9494	584	8	0
9495	584	9	5
9496	584	10	0
9497	584	11	2
9498	584	12	5
9499	584	13	5
9500	584	14	3
9501	584	15	5
9502	584	16	6
9503	584	17	0
9504	584	18	0
9505	600	1	0
9506	600	2	4
9507	600	3	0
9508	600	4	5
9509	600	5	4
9510	600	6	5
9511	600	7	5
9512	600	8	5
9513	600	9	3
9514	600	10	5
9515	600	11	5
9516	600	12	5
9517	600	13	6
9518	600	14	0
9519	600	15	5
9520	600	16	5
9521	600	17	5
9522	600	18	6
9523	599	1	6
9524	599	2	5
9525	599	3	7
9526	599	4	5
9527	599	5	9
9528	599	6	7
9529	599	7	3
9530	599	8	6
9531	599	9	5
9532	599	10	4
9533	599	11	0
9534	599	12	7
9535	599	13	8
9536	599	14	5
9537	599	15	0
9538	599	16	8
9539	599	17	4
9540	599	18	0
9541	627	1	7
9542	627	2	5
9543	627	3	7
9544	627	4	7
9545	627	5	7
9546	627	6	6
9547	627	7	4
9548	627	8	5
9549	627	9	5
9550	627	10	4
9551	627	11	3
9552	627	12	5
9553	627	13	5
9554	627	14	0
9555	627	15	0
9556	627	16	7
9557	627	17	0
9558	627	18	7
9559	544	1	6
9560	544	2	7
9561	544	3	0
9562	544	4	4
9563	544	5	6
9564	544	6	6
9565	544	7	3
9566	544	8	4
9567	544	9	3
9568	544	10	7
9569	544	11	2
9570	544	12	6
9571	544	13	5
9572	544	14	4
9573	544	15	5
9574	544	16	5
9575	544	17	5
9576	544	18	0
9577	609	1	6
9578	609	2	3
9579	609	3	5
9580	609	4	5
9581	609	5	7
9582	609	6	5
9583	609	7	4
9584	609	8	7
9585	609	9	4
9586	609	10	5
9587	609	11	0
9588	609	12	0
9589	609	13	5
9590	609	14	4
9591	609	15	6
9592	609	16	6
9593	609	17	5
9594	609	18	7
9595	625	1	6
9596	625	2	3
9597	625	3	5
9598	625	4	5
9599	625	5	0
9600	625	6	0
9601	625	7	4
9602	625	8	5
9603	625	9	5
9604	625	10	4
9605	625	11	5
9606	625	12	0
9607	625	13	6
9608	625	14	3
9609	625	15	5
9610	625	16	6
9611	625	17	5
9612	625	18	6
9613	570	1	0
9614	570	2	5
9615	570	3	0
9616	570	4	5
9617	570	5	8
9618	570	6	5
9619	570	7	3
9620	570	8	7
9621	570	9	4
9622	570	10	6
9623	570	11	4
9624	570	12	5
9625	570	13	6
9626	570	14	6
9627	570	15	3
9628	570	16	7
9629	570	17	4
9630	570	18	0
9631	576	1	0
9632	576	2	0
9633	576	3	4
9634	576	4	0
9635	576	5	7
9636	576	6	5
9637	576	7	3
9638	576	8	4
9639	576	9	4
9640	576	10	4
9641	576	11	0
9642	576	12	3
9643	576	13	0
9644	576	14	2
9645	576	15	4
9646	576	16	0
9647	576	17	5
9648	576	18	6
9649	579	1	6
9650	579	2	6
9651	579	3	5
9652	579	4	4
9653	579	5	6
9654	579	6	5
9655	579	7	5
9656	579	8	6
9657	579	9	5
9658	579	10	0
9659	579	11	0
9660	579	12	4
9661	579	13	5
9662	579	14	4
9663	579	15	4
9664	579	16	7
9665	579	17	6
9666	579	18	6
9667	548	1	5
9668	548	2	4
9669	548	3	5
9670	548	4	7
9671	548	5	7
9672	548	6	6
9673	548	7	5
9674	548	8	4
9675	548	9	4
9676	548	10	7
9677	548	11	3
9678	548	12	5
9679	548	13	4
9680	548	14	6
9681	548	15	5
9682	548	16	7
9683	548	17	5
9684	548	18	4
9685	537	1	0
9686	537	2	4
9687	537	3	5
9688	537	4	5
9689	537	5	6
9690	537	6	6
9691	537	7	3
9692	537	8	4
9693	537	9	5
9694	537	10	4
9695	537	11	3
9696	537	12	6
9697	537	13	5
9698	537	14	4
9699	537	15	4
9700	537	16	6
9701	537	17	4
9702	537	18	6
9703	562	1	7
9704	562	2	3
9705	562	3	4
9706	562	4	3
9707	562	5	0
9708	562	6	6
9709	562	7	4
9710	562	8	5
9711	562	9	4
9712	562	10	5
9713	562	11	6
9714	562	12	5
9715	562	13	5
9716	562	14	4
9717	562	15	5
9718	562	16	5
9719	562	17	7
9720	562	18	6
9721	557	1	5
9722	557	2	5
9723	557	3	5
9724	557	4	6
9725	557	5	6
9726	557	6	6
9727	557	7	0
9728	557	8	4
9729	557	9	0
9730	557	10	6
10443	742	3	5
9731	557	11	4
9732	557	12	5
9733	557	13	7
9734	557	14	5
9735	557	15	6
9736	557	16	7
9737	557	17	5
9738	557	18	0
9739	583	1	8
9740	583	2	5
9741	583	3	0
9742	583	4	5
9743	583	5	7
9744	583	6	6
9745	583	7	3
9746	583	8	4
9747	583	9	3
9748	583	10	0
9749	583	11	4
9750	583	12	4
9751	583	13	5
9752	583	14	4
9753	583	15	5
9754	583	16	6
9755	583	17	6
9756	583	18	7
9757	626	1	5
9758	626	2	5
9759	626	3	5
9760	626	4	0
9761	626	5	6
9762	626	6	5
9763	626	7	4
9764	626	8	6
9765	626	9	5
9766	626	10	5
9767	626	11	4
9768	626	12	5
9769	626	13	5
9770	626	14	3
9771	626	15	0
9772	626	16	5
9773	626	17	7
9774	626	18	5
9775	601	1	5
9776	601	2	4
9777	601	3	4
9778	601	4	4
9779	601	5	6
9780	601	6	6
9781	601	7	4
9782	601	8	5
9783	601	9	4
9784	601	10	6
9785	601	11	0
9786	601	12	5
9787	601	13	4
9788	601	14	4
9789	601	15	4
9790	601	16	7
9791	601	17	5
9792	601	18	6
9793	578	1	5
9794	578	2	6
9795	578	3	5
9796	578	4	7
9797	578	5	7
9798	578	6	6
9799	578	7	4
9800	578	8	6
9801	578	9	6
9802	578	10	5
9803	578	11	4
9804	578	12	4
9805	578	13	5
9806	578	14	4
9807	578	15	5
9808	578	16	7
9809	578	17	5
9810	578	18	7
9811	585	1	0
9812	585	2	0
9813	585	3	5
9814	585	4	4
9815	585	5	0
9816	585	6	0
9817	585	7	4
9818	585	8	6
9819	585	9	5
9820	585	10	6
9821	585	11	4
9822	585	12	5
9823	585	13	5
9824	585	14	4
9825	585	15	0
9826	585	16	6
9827	585	17	7
9828	585	18	7
9829	589	1	7
9830	589	2	4
9831	589	3	5
9832	589	4	5
9833	589	5	7
9834	589	6	5
9835	589	7	5
9836	589	8	5
9837	589	9	5
9838	589	10	5
9839	589	11	4
9840	589	12	0
9841	589	13	7
9842	589	14	7
9843	589	15	6
9844	589	16	7
9845	589	17	0
9846	589	18	6
9847	590	1	6
9848	590	2	4
9849	590	3	6
9850	590	4	5
9851	590	5	0
9852	590	6	5
9853	590	7	4
9854	590	8	4
9855	590	9	5
9856	590	10	0
9857	590	11	0
9858	590	12	4
9859	590	13	4
9860	590	14	5
9861	590	15	5
9862	590	16	6
9863	590	17	0
9864	590	18	0
10009	642	1	5
9866	591	2	0
9867	591	3	0
9868	591	4	0
9869	591	5	0
9870	591	6	0
9871	591	7	0
9872	591	8	0
9873	591	9	0
9874	591	10	6
9875	591	11	5
9876	591	12	4
11702	786	2	0
9957	636	3	5
9958	636	4	0
9959	636	5	5
9865	591	1	0
9877	591	13	6
9878	591	14	5
9879	591	15	0
9880	591	16	0
9881	591	17	5
9882	591	18	0
9883	567	1	5
9884	567	2	5
9885	567	3	5
9886	567	4	5
9887	567	5	6
9888	567	6	6
9889	567	7	3
9890	567	8	6
9891	567	9	0
9892	567	10	4
9893	567	11	0
9894	567	12	0
9895	567	13	4
9896	567	14	3
9897	567	15	5
9898	567	16	7
9899	567	17	4
9900	567	18	6
9901	610	1	5
9902	610	2	6
9903	610	3	5
9904	610	4	6
9905	610	5	6
9906	610	6	6
9907	610	7	6
9908	610	8	6
9909	610	9	5
9910	610	10	4
9911	610	11	3
9912	610	12	0
9913	610	13	5
9914	610	14	3
9915	610	15	5
9916	610	16	0
9917	610	17	6
9918	610	18	6
9919	623	1	6
9920	623	2	4
9921	623	3	5
9922	623	4	6
9923	623	5	8
9924	623	6	4
9925	623	7	3
9926	623	8	0
9927	623	9	5
9928	623	10	6
9929	623	11	2
9930	623	12	6
9931	623	13	5
9932	623	14	4
9933	623	15	6
9934	623	16	6
9935	623	17	5
9936	623	18	5
9937	641	1	7
9938	641	2	4
9939	641	3	6
9940	641	4	4
9941	641	5	8
9942	641	6	7
9943	641	7	4
9944	641	8	0
9945	641	9	5
9946	641	10	5
9947	641	11	5
9948	641	12	5
9949	641	13	7
9950	641	14	6
9951	641	15	4
9952	641	16	5
9953	641	17	7
9954	641	18	0
9955	636	1	6
9956	636	2	6
9960	636	6	6
9961	636	7	0
9962	636	8	4
9963	636	9	5
9964	636	10	5
9965	636	11	4
9966	636	12	4
9967	636	13	6
9968	636	14	5
9969	636	15	6
9970	636	16	6
9971	636	17	6
9972	636	18	6
9973	637	1	8
9974	637	2	6
9975	637	3	0
9976	637	4	6
9977	637	5	0
9978	637	6	6
9979	637	7	5
9980	637	8	6
9981	637	9	0
9982	637	10	0
9983	637	11	4
9984	637	12	7
9985	637	13	0
9986	637	14	7
9987	637	15	0
9988	637	16	0
9989	637	17	5
9990	637	18	8
9991	639	1	0
9992	639	2	5
9993	639	3	6
9994	639	4	6
9995	639	5	8
9996	639	6	6
9997	639	7	6
9998	639	8	6
9999	639	9	6
10000	639	10	6
10001	639	11	4
10002	639	12	5
10003	639	13	4
10004	639	14	4
10005	639	15	4
10006	639	16	6
10007	639	17	5
10008	639	18	5
8713	550	1	5
9055	629	1	5
10010	642	2	4
10011	642	3	5
10012	642	4	5
10013	642	5	4
10014	642	6	4
10015	642	7	5
10016	642	8	5
10017	642	9	4
10018	642	10	6
10019	642	11	4
10020	642	12	5
10021	642	13	6
10444	742	4	3
10029	657	3	6
10030	657	4	6
10031	657	5	6
10032	657	6	5
10033	657	7	4
10034	657	8	0
10035	657	9	5
10036	657	10	0
10037	657	11	4
10038	657	12	5
10039	657	13	6
10040	657	14	5
10041	657	15	5
10042	657	16	9
10043	657	17	7
10044	657	18	7
10045	664	1	7
10046	664	2	4
10047	664	3	5
10048	664	4	6
10049	664	5	0
10050	664	6	0
10051	664	7	0
10052	664	8	0
10053	664	9	0
10054	664	10	0
10055	664	11	0
10056	664	12	0
10057	664	13	0
10058	664	14	0
10059	664	15	0
10060	664	16	0
10061	664	17	0
10062	664	18	0
10063	649	1	0
10064	649	2	4
10065	649	3	4
10066	649	4	4
10067	649	5	7
10068	649	6	6
10069	649	7	3
10070	649	8	5
10071	649	9	5
10072	649	10	0
10073	649	11	4
10074	649	12	3
10075	649	13	5
10076	649	14	4
10077	649	15	5
10078	649	16	5
10079	649	17	4
10080	649	18	0
10081	658	1	0
10082	658	2	6
10083	658	3	5
10084	658	4	4
10085	658	5	0
10086	658	6	7
10087	658	7	4
10088	658	8	4
10089	658	9	4
10090	658	10	6
10091	658	11	4
10092	658	12	4
10093	658	13	5
10094	658	14	4
10095	658	15	6
10096	658	16	6
10097	658	17	4
10098	658	18	5
10099	650	1	5
10100	650	2	3
10101	650	3	5
10102	650	4	5
10103	650	5	5
10104	650	6	5
10105	650	7	5
10106	650	8	5
10107	650	9	4
10108	650	10	5
10109	650	11	3
10110	650	12	5
10111	650	13	4
10112	650	14	4
10113	650	15	0
10114	650	16	7
10115	650	17	3
10116	650	18	5
10117	651	1	6
10118	651	2	4
10119	651	3	5
10120	651	4	6
10121	651	5	6
10122	651	6	6
10123	651	7	5
10124	651	8	3
10125	651	9	3
10126	651	10	5
10127	651	11	4
10128	651	12	5
10129	651	13	6
10130	651	14	4
10131	651	15	6
10132	651	16	0
10133	651	17	5
10134	651	18	7
10135	661	1	7
10136	661	2	4
10137	661	3	5
10138	661	4	6
10139	661	5	5
10140	661	6	6
10141	661	7	4
10142	661	8	0
10143	661	9	4
10144	661	10	0
10145	661	11	4
10146	661	12	0
10147	661	13	6
10148	661	14	5
10149	661	15	7
10150	661	16	0
10151	661	17	6
10152	661	18	7
10153	660	1	7
10154	660	2	0
10155	660	3	5
10156	660	4	5
10157	660	5	5
10158	660	6	7
10159	660	7	4
10160	660	8	5
10161	660	9	5
10162	660	10	4
10163	660	11	4
10164	660	12	5
10165	660	13	4
10166	660	14	4
10167	660	15	5
10168	660	16	7
10169	660	17	6
10170	660	18	4
10172	654	2	5
10173	654	3	5
10174	654	4	4
10423	739	1	6
10289	653	11	4
10290	653	12	4
10291	653	13	5
10292	653	14	0
10293	653	15	5
10294	653	16	0
10295	653	17	5
10189	665	1	8
10190	665	2	7
10191	665	3	0
10192	665	4	5
10193	665	5	0
10194	665	6	6
10195	665	7	6
10196	665	8	0
10197	665	9	5
10198	665	10	0
10199	665	11	4
10200	665	12	6
10201	665	13	0
10202	665	14	0
10203	665	15	6
10204	665	16	0
10205	665	17	0
10206	665	18	6
10207	648	1	6
10208	648	2	5
10209	648	3	3
10210	648	4	4
10211	648	5	5
10212	648	6	3
10213	648	7	3
10214	648	8	4
10215	648	9	4
10216	648	10	6
10217	648	11	4
10218	648	12	5
10219	648	13	4
10220	648	14	3
10221	648	15	5
10222	648	16	5
10223	648	17	4
10224	648	18	4
10225	643	1	5
10226	643	2	5
10227	643	3	5
10228	643	4	5
10229	643	5	6
10230	643	6	5
10231	643	7	4
10232	643	8	6
10233	643	9	5
10234	643	10	0
10235	643	11	3
10236	643	12	6
10237	643	13	5
10238	643	14	3
10239	643	15	4
10240	643	16	7
10241	643	17	5
10242	643	18	0
10243	645	1	5
10244	645	2	4
10245	645	3	4
10246	645	4	5
10247	645	5	5
10248	645	6	6
10249	645	7	4
10250	645	8	4
10251	645	9	4
10252	645	10	4
10253	645	11	4
10254	645	12	4
10255	645	13	6
10256	645	14	3
10257	645	15	7
10258	645	16	6
10259	645	17	4
10260	645	18	4
10171	654	1	7
10175	654	5	6
10176	654	6	4
10177	654	7	0
10178	654	8	5
10179	654	9	4
10180	654	10	5
10181	654	11	5
10182	654	12	5
10183	654	13	7
10184	654	14	3
10185	654	15	5
10186	654	16	0
10187	654	17	5
10188	654	18	6
10261	656	1	0
10262	656	2	3
10263	656	3	5
10264	656	4	5
10265	656	5	5
10266	656	6	4
10267	656	7	6
10268	656	8	6
10269	656	9	5
10270	656	10	5
10271	656	11	4
10272	656	12	4
10273	656	13	5
10274	656	14	3
10275	656	15	6
10276	656	16	7
10277	656	17	6
10278	656	18	5
10279	653	1	6
10280	653	2	3
10281	653	3	5
10282	653	4	7
10283	653	5	7
10284	653	6	6
10285	653	7	4
10286	653	8	0
10287	653	9	4
10288	653	10	5
10296	653	18	6
10297	644	1	6
10298	644	2	4
10299	644	3	5
10300	644	4	5
10301	644	5	5
10302	644	6	0
10303	644	7	4
10304	644	8	5
10305	644	9	5
10306	644	10	5
10307	644	11	4
10308	644	12	0
10309	644	13	5
10310	644	14	3
10311	644	15	6
10312	644	16	6
10313	644	17	5
10314	644	18	4
10315	655	1	6
10316	655	2	4
10317	655	3	4
10318	655	4	7
10319	655	5	7
10320	655	6	5
10321	655	7	5
10322	655	8	5
10323	655	9	5
10324	655	10	6
10325	655	11	4
10326	655	12	0
10327	655	13	7
10328	655	14	5
10329	655	15	5
10330	655	16	0
10331	655	17	0
10332	655	18	6
10333	663	1	8
10334	663	2	4
10335	663	3	4
10336	663	4	7
10337	663	5	6
10338	663	6	7
10339	663	7	6
10340	663	8	5
10341	663	9	4
10342	663	10	4
10343	663	11	3
10344	663	12	3
10345	663	13	4
10346	663	14	6
10347	663	15	7
10348	663	16	7
10349	663	17	7
10350	663	18	6
10351	662	1	0
10352	662	2	0
10353	662	3	0
10354	662	4	0
10355	662	5	6
10356	662	6	6
10357	662	7	0
10358	662	8	0
10359	662	9	4
10360	662	10	4
10361	662	11	3
10362	662	12	4
10363	662	13	5
10364	662	14	3
10365	662	15	0
10366	662	16	5
10367	662	17	6
10368	662	18	0
10369	659	1	8
10370	659	2	5
10371	659	3	7
10372	659	4	6
10373	659	5	8
10374	659	6	7
10375	659	7	3
10376	659	8	0
10377	659	9	6
10378	659	10	9
10379	659	11	6
10380	659	12	7
10381	659	13	6
10382	659	14	0
10383	659	15	6
10384	659	16	0
10385	659	17	5
10386	659	18	7
10387	666	1	6
10388	666	2	4
10389	666	3	6
10390	666	4	5
10391	666	5	6
10392	666	6	5
10393	666	7	3
10394	666	8	5
10395	666	9	4
10396	666	10	4
10397	666	11	5
10398	666	12	4
10399	666	13	4
10400	666	14	4
10401	666	15	5
10402	666	16	6
10403	666	17	5
10404	666	18	0
10405	667	1	5
10406	667	2	4
10407	667	3	5
10408	667	4	6
10409	667	5	5
10410	667	6	4
10411	667	7	4
10412	667	8	4
10413	667	9	4
10414	667	10	4
10415	667	11	3
10416	667	12	4
10417	667	13	4
10418	667	14	4
10419	667	15	3
10420	667	16	6
10421	667	17	4
10422	667	18	6
10424	739	2	3
10425	739	3	5
10426	739	4	4
10427	739	5	6
10428	739	6	4
10429	739	7	4
10430	739	8	4
10431	739	9	0
10432	739	10	5
10433	739	11	3
10434	739	12	4
10435	739	13	4
10436	739	14	4
10437	739	15	4
10438	739	16	5
10439	739	17	4
10440	739	18	4
10445	742	5	5
10446	742	6	7
10447	742	7	4
10448	742	8	4
10449	742	9	4
10450	742	10	5
10451	742	11	4
10452	742	12	5
10453	742	13	5
10454	742	14	3
10455	742	15	4
10456	742	16	5
10457	742	17	4
10458	742	18	5
10459	702	1	5
10460	702	2	5
10461	702	3	6
10462	702	4	6
10463	702	5	6
10464	702	6	6
10465	702	7	4
10466	702	8	7
10467	702	9	4
10468	702	10	6
10469	702	11	5
12709	849	1	5
10470	702	12	6
10471	702	13	7
10472	702	14	4
10473	702	15	5
10474	702	16	6
10475	702	17	7
10476	702	18	5
10477	699	1	7
10478	699	2	4
10479	699	3	6
10480	699	4	6
10481	699	5	0
10482	699	6	7
10483	699	7	4
10484	699	8	5
10485	699	9	4
10486	699	10	4
10487	699	11	3
10488	699	12	4
10489	699	13	6
10490	699	14	4
10491	699	15	5
10492	699	16	5
10493	699	17	5
10494	699	18	6
10495	701	1	6
10496	701	2	5
10497	701	3	5
10498	701	4	7
10499	701	5	0
10500	701	6	5
10501	701	7	6
10502	701	8	0
10503	701	9	0
10504	701	10	7
10505	701	11	0
10506	701	12	5
10507	701	13	5
10508	701	14	5
10509	701	15	5
10510	701	16	7
10511	701	17	4
10512	701	18	8
10513	700	1	6
10514	700	2	4
10515	700	3	6
10516	700	4	0
10517	700	5	5
10518	700	6	5
10519	700	7	5
10520	700	8	5
10521	700	9	5
10522	700	10	0
10523	700	11	4
10524	700	12	4
10525	700	13	5
10526	700	14	0
10527	700	15	0
10528	700	16	6
10529	700	17	5
10530	700	18	5
10531	743	1	5
10532	743	2	5
10533	743	3	5
10534	743	4	0
10535	743	5	6
10536	743	6	4
10537	743	7	0
10538	743	8	5
10539	743	9	6
10540	743	10	5
10541	743	11	4
10542	743	12	4
10543	743	13	5
10544	743	14	4
10545	743	15	4
10546	743	16	7
10547	743	17	5
10548	743	18	6
10549	668	1	7
10550	668	2	4
10551	668	3	6
10552	668	4	6
10553	668	5	0
10554	668	6	7
10555	668	7	4
10556	668	8	5
10557	668	9	4
10558	668	10	4
10559	668	11	3
10560	668	12	4
10561	668	13	6
10562	668	14	4
10563	668	15	5
10564	668	16	5
10565	668	17	5
10566	668	18	6
10567	669	1	6
10568	669	2	4
10569	669	3	6
10570	669	4	0
10571	669	5	5
10572	669	6	5
10573	669	7	5
10574	669	8	5
10575	669	9	5
10576	669	10	0
10577	669	11	4
10578	669	12	4
10579	669	13	5
10580	669	14	0
10581	669	15	0
10582	669	16	6
10583	669	17	5
10584	669	18	5
10585	670	1	6
10586	670	2	5
10587	670	3	5
10588	670	4	7
10589	670	5	0
10590	670	6	5
10591	670	7	6
10592	670	8	0
10593	670	9	0
10594	670	10	7
10595	670	11	0
10596	670	12	5
10597	670	13	5
10598	670	14	5
10599	670	15	5
10600	670	16	7
10601	670	17	4
10602	670	18	8
10603	692	1	6
10604	692	2	3
10605	692	3	5
10606	692	4	4
10607	692	5	6
10608	692	6	4
10609	692	7	4
10610	692	8	4
10611	692	9	0
10612	692	10	5
10613	692	11	3
10614	692	12	4
10615	692	13	4
10616	692	14	4
10617	692	15	4
10618	692	16	5
10619	692	17	4
10620	692	18	4
10621	748	1	5
10622	748	2	4
10623	748	3	5
10624	748	4	3
10625	748	5	5
10626	748	6	7
10627	748	7	4
10628	748	8	4
10629	748	9	4
10630	748	10	5
10631	748	11	4
10632	748	12	5
10633	748	13	5
10634	748	14	3
10635	748	15	4
10636	748	16	5
10637	748	17	4
10638	748	18	5
10639	732	1	5
10640	732	2	3
10641	732	3	5
10642	732	4	5
10643	732	5	6
10644	732	6	4
10645	732	7	2
10646	732	8	6
10647	732	9	4
10648	732	10	6
10649	732	11	4
10650	732	12	4
10651	732	13	4
10652	732	14	4
10653	732	15	4
10654	732	16	5
10655	732	17	4
10656	732	18	4
10657	725	1	6
10658	725	2	3
10659	725	3	6
10660	725	4	6
10661	725	5	6
10662	725	6	0
10663	725	7	4
10664	725	8	5
10665	725	9	4
10666	725	10	6
10667	725	11	4
10668	725	12	0
10669	725	13	5
10670	725	14	0
10671	725	15	6
10672	725	16	0
10673	725	17	0
10674	725	18	5
10675	703	1	6
10676	703	2	0
10677	703	3	5
10678	703	4	5
10679	703	5	7
10680	703	6	5
10681	703	7	6
10682	703	8	5
10683	703	9	5
10684	703	10	6
10685	703	11	5
10686	703	12	4
10687	703	13	4
10688	703	14	5
10689	703	15	6
10690	703	16	5
10691	703	17	4
10692	703	18	5
10693	736	1	5
10694	736	2	4
10695	736	3	6
10696	736	4	5
10697	736	5	5
10698	736	6	5
10699	736	7	4
10700	736	8	4
10701	736	9	4
10702	736	10	4
10703	736	11	3
10704	736	12	4
10705	736	13	5
10706	736	14	4
10707	736	15	7
10708	736	16	6
10709	736	17	4
10710	736	18	6
10711	740	1	0
10712	740	2	5
10713	740	3	0
10714	740	4	0
10715	740	5	7
10716	740	6	5
10717	740	7	5
10718	740	8	0
10719	740	9	3
10720	740	10	4
10721	740	11	4
10722	740	12	6
10723	740	13	4
10724	740	14	4
10725	740	15	6
10726	740	16	6
10727	740	17	5
10728	740	18	6
10729	723	1	0
10730	723	2	4
10731	723	3	6
10732	723	4	7
10733	723	5	7
10734	723	6	7
10735	723	7	4
10736	723	8	6
10737	723	9	0
10738	723	10	0
10739	723	11	4
10740	723	12	5
10741	723	13	6
10742	723	14	5
10743	723	15	6
10744	723	16	7
10745	723	17	5
10746	723	18	7
10747	745	1	7
10748	745	2	3
10749	745	3	5
10750	745	4	5
10751	745	5	5
10752	745	6	3
10753	745	7	3
10754	745	8	5
10755	745	9	0
10756	745	10	6
10757	745	11	4
10758	745	12	3
10759	745	13	6
10760	745	14	4
11703	786	3	5
10761	745	15	4
10762	745	16	4
10763	745	17	5
10764	745	18	5
10765	695	1	7
10766	695	2	3
10767	695	3	5
10768	695	4	5
10769	695	5	5
10770	695	6	3
10771	695	7	3
10772	695	8	5
10773	695	9	0
10774	695	10	6
10775	695	11	4
10776	695	12	3
10777	695	13	6
10778	695	14	4
10779	695	15	4
10780	695	16	4
10781	695	17	5
10782	695	18	5
10783	674	1	0
10784	674	2	4
10785	674	3	6
10786	674	4	7
10787	674	5	7
10788	674	6	7
10789	674	7	4
10790	674	8	6
10791	674	9	0
10792	674	10	0
10793	674	11	4
10794	674	12	5
10795	674	13	6
10796	674	14	5
10797	674	15	6
10798	674	16	7
10799	674	17	5
10800	674	18	7
10801	693	1	0
10802	693	2	5
10803	693	3	0
10804	693	4	0
10805	693	5	7
10806	693	6	5
10807	693	7	5
10808	693	8	0
10809	693	9	3
10810	693	10	4
10811	693	11	4
10812	693	12	6
10813	693	13	4
10814	693	14	4
10815	693	15	6
10816	693	16	6
10817	693	17	5
10818	693	18	6
10819	672	1	6
10820	672	2	0
10821	672	3	5
10822	672	4	5
10823	672	5	7
10824	672	6	5
10825	672	7	6
10826	672	8	5
10827	672	9	5
10828	672	10	6
10829	672	11	5
10830	672	12	4
10831	672	13	4
10832	672	14	5
10833	672	15	6
10834	672	16	5
10835	672	17	4
10836	672	18	5
10837	686	1	5
10838	686	2	3
10839	686	3	5
10840	686	4	5
10841	686	5	6
10842	686	6	4
10843	686	7	2
10844	686	8	6
10845	686	9	4
10846	686	10	6
10847	686	11	4
10848	686	12	4
10849	686	13	4
10850	686	14	4
10851	686	15	4
10852	686	16	5
10853	686	17	4
10854	686	18	4
10855	714	1	6
10856	714	2	6
10857	714	3	5
10858	714	4	0
10859	714	5	0
10860	714	6	7
10861	714	7	6
10862	714	8	6
10863	714	9	5
10864	714	10	0
10865	714	11	5
10866	714	12	0
10867	714	13	0
10868	714	14	3
10869	714	15	5
10870	714	16	0
10871	714	17	6
10872	714	18	0
10873	717	1	6
10874	717	2	5
10875	717	3	7
10876	717	4	0
10877	717	5	6
10878	717	6	6
10879	717	7	4
10880	717	8	0
10881	717	9	4
10882	717	10	6
10883	717	11	3
10884	717	12	5
10885	717	13	5
10886	717	14	4
10887	717	15	6
10888	717	16	7
10889	717	17	5
10890	717	18	6
10891	712	1	9
10892	712	2	6
10893	712	3	5
10894	712	4	8
10895	712	5	6
10896	712	6	6
10897	712	7	5
10898	712	8	0
10899	712	9	0
10900	712	10	5
10901	712	11	4
10902	712	12	6
10903	712	13	6
10904	712	14	5
10905	712	15	5
10906	712	16	0
10907	712	17	0
10908	712	18	0
10909	718	1	0
10910	718	2	5
10911	718	3	5
10912	718	4	5
10913	718	5	6
10914	718	6	6
10915	718	7	7
10916	718	8	0
10917	718	9	5
10918	718	10	4
10919	718	11	5
10920	718	12	5
10921	718	13	7
10922	718	14	3
10923	718	15	5
10924	718	16	9
10925	718	17	5
10926	718	18	5
10927	746	1	5
10928	746	2	3
10929	746	3	5
10930	746	4	0
10931	746	5	5
10932	746	6	0
10933	746	7	4
10934	746	8	4
10935	746	9	4
10936	746	10	6
10937	746	11	7
10938	746	12	4
10939	746	13	6
10940	746	14	3
10941	746	15	6
10942	746	16	0
10943	746	17	5
10944	746	18	5
10945	710	1	7
10946	710	2	5
10947	710	3	0
10948	710	4	5
10949	710	5	0
10950	710	6	0
10951	710	7	4
10952	710	8	7
10953	710	9	5
10954	710	10	0
10955	710	11	5
10956	710	12	0
10957	710	13	0
10958	710	14	0
10959	710	15	0
10960	710	16	0
10961	710	17	0
10962	710	18	0
10963	676	1	9
10964	676	2	6
10965	676	3	5
10966	676	4	8
10967	676	5	6
10968	676	6	6
10969	676	7	5
10970	676	8	0
10971	676	9	0
10972	676	10	5
10973	676	11	4
10974	676	12	6
10975	676	13	6
10976	676	14	5
10977	676	15	5
10978	676	16	0
10979	676	17	0
10980	676	18	0
10981	678	1	6
10982	678	2	5
10983	678	3	7
10984	678	4	0
10985	678	5	6
10986	678	6	6
10987	678	7	4
10988	678	8	0
10989	678	9	4
10990	678	10	6
10991	678	11	3
10992	678	12	5
10993	678	13	5
10994	678	14	4
10995	678	15	6
10996	678	16	7
10997	678	17	5
10998	678	18	6
10999	698	1	6
11000	698	2	6
11001	698	3	5
11002	698	4	0
11003	698	5	0
11004	698	6	7
11005	698	7	6
11006	698	8	6
11007	698	9	5
11008	698	10	0
11009	698	11	5
11010	698	12	0
11011	698	13	0
11012	698	14	3
11013	698	15	5
11014	698	16	0
11015	698	17	6
11016	698	18	0
11017	729	1	8
11018	729	2	3
11019	729	3	0
11020	729	4	4
11021	729	5	4
11022	729	6	7
11023	729	7	4
11024	729	8	6
11025	729	9	3
11026	729	10	5
11027	729	11	4
11028	729	12	4
11029	729	13	6
11030	729	14	4
11031	729	15	5
11032	729	16	6
11033	729	17	6
11034	729	18	7
11035	727	1	7
11036	727	2	4
11037	727	3	7
11038	727	4	5
11039	727	5	6
11040	727	6	0
11041	727	7	0
11042	727	8	4
11043	727	9	4
11044	727	10	3
11045	727	11	0
11046	727	12	5
11047	727	13	6
11048	727	14	3
11049	727	15	4
11050	727	16	5
11051	727	17	5
12350	820	2	4
11052	727	18	5
11053	719	1	0
11054	719	2	3
11055	719	3	5
11056	719	4	4
11057	719	5	6
11058	719	6	5
11059	719	7	5
11060	719	8	5
11061	719	9	4
11062	719	10	0
11063	719	11	3
11064	719	12	6
11065	719	13	7
11066	719	14	5
11067	719	15	6
11068	719	16	5
11069	719	17	5
11070	719	18	6
11071	735	1	7
11072	735	2	4
11073	735	3	5
11074	735	4	7
11075	735	5	6
11076	735	6	5
11077	735	7	0
11078	735	8	0
11079	735	9	4
11080	735	10	4
11081	735	11	5
11082	735	12	0
11083	735	13	5
11084	735	14	5
11085	735	15	7
11086	735	16	0
11087	735	17	4
11088	735	18	0
11089	708	1	6
11090	708	2	0
11091	708	3	5
11092	708	4	5
11093	708	5	0
11094	708	6	6
11095	708	7	5
11096	708	8	5
11097	708	9	4
11098	708	10	5
11099	708	11	5
11100	708	12	5
11101	708	13	5
11102	708	14	3
11103	708	15	5
11104	708	16	5
11105	708	17	6
11106	708	18	6
11107	733	1	5
11108	733	2	3
11109	733	3	5
11110	733	4	3
11111	733	5	6
11112	733	6	5
11113	733	7	3
11114	733	8	4
11115	733	9	2
11116	733	10	0
11117	733	11	4
11118	733	12	4
11119	733	13	5
11120	733	14	4
11121	733	15	6
11122	733	16	7
11123	733	17	5
11124	733	18	0
11125	688	1	7
11126	688	2	4
11127	688	3	5
11128	688	4	7
11129	688	5	6
11130	688	6	5
11131	688	7	0
11132	688	8	0
11133	688	9	4
11134	688	10	4
11135	688	11	5
11136	688	12	0
11137	688	13	5
11138	688	14	5
11139	688	15	7
11140	688	16	0
11141	688	17	4
11142	688	18	0
11143	682	1	7
11144	682	2	4
11145	682	3	7
11146	682	4	5
11147	682	5	6
11148	682	6	0
11149	682	7	0
11150	682	8	4
11151	682	9	4
11152	682	10	3
11153	682	11	0
11154	682	12	5
11155	682	13	6
11156	682	14	3
11157	682	15	4
11158	682	16	5
11159	682	17	5
11160	682	18	5
11161	680	1	8
11162	680	2	3
11163	680	3	0
11164	680	4	4
11165	680	5	4
11166	680	6	7
11167	680	7	4
11168	680	8	6
11169	680	9	3
11170	680	10	5
11171	680	11	4
11172	680	12	4
11173	680	13	6
11174	680	14	4
11175	680	15	5
11176	680	16	6
11177	680	17	6
11178	680	18	7
11179	731	1	6
11180	731	2	6
11181	731	3	5
11182	731	4	5
11183	731	5	0
11184	731	6	7
11185	731	7	6
11186	731	8	4
11187	731	9	3
11188	731	10	4
11189	731	11	4
11190	731	12	5
11191	731	13	5
11192	731	14	3
11193	731	15	4
11194	731	16	6
11195	731	17	4
11196	731	18	3
11197	734	1	6
11198	734	2	5
11199	734	3	5
11200	734	4	5
11201	734	5	5
11202	734	6	5
11203	734	7	4
11204	734	8	5
11205	734	9	4
11206	734	10	5
11207	734	11	3
11208	734	12	3
11209	734	13	5
11210	734	14	4
11211	734	15	6
11212	734	16	7
11213	734	17	0
11214	734	18	6
11215	730	1	7
11216	730	2	4
11217	730	3	7
11218	730	4	6
11219	730	5	7
11220	730	6	0
11221	730	7	4
11222	730	8	5
11223	730	9	4
11224	730	10	6
11225	730	11	2
11226	730	12	3
11227	730	13	5
11228	730	14	5
11229	730	15	0
11230	730	16	6
11231	730	17	5
11232	730	18	0
11233	704	1	8
11234	704	2	4
11235	704	3	6
11236	704	4	5
11237	704	5	7
11238	704	6	5
11239	704	7	5
11240	704	8	4
11241	704	9	5
11242	704	10	9
11243	704	11	5
11244	704	12	6
11245	704	13	6
11246	704	14	5
11247	704	15	5
11248	704	16	0
11249	704	17	6
11250	704	18	0
11251	711	1	5
11252	711	2	3
11253	711	3	6
11254	711	4	7
11255	711	5	6
11256	711	6	5
11257	711	7	4
11258	711	8	7
11259	711	9	4
11260	711	10	5
11261	711	11	4
11262	711	12	5
11263	711	13	4
11264	711	14	3
11265	711	15	4
11266	711	16	6
11267	711	17	6
11268	711	18	5
11269	673	1	8
11270	673	2	4
11271	673	3	6
11272	673	4	5
11273	673	5	7
11274	673	6	5
11275	673	7	5
11276	673	8	4
11277	673	9	5
11278	673	10	9
11279	673	11	5
11280	673	12	6
11281	673	13	6
11282	673	14	5
11283	673	15	5
11284	673	16	0
11285	673	17	6
11286	673	18	0
11287	684	1	6
11288	684	2	6
11289	684	3	5
11290	684	4	5
11291	684	5	0
11292	684	6	7
11293	684	7	6
11294	684	8	4
11295	684	9	3
11296	684	10	4
11297	684	11	4
11298	684	12	5
11299	684	13	5
11300	684	14	3
11301	684	15	4
11302	684	16	6
11303	684	17	4
11304	684	18	3
11305	683	1	7
11306	683	2	4
11307	683	3	7
11308	683	4	6
11309	683	5	7
11310	683	6	0
11311	683	7	4
11312	683	8	5
11313	683	9	4
11314	683	10	6
11315	683	11	2
11316	683	12	3
11317	683	13	5
11318	683	14	5
11319	683	15	0
11320	683	16	6
11321	683	17	5
11322	683	18	0
11323	689	1	6
11324	689	2	5
11325	689	3	5
11326	689	4	5
11327	689	5	5
11328	689	6	5
11329	689	7	4
11330	689	8	5
11331	689	9	4
11332	689	10	5
11333	689	11	3
11334	689	12	3
11335	689	13	5
11336	689	14	4
11337	689	15	6
11338	689	16	7
11339	689	17	0
11340	689	18	6
11341	749	1	5
11342	749	2	3
11704	786	4	4
11343	749	3	6
11344	749	4	7
11345	749	5	6
11346	749	6	5
11347	749	7	4
11348	749	8	7
11349	749	9	4
11350	749	10	5
11351	749	11	4
11352	749	12	5
11353	749	13	4
11354	749	14	3
11355	749	15	4
11356	749	16	6
11357	749	17	6
11358	749	18	5
11359	721	1	0
11360	721	2	5
11361	721	3	4
11362	721	4	5
11363	721	5	0
11364	721	6	7
11365	721	7	5
11366	721	8	5
11367	721	9	6
11368	721	10	0
11369	721	11	4
11370	721	12	5
11371	721	13	6
11372	721	14	3
11373	721	15	6
11374	721	16	6
11375	721	17	5
11376	721	18	0
11377	738	1	5
11378	738	2	4
11379	738	3	5
11380	738	4	5
11381	738	5	8
11382	738	6	0
11383	738	7	4
11384	738	8	5
11385	738	9	3
11386	738	10	5
11387	738	11	3
11388	738	12	4
11389	738	13	0
11390	738	14	4
11391	738	15	0
11392	738	16	6
11393	738	17	5
11394	738	18	0
11395	724	1	0
11396	724	2	5
11397	724	3	7
11398	724	4	0
11399	724	5	7
11400	724	6	7
11401	724	7	0
11402	724	8	0
11403	724	9	0
11404	724	10	5
11405	724	11	5
11406	724	12	5
11407	724	13	7
11408	724	14	4
11409	724	15	5
11410	724	16	6
11411	724	17	0
11412	724	18	0
11413	726	1	5
11414	726	2	3
11415	726	3	5
11416	726	4	4
11417	726	5	6
11418	726	6	6
11419	726	7	3
11420	726	8	5
11421	726	9	4
11422	726	10	6
11423	726	11	4
11424	726	12	6
11425	726	13	5
11426	726	14	4
11427	726	15	5
11428	726	16	6
11429	726	17	5
11430	726	18	6
11431	728	1	5
11432	728	2	4
11433	728	3	4
11434	728	4	5
11435	728	5	6
11436	728	6	6
11437	728	7	4
11438	728	8	5
11439	728	9	5
11440	728	10	7
11441	728	11	3
11442	728	12	4
11443	728	13	5
11444	728	14	3
11445	728	15	4
11446	728	16	6
11447	728	17	5
11448	728	18	5
11449	707	1	0
11450	707	2	5
11451	707	3	0
11452	707	4	5
11453	707	5	7
11454	707	6	6
11455	707	7	6
11456	707	8	0
11457	707	9	6
11458	707	10	7
11459	707	11	4
11460	707	12	7
11461	707	13	6
11462	707	14	4
11463	707	15	5
11464	707	16	7
11465	707	17	6
11466	707	18	8
11467	679	1	5
11468	679	2	3
11469	679	3	5
11470	679	4	4
11471	679	5	6
11472	679	6	6
11473	679	7	3
11474	679	8	5
11475	679	9	4
11476	679	10	6
11477	679	11	4
11478	679	12	6
11479	679	13	5
11480	679	14	4
11481	679	15	5
11482	679	16	6
11483	679	17	5
11484	679	18	6
11485	681	1	5
11486	681	2	4
11487	681	3	4
11488	681	4	5
11489	681	5	6
11490	681	6	6
11491	681	7	4
11492	681	8	5
11493	681	9	5
11494	681	10	7
11495	681	11	3
11496	681	12	4
11497	681	13	5
11498	681	14	3
11499	681	15	4
11500	681	16	6
11501	681	17	5
11502	681	18	5
11503	691	1	5
11504	691	2	4
11505	691	3	5
11506	691	4	5
11507	691	5	8
11508	691	6	0
11509	691	7	4
11510	691	8	5
11511	691	9	3
11512	691	10	5
11513	691	11	3
11514	691	12	4
11515	691	13	0
11516	691	14	4
11517	691	15	0
11518	691	16	6
11519	691	17	5
11520	691	18	0
11521	697	1	6
11522	697	2	5
11523	697	3	6
11524	697	4	4
11525	697	5	6
11526	697	6	7
11527	697	7	4
11528	697	8	7
11529	697	9	4
11530	697	10	6
11531	697	11	2
11532	697	12	5
11533	697	13	7
11534	697	14	5
11535	697	15	6
11536	697	16	8
11537	697	17	6
11538	697	18	8
11539	709	1	7
11540	709	2	4
11541	709	3	4
11542	709	4	5
11543	709	5	5
11544	709	6	6
11545	709	7	3
11546	709	8	6
11547	709	9	5
11548	709	10	4
11549	709	11	3
11550	709	12	4
11551	709	13	6
11552	709	14	4
11553	709	15	6
11554	709	16	6
11555	709	17	6
11556	709	18	7
11557	715	1	6
11558	715	2	5
11559	715	3	6
11560	715	4	4
11561	715	5	6
11562	715	6	7
11563	715	7	4
11564	715	8	7
11565	715	9	4
11566	715	10	6
11567	715	11	2
11568	715	12	5
11569	715	13	7
11570	715	14	5
11571	715	15	6
11572	715	16	8
11573	715	17	6
11574	715	18	8
11575	750	1	0
11576	750	2	4
11577	750	3	6
11578	750	4	5
11579	750	5	0
11580	750	6	0
11581	750	7	3
11582	750	8	4
11583	750	9	5
11584	750	10	0
11585	750	11	3
11586	750	12	5
11587	750	13	5
11588	750	14	3
11589	750	15	5
11590	750	16	0
11591	750	17	6
11592	750	18	9
11593	677	1	0
11594	677	2	5
11595	677	3	5
11596	677	4	5
11597	677	5	6
11598	677	6	6
11599	677	7	7
11600	677	8	0
11601	677	9	5
11602	677	10	4
11603	677	11	5
11604	677	12	5
11605	677	13	7
11606	677	14	3
11607	677	15	5
11608	677	16	9
11609	677	17	5
11610	677	18	5
11611	685	1	5
11612	685	2	3
11613	685	3	5
11614	685	4	3
11615	685	5	6
11616	685	6	5
11617	685	7	3
11618	685	8	4
11619	685	9	2
11620	685	10	0
11621	685	11	4
11622	685	12	4
11623	685	13	5
11624	685	14	4
11625	685	15	6
11626	685	16	7
11627	685	17	5
11628	685	18	0
11629	706	1	6
11630	706	2	3
11631	706	3	6
11632	706	4	5
11633	706	5	6
13501	926	1	4
11634	706	6	7
11635	706	7	5
11636	706	8	7
11637	706	9	4
11638	706	10	5
11639	706	11	4
11640	706	12	5
11641	706	13	4
11642	706	14	4
11643	706	15	0
11644	706	16	6
11645	706	17	6
11646	706	18	5
11647	744	1	6
11648	744	2	4
11649	744	3	5
11650	744	4	6
11651	744	5	5
11652	744	6	6
11653	744	7	3
11654	744	8	5
11655	744	9	5
11656	744	10	6
11657	744	11	6
11658	744	12	4
11659	744	13	4
11660	744	14	4
11661	744	15	3
11662	744	16	5
11663	744	17	0
11664	744	18	6
11665	720	1	5
11666	720	2	4
11667	720	3	4
11668	720	4	5
11669	720	5	7
11670	720	6	6
11671	720	7	3
11672	720	8	5
11673	720	9	0
11674	720	10	5
11675	720	11	3
11676	720	12	6
11677	720	13	0
11678	720	14	5
11679	720	15	5
11680	720	16	6
11681	720	17	5
11682	720	18	6
11683	747	1	6
11684	747	2	6
11685	747	3	5
11686	747	4	6
11687	747	5	7
11688	747	6	5
11689	747	7	3
11690	747	8	4
11691	747	9	5
11692	747	10	7
11693	747	11	4
11694	747	12	5
11695	747	13	6
11696	747	14	5
11697	747	15	0
11698	747	16	5
11699	747	17	7
11700	747	18	5
11705	786	5	7
11706	786	6	5
11707	786	7	4
11708	786	8	0
11709	786	9	0
11710	786	10	5
11711	786	11	4
11712	786	12	5
11713	786	13	4
11714	786	14	0
11715	786	15	6
11716	786	16	0
11717	786	17	4
11718	786	18	6
11719	780	1	0
11720	780	2	4
11721	780	3	6
11722	780	4	0
11723	780	5	7
11724	780	6	0
11725	780	7	0
11726	780	8	0
11727	780	9	0
11728	780	10	5
11729	780	11	4
11730	780	12	5
11731	780	13	0
11732	780	14	3
11733	780	15	6
11734	780	16	0
11735	780	17	0
11736	780	18	6
11737	758	1	6
11738	758	2	0
11739	758	3	0
11740	758	4	0
11741	758	5	6
11742	758	6	5
11743	758	7	3
11744	758	8	0
11745	758	9	5
11746	758	10	6
11747	758	11	5
11748	758	12	6
11749	758	13	5
11750	758	14	4
11751	758	15	0
11752	758	16	4
11753	758	17	5
11754	758	18	6
11755	759	1	0
11756	759	2	5
11757	759	3	7
11758	759	4	0
11759	759	5	7
11760	759	6	6
11761	759	7	0
11762	759	8	5
11763	759	9	0
11764	759	10	5
11765	759	11	5
11766	759	12	6
11767	759	13	6
11768	759	14	5
11769	759	15	5
11770	759	16	7
11771	759	17	0
11772	759	18	0
11773	768	1	6
11774	768	2	4
11775	768	3	5
11776	768	4	5
11777	768	5	6
11778	768	6	5
11779	768	7	2
11780	768	8	5
11781	768	9	5
11782	768	10	4
11783	768	11	4
12351	820	3	5
11784	768	12	5
11785	768	13	0
11786	768	14	3
11787	768	15	5
11788	768	16	5
11789	768	17	4
11790	768	18	4
11791	769	1	5
11792	769	2	3
11793	769	3	0
11794	769	4	4
11795	769	5	0
11796	769	6	4
11797	769	7	5
11798	769	8	5
11799	769	9	4
11800	769	10	0
11801	769	11	3
11802	769	12	0
11803	769	13	5
11804	769	14	4
11805	769	15	5
11806	769	16	6
11807	769	17	5
11808	769	18	6
11809	766	1	5
11810	766	2	3
11811	766	3	6
11812	766	4	3
11813	766	5	0
11814	766	6	4
11815	766	7	4
11816	766	8	0
11817	766	9	3
11818	766	10	4
11819	766	11	4
11820	766	12	4
11821	766	13	4
11822	766	14	3
11823	766	15	5
11824	766	16	5
11825	766	17	0
11826	766	18	4
11827	767	1	0
11828	767	2	4
11829	767	3	5
11830	767	4	0
11831	767	5	5
11832	767	6	0
11833	767	7	0
11834	767	8	4
11835	767	9	0
11836	767	10	4
11837	767	11	2
11838	767	12	5
11839	767	13	0
11840	767	14	3
11841	767	15	4
11842	767	16	0
11843	767	17	4
11844	767	18	4
11845	756	1	0
11846	756	2	4
11847	756	3	0
11848	756	4	4
11849	756	5	0
11850	756	6	6
11851	756	7	4
11852	756	8	5
11853	756	9	3
11854	756	10	5
11855	756	11	4
11856	756	12	5
11857	756	13	5
11858	756	14	3
11859	756	15	6
11860	756	16	0
11861	756	17	5
11862	756	18	0
11863	757	1	5
11864	757	2	0
11865	757	3	0
11866	757	4	5
11867	757	5	5
11868	757	6	6
11869	757	7	3
11870	757	8	4
11871	757	9	0
11872	757	10	0
11873	757	11	0
11874	757	12	0
11875	757	13	4
11876	757	14	0
11877	757	15	6
11878	757	16	6
11879	757	17	0
11880	757	18	4
11881	770	1	5
11882	770	2	3
11883	770	3	5
11884	770	4	0
11885	770	5	5
11886	770	6	6
11887	770	7	3
11888	770	8	4
11889	770	9	4
11890	770	10	0
11891	770	11	2
11892	770	12	4
11893	770	13	5
11894	770	14	3
11895	770	15	0
11896	770	16	5
11897	770	17	0
11898	770	18	4
11899	771	1	7
11900	771	2	0
11901	771	3	0
11902	771	4	4
11903	771	5	6
11904	771	6	6
11905	771	7	4
11906	771	8	0
11907	771	9	4
11908	771	10	4
11909	771	11	2
11910	771	12	4
11911	771	13	5
11912	771	14	0
11913	771	15	5
11914	771	16	0
11915	771	17	0
11916	771	18	5
11917	781	1	6
11918	781	2	3
11919	781	3	4
11920	781	4	4
11921	781	5	5
11922	781	6	3
11923	781	7	4
11924	781	8	3
11925	781	9	4
11926	781	10	4
11927	781	11	3
11928	781	12	4
11929	781	13	4
11930	781	14	5
11931	781	15	4
11932	781	16	5
11933	781	17	5
11934	781	18	6
11935	782	1	0
11936	782	2	3
11937	782	3	5
11938	782	4	4
11939	782	5	5
11940	782	6	4
11941	782	7	3
11942	782	8	0
11943	782	9	3
11944	782	10	5
11945	782	11	1
11946	782	12	3
11947	782	13	4
11948	782	14	3
11949	782	15	0
11950	782	16	5
11951	782	17	4
11952	782	18	5
11953	755	1	7
11954	755	2	0
11955	755	3	7
11956	755	4	6
11957	755	5	8
11958	755	6	6
11959	755	7	0
11960	755	8	6
11961	755	9	6
11962	755	10	6
11963	755	11	4
11964	755	12	6
11965	755	13	0
11966	755	14	4
11967	755	15	0
11968	755	16	7
11969	755	17	6
11970	755	18	0
11971	761	1	8
11972	761	2	3
11973	761	3	7
11974	761	4	6
11975	761	5	7
11976	761	6	0
11977	761	7	6
11978	761	8	0
11979	761	9	6
11980	761	10	5
11981	761	11	4
11982	761	12	6
11983	761	13	6
11984	761	14	5
11985	761	15	0
11986	761	16	7
11987	761	17	0
11988	761	18	7
11989	785	1	0
11990	785	2	4
11991	785	3	5
11992	785	4	0
11993	785	5	5
11994	785	6	5
11995	785	7	3
11996	785	8	4
11997	785	9	4
11998	785	10	0
11999	785	11	3
12000	785	12	4
12001	785	13	5
12002	785	14	3
12003	785	15	5
12004	785	16	5
12005	785	17	0
12006	785	18	4
12007	787	1	5
12008	787	2	3
12009	787	3	5
12010	787	4	0
12011	787	5	0
12012	787	6	5
12013	787	7	0
12014	787	8	0
12015	787	9	4
12016	787	10	5
12017	787	11	0
12018	787	12	0
12019	787	13	0
12020	787	14	0
12021	787	15	4
12022	787	16	0
12023	787	17	4
12024	787	18	0
12025	788	1	0
12026	788	2	0
12027	788	3	0
12028	788	4	5
12029	788	5	0
12030	788	6	5
12031	788	7	0
12032	788	8	5
12033	788	9	4
12034	788	10	0
12035	788	11	0
12036	788	12	4
12037	788	13	0
12038	788	14	0
12039	788	15	6
12040	788	16	0
12041	788	17	4
12042	788	18	4
12043	789	1	6
12044	789	2	0
12045	789	3	5
12046	789	4	0
12047	789	5	5
12048	789	6	5
12049	789	7	4
12050	789	8	4
12051	789	9	5
12052	789	10	5
12053	789	11	4
12054	789	12	0
12055	789	13	5
12056	789	14	3
12057	789	15	5
12058	789	16	5
12059	789	17	5
12060	789	18	0
12062	764	2	3
12063	764	3	5
12064	764	4	4
12065	764	5	5
12066	764	6	5
12067	764	7	2
12068	764	8	4
12069	764	9	3
12070	764	10	0
12071	764	11	5
12072	764	12	4
12073	764	13	4
12074	764	14	0
12352	820	4	5
12710	849	2	4
12353	820	5	6
12077	764	17	5
12078	764	18	6
12354	820	6	5
12079	765	1	7
12080	765	2	0
12081	765	3	5
12082	765	4	4
12083	765	5	5
12084	765	6	4
12085	765	7	3
12086	765	8	4
12087	765	9	3
12088	765	10	5
12089	765	11	0
12090	765	12	4
12091	765	13	0
12092	765	14	3
12093	765	15	4
12094	765	16	6
12095	765	17	4
12096	765	18	4
12097	776	1	0
12098	776	2	4
12099	776	3	6
12100	776	4	0
12101	776	5	5
12102	776	6	6
12103	776	7	5
12104	776	8	4
12105	776	9	3
12106	776	10	5
12107	776	11	4
12108	776	12	5
12109	776	13	6
12110	776	14	4
12111	776	15	5
12112	776	16	0
12113	776	17	4
12114	776	18	0
12115	777	1	0
12116	777	2	3
12117	777	3	5
12118	777	4	5
12119	777	5	0
12120	777	6	6
12121	777	7	4
12122	777	8	4
12123	777	9	4
12124	777	10	0
12125	777	11	3
12126	777	12	5
12127	777	13	5
12128	777	14	0
12129	777	15	0
12130	777	16	6
12131	777	17	0
12132	777	18	0
12133	763	1	0
12134	763	2	4
12135	763	3	5
12136	763	4	6
12137	763	5	0
12138	763	6	6
12139	763	7	4
12140	763	8	4
12141	763	9	3
12142	763	10	5
12143	763	11	0
12144	763	12	0
12145	763	13	4
12146	763	14	3
12147	763	15	0
12148	763	16	0
12149	763	17	0
12150	763	18	4
12151	762	1	5
12152	762	2	3
12153	762	3	5
12154	762	4	4
12155	762	5	5
12156	762	6	5
12157	762	7	0
12158	762	8	4
12159	762	9	3
12160	762	10	4
12161	762	11	3
12162	762	12	5
12163	762	13	5
12164	762	14	0
12165	762	15	4
12166	762	16	4
12167	762	17	0
12168	762	18	0
12169	772	1	0
12170	772	2	5
12171	772	3	0
12172	772	4	0
12173	772	5	0
12174	772	6	5
12175	772	7	0
12176	772	8	4
12177	772	9	3
12178	772	10	6
12179	772	11	3
12180	772	12	5
12181	772	13	6
12182	772	14	0
12183	772	15	6
12184	772	16	0
12185	772	17	6
12186	772	18	5
12187	773	1	7
12188	773	2	5
12189	773	3	0
12190	773	4	6
12191	773	5	0
12192	773	6	5
12193	773	7	3
12194	773	8	5
12195	773	9	4
12196	773	10	0
12197	773	11	0
12198	773	12	5
12199	773	13	5
12200	773	14	5
12201	773	15	0
12202	773	16	0
12203	773	17	0
12204	773	18	5
12205	774	1	6
12206	774	2	3
12207	774	3	0
12208	774	4	4
12209	774	5	0
12210	774	6	6
12211	774	7	3
12212	774	8	5
12213	774	9	3
12214	774	10	0
12215	774	11	4
12216	774	12	6
12217	774	13	5
12218	774	14	4
12219	774	15	4
12220	774	16	5
12221	774	17	4
12222	774	18	6
12223	775	1	6
12224	775	2	4
12225	775	3	4
12226	775	4	0
12227	775	5	5
12228	775	6	5
12229	775	7	4
12230	775	8	5
12231	775	9	3
12232	775	10	3
12233	775	11	3
12234	775	12	0
12235	775	13	5
12236	775	14	0
12237	775	15	0
12238	775	16	6
12239	775	17	5
12240	775	18	0
12241	778	1	6
12242	778	2	4
12243	778	3	5
12244	778	4	5
12245	778	5	5
12246	778	6	5
12247	778	7	3
12248	778	8	4
12249	778	9	4
12250	778	10	0
12251	778	11	3
12252	778	12	6
12253	778	13	4
12254	778	14	4
12255	778	15	5
12256	778	16	6
12257	778	17	4
12258	778	18	5
12259	779	1	7
12260	779	2	4
12261	779	3	5
12262	779	4	6
12263	779	5	7
12264	779	6	5
12265	779	7	4
12266	779	8	4
12267	779	9	3
12268	779	10	5
12269	779	11	2
12270	779	12	6
12271	779	13	5
12272	779	14	5
12273	779	15	0
12274	779	16	0
12275	779	17	0
12276	779	18	4
12277	751	1	6
12278	751	2	4
12279	751	3	5
12280	751	4	0
12281	751	5	6
12282	751	6	5
12283	751	7	4
12284	751	8	0
12285	751	9	5
12286	751	10	0
12287	751	11	0
12288	751	12	5
12289	751	13	0
12290	751	14	4
12291	751	15	4
12292	751	16	9
12293	751	17	0
12294	751	18	0
12295	752	1	0
12296	752	2	4
12297	752	3	6
12298	752	4	0
12299	752	5	0
12300	752	6	0
12301	752	7	0
12302	752	8	5
12303	752	9	5
12304	752	10	0
12305	752	11	0
12306	752	12	0
12307	752	13	6
12308	752	14	4
12309	752	15	0
12310	752	16	8
12311	752	17	0
12312	752	18	6
12313	753	1	0
12314	753	2	4
12315	753	3	5
12316	753	4	0
12317	753	5	0
12318	753	6	0
12319	753	7	5
12320	753	8	0
12321	753	9	4
12322	753	10	4
12323	753	11	5
12324	753	12	4
12325	753	13	5
12326	753	14	3
12327	753	15	5
12328	753	16	9
12329	753	17	4
12330	753	18	6
12331	754	1	7
12332	754	2	4
12333	754	3	7
12334	754	4	6
12335	754	5	0
12336	754	6	6
12337	754	7	4
12338	754	8	5
12339	754	9	4
12340	754	10	0
12341	754	11	5
12342	754	12	6
12343	754	13	0
12344	754	14	4
12345	754	15	0
12346	754	16	0
12347	754	17	6
12348	754	18	6
12061	764	1	5
12075	764	15	4
12076	764	16	6
12355	820	7	3
12356	820	8	5
12357	820	9	4
12358	820	10	5
12359	820	11	4
12360	820	12	5
12361	820	13	4
12362	820	14	2
12363	820	15	5
12364	820	16	5
12365	820	17	5
12366	820	18	5
12367	808	1	5
12368	808	2	3
12369	808	3	4
12370	808	4	4
12371	808	5	6
12372	808	6	4
12373	808	7	4
12374	808	8	3
12375	808	9	3
12376	808	10	4
12377	808	11	4
12378	808	12	3
12379	808	13	4
12380	808	14	3
12381	808	15	5
12382	808	16	5
12383	808	17	3
12384	808	18	4
12385	806	1	5
12386	806	2	3
12387	806	3	5
12388	806	4	4
12389	806	5	5
12390	806	6	5
12391	806	7	4
12392	806	8	5
12393	806	9	3
12394	806	10	4
12395	806	11	4
12396	806	12	4
12397	806	13	4
12398	806	14	3
12399	806	15	4
12400	806	16	5
12401	806	17	4
12402	806	18	4
12403	827	1	5
12404	827	2	3
12405	827	3	5
12406	827	4	5
12407	827	5	6
12408	827	6	5
12409	827	7	3
12410	827	8	3
12411	827	9	3
12412	827	10	4
12413	827	11	5
12414	827	12	5
12415	827	13	6
12416	827	14	3
12417	827	15	4
12418	827	16	4
12419	827	17	4
12420	827	18	4
12421	813	1	5
12422	813	2	3
12423	813	3	5
12424	813	4	4
12425	813	5	4
12426	813	6	4
12427	813	7	3
12428	813	8	4
12429	813	9	4
12430	813	10	5
12431	813	11	3
12432	813	12	3
12433	813	13	4
12434	813	14	2
12435	813	15	3
12436	813	16	5
12437	813	17	4
12438	813	18	3
12439	793	1	5
12440	793	2	3
12441	793	3	4
12442	793	4	3
12443	793	5	5
12444	793	6	3
12445	793	7	2
12446	793	8	4
12447	793	9	4
12448	793	10	4
12449	793	11	2
12450	793	12	5
12451	793	13	5
12452	793	14	4
12453	793	15	4
12454	793	16	5
12455	793	17	4
12456	793	18	5
12457	823	1	4
12458	823	2	3
12459	823	3	5
12460	823	4	5
12461	823	5	9
12462	823	6	4
12463	823	7	5
12464	823	8	4
12465	823	9	3
12466	823	10	6
12467	823	11	3
12468	823	12	4
12469	823	13	6
12470	823	14	5
12471	823	15	5
12472	823	16	5
12473	823	17	5
12474	823	18	6
12475	815	1	5
12476	815	2	3
12477	815	3	4
12478	815	4	5
12479	815	5	4
12480	815	6	5
12481	815	7	3
12482	815	8	4
12483	815	9	3
12484	815	10	4
12485	815	11	4
12486	815	12	4
12487	815	13	3
12488	815	14	4
12489	815	15	5
12490	815	16	5
12491	815	17	4
12492	815	18	4
12493	791	1	5
12494	791	2	3
12495	791	3	4
12496	791	4	4
12497	791	5	4
12498	791	6	5
12499	791	7	3
12500	791	8	4
12501	791	9	3
12502	791	10	4
12503	791	11	3
12504	791	12	4
12505	791	13	4
12506	791	14	3
12507	791	15	4
12508	791	16	5
12509	791	17	5
12510	791	18	4
12511	821	1	8
12512	821	2	6
12513	821	3	5
12514	821	4	5
12515	821	5	4
14437	1013	1	6
12516	821	6	5
12517	821	7	4
12518	821	8	4
12519	821	9	3
12520	821	10	4
12521	821	11	4
12522	821	12	6
12523	821	13	5
12524	821	14	4
12525	821	15	4
12526	821	16	7
12527	821	17	5
12528	821	18	5
12529	829	1	4
12530	829	2	3
12531	829	3	6
12532	829	4	3
12533	829	5	5
12534	829	6	5
12535	829	7	3
12536	829	8	5
12537	829	9	4
12538	829	10	3
12539	829	11	4
12540	829	12	4
12541	829	13	4
12542	829	14	4
12543	829	15	4
12544	829	16	5
12545	829	17	4
12546	829	18	4
12547	795	1	5
12548	795	2	3
12549	795	3	4
12550	795	4	3
12551	795	5	4
12552	795	6	4
12553	795	7	3
12554	795	8	4
12555	795	9	2
12556	795	10	4
12557	795	11	3
12558	795	12	4
12559	795	13	4
12560	795	14	4
12561	795	15	5
12562	795	16	6
12563	795	17	4
12564	795	18	4
12565	796	1	5
12566	796	2	4
12567	796	3	5
12568	796	4	4
12569	796	5	5
12570	796	6	4
12571	796	7	3
12572	796	8	4
12573	796	9	4
12574	796	10	5
12575	796	11	3
12576	796	12	3
12577	796	13	5
12578	796	14	3
12579	796	15	4
12580	796	16	5
12581	796	17	5
12582	796	18	5
12583	832	1	5
12584	832	2	4
12585	832	3	5
12586	832	4	4
12587	832	5	5
12588	832	6	4
12589	832	7	3
12590	832	8	4
12591	832	9	3
12592	832	10	5
12593	832	11	3
12594	832	12	5
12595	832	13	4
12596	832	14	3
12597	832	15	4
12598	832	16	6
12599	832	17	5
12600	832	18	5
12601	811	1	5
12602	811	2	2
12603	811	3	5
12604	811	4	4
12605	811	5	7
12606	811	6	5
12607	811	7	3
12608	811	8	3
12609	811	9	3
12610	811	10	4
12611	811	11	3
12612	811	12	4
12613	811	13	4
12614	811	14	3
12615	811	15	5
12616	811	16	5
12617	811	17	5
12618	811	18	5
12619	801	1	5
12620	801	2	3
12621	801	3	5
12622	801	4	4
12623	801	5	5
12624	801	6	5
12625	801	7	2
12626	801	8	4
12627	801	9	3
12628	801	10	3
12629	801	11	4
12630	801	12	5
12631	801	13	5
12632	801	14	3
12633	801	15	4
12634	801	16	4
12635	801	17	4
12636	801	18	4
12637	810	1	5
12638	810	2	3
12639	810	3	5
12640	810	4	4
12641	810	5	3
12642	810	6	5
12643	810	7	3
12644	810	8	4
12645	810	9	3
12646	810	10	4
12647	810	11	3
12648	810	12	3
12649	810	13	4
12650	810	14	3
12651	810	15	4
12652	810	16	4
12653	810	17	4
12654	810	18	5
12655	799	1	5
12656	799	2	3
12657	799	3	4
12658	799	4	5
12659	799	5	4
12660	799	6	4
12661	799	7	4
12662	799	8	4
12663	799	9	3
12664	799	10	4
12665	799	11	4
12666	799	12	5
12667	799	13	4
12668	799	14	4
12669	799	15	4
12670	799	16	5
12671	799	17	5
12672	799	18	5
12673	825	1	6
12674	825	2	3
12675	825	3	4
12676	825	4	5
12677	825	5	6
12678	825	6	4
12679	825	7	3
12680	825	8	4
12681	825	9	3
12682	825	10	4
12683	825	11	3
12684	825	12	4
12685	825	13	5
12686	825	14	3
12687	825	15	4
12688	825	16	5
12689	825	17	6
12690	825	18	7
12691	804	1	5
12692	804	2	3
12693	804	3	5
12694	804	4	4
12695	804	5	6
12696	804	6	4
12697	804	7	2
12698	804	8	5
12699	804	9	3
12700	804	10	3
12701	804	11	4
12702	804	12	4
12703	804	13	4
12704	804	14	3
12705	804	15	5
12706	804	16	5
12707	804	17	5
12708	804	18	4
12711	849	3	4
12712	849	4	0
12713	849	5	0
12714	849	6	5
12715	849	7	0
12716	849	8	4
12717	849	9	0
12718	849	10	5
12719	849	11	0
12720	849	12	0
12721	849	13	4
12722	849	14	4
12723	849	15	4
12724	849	16	4
12725	849	17	3
12726	849	18	4
12727	848	1	5
12728	848	2	4
12729	848	3	5
12730	848	4	5
12731	848	5	5
12732	848	6	6
12733	848	7	4
12734	848	8	0
12735	848	9	3
12736	848	10	5
12737	848	11	4
12738	848	12	4
12739	848	13	0
12740	848	14	5
12741	848	15	4
12742	848	16	0
12743	848	17	5
12744	848	18	5
12745	873	1	6
12746	873	2	3
12747	873	3	4
12748	873	4	5
12749	873	5	0
12750	873	6	5
12751	873	7	4
12752	873	8	5
12753	873	9	3
12754	873	10	4
12755	873	11	4
12756	873	12	4
12757	873	13	0
12758	873	14	3
12759	873	15	0
12760	873	16	5
12761	873	17	4
12762	873	18	4
12763	874	1	5
12764	874	2	0
12765	874	3	0
12766	874	4	4
12767	874	5	5
12768	874	6	6
12769	874	7	3
12770	874	8	5
12771	874	9	5
12772	874	10	6
12773	874	11	0
12774	874	12	4
12775	874	13	5
12776	874	14	3
12777	874	15	6
12778	874	16	6
12779	874	17	4
12780	874	18	4
12781	872	1	5
12782	872	2	3
12783	872	3	0
12784	872	4	4
12785	872	5	6
12786	872	6	5
12787	872	7	3
12788	872	8	5
12789	872	9	4
12790	872	10	5
12791	872	11	2
12792	872	12	5
12793	872	13	4
12794	872	14	4
12795	872	15	5
12796	872	16	5
12797	872	17	3
12798	872	18	5
12799	871	1	0
12800	871	2	0
12801	871	3	6
12802	871	4	5
12803	871	5	7
12804	871	6	5
12805	871	7	4
12806	871	8	3
12807	871	9	3
12808	871	10	5
12809	871	11	4
12810	871	12	4
12811	871	13	5
12812	871	14	0
12813	871	15	4
12814	871	16	0
12815	871	17	0
12816	871	18	0
12817	858	1	6
12818	858	2	3
12819	858	3	6
12820	858	4	5
12821	858	5	6
12822	858	6	5
12823	858	7	5
12824	858	8	4
12825	858	9	0
12826	858	10	5
12827	858	11	3
12828	858	12	4
12829	858	13	4
12830	858	14	4
12831	858	15	5
12832	858	16	5
12833	858	17	5
12834	858	18	5
12835	857	1	5
12836	857	2	0
12837	857	3	5
12838	857	4	5
12839	857	5	5
12840	857	6	5
12841	857	7	4
12842	857	8	0
12843	857	9	3
12844	857	10	4
12845	857	11	4
12846	857	12	0
12847	857	13	0
12848	857	14	5
12849	857	15	6
12850	857	16	5
12851	857	17	5
12852	857	18	7
12853	843	1	6
12854	843	2	5
12855	843	3	5
12856	843	4	0
12857	843	5	0
12858	843	6	0
12859	843	7	0
12860	843	8	0
12861	843	9	0
12862	843	10	4
12863	843	11	0
12864	843	12	4
12865	843	13	5
12866	843	14	4
12867	843	15	5
12868	843	16	0
12869	843	17	6
12870	843	18	7
12871	842	1	5
12872	842	2	0
12873	842	3	4
12874	842	4	6
12875	842	5	5
12876	842	6	5
12877	842	7	4
12878	842	8	4
12879	842	9	4
12880	842	10	5
12881	842	11	4
12882	842	12	0
12883	842	13	7
12884	842	14	2
12885	842	15	4
12886	842	16	0
12887	842	17	6
12888	842	18	4
12889	836	1	0
12890	836	2	5
12891	836	3	5
12892	836	4	3
12893	836	5	6
12894	836	6	0
12895	836	7	0
12896	836	8	4
12897	836	9	4
12898	836	10	0
12899	836	11	5
12900	836	12	4
12901	836	13	4
12902	836	14	4
12903	836	15	5
12904	836	16	0
12905	836	17	0
12906	836	18	6
12907	837	1	6
12908	837	2	0
12909	837	3	7
12910	837	4	5
12911	837	5	7
12912	837	6	5
12913	837	7	5
12914	837	8	6
12915	837	9	4
12916	837	10	5
12917	837	11	5
12918	837	12	6
12919	837	13	6
12920	837	14	4
12921	837	15	5
12922	837	16	7
12923	837	17	5
12924	837	18	5
12925	859	1	6
12926	859	2	2
12927	859	3	5
12928	859	4	5
12929	859	5	4
12930	859	6	4
12931	859	7	0
12932	859	8	5
12933	859	9	4
12934	859	10	0
12935	859	11	0
12936	859	12	4
12937	859	13	4
12938	859	14	4
12939	859	15	4
12940	859	16	0
12941	859	17	4
12942	859	18	0
12943	860	1	5
12944	860	2	0
12945	860	3	5
12946	860	4	0
12947	860	5	5
12948	860	6	0
12949	860	7	2
12950	860	8	0
12951	860	9	0
12952	860	10	5
12953	860	11	2
12954	860	12	5
13502	926	2	3
12955	860	13	5
12956	860	14	0
12957	860	15	0
12958	860	16	5
12959	860	17	0
12960	860	18	5
12961	863	1	5
12962	863	2	4
12963	863	3	4
12964	863	4	4
12965	863	5	4
12966	863	6	0
12967	863	7	4
12968	863	8	4
12969	863	9	4
12970	863	10	0
12971	863	11	3
12972	863	12	5
12973	863	13	3
12974	863	14	3
12975	863	15	0
12976	863	16	0
12977	863	17	0
12978	863	18	6
12979	864	1	4
12980	864	2	3
12981	864	3	6
12982	864	4	5
12983	864	5	6
12984	864	6	5
12985	864	7	4
12986	864	8	4
12987	864	9	3
12988	864	10	6
12989	864	11	3
12990	864	12	4
12991	864	13	5
12992	864	14	5
12993	864	15	5
12994	864	16	5
12995	864	17	4
12996	864	18	0
12997	869	1	5
12998	869	2	3
12999	869	3	4
13000	869	4	0
13001	869	5	5
13002	869	6	4
13003	869	7	4
13004	869	8	3
13005	869	9	3
13006	869	10	0
13007	869	11	4
13008	869	12	6
13009	869	13	4
13010	869	14	4
13011	869	15	6
13012	869	16	7
13013	869	17	5
13014	869	18	5
13015	870	1	8
13016	870	2	3
13017	870	3	4
13018	870	4	4
13019	870	5	7
13020	870	6	5
13021	870	7	5
13022	870	8	5
13023	870	9	5
13024	870	10	0
13025	870	11	4
13026	870	12	5
13027	870	13	4
13028	870	14	4
13029	870	15	6
13030	870	16	7
13031	870	17	0
13032	870	18	4
13033	878	1	5
13034	878	2	3
13035	878	3	4
13036	878	4	5
13037	878	5	6
13038	878	6	5
13039	878	7	3
13040	878	8	0
13041	878	9	4
13042	878	10	4
13043	878	11	3
13044	878	12	3
13045	878	13	0
13046	878	14	3
13047	878	15	0
13048	878	16	5
13049	878	17	5
13050	878	18	5
13051	877	1	5
13052	877	2	2
13053	877	3	4
13054	877	4	0
13055	877	5	6
13056	877	6	5
13057	877	7	3
13058	877	8	4
13059	877	9	4
13060	877	10	0
13061	877	11	3
13062	877	12	5
13063	877	13	4
13064	877	14	3
13065	877	15	4
13066	877	16	5
13067	877	17	5
13068	877	18	5
13069	868	1	0
13070	868	2	4
13071	868	3	5
13072	868	4	4
13073	868	5	0
13074	868	6	5
13075	868	7	0
13076	868	8	4
13077	868	9	4
13078	868	10	4
13079	868	11	4
13080	868	12	4
13081	868	13	0
13082	868	14	4
13083	868	15	0
13084	868	16	5
13085	868	17	5
13086	868	18	5
13087	867	1	5
13088	867	2	4
13089	867	3	5
13090	867	4	5
13091	867	5	6
13092	867	6	5
13093	867	7	3
13094	867	8	0
13095	867	9	0
13096	867	10	5
13097	867	11	4
13098	867	12	0
13099	867	13	0
13100	867	14	0
13101	867	15	5
13102	867	16	0
13103	867	17	0
13104	867	18	0
13105	865	1	0
13106	865	2	0
13107	865	3	0
13108	865	4	0
13109	865	5	5
13110	865	6	6
13111	865	7	4
13112	865	8	0
13113	865	9	5
13114	865	10	4
13115	865	11	4
13116	865	12	4
13117	865	13	5
13118	865	14	3
13119	865	15	6
13120	865	16	6
13121	865	17	6
13122	865	18	6
13123	866	1	5
13124	866	2	3
13125	866	3	0
13126	866	4	0
13127	866	5	6
13128	866	6	6
13129	866	7	4
13130	866	8	5
13131	866	9	4
13132	866	10	4
13133	866	11	3
13134	866	12	4
13135	866	13	5
13136	866	14	3
13137	866	15	4
13138	866	16	5
13139	866	17	5
13140	866	18	4
13141	861	1	6
13142	861	2	4
13143	861	3	5
13144	861	4	5
13145	861	5	0
13146	861	6	0
13147	861	7	0
13148	861	8	4
13149	861	9	4
13150	861	10	0
13151	861	11	0
13152	861	12	5
13153	861	13	0
13154	861	14	4
13155	861	15	5
13156	861	16	6
13157	861	17	5
13158	861	18	6
13159	862	1	4
13160	862	2	4
13161	862	3	5
13162	862	4	4
13163	862	5	6
13164	862	6	5
13165	862	7	5
13166	862	8	0
13167	862	9	4
13168	862	10	4
13169	862	11	3
13170	862	12	4
13171	862	13	5
13172	862	14	3
13173	862	15	4
13174	862	16	6
13175	862	17	5
13176	862	18	0
13177	875	1	4
13178	875	2	4
13179	875	3	0
13180	875	4	5
13181	875	5	0
13182	875	6	0
13183	875	7	4
13184	875	8	0
13185	875	9	4
13186	875	10	4
13187	875	11	4
13188	875	12	5
13189	875	13	0
13190	875	14	4
13191	875	15	6
13192	875	16	6
13193	875	17	0
13194	875	18	0
13195	876	1	0
13196	876	2	0
13197	876	3	0
13198	876	4	5
13199	876	5	5
13200	876	6	6
13201	876	7	0
13202	876	8	5
13203	876	9	3
13204	876	10	5
13205	876	11	4
13206	876	12	5
13207	876	13	5
13208	876	14	0
13209	876	15	6
13210	876	16	0
13211	876	17	4
13212	876	18	0
13213	840	1	6
13214	840	2	5
13215	840	3	5
13216	840	4	6
13217	840	5	0
13218	840	6	5
13219	840	7	5
13220	840	8	0
13221	840	9	4
13222	840	10	6
13223	840	11	5
13224	840	12	6
13225	840	13	5
13226	840	14	0
13227	840	15	6
13228	840	16	6
13229	840	17	6
13230	840	18	6
13231	841	1	5
13232	841	2	4
13233	841	3	6
13234	841	4	5
13235	841	5	8
13236	841	6	7
13237	841	7	3
13238	841	8	5
13239	841	9	2
13240	841	10	4
13241	841	11	5
13242	841	12	4
13243	841	13	5
13244	841	14	5
13245	841	15	7
15823	1176	1	6
13246	841	16	6
13247	841	17	5
13248	841	18	7
13249	844	1	7
13250	844	2	5
13251	844	3	6
13252	844	4	5
13253	844	5	6
13254	844	6	0
13255	844	7	3
13256	844	8	5
13257	844	9	4
13258	844	10	0
13259	844	11	0
13260	844	12	4
13261	844	13	4
13262	844	14	0
13263	844	15	6
13264	844	16	5
13265	844	17	6
13266	844	18	6
13267	845	1	7
13268	845	2	5
13269	845	3	4
13270	845	4	4
13271	845	5	0
13272	845	6	6
13273	845	7	4
13274	845	8	0
13275	845	9	0
13276	845	10	4
13277	845	11	4
13278	845	12	5
13279	845	13	0
13280	845	14	5
13281	845	15	0
13282	845	16	0
13283	845	17	6
13284	845	18	0
13285	839	1	0
13286	839	2	4
13287	839	3	5
13288	839	4	0
13289	839	5	5
13290	839	6	0
13291	839	7	6
13292	839	8	0
13293	839	9	5
13294	839	10	5
13295	839	11	3
13296	839	12	6
13297	839	13	7
13298	839	14	4
13299	839	15	0
13300	839	16	8
13301	839	17	5
13302	839	18	0
13303	838	1	7
13304	838	2	5
13305	838	3	6
13306	838	4	5
13307	838	5	0
13308	838	6	6
13309	838	7	0
13310	838	8	0
13311	838	9	4
13312	838	10	6
13313	838	11	5
13314	838	12	4
13315	838	13	6
13316	838	14	5
13317	838	15	0
13318	838	16	8
13319	838	17	6
13320	838	18	0
13321	847	1	6
13322	847	2	0
13323	847	3	0
13324	847	4	6
13325	847	5	6
13326	847	6	5
13327	847	7	5
13328	847	8	0
13329	847	9	4
13330	847	10	5
13331	847	11	4
13332	847	12	3
13333	847	13	0
13334	847	14	4
13335	847	15	6
13336	847	16	0
13337	847	17	0
13338	847	18	5
13339	846	1	7
13340	846	2	5
13341	846	3	7
13342	846	4	6
13343	846	5	7
13344	846	6	0
13345	846	7	0
13346	846	8	0
13347	846	9	5
13348	846	10	0
13349	846	11	0
13350	846	12	0
13351	846	13	5
13352	846	14	6
13353	846	15	0
13354	846	16	7
13355	846	17	5
13356	846	18	0
13357	882	1	0
13358	882	2	0
13359	882	3	0
13360	882	4	0
13361	882	5	0
13362	882	6	0
13363	882	7	0
13364	882	8	0
13365	882	9	0
13366	882	10	0
13367	882	11	0
13368	882	12	0
13369	882	13	0
13370	882	14	0
13371	882	15	0
13372	882	16	0
13373	882	17	0
13374	882	18	0
13375	884	1	5
13376	884	2	6
13377	884	3	6
13378	884	4	6
13379	884	5	5
13380	884	6	6
13381	884	7	3
13382	884	8	5
13383	884	9	4
13384	884	10	4
13385	884	11	5
13386	884	12	5
13387	884	13	7
13388	884	14	4
13389	884	15	4
13390	884	16	7
13391	884	17	6
13392	884	18	6
13393	852	1	6
13394	852	2	4
13395	852	3	0
13396	852	4	0
13397	852	5	0
13398	852	6	7
13399	852	7	0
13400	852	8	0
13401	852	9	0
13402	852	10	5
13403	852	11	6
13404	852	12	0
13405	852	13	6
13406	852	14	4
13407	852	15	8
13408	852	16	8
13409	852	17	0
13410	852	18	0
13411	853	1	6
13412	853	2	6
13413	853	3	6
13414	853	4	6
13415	853	5	7
13416	853	6	7
13417	853	7	6
13418	853	8	0
13419	853	9	6
13420	853	10	6
13421	853	11	5
13422	853	12	4
13423	853	13	5
13424	853	14	0
13425	853	15	6
13426	853	16	0
13427	853	17	0
13428	853	18	5
13429	835	1	6
13430	835	2	4
13431	835	3	0
13432	835	4	6
13433	835	5	0
13434	835	6	7
13435	835	7	4
13436	835	8	0
13437	835	9	0
13438	835	10	5
13439	835	11	4
13440	835	12	6
13441	835	13	5
13442	835	14	5
13443	835	15	0
13444	835	16	0
13445	835	17	5
13446	835	18	0
13447	834	1	0
13448	834	2	4
13449	834	3	0
13450	834	4	0
13451	834	5	7
13452	834	6	0
13453	834	7	0
13454	834	8	0
13455	834	9	5
13456	834	10	0
13457	834	11	5
13458	834	12	0
13459	834	13	5
13460	834	14	5
13461	834	15	0
13462	834	16	0
13463	834	17	0
13464	834	18	0
13465	886	1	6
13466	886	2	3
13467	886	3	0
13468	886	4	5
13469	886	5	5
13470	886	6	0
13471	886	7	2
13472	886	8	4
13473	886	9	3
13474	886	10	5
13475	886	11	3
13476	886	12	4
13477	886	13	5
13478	886	14	4
13479	886	15	6
13480	886	16	0
13481	886	17	6
13482	886	18	0
13483	885	1	6
13484	885	2	4
13485	885	3	4
13486	885	4	4
13487	885	5	0
13488	885	6	5
13489	885	7	0
13490	885	8	5
13491	885	9	3
13492	885	10	5
13493	885	11	3
13494	885	12	5
13495	885	13	4
13496	885	14	6
13497	885	15	6
13498	885	16	6
13499	885	17	6
13500	885	18	6
13503	926	3	6
13504	926	4	4
13505	926	5	5
13506	926	6	6
13507	926	7	4
13508	926	8	3
13509	926	9	5
13510	926	10	5
13511	926	11	3
13512	926	12	3
13513	926	13	5
13514	926	14	4
13515	926	15	4
13516	926	16	7
13517	926	17	4
13518	926	18	5
13519	927	1	6
13520	927	2	4
13521	927	3	5
13522	927	4	4
13523	927	5	5
13524	927	6	5
13525	927	7	5
13526	927	8	4
13527	927	9	2
13528	927	10	4
13529	927	11	4
13530	927	12	4
13531	927	13	5
13532	927	14	4
13533	927	15	3
13534	927	16	5
13535	927	17	4
13536	927	18	5
14438	1013	2	5
14439	1013	3	5
14440	1013	4	5
16849	1211	1	5
14441	1013	5	9
13591	914	1	6
13592	914	2	5
14442	1013	6	6
13593	914	3	6
13594	914	4	4
14443	1013	7	5
13595	914	5	9
13596	914	6	5
14444	1013	8	7
13597	914	7	3
13598	914	8	4
14445	1013	9	5
13599	914	9	3
13600	914	10	4
14446	1013	10	6
13601	914	11	4
13602	914	12	4
14447	1013	11	4
13603	914	13	4
13604	914	14	4
14448	1013	12	5
13605	914	15	4
13555	936	1	4
13556	936	2	4
13557	936	3	5
13558	936	4	5
13559	936	5	4
13560	936	6	5
13561	936	7	4
13562	936	8	6
13563	936	9	5
13564	936	10	4
13565	936	11	3
13566	936	12	7
13567	936	13	4
13568	936	14	4
13569	936	15	3
13570	936	16	8
13571	936	17	4
13572	936	18	6
13573	932	1	4
13574	932	2	5
13575	932	3	6
13576	932	4	5
13577	932	5	5
13578	932	6	5
13579	932	7	5
13580	932	8	4
13581	932	9	4
13582	932	10	5
13583	932	11	5
13584	932	12	5
13585	932	13	5
13586	932	14	4
13587	932	15	4
13588	932	16	7
13589	932	17	4
13590	932	18	8
13614	911	6	5
13615	911	7	4
13616	911	8	5
13617	911	9	5
13618	911	10	5
13619	911	11	3
13620	911	12	7
13621	911	13	6
13622	911	14	4
13606	914	16	8
13607	914	17	5
13608	914	18	5
14449	1013	13	6
14450	1013	14	4
14451	1013	15	6
14452	1013	16	7
14453	1013	17	6
14454	1013	18	6
14455	1005	1	7
14491	1008	1	7
13609	911	1	6
13610	911	2	5
13611	911	3	4
13612	911	4	5
13613	911	5	5
13623	911	15	5
13624	911	16	6
13625	911	17	6
13626	911	18	5
13627	979	1	6
13628	979	2	3
13629	979	3	4
13630	979	4	3
13631	979	5	6
13632	979	6	4
13633	979	7	3
13634	979	8	4
13635	979	9	4
13636	979	10	5
13637	979	11	3
13638	979	12	5
13639	979	13	4
13640	979	14	3
13641	979	15	3
13642	979	16	6
13643	979	17	5
13644	979	18	5
13645	980	1	8
13646	980	2	6
13647	980	3	4
13648	980	4	5
13649	980	5	4
13650	980	6	4
13651	980	7	4
13652	980	8	4
13653	980	9	4
13654	980	10	4
13655	980	11	7
13656	980	12	5
13657	980	13	7
13658	980	14	4
13659	980	15	4
13660	980	16	8
13661	980	17	5
13662	980	18	6
13663	928	1	7
13664	928	2	3
13665	928	3	5
13666	928	4	4
13667	928	5	6
13668	928	6	7
13669	928	7	5
13670	928	8	5
13671	928	9	3
13672	928	10	4
13673	928	11	4
13674	928	12	4
13675	928	13	5
13676	928	14	4
13677	928	15	4
13678	928	16	6
13679	928	17	4
13680	928	18	7
13681	929	1	12
13682	929	2	6
13683	929	3	6
13684	929	4	6
15824	1176	2	4
13685	929	5	5
13686	929	6	5
13687	929	7	5
13688	929	8	7
13689	929	9	4
13690	929	10	8
13691	929	11	4
13692	929	12	4
13693	929	13	4
13694	929	14	3
13695	929	15	5
13696	929	16	5
13697	929	17	3
13698	929	18	5
13699	933	1	5
13700	933	2	5
13701	933	3	5
13702	933	4	5
13703	933	5	5
13704	933	6	4
13705	933	7	4
13706	933	8	4
13707	933	9	4
13708	933	10	6
13709	933	11	4
13710	933	12	5
13711	933	13	5
13712	933	14	6
13713	933	15	5
13714	933	16	6
13715	933	17	5
13716	933	18	5
13717	981	1	6
13718	981	2	4
13719	981	3	5
13720	981	4	5
13721	981	5	5
13722	981	6	4
13723	981	7	6
13724	981	8	5
13725	981	9	4
13726	981	10	3
13727	981	11	4
13728	981	12	4
13729	981	13	5
13730	981	14	3
13731	981	15	5
13732	981	16	4
13733	981	17	4
13734	981	18	5
13735	916	1	8
13736	916	2	4
13737	916	3	4
13738	916	4	5
13739	916	5	8
13740	916	6	6
13741	916	7	5
13742	916	8	4
13743	916	9	7
13744	916	10	9
13745	916	11	5
13746	916	12	6
13747	916	13	6
13748	916	14	4
13749	916	15	5
13750	916	16	7
13751	916	17	6
13752	916	18	7
13753	921	1	5
13754	921	2	3
13755	921	3	4
13756	921	4	4
13757	921	5	5
13758	921	6	5
13759	921	7	4
13760	921	8	4
13761	921	9	3
13762	921	10	6
13763	921	11	3
13764	921	12	6
13765	921	13	6
13766	921	14	3
13767	921	15	5
13768	921	16	5
13769	921	17	5
13770	921	18	4
13771	919	1	7
13772	919	2	4
13773	919	3	5
13774	919	4	5
13775	919	5	7
13776	919	6	6
13777	919	7	3
13778	919	8	4
13779	919	9	4
13780	919	10	6
13781	919	11	4
13782	919	12	5
13783	919	13	5
13784	919	14	6
13785	919	15	6
13786	919	16	5
13787	919	17	5
13788	919	18	9
13789	918	1	6
13790	918	2	5
13791	918	3	4
13792	918	4	7
13793	918	5	6
13794	918	6	5
13795	918	7	5
13796	918	8	5
13797	918	9	5
13798	918	10	5
13799	918	11	4
13800	918	12	4
13801	918	13	4
13802	918	14	4
13803	918	15	5
13804	918	16	5
13805	918	17	4
13806	918	18	4
13807	923	1	5
13808	923	2	5
13809	923	3	6
13810	923	4	5
13811	923	5	6
13812	923	6	5
13813	923	7	3
13814	923	8	4
13815	923	9	4
13816	923	10	4
13817	923	11	3
13818	923	12	7
13819	923	13	4
13820	923	14	4
13821	923	15	4
13822	923	16	5
13823	923	17	4
13824	923	18	5
13825	925	1	5
13826	925	2	5
13827	925	3	5
13828	925	4	5
13829	925	5	4
13830	925	6	4
13831	925	7	4
13832	925	8	4
13833	925	9	4
13834	925	10	4
13835	925	11	3
13836	925	12	4
13837	925	13	4
13838	925	14	4
13839	925	15	4
13840	925	16	5
13841	925	17	4
13842	925	18	4
13843	982	1	4
13844	982	2	3
13845	982	3	5
13846	982	4	5
13847	982	5	8
13848	982	6	4
13849	982	7	4
13850	982	8	2
13851	982	9	3
13852	982	10	4
13853	982	11	4
13854	982	12	4
13855	982	13	5
13856	982	14	4
13857	982	15	4
13858	982	16	5
13859	982	17	4
13860	982	18	4
13861	934	1	6
13862	934	2	4
13863	934	3	4
13864	934	4	6
13865	934	5	5
13866	934	6	5
13867	934	7	3
13868	934	8	4
13869	934	9	4
13870	934	10	3
13871	934	11	3
13872	934	12	4
13873	934	13	4
13874	934	14	3
13875	934	15	4
13876	934	16	4
13877	934	17	9
13878	934	18	3
13879	935	1	9
13880	935	2	4
13881	935	3	4
13882	935	4	4
13883	935	5	6
13884	935	6	7
13885	935	7	3
13886	935	8	4
13887	935	9	4
13888	935	10	4
13889	935	11	4
13890	935	12	5
13891	935	13	4
13892	935	14	3
13893	935	15	5
13894	935	16	5
13895	935	17	5
13896	935	18	5
13897	890	1	6
13898	890	2	4
13899	890	3	5
13900	890	4	5
13901	890	5	6
13902	890	6	6
13903	890	7	3
13904	890	8	4
13905	890	9	4
13906	890	10	4
13907	890	11	2
13908	890	12	4
13909	890	13	4
13910	890	14	4
13911	890	15	4
13912	890	16	6
13913	890	17	5
13914	890	18	3
13915	900	1	5
13916	900	2	4
13917	900	3	6
13918	900	4	4
13919	900	5	5
13920	900	6	5
13921	900	7	4
13922	900	8	4
13923	900	9	4
13924	900	10	4
13925	900	11	3
13926	900	12	5
13927	900	13	5
13928	900	14	5
13929	900	15	4
13930	900	16	4
13931	900	17	4
13932	900	18	5
13933	898	1	5
13934	898	2	3
13935	898	3	4
13936	898	4	3
13937	898	5	6
13938	898	6	5
13939	898	7	4
13940	898	8	4
13941	898	9	5
13942	898	10	4
13943	898	11	3
13944	898	12	4
13945	898	13	4
13946	898	14	3
13947	898	15	4
13948	898	16	6
13949	898	17	4
13950	898	18	4
13951	917	1	5
13952	917	2	3
13953	917	3	4
13954	917	4	5
13955	917	5	5
13956	917	6	4
13957	917	7	3
13958	917	8	4
13959	917	9	3
13960	917	10	4
13961	917	11	3
13962	917	12	4
13963	917	13	4
13964	917	14	3
13965	917	15	4
13966	917	16	6
13967	917	17	4
13968	917	18	4
13969	912	1	5
13970	912	2	4
13971	912	3	4
13972	912	4	5
13973	912	5	6
13974	912	6	5
13975	912	7	3
17839	1227	1	5
13976	912	8	4
13977	912	9	4
13978	912	10	4
13979	912	11	3
13980	912	12	5
13981	912	13	4
13982	912	14	4
13983	912	15	4
13984	912	16	5
13985	912	17	4
13986	912	18	4
13987	924	1	5
13988	924	2	3
13989	924	3	5
13990	924	4	9
13991	924	5	8
13992	924	6	5
13993	924	7	4
13994	924	8	4
13995	924	9	3
13996	924	10	5
13997	924	11	4
13998	924	12	7
13999	924	13	4
14000	924	14	4
14001	924	15	4
14002	924	16	6
14003	924	17	5
14004	924	18	5
14005	915	1	8
14006	915	2	5
14007	915	3	4
14008	915	4	5
14009	915	5	7
14010	915	6	5
14011	915	7	7
14012	915	8	8
14013	915	9	4
14014	915	10	8
14015	915	11	4
14016	915	12	4
14017	915	13	3
14018	915	14	3
14019	915	15	5
14020	915	16	5
14021	915	17	3
14022	915	18	5
14023	909	1	5
14024	909	2	6
14025	909	3	4
14026	909	4	4
14027	909	5	5
14028	909	6	5
14029	909	7	3
14030	909	8	6
14031	909	9	4
14032	909	10	6
14033	909	11	4
14034	909	12	6
14035	909	13	5
14036	909	14	4
14037	909	15	4
14038	909	16	6
14039	909	17	4
14040	909	18	4
14041	922	1	7
14042	922	2	5
14043	922	3	5
14044	922	4	9
14045	922	5	6
14046	922	6	8
14047	922	7	4
14048	922	8	4
14049	922	9	3
14050	922	10	5
14051	922	11	5
14052	922	12	4
14053	922	13	4
14054	922	14	4
14055	922	15	5
14056	922	16	4
14057	922	17	6
14058	922	18	4
14059	902	1	7
14060	902	2	4
14061	902	3	5
14062	902	4	4
14063	902	5	6
14064	902	6	5
14065	902	7	4
14066	902	8	3
14067	902	9	4
14068	902	10	4
14069	902	11	4
14070	902	12	4
14071	902	13	4
14072	902	14	3
14073	902	15	5
14074	902	16	6
14075	902	17	4
14076	902	18	7
14077	895	1	7
14078	895	2	4
14079	895	3	4
14080	895	4	4
14081	895	5	5
14082	895	6	5
14083	895	7	3
14084	895	8	4
14085	895	9	4
14086	895	10	4
14087	895	11	3
14088	895	12	4
14089	895	13	4
14090	895	14	4
14091	895	15	4
14092	895	16	6
14093	895	17	5
14094	895	18	5
14095	899	1	5
14096	899	2	4
14097	899	3	4
14098	899	4	4
14099	899	5	5
14100	899	6	6
14101	899	7	4
14102	899	8	5
14103	899	9	4
14104	899	10	6
14105	899	11	4
14106	899	12	4
14107	899	13	4
14108	899	14	4
14109	899	15	4
14110	899	16	5
14111	899	17	5
14112	899	18	4
14113	906	1	6
14114	906	2	5
14115	906	3	4
14116	906	4	4
14117	906	5	5
14118	906	6	4
14119	906	7	3
14120	906	8	5
14121	906	9	2
14122	906	10	7
14123	906	11	3
14124	906	12	3
14125	906	13	5
14126	906	14	3
14127	906	15	4
14128	906	16	5
14129	906	17	4
14130	906	18	5
14131	891	1	7
14132	891	2	5
14133	891	3	5
14134	891	4	4
14135	891	5	7
14136	891	6	6
14137	891	7	3
14138	891	8	4
14139	891	9	3
14140	891	10	4
14141	891	11	3
14142	891	12	6
14143	891	13	4
14144	891	14	4
14145	891	15	4
14146	891	16	4
14147	891	17	3
14148	891	18	4
14149	905	1	6
14150	905	2	4
14151	905	3	4
14152	905	4	3
14153	905	5	6
14154	905	6	6
14155	905	7	3
14156	905	8	4
14157	905	9	3
14158	905	10	5
14159	905	11	4
14160	905	12	3
14161	905	13	4
14162	905	14	3
14163	905	15	5
14164	905	16	6
14165	905	17	4
14166	905	18	7
14167	920	1	4
14168	920	2	3
14169	920	3	4
14170	920	4	4
14171	920	5	5
14172	920	6	5
14173	920	7	2
14174	920	8	4
14175	920	9	4
14176	920	10	6
14177	920	11	4
14178	920	12	3
14179	920	13	4
14180	920	14	3
14181	920	15	4
14182	920	16	5
14183	920	17	4
14184	920	18	4
14185	913	1	5
14186	913	2	4
14187	913	3	6
14188	913	4	4
14189	913	5	5
14190	913	6	5
14191	913	7	5
14192	913	8	4
14193	913	9	3
14194	913	10	8
14195	913	11	3
14196	913	12	4
14197	913	13	5
14198	913	14	4
14199	913	15	4
14200	913	16	8
14201	913	17	5
14202	913	18	10
14203	910	1	5
14204	910	2	4
14205	910	3	4
14206	910	4	7
14207	910	5	8
14208	910	6	5
14209	910	7	4
14210	910	8	4
14211	910	9	4
14212	910	10	5
14213	910	11	4
14214	910	12	6
14215	910	13	5
14216	910	14	5
14217	910	15	4
14218	910	16	6
14219	910	17	5
14220	910	18	7
14221	908	1	6
14222	908	2	5
14223	908	3	5
14224	908	4	6
14225	908	5	5
14226	908	6	7
14227	908	7	4
14228	908	8	4
14229	908	9	4
14230	908	10	5
14231	908	11	3
14232	908	12	4
14233	908	13	5
14234	908	14	6
14235	908	15	4
14236	908	16	6
14237	908	17	5
14238	908	18	5
14239	983	1	6
14240	983	2	4
14241	983	3	5
14242	983	4	5
14243	983	5	4
14244	983	6	5
14245	983	7	5
14246	983	8	4
14247	983	9	3
14248	983	10	7
14249	983	11	4
14250	983	12	4
14251	983	13	5
14252	983	14	6
14253	983	15	4
14254	983	16	9
14255	983	17	9
14256	983	18	9
14257	896	1	5
14258	896	2	3
14259	896	3	4
14260	896	4	4
14261	896	5	5
14262	896	6	4
14263	896	7	3
14264	896	8	5
14265	896	9	3
14266	896	10	7
15825	1176	3	6
14267	896	11	3
14268	896	12	4
14269	896	13	4
14270	896	14	3
14271	896	15	3
14272	896	16	7
14273	896	17	4
14274	896	18	5
14275	901	1	6
14276	901	2	5
14277	901	3	5
14278	901	4	4
14279	901	5	6
14280	901	6	4
14281	901	7	3
14282	901	8	4
14283	901	9	2
14284	901	10	6
14285	901	11	4
14286	901	12	4
14287	901	13	5
14288	901	14	3
14289	901	15	7
14290	901	16	5
14291	901	17	4
14292	901	18	6
14293	897	1	5
14294	897	2	6
14295	897	3	3
14296	897	4	5
14297	897	5	6
14298	897	6	6
14299	897	7	4
14300	897	8	4
14301	897	9	3
14302	897	10	6
14303	897	11	5
14304	897	12	3
14305	897	13	5
14306	897	14	4
14307	897	15	4
14308	897	16	9
14309	897	17	4
14310	897	18	4
14311	904	1	5
14312	904	2	4
14313	904	3	4
14314	904	4	4
14315	904	5	5
14316	904	6	4
14317	904	7	3
14318	904	8	5
14319	904	9	4
14320	904	10	4
14321	904	11	3
14322	904	12	4
14323	904	13	4
14324	904	14	3
14325	904	15	4
14326	904	16	8
14327	904	17	5
14328	904	18	5
14329	903	1	4
14330	903	2	3
14331	903	3	5
14332	903	4	5
14333	903	5	5
14334	903	6	7
14335	903	7	4
14336	903	8	4
14337	903	9	4
14338	903	10	4
14339	903	11	5
14340	903	12	4
14341	903	13	4
14342	903	14	2
14343	903	15	3
14344	903	16	5
14345	903	17	4
14346	903	18	4
14347	892	1	6
14348	892	2	6
14349	892	3	5
14350	892	4	5
14351	892	5	6
14352	892	6	6
14353	892	7	5
14354	892	8	10
14355	892	9	4
14356	892	10	4
14357	892	11	3
14358	892	12	5
14359	892	13	5
14360	892	14	4
14361	892	15	7
14362	892	16	9
14363	892	17	4
14364	892	18	6
14365	907	1	5
14366	907	2	5
14367	907	3	5
14368	907	4	4
14369	907	5	5
14370	907	6	4
14371	907	7	2
14372	907	8	5
14373	907	9	4
14374	907	10	6
14375	907	11	3
14376	907	12	3
14377	907	13	5
14378	907	14	4
14379	907	15	3
14380	907	16	5
14381	907	17	3
14382	907	18	5
14383	894	1	7
14384	894	2	4
14385	894	3	3
14386	894	4	3
14387	894	5	5
14388	894	6	5
14389	894	7	3
14390	894	8	4
14391	894	9	3
14392	894	10	4
14393	894	11	3
14394	894	12	6
14395	894	13	5
14396	894	14	3
14397	894	15	4
14398	894	16	5
14399	894	17	3
14400	894	18	4
14401	893	1	6
14402	893	2	4
14403	893	3	4
14404	893	4	3
14405	893	5	4
14406	893	6	5
14407	893	7	4
14408	893	8	5
14409	893	9	4
14410	893	10	9
14411	893	11	2
14412	893	12	3
14413	893	13	5
14414	893	14	4
14415	893	15	4
14416	893	16	5
14417	893	17	5
14418	893	18	3
15826	1176	4	7
14421	1019	3	3
14422	1019	4	4
14423	1019	5	5
14424	1019	6	3
14425	1019	7	3
14426	1019	8	4
14427	1019	9	4
14428	1019	10	3
14429	1019	11	3
14430	1019	12	5
14431	1019	13	4
14432	1019	14	3
14433	1019	15	5
14434	1019	16	6
14435	1019	17	6
14436	1019	18	4
14519	1001	11	4
14520	1001	12	5
14521	1001	13	5
14522	1001	14	4
14523	1001	15	4
14524	1001	16	6
14525	1001	17	5
14526	1001	18	4
14527	1003	1	4
14456	1005	2	4
14457	1005	3	7
14458	1005	4	6
14459	1005	5	6
14460	1005	6	4
14461	1005	7	4
14462	1005	8	6
14463	1005	9	7
14464	1005	10	6
14465	1005	11	4
14466	1005	12	5
14467	1005	13	7
14468	1005	14	4
14469	1005	15	4
14470	1005	16	6
14471	1005	17	5
14472	1005	18	6
14473	1056	1	7
14474	1056	2	4
14475	1056	3	5
14476	1056	4	3
14477	1056	5	4
14478	1056	6	8
14479	1056	7	3
14480	1056	8	5
14481	1056	9	3
14482	1056	10	6
14483	1056	11	4
14484	1056	12	4
14485	1056	13	5
14486	1056	14	5
14487	1056	15	5
14488	1056	16	6
14489	1056	17	5
14490	1056	18	7
14492	1008	2	5
14493	1008	3	6
14494	1008	4	6
14495	1008	5	8
14496	1008	6	9
14497	1008	7	3
14498	1008	8	5
14499	1008	9	4
14500	1008	10	5
14501	1008	11	5
14502	1008	12	5
14503	1008	13	5
14504	1008	14	5
14505	1008	15	13
14506	1008	16	10
14507	1008	17	7
14508	1008	18	10
14509	1001	1	6
14510	1001	2	5
14511	1001	3	5
14512	1001	4	5
14513	1001	5	5
14514	1001	6	5
14515	1001	7	4
14516	1001	8	4
14517	1001	9	3
14518	1001	10	5
14528	1003	2	4
14529	1003	3	5
14530	1003	4	4
14531	1003	5	6
14532	1003	6	5
14533	1003	7	6
14534	1003	8	4
14535	1003	9	4
14536	1003	10	5
14537	1003	11	4
14538	1003	12	6
14539	1003	13	5
14540	1003	14	6
14541	1003	15	6
14542	1003	16	7
14543	1003	17	5
14544	1003	18	6
14545	1009	1	6
14546	1009	2	5
14547	1009	3	5
14548	1009	4	4
14549	1009	5	6
14550	1009	6	5
14551	1009	7	4
14552	1009	8	4
14553	1009	9	4
14554	1009	10	4
14555	1009	11	4
14556	1009	12	6
14557	1009	13	5
14558	1009	14	4
14559	1009	15	4
14560	1009	16	7
14561	1009	17	5
14562	1009	18	5
14563	1002	1	5
14564	1002	2	5
14565	1002	3	5
14566	1002	4	4
14567	1002	5	7
14568	1002	6	4
14569	1002	7	4
14570	1002	8	7
14571	1002	9	4
14572	1002	10	4
14573	1002	11	3
14574	1002	12	6
14575	1002	13	4
14576	1002	14	5
14577	1002	15	5
14578	1002	16	7
15827	1176	5	7
14579	1002	17	5
14580	1002	18	3
14581	1059	1	5
14582	1059	2	4
14583	1059	3	5
14584	1059	4	5
14585	1059	5	6
14586	1059	6	4
14587	1059	7	4
14588	1059	8	4
14589	1059	9	4
14590	1059	10	6
14591	1059	11	7
14592	1059	12	4
14593	1059	13	5
14594	1059	14	4
14595	1059	15	5
14596	1059	16	7
14597	1059	17	5
14598	1059	18	6
14599	1063	1	5
14600	1063	2	5
14601	1063	3	6
14602	1063	4	7
14603	1063	5	5
14604	1063	6	7
14605	1063	7	3
14606	1063	8	5
14607	1063	9	5
14608	1063	10	4
14609	1063	11	4
14610	1063	12	4
14611	1063	13	5
14612	1063	14	8
14613	1063	15	4
14614	1063	16	7
14615	1063	17	5
14616	1063	18	5
14617	1016	1	5
14618	1016	2	4
14619	1016	3	6
14620	1016	4	5
14621	1016	5	5
14622	1016	6	5
14623	1016	7	3
14624	1016	8	4
14625	1016	9	4
14626	1016	10	5
14627	1016	11	5
14628	1016	12	5
14629	1016	13	4
14630	1016	14	4
14631	1016	15	5
14632	1016	16	6
14633	1016	17	5
14634	1016	18	5
14635	1057	1	7
14636	1057	2	4
14637	1057	3	5
14638	1057	4	5
14639	1057	5	5
14640	1057	6	6
14641	1057	7	3
14642	1057	8	4
14643	1057	9	4
14644	1057	10	6
14645	1057	11	4
14646	1057	12	3
14647	1057	13	5
14648	1057	14	4
14649	1057	15	5
14650	1057	16	5
14651	1057	17	5
14652	1057	18	5
14653	1058	1	5
14654	1058	2	4
14655	1058	3	5
14656	1058	4	6
14657	1058	5	6
14658	1058	6	6
14659	1058	7	2
14660	1058	8	5
14661	1058	9	3
14662	1058	10	6
14663	1058	11	5
14664	1058	12	6
14665	1058	13	5
14666	1058	14	4
14667	1058	15	5
14668	1058	16	5
14669	1058	17	6
14670	1058	18	5
14671	1061	1	9
14672	1061	2	5
14673	1061	3	5
14674	1061	4	4
14675	1061	5	5
14676	1061	6	8
14677	1061	7	4
14678	1061	8	3
14679	1061	9	4
14680	1061	10	4
14681	1061	11	3
14682	1061	12	4
14683	1061	13	6
14684	1061	14	3
14685	1061	15	5
14686	1061	16	6
14687	1061	17	5
14688	1061	18	5
14689	1062	1	6
14690	1062	2	4
14691	1062	3	4
14692	1062	4	4
14693	1062	5	6
14694	1062	6	4
14695	1062	7	3
14696	1062	8	3
14697	1062	9	4
14698	1062	10	5
14699	1062	11	4
14700	1062	12	4
14701	1062	13	4
14702	1062	14	3
14703	1062	15	4
14704	1062	16	6
14705	1062	17	5
14706	1062	18	5
14707	1055	1	6
14708	1055	2	3
14709	1055	3	6
14710	1055	4	5
14711	1055	5	13
14712	1055	6	5
14713	1055	7	4
14714	1055	8	4
14715	1055	9	3
14716	1055	10	7
14717	1055	11	3
14718	1055	12	5
14719	1055	13	6
14720	1055	14	4
14721	1055	15	4
14722	1055	16	10
14723	1055	17	5
14724	1055	18	5
14725	1054	1	5
14726	1054	2	3
14727	1054	3	4
14728	1054	4	5
14729	1054	5	6
14730	1054	6	4
14731	1054	7	5
14732	1054	8	4
14733	1054	9	3
14734	1054	10	4
14735	1054	11	2
14736	1054	12	5
14737	1054	13	5
14738	1054	14	3
14739	1054	15	5
14740	1054	16	5
14741	1054	17	4
14742	1054	18	6
14743	1052	1	5
14744	1052	2	3
14745	1052	3	4
14746	1052	4	7
14747	1052	5	6
14748	1052	6	4
14749	1052	7	3
14750	1052	8	5
14751	1052	9	3
14752	1052	10	6
14753	1052	11	4
14754	1052	12	5
14755	1052	13	4
14756	1052	14	3
14757	1052	15	4
14758	1052	16	5
14759	1052	17	4
14760	1052	18	5
14761	1017	1	6
14762	1017	2	4
14763	1017	3	5
14764	1017	4	4
14765	1017	5	4
14766	1017	6	4
14767	1017	7	2
14768	1017	8	4
14769	1017	9	3
14770	1017	10	6
14771	1017	11	2
14772	1017	12	5
14773	1017	13	4
14774	1017	14	3
14775	1017	15	3
14776	1017	16	8
14777	1017	17	4
14778	1017	18	8
14779	1060	1	5
14780	1060	2	5
14781	1060	3	5
14782	1060	4	4
14783	1060	5	4
14784	1060	6	6
14785	1060	7	3
14786	1060	8	4
14787	1060	9	4
14788	1060	10	5
14789	1060	11	4
14790	1060	12	4
14791	1060	13	4
14792	1060	14	3
14793	1060	15	5
14794	1060	16	6
14795	1060	17	5
14796	1060	18	5
14797	1047	1	5
14798	1047	2	4
14799	1047	3	5
14800	1047	4	4
14801	1047	5	5
14802	1047	6	7
14803	1047	7	5
14804	1047	8	6
14805	1047	9	3
14806	1047	10	6
14807	1047	11	2
14808	1047	12	7
14809	1047	13	5
14810	1047	14	6
14811	1047	15	5
14812	1047	16	6
14813	1047	17	4
14814	1047	18	5
14815	1015	1	5
14816	1015	2	4
14817	1015	3	6
14818	1015	4	5
14819	1015	5	6
14820	1015	6	4
14821	1015	7	3
14822	1015	8	5
14823	1015	9	4
14824	1015	10	9
14825	1015	11	3
14826	1015	12	5
14827	1015	13	5
14828	1015	14	3
14829	1015	15	4
14830	1015	16	6
14831	1015	17	4
14832	1015	18	7
14833	1050	1	4
14834	1050	2	5
14835	1050	3	4
14836	1050	4	3
14837	1050	5	5
14838	1050	6	5
14839	1050	7	3
14840	1050	8	4
14841	1050	9	3
14842	1050	10	4
14843	1050	11	4
14844	1050	12	4
14845	1050	13	5
14846	1050	14	4
14847	1050	15	4
14848	1050	16	6
14849	1050	17	4
14850	1050	18	5
14852	1014	2	0
14853	1014	3	0
14854	1014	4	0
14855	1014	5	0
14856	1014	6	0
14857	1014	7	0
14858	1014	8	0
14859	1014	9	0
14860	1014	10	0
14861	1014	11	0
14862	1014	12	0
14863	1014	13	0
14864	1014	14	0
14865	1014	15	0
14866	1014	16	0
14867	1014	17	0
14868	1014	18	0
15828	1176	6	5
14869	1040	1	5
16850	1211	2	5
14870	1040	2	4
14871	1040	3	5
14872	1040	4	5
14873	1040	5	5
14874	1040	6	5
14875	1040	7	6
14876	1040	8	4
14877	1040	9	4
14878	1040	10	4
14879	1040	11	3
14880	1040	12	4
14881	1040	13	4
14882	1040	14	4
14883	1040	15	5
14884	1040	16	6
14885	1040	17	4
14886	1040	18	5
14887	1045	1	6
14888	1045	2	4
14889	1045	3	5
14890	1045	4	4
14891	1045	5	5
14892	1045	6	5
14893	1045	7	5
14894	1045	8	6
14895	1045	9	3
14896	1045	10	4
14897	1045	11	3
14898	1045	12	5
14899	1045	13	5
14900	1045	14	7
14901	1045	15	7
14902	1045	16	6
14903	1045	17	5
14904	1045	18	9
14905	1048	1	7
14906	1048	2	4
14907	1048	3	5
14908	1048	4	7
14909	1048	5	8
14910	1048	6	10
14911	1048	7	4
14912	1048	8	5
14913	1048	9	7
14914	1048	10	6
14915	1048	11	6
14916	1048	12	4
14917	1048	13	4
14918	1048	14	5
14919	1048	15	4
14920	1048	16	5
14921	1048	17	5
14922	1048	18	5
14923	1041	1	5
14924	1041	2	3
14925	1041	3	4
14926	1041	4	4
14927	1041	5	5
14928	1041	6	4
14929	1041	7	4
14930	1041	8	4
14931	1041	9	3
14932	1041	10	4
14933	1041	11	4
14934	1041	12	4
14935	1041	13	4
14936	1041	14	2
14937	1041	15	7
14938	1041	16	5
14939	1041	17	6
14940	1041	18	4
14941	1046	1	6
14942	1046	2	4
14943	1046	3	4
14944	1046	4	5
14945	1046	5	6
14946	1046	6	5
14947	1046	7	3
14948	1046	8	4
14949	1046	9	5
14950	1046	10	4
14951	1046	11	5
14952	1046	12	4
14953	1046	13	4
14954	1046	14	3
14955	1046	15	5
14956	1046	16	4
14957	1046	17	4
14958	1046	18	7
14959	1053	1	5
14960	1053	2	4
14961	1053	3	5
14962	1053	4	6
14963	1053	5	6
14964	1053	6	4
14965	1053	7	3
14966	1053	8	4
14967	1053	9	4
14968	1053	10	5
14969	1053	11	3
14970	1053	12	5
14971	1053	13	4
14972	1053	14	4
14973	1053	15	4
14974	1053	16	5
14975	1053	17	5
14976	1053	18	6
14977	1043	1	7
14978	1043	2	4
14979	1043	3	4
14980	1043	4	5
14981	1043	5	5
14982	1043	6	4
14983	1043	7	4
14984	1043	8	6
14985	1043	9	5
14986	1043	10	7
14987	1043	11	2
14988	1043	12	6
14989	1043	13	6
14990	1043	14	4
14991	1043	15	4
14992	1043	16	9
14993	1043	17	5
14994	1043	18	4
14995	1027	1	5
14996	1027	2	3
14997	1027	3	5
14998	1027	4	4
14999	1027	5	5
15000	1027	6	4
15001	1027	7	3
15002	1027	8	3
15003	1027	9	3
15004	1027	10	5
15005	1027	11	4
15006	1027	12	4
15007	1027	13	4
15008	1027	14	3
15009	1027	15	4
15010	1027	16	6
15011	1027	17	3
15012	1027	18	4
15013	1037	1	5
15014	1037	2	4
15015	1037	3	6
15016	1037	4	4
15017	1037	5	5
15018	1037	6	5
15019	1037	7	5
15020	1037	8	5
15021	1037	9	4
15022	1037	10	6
15023	1037	11	4
15024	1037	12	7
15025	1037	13	5
15026	1037	14	3
15027	1037	15	5
15028	1037	16	5
15029	1037	17	5
15030	1037	18	6
14419	1019	1	6
14420	1019	2	5
15031	1029	1	6
15032	1029	2	4
15033	1029	3	4
15034	1029	4	5
15035	1029	5	5
15036	1029	6	5
15037	1029	7	3
15038	1029	8	5
15039	1029	9	4
15040	1029	10	5
15041	1029	11	4
15042	1029	12	4
15043	1029	13	3
15044	1029	14	4
15045	1029	15	4
15046	1029	16	7
15047	1029	17	3
15048	1029	18	4
15049	1044	1	11
15050	1044	2	4
15051	1044	3	5
15052	1044	4	4
15053	1044	5	5
15054	1044	6	4
15055	1044	7	5
15056	1044	8	6
15057	1044	9	4
15058	1044	10	5
15059	1044	11	3
15060	1044	12	4
15061	1044	13	5
15062	1044	14	4
15063	1044	15	5
15064	1044	16	7
15065	1044	17	4
15066	1044	18	5
15067	1051	1	5
15068	1051	2	4
15069	1051	3	5
15070	1051	4	9
15071	1051	5	7
15072	1051	6	4
15073	1051	7	4
15074	1051	8	4
15075	1051	9	6
15076	1051	10	4
15077	1051	11	4
15078	1051	12	3
15079	1051	13	7
15080	1051	14	4
15081	1051	15	4
15082	1051	16	5
15083	1051	17	4
15084	1051	18	5
15085	1038	1	9
15086	1038	2	4
15087	1038	3	6
15088	1038	4	4
15089	1038	5	5
15090	1038	6	5
15091	1038	7	3
15092	1038	8	5
15093	1038	9	5
15094	1038	10	6
15095	1038	11	4
15096	1038	12	5
15097	1038	13	5
15098	1038	14	4
15099	1038	15	4
15100	1038	16	5
15101	1038	17	4
15102	1038	18	6
15103	1039	1	6
15104	1039	2	3
15105	1039	3	5
15106	1039	4	6
15107	1039	5	5
15108	1039	6	5
15109	1039	7	3
15110	1039	8	5
15111	1039	9	4
15112	1039	10	6
15113	1039	11	4
15114	1039	12	5
15115	1039	13	5
15116	1039	14	5
15117	1039	15	5
15118	1039	16	7
15119	1039	17	5
15120	1039	18	4
15121	1028	1	5
15122	1028	2	4
15123	1028	3	4
15124	1028	4	4
15125	1028	5	9
15126	1028	6	5
15127	1028	7	3
15128	1028	8	4
15129	1028	9	4
15130	1028	10	5
15131	1028	11	4
15132	1028	12	4
15133	1028	13	4
15134	1028	14	4
15135	1028	15	4
15136	1028	16	6
15137	1028	17	3
15138	1028	18	4
15139	1024	1	7
15140	1024	2	5
15141	1024	3	4
15142	1024	4	4
15143	1024	5	5
15144	1024	6	4
15145	1024	7	3
15146	1024	8	5
15147	1024	9	4
15148	1024	10	4
15149	1024	11	4
15150	1024	12	4
15151	1024	13	4
15152	1024	14	2
15153	1024	15	4
15154	1024	16	5
15155	1024	17	4
15156	1024	18	5
15157	1031	1	4
15158	1031	2	3
15159	1031	3	4
18253	1274	1	8
15160	1031	4	5
15161	1031	5	9
15162	1031	6	4
15163	1031	7	5
15164	1031	8	4
15165	1031	9	4
15166	1031	10	5
15167	1031	11	6
15168	1031	12	4
15169	1031	13	5
15170	1031	14	3
15171	1031	15	4
15172	1031	16	4
15173	1031	17	5
15174	1031	18	9
15175	1034	1	4
15176	1034	2	3
15177	1034	3	3
15178	1034	4	4
15179	1034	5	6
15180	1034	6	4
15181	1034	7	5
15182	1034	8	4
15183	1034	9	3
15184	1034	10	4
15185	1034	11	4
15186	1034	12	4
15187	1034	13	4
15188	1034	14	4
15189	1034	15	3
15190	1034	16	4
15191	1034	17	4
15192	1034	18	5
15193	1035	1	6
15194	1035	2	4
15195	1035	3	6
15196	1035	4	5
15197	1035	5	6
15198	1035	6	8
15199	1035	7	5
15200	1035	8	5
15201	1035	9	4
15202	1035	10	6
15203	1035	11	4
15204	1035	12	6
15205	1035	13	4
15206	1035	14	4
15207	1035	15	3
15208	1035	16	5
15209	1035	17	5
15210	1035	18	8
15211	1020	1	6
15212	1020	2	5
15213	1020	3	4
15214	1020	4	7
15215	1020	5	6
15216	1020	6	5
15217	1020	7	6
15218	1020	8	5
15219	1020	9	3
15220	1020	10	9
15221	1020	11	4
15222	1020	12	4
15223	1020	13	5
15224	1020	14	4
15225	1020	15	5
15226	1020	16	6
15227	1020	17	4
15228	1020	18	7
15229	1042	1	4
15230	1042	2	5
15231	1042	3	5
15232	1042	4	3
15233	1042	5	5
15234	1042	6	6
15235	1042	7	3
15236	1042	8	4
15237	1042	9	3
15238	1042	10	4
15239	1042	11	2
15240	1042	12	4
15241	1042	13	4
15242	1042	14	4
15243	1042	15	4
15244	1042	16	6
15245	1042	17	4
15246	1042	18	5
15247	1049	1	6
15248	1049	2	5
15249	1049	3	5
15250	1049	4	5
15251	1049	5	7
15252	1049	6	3
15253	1049	7	3
15254	1049	8	4
15255	1049	9	3
15256	1049	10	7
15257	1049	11	4
15258	1049	12	7
15259	1049	13	5
15260	1049	14	4
15261	1049	15	4
15262	1049	16	5
15263	1049	17	4
15264	1049	18	4
15265	1025	1	5
15266	1025	2	4
15267	1025	3	5
15268	1025	4	5
15269	1025	5	9
15270	1025	6	4
15271	1025	7	3
15272	1025	8	5
15273	1025	9	4
15274	1025	10	4
15275	1025	11	3
15276	1025	12	4
15277	1025	13	4
15278	1025	14	3
15279	1025	15	4
15280	1025	16	5
15281	1025	17	4
15282	1025	18	5
15283	1030	1	5
15284	1030	2	3
15285	1030	3	5
15286	1030	4	6
15287	1030	5	5
15288	1030	6	5
15289	1030	7	3
15290	1030	8	3
15291	1030	9	4
15292	1030	10	7
15293	1030	11	3
15294	1030	12	5
15295	1030	13	4
15296	1030	14	4
15297	1030	15	4
15298	1030	16	7
15299	1030	17	4
15300	1030	18	4
15301	1026	1	5
15302	1026	2	5
15303	1026	3	5
15304	1026	4	4
15305	1026	5	5
15306	1026	6	5
15307	1026	7	4
15308	1026	8	4
15309	1026	9	4
15310	1026	10	7
15311	1026	11	3
15312	1026	12	4
15313	1026	13	4
15314	1026	14	3
15315	1026	15	4
15316	1026	16	7
15317	1026	17	4
15318	1026	18	7
15319	1036	1	5
15320	1036	2	3
15321	1036	3	4
15322	1036	4	5
15323	1036	5	5
15324	1036	6	5
15325	1036	7	5
15326	1036	8	4
15327	1036	9	3
15328	1036	10	5
15329	1036	11	3
15330	1036	12	4
15331	1036	13	5
15332	1036	14	4
15333	1036	15	3
15334	1036	16	5
15335	1036	17	4
15336	1036	18	4
14851	1014	1	0
15337	1033	1	5
15338	1033	2	3
15339	1033	3	5
15340	1033	4	5
15341	1033	5	8
15342	1033	6	6
15343	1033	7	3
15344	1033	8	3
15345	1033	9	3
15346	1033	10	5
15347	1033	11	2
15348	1033	12	4
15349	1033	13	5
15350	1033	14	3
15351	1033	15	5
15352	1033	16	5
15353	1033	17	5
15354	1033	18	5
15401	1021	11	4
15402	1021	12	6
15403	1021	13	3
15404	1021	14	9
15405	1021	15	5
15355	1032	1	7
15356	1032	2	3
15357	1032	3	6
15358	1032	4	6
15359	1032	5	9
15360	1032	6	5
15361	1032	7	3
15362	1032	8	6
15363	1032	9	4
15364	1032	10	4
15365	1032	11	4
15366	1032	12	5
15367	1032	13	4
15368	1032	14	3
15369	1032	15	4
15370	1032	16	4
15371	1032	17	4
15372	1032	18	5
15406	1021	16	7
15407	1021	17	5
15408	1021	18	5
15409	1023	1	5
15410	1023	2	3
15411	1023	3	5
15412	1023	4	5
15413	1023	5	5
15414	1023	6	4
15415	1023	7	4
15416	1023	8	4
15417	1023	9	3
15418	1023	10	4
15373	1022	1	5
15374	1022	2	4
15375	1022	3	5
15376	1022	4	4
15377	1022	5	6
15378	1022	6	6
15379	1022	7	3
15380	1022	8	4
15381	1022	9	4
15382	1022	10	5
15383	1022	11	3
15384	1022	12	5
15385	1022	13	3
15386	1022	14	5
15387	1022	15	6
15388	1022	16	5
15389	1022	17	4
15390	1022	18	5
15391	1021	1	5
15392	1021	2	7
15393	1021	3	6
15394	1021	4	4
15395	1021	5	7
15396	1021	6	5
15397	1021	7	3
15398	1021	8	3
15399	1021	9	4
15400	1021	10	6
15419	1023	11	2
15420	1023	12	3
15421	1023	13	4
15422	1023	14	3
15423	1023	15	6
15424	1023	16	4
15425	1023	17	5
15426	1023	18	4
15427	989	1	3
15428	989	2	4
15429	989	3	5
15430	989	4	5
15431	989	5	6
15432	989	6	9
15433	989	7	4
15434	989	8	5
15435	989	9	4
15436	989	10	4
15437	989	11	6
15438	989	12	4
15439	989	13	5
15440	989	14	5
15441	989	15	6
15442	989	16	6
15443	989	17	6
15444	989	18	5
15445	984	1	6
15446	984	2	4
15447	984	3	3
15448	984	4	4
15449	984	5	4
15450	984	6	6
15451	984	7	3
15452	984	8	5
15453	984	9	5
15454	984	10	4
15455	984	11	4
15456	984	12	4
15457	984	13	5
15458	984	14	4
15459	984	15	6
15460	984	16	7
15461	984	17	4
15462	984	18	5
15463	1004	73	7
15464	1004	74	4
15465	1004	75	4
15466	1004	76	5
15467	1004	77	7
15468	1004	78	6
15469	1004	79	4
15470	1004	80	5
15471	1004	81	4
15472	1004	82	5
15473	1004	83	6
15474	1004	84	6
15475	1004	85	5
15476	1004	86	4
15477	1004	87	4
15478	1004	88	7
15479	1004	89	7
15480	1004	90	7
15481	985	1	4
15482	985	2	4
15483	985	3	4
15484	985	4	4
15485	985	5	6
15486	985	6	5
15487	985	7	4
15488	985	8	4
15489	985	9	5
15490	985	10	6
15491	985	11	3
15492	985	12	4
15493	985	13	4
15494	985	14	3
15495	985	15	5
15496	985	16	6
15497	985	17	4
15498	985	18	5
15499	999	73	7
15500	999	74	3
15501	999	75	4
15502	999	76	3
15503	999	77	5
15504	999	78	6
15505	999	79	5
15506	999	80	5
15507	999	81	4
15508	999	82	7
15509	999	83	5
15510	999	84	5
15511	999	85	6
15512	999	86	5
15513	999	87	5
15514	999	88	9
15515	999	89	4
15516	999	90	4
15517	997	73	4
15518	997	74	4
15519	997	75	5
15520	997	76	4
15521	997	77	5
15522	997	78	4
15523	997	79	3
15524	997	80	3
15525	997	81	3
15526	997	82	3
15527	997	83	3
15528	997	84	4
15529	997	85	5
15530	997	86	4
15531	997	87	4
15532	997	88	6
15533	997	89	6
15534	997	90	5
15535	990	1	6
15536	990	2	5
15537	990	3	5
15538	990	4	4
15539	990	5	5
15540	990	6	5
15541	990	7	3
15542	990	8	5
15751	1111	1	5
15752	1111	2	3
15753	1111	3	4
15754	1111	4	6
15755	1111	5	4
15756	1111	6	5
15757	1111	7	3
15758	1111	8	4
15759	1111	9	4
15760	1111	10	4
15761	1111	11	4
15762	1111	12	5
15763	1111	13	5
15764	1111	14	4
15765	1111	15	4
15766	1111	16	6
15767	1111	17	5
15768	1111	18	6
15829	1176	7	4
15830	1176	8	5
15831	1176	9	3
15832	1176	10	4
15833	1176	11	3
15834	1176	12	4
15835	1176	13	4
15836	1176	14	4
15837	1176	15	6
15838	1176	16	6
15839	1176	17	6
15840	1176	18	4
15895	1172	73	6
15896	1172	74	5
15897	1172	75	6
15898	1172	76	5
15899	1172	77	6
15900	1172	78	5
15901	1172	79	5
15902	1172	80	5
15903	1172	81	5
15904	1172	82	6
15905	1172	83	4
15906	1172	84	5
15907	1172	85	6
15908	1172	86	6
15909	1172	87	5
15910	1172	88	6
15911	1172	89	5
15912	1172	90	6
15949	1173	1	7
15950	1173	2	5
15951	1173	3	6
15952	1173	4	7
15953	1173	5	7
15954	1173	6	7
16851	1211	3	4
15543	990	9	4
15544	990	10	4
15545	990	11	4
15546	990	12	6
15547	990	13	4
15548	990	14	3
15549	990	15	5
15550	990	16	6
15551	990	17	5
15552	990	18	5
15553	994	73	5
15554	994	74	4
15555	994	75	5
15556	994	76	3
15557	994	77	5
15558	994	78	5
15559	994	79	6
15560	994	80	4
15561	994	81	5
15562	994	82	5
15563	994	83	4
15564	994	84	5
15565	994	85	6
15566	994	86	6
15567	994	87	6
15568	994	88	5
15569	994	89	6
15570	994	90	4
15571	1011	73	4
15572	1011	74	5
15573	1011	75	5
15574	1011	76	4
15575	1011	77	10
15576	1011	78	4
15577	1011	79	4
15578	1011	80	5
15579	1011	81	4
15580	1011	82	5
15581	1011	83	5
15582	1011	84	4
15583	1011	85	4
15584	1011	86	4
15585	1011	87	7
15586	1011	88	7
15587	1011	89	4
15588	1011	90	6
15589	991	73	5
15590	991	74	5
15591	991	75	5
15592	991	76	5
15593	991	77	5
15594	991	78	5
15595	991	79	3
15596	991	80	4
15597	991	81	4
15598	991	82	5
15599	991	83	4
15600	991	84	4
15601	991	85	4
15602	991	86	4
15603	991	87	5
15604	991	88	6
15605	991	89	6
15606	991	90	6
15607	1007	73	7
15608	1007	74	5
15609	1007	75	6
15610	1007	76	6
15611	1007	77	7
15612	1007	78	5
15613	1007	79	5
15614	1007	80	6
15615	1007	81	5
15616	1007	82	5
15617	1007	83	5
15618	1007	84	6
15619	1007	85	7
15620	1007	86	3
15621	1007	87	7
15622	1007	88	6
15623	1007	89	6
15624	1007	90	7
15625	1000	73	7
15626	1000	74	5
15627	1000	75	6
15628	1000	76	7
15629	1000	77	7
15630	1000	78	5
15631	1000	79	4
15632	1000	80	5
15633	1000	81	3
15634	1000	82	5
15635	1000	83	5
15769	1066	1	4
15770	1066	2	4
15771	1066	3	6
15772	1066	4	3
15773	1066	5	4
15774	1066	6	5
15775	1066	7	2
15776	1066	8	4
15777	1066	9	3
15778	1066	10	5
15779	1066	11	4
15780	1066	12	4
15781	1066	13	5
15782	1066	14	5
15783	1066	15	6
15784	1066	16	6
15785	1066	17	6
15786	1066	18	3
15841	1180	1	6
15842	1180	2	4
15843	1180	3	6
15844	1180	4	5
15845	1180	5	6
15846	1180	6	5
15847	1180	7	4
15848	1180	8	4
15849	1180	9	3
15850	1180	10	6
15851	1180	11	2
15852	1180	12	5
15853	1180	13	5
15854	1180	14	4
15855	1180	15	4
15856	1180	16	5
15857	1180	17	5
15858	1180	18	5
15913	1192	1	9
15914	1192	2	4
15915	1192	3	5
15916	1192	4	6
15917	1192	5	8
15918	1192	6	6
15919	1192	7	7
15920	1192	8	5
15921	1192	9	4
15922	1192	10	5
15923	1192	11	5
15924	1192	12	5
15925	1192	13	4
15926	1192	14	6
15927	1192	15	6
15928	1192	16	10
15929	1192	17	5
15636	1000	84	8
15637	1000	85	5
15638	1000	86	7
15639	1000	87	5
15640	1000	88	7
15641	1000	89	5
15642	1000	90	6
15643	992	73	4
15644	992	74	5
15645	992	75	6
15646	992	76	5
15647	992	77	6
15648	992	78	4
15649	992	79	5
15650	992	80	5
15651	992	81	4
15652	992	82	8
15653	992	83	4
15654	992	84	4
15655	992	85	3
15656	992	86	2
15657	992	87	4
15658	992	88	5
15659	992	89	5
15660	992	90	5
15661	996	73	9
15662	996	74	3
15663	996	75	5
15664	996	76	4
15665	996	77	6
15666	996	78	6
15667	996	79	3
15668	996	80	5
15669	996	81	3
15670	996	82	4
15671	996	83	4
15672	996	84	4
15673	996	85	4
15674	996	86	5
15675	996	87	4
15676	996	88	7
15677	996	89	5
15678	996	90	8
15679	987	1	5
15680	987	2	5
15681	987	3	4
15682	987	4	4
15683	987	5	5
15684	987	6	5
15685	987	7	3
15686	987	8	5
15687	987	9	5
15688	987	10	3
15689	987	11	3
15690	987	12	4
15691	987	13	4
15692	987	14	4
15693	987	15	5
15694	987	16	5
15695	987	17	3
15696	987	18	5
17840	1227	2	6
17841	1227	3	5
17842	1227	4	5
17843	1227	5	5
17844	1227	6	4
17845	1227	7	4
17846	1227	8	5
17847	1227	9	3
17848	1227	10	5
17849	1227	11	2
17850	1227	12	5
17851	1227	13	4
17852	1227	14	3
17853	1227	15	4
17854	1227	16	5
17855	1227	17	5
17856	1227	18	6
17893	1233	1	6
15715	986	1	5
15716	986	2	4
15717	986	3	5
15718	986	4	5
15719	986	5	7
15720	986	6	5
15721	986	7	4
15722	986	8	7
15723	986	9	3
15724	986	10	4
15725	986	11	5
15726	986	12	4
15727	986	13	5
15787	1106	1	5
15788	1106	2	4
15789	1106	3	5
15790	1106	4	4
15791	1106	5	7
15792	1106	6	6
15793	1106	7	5
15794	1106	8	4
15795	1106	9	4
15796	1106	10	5
15797	1106	11	4
15798	1106	12	5
15799	1106	13	4
15800	1106	14	4
15801	1106	15	4
15802	1106	16	5
15803	1106	17	6
15804	1106	18	8
15859	1181	1	7
15860	1181	2	3
15861	1181	3	5
15862	1181	4	5
15863	1181	5	4
15864	1181	6	5
15865	1181	7	4
15866	1181	8	5
15867	1181	9	4
15868	1181	10	5
15869	1181	11	5
15870	1181	12	7
15871	1181	13	4
15872	1181	14	6
15873	1181	15	4
15874	1181	16	6
15875	1181	17	7
15876	1181	18	5
15930	1192	18	5
15955	1173	7	6
15956	1173	8	6
15957	1173	9	5
15958	1173	10	6
15959	1173	11	5
15960	1173	12	6
15961	1173	13	6
15962	1173	14	6
15963	1173	15	7
15964	1173	16	6
15965	1173	17	6
15966	1173	18	7
15985	1112	1	4
15986	1112	2	4
15987	1112	3	4
15988	1112	4	4
15989	1112	5	7
15728	986	14	4
15729	986	15	3
15730	986	16	4
15731	986	17	5
15732	986	18	7
15733	995	73	5
15734	995	74	3
15735	995	75	4
15736	995	76	4
15737	995	77	4
15738	995	78	5
15739	995	79	4
15740	995	80	4
15741	995	81	4
15742	995	82	5
15743	995	83	4
15744	995	84	5
15745	995	85	4
15746	995	86	3
15747	995	87	5
15748	995	88	7
15749	995	89	5
15750	995	90	4
15805	1188	73	8
15806	1188	74	4
15807	1188	75	6
15808	1188	76	5
15809	1188	77	5
15810	1188	78	6
15811	1188	79	4
15812	1188	80	6
15813	1188	81	5
15814	1188	82	4
15815	1188	83	4
15816	1188	84	5
15817	1188	85	6
15818	1188	86	3
15819	1188	87	5
15820	1188	88	6
15821	1188	89	6
15822	1188	90	6
15877	1177	1	5
15878	1177	2	4
15879	1177	3	7
15880	1177	4	6
15881	1177	5	8
15882	1177	6	5
15883	1177	7	4
15884	1177	8	6
15885	1177	9	4
15886	1177	10	5
15887	1177	11	3
15888	1177	12	4
15889	1177	13	6
15890	1177	14	4
15891	1177	15	6
15892	1177	16	8
15893	1177	17	6
15894	1177	18	7
15931	1184	1	6
15932	1184	2	3
15933	1184	3	6
15934	1184	4	6
15935	1184	5	7
15936	1184	6	4
15937	1184	7	4
15938	1184	8	4
15939	1184	9	4
15940	1184	10	5
15941	1184	11	3
15942	1184	12	5
15943	1184	13	7
15944	1184	14	2
15945	1184	15	5
15946	1184	16	6
15947	1184	17	6
15948	1184	18	5
15967	1067	1	6
15968	1067	2	3
15969	1067	3	5
15970	1067	4	6
15971	1067	5	5
15972	1067	6	3
15973	1067	7	3
15974	1067	8	4
15975	1067	9	3
15976	1067	10	3
15977	1067	11	4
15978	1067	12	5
15979	1067	13	3
15980	1067	14	3
15981	1067	15	4
15982	1067	16	4
15983	1067	17	4
15984	1067	18	8
15990	1112	6	4
15991	1112	7	4
15992	1112	8	4
15993	1112	9	4
15994	1112	10	3
15995	1112	11	3
15996	1112	12	6
15997	1112	13	4
15998	1112	14	4
15999	1112	15	4
16000	1112	16	9
16001	1112	17	5
16002	1112	18	5
16003	1187	73	7
16004	1187	74	5
16005	1187	75	5
16006	1187	76	4
16007	1187	77	5
16008	1187	78	4
16009	1187	79	4
16010	1187	80	4
16011	1187	81	5
16012	1187	82	3
16013	1187	83	3
16014	1187	84	5
16015	1187	85	3
16016	1187	86	4
16017	1187	87	3
16018	1187	88	7
16019	1187	89	5
16020	1187	90	4
16021	1193	73	7
16022	1193	74	4
16023	1193	75	5
16024	1193	76	4
16025	1193	77	4
16026	1193	78	6
16027	1193	79	4
16028	1193	80	4
16029	1193	81	4
16030	1193	82	4
16031	1193	83	4
16032	1193	84	5
16033	1193	85	6
16034	1193	86	3
16035	1193	87	4
16036	1193	88	7
16037	1193	89	3
16038	1193	90	5
16039	1166	73	5
16040	1166	74	5
16041	1166	75	6
16042	1166	76	6
16043	1166	77	7
16044	1166	78	4
16045	1166	79	2
16046	1166	80	4
16047	1166	81	3
16048	1166	82	4
16049	1166	83	6
16050	1166	84	4
16051	1166	85	5
16052	1166	86	5
16053	1166	87	4
16054	1166	88	9
16055	1166	89	4
16056	1166	90	5
16057	1171	73	5
16058	1171	74	5
16059	1171	75	4
16060	1171	76	8
16061	1171	77	6
16062	1171	78	5
16063	1171	79	4
16064	1171	80	5
16065	1171	81	5
16066	1171	82	5
16067	1171	83	5
16068	1171	84	6
16069	1171	85	5
16070	1171	86	4
16071	1171	87	4
16072	1171	88	6
16073	1171	89	6
16074	1171	90	5
16075	1164	1	4
16076	1164	2	4
16077	1164	3	5
16078	1164	4	5
16079	1164	5	7
16080	1164	6	4
16081	1164	7	4
16082	1164	8	5
16083	1164	9	2
16084	1164	10	4
16085	1164	11	3
16086	1164	12	4
16087	1164	13	5
16088	1164	14	4
16089	1164	15	5
16090	1164	16	6
16091	1164	17	5
16092	1164	18	5
16093	1102	1	5
16094	1102	2	4
16095	1102	3	7
16096	1102	4	4
16097	1102	5	5
16098	1102	6	4
16099	1102	7	4
16100	1102	8	4
16101	1102	9	4
16102	1102	10	4
16103	1102	11	2
16104	1102	12	4
16105	1102	13	5
16106	1102	14	4
16107	1102	15	4
16108	1102	16	6
16109	1102	17	4
16110	1102	18	4
16111	1082	1	5
16112	1082	2	4
16113	1082	3	4
16114	1082	4	4
16115	1082	5	6
16116	1082	6	3
16117	1082	7	3
16118	1082	8	3
16119	1082	9	3
16120	1082	10	4
16121	1082	11	3
16122	1082	12	5
16123	1082	13	4
16124	1082	14	2
16125	1082	15	4
16126	1082	16	6
16127	1082	17	4
16128	1082	18	4
16129	1105	1	5
16130	1105	2	3
16131	1105	3	6
16132	1105	4	4
16133	1105	5	6
16134	1105	6	6
16135	1105	7	5
16136	1105	8	3
16137	1105	9	3
16138	1105	10	7
16139	1105	11	3
16140	1105	12	5
16141	1105	13	5
16142	1105	14	3
16143	1105	15	4
16144	1105	16	6
16145	1105	17	4
16146	1105	18	6
16147	1113	1	6
16148	1113	2	4
16149	1113	3	4
16150	1113	4	5
16151	1113	5	4
16152	1113	6	7
16153	1113	7	3
16154	1113	8	3
16155	1113	9	2
16156	1113	10	4
16157	1113	11	3
16158	1113	12	5
16159	1113	13	4
16160	1113	14	4
16161	1113	15	5
16162	1113	16	6
16163	1113	17	5
16164	1113	18	5
16165	1109	1	6
16166	1109	2	4
16167	1109	3	5
16168	1109	4	5
16169	1109	5	9
16170	1109	6	4
16171	1109	7	6
16172	1109	8	4
16173	1109	9	4
16174	1109	10	5
16175	1109	11	3
16176	1109	12	4
16177	1109	13	6
16178	1109	14	5
16179	1109	15	4
16180	1109	16	6
16181	1109	17	5
16182	1109	18	5
16183	1072	1	6
16184	1072	2	3
16185	1072	3	4
18254	1274	2	4
16186	1072	4	4
16187	1072	5	4
16188	1072	6	4
16189	1072	7	4
16190	1072	8	3
16191	1072	9	3
16192	1072	10	4
16193	1072	11	3
16194	1072	12	5
16195	1072	13	3
16196	1072	14	3
16197	1072	15	4
16198	1072	16	6
16199	1072	17	3
16200	1072	18	4
16201	1108	1	5
16202	1108	2	4
16203	1108	3	5
16204	1108	4	5
16205	1108	5	6
16206	1108	6	4
16207	1108	7	6
16208	1108	8	8
16209	1108	9	5
16210	1108	10	4
16211	1108	11	4
16212	1108	12	4
16213	1108	13	4
16214	1108	14	3
16215	1108	15	5
16216	1108	16	5
16217	1108	17	6
16218	1108	18	7
16219	1078	1	4
16220	1078	2	4
16221	1078	3	4
16222	1078	4	6
16223	1078	5	4
16224	1078	6	7
16225	1078	7	3
16226	1078	8	4
16227	1078	9	4
16228	1078	10	5
16229	1078	11	2
16230	1078	12	4
16231	1078	13	6
16232	1078	14	3
16233	1078	15	4
16234	1078	16	6
16235	1078	17	5
16236	1078	18	5
16237	1107	1	7
16238	1107	2	5
16239	1107	3	5
16240	1107	4	6
16241	1107	5	5
16242	1107	6	4
16243	1107	7	3
16244	1107	8	4
16245	1107	9	3
16246	1107	10	4
16247	1107	11	3
16248	1107	12	5
16249	1107	13	4
16250	1107	14	5
16251	1107	15	4
16252	1107	16	6
16253	1107	17	4
16254	1107	18	4
16255	1110	1	6
16256	1110	2	4
16257	1110	3	6
16258	1110	4	6
16259	1110	5	6
16260	1110	6	5
16261	1110	7	4
16262	1110	8	5
16263	1110	9	5
16264	1110	10	6
16265	1110	11	5
16266	1110	12	4
16267	1110	13	5
16268	1110	14	3
16269	1110	15	6
16270	1110	16	7
16271	1110	17	7
16272	1110	18	5
16273	1179	73	5
16274	1179	74	4
16275	1179	75	5
16276	1179	76	4
16277	1179	77	4
16278	1179	78	5
16279	1179	79	3
16280	1179	80	4
16281	1179	81	4
16282	1179	82	5
16283	1179	83	3
16284	1179	84	4
16285	1179	85	5
16286	1179	86	3
16287	1179	87	4
16288	1179	88	6
16289	1179	89	3
16290	1179	90	5
16291	1175	73	4
16292	1175	74	4
16293	1175	75	4
16294	1175	76	4
16295	1175	77	4
16296	1175	78	5
16297	1175	79	6
16298	1175	80	4
16299	1175	81	4
16300	1175	82	6
16301	1175	83	3
16302	1175	84	5
16303	1175	85	5
16304	1175	86	3
16305	1175	87	7
16306	1175	88	6
16307	1175	89	7
16308	1175	90	5
16309	1182	1	7
16310	1182	2	3
16311	1182	3	5
16312	1182	4	8
16313	1182	5	3
16314	1182	6	6
16315	1182	7	4
16316	1182	8	4
16317	1182	9	4
16318	1182	10	9
16319	1182	11	4
16320	1182	12	5
16321	1182	13	4
16322	1182	14	3
16323	1182	15	5
16324	1182	16	6
16325	1182	17	5
16326	1182	18	5
16327	1100	1	4
16328	1100	2	2
16329	1100	3	5
16330	1100	4	5
16331	1100	5	8
16332	1100	6	5
16333	1100	7	3
16334	1100	8	5
16335	1100	9	3
16336	1100	10	4
16337	1100	11	4
16338	1100	12	4
16339	1100	13	4
16340	1100	14	4
16341	1100	15	5
16342	1100	16	5
16343	1100	17	4
16344	1100	18	4
16345	1075	1	7
16346	1075	2	5
16347	1075	3	4
16348	1075	4	4
16349	1075	5	5
16350	1075	6	6
16351	1075	7	3
16352	1075	8	3
16353	1075	9	3
16354	1075	10	4
16355	1075	11	3
16356	1075	12	4
16357	1075	13	4
16358	1075	14	4
16359	1075	15	3
16360	1075	16	6
16361	1075	17	7
16362	1075	18	4
16397	1079	17	4
16398	1079	18	8
16399	1099	1	4
16400	1099	2	7
16401	1099	3	5
16402	1099	4	3
16403	1099	5	5
16404	1099	6	5
16405	1099	7	2
16406	1099	8	3
16407	1099	9	4
16408	1099	10	4
16409	1099	11	3
16410	1099	12	2
16411	1099	13	4
16412	1099	14	3
16413	1099	15	5
16414	1099	16	5
16363	1074	1	5
16364	1074	2	5
16365	1074	3	3
16366	1074	4	3
16367	1074	5	6
16368	1074	6	5
16369	1074	7	3
16370	1074	8	4
16371	1074	9	4
16372	1074	10	5
16373	1074	11	3
16374	1074	12	4
16375	1074	13	5
16376	1074	14	3
16377	1074	15	5
16378	1074	16	5
16379	1074	17	4
16380	1074	18	5
16381	1079	1	5
16382	1079	2	3
16383	1079	3	5
16384	1079	4	5
16385	1079	5	6
16386	1079	6	4
16387	1079	7	2
16388	1079	8	4
16389	1079	9	3
16390	1079	10	5
16391	1079	11	3
16392	1079	12	3
16393	1079	13	4
16394	1079	14	4
16395	1079	15	4
16396	1079	16	4
16415	1099	17	4
16416	1099	18	5
16417	1083	1	5
16418	1083	2	5
16419	1083	3	4
16420	1083	4	5
16421	1083	5	5
16422	1083	6	4
16423	1083	7	3
16424	1083	8	4
16425	1083	9	3
16426	1083	10	5
16427	1083	11	3
16428	1083	12	4
16429	1083	13	4
16430	1083	14	4
16431	1083	15	5
16432	1083	16	5
16433	1083	17	4
16434	1083	18	4
16435	1087	1	6
16436	1087	2	3
16437	1087	3	4
16438	1087	4	5
16439	1087	5	4
16440	1087	6	7
16441	1087	7	4
16442	1087	8	4
16443	1087	9	4
16444	1087	10	6
16445	1087	11	2
16446	1087	12	3
16447	1087	13	4
16448	1087	14	4
16449	1087	15	6
16450	1087	16	6
16451	1087	17	5
16452	1087	18	6
16453	1093	1	6
16454	1093	2	4
16455	1093	3	5
16456	1093	4	4
16457	1093	5	4
16458	1093	6	4
16459	1093	7	6
16460	1093	8	4
16461	1093	9	3
16462	1093	10	5
16463	1093	11	3
16464	1093	12	4
16465	1093	13	4
16466	1093	14	4
16467	1093	15	4
16468	1093	16	6
16469	1093	17	5
16470	1093	18	4
16471	1183	73	5
16472	1183	74	5
16473	1183	75	6
16474	1183	76	6
16475	1183	77	7
16476	1183	78	5
16852	1211	4	6
16477	1183	79	2
16478	1183	80	3
16479	1183	81	4
16480	1183	82	5
16481	1183	83	5
16482	1183	84	4
16483	1183	85	4
16484	1183	86	5
16485	1183	87	5
16486	1183	88	7
16487	1183	89	5
16488	1183	90	6
16489	1169	1	6
16490	1169	2	4
16491	1169	3	6
16492	1169	4	4
16493	1169	5	7
16494	1169	6	7
16495	1169	7	4
16496	1169	8	5
16497	1169	9	4
16498	1169	10	5
16499	1169	11	3
16500	1169	12	6
16501	1169	13	5
16502	1169	14	4
16503	1169	15	4
16504	1169	16	5
16505	1169	17	6
16506	1169	18	7
16507	1174	1	5
16508	1174	2	4
16509	1174	3	4
16510	1174	4	4
16511	1174	5	5
16512	1174	6	4
16513	1174	7	3
16514	1174	8	4
16515	1174	9	3
16516	1174	10	4
16517	1174	11	3
16518	1174	12	6
16519	1174	13	4
16520	1174	14	3
16521	1174	15	4
16522	1174	16	6
16523	1174	17	5
16524	1174	18	7
16525	1170	73	7
16526	1170	74	4
16527	1170	75	5
16528	1170	76	5
16529	1170	77	6
16530	1170	78	4
16531	1170	79	3
16532	1170	80	4
16533	1170	81	4
16534	1170	82	6
16535	1170	83	3
16536	1170	84	5
16537	1170	85	5
16538	1170	86	4
16539	1170	87	4
16540	1170	88	7
16541	1170	89	4
16542	1170	90	8
16543	1190	73	5
16544	1190	74	4
16545	1190	75	5
16546	1190	76	5
16547	1190	77	4
16548	1190	78	6
16549	1190	79	6
16550	1190	80	5
16551	1190	81	4
16552	1190	82	6
16553	1190	83	3
16554	1190	84	4
16555	1190	85	4
16556	1190	86	3
16557	1190	87	6
16558	1190	88	5
16559	1190	89	6
16560	1190	90	4
16561	1097	1	5
16562	1097	2	7
16563	1097	3	5
16564	1097	4	4
16565	1097	5	6
16566	1097	6	6
16567	1097	7	5
16568	1097	8	4
16569	1097	9	3
16570	1097	10	4
16571	1097	11	4
16572	1097	12	5
16573	1097	13	5
16574	1097	14	7
16575	1097	15	5
16576	1097	16	8
16577	1097	17	6
16578	1097	18	5
16579	1091	1	4
16580	1091	2	4
16581	1091	3	7
16582	1091	4	5
16583	1091	5	5
16584	1091	6	7
16585	1091	7	3
16586	1091	8	3
16587	1091	9	3
16588	1091	10	6
16589	1091	11	3
16590	1091	12	4
16591	1091	13	4
16592	1091	14	4
16593	1091	15	4
16594	1091	16	4
16595	1091	17	5
16596	1091	18	6
16597	1086	1	5
16598	1086	2	4
16599	1086	3	4
16600	1086	4	4
16601	1086	5	5
16602	1086	6	4
16603	1086	7	3
16604	1086	8	5
16605	1086	9	4
16606	1086	10	5
16607	1086	11	3
16608	1086	12	4
16609	1086	13	4
16610	1086	14	4
16611	1086	15	3
16612	1086	16	5
16613	1086	17	4
16614	1086	18	7
16615	1104	1	5
16616	1104	2	4
16617	1104	3	6
16618	1104	4	4
16619	1104	5	5
16620	1104	6	4
16621	1104	7	6
16622	1104	8	4
16623	1104	9	4
16624	1104	10	5
16625	1104	11	4
16626	1104	12	4
16627	1104	13	4
16628	1104	14	4
16629	1104	15	4
16630	1104	16	6
16631	1104	17	4
16632	1104	18	5
16633	1069	1	4
16634	1069	2	4
16635	1069	3	4
16636	1069	4	5
16637	1069	5	4
16638	1069	6	4
16639	1069	7	3
16640	1069	8	4
16641	1069	9	3
16642	1069	10	4
16643	1069	11	4
16644	1069	12	5
16645	1069	13	4
16646	1069	14	3
16647	1069	15	4
16648	1069	16	8
16649	1069	17	5
16650	1069	18	5
16651	1096	1	6
16652	1096	2	4
16653	1096	3	6
16654	1096	4	5
16655	1096	5	5
16656	1096	6	4
16657	1096	7	3
16658	1096	8	3
16659	1096	9	5
16660	1096	10	7
16661	1096	11	4
16662	1096	12	4
16663	1096	13	5
16664	1096	14	4
16665	1096	15	4
16666	1096	16	7
16667	1096	17	5
16668	1096	18	6
16669	1165	73	6
16670	1165	74	7
16671	1165	75	5
16672	1165	76	6
16673	1165	77	4
16674	1165	78	4
16675	1165	79	5
16676	1165	80	6
16677	1165	81	5
16678	1165	82	5
16679	1165	83	3
16680	1165	84	7
16681	1165	85	5
16682	1165	86	5
16683	1165	87	5
16684	1165	88	4
16685	1165	89	4
16686	1165	90	6
16687	1090	1	9
16688	1090	2	5
16689	1090	3	6
16690	1090	4	8
16691	1090	5	9
16692	1090	6	6
16693	1090	7	6
16694	1090	8	5
16695	1090	9	4
16696	1090	10	6
16697	1090	11	2
16698	1090	12	4
16699	1090	13	5
16700	1090	14	3
16701	1090	15	5
16702	1090	16	6
16703	1090	17	5
16704	1090	18	4
16705	1088	1	5
16706	1088	2	4
16707	1088	3	5
16708	1088	4	4
16709	1088	5	6
16710	1088	6	4
16711	1088	7	3
16712	1088	8	5
16713	1088	9	4
16714	1088	10	4
16715	1088	11	4
16716	1088	12	4
16717	1088	13	6
16718	1088	14	4
16719	1088	15	5
16720	1088	16	6
16721	1088	17	5
16722	1088	18	5
16723	1084	1	5
16724	1084	2	4
16725	1084	3	4
16726	1084	4	5
16727	1084	5	6
16728	1084	6	6
16729	1084	7	3
16730	1084	8	4
16731	1084	9	3
16732	1084	10	4
16733	1084	11	3
16734	1084	12	4
16735	1084	13	4
16736	1084	14	3
16737	1084	15	4
16738	1084	16	4
16739	1084	17	4
16740	1084	18	6
16741	1073	1	5
16742	1073	2	4
16743	1073	3	5
16744	1073	4	4
16745	1073	5	5
16746	1073	6	4
16747	1073	7	4
16748	1073	8	4
16749	1073	9	4
16750	1073	10	4
16751	1073	11	2
16752	1073	12	4
16753	1073	13	4
16754	1073	14	3
16755	1073	15	4
16756	1073	16	4
16757	1073	17	3
16758	1073	18	4
16759	1077	1	4
16760	1077	2	3
16761	1077	3	4
16762	1077	4	6
16763	1077	5	6
16764	1077	6	5
16765	1077	7	3
16766	1077	8	4
16767	1077	9	4
17857	1238	1	5
16768	1077	10	4
16769	1077	11	3
16770	1077	12	5
16771	1077	13	4
16772	1077	14	4
16773	1077	15	5
16774	1077	16	4
16775	1077	17	5
16776	1077	18	5
16777	1092	1	5
16778	1092	2	3
16779	1092	3	5
16780	1092	4	4
16781	1092	5	6
16782	1092	6	6
16783	1092	7	4
16784	1092	8	5
16785	1092	9	4
16786	1092	10	4
16787	1092	11	4
16788	1092	12	4
16789	1092	13	5
16790	1092	14	3
16791	1092	15	5
16792	1092	16	6
16793	1092	17	4
16794	1092	18	7
17858	1238	2	4
17859	1238	3	5
17860	1238	4	6
17861	1238	5	6
17862	1238	6	5
17863	1238	7	5
17864	1238	8	4
17865	1238	9	5
17866	1238	10	4
17867	1238	11	4
17868	1238	12	5
17869	1238	13	5
17870	1238	14	4
17871	1238	15	5
17872	1238	16	9
17873	1238	17	5
17874	1238	18	5
17894	1233	2	3
16813	1189	1	5
16814	1189	2	4
16815	1189	3	4
16816	1189	4	5
16817	1189	5	4
16818	1189	6	8
16819	1189	7	6
16820	1189	8	4
16821	1189	9	4
16822	1189	10	6
16823	1189	11	5
16824	1189	12	4
16825	1189	13	5
16826	1189	14	4
16827	1189	15	4
16828	1189	16	4
16829	1189	17	6
16830	1189	18	6
16831	1103	1	7
16832	1103	2	6
16833	1103	3	6
16834	1103	4	6
16835	1103	5	6
16836	1103	6	5
16837	1103	7	8
16838	1103	8	5
16839	1103	9	4
16840	1103	10	5
16841	1103	11	5
16842	1103	12	4
16843	1103	13	5
16844	1103	14	5
16845	1103	15	4
16846	1103	16	5
16847	1103	17	4
16848	1103	18	5
16853	1211	5	6
16854	1211	6	5
16855	1211	7	3
16856	1211	8	6
16857	1211	9	3
16858	1211	10	5
16859	1211	11	5
16860	1211	12	4
16861	1211	13	5
16862	1211	14	3
16863	1211	15	5
16864	1211	16	6
16865	1211	17	6
16866	1211	18	4
16867	1206	1	5
16868	1206	2	4
16869	1206	3	6
16870	1206	4	5
16871	1206	5	4
16872	1206	6	5
16873	1206	7	5
16874	1206	8	4
16875	1206	9	4
16876	1206	10	4
16877	1206	11	3
16878	1206	12	5
16879	1206	13	5
16880	1206	14	4
16881	1206	15	5
16882	1206	16	7
16883	1206	17	5
16884	1206	18	4
16885	1210	1	5
16886	1210	2	4
16887	1210	3	5
16888	1210	4	3
16889	1210	5	6
16890	1210	6	5
16891	1210	7	5
16892	1210	8	5
16893	1210	9	4
16894	1210	10	4
16895	1210	11	4
16896	1210	12	4
16897	1210	13	4
16898	1210	14	4
16899	1210	15	4
16900	1210	16	6
16901	1210	17	6
16902	1210	18	4
16903	1203	1	6
16904	1203	2	6
16905	1203	3	6
16906	1203	4	6
16907	1203	5	7
16908	1203	6	6
16909	1203	7	6
16910	1203	8	8
16911	1203	9	4
16912	1203	10	6
16913	1203	11	4
16914	1203	12	5
16915	1203	13	6
16916	1203	14	6
16917	1203	15	6
17895	1233	3	4
16918	1203	16	7
16919	1203	17	6
16920	1203	18	8
16921	1222	1	6
16922	1222	2	4
16923	1222	3	5
16924	1222	4	6
16925	1222	5	8
16926	1222	6	6
16927	1222	7	4
16928	1222	8	5
16929	1222	9	5
16930	1222	10	6
16931	1222	11	6
16932	1222	12	4
16933	1222	13	6
16934	1222	14	4
16935	1222	15	11
16936	1222	16	7
16937	1222	17	7
16938	1222	18	6
16939	1207	1	7
16940	1207	2	6
16941	1207	3	7
16942	1207	4	6
16943	1207	5	6
16944	1207	6	6
16945	1207	7	3
16946	1207	8	6
16947	1207	9	6
16948	1207	10	5
16949	1207	11	6
16950	1207	12	5
16951	1207	13	6
16952	1207	14	4
16953	1207	15	4
16954	1207	16	8
16955	1207	17	6
16956	1207	18	5
16957	1157	1	6
16958	1157	2	5
16959	1157	3	4
16960	1157	4	5
16961	1157	5	4
16962	1157	6	4
16963	1157	7	6
16964	1157	8	5
16965	1157	9	3
16966	1157	10	6
16967	1157	11	3
16968	1157	12	6
16969	1157	13	7
16970	1157	14	3
16971	1157	15	6
16972	1157	16	5
16973	1157	17	5
16974	1157	18	5
16975	1161	1	5
16976	1161	2	4
16977	1161	3	4
16978	1161	4	4
16979	1161	5	4
16980	1161	6	4
16981	1161	7	4
16982	1161	8	4
16983	1161	9	3
16984	1161	10	3
16985	1161	11	3
16986	1161	12	4
16987	1161	13	4
16988	1161	14	4
16989	1161	15	4
16990	1161	16	4
16991	1161	17	4
16992	1161	18	5
16993	1217	73	4
16994	1217	74	4
16995	1217	75	5
16996	1217	76	4
16997	1217	77	5
16998	1217	78	5
16999	1217	79	3
17000	1217	80	4
17001	1217	81	4
17002	1217	82	4
17003	1217	83	3
17004	1217	84	5
17005	1217	85	3
17006	1217	86	4
17007	1217	87	4
17008	1217	88	7
17009	1217	89	6
17010	1217	90	4
17011	1202	73	6
17012	1202	74	5
17013	1202	75	5
17014	1202	76	6
17015	1202	77	8
17016	1202	78	6
17017	1202	79	9
17018	1202	80	6
17019	1202	81	4
17020	1202	82	5
17021	1202	83	4
17022	1202	84	5
17023	1202	85	6
17024	1202	86	5
17025	1202	87	5
17026	1202	88	6
17027	1202	89	7
17028	1202	90	5
17029	1218	73	6
17030	1218	74	4
17031	1218	75	6
17032	1218	76	6
17033	1218	77	7
17034	1218	78	6
17035	1218	79	3
17036	1218	80	5
17037	1218	81	5
17038	1218	82	5
17039	1218	83	3
17040	1218	84	7
17041	1218	85	5
17042	1218	86	5
17043	1218	87	5
17044	1218	88	7
17045	1218	89	6
17046	1218	90	7
17047	1214	1	6
17048	1214	2	2
17049	1214	3	7
17050	1214	4	5
17051	1214	5	5
17052	1214	6	5
17053	1214	7	4
17054	1214	8	5
17055	1214	9	4
17056	1214	10	8
17057	1214	11	4
17058	1214	12	4
17059	1214	13	4
17060	1214	14	4
17061	1214	15	4
17062	1214	16	6
17063	1214	17	5
17064	1214	18	5
17065	1116	1	5
17066	1116	2	3
17067	1116	3	5
17068	1116	4	4
17069	1116	5	6
17070	1116	6	5
17071	1116	7	3
17072	1116	8	3
17073	1116	9	3
17074	1116	10	4
17075	1116	11	3
17076	1116	12	4
17077	1116	13	5
17078	1116	14	4
17079	1116	15	4
17080	1116	16	5
17081	1116	17	5
17082	1116	18	5
17138	1146	2	4
17139	1146	3	5
17140	1146	4	4
17141	1146	5	8
17142	1146	6	4
17143	1146	7	3
17144	1146	8	5
17145	1146	9	4
17146	1146	10	4
17083	1117	1	5
17084	1117	2	4
17085	1117	3	4
17086	1117	4	4
17087	1117	5	5
17088	1117	6	4
17089	1117	7	3
17090	1117	8	4
17091	1117	9	3
17092	1117	10	5
17093	1117	11	2
17094	1117	12	3
17095	1117	13	4
17096	1117	14	3
17097	1117	15	4
17098	1117	16	5
17099	1117	17	4
17100	1117	18	4
17101	1162	1	5
17102	1162	2	4
17103	1162	3	5
17104	1162	4	5
17105	1162	5	7
17106	1162	6	6
17107	1162	7	3
17108	1162	8	5
17109	1162	9	4
17110	1162	10	5
17111	1162	11	4
17112	1162	12	5
17113	1162	13	3
17114	1162	14	4
17115	1162	15	4
17116	1162	16	7
17117	1162	17	5
17118	1162	18	6
17119	1128	1	5
17120	1128	2	3
17121	1128	3	5
17122	1128	4	5
17123	1128	5	5
17124	1128	6	5
17125	1128	7	3
17126	1128	8	4
17127	1128	9	3
17128	1128	10	5
17129	1128	11	3
17130	1128	12	4
17131	1128	13	4
17132	1128	14	3
17133	1128	15	4
17134	1128	16	5
17135	1128	17	4
17136	1128	18	7
17137	1146	1	6
17147	1146	11	4
17148	1146	12	4
17149	1146	13	4
17150	1146	14	3
17151	1146	15	4
17152	1146	16	5
17153	1146	17	4
17154	1146	18	4
17155	1194	1	6
17156	1194	2	4
17157	1194	3	5
17158	1194	4	5
17159	1194	5	5
17160	1194	6	3
17161	1194	7	4
17162	1194	8	3
17163	1194	9	3
17164	1194	10	5
17165	1194	11	4
17166	1194	12	4
17167	1194	13	4
17168	1194	14	3
17169	1194	15	4
17170	1194	16	5
17171	1194	17	4
17172	1194	18	7
17173	1163	1	4
17174	1163	2	5
17175	1163	3	5
17176	1163	4	4
17177	1163	5	6
17178	1163	6	5
17179	1163	7	2
17180	1163	8	4
17181	1163	9	4
17182	1163	10	8
17183	1163	11	3
17184	1163	12	5
17185	1163	13	4
17186	1163	14	3
17187	1163	15	4
17188	1163	16	5
17189	1163	17	6
17190	1163	18	7
17191	1156	1	5
17192	1156	2	4
17193	1156	3	5
17194	1156	4	5
17195	1156	5	6
17196	1156	6	5
17197	1156	7	5
17198	1156	8	5
17199	1156	9	4
17200	1156	10	6
17201	1156	11	4
17202	1156	12	5
17203	1156	13	5
17204	1156	14	6
17205	1156	15	5
17206	1156	16	5
17207	1156	17	5
17208	1156	18	7
17209	1125	1	4
17210	1125	2	5
17211	1125	3	4
17212	1125	4	4
17213	1125	5	7
17214	1125	6	5
17215	1125	7	4
17216	1125	8	4
17217	1125	9	4
17218	1125	10	4
17219	1125	11	3
17220	1125	12	4
17221	1125	13	4
17222	1125	14	4
17223	1125	15	4
17224	1125	16	4
17225	1125	17	4
17226	1125	18	5
17227	1154	1	5
17228	1154	2	4
17229	1154	3	5
17230	1154	4	4
17231	1154	5	6
17232	1154	6	5
17233	1154	7	3
17234	1154	8	4
17235	1154	9	4
17236	1154	10	6
17237	1154	11	4
17238	1154	12	4
17239	1154	13	5
17240	1154	14	2
17241	1154	15	4
17242	1154	16	5
17243	1154	17	3
17244	1154	18	5
17245	1152	1	5
17246	1152	2	4
17247	1152	3	5
17248	1152	4	5
17249	1152	5	5
17250	1152	6	6
17251	1152	7	3
17252	1152	8	4
17253	1152	9	3
17254	1152	10	5
17255	1152	11	3
17256	1152	12	4
17257	1152	13	5
17258	1152	14	4
17259	1152	15	6
17260	1152	16	8
17261	1152	17	4
17262	1152	18	8
17263	1158	1	6
17264	1158	2	3
17265	1158	3	6
17266	1158	4	4
17267	1158	5	5
17268	1158	6	6
17269	1158	7	3
17270	1158	8	4
17271	1158	9	3
17272	1158	10	9
17273	1158	11	6
17274	1158	12	4
17275	1158	13	5
17276	1158	14	3
17277	1158	15	5
17278	1158	16	9
17279	1158	17	5
17280	1158	18	6
17281	1159	1	4
17282	1159	2	4
17283	1159	3	6
17284	1159	4	5
17285	1159	5	4
17286	1159	6	5
17287	1159	7	4
17288	1159	8	4
17289	1159	9	4
17290	1159	10	8
17291	1159	11	5
17292	1159	12	7
17293	1159	13	4
17294	1159	14	4
17295	1159	15	4
17296	1159	16	6
17297	1159	17	5
17298	1159	18	6
17322	1223	78	5
17323	1223	79	4
17324	1223	80	5
17325	1223	81	2
17326	1223	82	5
17327	1223	83	2
17328	1223	84	6
17329	1223	85	5
17330	1223	86	4
17299	1201	73	6
17300	1201	74	3
17301	1201	75	6
17302	1201	76	5
17303	1201	77	7
17304	1201	78	7
17305	1201	79	4
17306	1201	80	5
17307	1201	81	5
17308	1201	82	8
17309	1201	83	5
17310	1201	84	5
17311	1201	85	5
17312	1201	86	4
17313	1201	87	5
17314	1201	88	7
17315	1201	89	5
17316	1201	90	7
17317	1223	73	6
17318	1223	74	3
17319	1223	75	5
17320	1223	76	4
17321	1223	77	5
17331	1223	87	4
17332	1223	88	5
17333	1223	89	5
17334	1223	90	4
17335	1141	1	5
17336	1141	2	3
17337	1141	3	5
17338	1141	4	4
17339	1141	5	6
17340	1141	6	4
17341	1141	7	5
17342	1141	8	4
17343	1141	9	3
17344	1141	10	4
17345	1141	11	4
17346	1141	12	4
17347	1141	13	5
17348	1141	14	4
17349	1141	15	4
17350	1141	16	5
17351	1141	17	4
17352	1141	18	5
17353	1150	1	5
17354	1150	2	3
17355	1150	3	5
17356	1150	4	4
17357	1150	5	4
17358	1150	6	6
17359	1150	7	3
17360	1150	8	4
17361	1150	9	3
17362	1150	10	6
17363	1150	11	2
17364	1150	12	4
17365	1150	13	5
17366	1150	14	3
17367	1150	15	4
17368	1150	16	5
17369	1150	17	4
17370	1150	18	5
17371	1132	1	4
17372	1132	2	4
17373	1132	3	3
17374	1132	4	4
17375	1132	5	5
17376	1132	6	5
17377	1132	7	3
17378	1132	8	3
17379	1132	9	3
17380	1132	10	3
17381	1132	11	4
17382	1132	12	4
17383	1132	13	5
17384	1132	14	3
17385	1132	15	4
17386	1132	16	5
17387	1132	17	4
17388	1132	18	5
17389	1129	1	6
17390	1129	2	4
17391	1129	3	3
17392	1129	4	4
17393	1129	5	4
17394	1129	6	5
17395	1129	7	4
17396	1129	8	4
17397	1129	9	4
17398	1129	10	4
17399	1129	11	4
17400	1129	12	5
17401	1129	13	4
17402	1129	14	4
17403	1129	15	7
17404	1129	16	4
17405	1129	17	4
17406	1129	18	6
17407	1133	1	5
17408	1133	2	4
17409	1133	3	4
17410	1133	4	5
17411	1133	5	8
17412	1133	6	5
17413	1133	7	3
17414	1133	8	4
17415	1133	9	5
17416	1133	10	4
17417	1133	11	4
17418	1133	12	4
17419	1133	13	4
17420	1133	14	4
17421	1133	15	6
17422	1133	16	5
17423	1133	17	4
17424	1133	18	5
17425	1124	1	6
17426	1124	2	4
17427	1124	3	4
17428	1124	4	3
17429	1124	5	5
17430	1124	6	5
17431	1124	7	4
17432	1124	8	4
17433	1124	9	3
17434	1124	10	5
17435	1124	11	3
17436	1124	12	3
17437	1124	13	5
17438	1124	14	4
17439	1124	15	4
17440	1124	16	5
17441	1124	17	3
17442	1124	18	5
17443	1155	1	5
17444	1155	2	4
17445	1155	3	5
17446	1155	4	4
17447	1155	5	8
17448	1155	6	5
17449	1155	7	4
17450	1155	8	3
17451	1155	9	4
17452	1155	10	4
17453	1155	11	4
17454	1155	12	5
17455	1155	13	6
17456	1155	14	5
17457	1155	15	5
17458	1155	16	7
17459	1155	17	5
17460	1155	18	5
17461	1160	1	6
17462	1160	2	5
17463	1160	3	5
17464	1160	4	6
17465	1160	5	5
17466	1160	6	6
17467	1160	7	3
17468	1160	8	3
17469	1160	9	4
17470	1160	10	5
17471	1160	11	4
17472	1160	12	4
17473	1160	13	5
17474	1160	14	7
17475	1160	15	6
17476	1160	16	6
17477	1160	17	5
17478	1160	18	6
17479	1140	1	5
17480	1140	2	4
17481	1140	3	5
17482	1140	4	7
17483	1140	5	6
17484	1140	6	4
17485	1140	7	4
17486	1140	8	4
17487	1140	9	5
17488	1140	10	4
17489	1140	11	4
17490	1140	12	5
17491	1140	13	4
17492	1140	14	3
17493	1140	15	5
17494	1140	16	6
17495	1140	17	4
17496	1140	18	5
17497	1119	1	4
17498	1119	2	4
17499	1119	3	5
17875	1234	1	6
17500	1119	4	4
17501	1119	5	4
17502	1119	6	5
17503	1119	7	3
17504	1119	8	4
17505	1119	9	4
17506	1119	10	4
17507	1119	11	4
17508	1119	12	4
17509	1119	13	4
17510	1119	14	3
17511	1119	15	5
17512	1119	16	6
17513	1119	17	5
17514	1119	18	5
17515	1122	1	4
17516	1122	2	4
17517	1122	3	6
17518	1122	4	4
17519	1122	5	5
17520	1122	6	4
17521	1122	7	4
17522	1122	8	4
17523	1122	9	3
17524	1122	10	3
17525	1122	11	4
17526	1122	12	4
17527	1122	13	6
17528	1122	14	4
17529	1122	15	5
17530	1122	16	5
17531	1122	17	4
17532	1122	18	4
17533	1209	73	5
17534	1209	74	4
17535	1209	75	4
17536	1209	76	4
17537	1209	77	5
17538	1209	78	4
17539	1209	79	3
17540	1209	80	4
17541	1209	81	3
17542	1209	82	4
17543	1209	83	3
17544	1209	84	3
17545	1209	85	5
17546	1209	86	3
17547	1209	87	4
17548	1209	88	4
17549	1209	89	5
17550	1209	90	4
17551	1212	1	5
17552	1212	2	4
17553	1212	3	5
17554	1212	4	4
17555	1212	5	3
17556	1212	6	4
17557	1212	7	4
17558	1212	8	4
17559	1212	9	3
17560	1212	10	3
17561	1212	11	3
17562	1212	12	6
17563	1212	13	4
17564	1212	14	4
17565	1212	15	6
17566	1212	16	5
17567	1212	17	5
17568	1212	18	7
17569	1199	1	5
17570	1199	2	2
17571	1199	3	5
17572	1199	4	4
17573	1199	5	8
17574	1199	6	5
17575	1199	7	7
17576	1199	8	8
17577	1199	9	4
17578	1199	10	3
17579	1199	11	3
17580	1199	12	4
17581	1199	13	5
17582	1199	14	4
17583	1199	15	4
17584	1199	16	6
17585	1199	17	6
17586	1199	18	5
17587	1196	73	5
17588	1196	74	4
17589	1196	75	5
17590	1196	76	5
17591	1196	77	5
17592	1196	78	8
17593	1196	79	5
17594	1196	80	5
17595	1196	81	3
17596	1196	82	5
17597	1196	83	4
17598	1196	84	4
17599	1196	85	5
17600	1196	86	6
17601	1196	87	4
17602	1196	88	6
17603	1196	89	4
17604	1196	90	5
17605	1204	1	5
17606	1204	2	3
17607	1204	3	4
17608	1204	4	5
17609	1204	5	4
17610	1204	6	4
17611	1204	7	4
17612	1204	8	4
17613	1204	9	4
17614	1204	10	4
17615	1204	11	4
17616	1204	12	4
17617	1204	13	4
17618	1204	14	4
17619	1204	15	4
17620	1204	16	4
17621	1204	17	4
17622	1204	18	8
17623	1149	1	5
17624	1149	2	3
17625	1149	3	4
17626	1149	4	4
17627	1149	5	6
17628	1149	6	4
17629	1149	7	3
17630	1149	8	5
17631	1149	9	3
17632	1149	10	5
17633	1149	11	2
17634	1149	12	5
17635	1149	13	4
17636	1149	14	4
17637	1149	15	5
17638	1149	16	7
17639	1149	17	5
17640	1149	18	5
17641	1136	1	6
17642	1136	2	4
17643	1136	3	4
17644	1136	4	4
17645	1136	5	5
17646	1136	6	5
17647	1136	7	3
17648	1136	8	5
17649	1136	9	4
17650	1136	10	4
17651	1136	11	2
17652	1136	12	3
17653	1136	13	5
17654	1136	14	2
17655	1136	15	6
17656	1136	16	4
17657	1136	17	4
17658	1136	18	4
17659	1127	1	6
17660	1127	2	4
17661	1127	3	4
17662	1127	4	6
17663	1127	5	7
17664	1127	6	5
17665	1127	7	4
17666	1127	8	4
17667	1127	9	3
17668	1127	10	6
17669	1127	11	3
17670	1127	12	4
17671	1127	13	4
17672	1127	14	4
17673	1127	15	4
17674	1127	16	5
17675	1127	17	6
17676	1127	18	8
17677	1134	1	4
17678	1134	2	4
17679	1134	3	4
17680	1134	4	3
17681	1134	5	4
17682	1134	6	7
17683	1134	7	3
17684	1134	8	4
17685	1134	9	4
17686	1134	10	4
17687	1134	11	4
17688	1134	12	3
17689	1134	13	4
17690	1134	14	3
17691	1134	15	4
17692	1134	16	5
17693	1134	17	3
17694	1134	18	6
17695	1123	1	6
17696	1123	2	4
17697	1123	3	4
17698	1123	4	4
17699	1123	5	4
17700	1123	6	4
17701	1123	7	3
17702	1123	8	4
17703	1123	9	2
17704	1123	10	4
17705	1123	11	4
17706	1123	12	3
17707	1123	13	4
17708	1123	14	5
17709	1123	15	3
17710	1123	16	7
17711	1123	17	4
17712	1123	18	4
17713	1147	1	6
17714	1147	2	2
17715	1147	3	4
17716	1147	4	6
17717	1147	5	5
17718	1147	6	6
17719	1147	7	3
17720	1147	8	4
17721	1147	9	3
17722	1147	10	5
17723	1147	11	3
17724	1147	12	6
17725	1147	13	4
17726	1147	14	2
17727	1147	15	6
17728	1147	16	6
17729	1147	17	4
17730	1147	18	5
17758	1205	82	6
17759	1205	83	4
17760	1205	84	4
17761	1205	85	5
17762	1205	86	4
17763	1205	87	5
17764	1205	88	4
17765	1205	89	5
17766	1205	90	4
17731	1195	73	4
17732	1195	74	4
17733	1195	75	5
17734	1195	76	4
17735	1195	77	4
17736	1195	78	5
17737	1195	79	4
17738	1195	80	7
17739	1195	81	3
17740	1195	82	5
17741	1195	83	4
17742	1195	84	5
17743	1195	85	5
17744	1195	86	4
17745	1195	87	4
17746	1195	88	7
17747	1195	89	6
17748	1195	90	12
17749	1205	73	6
17750	1205	74	4
17751	1205	75	5
17752	1205	76	5
17753	1205	77	5
17754	1205	78	4
17755	1205	79	5
17756	1205	80	4
17757	1205	81	3
17767	1220	73	7
17768	1220	74	4
17769	1220	75	5
17770	1220	76	5
17771	1220	77	6
17772	1220	78	6
17773	1220	79	5
17774	1220	80	4
17775	1220	81	4
17776	1220	82	5
17777	1220	83	3
17778	1220	84	4
17779	1220	85	4
17780	1220	86	4
17781	1220	87	5
17782	1220	88	5
17783	1220	89	6
17784	1220	90	5
17785	1213	73	2
17786	1213	74	3
17787	1213	75	4
17788	1213	76	3
17789	1213	77	7
17790	1213	78	4
18255	1274	3	4
17791	1213	79	7
17792	1213	80	5
17793	1213	81	4
17794	1213	82	5
17795	1213	83	4
17796	1213	84	4
17797	1213	85	5
17798	1213	86	4
17799	1213	87	7
17800	1213	88	6
17801	1213	89	4
17802	1213	90	5
17803	1200	73	6
17804	1200	74	5
17805	1200	75	6
17806	1200	76	4
17807	1200	77	6
17808	1200	78	4
17809	1200	79	4
17810	1200	80	4
17811	1200	81	4
17812	1200	82	5
17813	1200	83	4
17814	1200	84	6
17815	1200	85	4
17816	1200	86	3
17817	1200	87	5
17818	1200	88	6
17819	1200	89	5
17820	1200	90	4
17821	1231	1	6
17822	1231	2	4
17823	1231	3	6
17824	1231	4	6
17825	1231	5	8
17826	1231	6	5
17827	1231	7	4
17828	1231	8	6
17829	1231	9	4
17830	1231	10	5
17831	1231	11	4
17832	1231	12	7
17833	1231	13	4
17834	1231	14	3
17835	1231	15	8
17836	1231	16	6
17837	1231	17	6
17838	1231	18	6
17876	1234	2	5
17877	1234	3	7
17878	1234	4	7
17879	1234	5	8
17880	1234	6	8
17881	1234	7	5
17882	1234	8	8
17883	1234	9	5
17884	1234	10	7
17885	1234	11	4
17886	1234	12	5
17887	1234	13	5
17888	1234	14	4
17889	1234	15	6
17890	1234	16	6
17891	1234	17	4
17892	1234	18	6
17896	1233	4	3
17897	1233	5	8
17898	1233	6	7
17899	1233	7	3
17900	1233	8	3
17901	1233	9	4
17902	1233	10	8
17903	1233	11	3
17904	1233	12	7
17905	1233	13	5
17906	1233	14	4
17907	1233	15	6
17908	1233	16	6
17909	1233	17	5
17910	1233	18	5
17911	1224	1	7
17912	1224	2	5
17913	1224	3	7
17914	1224	4	5
17915	1224	5	7
17916	1224	6	5
17917	1224	7	5
17918	1224	8	6
17919	1224	9	5
17920	1224	10	5
17921	1224	11	3
17922	1224	12	5
17923	1224	13	4
17924	1224	14	4
17925	1224	15	5
17926	1224	16	9
17927	1224	17	5
17928	1224	18	5
17929	1225	1	6
17930	1225	2	3
17931	1225	3	5
17932	1225	4	6
17933	1225	5	6
17934	1225	6	6
17935	1225	7	4
17936	1225	8	4
17937	1225	9	4
17938	1225	10	5
17939	1225	11	3
17940	1225	12	5
17941	1225	13	5
17942	1225	14	5
17943	1225	15	5
17944	1225	16	7
17945	1225	17	5
17946	1225	18	4
17947	1241	1	7
17948	1241	2	5
17949	1241	3	6
17950	1241	4	6
17951	1241	5	9
17952	1241	6	6
17953	1241	7	5
17954	1241	8	5
17955	1241	9	4
17956	1241	10	8
17957	1241	11	3
17958	1241	12	4
17959	1241	13	7
17960	1241	14	3
17961	1241	15	8
17962	1241	16	9
17963	1241	17	6
17964	1241	18	5
17965	1249	1	4
17966	1249	2	5
17967	1249	3	7
17968	1249	4	4
17969	1249	5	5
17970	1249	6	5
17971	1249	7	3
17972	1249	8	4
17973	1249	9	4
17974	1249	10	4
17975	1249	11	2
17976	1249	12	5
17977	1249	13	5
17978	1249	14	4
17979	1249	15	4
17980	1249	16	6
17981	1249	17	4
17982	1249	18	4
17983	1237	1	7
17984	1237	2	6
17985	1237	3	5
17986	1237	4	6
17987	1237	5	5
17988	1237	6	5
17989	1237	7	4
17990	1237	8	4
17991	1237	9	3
17992	1237	10	5
17993	1237	11	4
17994	1237	12	7
17995	1237	13	4
17996	1237	14	2
17997	1237	15	5
17998	1237	16	5
17999	1237	17	6
18000	1237	18	5
18001	1243	1	5
18002	1243	2	3
18003	1243	3	4
18004	1243	4	5
18005	1243	5	8
18006	1243	6	6
18007	1243	7	3
18008	1243	8	5
18009	1243	9	4
18010	1243	10	4
18011	1243	11	4
18012	1243	12	5
18013	1243	13	4
18014	1243	14	5
18015	1243	15	5
18016	1243	16	6
18017	1243	17	6
18018	1243	18	5
18019	1247	1	5
18020	1247	2	3
18021	1247	3	6
18022	1247	4	5
18023	1247	5	5
18024	1247	6	6
18025	1247	7	4
18026	1247	8	5
18027	1247	9	4
18028	1247	10	6
18029	1247	11	3
18030	1247	12	4
18031	1247	13	5
18032	1247	14	3
18033	1247	15	4
18034	1247	16	5
18035	1247	17	5
18036	1247	18	4
18037	1229	1	8
18038	1229	2	3
18039	1229	3	4
18040	1229	4	5
18041	1229	5	5
18042	1229	6	5
18043	1229	7	5
18044	1229	8	4
18045	1229	9	6
18046	1229	10	9
18047	1229	11	3
18048	1229	12	5
18049	1229	13	5
18050	1229	14	3
18051	1229	15	7
18052	1229	16	7
18053	1229	17	5
18054	1229	18	5
18055	1232	1	7
18056	1232	2	4
18057	1232	3	5
18058	1232	4	5
18059	1232	5	7
18060	1232	6	5
18061	1232	7	4
18062	1232	8	5
18063	1232	9	6
18064	1232	10	6
18065	1232	11	3
18066	1232	12	4
18067	1232	13	5
18068	1232	14	5
18069	1232	15	6
18070	1232	16	6
18071	1232	17	4
18072	1232	18	6
18073	1251	1	4
18074	1251	2	4
18075	1251	3	4
18076	1251	4	4
18077	1251	5	7
18078	1251	6	6
18079	1251	7	2
18080	1251	8	4
18081	1251	9	4
18082	1251	10	5
18083	1251	11	3
18084	1251	12	5
18085	1251	13	4
18086	1251	14	2
18087	1251	15	5
18088	1251	16	6
18089	1251	17	5
18090	1251	18	4
18091	1239	1	4
18092	1239	2	4
18093	1239	3	5
18094	1239	4	5
18095	1239	5	4
18096	1239	6	5
18097	1239	7	3
18098	1239	8	4
18099	1239	9	3
18100	1239	10	4
18101	1239	11	4
18102	1239	12	4
18103	1239	13	4
18104	1239	14	4
18105	1239	15	7
18106	1239	16	6
18107	1239	17	4
18108	1239	18	4
18109	1236	1	4
18110	1236	2	4
18111	1236	3	4
18112	1236	4	4
18113	1236	5	4
18114	1236	6	3
18115	1236	7	3
18116	1236	8	5
18117	1236	9	5
18118	1236	10	4
18119	1236	11	4
18120	1236	12	4
18121	1236	13	3
18122	1236	14	4
18123	1236	15	4
18124	1236	16	6
18125	1236	17	4
18126	1236	18	5
18127	1240	1	5
18128	1240	2	3
18129	1240	3	5
18130	1240	4	5
18131	1240	5	6
18132	1240	6	5
18133	1240	7	5
18134	1240	8	6
18135	1240	9	4
18136	1240	10	4
18137	1240	11	4
18138	1240	12	5
18139	1240	13	3
18140	1240	14	5
18141	1240	15	5
18142	1240	16	7
18143	1240	17	6
18144	1240	18	6
18145	1248	1	4
18146	1248	2	3
18147	1248	3	3
18148	1248	4	5
18149	1248	5	4
18150	1248	6	5
18151	1248	7	3
18152	1248	8	3
18153	1248	9	4
18154	1248	10	5
18155	1248	11	3
18156	1248	12	4
18157	1248	13	5
18158	1248	14	3
18159	1248	15	4
18160	1248	16	5
18161	1248	17	4
18162	1248	18	4
18163	1235	1	4
18164	1235	2	4
18165	1235	3	6
18166	1235	4	9
18167	1235	5	7
18168	1235	6	4
18169	1235	7	4
18170	1235	8	4
18171	1235	9	4
18172	1235	10	4
18173	1235	11	3
18174	1235	12	6
18175	1235	13	4
18176	1235	14	3
18177	1235	15	4
18178	1235	16	5
18179	1235	17	5
18180	1235	18	5
18181	1228	1	4
18182	1228	2	4
18183	1228	3	7
18184	1228	4	4
18185	1228	5	5
18186	1228	6	5
18187	1228	7	3
18188	1228	8	6
18189	1228	9	4
18190	1228	10	4
18191	1228	11	4
18192	1228	12	5
18193	1228	13	4
18194	1228	14	5
18195	1228	15	6
18196	1228	16	7
18197	1228	17	4
18198	1228	18	6
18199	1250	1	11
18200	1250	2	3
18201	1250	3	6
18202	1250	4	6
18203	1250	5	5
18204	1250	6	5
18205	1250	7	3
18206	1250	8	7
18207	1250	9	3
18208	1250	10	5
18209	1250	11	3
18210	1250	12	4
18211	1250	13	5
18212	1250	14	4
18213	1250	15	5
18214	1250	16	4
18215	1250	17	4
18216	1250	18	6
18217	1242	1	6
18218	1242	2	4
18219	1242	3	5
18220	1242	4	7
18221	1242	5	7
18222	1242	6	6
18223	1242	7	3
18224	1242	8	5
18225	1242	9	4
18226	1242	10	4
18227	1242	11	4
18228	1242	12	6
18229	1242	13	6
18230	1242	14	4
18231	1242	15	5
18232	1242	16	8
18233	1242	17	6
18234	1242	18	4
18256	1274	4	4
18235	1254	1	6
18236	1254	2	4
18237	1254	3	5
18238	1254	4	5
18239	1254	5	5
18240	1254	6	3
18241	1254	7	4
18242	1254	8	5
18243	1254	9	5
18244	1254	10	4
18245	1254	11	4
18246	1254	12	4
18247	1254	13	4
18248	1254	14	5
18249	1254	15	5
18250	1254	16	5
18257	1274	5	5
18258	1274	6	4
18259	1274	7	4
18260	1274	8	5
18261	1274	9	4
18262	1274	10	6
18263	1274	11	4
18264	1274	12	5
18265	1274	13	4
18251	1254	17	6
18252	1254	18	6
18266	1274	14	5
18267	1274	15	6
18268	1274	16	8
18269	1274	17	5
18270	1274	18	5
18271	1262	1	5
18272	1262	2	6
18273	1262	3	5
18274	1262	4	6
18275	1262	5	6
18276	1262	6	8
18277	1262	7	4
18278	1262	8	7
18279	1262	9	3
18280	1262	10	7
18281	1262	11	3
18282	1262	12	4
18283	1262	13	4
18284	1262	14	5
18285	1262	15	5
18286	1262	16	7
18287	1262	17	4
18288	1262	18	6
18307	1258	1	6
18308	1258	2	3
18309	1258	3	5
18310	1258	4	5
18311	1258	5	7
18312	1258	6	7
18313	1258	7	4
18314	1258	8	4
18315	1258	9	3
18316	1258	10	3
18317	1258	11	4
18318	1258	12	4
18319	1258	13	5
18320	1258	14	3
18321	1258	15	5
18322	1258	16	6
18323	1258	17	4
18324	1258	18	10
18325	1300	1	6
18326	1300	2	3
18327	1300	3	5
18328	1300	4	5
18329	1300	5	7
18330	1300	6	4
18331	1300	7	4
18332	1300	8	4
18333	1300	9	3
18334	1300	10	3
18335	1300	11	3
18336	1300	12	4
18337	1300	13	5
18338	1300	14	3
18339	1300	15	5
18340	1300	16	6
18341	1300	17	4
18342	1300	18	4
18343	1322	1	7
18344	1322	2	5
18345	1322	3	4
18346	1322	4	6
18347	1322	5	6
18348	1322	6	7
18349	1322	7	4
18350	1322	8	4
18351	1322	9	4
18352	1322	10	5
18353	1322	11	3
18354	1322	12	5
18355	1322	13	6
18356	1322	14	4
18357	1322	15	6
18358	1322	16	5
18359	1322	17	5
18360	1322	18	5
18361	1287	1	5
18362	1287	2	6
18363	1287	3	5
18364	1287	4	6
18365	1287	5	6
18366	1287	6	4
18367	1287	7	4
18368	1287	8	7
18369	1287	9	3
18370	1287	10	4
18371	1287	11	3
18372	1287	12	4
18373	1287	13	4
18374	1287	14	5
18375	1287	15	5
18376	1287	16	5
18377	1287	17	4
18378	1287	18	6
18379	1288	1	5
18380	1288	2	4
18381	1288	3	4
18382	1288	4	4
18383	1288	5	5
18384	1288	6	4
18385	1288	7	4
18386	1288	8	5
18387	1288	9	4
18388	1288	10	4
18389	1288	11	4
18390	1288	12	5
18391	1288	13	4
18392	1288	14	5
18393	1288	15	6
18394	1288	16	5
18395	1288	17	5
18396	1288	18	5
18397	1304	1	5
18398	1304	2	5
18399	1304	3	7
18400	1304	4	6
18401	1304	5	5
18402	1304	6	6
18403	1304	7	3
18404	1304	8	4
18405	1304	9	5
18406	1304	10	5
18407	1304	11	6
18408	1304	12	5
18409	1304	13	6
18410	1304	14	5
18411	1304	15	4
18412	1304	16	7
18413	1304	17	5
18414	1304	18	6
18415	1312	1	6
18416	1312	2	3
18417	1312	3	5
18418	1312	4	5
18419	1312	5	6
18420	1312	6	5
18421	1312	7	4
18422	1312	8	4
18423	1312	9	5
18424	1312	10	4
18425	1312	11	5
18426	1312	12	5
18427	1312	13	6
18428	1312	14	3
18429	1312	15	5
18430	1312	16	5
18431	1312	17	4
18432	1312	18	4
18433	1321	1	7
18434	1321	2	4
18435	1321	3	5
18436	1321	4	6
18437	1321	5	5
18438	1321	6	6
18439	1321	7	6
18440	1321	8	5
18441	1321	9	7
18442	1321	10	4
18443	1321	11	4
18444	1321	12	6
18445	1321	13	6
18446	1321	14	5
18447	1321	15	4
18448	1321	16	8
18449	1321	17	6
18450	1321	18	7
18451	1271	1	5
18452	1271	2	5
18453	1271	3	7
18454	1271	4	6
18455	1271	5	8
18456	1271	6	6
18457	1271	7	6
18458	1271	8	4
18459	1271	9	5
18460	1271	10	5
18461	1271	11	6
18462	1271	12	5
18463	1271	13	6
18464	1271	14	5
18465	1271	15	7
18466	1271	16	7
18467	1271	17	5
18468	1271	18	6
18469	1324	1	5
18470	1324	2	4
18471	1324	3	9
18472	1324	4	6
18473	1324	5	6
18474	1324	6	5
18475	1324	7	4
18476	1324	8	4
18477	1324	9	5
18478	1324	10	7
18479	1324	11	6
18480	1324	12	6
18481	1324	13	6
18482	1324	14	7
18483	1324	15	6
18484	1324	16	8
18485	1324	17	6
18486	1324	18	4
18487	1290	1	5
18488	1290	2	3
18489	1290	3	5
18490	1290	4	4
18491	1290	5	5
18492	1290	6	4
18493	1290	7	3
18494	1290	8	4
18495	1290	9	3
18496	1290	10	4
18497	1290	11	3
18498	1290	12	4
18499	1290	13	5
18500	1290	14	3
18501	1290	15	4
18502	1290	16	5
18503	1290	17	5
18504	1290	18	5
18505	1301	1	5
18506	1301	2	2
18507	1301	3	5
18508	1301	4	4
18509	1301	5	6
18510	1301	6	4
18511	1301	7	3
18512	1301	8	4
18513	1301	9	3
18514	1301	10	3
18515	1301	11	3
18516	1301	12	4
18517	1301	13	4
18518	1301	14	3
18519	1301	15	4
18520	1301	16	5
18521	1301	17	5
18522	1301	18	3
18523	1297	1	5
18524	1297	2	4
18525	1297	3	4
18526	1297	4	4
18527	1297	5	6
18528	1297	6	5
18529	1297	7	3
18530	1297	8	4
18531	1297	9	4
18532	1297	10	4
18533	1297	11	4
18534	1297	12	4
18535	1297	13	4
18536	1297	14	4
18537	1297	15	3
18538	1297	16	5
18539	1297	17	4
18540	1297	18	4
18541	1284	1	5
18542	1284	2	3
18543	1284	3	5
18544	1284	4	4
18545	1284	5	7
18546	1284	6	4
18547	1284	7	3
18548	1284	8	4
18549	1284	9	4
18550	1284	10	4
18551	1284	11	3
18552	1284	12	4
18553	1284	13	5
18554	1284	14	3
18555	1284	15	4
18556	1284	16	9
18557	1284	17	5
18558	1284	18	5
18559	1273	1	6
18560	1273	2	2
18561	1273	3	5
18562	1273	4	4
18563	1273	5	6
18564	1273	6	4
18565	1273	7	3
18566	1273	8	4
18567	1273	9	4
18568	1273	10	3
18569	1273	11	3
18570	1273	12	4
18571	1273	13	4
18572	1273	14	3
18573	1273	15	4
18574	1273	16	7
18575	1273	17	5
18576	1273	18	3
18577	1270	1	5
18578	1270	2	4
18579	1270	3	7
18580	1270	4	4
18581	1270	5	6
18582	1270	6	5
18583	1270	7	3
18584	1270	8	5
18585	1270	9	4
18586	1270	10	4
18587	1270	11	4
18588	1270	12	4
18589	1270	13	4
18590	1270	14	4
18591	1270	15	3
18592	1270	16	5
18593	1270	17	4
18594	1270	18	7
18595	1265	1	6
18596	1265	2	4
18597	1265	3	5
18598	1265	4	5
18599	1265	5	6
18600	1265	6	7
18601	1265	7	5
18602	1265	8	5
18603	1265	9	5
18604	1265	10	5
18605	1265	11	4
18606	1265	12	6
18607	1265	13	6
18608	1265	14	7
18609	1265	15	6
18610	1265	16	8
18611	1265	17	5
18612	1265	18	8
18613	1303	1	6
18614	1303	2	4
18615	1303	3	5
18616	1303	4	5
18617	1303	5	6
18618	1303	6	4
18619	1303	7	5
18620	1303	8	5
18621	1303	9	5
18622	1303	10	5
18623	1303	11	4
18624	1303	12	4
18625	1303	13	6
18626	1303	14	3
18627	1303	15	6
18628	1303	16	8
18629	1303	17	5
18630	1303	18	8
18631	1313	1	9
18632	1313	2	3
18633	1313	3	8
18634	1313	4	5
18635	1313	5	6
18636	1313	6	7
18637	1313	7	6
18638	1313	8	4
18639	1313	9	7
18640	1313	10	4
18641	1313	11	4
18642	1313	12	5
18643	1313	13	4
18644	1313	14	4
18645	1313	15	4
18646	1313	16	7
18647	1313	17	5
18648	1313	18	6
18649	1314	1	7
18650	1314	2	4
18651	1314	3	4
18652	1314	4	5
18653	1314	5	6
18654	1314	6	4
18655	1314	7	4
18656	1314	8	6
18657	1314	9	4
18658	1314	10	4
18659	1314	11	5
18660	1314	12	6
18661	1314	13	5
18662	1314	14	6
18663	1314	15	5
18664	1314	16	5
18665	1314	17	7
18666	1314	18	5
18667	1320	1	5
18668	1320	2	5
18669	1320	3	4
18670	1320	4	4
18671	1320	5	5
18672	1320	6	5
18673	1320	7	3
18674	1320	8	5
18675	1320	9	4
18676	1320	10	3
18677	1320	11	3
18678	1320	12	4
18679	1320	13	5
18680	1320	14	4
18681	1320	15	4
18682	1320	16	6
18683	1320	17	5
18684	1320	18	4
18685	1319	1	6
18686	1319	2	2
18687	1319	3	4
18688	1319	4	4
18689	1319	5	7
18690	1319	6	4
18691	1319	7	4
18692	1319	8	4
18693	1319	9	4
18694	1319	10	5
18695	1319	11	2
18696	1319	12	4
18697	1319	13	5
18698	1319	14	4
18699	1319	15	4
18700	1319	16	5
18701	1319	17	4
18702	1319	18	6
18703	1318	1	5
18704	1318	2	4
18705	1318	3	5
18706	1318	4	4
18707	1318	5	6
18708	1318	6	4
18709	1318	7	4
18710	1318	8	5
18711	1318	9	4
18712	1318	10	4
18713	1318	11	3
18714	1318	12	4
18715	1318	13	4
18716	1318	14	3
18717	1318	15	4
18718	1318	16	5
18719	1318	17	4
18720	1318	18	4
18721	1309	1	5
18722	1309	2	3
18723	1309	3	5
18724	1309	4	6
18725	1309	5	5
18726	1309	6	6
18727	1309	7	6
18728	1309	8	8
18729	1309	9	5
18730	1309	10	6
18731	1309	11	3
18732	1309	12	4
18733	1309	13	10
18734	1309	14	5
18735	1309	15	8
18736	1309	16	5
18737	1309	17	5
18738	1309	18	5
18739	1302	1	5
18740	1302	2	5
18741	1302	3	7
18742	1302	4	7
18743	1302	5	6
18744	1302	6	6
18745	1302	7	3
18746	1302	8	4
18747	1302	9	4
18748	1302	10	4
18749	1302	11	3
18750	1302	12	5
18751	1302	13	6
18752	1302	14	3
18753	1302	15	5
18754	1302	16	8
18755	1302	17	4
18756	1302	18	4
18757	1264	1	5
18758	1264	2	5
18759	1264	3	5
18760	1264	4	4
18761	1264	5	5
18762	1264	6	5
18763	1264	7	3
18764	1264	8	5
18765	1264	9	4
18766	1264	10	3
18767	1264	11	5
18768	1264	12	4
18769	1264	13	5
18770	1264	14	4
18771	1264	15	4
18772	1264	16	6
18773	1264	17	5
18774	1264	18	6
18775	1278	1	5
18776	1278	2	4
18777	1278	3	5
18778	1278	4	4
18779	1278	5	6
18780	1278	6	7
18781	1278	7	4
18782	1278	8	5
18783	1278	9	4
18784	1278	10	4
18785	1278	11	3
18786	1278	12	6
18787	1278	13	4
18788	1278	14	4
18789	1278	15	4
18790	1278	16	5
18791	1278	17	4
18792	1278	18	4
18793	1267	1	6
18794	1267	2	2
18795	1267	3	4
18796	1267	4	4
18797	1267	5	7
18798	1267	6	8
18799	1267	7	4
18800	1267	8	4
18801	1267	9	4
18802	1267	10	5
18803	1267	11	2
18804	1267	12	6
18805	1267	13	5
18806	1267	14	4
18807	1267	15	6
18808	1267	16	5
18809	1267	17	4
18810	1267	18	6
18811	1315	1	5
18812	1315	2	3
18813	1315	3	5
18814	1315	4	6
18815	1315	5	6
18816	1315	6	7
18817	1315	7	3
18818	1315	8	5
18819	1315	9	4
18820	1315	10	6
18821	1315	11	4
18822	1315	12	4
18823	1315	13	6
18824	1315	14	4
18825	1315	15	5
18826	1315	16	5
18827	1315	17	5
18828	1315	18	4
18829	1277	1	5
18830	1277	2	6
18831	1277	3	5
18832	1277	4	6
18833	1277	5	6
18834	1277	6	7
18835	1277	7	3
18836	1277	8	5
18837	1277	9	4
18838	1277	10	6
18839	1277	11	4
18840	1277	12	8
18841	1277	13	6
18842	1277	14	4
18843	1277	15	5
18844	1277	16	9
18845	1277	17	5
18846	1277	18	4
18847	1280	1	6
18848	1280	2	4
18849	1280	3	4
18850	1280	4	4
18851	1280	5	5
18852	1280	6	5
18853	1280	7	2
18854	1280	8	4
18855	1280	9	3
18856	1280	10	5
18857	1280	11	3
18858	1280	12	4
18859	1280	13	3
18860	1280	14	3
18861	1280	15	5
18862	1280	16	5
18863	1280	17	4
18864	1280	18	4
18865	1257	1	6
18866	1257	2	7
18867	1257	3	7
18868	1257	4	7
18869	1257	5	7
18870	1257	6	7
18871	1257	7	5
18872	1257	8	6
18873	1257	9	5
18874	1257	10	6
18875	1257	11	4
18876	1257	12	5
18877	1257	13	6
18878	1257	14	5
18879	1257	15	6
18880	1257	16	8
18881	1257	17	5
18882	1257	18	7
18883	1283	1	7
18884	1283	2	4
18885	1283	3	6
18886	1283	4	4
18887	1283	5	7
18888	1283	6	7
18889	1283	7	3
18890	1283	8	6
18891	1283	9	4
18892	1283	10	7
18893	1283	11	3
18894	1283	12	5
18895	1283	13	4
18896	1283	14	4
18897	1283	15	5
18898	1283	16	10
18899	1283	17	5
18900	1283	18	6
18901	1281	1	6
18902	1281	2	6
18903	1281	3	5
18904	1281	4	8
18905	1281	5	6
18906	1281	6	7
18907	1281	7	5
18908	1281	8	8
18909	1281	9	6
18910	1281	10	5
18911	1281	11	5
18912	1281	12	5
18913	1281	13	5
18914	1281	14	8
18915	1281	15	6
18916	1281	16	6
18917	1281	17	5
18918	1281	18	5
18919	1260	1	5
18920	1260	2	4
18921	1260	3	4
18922	1260	4	4
18923	1260	5	6
18924	1260	6	5
18925	1260	7	4
18926	1260	8	5
18927	1260	9	2
18928	1260	10	5
18929	1260	11	2
18930	1260	12	5
18931	1260	13	4
18932	1260	14	4
18933	1260	15	4
18934	1260	16	5
18935	1260	17	4
18936	1260	18	6
18966	1296	12	5
18967	1296	13	6
18968	1296	14	5
18969	1296	15	6
18970	1296	16	8
18971	1296	17	5
18972	1296	18	4
18973	1289	1	5
18974	1289	2	4
18937	1291	1	5
18938	1291	2	4
18939	1291	3	4
18940	1291	4	4
18941	1291	5	5
18942	1291	6	5
18943	1291	7	4
18944	1291	8	4
18945	1291	9	2
18946	1291	10	5
18947	1291	11	2
18948	1291	12	5
18949	1291	13	4
18950	1291	14	4
18951	1291	15	4
18952	1291	16	5
18953	1291	17	4
18954	1291	18	4
18955	1296	1	6
18956	1296	2	7
18957	1296	3	4
18958	1296	4	7
18959	1296	5	7
18960	1296	6	7
18961	1296	7	5
18962	1296	8	6
18963	1296	9	5
18964	1296	10	4
18965	1296	11	4
18975	1289	3	4
18976	1289	4	4
18977	1289	5	5
18978	1289	6	5
18979	1289	7	2
18980	1289	8	4
18981	1289	9	3
18982	1289	10	4
18983	1289	11	3
18984	1289	12	4
18985	1289	13	3
18986	1289	14	3
18987	1289	15	4
18988	1289	16	5
18989	1289	17	4
18990	1289	18	4
18991	1316	1	7
18992	1316	2	4
18993	1316	3	6
18994	1316	4	4
18995	1316	5	5
18996	1316	6	7
18997	1316	7	3
18998	1316	8	6
18999	1316	9	4
19000	1316	10	4
19001	1316	11	3
19002	1316	12	5
19003	1316	13	4
19004	1316	14	4
19005	1316	15	5
19006	1316	16	5
19007	1316	17	5
19008	1316	18	6
19009	1294	1	6
19010	1294	2	6
19011	1294	3	5
19012	1294	4	4
19013	1294	5	6
19014	1294	6	7
19015	1294	7	5
19016	1294	8	4
19017	1294	9	6
19018	1294	10	5
19019	1294	11	5
19020	1294	12	5
19021	1294	13	5
19022	1294	14	3
19023	1294	15	6
19024	1294	16	6
19025	1294	17	5
19026	1294	18	5
19027	1317	1	7
19028	1317	2	5
19029	1317	3	7
19030	1317	4	6
19031	1317	5	6
19032	1317	6	4
19033	1317	7	4
19034	1317	8	4
19035	1317	9	5
19036	1317	10	4
19037	1317	11	3
19038	1317	12	7
19039	1317	13	8
19040	1317	14	7
19041	1317	15	5
19042	1317	16	5
19043	1317	17	7
19044	1317	18	7
19045	1295	1	5
19046	1295	2	4
19047	1295	3	6
19048	1295	4	4
19049	1295	5	5
19050	1295	6	5
19051	1295	7	5
19052	1295	8	4
19053	1295	9	4
19054	1295	10	4
19055	1295	11	4
19056	1295	12	4
19057	1295	13	5
19058	1295	14	4
19059	1295	15	4
19060	1295	16	7
19061	1295	17	6
19062	1295	18	4
19070	1323	8	4
19071	1323	9	3
19072	1323	10	6
19073	1323	11	3
19074	1323	12	5
19075	1323	13	5
19076	1323	14	3
19131	1325	15	6
19132	1325	16	11
19133	1325	17	6
19134	1325	18	4
19135	1275	1	7
19136	1275	2	4
19081	1306	1	9
19082	1306	2	5
19083	1306	3	8
19084	1306	4	4
19085	1306	5	7
19086	1306	6	7
19087	1306	7	6
19088	1306	8	8
19089	1306	9	6
19090	1306	10	5
19091	1306	11	5
19092	1306	12	4
19093	1306	13	8
19094	1306	14	3
19095	1306	15	7
19096	1306	16	9
19097	1306	17	7
19098	1306	18	7
19099	1305	1	6
19100	1305	2	5
19101	1305	3	5
19102	1305	4	6
19103	1305	5	5
19104	1305	6	4
19105	1305	7	4
19106	1305	8	5
19107	1305	9	10
19108	1305	10	6
19109	1305	11	4
19110	1305	12	4
19111	1305	13	5
19112	1305	14	6
19113	1305	15	5
19114	1305	16	9
19115	1305	17	6
19116	1305	18	4
19063	1323	1	6
19064	1323	2	3
19065	1323	3	6
19066	1323	4	4
19067	1323	5	6
19068	1323	6	6
19069	1323	7	5
19077	1323	15	5
19078	1323	16	6
19079	1323	17	5
19080	1323	18	4
19117	1325	1	7
19118	1325	2	6
19119	1325	3	5
19120	1325	4	4
19121	1325	5	7
19122	1325	6	4
19123	1325	7	5
19124	1325	8	5
19125	1325	9	5
19126	1325	10	4
19127	1325	11	5
19128	1325	12	6
19129	1325	13	6
19130	1325	14	5
19137	1275	3	6
19138	1275	4	4
19139	1275	5	5
19140	1275	6	5
19141	1275	7	5
19142	1275	8	4
19143	1275	9	4
19144	1275	10	4
19145	1275	11	4
19146	1275	12	7
19147	1275	13	5
19148	1275	14	4
19149	1275	15	4
19150	1275	16	7
19151	1275	17	6
19152	1275	18	7
19153	1327	1	6
19154	1327	2	4
19155	1327	3	5
19156	1327	4	3
19157	1327	5	6
19158	1327	6	5
19159	1327	7	4
19160	1327	8	5
19161	1327	9	4
19162	1327	10	5
19163	1327	11	3
19164	1327	12	4
19165	1327	13	4
19166	1327	14	2
19167	1327	15	4
19168	1327	16	6
19169	1327	17	4
19170	1327	18	5
19224	1344	18	5
19225	1331	1	5
19226	1331	2	6
19227	1331	3	7
19228	1331	4	4
19229	1331	5	8
19230	1331	6	6
19231	1331	7	4
19232	1331	8	8
19207	1344	1	5
19208	1344	2	4
19209	1344	3	5
19210	1344	4	5
19211	1344	5	3
19212	1344	6	6
19213	1344	7	3
19214	1344	8	4
19215	1344	9	2
19216	1344	10	4
19217	1344	11	5
19218	1344	12	3
19219	1344	13	4
19220	1344	14	3
19221	1344	15	3
19222	1344	16	5
19223	1344	17	4
19233	1331	9	5
19234	1331	10	5
19235	1331	11	5
19236	1331	12	5
19237	1331	13	5
19238	1331	14	5
19239	1331	15	5
19240	1331	16	8
19241	1331	17	5
19242	1331	18	6
19243	1363	1	8
19244	1363	2	5
19245	1363	3	5
19246	1363	4	5
19247	1363	5	4
19248	1363	6	4
19249	1363	7	3
19250	1363	8	5
19251	1363	9	4
19252	1363	10	4
19253	1363	11	3
19254	1363	12	4
19255	1363	13	4
19256	1363	14	3
19257	1363	15	5
19258	1363	16	6
19259	1363	17	5
19260	1363	18	6
19261	1345	1	5
19262	1345	2	3
19263	1345	3	4
19264	1345	4	3
19265	1345	5	4
19266	1345	6	7
19267	1345	7	3
19268	1345	8	4
19269	1345	9	3
19270	1345	10	3
19271	1345	11	3
19272	1345	12	2
19273	1345	13	4
19274	1345	14	2
19275	1345	15	4
19276	1345	16	5
19277	1345	17	6
19278	1345	18	4
19279	1343	1	6
19280	1343	2	4
19281	1343	3	6
19282	1343	4	4
19283	1343	5	8
19284	1343	6	5
19285	1343	7	3
19286	1343	8	4
19287	1343	9	3
19288	1343	10	5
19289	1343	11	3
19290	1343	12	5
19291	1343	13	4
19292	1343	14	3
19293	1343	15	4
19294	1343	16	6
19295	1343	17	4
19296	1343	18	5
19297	1357	1	6
19298	1357	2	5
19299	1357	3	7
19300	1357	4	7
19301	1357	5	6
19302	1357	6	5
19303	1357	7	3
19304	1357	8	4
19305	1357	9	5
19306	1357	10	5
19307	1357	11	4
19308	1357	12	4
19309	1357	13	8
19310	1357	14	5
19311	1357	15	7
19312	1357	16	11
19313	1357	17	6
19314	1357	18	7
19315	1355	1	5
19316	1355	2	3
19317	1355	3	5
19318	1355	4	5
19319	1355	5	3
19320	1355	6	4
19321	1355	7	2
19322	1355	8	4
19323	1355	9	4
19324	1355	10	6
19325	1355	11	3
19326	1355	12	4
19327	1355	13	4
19328	1355	14	4
19329	1355	15	4
19330	1355	16	5
19331	1355	17	4
19332	1355	18	5
19333	1337	1	7
19334	1337	2	4
19335	1337	3	4
19336	1337	4	5
19337	1337	5	5
19338	1337	6	6
19339	1337	7	4
19340	1337	8	6
19341	1337	9	3
19342	1337	10	5
19343	1337	11	5
19344	1337	12	5
19345	1337	13	5
19346	1337	14	4
19347	1337	15	3
19348	1337	16	6
19349	1337	17	4
19350	1337	18	5
19351	1328	1	7
19352	1328	2	5
19353	1328	3	7
19354	1328	4	5
19355	1328	5	7
19356	1328	6	8
19357	1328	7	4
19358	1328	8	5
19359	1328	9	3
19360	1328	10	5
19361	1328	11	4
19362	1328	12	7
19363	1328	13	5
19364	1328	14	5
19365	1328	15	6
19366	1328	16	5
19367	1328	17	6
19368	1328	18	8
19369	1361	1	6
19370	1361	2	5
19371	1361	3	4
19372	1361	4	6
19373	1361	5	6
19374	1361	6	4
19375	1361	7	4
19376	1361	8	4
19377	1361	9	4
19378	1361	10	3
19379	1361	11	4
19380	1361	12	4
19381	1361	13	4
19382	1361	14	4
19383	1361	15	4
19384	1361	16	7
19385	1361	17	4
19386	1361	18	7
19387	1338	1	8
19388	1338	2	4
19389	1338	3	5
19390	1338	4	6
19391	1338	5	5
19392	1338	6	6
19393	1338	7	4
19394	1338	8	5
19395	1338	9	3
19396	1338	10	5
19397	1338	11	3
19398	1338	12	5
19399	1338	13	4
19400	1338	14	4
19401	1338	15	4
19402	1338	16	6
19403	1338	17	6
19404	1338	18	5
19405	1352	1	4
19406	1352	2	7
19407	1352	3	3
19408	1352	4	4
19409	1352	5	7
19410	1352	6	6
19411	1352	7	6
19412	1352	8	5
19413	1352	9	3
19414	1352	10	8
19415	1352	11	3
19416	1352	12	4
19417	1352	13	5
19418	1352	14	3
19419	1352	15	6
19420	1352	16	6
19421	1352	17	4
19422	1352	18	8
19423	1349	1	6
19424	1349	2	3
19425	1349	3	6
19426	1349	4	4
19427	1349	5	6
19428	1349	6	5
19429	1349	7	3
19430	1349	8	7
19431	1349	9	4
19432	1349	10	5
19433	1349	11	4
19434	1349	12	4
19435	1349	13	6
19436	1349	14	4
19437	1349	15	5
19438	1349	16	5
19439	1349	17	5
19440	1349	18	10
19441	1340	1	6
19442	1340	2	5
19443	1340	3	6
19444	1340	4	5
19445	1340	5	7
19446	1340	6	6
19447	1340	7	13
19448	1340	8	6
19449	1340	9	4
19450	1340	10	9
19451	1340	11	5
19452	1340	12	5
19453	1340	13	6
19454	1340	14	4
19455	1340	15	4
19456	1340	16	5
19457	1340	17	6
19458	1340	18	8
19459	1346	1	4
19460	1346	2	3
19461	1346	3	6
19462	1346	4	4
19463	1346	5	5
19464	1346	6	4
19465	1346	7	4
19466	1346	8	5
19467	1346	9	3
19468	1346	10	6
19469	1346	11	3
19470	1346	12	3
19471	1346	13	5
19472	1346	14	3
19473	1346	15	4
19474	1346	16	5
19475	1346	17	4
19476	1346	18	4
19477	1339	1	5
19478	1339	2	6
19479	1339	3	6
19480	1339	4	5
19481	1339	5	5
19482	1339	6	5
19483	1339	7	5
19484	1339	8	4
19485	1339	9	5
19486	1339	10	6
19487	1339	11	5
19488	1339	12	5
19489	1339	13	5
19490	1339	14	3
19491	1339	15	6
19492	1339	16	6
19493	1339	17	5
19494	1339	18	6
19495	1335	1	5
19496	1335	2	5
19497	1335	3	3
19498	1335	4	5
19499	1335	5	5
19500	1335	6	4
19501	1335	7	3
19502	1335	8	6
19503	1335	9	5
19504	1335	10	6
19505	1335	11	4
19506	1335	12	5
19507	1335	13	5
19508	1335	14	3
19509	1335	15	5
19510	1335	16	5
19511	1335	17	5
19512	1335	18	4
19513	1332	1	6
19514	1332	2	4
19515	1332	3	5
19516	1332	4	7
19517	1332	5	8
19518	1332	6	5
19519	1332	7	4
19520	1332	8	7
19521	1332	9	5
19522	1332	10	4
19523	1332	11	3
19524	1332	12	7
19525	1332	13	7
19526	1332	14	3
19527	1332	15	6
19528	1332	16	5
19529	1332	17	7
19530	1332	18	5
19531	1347	1	6
19532	1347	2	3
19533	1347	3	5
19534	1347	4	5
19535	1347	5	5
19536	1347	6	5
19537	1347	7	3
19538	1347	8	4
19539	1347	9	3
19540	1347	10	5
19541	1347	11	4
19542	1347	12	4
19543	1347	13	4
19544	1347	14	4
19545	1347	15	4
19546	1347	16	5
19547	1347	17	4
19548	1347	18	5
19549	1358	1	5
19550	1358	2	4
19551	1358	3	5
19552	1358	4	4
19553	1358	5	5
19554	1358	6	7
19555	1358	7	4
19556	1358	8	5
19557	1358	9	4
19558	1358	10	6
19559	1358	11	4
19560	1358	12	5
19561	1358	13	4
19562	1358	14	4
19563	1358	15	4
19564	1358	16	5
19565	1358	17	6
19566	1358	18	7
19567	1326	1	6
19568	1326	2	3
19569	1326	3	4
19570	1326	4	5
19571	1326	5	7
19572	1326	6	3
19573	1326	7	4
19574	1326	8	4
19575	1326	9	5
19576	1326	10	5
19577	1326	11	4
19578	1326	12	4
19579	1326	13	4
19580	1326	14	3
19581	1326	15	8
19582	1326	16	6
19583	1326	17	4
19584	1326	18	8
19585	1351	1	4
19586	1351	2	4
19587	1351	3	3
19588	1351	4	4
19589	1351	5	5
19590	1351	6	5
19591	1351	7	3
19592	1351	8	4
19593	1351	9	5
19594	1351	10	4
19595	1351	11	2
19596	1351	12	5
19597	1351	13	4
19598	1351	14	4
19599	1351	15	3
19600	1351	16	4
19601	1351	17	4
19602	1351	18	5
19603	1329	1	10
19604	1329	2	3
19605	1329	3	6
19606	1329	4	3
19607	1329	5	6
19608	1329	6	6
19609	1329	7	4
19610	1329	8	8
19611	1329	9	5
19612	1329	10	5
19613	1329	11	4
19614	1329	12	5
19615	1329	13	6
19616	1329	14	4
19617	1329	15	6
19618	1329	16	5
19619	1329	17	6
19620	1329	18	7
19621	1354	1	6
19622	1354	2	3
19623	1354	3	5
19624	1354	4	4
19625	1354	5	5
19626	1354	6	4
19627	1354	7	3
19628	1354	8	4
19629	1354	9	3
19630	1354	10	6
19631	1354	11	3
19632	1354	12	4
19633	1354	13	5
19634	1354	14	3
19635	1354	15	4
19636	1354	16	5
19637	1354	17	6
19638	1354	18	7
19639	1356	1	4
19640	1356	2	5
19641	1356	3	4
19642	1356	4	5
19643	1356	5	6
19644	1356	6	5
19645	1356	7	4
19646	1356	8	5
19647	1356	9	4
19648	1356	10	4
19649	1356	11	2
19650	1356	12	4
19651	1356	13	4
19652	1356	14	3
19653	1356	15	4
19654	1356	16	6
19655	1356	17	6
19656	1356	18	5
19675	1330	1	5
19676	1330	2	3
19677	1330	3	5
19678	1330	4	7
19679	1330	5	6
19680	1330	6	6
19681	1330	7	4
19682	1330	8	5
19683	1330	9	3
19684	1330	10	9
19685	1330	11	4
19686	1330	12	5
19687	1330	13	4
19688	1330	14	6
19689	1330	15	6
19690	1330	16	8
19691	1330	17	5
19692	1330	18	5
19693	1387	1	5
19694	1387	2	3
19695	1387	3	6
19696	1387	4	4
19697	1387	5	5
19698	1387	6	6
19699	1387	7	4
19700	1387	8	5
19701	1387	9	4
19702	1387	10	4
19703	1387	11	4
19704	1387	12	4
19705	1387	13	6
19706	1387	14	4
19707	1387	15	4
19708	1387	16	5
19709	1387	17	4
19710	1387	18	8
19711	1384	1	7
19712	1384	2	4
19713	1384	3	5
19714	1384	4	4
19715	1384	5	6
19716	1384	6	5
19717	1384	7	2
19718	1384	8	8
19719	1384	9	4
19720	1384	10	5
19721	1384	11	4
19722	1384	12	4
19723	1384	13	5
19724	1384	14	4
19725	1384	15	4
19726	1384	16	6
19727	1384	17	6
19728	1384	18	5
19729	1395	1	5
19730	1395	2	4
19731	1395	3	6
19732	1395	4	4
19733	1395	5	6
19734	1395	6	6
19735	1395	7	3
19736	1395	8	4
19737	1395	9	3
19738	1395	10	7
19739	1395	11	5
19740	1395	12	4
19741	1395	13	5
19742	1395	14	5
19743	1395	15	5
19744	1395	16	4
19745	1395	17	5
19746	1395	18	4
19747	1377	1	6
19748	1377	2	5
19749	1377	3	4
19750	1377	4	4
19751	1377	5	5
19752	1377	6	4
19753	1377	7	5
19754	1377	8	4
19755	1377	9	4
19756	1377	10	3
19757	1377	11	3
19758	1377	12	4
19759	1377	13	4
19760	1377	14	3
19761	1377	15	4
19762	1377	16	4
19763	1377	17	4
19764	1377	18	4
19765	1378	1	4
19766	1378	2	3
19767	1378	3	4
19768	1378	4	3
19769	1378	5	5
19770	1378	6	3
19771	1378	7	3
19772	1378	8	3
19773	1378	9	3
19774	1378	10	5
19775	1378	11	3
19776	1378	12	4
19777	1378	13	4
19778	1378	14	3
19779	1378	15	4
19780	1378	16	4
19781	1378	17	3
19782	1378	18	5
19806	1470	6	5
19807	1470	7	2
19808	1470	8	8
19809	1470	9	4
19810	1470	10	5
19811	1470	11	4
19812	1470	12	4
19813	1470	13	5
19814	1470	14	4
19783	1370	1	4
19784	1370	2	3
19785	1370	3	5
19786	1370	4	4
19787	1370	5	5
19788	1370	6	5
19789	1370	7	3
19790	1370	8	3
19791	1370	9	3
19792	1370	10	4
19793	1370	11	3
19794	1370	12	4
19795	1370	13	4
19796	1370	14	4
19797	1370	15	6
19798	1370	16	5
19799	1370	17	4
19800	1370	18	6
19801	1470	1	7
19802	1470	2	4
19803	1470	3	5
19804	1470	4	4
19805	1470	5	6
19815	1470	15	4
19816	1470	16	6
19817	1470	17	6
19818	1470	18	5
19819	1461	1	5
19820	1461	2	5
19821	1461	3	5
19822	1461	4	6
19823	1461	5	9
19824	1461	6	5
19825	1461	7	7
19826	1461	8	5
19827	1461	9	3
19828	1461	10	3
19829	1461	11	3
19830	1461	12	6
19831	1461	13	5
19832	1461	14	3
19833	1461	15	3
19834	1461	16	6
19835	1461	17	6
19836	1461	18	5
19837	1460	1	6
19838	1460	2	4
19839	1460	3	4
19840	1460	4	7
19841	1460	5	7
19842	1460	6	6
19843	1460	7	6
19844	1460	8	9
19845	1460	9	4
19846	1460	10	4
19847	1460	11	5
19848	1460	12	5
19849	1460	13	5
19850	1460	14	5
19851	1460	15	6
19852	1460	16	6
19853	1460	17	6
19854	1460	18	5
19855	1373	1	5
19856	1373	2	3
19857	1373	3	3
19858	1373	4	5
19859	1373	5	5
19860	1373	6	4
19861	1373	7	5
19862	1373	8	4
19863	1373	9	2
19864	1373	10	4
19865	1373	11	5
19866	1373	12	5
19867	1373	13	5
19868	1373	14	5
19869	1373	15	4
19870	1373	16	5
19871	1373	17	5
19872	1373	18	5
19873	1375	1	5
19874	1375	2	5
19875	1375	3	5
19876	1375	4	6
19877	1375	5	9
19878	1375	6	5
19879	1375	7	7
19880	1375	8	5
19881	1375	9	3
19882	1375	10	3
19883	1375	11	3
19884	1375	12	6
19885	1375	13	5
19886	1375	14	3
19887	1375	15	3
19888	1375	16	6
19889	1375	17	6
19890	1375	18	5
19891	1376	1	6
19892	1376	2	4
19893	1376	3	4
19894	1376	4	7
19895	1376	5	7
19896	1376	6	6
19897	1376	7	6
19898	1376	8	9
19899	1376	9	4
19900	1376	10	4
19901	1376	11	5
19902	1376	12	5
19903	1376	13	5
19904	1376	14	5
19905	1376	15	6
19906	1376	16	6
19907	1376	17	6
19908	1376	18	5
19909	1380	1	5
19910	1380	2	4
19911	1380	3	4
19912	1380	4	4
19913	1380	5	5
19914	1380	6	6
19915	1380	7	3
19916	1380	8	5
19917	1380	9	4
19918	1380	10	4
19919	1380	11	3
19920	1380	12	4
19921	1380	13	4
19922	1380	14	3
19923	1380	15	4
19924	1380	16	6
19925	1380	17	3
19926	1380	18	6
19927	1379	1	6
19928	1379	2	3
19929	1379	3	4
19930	1379	4	5
19931	1379	5	5
19932	1379	6	7
19933	1379	7	4
19934	1379	8	4
19935	1379	9	3
19936	1379	10	5
19937	1379	11	4
19938	1379	12	4
19939	1379	13	5
19940	1379	14	5
19941	1379	15	4
19942	1379	16	5
19943	1379	17	4
19944	1379	18	4
19945	1374	1	7
19946	1374	2	3
19947	1374	3	4
19948	1374	4	4
19949	1374	5	5
19950	1374	6	7
19951	1374	7	3
19952	1374	8	5
19953	1374	9	3
19954	1374	10	3
19955	1374	11	3
19956	1374	12	4
19957	1374	13	4
19958	1374	14	3
19959	1374	15	6
19960	1374	16	5
19961	1374	17	5
19962	1374	18	4
19963	1368	1	6
19964	1368	2	4
19965	1368	3	4
19966	1368	4	5
19967	1368	5	6
19968	1368	6	6
19969	1368	7	5
19970	1368	8	7
19971	1368	9	5
19972	1368	10	7
19973	1368	11	5
19974	1368	12	6
19975	1368	13	5
19976	1368	14	4
19977	1368	15	4
19978	1368	16	6
19979	1368	17	6
19980	1368	18	7
19981	1365	1	5
19982	1365	2	3
19983	1365	3	6
19984	1365	4	7
19985	1365	5	7
19986	1365	6	4
19987	1365	7	4
19988	1365	8	4
19989	1365	9	3
19990	1365	10	4
19991	1365	11	4
19992	1365	12	5
19993	1365	13	4
19994	1365	14	2
19995	1365	15	4
19996	1365	16	7
19997	1365	17	5
19998	1365	18	5
19999	1381	1	5
20000	1381	2	3
20001	1381	3	5
20002	1381	4	4
20003	1381	5	4
20004	1381	6	4
20005	1381	7	2
20006	1381	8	6
20007	1381	9	3
20008	1381	10	4
20009	1381	11	3
20010	1381	12	4
20011	1381	13	3
20012	1381	14	3
20013	1381	15	5
20014	1381	16	5
20015	1381	17	4
20016	1381	18	4
20017	1369	1	4
20018	1369	2	3
20019	1369	3	5
20020	1369	4	5
20021	1369	5	6
20022	1369	6	4
20023	1369	7	4
20024	1369	8	4
20025	1369	9	3
20026	1369	10	4
20027	1369	11	5
20028	1369	12	4
20029	1369	13	3
20030	1369	14	4
20031	1369	15	4
20032	1369	16	4
20033	1369	17	4
20034	1369	18	5
20035	1366	1	7
20036	1366	2	5
20037	1366	3	6
20038	1366	4	8
20039	1366	5	5
20040	1366	6	7
20041	1366	7	5
20042	1366	8	5
20043	1366	9	6
20044	1366	10	8
20045	1366	11	6
20046	1366	12	6
20047	1366	13	5
20048	1366	14	6
20049	1366	15	5
20050	1366	16	7
20051	1366	17	5
20052	1366	18	6
20053	1394	1	4
20054	1394	2	4
20055	1394	3	4
20056	1394	4	6
20057	1394	5	7
20058	1394	6	5
20059	1394	7	4
20060	1394	8	4
20061	1394	9	4
20062	1394	10	6
20063	1394	11	2
20064	1394	12	4
20065	1394	13	4
20066	1394	14	3
20067	1394	15	4
20068	1394	16	5
20069	1394	17	6
20070	1394	18	4
20071	1383	1	8
20072	1383	2	4
20073	1383	3	5
20074	1383	4	5
20075	1383	5	7
20076	1383	6	5
20077	1383	7	3
20078	1383	8	4
20079	1383	9	5
20080	1383	10	6
20081	1383	11	3
20082	1383	12	5
20083	1383	13	5
20084	1383	14	5
20085	1383	15	5
20086	1383	16	7
20087	1383	17	5
20088	1383	18	4
20089	1385	1	6
20090	1385	2	4
20091	1385	3	4
20092	1385	4	5
20093	1385	5	5
20094	1385	6	5
20095	1385	7	3
20096	1385	8	4
20097	1385	9	5
20098	1385	10	4
20099	1385	11	4
20100	1385	12	7
20101	1385	13	4
20102	1385	14	4
20103	1385	15	5
20104	1385	16	5
20105	1385	17	9
20106	1385	18	5
20107	1389	1	4
20108	1389	2	4
20109	1389	3	5
20110	1389	4	5
20111	1389	5	4
20112	1389	6	7
20113	1389	7	3
20114	1389	8	9
20115	1389	9	4
20116	1389	10	5
20117	1389	11	6
20118	1389	12	5
20119	1389	13	4
20120	1389	14	5
20121	1389	15	6
20122	1389	16	6
20123	1389	17	7
20124	1389	18	5
20125	1371	1	4
20126	1371	2	4
20127	1371	3	4
20128	1371	4	5
20129	1371	5	5
20130	1371	6	6
20131	1371	7	4
20132	1371	8	4
20133	1371	9	4
20134	1371	10	8
20135	1371	11	4
20136	1371	12	6
20137	1371	13	5
20138	1371	14	4
20139	1371	15	7
20140	1371	16	4
20141	1371	17	4
20142	1371	18	6
20143	1364	1	6
20144	1364	2	5
20145	1364	3	5
20146	1364	4	3
20147	1364	5	7
20148	1364	6	5
20149	1364	7	3
20150	1364	8	4
20151	1364	9	4
20152	1364	10	5
20153	1364	11	4
20154	1364	12	5
20155	1364	13	7
20156	1364	14	4
20157	1364	15	6
20158	1364	16	8
20159	1364	17	7
20160	1364	18	8
20161	1473	1	10
20162	1473	2	5
20163	1473	3	6
20164	1473	4	6
20165	1473	5	7
20166	1473	6	6
20167	1473	7	4
20168	1473	8	8
20169	1473	9	4
20170	1473	10	6
20171	1473	11	5
20172	1473	12	6
20173	1473	13	6
20174	1473	14	6
20175	1473	15	7
20176	1473	16	5
20177	1473	17	5
20178	1473	18	7
20179	1462	1	6
20180	1462	2	4
20181	1462	3	4
20182	1462	4	5
20183	1462	5	6
20184	1462	6	6
20185	1462	7	5
20186	1462	8	7
20187	1462	9	5
20188	1462	10	7
20189	1462	11	5
20190	1462	12	6
20191	1462	13	5
20192	1462	14	4
20193	1462	15	4
20194	1462	16	6
20195	1462	17	6
20196	1462	18	7
20197	1468	1	5
20198	1468	2	3
20199	1468	3	6
20200	1468	4	7
20201	1468	5	7
20202	1468	6	4
20203	1468	7	4
20204	1468	8	4
20205	1468	9	3
20206	1468	10	4
20207	1468	11	4
20208	1468	12	5
20209	1468	13	4
20210	1468	14	2
20211	1468	15	4
20212	1468	16	7
20213	1468	17	5
20214	1468	18	5
20215	1471	1	4
20216	1471	2	4
20217	1471	3	4
20218	1471	4	6
20219	1471	5	7
20220	1471	6	5
20221	1471	7	4
20222	1471	8	4
20223	1471	9	4
20224	1471	10	6
20225	1471	11	2
20226	1471	12	4
20227	1471	13	4
20228	1471	14	3
20229	1471	15	4
20230	1471	16	5
20231	1471	17	6
20232	1471	18	4
20233	1469	1	6
20234	1469	2	4
20235	1469	3	4
20236	1469	4	4
20237	1469	5	5
20238	1469	6	5
20239	1469	7	3
20240	1469	8	4
20241	1469	9	4
20242	1469	10	7
20243	1469	11	4
20244	1469	12	4
20245	1469	13	5
20246	1469	14	3
20247	1469	15	6
20248	1469	16	5
20249	1469	17	4
20250	1469	18	6
20251	1467	1	6
20252	1467	2	5
20253	1467	3	5
20254	1467	4	3
20255	1467	5	7
20256	1467	6	5
20257	1467	7	3
20258	1467	8	4
20259	1467	9	4
20260	1467	10	5
20261	1467	11	4
20262	1467	12	5
20263	1467	13	7
20264	1467	14	4
20265	1467	15	6
20266	1467	16	8
20267	1467	17	7
20268	1467	18	8
20269	1463	1	8
20270	1463	2	5
20271	1463	3	5
20272	1463	4	5
20273	1463	5	6
20274	1463	6	5
20275	1463	7	3
20276	1463	8	4
20277	1463	9	4
20278	1463	10	7
20279	1463	11	5
20280	1463	12	5
20281	1463	13	6
20282	1463	14	5
20283	1463	15	7
20284	1463	16	7
20285	1463	17	7
20286	1463	18	9
20287	1392	1	10
20288	1392	2	7
20289	1392	3	8
20290	1392	4	6
20291	1392	5	9
20292	1392	6	6
20293	1392	7	4
20294	1392	8	5
20295	1392	9	4
20296	1392	10	5
20297	1392	11	6
20298	1392	12	6
20299	1392	13	9
20300	1392	14	5
20301	1392	15	7
20302	1392	16	13
20303	1392	17	5
20304	1392	18	9
20305	1372	1	10
20306	1372	2	4
20307	1372	3	7
20308	1372	4	5
20309	1372	5	9
20310	1372	6	7
20311	1372	7	4
20312	1372	8	6
20313	1372	9	3
20314	1372	10	5
20315	1372	11	3
20316	1372	12	6
20317	1372	13	4
20318	1372	14	3
20319	1372	15	4
20320	1372	16	5
20321	1372	17	3
20322	1372	18	5
20323	1367	1	4
20324	1367	2	4
20325	1367	3	5
20326	1367	4	4
20327	1367	5	6
20328	1367	6	5
20329	1367	7	4
20330	1367	8	4
20331	1367	9	3
20332	1367	10	5
20333	1367	11	4
20334	1367	12	6
20335	1367	13	5
20336	1367	14	5
20337	1367	15	5
20338	1367	16	5
20339	1367	17	4
20340	1367	18	4
20341	1391	1	7
20342	1391	2	5
20343	1391	3	6
20344	1391	4	4
20345	1391	5	8
20346	1391	6	4
20347	1391	7	5
20348	1391	8	3
20349	1391	9	6
20350	1391	10	5
20351	1391	11	2
20352	1391	12	6
20353	1391	13	4
20354	1391	14	4
20355	1391	15	6
20356	1391	16	5
20357	1391	17	5
20358	1391	18	6
20359	1464	1	7
20360	1464	2	3
20361	1464	3	5
20362	1464	4	5
20363	1464	5	5
20364	1464	6	6
20365	1464	7	4
20366	1464	8	5
20367	1464	9	6
20368	1464	10	5
20369	1464	11	4
20370	1464	12	4
20371	1464	13	6
20372	1464	14	5
20373	1464	15	5
20374	1464	16	7
20375	1464	17	6
20376	1464	18	8
20377	1466	1	7
20378	1466	2	4
20379	1466	3	5
20380	1466	4	4
20381	1466	5	6
20382	1466	6	6
20383	1466	7	4
20384	1466	8	6
20385	1466	9	3
20386	1466	10	5
20387	1466	11	3
20388	1466	12	5
20389	1466	13	4
20390	1466	14	4
20391	1466	15	5
20392	1466	16	8
20393	1466	17	4
20394	1466	18	6
20395	1393	1	5
20396	1393	2	4
20397	1393	3	6
20398	1393	4	6
20399	1393	5	7
20400	1393	6	5
20401	1393	7	3
20402	1393	8	5
20403	1393	9	5
20404	1393	10	5
20405	1393	11	3
20406	1393	12	5
20407	1393	13	5
20408	1393	14	4
20409	1393	15	6
20410	1393	16	7
20411	1393	17	5
20412	1393	18	5
20413	1390	1	8
20414	1390	2	5
20415	1390	3	5
20416	1390	4	5
20417	1390	5	9
20418	1390	6	7
20419	1390	7	4
20420	1390	8	5
20421	1390	9	3
20422	1390	10	8
20423	1390	11	5
20424	1390	12	6
20425	1390	13	6
20426	1390	14	4
20427	1390	15	5
20428	1390	16	5
20429	1390	17	5
20430	1390	18	5
20431	1382	1	8
20432	1382	2	4
20433	1382	3	6
20434	1382	4	8
20435	1382	5	8
20436	1382	6	7
20437	1382	7	4
20438	1382	8	8
20439	1382	9	4
20440	1382	10	5
20441	1382	11	3
20442	1382	12	5
20443	1382	13	6
20444	1382	14	3
20445	1382	15	6
20446	1382	16	6
20447	1382	17	4
20448	1382	18	8
20449	1472	1	6
20450	1472	2	4
20451	1472	3	6
20452	1472	4	5
20453	1472	5	7
20454	1472	6	4
20455	1472	7	6
20456	1472	8	6
20457	1472	9	5
20458	1472	10	5
20459	1472	11	4
20460	1472	12	5
20461	1472	13	5
20462	1472	14	4
20463	1472	15	4
20464	1472	16	9
20465	1472	17	4
20466	1472	18	7
20467	1400	1	8
20468	1400	2	5
20469	1400	3	6
20470	1400	4	7
20471	1400	5	6
20472	1400	6	7
20473	1400	7	5
20474	1400	8	4
20475	1400	9	4
20476	1400	10	6
20477	1400	11	5
20478	1400	12	6
20479	1400	13	5
20480	1400	14	5
20481	1400	15	7
20482	1400	16	5
20483	1400	17	5
20484	1400	18	6
20485	1408	1	6
20486	1408	2	4
20487	1408	3	5
20488	1408	4	9
20489	1408	5	7
20490	1408	6	7
20491	1408	7	3
20492	1408	8	5
20493	1408	9	3
20494	1408	10	5
20495	1408	11	3
20496	1408	12	4
20497	1408	13	7
20498	1408	14	6
20499	1408	15	7
20500	1408	16	5
20501	1408	17	6
20502	1408	18	7
20503	1396	1	7
20504	1396	2	4
20505	1396	3	5
20506	1396	4	8
20507	1396	5	7
20508	1396	6	4
20509	1396	7	4
20510	1396	8	5
20511	1396	9	4
20512	1396	10	4
20513	1396	11	4
20514	1396	12	8
20515	1396	13	6
20516	1396	14	5
20517	1396	15	4
20518	1396	16	5
20519	1396	17	5
20520	1396	18	4
20521	1403	1	5
20522	1403	2	4
20523	1403	3	5
20524	1403	4	5
20525	1403	5	5
20526	1403	6	5
20527	1403	7	5
20528	1403	8	4
20529	1403	9	3
20530	1403	10	4
20531	1403	11	3
20532	1403	12	3
20533	1403	13	4
20534	1403	14	4
20535	1403	15	4
20536	1403	16	4
20537	1403	17	5
20538	1403	18	5
20539	1419	1	7
20540	1419	2	3
20541	1419	3	7
20542	1419	4	7
20543	1419	5	5
20544	1419	6	6
20545	1419	7	4
20546	1419	8	6
20547	1419	9	3
20548	1419	10	6
20549	1419	11	3
20550	1419	12	5
20551	1419	13	5
20552	1419	14	4
20553	1419	15	7
20554	1419	16	5
20555	1419	17	4
20556	1419	18	6
20557	1478	1	7
20558	1478	2	3
20559	1478	3	6
20560	1478	4	5
20561	1478	5	6
20562	1478	6	6
20563	1478	7	3
20564	1478	8	4
20565	1478	9	4
20566	1478	10	5
20567	1478	11	4
20568	1478	12	4
20569	1478	13	5
20570	1478	14	4
20571	1478	15	8
20572	1478	16	6
20573	1478	17	6
20574	1478	18	6
20575	1480	1	7
20576	1480	2	4
20577	1480	3	5
20578	1480	4	8
20579	1480	5	7
20580	1480	6	4
20581	1480	7	4
20582	1480	8	5
20583	1480	9	4
20584	1480	10	4
20585	1480	11	4
20586	1480	12	8
20587	1480	13	6
20588	1480	14	5
20589	1480	15	4
20590	1480	16	5
20591	1480	17	5
20592	1480	18	4
20594	1476	2	5
20595	1476	3	5
20596	1476	4	4
20597	1476	5	5
20598	1476	6	5
20599	1476	7	3
20600	1476	8	5
20601	1476	9	3
20602	1476	10	4
20603	1476	11	3
20684	1405	2	5
20685	1405	3	4
20686	1405	4	6
20593	1476	1	7
20604	1476	12	5
20605	1476	13	5
20606	1476	14	3
20607	1476	15	5
20608	1476	16	5
20609	1476	17	4
20610	1476	18	5
20611	1426	1	7
20612	1426	2	5
20613	1426	3	5
20614	1426	4	4
20615	1426	5	5
20616	1426	6	5
20617	1426	7	3
20618	1426	8	5
20619	1426	9	3
20620	1426	10	4
20621	1426	11	3
20622	1426	12	5
20623	1426	13	5
20624	1426	14	3
20625	1426	15	5
20626	1426	16	5
20627	1426	17	4
20628	1426	18	5
20629	1401	1	4
20630	1401	2	3
20631	1401	3	5
20632	1401	4	4
20633	1401	5	5
20634	1401	6	5
20635	1401	7	4
20636	1401	8	3
20637	1401	9	3
20638	1401	10	4
20639	1401	11	4
20640	1401	12	6
20641	1401	13	4
20642	1401	14	4
20643	1401	15	4
20644	1401	16	5
20645	1401	17	6
20646	1401	18	4
20647	1413	1	5
20648	1413	2	4
20649	1413	3	5
20650	1413	4	5
20651	1413	5	5
20652	1413	6	4
20653	1413	7	3
20654	1413	8	4
20655	1413	9	3
20656	1413	10	7
20657	1413	11	3
20658	1413	12	4
20659	1413	13	5
20660	1413	14	4
20661	1413	15	4
20662	1413	16	5
20663	1413	17	5
20664	1413	18	4
20665	1417	1	5
20666	1417	2	4
20667	1417	3	5
20668	1417	4	4
20669	1417	5	6
20670	1417	6	6
20671	1417	7	4
20672	1417	8	5
20673	1417	9	4
20674	1417	10	5
20675	1417	11	4
20676	1417	12	6
20677	1417	13	5
20678	1417	14	5
20679	1417	15	4
20680	1417	16	6
20681	1417	17	4
20682	1417	18	6
20683	1405	1	4
20687	1405	5	7
20688	1405	6	6
20689	1405	7	3
20690	1405	8	5
20691	1405	9	5
20692	1405	10	4
20693	1405	11	4
20694	1405	12	5
20695	1405	13	5
20696	1405	14	5
20697	1405	15	4
20698	1405	16	5
20699	1405	17	4
20700	1405	18	5
20701	1485	1	8
20702	1485	2	5
20703	1485	3	6
20704	1485	4	7
20705	1485	5	6
20706	1485	6	7
20707	1485	7	5
20708	1485	8	4
20709	1485	9	4
20710	1485	10	6
20711	1485	11	5
20712	1485	12	6
20713	1485	13	5
20714	1485	14	5
20715	1485	15	7
20716	1485	16	5
20717	1485	17	5
20718	1485	18	6
20719	1487	1	6
20720	1487	2	4
20721	1487	3	5
20722	1487	4	9
20723	1487	5	7
20724	1487	6	7
20725	1487	7	3
20726	1487	8	5
20727	1487	9	3
20728	1487	10	5
20729	1487	11	3
20730	1487	12	4
20731	1487	13	7
20732	1487	14	6
20733	1487	15	7
20734	1487	16	5
20735	1487	17	6
20736	1487	18	7
20737	1427	1	6
20738	1427	2	4
20739	1427	3	6
20740	1427	4	4
20741	1427	5	6
20742	1427	6	5
20743	1427	7	3
20744	1427	8	6
20745	1427	9	4
20746	1427	10	4
20747	1427	11	3
20748	1427	12	4
20749	1427	13	4
20750	1427	14	4
20751	1427	15	4
20752	1427	16	4
20753	1427	17	3
20754	1427	18	5
20755	1415	1	7
20756	1415	2	4
20757	1415	3	6
20758	1415	4	5
20759	1415	5	5
20760	1415	6	5
20761	1415	7	8
20762	1415	8	7
20763	1415	9	5
20764	1415	10	6
20765	1415	11	4
20766	1415	12	9
20767	1415	13	6
20768	1415	14	5
20769	1415	15	4
20770	1415	16	9
20771	1415	17	4
20772	1415	18	6
20773	1411	1	6
20774	1411	2	3
20775	1411	3	5
20776	1411	4	4
20777	1411	5	6
20778	1411	6	5
20779	1411	7	3
20780	1411	8	4
20781	1411	9	4
20782	1411	10	5
20783	1411	11	2
20784	1411	12	5
20785	1411	13	4
20786	1411	14	4
20787	1411	15	5
20788	1411	16	4
20789	1411	17	4
20790	1411	18	4
20791	1409	1	5
20792	1409	2	4
20793	1409	3	5
20794	1409	4	4
20795	1409	5	5
20796	1409	6	5
20797	1409	7	2
20798	1409	8	5
20799	1409	9	3
20800	1409	10	6
20801	1409	11	3
20802	1409	12	4
20803	1409	13	6
20804	1409	14	5
20805	1409	15	5
20806	1409	16	4
20807	1409	17	4
20808	1409	18	4
20809	1406	1	6
20810	1406	2	3
20811	1406	3	5
20812	1406	4	4
20813	1406	5	6
20814	1406	6	5
20815	1406	7	2
20816	1406	8	4
20817	1406	9	3
20818	1406	10	6
20819	1406	11	4
20820	1406	12	5
20821	1406	13	5
20822	1406	14	3
20823	1406	15	4
20824	1406	16	4
20825	1406	17	5
20826	1406	18	4
20827	1416	1	7
20828	1416	2	4
20829	1416	3	4
20830	1416	4	5
20831	1416	5	7
20832	1416	6	5
20833	1416	7	3
20834	1416	8	4
20835	1416	9	3
20836	1416	10	6
20837	1416	11	3
20838	1416	12	5
20839	1416	13	5
20840	1416	14	4
20841	1416	15	4
20842	1416	16	6
20843	1416	17	5
20844	1416	18	5
20845	1477	1	7
20846	1477	2	4
20847	1477	3	4
20848	1477	4	5
20849	1477	5	7
20850	1477	6	5
20851	1477	7	3
20852	1477	8	4
20853	1477	9	3
20854	1477	10	6
20855	1477	11	3
20856	1477	12	5
20857	1477	13	5
20858	1477	14	4
20859	1477	15	4
20860	1477	16	6
20861	1477	17	5
20862	1477	18	5
20863	1423	1	7
20864	1423	2	5
20865	1423	3	5
20866	1423	4	5
20867	1423	5	6
20868	1423	6	5
20869	1423	7	4
20870	1423	8	9
20871	1423	9	8
20872	1423	10	6
20873	1423	11	4
20874	1423	12	6
20875	1423	13	5
20876	1423	14	5
20877	1423	15	5
20878	1423	16	6
20879	1423	17	6
20880	1423	18	5
20881	1421	1	6
20882	1421	2	5
20883	1421	3	8
20884	1421	4	5
20885	1421	5	6
20886	1421	6	9
20887	1421	7	4
20888	1421	8	9
20889	1421	9	4
20890	1421	10	8
20891	1421	11	4
20892	1421	12	5
20893	1421	13	7
20894	1421	14	4
20895	1421	15	5
20896	1421	16	12
20897	1421	17	4
20898	1421	18	8
20899	1425	1	6
20900	1425	2	6
20901	1425	3	5
20902	1425	4	5
20903	1425	5	8
20904	1425	6	4
20905	1425	7	5
20906	1425	8	5
20907	1425	9	6
20908	1425	10	9
20909	1425	11	4
20910	1425	12	5
20911	1425	13	5
20912	1425	14	5
20913	1425	15	6
20914	1425	16	5
20915	1425	17	5
20916	1425	18	6
20917	1410	1	6
20918	1410	2	3
20919	1410	3	4
20920	1410	4	5
20921	1410	5	6
20922	1410	6	3
20923	1410	7	4
20924	1410	8	3
20925	1410	9	2
20926	1410	10	5
20927	1410	11	3
20928	1410	12	4
20929	1410	13	4
20930	1410	14	2
20931	1410	15	4
20932	1410	16	6
20933	1410	17	3
20934	1410	18	5
20935	1412	1	12
20936	1412	2	4
20937	1412	3	5
20938	1412	4	5
20939	1412	5	6
20940	1412	6	6
20941	1412	7	3
20942	1412	8	4
20943	1412	9	2
20944	1412	10	5
20945	1412	11	3
20946	1412	12	4
20947	1412	13	6
20948	1412	14	2
20949	1412	15	4
20950	1412	16	6
20951	1412	17	4
20952	1412	18	6
20953	1402	1	5
20954	1402	2	3
20955	1402	3	5
20956	1402	4	5
20957	1402	5	5
20958	1402	6	5
20959	1402	7	3
20960	1402	8	4
20961	1402	9	3
20962	1402	10	4
20963	1402	11	3
20964	1402	12	5
20965	1402	13	5
20966	1402	14	3
20967	1402	15	4
20968	1402	16	5
20969	1402	17	4
20970	1402	18	4
20971	1414	1	6
20972	1414	2	4
20973	1414	3	5
20974	1414	4	6
20975	1414	5	9
20976	1414	6	5
20977	1414	7	5
20978	1414	8	4
20979	1414	9	5
20980	1414	10	5
20981	1414	11	6
20982	1414	12	5
20983	1414	13	5
20984	1414	14	5
20985	1414	15	6
20986	1414	16	6
20987	1414	17	8
20988	1414	18	6
20989	1424	1	8
20990	1424	2	8
20991	1424	3	6
20992	1424	4	7
20993	1424	5	12
20994	1424	6	7
20995	1424	7	4
20996	1424	8	7
20997	1424	9	4
20998	1424	10	7
20999	1424	11	3
21000	1424	12	7
21001	1424	13	6
21002	1424	14	6
21003	1424	15	5
21004	1424	16	9
21005	1424	17	5
21006	1424	18	7
21007	1422	1	6
21008	1422	2	5
21009	1422	3	7
21010	1422	4	8
21011	1422	5	6
21012	1422	6	7
21013	1422	7	3
21014	1422	8	6
21015	1422	9	4
21016	1422	10	6
21017	1422	11	3
21018	1422	12	6
21019	1422	13	4
21020	1422	14	4
21021	1422	15	5
21022	1422	16	6
21023	1422	17	4
21024	1422	18	6
21025	1399	1	4
21026	1399	2	4
21027	1399	3	4
21028	1399	4	4
21029	1399	5	5
21030	1399	6	4
21031	1399	7	3
21032	1399	8	4
21033	1399	9	3
21034	1399	10	4
21035	1399	11	4
21036	1399	12	6
21037	1399	13	6
21038	1399	14	4
21039	1399	15	4
21040	1399	16	5
21041	1399	17	4
21042	1399	18	5
21043	1474	1	9
21044	1474	2	6
21045	1474	3	8
21046	1474	4	6
21047	1474	5	9
21048	1474	6	7
21049	1474	7	6
21050	1474	8	7
21051	1474	9	5
21052	1474	10	6
21053	1474	11	5
21054	1474	12	6
21055	1474	13	5
21056	1474	14	6
21057	1474	15	7
21058	1474	16	8
21059	1474	17	7
21060	1474	18	6
21061	1483	1	7
21062	1483	2	4
21063	1483	3	6
21064	1483	4	6
21065	1483	5	7
21066	1483	6	9
21067	1483	7	5
21068	1483	8	5
21069	1483	9	5
21070	1483	10	8
21071	1483	11	4
21072	1483	12	4
21073	1483	13	5
21074	1483	14	4
21075	1483	15	5
21076	1483	16	4
21077	1483	17	5
21078	1483	18	6
21079	1481	1	6
21080	1481	2	5
21081	1481	3	5
21082	1481	4	5
21083	1481	5	6
21084	1481	6	5
21085	1481	7	4
21086	1481	8	4
21087	1481	9	6
21088	1481	10	4
21089	1481	11	4
21090	1481	12	5
21091	1481	13	5
21092	1481	14	4
21093	1481	15	5
21094	1481	16	5
21095	1481	17	5
21096	1481	18	7
21097	1549	1	8
21098	1549	2	4
21099	1549	3	5
21100	1549	4	7
21101	1549	5	7
21102	1549	6	7
21103	1549	7	3
21104	1549	8	7
21105	1549	9	7
21106	1549	10	6
21107	1549	11	4
21108	1549	12	6
21109	1549	13	6
21110	1549	14	5
21111	1549	15	7
21112	1549	16	7
21113	1549	17	7
21114	1549	18	7
21115	1552	1	5
21116	1552	2	3
21117	1552	3	5
21118	1552	4	7
21119	1552	5	5
21120	1552	6	5
21121	1552	7	5
21122	1552	8	4
21123	1552	9	4
21124	1552	10	7
21125	1552	11	3
21126	1552	12	4
21127	1552	13	8
21128	1552	14	4
21129	1552	15	5
21130	1552	16	7
21131	1552	17	5
21132	1552	18	7
21134	1530	2	0
21135	1530	3	0
21136	1530	4	0
21137	1530	5	0
21138	1530	6	0
21139	1530	7	0
21140	1530	8	0
21141	1530	9	0
21142	1530	10	0
21143	1530	11	0
21144	1530	12	0
21145	1530	13	0
21146	1530	14	0
21147	1530	15	0
21148	1530	16	0
21149	1530	17	0
21150	1530	18	0
21151	1527	1	6
21152	1527	2	6
21153	1527	3	4
21154	1527	4	8
21155	1527	5	8
21156	1527	6	7
21157	1527	7	3
21158	1527	8	3
21159	1527	9	5
21160	1527	10	6
21161	1527	11	4
21162	1527	12	6
21163	1527	13	6
21164	1527	14	4
21165	1527	15	5
21166	1527	16	6
21167	1527	17	7
21168	1527	18	8
21169	1543	1	9
21170	1543	2	3
21171	1543	3	6
21172	1543	4	5
21173	1543	5	7
21174	1543	6	6
21175	1543	7	4
21176	1543	8	6
21177	1543	9	5
21178	1543	10	6
21179	1543	11	4
21180	1543	12	7
21181	1543	13	5
21182	1543	14	5
21183	1543	15	5
21184	1543	16	7
21185	1543	17	5
21186	1543	18	6
21187	1511	1	9
21188	1511	2	3
21189	1511	3	5
21190	1511	4	5
21191	1511	5	8
21192	1511	6	5
21193	1511	7	4
21194	1511	8	6
21195	1511	9	6
21196	1511	10	5
21197	1511	11	5
21198	1511	12	4
21199	1511	13	6
21200	1511	14	4
21201	1511	15	6
21202	1511	16	7
21203	1511	17	5
21204	1511	18	4
21205	1529	1	8
21206	1529	2	4
21207	1529	3	6
21208	1529	4	5
21209	1529	5	8
21210	1529	6	7
21211	1529	7	4
21212	1529	8	15
21213	1529	9	4
21214	1529	10	9
21215	1529	11	5
21216	1529	12	6
21217	1529	13	6
21218	1529	14	5
21219	1529	15	6
21220	1529	16	10
21221	1529	17	6
21222	1529	18	8
21223	1554	1	5
21224	1554	2	4
21225	1554	3	6
21226	1554	4	4
21227	1554	5	5
21228	1554	6	5
21229	1554	7	4
21230	1554	8	4
21231	1554	9	4
21232	1554	10	6
21233	1554	11	3
21234	1554	12	3
21235	1554	13	5
21236	1554	14	3
21237	1554	15	4
21238	1554	16	10
21239	1554	17	5
21240	1554	18	4
21241	1512	1	6
21242	1512	2	4
21243	1512	3	4
21244	1512	4	4
21245	1512	5	6
21246	1512	6	7
21247	1512	7	4
21248	1512	8	4
21249	1512	9	5
21250	1512	10	6
21251	1512	11	6
21252	1512	12	4
21253	1512	13	6
21254	1512	14	5
21255	1512	15	5
21256	1512	16	6
21257	1512	17	5
21258	1512	18	4
21259	1541	1	6
21260	1541	2	7
21261	1541	3	6
21262	1541	4	6
21263	1541	5	8
21264	1541	6	6
21265	1541	7	4
21266	1541	8	6
21267	1541	9	5
21268	1541	10	9
21269	1541	11	6
21270	1541	12	5
21271	1541	13	7
21272	1541	14	5
21273	1541	15	5
21274	1541	16	10
21275	1541	17	3
21276	1541	18	7
21277	1509	1	10
21278	1509	2	4
21279	1509	3	5
21280	1509	4	5
21281	1509	5	8
21282	1509	6	6
21283	1509	7	4
21284	1509	8	6
21285	1509	9	3
21286	1509	10	6
21287	1509	11	5
21288	1509	12	5
21289	1509	13	6
21290	1509	14	4
21291	1509	15	5
21292	1509	16	7
21293	1509	17	5
21294	1509	18	7
21295	1547	1	6
21296	1547	2	6
21297	1547	3	6
21298	1547	4	6
21299	1547	5	6
21300	1547	6	6
21301	1547	7	6
21302	1547	8	7
21303	1547	9	5
21304	1547	10	4
21305	1547	11	3
21306	1547	12	4
21307	1547	13	5
21308	1547	14	5
21309	1547	15	6
21310	1547	16	8
21311	1547	17	6
21312	1547	18	7
21313	1505	1	6
21314	1505	2	9
21315	1505	3	7
21316	1505	4	5
21317	1505	5	6
21318	1505	6	5
21319	1505	7	3
21320	1505	8	5
21321	1505	9	4
21322	1505	10	4
21323	1505	11	4
21324	1505	12	6
21325	1505	13	6
21326	1505	14	4
21327	1505	15	5
21328	1505	16	10
21329	1505	17	5
21330	1505	18	6
21405	1502	3	6
21406	1502	4	7
21407	1502	5	7
21408	1502	6	5
21409	1502	7	5
21410	1502	8	6
21411	1502	9	4
21412	1502	10	7
21413	1502	11	5
21331	1510	1	6
21332	1510	2	10
21333	1510	3	5
21334	1510	4	6
21335	1510	5	7
21336	1510	6	7
21337	1510	7	7
21338	1510	8	7
21339	1510	9	4
21340	1510	10	3
21341	1510	11	4
21342	1510	12	4
21343	1510	13	7
21344	1510	14	5
21345	1510	15	5
21346	1510	16	7
21347	1510	17	6
21348	1510	18	10
21349	1508	1	8
21350	1508	2	4
21351	1508	3	7
21352	1508	4	6
21353	1508	5	7
21354	1508	6	6
21355	1508	7	8
21356	1508	8	6
21357	1508	9	5
21358	1508	10	7
21359	1508	11	7
21360	1508	12	5
21361	1508	13	6
21362	1508	14	9
21363	1508	15	7
21364	1508	16	8
21365	1508	17	7
21366	1508	18	7
21367	1507	1	8
21368	1507	2	4
21369	1507	3	6
21370	1507	4	6
21371	1507	5	5
21372	1507	6	4
21373	1507	7	4
21374	1507	8	5
21375	1507	9	5
21376	1507	10	4
21377	1507	11	3
21378	1507	12	4
21379	1507	13	6
21380	1507	14	5
21381	1507	15	4
21382	1507	16	6
21383	1507	17	5
21384	1507	18	9
21385	1504	1	7
21386	1504	2	4
21387	1504	3	5
21388	1504	4	5
21389	1504	5	7
21390	1504	6	6
21391	1504	7	6
21392	1504	8	4
21393	1504	9	5
21394	1504	10	6
21395	1504	11	3
21396	1504	12	4
21397	1504	13	6
21398	1504	14	4
21399	1504	15	5
21400	1504	16	7
21401	1504	17	5
21402	1504	18	5
21403	1502	1	10
21404	1502	2	4
21414	1502	12	7
21415	1502	13	7
21416	1502	14	6
21417	1502	15	6
21418	1502	16	8
21419	1502	17	5
21420	1502	18	6
21421	1438	1	5
21422	1438	2	3
21423	1438	3	4
21424	1438	4	4
21425	1438	5	6
21426	1438	6	4
21427	1438	7	3
21428	1438	8	4
21429	1438	9	4
21430	1438	10	4
21431	1438	11	3
21432	1438	12	4
21433	1438	13	4
21434	1438	14	3
21435	1438	15	4
21436	1438	16	5
21437	1438	17	5
21438	1438	18	5
21439	1441	1	5
21440	1441	2	3
21441	1441	3	4
21442	1441	4	4
21443	1441	5	6
21444	1441	6	4
21445	1441	7	3
21446	1441	8	5
21447	1441	9	3
21448	1441	10	7
21449	1441	11	3
21450	1441	12	4
21451	1441	13	4
21452	1441	14	3
21453	1441	15	4
21454	1441	16	6
21455	1441	17	5
21456	1441	18	4
21457	1444	1	8
21458	1444	2	3
21459	1444	3	4
21460	1444	4	5
21461	1444	5	6
21462	1444	6	5
21463	1444	7	4
21464	1444	8	4
21465	1444	9	5
21466	1444	10	5
21467	1444	11	3
21468	1444	12	4
21469	1444	13	5
21470	1444	14	6
21471	1444	15	5
21472	1444	16	5
21473	1444	17	4
21474	1444	18	5
21475	1434	1	4
21476	1434	2	4
21477	1434	3	4
21478	1434	4	8
21479	1434	5	4
21480	1434	6	5
21481	1434	7	5
21482	1434	8	4
21483	1434	9	4
21484	1434	10	5
21485	1434	11	3
21486	1434	12	5
21487	1434	13	6
21488	1434	14	3
21489	1434	15	4
21490	1434	16	4
21491	1434	17	4
21492	1434	18	5
21493	1443	1	5
21494	1443	2	5
21495	1443	3	8
21496	1443	4	4
21497	1443	5	4
21498	1443	6	3
21499	1443	7	3
21500	1443	8	4
21501	1443	9	4
21502	1443	10	6
21503	1443	11	3
21504	1443	12	4
21505	1443	13	3
21506	1443	14	4
21507	1443	15	4
21508	1443	16	6
21509	1443	17	4
21510	1443	18	5
21511	1442	1	5
21512	1442	2	3
21513	1442	3	4
21514	1442	4	4
21515	1442	5	5
21516	1442	6	4
21517	1442	7	3
21518	1442	8	5
21519	1442	9	4
21520	1442	10	4
21521	1442	11	3
21522	1442	12	4
21523	1442	13	4
21524	1442	14	3
21525	1442	15	4
21526	1442	16	5
21527	1442	17	4
21528	1442	18	5
21529	1458	1	6
21530	1458	2	4
21531	1458	3	5
21532	1458	4	4
21533	1458	5	6
21534	1458	6	5
21535	1458	7	3
21536	1458	8	3
21537	1458	9	4
21538	1458	10	5
21539	1458	11	3
21540	1458	12	4
21541	1458	13	6
21542	1458	14	5
21543	1458	15	5
21544	1458	16	5
21545	1458	17	4
21546	1458	18	5
21547	1494	1	6
21548	1494	2	4
21549	1494	3	4
21550	1494	4	4
21551	1494	5	6
21552	1494	6	7
21553	1494	7	4
21554	1494	8	4
21555	1494	9	5
21556	1494	10	6
21557	1494	11	6
21558	1494	12	4
21559	1494	13	6
21560	1494	14	5
21561	1494	15	5
21562	1494	16	6
21563	1494	17	5
21564	1494	18	4
21565	1490	1	6
21566	1490	2	4
21567	1490	3	5
21568	1490	4	4
21569	1490	5	6
21570	1490	6	5
21571	1490	7	3
21572	1490	8	3
21573	1490	9	4
21574	1490	10	5
21575	1490	11	3
21576	1490	12	4
21577	1490	13	6
21578	1490	14	5
21579	1490	15	5
21580	1490	16	5
21581	1490	17	4
21582	1490	18	5
21583	1495	1	6
21584	1495	2	3
21585	1495	3	6
21586	1495	4	5
21587	1495	5	6
21588	1495	6	5
21589	1495	7	4
21590	1495	8	4
21591	1495	9	4
21592	1495	10	6
21593	1495	11	4
21594	1495	12	4
21595	1495	13	7
21596	1495	14	3
21597	1495	15	5
21598	1495	16	8
21599	1495	17	5
21600	1495	18	5
21601	1497	1	9
21602	1497	2	3
21603	1497	3	5
21604	1497	4	5
21605	1497	5	8
21606	1497	6	5
21607	1497	7	4
21608	1497	8	6
21609	1497	9	6
21610	1497	10	5
21611	1497	11	5
21612	1497	12	4
21613	1497	13	6
21614	1497	14	4
21615	1497	15	6
21616	1497	16	7
21617	1497	17	5
21618	1497	18	4
21619	1499	1	10
21620	1499	2	4
21621	1499	3	5
21622	1499	4	5
21623	1499	5	8
21624	1499	6	6
21625	1499	7	4
21626	1499	8	6
21627	1499	9	3
21628	1499	10	6
21629	1499	11	5
21630	1499	12	5
21631	1499	13	6
21632	1499	14	4
21633	1499	15	5
21634	1499	16	7
21635	1499	17	5
21636	1499	18	7
21133	1530	1	0
21637	1557	1	5
21638	1557	2	4
21639	1557	3	5
21640	1557	4	5
21641	1557	5	6
21642	1557	6	5
21643	1557	7	4
21644	1557	8	5
21645	1557	9	3
21646	1557	10	6
21647	1557	11	4
21648	1557	12	4
21649	1557	13	8
21650	1557	14	4
21651	1557	15	4
21652	1557	16	7
21653	1557	17	6
21654	1557	18	11
21655	1518	1	5
21656	1518	2	4
21657	1518	3	5
21658	1518	4	4
21659	1518	5	6
21660	1518	6	4
21661	1518	7	3
21662	1518	8	4
21663	1518	9	3
21664	1518	10	4
21665	1518	11	4
21666	1518	12	5
21667	1518	13	6
21668	1518	14	4
21669	1518	15	4
21670	1518	16	5
21671	1518	17	3
21672	1518	18	6
21673	1545	1	6
21674	1545	2	3
21675	1545	3	6
21676	1545	4	4
21677	1545	5	7
21678	1545	6	4
21679	1545	7	6
21680	1545	8	5
21681	1545	9	3
21682	1545	10	5
21683	1545	11	5
21684	1545	12	7
21685	1545	13	7
21686	1545	14	4
21687	1545	15	4
21688	1545	16	6
21689	1545	17	5
21690	1545	18	5
21691	1533	1	5
21692	1533	2	4
21693	1533	3	7
21694	1533	4	4
21695	1533	5	6
21696	1533	6	5
21697	1533	7	5
21698	1533	8	6
21699	1533	9	4
21700	1533	10	4
21701	1533	11	6
21702	1533	12	7
21703	1533	13	4
21704	1533	14	5
21705	1533	15	6
21706	1533	16	7
21707	1533	17	6
21708	1533	18	5
21709	1520	1	5
21710	1520	2	3
21711	1520	3	4
21712	1520	4	4
21713	1520	5	6
21714	1520	6	4
21715	1520	7	3
21716	1520	8	4
21717	1520	9	4
21718	1520	10	4
21719	1520	11	3
21720	1520	12	4
21721	1520	13	4
21722	1520	14	3
21723	1520	15	4
21724	1520	16	5
21725	1520	17	5
21726	1520	18	5
21751	1521	7	3
21752	1521	8	4
21753	1521	9	4
21754	1521	10	6
21755	1521	11	3
21756	1521	12	4
21757	1521	13	3
21758	1521	14	4
21759	1521	15	4
21727	1523	1	5
21728	1523	2	3
21729	1523	3	4
21730	1523	4	4
21731	1523	5	5
21732	1523	6	4
21733	1523	7	3
21734	1523	8	5
21735	1523	9	4
21736	1523	10	4
21737	1523	11	3
21738	1523	12	4
21739	1523	13	4
21740	1523	14	3
21741	1523	15	4
21742	1523	16	5
21743	1523	17	4
21744	1523	18	5
21745	1521	1	5
21746	1521	2	5
21747	1521	3	8
21748	1521	4	4
21749	1521	5	4
21750	1521	6	3
21760	1521	16	6
21761	1521	17	4
21762	1521	18	5
21763	1519	1	5
21764	1519	2	3
21765	1519	3	4
21766	1519	4	4
21767	1519	5	6
21768	1519	6	4
21769	1519	7	3
21770	1519	8	5
21771	1519	9	3
21772	1519	10	7
21773	1519	11	3
21774	1519	12	4
21775	1519	13	4
21776	1519	14	3
21777	1519	15	4
21778	1519	16	6
21779	1519	17	5
21780	1519	18	4
21781	1654	1	6
21782	1654	2	4
21783	1654	3	6
21784	1654	4	0
21785	1654	5	7
21786	1654	6	5
21787	1654	7	4
21788	1654	8	4
21789	1654	9	0
21790	1654	10	4
21791	1654	11	3
21792	1654	12	4
21793	1654	13	5
21794	1654	14	3
21795	1654	15	0
21796	1654	16	6
21797	1654	17	5
21798	1654	18	5
21799	1649	1	7
21800	1649	2	5
21801	1649	3	5
21802	1649	4	0
21803	1649	5	6
21804	1649	6	0
21805	1649	7	4
21806	1649	8	5
21807	1649	9	3
21808	1649	10	0
21809	1649	11	4
21810	1649	12	4
21811	1649	13	5
21812	1649	14	3
21813	1649	15	5
21814	1649	16	0
21815	1649	17	5
21816	1649	18	0
21817	1641	1	0
21818	1641	2	4
21819	1641	3	7
21820	1641	4	5
21821	1641	5	7
21822	1641	6	7
21823	1641	7	5
21824	1641	8	5
21825	1641	9	5
21826	1641	10	0
21827	1641	11	3
21828	1641	12	6
21829	1641	13	6
21830	1641	14	4
21831	1641	15	5
21832	1641	16	7
21833	1641	17	6
21834	1641	18	0
21835	1655	1	5
21836	1655	2	4
21837	1655	3	5
21838	1655	4	4
21839	1655	5	5
21840	1655	6	5
21841	1655	7	3
21842	1655	8	0
21843	1655	9	3
21844	1655	10	4
21845	1655	11	4
21846	1655	12	4
21847	1655	13	0
21848	1655	14	3
21849	1655	15	0
21850	1655	16	0
21851	1655	17	5
21852	1655	18	4
21853	1642	1	6
21854	1642	2	4
21855	1642	3	4
21856	1642	4	6
21857	1642	5	7
21858	1642	6	6
21859	1642	7	4
21860	1642	8	4
21861	1642	9	4
21862	1642	10	4
21863	1642	11	0
21864	1642	12	4
21865	1642	13	6
21866	1642	14	0
21867	1642	15	0
21868	1642	16	0
21869	1642	17	5
21870	1642	18	5
21871	1657	1	0
21872	1657	2	4
21873	1657	3	8
21874	1657	4	7
21875	1657	5	8
21876	1657	6	6
21877	1657	7	6
21878	1657	8	5
21879	1657	9	4
21880	1657	10	4
21881	1657	11	6
21882	1657	12	5
21883	1657	13	5
21884	1657	14	5
21885	1657	15	5
21886	1657	16	7
21887	1657	17	6
21888	1657	18	6
21889	1646	1	6
21890	1646	2	3
21891	1646	3	6
21892	1646	4	6
21893	1646	5	6
21894	1646	6	6
21895	1646	7	4
21896	1646	8	4
21897	1646	9	6
21898	1646	10	5
21899	1646	11	5
21900	1646	12	6
21901	1646	13	5
21902	1646	14	6
21903	1646	15	7
21904	1646	16	7
21905	1646	17	6
21906	1646	18	7
21907	1648	1	0
21908	1648	2	4
21909	1648	3	5
21910	1648	4	4
21911	1648	5	5
21912	1648	6	0
21913	1648	7	0
21914	1648	8	4
21915	1648	9	3
21916	1648	10	0
21917	1648	11	4
21918	1648	12	4
21919	1648	13	0
21920	1648	14	4
21921	1648	15	5
21922	1648	16	6
21923	1648	17	6
21924	1648	18	6
21925	1656	1	6
21926	1656	2	4
21927	1656	3	5
21928	1656	4	6
21929	1656	5	7
21930	1656	6	6
21931	1656	7	5
21932	1656	8	5
21933	1656	9	3
21934	1656	10	6
21935	1656	11	3
21936	1656	12	7
21937	1656	13	6
21938	1656	14	5
21939	1656	15	7
21940	1656	16	5
21941	1656	17	5
21942	1656	18	6
21943	1663	1	7
21944	1663	2	5
21945	1663	3	5
21946	1663	4	4
21947	1663	5	7
21948	1663	6	6
21949	1663	7	5
21950	1663	8	6
21951	1663	9	5
21952	1663	10	6
21953	1663	11	4
21954	1663	12	7
21955	1663	13	6
21956	1663	14	3
21957	1663	15	7
21958	1663	16	8
21959	1663	17	6
21960	1663	18	6
21961	1662	1	6
21962	1662	2	5
21963	1662	3	5
21964	1662	4	6
21965	1662	5	7
21966	1662	6	6
21967	1662	7	0
21968	1662	8	6
21969	1662	9	4
21970	1662	10	6
21971	1662	11	4
21972	1662	12	6
21973	1662	13	0
21974	1662	14	0
21975	1662	15	0
21976	1662	16	7
21977	1662	17	5
21978	1662	18	7
21979	1660	1	6
21980	1660	2	4
21981	1660	3	5
21982	1660	4	7
21983	1660	5	7
21984	1660	6	6
21985	1660	7	0
21986	1660	8	8
21987	1660	9	5
21988	1660	10	5
21989	1660	11	5
21990	1660	12	5
21991	1660	13	6
21992	1660	14	5
21993	1660	15	4
21994	1660	16	7
21995	1660	17	6
21996	1660	18	6
21997	1658	1	0
21998	1658	2	4
21999	1658	3	5
22000	1658	4	7
22001	1658	5	7
22002	1658	6	7
22003	1658	7	4
22004	1658	8	5
22005	1658	9	6
22006	1658	10	5
22007	1658	11	5
22008	1658	12	5
22009	1658	13	0
22010	1658	14	5
22011	1658	15	6
22012	1658	16	0
22013	1658	17	5
22014	1658	18	7
22015	1652	1	6
22016	1652	2	4
22017	1652	3	5
22018	1652	4	4
22019	1652	5	5
22020	1652	6	6
22021	1652	7	4
22022	1652	8	4
22023	1652	9	4
22024	1652	10	5
22025	1652	11	4
22026	1652	12	5
22027	1652	13	5
22028	1652	14	4
22029	1652	15	4
22030	1652	16	7
22031	1652	17	5
22032	1652	18	6
22033	1666	1	5
22034	1666	2	4
22035	1666	3	5
22036	1666	4	4
22037	1666	5	0
22038	1666	6	6
22039	1666	7	4
22040	1666	8	4
22041	1666	9	5
22042	1666	10	5
22043	1666	11	3
22044	1666	12	6
22045	1666	13	5
22046	1666	14	5
22047	1666	15	4
22048	1666	16	6
22049	1666	17	4
22050	1666	18	4
22051	1645	1	0
22052	1645	2	4
22053	1645	3	5
22054	1645	4	5
22055	1645	5	5
22056	1645	6	6
22057	1645	7	4
22058	1645	8	0
22059	1645	9	3
22060	1645	10	5
22061	1645	11	4
22062	1645	12	5
22063	1645	13	6
22064	1645	14	4
22065	1645	15	0
22066	1645	16	7
22067	1645	17	4
22068	1645	18	6
22069	1650	1	7
22070	1650	2	4
22071	1650	3	7
22072	1650	4	5
22073	1650	5	8
22074	1650	6	7
22075	1650	7	5
22076	1650	8	5
22077	1650	9	4
22078	1650	10	4
22079	1650	11	3
22080	1650	12	6
22081	1650	13	5
22082	1650	14	4
22083	1650	15	7
22084	1650	16	5
22085	1650	17	6
22086	1650	18	7
22087	1643	1	5
22088	1643	2	4
22089	1643	3	4
22090	1643	4	6
22091	1643	5	5
22092	1643	6	4
22093	1643	7	5
22094	1643	8	5
22095	1643	9	5
22096	1643	10	4
22097	1643	11	4
22098	1643	12	4
22099	1643	13	7
22100	1643	14	5
22101	1643	15	4
22102	1643	16	7
22103	1643	17	4
22104	1643	18	7
22105	1653	1	7
22106	1653	2	5
22107	1653	3	6
22108	1653	4	5
22109	1653	5	7
22110	1653	6	6
22111	1653	7	6
22112	1653	8	6
22113	1653	9	6
22114	1653	10	0
22115	1653	11	0
22116	1653	12	5
22117	1653	13	6
22118	1653	14	0
22119	1653	15	4
22120	1653	16	7
22121	1653	17	5
22122	1653	18	5
22123	1668	1	7
22124	1668	2	4
22125	1668	3	6
22126	1668	4	6
22127	1668	5	6
22128	1668	6	6
22129	1668	7	4
22130	1668	8	6
22131	1668	9	5
22132	1668	10	5
22133	1668	11	5
22134	1668	12	6
22135	1668	13	6
22136	1668	14	4
22137	1668	15	6
22138	1668	16	8
22139	1668	17	6
22140	1668	18	7
22141	1651	1	6
22142	1651	2	4
22143	1651	3	6
22144	1651	4	7
22145	1651	5	6
22146	1651	6	5
22147	1651	7	4
22148	1651	8	4
22149	1651	9	5
22150	1651	10	5
22151	1651	11	0
22152	1651	12	5
22153	1651	13	7
22154	1651	14	4
22155	1651	15	5
22156	1651	16	6
22157	1651	17	7
22158	1651	18	0
22159	1661	1	7
22160	1661	2	4
22161	1661	3	5
22162	1661	4	7
22163	1661	5	0
22164	1661	6	5
22165	1661	7	0
22166	1661	8	0
22167	1661	9	4
22168	1661	10	0
22169	1661	11	3
22170	1661	12	5
22171	1661	13	0
22172	1661	14	5
22173	1661	15	4
22174	1661	16	7
22175	1661	17	5
22176	1661	18	5
22177	1667	1	7
22178	1667	2	5
22179	1667	3	0
22180	1667	4	8
22181	1667	5	9
22182	1667	6	7
22183	1667	7	7
22184	1667	8	8
22185	1667	9	6
22186	1667	10	6
22187	1667	11	4
22188	1667	12	5
22189	1667	13	6
22190	1667	14	5
22191	1667	15	8
22192	1667	16	8
22193	1667	17	8
22194	1667	18	6
22195	1664	1	0
22196	1664	2	6
22197	1664	3	6
22198	1664	4	6
22199	1664	5	7
22200	1664	6	7
22201	1664	7	0
22202	1664	8	7
22203	1664	9	7
22204	1664	10	5
22205	1664	11	5
22206	1664	12	6
22207	1664	13	6
22208	1664	14	5
22209	1664	15	6
22210	1664	16	7
22211	1664	17	8
22212	1664	18	0
22213	1659	1	0
22214	1659	2	4
22215	1659	3	5
22216	1659	4	0
22217	1659	5	0
22218	1659	6	5
22219	1659	7	4
22220	1659	8	4
22221	1659	9	4
22222	1659	10	5
22223	1659	11	3
22224	1659	12	5
22225	1659	13	5
22226	1659	14	4
22227	1659	15	0
22228	1659	16	5
22229	1659	17	4
22230	1659	18	0
22231	1669	1	6
22232	1669	2	3
22233	1669	3	6
22234	1669	4	4
22235	1669	5	5
22236	1669	6	5
22237	1669	7	3
22238	1669	8	4
22239	1669	9	5
22240	1669	10	4
22241	1669	11	5
22242	1669	12	5
22243	1669	13	5
22244	1669	14	3
22245	1669	15	5
22246	1669	16	6
22247	1669	17	5
22248	1669	18	6
22249	1687	1	6
22250	1687	2	3
22251	1687	3	5
22252	1687	4	4
22253	1687	5	6
22254	1687	6	6
22255	1687	7	3
22256	1687	8	4
22257	1687	9	4
22258	1687	10	4
22259	1687	11	4
22260	1687	12	4
22261	1687	13	4
22262	1687	14	3
22263	1687	15	5
22264	1687	16	6
22265	1687	17	4
22266	1687	18	5
22267	1685	1	7
22268	1685	2	4
22269	1685	3	6
22270	1685	4	5
22271	1685	5	6
22272	1685	6	5
22273	1685	7	3
22274	1685	8	7
22275	1685	9	4
22276	1685	10	5
22277	1685	11	3
22278	1685	12	5
22279	1685	13	5
22280	1685	14	6
22281	1685	15	5
22282	1685	16	5
22283	1685	17	5
22284	1685	18	6
22285	1683	1	6
22286	1683	2	5
22287	1683	3	5
22288	1683	4	0
22289	1683	5	6
22290	1683	6	0
22291	1683	7	4
22292	1683	8	4
22293	1683	9	3
22294	1683	10	6
22295	1683	11	5
22296	1683	12	3
22297	1683	13	4
22298	1683	14	4
22299	1683	15	6
22300	1683	16	6
22301	1683	17	0
22302	1683	18	4
22303	1699	1	4
22304	1699	2	4
22305	1699	3	3
22306	1699	4	3
22307	1699	5	5
22308	1699	6	7
22309	1699	7	4
22310	1699	8	6
22311	1699	9	4
22312	1699	10	5
22313	1699	11	5
22314	1699	12	4
22315	1699	13	4
22316	1699	14	3
22317	1699	15	4
22318	1699	16	6
22319	1699	17	4
22320	1699	18	7
22321	1677	1	3
22322	1677	2	3
22323	1677	3	4
22324	1677	4	4
22325	1677	5	5
22326	1677	6	4
22327	1677	7	2
22328	1677	8	4
22329	1677	9	2
22330	1677	10	4
22331	1677	11	4
22332	1677	12	4
22333	1677	13	4
22334	1677	14	3
22335	1677	15	3
22336	1677	16	5
22337	1677	17	4
22338	1677	18	5
22339	1689	1	6
22340	1689	2	5
22341	1689	3	6
22342	1689	4	5
22343	1689	5	7
22344	1689	6	5
22345	1689	7	4
22346	1689	8	7
22347	1689	9	3
22348	1689	10	4
22349	1689	11	4
22350	1689	12	4
22351	1689	13	5
22352	1689	14	3
22353	1689	15	6
22354	1689	16	5
22355	1689	17	5
22356	1689	18	6
22357	1682	1	0
22358	1682	2	3
22359	1682	3	6
22360	1682	4	5
22361	1682	5	7
22362	1682	6	5
22363	1682	7	3
22364	1682	8	6
22365	1682	9	4
22366	1682	10	5
22367	1682	11	4
22368	1682	12	6
22369	1682	13	5
22370	1682	14	3
22371	1682	15	0
22372	1682	16	7
22373	1682	17	4
22374	1682	18	6
22375	1675	1	8
22376	1675	2	3
22377	1675	3	4
22378	1675	4	7
22379	1675	5	0
22380	1675	6	0
22381	1675	7	4
22382	1675	8	6
22383	1675	9	5
22384	1675	10	0
22385	1675	11	5
22386	1675	12	5
22387	1675	13	6
22388	1675	14	4
22389	1675	15	0
22390	1675	16	8
22391	1675	17	0
22392	1675	18	0
22393	1686	1	6
22394	1686	2	4
22395	1686	3	5
22396	1686	4	5
22397	1686	5	5
22398	1686	6	5
22399	1686	7	3
22400	1686	8	5
22401	1686	9	4
22402	1686	10	5
22403	1686	11	4
22404	1686	12	5
22405	1686	13	7
22406	1686	14	4
22407	1686	15	6
22408	1686	16	6
22409	1686	17	5
22410	1686	18	6
22411	1700	1	0
22412	1700	2	4
22413	1700	3	5
22414	1700	4	5
22415	1700	5	6
22416	1700	6	5
22417	1700	7	6
22418	1700	8	6
22419	1700	9	0
22420	1700	10	5
22421	1700	11	0
22422	1700	12	0
22423	1700	13	6
22424	1700	14	4
22425	1700	15	6
22426	1700	16	5
22427	1700	17	5
22428	1700	18	7
22429	1670	1	6
22430	1670	2	3
22431	1670	3	5
22432	1670	4	0
22433	1670	5	6
22434	1670	6	6
22435	1670	7	3
22436	1670	8	4
22437	1670	9	4
22438	1670	10	5
22439	1670	11	3
22440	1670	12	4
22441	1670	13	5
22442	1670	14	4
22443	1670	15	0
22444	1670	16	7
22445	1670	17	0
22446	1670	18	5
22447	1679	1	7
22448	1679	2	4
22449	1679	3	6
22450	1679	4	6
22451	1679	5	5
22452	1679	6	6
22453	1679	7	5
22454	1679	8	0
22455	1679	9	0
22456	1679	10	0
22457	1679	11	6
22458	1679	12	0
22459	1679	13	5
22460	1679	14	0
22461	1679	15	0
22462	1679	16	8
22463	1679	17	5
22464	1679	18	0
22465	1694	1	8
22466	1694	2	4
22467	1694	3	5
22468	1694	4	5
22469	1694	5	5
22470	1694	6	6
22471	1694	7	4
22472	1694	8	4
22473	1694	9	4
22474	1694	10	0
22475	1694	11	4
22476	1694	12	3
22477	1694	13	4
22478	1694	14	4
22479	1694	15	4
22480	1694	16	6
22481	1694	17	4
22482	1694	18	5
22483	1684	1	0
22484	1684	2	3
22485	1684	3	5
22486	1684	4	5
22487	1684	5	7
22488	1684	6	6
22489	1684	7	0
22490	1684	8	6
22491	1684	9	5
22492	1684	10	6
22493	1684	11	5
22494	1684	12	5
22495	1684	13	0
22496	1684	14	3
22497	1684	15	6
22498	1684	16	7
22499	1684	17	5
22500	1684	18	6
22501	1680	1	6
22502	1680	2	4
22503	1680	3	4
22504	1680	4	4
22505	1680	5	7
22506	1680	6	5
22507	1680	7	4
22508	1680	8	4
22509	1680	9	3
22510	1680	10	5
22511	1680	11	5
22512	1680	12	5
22513	1680	13	5
22514	1680	14	5
22515	1680	15	5
22516	1680	16	7
22517	1680	17	5
22518	1680	18	6
22519	1697	1	8
22520	1697	2	4
22521	1697	3	6
22522	1697	4	6
22523	1697	5	7
22524	1697	6	8
22525	1697	7	5
22526	1697	8	7
22527	1697	9	5
22528	1697	10	7
22529	1697	11	4
22530	1697	12	5
22531	1697	13	5
22532	1697	14	4
22533	1697	15	5
22534	1697	16	7
22535	1697	17	6
22536	1697	18	7
22537	1703	1	0
22538	1703	2	4
22539	1703	3	5
22540	1703	4	5
22541	1703	5	6
22542	1703	6	6
22543	1703	7	4
22544	1703	8	5
22545	1703	9	4
22546	1703	10	6
22547	1703	11	5
22548	1703	12	5
22549	1703	13	6
22550	1703	14	4
22551	1703	15	4
22552	1703	16	5
22553	1703	17	4
22554	1703	18	6
22555	1681	1	5
22556	1681	2	4
22557	1681	3	5
22558	1681	4	4
22559	1681	5	5
22560	1681	6	4
22561	1681	7	4
22562	1681	8	5
22563	1681	9	3
22564	1681	10	5
22565	1681	11	3
22566	1681	12	3
22567	1681	13	5
22568	1681	14	3
22569	1681	15	6
22570	1681	16	5
22571	1681	17	4
22572	1681	18	5
22573	1801	1	5
22574	1801	2	3
22575	1801	3	4
22576	1801	4	4
22577	1801	5	5
22578	1801	6	4
22579	1801	7	3
22580	1801	8	4
22581	1801	9	4
22582	1801	10	4
22583	1801	11	3
22584	1801	12	4
22585	1801	13	4
22586	1801	14	3
22587	1801	15	4
22588	1801	16	5
22589	1801	17	4
22590	1801	18	4
22591	1800	1	4
22592	1800	2	3
22593	1800	3	4
22594	1800	4	4
22595	1800	5	7
22596	1800	6	5
22597	1800	7	2
22598	1800	8	3
22599	1800	9	4
22600	1800	10	4
22601	1800	11	3
22602	1800	12	5
22603	1800	13	5
22604	1800	14	3
22605	1800	15	4
22606	1800	16	6
22607	1800	17	3
22608	1800	18	4
22609	1693	1	0
22610	1693	2	4
22611	1693	3	5
22612	1693	4	6
22613	1693	5	6
22614	1693	6	5
22615	1693	7	4
22616	1693	8	5
22617	1693	9	3
22618	1693	10	6
22619	1693	11	2
22620	1693	12	0
22621	1693	13	0
22622	1693	14	5
22623	1693	15	6
22624	1693	16	7
22625	1693	17	5
22626	1693	18	5
22627	1688	1	5
22628	1688	2	5
22629	1688	3	5
22630	1688	4	5
22631	1688	5	5
22632	1688	6	0
22633	1688	7	3
22634	1688	8	3
22635	1688	9	4
22636	1688	10	6
22637	1688	11	3
22638	1688	12	5
22639	1688	13	4
22640	1688	14	4
22641	1688	15	4
22642	1688	16	5
22643	1688	17	4
22644	1688	18	5
22645	1692	1	0
22646	1692	2	4
22647	1692	3	7
22648	1692	4	7
22649	1692	5	9
22650	1692	6	7
22651	1692	7	5
22652	1692	8	7
22653	1692	9	0
22654	1692	10	5
22655	1692	11	4
22656	1692	12	5
22657	1692	13	0
22658	1692	14	4
22659	1692	15	5
22660	1692	16	6
22661	1692	17	4
22662	1692	18	6
22663	1690	1	0
22664	1690	2	5
22665	1690	3	6
22666	1690	4	6
22667	1690	5	5
22668	1690	6	6
22669	1690	7	4
22670	1690	8	6
22671	1690	9	4
22672	1690	10	7
22673	1690	11	3
22674	1690	12	7
22675	1690	13	7
22676	1690	14	4
22677	1690	15	6
22678	1690	16	6
22679	1690	17	6
22680	1690	18	7
22681	1674	1	8
22682	1674	2	5
22683	1674	3	4
22684	1674	4	4
22685	1674	5	7
22686	1674	6	5
22687	1674	7	3
22688	1674	8	5
22689	1674	9	0
22690	1674	10	4
22691	1674	11	5
22692	1674	12	4
22693	1674	13	5
22694	1674	14	4
22695	1674	15	6
22696	1674	16	5
22697	1674	17	5
22698	1674	18	7
22699	1696	1	8
22700	1696	2	4
22701	1696	3	0
22702	1696	4	0
22703	1696	5	0
22704	1696	6	0
22705	1696	7	4
22706	1696	8	5
22707	1696	9	3
22708	1696	10	7
22709	1696	11	4
22710	1696	12	4
22711	1696	13	5
22712	1696	14	5
22713	1696	15	6
22714	1696	16	0
22715	1696	17	5
22716	1696	18	5
22717	1702	1	6
22718	1702	2	4
22719	1702	3	6
22720	1702	4	0
22721	1702	5	6
22722	1702	6	5
22723	1702	7	6
22724	1702	8	0
22725	1702	9	4
22726	1702	10	0
22727	1702	11	5
22728	1702	12	4
22729	1702	13	0
22730	1702	14	3
22731	1702	15	4
22732	1702	16	7
22733	1702	17	0
22734	1702	18	6
22735	1701	1	6
22736	1701	2	5
22737	1701	3	0
22738	1701	4	5
22739	1701	5	7
22740	1701	6	6
22741	1701	7	4
22742	1701	8	6
22743	1701	9	3
22744	1701	10	4
22745	1701	11	5
22746	1701	12	5
22747	1701	13	6
22748	1701	14	3
22749	1701	15	5
22750	1701	16	6
22751	1701	17	5
22752	1701	18	0
22753	1673	1	6
22754	1673	2	5
22755	1673	3	6
22756	1673	4	0
22757	1673	5	5
22758	1673	6	5
22759	1673	7	4
22760	1673	8	5
22761	1673	9	4
22762	1673	10	0
22763	1673	11	5
22764	1673	12	5
22765	1673	13	5
22766	1673	14	5
22767	1673	15	5
22768	1673	16	5
22769	1673	17	6
22770	1673	18	6
22771	1698	1	7
22772	1698	2	3
22773	1698	3	7
22774	1698	4	6
22775	1698	5	8
22776	1698	6	5
22777	1698	7	3
22778	1698	8	5
22779	1698	9	3
22780	1698	10	7
22781	1698	11	4
22782	1698	12	4
22783	1698	13	6
22784	1698	14	5
22785	1698	15	5
22786	1698	16	6
22787	1698	17	5
22788	1698	18	5
22789	1671	1	3
22790	1671	2	4
22791	1671	3	5
22792	1671	4	6
22793	1671	5	7
22794	1671	6	5
22795	1671	7	3
22796	1671	8	5
22797	1671	9	3
22798	1671	10	0
22799	1671	11	4
22800	1671	12	4
22801	1671	13	5
22802	1671	14	4
22803	1671	15	0
22804	1671	16	6
22805	1671	17	5
22806	1671	18	5
22807	1691	1	5
22808	1691	2	4
22809	1691	3	6
22810	1691	4	5
22811	1691	5	5
22812	1691	6	0
22813	1691	7	0
22814	1691	8	4
22815	1691	9	4
22816	1691	10	4
22817	1691	11	4
22818	1691	12	5
22819	1691	13	5
22820	1691	14	4
22821	1691	15	4
22822	1691	16	7
22823	1691	17	5
22824	1691	18	5
22825	1672	1	5
22826	1672	2	4
22827	1672	3	5
22828	1672	4	0
22829	1672	5	5
22830	1672	6	5
22831	1672	7	4
22832	1672	8	4
22833	1672	9	3
22834	1672	10	6
22835	1672	11	4
22836	1672	12	6
22837	1672	13	5
22838	1672	14	3
22839	1672	15	5
22840	1672	16	7
22841	1672	17	5
22842	1672	18	5
22843	1695	1	6
22844	1695	2	4
22845	1695	3	4
22846	1695	4	7
22847	1695	5	7
22848	1695	6	5
22849	1695	7	4
22850	1695	8	5
22851	1695	9	4
22852	1695	10	7
22853	1695	11	5
22854	1695	12	6
22855	1695	13	5
22856	1695	14	0
22857	1695	15	5
22858	1695	16	5
22859	1695	17	6
22860	1695	18	6
22861	1705	1	0
22862	1705	2	3
22863	1705	3	4
22864	1705	4	5
22865	1705	5	4
22866	1705	6	6
22867	1705	7	4
22868	1705	8	5
22869	1705	9	4
22870	1705	10	7
22871	1705	11	3
22872	1705	12	0
22873	1705	13	4
22874	1705	14	5
22875	1705	15	5
22876	1705	16	0
22877	1705	17	5
22878	1705	18	4
22879	1778	1	5
22880	1778	2	4
22881	1778	3	6
22882	1778	4	4
22883	1778	5	5
22884	1778	6	6
22885	1778	7	4
22886	1778	8	7
22887	1778	9	4
22888	1778	10	6
22889	1778	11	4
22890	1778	12	4
22891	1778	13	5
22892	1778	14	4
22893	1778	15	6
22894	1778	16	5
22895	1778	17	5
22896	1778	18	6
22897	1771	1	8
22898	1771	2	7
22899	1771	3	5
22900	1771	4	7
22901	1771	5	8
22902	1771	6	7
22903	1771	7	3
22904	1771	8	5
22905	1771	9	5
22906	1771	10	6
22907	1771	11	5
22908	1771	12	7
22909	1771	13	5
22910	1771	14	3
22911	1771	15	7
22912	1771	16	8
22913	1771	17	5
22914	1771	18	4
22915	1787	1	8
22916	1787	2	5
22917	1787	3	5
22918	1787	4	6
22919	1787	5	7
22920	1787	6	6
22921	1787	7	4
22922	1787	8	5
22923	1787	9	4
22924	1787	10	6
22925	1787	11	6
22926	1787	12	6
22927	1787	13	6
22928	1787	14	4
22929	1787	15	8
22930	1787	16	8
22931	1787	17	5
22932	1787	18	6
22933	1780	1	6
22934	1780	2	4
22935	1780	3	5
22936	1780	4	4
22937	1780	5	8
22938	1780	6	8
22939	1780	7	4
22940	1780	8	4
22941	1780	9	3
22942	1780	10	3
22943	1780	11	5
22944	1780	12	3
22945	1780	13	3
22946	1780	14	4
22947	1780	15	6
22948	1780	16	5
22949	1780	17	4
22950	1780	18	5
22951	1793	1	9
22952	1793	2	7
22953	1793	3	7
22954	1793	4	7
22955	1793	5	9
22956	1793	6	7
22957	1793	7	6
22958	1793	8	4
22959	1793	9	6
22960	1793	10	5
22961	1793	11	4
22962	1793	12	6
22963	1793	13	7
22964	1793	14	7
22965	1793	15	6
22966	1793	16	7
22967	1793	17	7
22968	1793	18	7
22969	1710	1	8
22970	1710	2	4
22971	1710	3	6
22972	1710	4	7
22973	1710	5	8
22974	1710	6	6
22975	1710	7	6
22976	1710	8	5
22977	1710	9	5
22978	1710	10	6
22979	1710	11	7
22980	1710	12	7
22981	1710	13	6
22982	1710	14	4
22983	1710	15	7
22984	1710	16	7
22985	1710	17	6
22986	1710	18	7
22987	1707	1	6
22988	1707	2	4
22989	1707	3	5
22990	1707	4	7
22991	1707	5	8
22992	1707	6	7
22993	1707	7	4
22994	1707	8	6
22995	1707	9	3
22996	1707	10	6
22997	1707	11	6
22998	1707	12	5
22999	1707	13	7
23000	1707	14	6
23001	1707	15	6
23002	1707	16	8
23003	1707	17	6
23004	1707	18	8
23005	1736	1	9
23006	1736	2	7
23007	1736	3	7
23008	1736	4	7
23009	1736	5	9
23010	1736	6	7
23011	1736	7	6
23012	1736	8	4
23013	1736	9	6
23014	1736	10	5
23015	1736	11	4
23016	1736	12	6
23017	1736	13	7
23018	1736	14	7
23019	1736	15	6
23020	1736	16	7
23021	1736	17	7
23022	1736	18	7
23023	1724	1	5
23024	1724	2	4
23025	1724	3	6
23026	1724	4	4
23027	1724	5	5
23028	1724	6	6
23029	1724	7	4
23030	1724	8	7
23031	1724	9	4
23032	1724	10	6
23033	1724	11	4
23034	1724	12	4
23035	1724	13	5
23036	1724	14	4
23037	1724	15	6
23038	1724	16	5
23039	1724	17	5
23040	1724	18	6
23041	1733	1	8
23042	1733	2	5
23043	1733	3	5
23044	1733	4	6
23045	1733	5	7
23046	1733	6	6
23047	1733	7	4
23048	1733	8	5
23049	1733	9	4
23050	1733	10	6
23051	1733	11	6
23052	1733	12	6
23053	1733	13	6
23054	1733	14	4
23055	1733	15	8
23056	1733	16	8
23057	1733	17	5
23058	1733	18	6
23059	1726	1	6
23060	1726	2	4
23061	1726	3	5
23062	1726	4	4
23063	1726	5	8
23064	1726	6	8
23065	1726	7	4
23066	1726	8	4
23067	1726	9	3
23068	1726	10	3
23069	1726	11	5
23070	1726	12	3
23071	1726	13	3
23072	1726	14	4
23073	1726	15	6
23074	1726	16	5
23075	1726	17	4
23076	1726	18	5
23077	1714	1	8
23078	1714	2	7
23079	1714	3	5
23080	1714	4	7
23081	1714	5	8
23082	1714	6	7
23083	1714	7	3
23084	1714	8	5
23085	1714	9	5
23086	1714	10	6
23087	1714	11	5
23088	1714	12	7
23089	1714	13	5
23090	1714	14	3
23091	1714	15	7
23092	1714	16	8
23093	1714	17	5
23094	1714	18	4
23095	1762	1	12
23096	1762	2	5
23097	1762	3	6
23098	1762	4	5
23099	1762	5	9
23100	1762	6	7
23101	1762	7	4
23102	1762	8	6
23103	1762	9	7
23104	1762	10	8
23105	1762	11	5
23106	1762	12	6
23107	1762	13	7
23108	1762	14	6
23109	1762	15	7
23110	1762	16	7
23111	1762	17	6
23112	1762	18	6
23113	1718	1	8
23114	1718	2	4
23115	1718	3	6
23116	1718	4	4
23117	1718	5	7
23118	1718	6	6
23119	1718	7	4
23120	1718	8	5
23121	1718	9	4
23122	1718	10	4
23123	1718	11	5
23124	1718	12	5
23125	1718	13	4
23126	1718	14	3
23127	1718	15	4
23128	1718	16	5
23129	1718	17	4
23130	1718	18	5
23131	1737	1	8
23132	1737	2	4
23133	1737	3	4
23134	1737	4	6
23135	1737	5	7
23136	1737	6	5
23137	1737	7	5
23138	1737	8	5
23139	1737	9	4
23140	1737	10	6
23141	1737	11	4
23142	1737	12	5
23143	1737	13	5
23144	1737	14	3
23145	1737	15	5
23146	1737	16	5
23147	1737	17	5
23148	1737	18	5
23149	1716	1	6
23150	1716	2	4
23151	1716	3	5
23152	1716	4	5
23153	1716	5	6
23154	1716	6	3
23155	1716	7	4
23156	1716	8	5
23157	1716	9	4
23158	1716	10	5
23159	1716	11	4
23160	1716	12	4
23161	1716	13	5
23162	1716	14	3
23163	1716	15	5
23164	1716	16	5
23165	1716	17	4
23166	1716	18	6
23167	1721	1	6
23168	1721	2	4
23169	1721	3	4
23170	1721	4	5
23171	1721	5	5
23172	1721	6	5
23173	1721	7	3
23174	1721	8	4
23175	1721	9	2
23176	1721	10	5
23177	1721	11	4
23178	1721	12	4
23179	1721	13	5
23180	1721	14	4
23181	1721	15	4
23182	1721	16	5
23183	1721	17	5
23184	1721	18	6
23185	1706	1	3
23186	1706	2	4
23187	1706	3	4
23188	1706	4	5
23189	1706	5	4
23190	1706	6	5
23191	1706	7	3
23192	1706	8	4
23193	1706	9	5
23194	1706	10	5
23195	1706	11	4
23196	1706	12	4
23197	1706	13	4
23198	1706	14	4
23199	1706	15	4
23200	1706	16	6
23201	1706	17	4
23202	1706	18	4
23203	1709	1	6
23204	1709	2	4
23205	1709	3	5
23206	1709	4	5
23207	1709	5	6
23208	1709	6	4
23209	1709	7	6
23210	1709	8	5
23211	1709	9	4
23212	1709	10	5
23213	1709	11	5
23214	1709	12	5
23215	1709	13	5
23216	1709	14	4
23217	1709	15	4
23218	1709	16	6
23219	1709	17	4
23220	1709	18	7
23221	1738	1	6
23222	1738	2	4
23223	1738	3	5
23224	1738	4	4
23225	1738	5	6
23226	1738	6	8
23227	1738	7	4
23228	1738	8	5
23229	1738	9	3
23230	1738	10	6
23231	1738	11	4
23232	1738	12	4
23233	1738	13	6
23234	1738	14	4
23235	1738	15	5
23236	1738	16	11
23237	1738	17	8
23238	1738	18	4
23239	1760	1	5
23240	1760	2	4
23241	1760	3	5
23242	1760	4	6
23243	1760	5	5
23244	1760	6	5
23245	1760	7	4
23246	1760	8	5
23247	1760	9	4
23248	1760	10	5
23249	1760	11	4
23250	1760	12	4
23251	1760	13	4
23252	1760	14	4
23253	1760	15	5
23254	1760	16	5
23255	1760	17	4
23256	1760	18	4
23257	1720	1	5
23258	1720	2	2
23259	1720	3	5
23260	1720	4	7
23261	1720	5	4
23262	1720	6	5
23263	1720	7	3
23264	1720	8	5
23265	1720	9	4
23266	1720	10	4
23267	1720	11	4
23268	1720	12	4
23269	1720	13	6
23270	1720	14	4
23271	1720	15	5
23272	1720	16	6
23273	1720	17	4
23274	1720	18	6
23275	1752	1	5
23276	1752	2	4
23277	1752	3	5
23278	1752	4	6
23279	1752	5	7
23280	1752	6	9
23281	1752	7	3
23282	1752	8	5
23283	1752	9	3
23284	1752	10	5
23285	1752	11	4
23286	1752	12	4
23287	1752	13	6
23288	1752	14	4
23289	1752	15	4
23290	1752	16	6
23291	1752	17	5
23292	1752	18	5
23293	1804	1	9
23294	1804	2	3
23295	1804	3	5
23296	1804	4	9
23297	1804	5	7
23298	1804	6	6
23299	1804	7	3
23300	1804	8	5
23301	1804	9	6
23302	1804	10	5
23303	1804	11	4
23304	1804	12	5
23305	1804	13	6
23306	1804	14	3
23307	1804	15	5
23308	1804	16	9
23309	1804	17	8
23310	1804	18	8
23311	1711	1	6
23312	1711	2	4
23313	1711	3	7
23314	1711	4	6
23315	1711	5	5
23316	1711	6	7
23317	1711	7	4
23318	1711	8	5
23319	1711	9	4
23320	1711	10	5
23321	1711	11	4
23322	1711	12	6
23323	1711	13	6
23324	1711	14	4
23325	1711	15	4
23326	1711	16	6
23327	1711	17	7
23328	1711	18	7
23329	1803	1	7
23330	1803	2	4
23331	1803	3	6
23332	1803	4	4
23333	1803	5	6
23334	1803	6	6
23335	1803	7	4
23336	1803	8	4
23337	1803	9	6
23338	1803	10	5
23339	1803	11	5
23340	1803	12	4
23341	1803	13	5
23342	1803	14	4
23343	1803	15	7
23344	1803	16	6
23345	1803	17	5
23346	1803	18	5
23347	1741	1	6
23348	1741	2	4
23349	1741	3	7
23350	1741	4	4
23351	1741	5	7
23352	1741	6	5
23353	1741	7	4
23354	1741	8	5
23355	1741	9	4
23356	1741	10	6
23357	1741	11	4
23358	1741	12	4
23359	1741	13	5
23360	1741	14	3
23361	1741	15	4
23362	1741	16	6
23363	1741	17	4
23364	1741	18	5
23365	1730	1	6
23366	1730	2	4
23367	1730	3	5
23368	1730	4	7
23369	1730	5	6
23370	1730	6	6
23371	1730	7	6
23372	1730	8	4
23373	1730	9	3
23374	1730	10	4
23375	1730	11	3
23376	1730	12	4
23377	1730	13	4
23378	1730	14	6
23379	1730	15	4
23380	1730	16	6
23381	1730	17	5
23382	1730	18	6
23383	1757	1	8
23384	1757	2	5
23385	1757	3	7
23386	1757	4	8
23387	1757	5	8
23388	1757	6	9
23389	1757	7	5
23390	1757	8	8
23391	1757	9	5
23392	1757	10	5
23393	1757	11	8
23394	1757	12	5
23395	1757	13	7
23396	1757	14	6
23397	1757	15	7
23398	1757	16	7
23399	1757	17	6
23400	1757	18	6
23401	1715	1	6
23402	1715	2	4
23403	1715	3	5
23404	1715	4	5
23405	1715	5	9
23406	1715	6	7
23407	1715	7	5
23408	1715	8	5
23409	1715	9	4
23410	1715	10	4
23411	1715	11	5
23412	1715	12	5
23413	1715	13	5
23414	1715	14	4
23415	1715	15	6
23416	1715	16	7
23417	1715	17	5
23418	1715	18	4
23419	1712	1	6
23420	1712	2	4
23421	1712	3	5
23422	1712	4	5
23423	1712	5	6
23424	1712	6	6
23425	1712	7	5
23426	1712	8	4
23427	1712	9	5
23428	1712	10	5
23429	1712	11	4
23430	1712	12	7
23431	1712	13	5
23432	1712	14	5
23433	1712	15	5
23434	1712	16	8
23435	1712	17	7
23436	1712	18	6
23437	1755	1	7
23438	1755	2	6
23439	1755	3	6
23440	1755	4	6
23441	1755	5	6
23442	1755	6	8
23443	1755	7	6
23444	1755	8	6
23445	1755	9	6
23446	1755	10	7
23447	1755	11	3
23448	1755	12	7
23449	1755	13	6
23450	1755	14	6
23451	1755	15	9
23452	1755	16	9
23453	1755	17	6
23454	1755	18	7
23455	1739	1	5
23456	1739	2	3
23457	1739	3	4
23458	1739	4	5
23459	1739	5	6
23460	1739	6	3
23461	1739	7	4
23462	1739	8	4
23463	1739	9	4
23464	1739	10	4
23465	1739	11	2
23466	1739	12	4
23467	1739	13	4
23468	1739	14	4
23469	1739	15	4
23470	1739	16	7
23471	1739	17	6
23472	1739	18	4
23473	1728	1	6
23474	1728	2	4
23475	1728	3	5
23476	1728	4	5
23477	1728	5	7
23478	1728	6	6
23479	1728	7	4
23480	1728	8	6
23481	1728	9	5
23482	1728	10	4
23483	1728	11	4
23484	1728	12	5
23485	1728	13	5
23486	1728	14	5
23487	1728	15	6
23488	1728	16	6
23489	1728	17	5
23490	1728	18	6
23491	1805	1	7
23492	1805	2	5
23493	1805	3	8
23494	1805	4	4
23495	1805	5	8
23496	1805	6	6
23497	1805	7	7
23498	1805	8	5
23499	1805	9	4
23500	1805	10	4
23501	1805	11	5
23502	1805	12	4
23503	1805	13	5
23504	1805	14	5
23505	1805	15	5
23506	1805	16	6
23507	1805	17	6
23508	1805	18	5
23509	1750	1	5
23510	1750	2	4
23511	1750	3	4
23512	1750	4	5
23513	1750	5	6
23514	1750	6	5
23515	1750	7	4
23516	1750	8	4
23517	1750	9	3
23518	1750	10	3
23519	1750	11	3
23520	1750	12	4
23521	1750	13	4
23522	1750	14	4
23523	1750	15	4
23524	1750	16	6
23525	1750	17	5
23526	1750	18	5
23527	1746	1	4
23528	1746	2	3
23529	1746	3	4
23530	1746	4	4
23531	1746	5	3
23532	1746	6	6
23533	1746	7	3
23534	1746	8	4
23535	1746	9	4
23536	1746	10	5
23537	1746	11	4
23538	1746	12	5
23539	1746	13	4
23540	1746	14	3
23541	1746	15	4
23542	1746	16	5
23543	1746	17	3
23544	1746	18	4
23545	1719	1	6
23546	1719	2	3
23547	1719	3	6
23548	1719	4	7
23549	1719	5	5
23550	1719	6	5
23551	1719	7	4
23552	1719	8	4
23553	1719	9	5
23554	1719	10	4
23555	1719	11	5
23556	1719	12	4
23557	1719	13	4
23558	1719	14	4
23559	1719	15	5
23560	1719	16	7
23561	1719	17	3
23562	1719	18	6
23563	1745	1	5
23564	1745	2	3
23565	1745	3	4
23566	1745	4	4
23567	1745	5	4
23568	1745	6	4
23569	1745	7	3
23570	1745	8	4
23571	1745	9	4
23572	1745	10	5
23573	1745	11	5
23574	1745	12	4
23575	1745	13	4
23576	1745	14	4
23577	1745	15	4
23578	1745	16	5
23579	1745	17	3
23580	1745	18	5
23581	1729	1	8
23582	1729	2	3
23583	1729	3	4
23584	1729	4	3
23585	1729	5	6
23586	1729	6	6
23587	1729	7	3
23588	1729	8	3
23589	1729	9	3
23590	1729	10	3
23591	1729	11	4
23592	1729	12	4
23593	1729	13	5
23594	1729	14	5
23595	1729	15	4
23596	1729	16	6
23597	1729	17	4
23598	1729	18	5
23599	1734	1	5
23600	1734	2	4
23601	1734	3	5
23602	1734	4	5
23603	1734	5	5
23604	1734	6	5
23605	1734	7	4
23606	1734	8	4
23607	1734	9	4
23608	1734	10	6
23609	1734	11	3
23610	1734	12	5
23611	1734	13	5
23612	1734	14	5
23613	1734	15	4
23614	1734	16	5
23615	1734	17	4
23616	1734	18	4
23617	1751	1	6
23618	1751	2	5
23619	1751	3	5
23620	1751	4	8
23621	1751	5	6
23622	1751	6	5
23623	1751	7	4
23624	1751	8	3
23625	1751	9	4
23626	1751	10	6
23627	1751	11	6
23628	1751	12	5
23629	1751	13	5
23630	1751	14	3
23631	1751	15	4
23632	1751	16	5
23633	1751	17	5
23634	1751	18	4
23635	1754	1	6
23636	1754	2	5
23637	1754	3	4
23638	1754	4	4
23639	1754	5	8
23640	1754	6	6
23641	1754	7	4
23642	1754	8	5
23643	1754	9	8
23644	1754	10	6
23645	1754	11	5
23646	1754	12	9
23647	1754	13	4
23648	1754	14	4
23649	1754	15	5
23650	1754	16	5
23651	1754	17	6
23652	1754	18	8
23653	1740	1	6
23654	1740	2	5
23655	1740	3	6
23656	1740	4	7
23657	1740	5	6
23658	1740	6	4
23659	1740	7	4
23660	1740	8	4
23661	1740	9	5
23662	1740	10	4
23663	1740	11	4
23664	1740	12	5
23665	1740	13	7
23666	1740	14	5
23667	1740	15	6
23668	1740	16	7
23669	1740	17	4
23670	1740	18	9
23671	1725	1	8
23672	1725	2	5
23673	1725	3	6
23674	1725	4	4
23675	1725	5	8
23676	1725	6	5
23677	1725	7	5
23678	1725	8	5
23679	1725	9	3
23680	1725	10	7
23681	1725	11	6
23682	1725	12	4
23683	1725	13	5
23684	1725	14	4
23685	1725	15	4
23686	1725	16	6
23687	1725	17	6
23688	1725	18	6
23689	1747	1	6
23690	1747	2	4
23691	1747	3	6
23692	1747	4	6
23693	1747	5	5
23694	1747	6	7
23695	1747	7	4
23696	1747	8	5
23697	1747	9	4
23698	1747	10	4
23699	1747	11	4
23700	1747	12	4
23701	1747	13	5
23702	1747	14	4
23703	1747	15	5
23704	1747	16	6
23705	1747	17	6
23706	1747	18	5
23707	1806	1	6
23708	1806	2	4
23709	1806	3	8
23710	1806	4	6
23711	1806	5	9
23712	1806	6	7
23713	1806	7	7
23714	1806	8	8
23715	1806	9	6
23716	1806	10	5
23717	1806	11	6
23718	1806	12	5
23719	1806	13	4
23720	1806	14	5
23721	1806	15	7
23722	1806	16	13
23723	1806	17	6
23724	1806	18	6
23725	1708	1	7
23726	1708	2	5
23727	1708	3	4
23728	1708	4	4
23729	1708	5	5
23730	1708	6	5
23731	1708	7	6
23732	1708	8	4
23733	1708	9	3
23734	1708	10	6
23735	1708	11	5
23736	1708	12	4
23737	1708	13	5
23738	1708	14	4
23739	1708	15	4
23740	1708	16	5
23741	1708	17	4
23742	1708	18	5
23743	1713	1	7
23744	1713	2	4
23745	1713	3	6
23746	1713	4	4
23747	1713	5	13
23748	1713	6	8
23749	1713	7	6
23750	1713	8	6
23751	1713	9	5
23752	1713	10	5
23753	1713	11	3
23754	1713	12	4
23755	1713	13	4
23756	1713	14	4
23757	1713	15	5
23758	1713	16	5
23759	1713	17	4
23760	1713	18	4
23761	1722	1	5
23762	1722	2	4
23763	1722	3	5
23764	1722	4	5
23765	1722	5	8
23766	1722	6	6
23767	1722	7	3
23768	1722	8	7
23769	1722	9	3
23770	1722	10	5
23771	1722	11	5
23772	1722	12	4
23773	1722	13	5
23774	1722	14	4
23775	1722	15	6
23776	1722	16	6
23777	1722	17	4
23778	1722	18	4
23779	1727	1	5
23780	1727	2	4
23781	1727	3	4
23782	1727	4	4
23783	1727	5	7
23784	1727	6	6
23785	1727	7	5
23786	1727	8	3
23787	1727	9	5
23788	1727	10	6
23789	1727	11	4
23790	1727	12	4
23791	1727	13	5
23792	1727	14	2
23793	1727	15	4
23794	1727	16	5
23795	1727	17	4
23796	1727	18	5
23797	1802	1	5
23798	1802	2	7
23799	1802	3	5
23800	1802	4	5
23801	1802	5	6
23802	1802	6	5
23803	1802	7	4
23804	1802	8	4
23805	1802	9	5
23806	1802	10	6
23807	1802	11	4
23808	1802	12	9
23809	1802	13	4
23810	1802	14	4
23811	1802	15	5
23812	1802	16	5
23813	1802	17	5
23814	1802	18	4
\.


--
-- Data for Name: web_scoringrecord; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_scoringrecord (id, scoredate, member_id, tee_id, score, scoretype, sloperating, courserating) FROM stdin;
281	2010-03-29	3	1	90	N	117	66.8
282	2010-03-28	21	1	101	N	117	66.8
283	2010-03-28	18	1	94	N	117	66.8
284	2010-03-28	4	1	122	N	117	66.8
285	2010-03-28	8	1	95	N	117	66.8
286	2010-03-28	5	1	91	N	117	66.8
287	2010-03-28	6	1	87	N	117	66.8
288	2010-03-28	14	1	89	N	117	66.8
289	2010-03-28	13	1	101	N	117	66.8
290	2010-03-26	1	3	100	N	131	73.0
291	2010-03-22	14	1	94	N	117	66.8
295	2010-04-08	30	1	82	N	117	66.8
296	2010-04-08	3	1	91	N	117	66.8
297	2010-04-07	30	1	98	N	117	66.8
298	2010-04-06	30	1	89	N	117	66.8
299	2010-04-05	31	1	89	N	117	66.8
300	2010-04-04	14	1	111	N	117	66.8
301	2010-04-04	5	1	86	N	117	66.8
302	2010-04-04	31	1	94	N	117	66.8
303	2010-04-04	8	1	96	N	117	66.8
304	2010-04-04	6	1	94	N	117	66.8
305	2010-04-04	18	1	87	N	117	66.8
306	2010-04-01	8	1	98	N	117	66.8
307	2010-04-01	30	1	85	N	117	66.8
308	2010-04-01	5	1	84	N	117	66.8
309	2010-03-27	14	1	115	N	117	66.8
4788	2010-05-29	3	1	91	T	117	66.8
4789	2010-05-29	224	1	81	T	117	66.8
4790	2010-05-29	13	1	110	T	117	66.8
4791	2010-05-29	229	1	92	T	117	66.8
4792	2010-05-29	174	1	99	T	117	66.8
4793	2010-05-29	4	1	110	T	117	66.8
4794	2010-05-29	1	1	104	T	117	66.8
4795	2010-05-29	8	1	99	T	117	66.8
4796	2010-05-29	175	1	90	T	117	66.8
4797	2010-05-29	233	1	97	T	117	66.8
4798	2010-05-29	127	1	94	T	117	66.8
4799	2010-05-29	14	1	109	T	117	66.8
4800	2010-04-18	229	1	98	T	117	66.8
4801	2010-04-18	1	1	90	T	117	66.8
4802	2010-04-18	49	1	94	T	117	66.8
4803	2010-04-18	5	1	86	T	117	66.8
4804	2010-04-18	37	1	93	T	117	66.8
4805	2010-04-18	4	1	100	T	117	66.8
4806	2010-04-18	86	1	102	T	117	66.8
4807	2010-04-18	3	1	89	T	117	66.8
4808	2010-04-18	135	1	98	T	117	66.8
4809	2010-04-18	184	1	92	T	117	66.8
4810	2010-04-18	233	1	92	T	117	66.8
4811	2010-04-18	14	1	106	T	117	66.8
4812	2010-04-18	42	1	86	T	117	66.8
4813	2010-04-18	15	1	94	T	117	66.8
4814	2010-04-18	18	1	93	T	117	66.8
4815	2010-04-18	8	1	99	T	117	66.8
4816	2010-04-18	10	1	108	T	117	66.8
4817	2010-04-18	238	1	93	T	117	66.8
4818	2010-04-18	23	1	98	T	117	66.8
4819	2010-04-18	236	1	101	T	117	66.8
4820	2010-04-18	117	1	83	T	117	66.8
4821	2010-04-18	272	1	84	T	117	66.8
4822	2010-04-18	79	1	73	T	117	66.8
4823	2010-04-18	224	1	78	T	117	66.8
4824	2010-04-18	167	1	76	T	117	66.8
4825	2010-04-18	231	1	90	T	117	66.8
4826	2010-04-18	9	1	78	T	117	66.8
4827	2010-04-18	22	1	88	T	117	66.8
4828	2010-04-18	6	1	93	T	117	66.8
4829	2010-04-18	243	1	89	T	117	66.8
4830	2010-04-18	166	1	78	T	117	66.8
4831	2010-04-18	186	1	75	T	117	66.8
4832	2010-04-18	130	1	86	T	117	66.8
4833	2010-04-18	269	1	85	T	117	66.8
4834	2010-04-18	174	1	83	T	117	66.8
4835	2010-04-18	150	1	81	T	117	66.8
4836	2010-04-18	175	1	84	T	117	66.8
4837	2010-04-18	39	1	87	T	117	66.8
4838	2010-04-18	162	1	91	T	117	66.8
4839	2010-02-20	39	1	87	T	117	66.8
4840	2010-02-20	4	1	91	T	117	66.8
4841	2010-02-20	224	1	80	T	117	66.8
4842	2010-02-20	3	1	87	T	117	66.8
4843	2010-02-20	206	1	81	T	117	66.8
4844	2010-02-20	5	1	86	T	117	66.8
4845	2010-02-20	27	1	92	T	117	66.8
440	2010-04-29	32	3	89	N	131	73.0
442	2010-04-29	34	3	97	N	131	73.0
444	2010-04-30	36	3	94	N	131	73.0
446	2010-04-30	38	3	103	N	131	73.0
4846	2010-02-20	272	1	82	T	117	66.8
4847	2010-02-20	130	1	82	T	117	66.8
4848	2010-02-20	135	1	93	T	117	66.8
4849	2010-02-20	269	1	90	T	117	66.8
4850	2010-02-20	6	1	80	T	117	66.8
4851	2010-02-20	9	1	80	T	117	66.8
4852	2010-02-20	10	1	86	T	117	66.8
4853	2010-02-20	187	1	82	T	117	66.8
4854	2010-02-20	273	1	77	T	117	66.8
4855	2010-02-20	104	1	87	T	117	66.8
4856	2010-02-20	17	1	93	T	117	66.8
4857	2010-02-20	18	1	91	T	117	66.8
4858	2010-02-20	184	1	92	T	117	66.8
4859	2010-02-20	1	1	88	T	117	66.8
4860	2010-02-20	22	1	83	T	117	66.8
4861	2010-02-20	8	1	93	T	117	66.8
4862	2010-02-21	16	1	97	T	117	66.8
4863	2010-02-21	1	1	88	T	117	66.8
4864	2010-02-21	4	1	95	T	117	66.8
117	2009-12-13	18	1	88	N	117	66.8
118	2009-12-13	7	1	88	N	117	66.8
119	2009-12-13	24	1	99	N	117	66.8
120	2009-12-12	5	1	87	N	117	66.8
121	2009-12-12	24	1	99	N	117	66.8
122	2009-12-11	24	1	99	N	117	66.8
123	2009-12-11	25	1	98	N	117	66.8
124	2009-12-10	25	1	97	N	117	66.8
125	2009-12-10	19	1	96	N	117	66.8
126	2009-12-08	25	1	90	N	117	66.8
127	2009-12-06	18	1	90	N	117	66.8
128	2009-12-06	24	1	99	N	117	66.8
129	2009-12-06	5	1	98	N	117	66.8
130	2009-12-06	25	1	104	N	117	66.8
131	2009-12-06	13	1	96	N	117	66.8
132	2009-12-05	24	1	101	N	117	66.8
133	2010-03-24	26	1	93	N	117	66.8
134	2010-03-24	27	1	95	N	117	66.8
135	2010-03-14	9	1	80	N	117	66.8
136	2010-03-14	8	1	102	N	117	66.8
137	2010-03-14	18	1	92	N	117	66.8
138	2010-03-14	4	1	109	N	117	66.8
139	2010-03-14	5	1	87	N	117	66.8
140	2010-03-14	3	1	88	N	117	66.8
141	2010-03-13	8	1	107	N	117	66.8
142	2010-03-13	6	1	97	N	117	66.8
143	2010-03-12	20	1	101	N	117	66.8
144	2010-03-12	25	1	88	N	117	66.8
145	2010-03-10	20	1	93	N	117	66.8
146	2010-03-10	8	1	99	N	117	66.8
147	2010-03-09	6	1	84	N	117	66.8
148	2010-03-07	10	1	105	N	117	66.8
149	2010-03-07	23	1	104	N	117	66.8
150	2010-03-07	6	1	93	N	117	66.8
151	2010-03-07	8	1	99	N	117	66.8
152	2010-03-07	14	1	105	N	117	66.8
153	2010-03-07	4	1	103	N	117	66.8
154	2010-03-03	13	1	96	N	117	66.8
155	2010-03-01	1	1	87	N	117	66.8
156	2010-01-31	16	1	98	N	117	66.8
157	2010-01-31	25	1	87	N	117	66.8
158	2010-01-31	20	1	108	N	117	66.8
159	2010-01-30	11	1	95	N	117	66.8
160	2010-01-28	5	1	91	N	117	66.8
161	2010-01-26	6	1	97	N	117	66.8
162	2010-01-26	8	1	102	N	117	66.8
163	2010-01-26	26	1	92	N	117	66.8
164	2010-01-24	18	1	89	N	117	66.8
165	2010-01-24	26	1	91	N	117	66.8
166	2010-01-24	16	1	98	N	117	66.8
167	2010-01-20	1	1	95	N	117	66.8
4865	2010-02-21	224	1	80	T	117	66.8
4866	2010-02-21	3	1	87	T	117	66.8
4867	2010-02-21	5	1	82	T	117	66.8
4868	2010-02-21	27	1	97	T	117	66.8
4869	2010-02-21	272	1	80	T	117	66.8
4870	2010-02-21	130	1	88	T	117	66.8
4871	2010-02-21	269	1	85	T	117	66.8
4872	2010-02-21	6	1	87	T	117	66.8
4873	2010-02-21	8	1	94	T	117	66.8
4874	2010-02-21	9	1	82	T	117	66.8
4875	2010-02-21	10	1	86	T	117	66.8
4876	2010-02-21	187	1	86	T	117	66.8
4877	2010-02-21	11	1	84	T	117	66.8
4878	2010-02-21	12	1	80	T	117	66.8
4879	2010-02-21	13	1	93	T	117	66.8
4880	2010-02-21	14	1	91	T	117	66.8
4881	2010-02-21	273	1	73	T	117	66.8
4882	2010-02-21	17	1	90	T	117	66.8
4883	2010-03-21	1	1	92	T	117	66.8
4884	2010-03-21	6	1	90	T	117	66.8
188	2010-01-15	23	1	98	N	117	66.8
189	2010-01-15	8	1	95	N	117	66.8
190	2010-01-15	13	1	91	N	117	66.8
191	2010-01-14	5	1	87	N	117	66.8
192	2010-01-14	11	1	92	N	117	66.8
193	2010-01-12	28	1	92	N	117	66.8
194	2010-01-07	25	1	97	N	117	66.8
195	2010-01-07	5	1	82	N	117	66.8
196	2010-01-06	28	1	93	N	117	66.8
197	2010-01-06	5	1	86	N	117	66.8
198	2010-01-06	6	1	88	N	117	66.8
199	2010-01-06	14	1	109	N	117	66.8
200	2010-01-03	8	1	99	N	117	66.8
201	2010-01-03	5	1	89	N	117	66.8
202	2010-01-03	12	1	88	N	117	66.8
203	2010-01-03	18	1	99	N	117	66.8
204	2009-12-31	25	1	107	N	117	66.8
205	2009-12-30	7	1	97	N	117	66.8
206	2009-12-30	13	1	99	N	117	66.8
207	2009-12-29	1	3	93	N	131	73.0
208	2009-12-29	19	1	103	N	117	66.8
209	2009-12-29	23	1	105	N	117	66.8
4885	2010-03-21	272	1	83	T	117	66.8
211	2009-12-25	24	1	105	N	117	66.8
212	2009-12-23	5	1	88	N	117	66.8
213	2009-12-23	20	1	103	N	117	66.8
214	2009-12-21	20	1	103	N	117	66.8
215	2009-12-20	16	1	100	N	117	66.8
216	2009-12-19	24	1	100	N	117	66.8
217	2009-12-18	24	1	101	N	117	66.8
218	2009-12-17	24	1	99	N	117	66.8
219	2009-12-16	20	1	101	N	117	66.8
4886	2010-03-21	187	1	85	T	117	66.8
4887	2010-03-21	269	1	93	T	117	66.8
4888	2010-03-21	8	1	89	T	117	66.8
4889	2010-03-21	18	1	86	T	117	66.8
4890	2010-03-21	5	1	89	T	117	66.8
4891	2010-03-21	104	1	82	T	117	66.8
4892	2010-03-21	206	1	93	T	117	66.8
4893	2010-03-21	4	1	105	T	117	66.8
228	2009-12-13	5	1	84	N	117	66.8
4894	2010-03-21	86	1	104	T	117	66.8
788	2010-06-01	77	3	88	N	131	73.0
791	2010-06-01	259	3	99	N	131	73.0
794	2010-06-01	55	3	94	N	131	73.0
797	2010-06-01	217	3	88	N	131	73.0
800	2010-06-01	46	3	94	N	131	73.0
803	2010-06-02	53	3	95	N	131	73.0
806	2010-06-02	149	3	114	N	131	73.0
809	2010-06-02	69	3	93	N	131	73.0
811	2010-06-02	206	3	97	N	131	73.0
813	2010-06-02	243	3	80	N	131	73.0
815	2010-06-02	107	3	99	N	131	73.0
817	2010-06-02	269	3	98	N	131	73.0
819	2010-06-03	263	3	93	N	131	73.0
820	2010-06-03	93	3	96	N	131	73.0
821	2010-06-03	63	3	101	N	131	73.0
822	2010-06-03	255	3	99	N	131	73.0
823	2010-06-03	221	3	91	N	131	73.0
824	2010-06-03	46	3	102	N	131	73.0
825	2010-06-03	210	3	91	N	131	73.0
826	2010-06-03	83	3	91	N	131	73.0
4895	2010-03-21	135	1	96	T	117	66.8
4896	2010-03-21	130	1	86	T	117	66.8
4897	2010-03-21	17	1	97	T	117	66.8
4898	2010-03-21	9	1	79	T	117	66.8
4899	2010-03-21	13	1	97	T	117	66.8
4900	2010-03-21	21	1	97	T	117	66.8
4901	2010-03-21	28	1	99	T	117	66.8
4902	2010-03-21	10	1	94	T	117	66.8
4903	2010-03-21	23	1	100	T	117	66.8
4904	2010-03-21	12	1	86	T	117	66.8
4905	2010-03-21	273	1	77	T	117	66.8
4906	2010-03-21	49	1	94	T	117	66.8
4907	2010-03-21	45	1	86	T	117	66.8
4908	2010-03-21	36	1	85	T	117	66.8
4909	2010-03-21	175	1	85	T	117	66.8
4910	2010-03-21	120	1	85	T	117	66.8
4911	2010-03-21	246	1	83	T	117	66.8
4912	2010-03-21	237	1	89	T	117	66.8
4913	2010-03-21	128	1	99	T	117	66.8
4914	2010-03-21	178	1	98	T	117	66.8
4915	2010-03-21	166	1	81	T	117	66.8
271	2010-03-24	5	1	95	N	117	66.8
272	2010-03-22	31	1	96	N	117	66.8
273	2010-03-20	8	1	97	N	117	66.8
274	2010-03-20	31	1	91	N	117	66.8
275	2010-03-19	8	1	98	N	117	66.8
276	2010-03-19	31	1	97	N	117	66.8
277	2010-03-18	5	1	88	N	117	66.8
278	2010-03-17	1	3	94	N	131	73.0
279	2010-03-17	3	1	88	N	117	66.8
280	2010-03-16	14	1	113	N	117	66.8
292	2010-03-22	30	1	102	N	117	66.8
293	2010-03-18	30	1	92	N	117	66.8
294	2010-03-16	30	1	81	N	117	66.8
4916	2010-03-21	243	1	88	T	117	66.8
4917	2010-03-21	127	1	86	T	117	66.8
4918	2010-03-21	229	1	91	T	117	66.8
4919	2010-04-16	272	1	79	T	117	66.8
4920	2010-04-16	9	1	82	T	117	66.8
4921	2010-04-16	6	1	80	T	117	66.8
4922	2010-04-16	243	1	86	T	117	66.8
4923	2010-04-16	150	1	81	T	117	66.8
4924	2010-04-16	167	1	79	T	117	66.8
4925	2010-04-16	231	1	94	T	117	66.8
4926	2010-04-16	206	1	89	T	117	66.8
4927	2010-04-16	166	1	83	T	117	66.8
4928	2010-04-16	162	1	88	T	117	66.8
4929	2010-04-16	44	1	90	T	117	66.8
4930	2010-04-16	1	1	88	T	117	66.8
4931	2010-04-16	238	1	93	T	117	66.8
4932	2010-04-16	229	1	97	T	117	66.8
4933	2010-04-16	10	1	107	T	117	66.8
4934	2010-04-16	49	1	94	T	117	66.8
4935	2010-04-16	24	1	99	T	117	66.8
4936	2010-04-16	5	1	94	T	117	66.8
4937	2010-04-16	3	1	89	T	117	66.8
4938	2010-04-16	13	1	102	T	117	66.8
4939	2010-04-16	7	1	91	T	117	66.8
4940	2010-04-16	4	1	117	T	117	66.8
4941	2010-04-17	8	1	94	T	117	66.8
4942	2010-04-17	229	1	99	T	117	66.8
4943	2010-04-17	238	1	93	T	117	66.8
4944	2010-04-17	1	1	90	T	117	66.8
4945	2010-04-17	49	1	87	T	117	66.8
4946	2010-04-17	5	1	89	T	117	66.8
4947	2010-04-17	4	1	113	T	117	66.8
4948	2010-04-17	86	1	109	T	117	66.8
4949	2010-04-17	13	1	97	T	117	66.8
4950	2010-04-17	7	1	85	T	117	66.8
4951	2010-04-17	135	1	97	T	117	66.8
4952	2010-04-17	37	1	89	T	117	66.8
4953	2010-04-17	233	1	94	T	117	66.8
4954	2010-04-17	272	1	80	T	117	66.8
4955	2010-04-17	224	1	76	T	117	66.8
4956	2010-04-17	167	1	82	T	117	66.8
4957	2010-04-17	231	1	89	T	117	66.8
4958	2010-04-17	9	1	77	T	117	66.8
4959	2010-04-17	6	1	82	T	117	66.8
4960	2010-04-17	243	1	85	T	117	66.8
4961	2010-04-17	166	1	84	T	117	66.8
4962	2010-04-17	162	1	88	T	117	66.8
4963	2010-04-17	44	1	97	T	117	66.8
4964	2010-04-17	130	1	84	T	117	66.8
4965	2010-04-17	269	1	97	T	117	66.8
4966	2010-04-17	79	1	76	T	117	66.8
4967	2010-04-17	186	1	80	T	117	66.8
4968	2010-04-17	69	1	78	T	117	66.8
4969	2010-04-17	174	1	84	T	117	66.8
4970	2010-04-17	17	1	92	T	117	66.8
4971	2010-04-17	175	1	77	T	117	66.8
4972	2010-04-17	15	1	94	T	117	66.8
4973	2010-04-17	42	1	93	T	117	66.8
4974	2010-04-17	150	1	88	T	117	66.8
4975	2010-04-17	3	1	86	T	117	66.8
4976	2010-04-17	22	1	98	T	117	66.8
4977	2010-04-17	184	1	91	T	117	66.8
4978	2010-04-23	9	1	77	T	117	66.8
4979	2010-04-23	5	1	84	T	117	66.8
4980	2010-04-23	104	1	86	T	117	66.8
4981	2010-04-23	167	1	76	T	117	66.8
4982	2010-04-23	273	1	78	T	117	66.8
4983	2010-04-23	206	1	85	T	117	66.8
4984	2010-04-23	162	1	93	T	117	66.8
786	2010-06-01	100	3	80	N	131	73.0
789	2010-06-01	174	3	89	N	131	73.0
792	2010-06-01	259	3	97	N	131	73.0
441	2010-04-29	33	3	103	N	131	73.0
443	2010-04-30	35	3	88	N	131	73.0
445	2010-04-30	37	3	95	N	131	73.0
4985	2010-04-23	243	1	87	T	117	66.8
798	2010-06-01	263	3	95	N	131	73.0
801	2010-06-01	53	3	94	N	131	73.0
804	2010-06-02	246	3	85	N	131	73.0
807	2010-06-02	217	3	84	N	131	73.0
810	2010-06-02	167	3	88	N	131	73.0
4986	2010-04-23	166	1	92	T	117	66.8
814	2010-06-02	51	3	90	N	131	73.0
816	2010-06-03	130	3	97	N	131	73.0
818	2010-06-03	135	3	94	N	131	73.0
476	2010-04-30	39	3	90	N	131	73.0
477	2010-05-02	40	3	107	N	131	73.0
478	2010-05-02	40	3	100	N	131	73.0
479	2010-05-09	42	3	88	N	131	73.0
480	2010-05-09	44	3	91	N	131	73.0
481	2010-05-09	45	3	87	N	131	73.0
482	2010-05-09	46	3	98	N	131	73.0
483	2010-05-09	39	3	91	N	131	73.0
484	2010-05-09	47	3	87	N	131	73.0
485	2010-05-07	48	3	103	N	131	73.0
486	2010-05-07	48	3	102	N	131	73.0
487	2010-05-05	37	3	98	N	131	73.0
488	2010-05-05	38	3	105	N	131	73.0
489	2010-05-04	49	3	91	N	131	73.0
490	2010-05-04	50	3	83	N	131	73.0
491	2010-05-05	51	3	94	N	131	73.0
492	2010-05-04	52	3	95	N	131	73.0
493	2010-05-04	46	3	94	N	131	73.0
494	2010-05-04	53	3	97	N	131	73.0
495	2010-04-29	19	1	72	N	117	66.8
496	2010-05-23	33	3	96	N	131	73.0
497	2010-05-23	49	3	93	N	131	73.0
498	2010-06-30	17	3	72	N	131	73.0
499	2010-06-30	4	1	113	N	117	66.8
500	2010-05-28	53	3	100	N	131	73.0
501	2010-06-02	15	3	109	N	131	73.0
4987	2010-04-23	138	1	81	T	117	66.8
4988	2010-04-23	127	1	81	T	117	66.8
4989	2010-04-23	128	1	98	T	117	66.8
4990	2010-04-23	229	1	96	T	117	66.8
4991	2010-04-23	238	1	101	T	117	66.8
4992	2010-04-23	8	1	99	T	117	66.8
4993	2010-04-23	49	1	94	T	117	66.8
4994	2010-04-23	1	1	82	T	117	66.8
4995	2010-04-23	37	1	88	T	117	66.8
4996	2010-04-23	7	1	89	T	117	66.8
4997	2010-04-23	3	1	88	T	117	66.8
4998	2010-04-23	17	1	94	T	117	66.8
4999	2010-04-23	175	1	86	T	117	66.8
5000	2010-04-23	231	1	85	T	117	66.8
5001	2010-04-24	238	1	98	T	117	66.8
5002	2010-04-24	229	1	89	T	117	66.8
5003	2010-04-24	8	1	100	T	117	66.8
5004	2010-04-24	184	1	99	T	117	66.8
5005	2010-04-24	49	1	93	T	117	66.8
5006	2010-04-24	13	1	98	T	117	66.8
5007	2010-04-24	86	1	102	T	117	66.8
5008	2010-04-24	37	1	90	T	117	66.8
5009	2010-04-24	1	1	90	T	117	66.8
5010	2010-04-24	4	1	103	T	117	66.8
5011	2010-04-24	24	1	109	T	117	66.8
5012	2010-04-24	23	1	104	T	117	66.8
5013	2010-04-24	231	1	88	T	117	66.8
5014	2010-04-24	9	1	69	T	117	66.8
5015	2010-04-24	175	1	81	T	117	66.8
5016	2010-04-24	22	1	83	T	117	66.8
5017	2010-04-24	5	1	84	T	117	66.8
5018	2010-04-24	104	1	87	T	117	66.8
5019	2010-04-24	167	1	82	T	117	66.8
5020	2010-04-24	138	1	87	T	117	66.8
5021	2010-04-24	273	1	78	T	117	66.8
5022	2010-04-24	206	1	82	T	117	66.8
5023	2010-04-24	272	1	87	T	117	66.8
5024	2010-04-24	162	1	86	T	117	66.8
5025	2010-04-24	243	1	95	T	117	66.8
5026	2010-04-24	166	1	83	T	117	66.8
5027	2010-04-24	12	1	85	T	117	66.8
5028	2010-04-24	44	1	85	T	117	66.8
5029	2010-04-24	6	1	83	T	117	66.8
5030	2010-04-24	252	1	79	T	117	66.8
5031	2010-04-24	42	1	76	T	117	66.8
5032	2010-04-24	3	1	92	T	117	66.8
5033	2010-04-25	231	1	90	T	117	66.8
5034	2010-04-25	9	1	77	T	117	66.8
5035	2010-04-25	175	1	83	T	117	66.8
5036	2010-04-25	252	1	73	T	117	66.8
5037	2010-04-25	5	1	85	T	117	66.8
5038	2010-04-25	104	1	80	T	117	66.8
5039	2010-04-25	167	1	75	T	117	66.8
5040	2010-04-25	272	1	83	T	117	66.8
5041	2010-04-25	138	1	85	T	117	66.8
5042	2010-04-25	273	1	77	T	117	66.8
5043	2010-04-25	206	1	81	T	117	66.8
5044	2010-04-25	162	1	86	T	117	66.8
5045	2010-04-25	243	1	85	T	117	66.8
5046	2010-04-25	166	1	80	T	117	66.8
5047	2010-04-25	12	1	89	T	117	66.8
5048	2010-04-25	44	1	88	T	117	66.8
5049	2010-04-25	6	1	86	T	117	66.8
5050	2010-04-25	269	1	84	T	117	66.8
5051	2010-04-25	130	1	83	T	117	66.8
5052	2010-04-25	28	1	89	T	117	66.8
5053	2010-04-25	229	1	91	T	117	66.8
5054	2010-04-25	8	1	90	T	117	66.8
5055	2010-04-25	238	1	96	T	117	66.8
5056	2010-04-25	127	1	85	T	117	66.8
5057	2010-04-25	128	1	103	T	117	66.8
5058	2010-04-25	13	1	99	T	117	66.8
5059	2010-04-25	16	1	99	T	117	66.8
5060	2010-04-25	49	1	98	T	117	66.8
5061	2010-04-25	86	1	100	T	117	66.8
5062	2010-04-25	1	1	88	T	117	66.8
5063	2010-04-25	184	1	98	T	117	66.8
5064	2010-04-25	17	1	92	T	117	66.8
5065	2010-04-25	23	1	104	T	117	66.8
5066	2010-04-25	3	1	91	T	117	66.8
5067	2010-04-25	135	1	103	T	117	66.8
5068	2010-04-25	236	1	104	T	117	66.8
5069	2010-04-25	18	1	90	T	117	66.8
5070	2010-04-25	42	1	78	T	117	66.8
5071	2010-04-25	4	1	108	T	117	66.8
5072	2010-04-30	9	1	74	T	117	66.8
5073	2010-04-30	186	1	81	T	117	66.8
787	2010-06-01	88	3	94	N	131	73.0
790	2010-06-01	243	3	92	N	131	73.0
793	2010-06-01	47	3	88	N	131	73.0
5074	2010-04-30	6	1	85	T	117	66.8
799	2010-06-01	255	3	96	N	131	73.0
802	2010-06-02	84	3	96	N	131	73.0
805	2010-06-02	168	3	111	N	131	73.0
808	2010-06-02	117	3	83	N	131	73.0
827	2010-06-03	98	3	83	N	131	73.0
828	2010-06-03	216	3	96	N	131	73.0
829	2010-06-03	167	3	78	N	131	73.0
830	2010-06-04	79	3	77	N	131	73.0
5075	2010-04-30	272	1	82	T	117	66.8
832	2010-06-04	243	3	97	N	131	73.0
833	2010-06-04	230	3	96	N	131	73.0
834	2010-06-04	163	3	94	N	131	73.0
835	2010-06-04	117	3	86	N	131	73.0
836	2010-06-05	175	3	87	N	131	73.0
837	2010-06-05	178	3	99	N	131	73.0
838	2010-06-05	127	3	88	N	131	73.0
839	2010-06-05	86	3	98	N	131	73.0
840	2010-06-05	177	3	103	N	131	73.0
841	2010-06-05	125	3	109	N	131	73.0
842	2010-06-05	211	3	94	N	131	73.0
843	2010-06-05	165	3	86	N	131	73.0
844	2010-06-05	156	3	95	N	131	73.0
845	2010-06-05	65	3	94	N	131	73.0
846	2010-06-05	117	3	86	N	131	73.0
847	2010-06-05	174	3	90	N	131	73.0
848	2010-06-05	242	3	90	N	131	73.0
849	2010-06-05	141	3	94	N	131	73.0
850	2010-06-05	205	3	90	N	131	73.0
851	2010-06-05	53	3	93	N	131	73.0
852	2010-06-05	246	3	90	N	131	73.0
5076	2010-04-30	187	1	84	T	117	66.8
5077	2010-04-30	127	1	81	T	117	66.8
5078	2010-04-30	175	1	91	T	117	66.8
5079	2010-04-30	167	1	74	T	117	66.8
5080	2010-04-30	243	1	84	T	117	66.8
5081	2010-04-30	166	1	83	T	117	66.8
5082	2010-04-30	44	1	85	T	117	66.8
5083	2010-04-30	28	1	82	T	117	66.8
5084	2010-04-30	162	1	88	T	117	66.8
5085	2010-04-30	104	1	79	T	117	66.8
5086	2010-04-30	1	1	90	T	117	66.8
5087	2010-04-30	8	1	105	T	117	66.8
5088	2010-04-30	23	1	97	T	117	66.8
5089	2010-04-30	238	1	102	T	117	66.8
5090	2010-04-30	3	1	88	T	117	66.8
5091	2010-04-30	17	1	83	T	117	66.8
5092	2010-04-30	7	1	89	T	117	66.8
5093	2010-04-30	185	1	74	T	117	66.8
5094	2010-04-30	5	1	78	T	117	66.8
5095	2010-04-30	229	1	88	T	117	66.8
5096	2010-04-30	128	1	101	T	117	66.8
5097	2010-04-30	220	1	112	T	117	66.8
5098	2010-04-30	150	1	89	T	117	66.8
5099	2010-05-01	9	1	73	T	117	66.8
5100	2010-05-01	186	1	85	T	117	66.8
5101	2010-05-01	6	1	91	T	117	66.8
5102	2010-05-01	272	1	84	T	117	66.8
5103	2010-05-01	187	1	88	T	117	66.8
5104	2010-05-01	127	1	82	T	117	66.8
5105	2010-05-01	175	1	84	T	117	66.8
5106	2010-05-01	22	1	91	T	117	66.8
5107	2010-05-01	237	1	85	T	117	66.8
5108	2010-05-01	185	1	78	T	117	66.8
5109	2010-05-01	224	1	78	T	117	66.8
5110	2010-05-01	167	1	82	T	117	66.8
5111	2010-05-01	243	1	91	T	117	66.8
5112	2010-05-01	166	1	84	T	117	66.8
5113	2010-05-01	28	1	79	T	117	66.8
5114	2010-05-01	162	1	85	T	117	66.8
5115	2010-05-01	69	1	77	T	117	66.8
5116	2010-05-01	104	1	79	T	117	66.8
5117	2010-05-01	174	1	83	T	117	66.8
5118	2010-05-01	1	1	89	T	117	66.8
5119	2010-05-01	8	1	97	T	117	66.8
5120	2010-05-01	238	1	91	T	117	66.8
5121	2010-05-01	3	1	89	T	117	66.8
5122	2010-05-01	184	1	99	T	117	66.8
5123	2010-05-01	229	1	90	T	117	66.8
5124	2010-05-01	128	1	95	T	117	66.8
5125	2010-05-01	233	1	92	T	117	66.8
5126	2010-05-01	4	1	105	T	117	66.8
5127	2010-05-01	226	1	81	T	117	66.8
5128	2010-05-01	35	1	94	T	117	66.8
5129	2010-05-01	32	1	88	T	117	66.8
5130	2010-05-01	201	1	89	T	117	66.8
5131	2010-05-01	39	1	85	T	117	66.8
5132	2010-05-01	42	1	81	T	117	66.8
5133	2010-05-01	135	1	94	T	117	66.8
5134	2010-05-01	37	1	100	T	117	66.8
5135	2010-05-01	130	1	90	T	117	66.8
5136	2010-05-01	269	1	86	T	117	66.8
5137	2010-05-01	150	1	80	T	117	66.8
5138	2010-05-01	253	1	93	T	117	66.8
5139	2010-05-02	17	1	86	T	117	66.8
5140	2010-05-02	175	1	81	T	117	66.8
5141	2010-05-02	22	1	88	T	117	66.8
5142	2010-05-02	127	1	86	T	117	66.8
5143	2010-05-02	130	1	84	T	117	66.8
5144	2010-05-02	1	1	93	T	117	66.8
5145	2010-05-02	37	1	90	T	117	66.8
5146	2010-05-02	44	1	89	T	117	66.8
5147	2010-05-02	226	1	95	T	117	66.8
5148	2010-05-02	243	1	88	T	117	66.8
5149	2010-05-02	12	1	94	T	117	66.8
5150	2010-05-02	16	1	98	T	117	66.8
5151	2010-05-02	185	1	81	T	117	66.8
5152	2010-05-02	166	1	80	T	117	66.8
5153	2010-05-02	224	1	79	T	117	66.8
5154	2010-05-02	23	1	103	T	117	66.8
5155	2010-05-02	15	1	106	T	117	66.8
5156	2010-05-02	269	1	93	T	117	66.8
5157	2010-05-02	28	1	81	T	117	66.8
5158	2010-05-02	3	1	85	T	117	66.8
5159	2010-05-02	167	1	76	T	117	66.8
5160	2010-05-02	39	1	91	T	117	66.8
5161	2010-05-02	187	1	85	T	117	66.8
5162	2010-05-02	206	1	81	T	117	66.8
5163	2010-05-02	201	1	83	T	117	66.8
5164	2010-05-02	186	1	83	T	117	66.8
5165	2010-05-02	13	1	96	T	117	66.8
5166	2010-05-02	32	1	90	T	117	66.8
5167	2010-05-02	237	1	87	T	117	66.8
5168	2010-05-02	5	1	91	T	117	66.8
5169	2010-05-02	7	1	94	T	117	66.8
5170	2010-05-02	253	1	90	T	117	66.8
5171	2010-05-02	4	1	106	T	117	66.8
5172	2010-05-02	8	1	98	T	117	66.8
5173	2010-05-02	6	1	83	T	117	66.8
5174	2010-05-02	135	1	90	T	117	66.8
5175	2010-05-02	273	1	74	T	117	66.8
5176	2010-05-02	162	1	84	T	117	66.8
5177	2010-05-02	229	1	96	T	117	66.8
5178	2010-05-02	21	1	97	T	117	66.8
5179	2010-05-02	272	1	84	T	117	66.8
5180	2010-05-02	184	1	98	T	117	66.8
5181	2010-05-02	42	1	92	T	117	66.8
5182	2010-05-02	233	1	98	T	117	66.8
5183	2010-05-02	18	1	98	T	117	66.8
5184	2010-05-02	9	1	82	T	117	66.8
5185	2010-05-02	174	1	86	T	117	66.8
5186	2010-05-02	104	1	87	T	117	66.8
5187	2010-05-02	35	1	87	T	117	66.8
5188	2010-05-02	235	1	94	T	117	66.8
5189	2010-05-07	6	1	88	T	117	66.8
5190	2010-05-07	127	1	89	T	117	66.8
5191	2010-05-07	175	1	86	T	117	66.8
5192	2010-05-07	138	1	83	T	117	66.8
5193	2010-05-07	9	1	77	T	117	66.8
5194	2010-05-07	28	1	83	T	117	66.8
5195	2010-05-07	206	1	83	T	117	66.8
5196	2010-05-07	166	1	92	T	117	66.8
5197	2010-05-07	243	1	90	T	117	66.8
5198	2010-05-07	174	1	91	T	117	66.8
5199	2010-05-07	8	1	97	T	117	66.8
5200	2010-05-07	238	1	90	T	117	66.8
5201	2010-05-07	128	1	99	T	117	66.8
5202	2010-05-07	229	1	90	T	117	66.8
5203	2010-05-07	220	1	112	T	117	66.8
5204	2010-05-07	17	1	90	T	117	66.8
5205	2010-05-07	86	1	99	T	117	66.8
5206	2010-05-07	3	1	85	T	117	66.8
5207	2010-05-07	163	1	98	T	117	66.8
5208	2010-05-07	4	1	106	T	117	66.8
5209	2010-05-08	1	1	91	T	117	66.8
5210	2010-05-08	8	1	89	T	117	66.8
5211	2010-05-08	238	1	99	T	117	66.8
5212	2010-05-08	229	1	92	T	117	66.8
5213	2010-05-08	10	1	103	T	117	66.8
5214	2010-05-08	86	1	103	T	117	66.8
5215	2010-05-08	184	1	102	T	117	66.8
5216	2010-05-08	23	1	97	T	117	66.8
5217	2010-05-08	37	1	95	T	117	66.8
5218	2010-05-08	6	1	88	T	117	66.8
5219	2010-05-08	127	1	90	T	117	66.8
5220	2010-05-08	138	1	86	T	117	66.8
5221	2010-05-08	175	1	85	T	117	66.8
5222	2010-05-08	5	1	91	T	117	66.8
5223	2010-05-08	28	1	81	T	117	66.8
5224	2010-05-08	9	1	79	T	117	66.8
5225	2010-05-08	163	1	93	T	117	66.8
5226	2010-05-08	166	1	87	T	117	66.8
5227	2010-05-08	243	1	85	T	117	66.8
5228	2010-05-08	174	1	77	T	117	66.8
5229	2010-05-08	104	1	81	T	117	66.8
5230	2010-05-08	52	1	100	T	117	66.8
5231	2010-05-08	273	1	80	T	117	66.8
5232	2010-05-08	3	1	89	T	117	66.8
5233	2010-05-09	1	1	91	T	117	66.8
5234	2010-05-09	8	1	89	T	117	66.8
5235	2010-05-09	238	1	99	T	117	66.8
5236	2010-05-09	128	1	100	T	117	66.8
5237	2010-05-09	229	1	92	T	117	66.8
5238	2010-05-09	10	1	103	T	117	66.8
5239	2010-05-09	18	1	93	T	117	66.8
5240	2010-05-09	220	1	106	T	117	66.8
5241	2010-05-09	13	1	91	T	117	66.8
5242	2010-05-09	16	1	91	T	117	66.8
5243	2010-05-09	17	1	94	T	117	66.8
5244	2010-05-09	3	1	89	T	117	66.8
5245	2010-05-09	184	1	102	T	117	66.8
5246	2010-05-09	52	1	100	T	117	66.8
5247	2010-05-09	37	1	95	T	117	66.8
5248	2010-05-09	23	1	97	T	117	66.8
5249	2010-05-09	235	1	91	T	117	66.8
5250	2010-05-09	35	1	89	T	117	66.8
5251	2010-05-09	15	1	95	T	117	66.8
5252	2010-05-09	86	1	103	T	117	66.8
5253	2010-05-09	7	1	98	T	117	66.8
5254	2010-05-09	6	1	88	T	117	66.8
5255	2010-05-09	175	1	85	T	117	66.8
5256	2010-05-09	138	1	86	T	117	66.8
5257	2010-05-09	127	1	90	T	117	66.8
5258	2010-05-09	5	1	91	T	117	66.8
5259	2010-05-09	9	1	79	T	117	66.8
5260	2010-05-09	28	1	81	T	117	66.8
5261	2010-05-09	166	1	87	T	117	66.8
5262	2010-05-09	163	1	93	T	117	66.8
5263	2010-05-09	243	1	85	T	117	66.8
5264	2010-05-09	174	1	77	T	117	66.8
5265	2010-05-09	273	1	80	T	117	66.8
5266	2010-05-09	104	1	81	T	117	66.8
5267	2010-05-14	1	1	89	T	117	66.8
5268	2010-05-14	4	1	99	T	117	66.8
5269	2010-05-14	238	1	90	T	117	66.8
5270	2010-05-14	128	1	98	T	117	66.8
5271	2010-05-14	220	1	106	T	117	66.8
5272	2010-05-14	229	1	87	T	117	66.8
5273	2010-05-14	7	1	85	T	117	66.8
5274	2010-05-14	8	1	91	T	117	66.8
5275	2010-05-14	14	1	101	T	117	66.8
5276	2010-05-14	23	1	104	T	117	66.8
5277	2010-05-14	167	1	74	T	117	66.8
5278	2010-05-14	162	1	84	T	117	66.8
5279	2010-05-14	127	1	79	T	117	66.8
5280	2010-05-14	175	1	77	T	117	66.8
5281	2010-05-14	9	1	74	T	117	66.8
5282	2010-05-14	28	1	77	T	117	66.8
5283	2010-05-14	272	1	82	T	117	66.8
5284	2010-05-14	187	1	84	T	117	66.8
5285	2010-05-14	138	1	75	T	117	66.8
5286	2010-05-14	5	1	83	T	117	66.8
5287	2010-05-14	243	1	84	T	117	66.8
5288	2010-05-14	166	1	79	T	117	66.8
5289	2010-05-14	6	1	83	T	117	66.8
5290	2010-05-14	21	1	87	T	117	66.8
5291	2010-05-14	49	1	91	T	117	66.8
5292	2010-05-14	273	1	76	T	117	66.8
5293	2010-05-14	185	1	70	T	117	66.8
5294	2010-05-14	241	1	87	T	117	66.8
5295	2010-05-15	138	1	71	T	117	66.8
5296	2010-05-15	187	1	71	T	117	66.8
5297	2010-05-15	5	1	70	T	117	66.8
5298	2010-05-15	246	1	76	T	117	66.8
5299	2010-05-15	243	1	74	T	117	66.8
5300	2010-05-15	49	1	75	T	117	66.8
5301	2010-05-15	162	1	71	T	117	66.8
5302	2010-05-15	185	1	69	T	117	66.8
5303	2010-05-15	3	1	75	T	117	66.8
5304	2010-05-15	4	1	83	T	117	66.8
5305	2010-05-15	238	1	88	T	117	66.8
5306	2010-05-15	220	1	86	T	117	66.8
5307	2010-05-15	229	1	79	T	117	66.8
5308	2010-05-15	37	1	77	T	117	66.8
5309	2010-05-15	130	1	77	T	117	66.8
5310	2010-05-16	4	1	99	T	117	66.8
5311	2010-05-16	1	1	93	T	117	66.8
5312	2010-05-16	238	1	89	T	117	66.8
5313	2010-05-16	128	1	97	T	117	66.8
5314	2010-05-16	220	1	101	T	117	66.8
5315	2010-05-16	235	1	96	T	117	66.8
5316	2010-05-16	18	1	97	T	117	66.8
5317	2010-05-16	135	1	93	T	117	66.8
5318	2010-05-16	229	1	84	T	117	66.8
5319	2010-05-16	7	1	91	T	117	66.8
5320	2010-05-16	37	1	91	T	117	66.8
5321	2010-05-16	14	1	101	T	117	66.8
5322	2010-05-16	8	1	91	T	117	66.8
5323	2010-05-16	162	1	84	T	117	66.8
5324	2010-05-16	167	1	73	T	117	66.8
5325	2010-05-16	10	1	103	T	117	66.8
5326	2010-05-16	23	1	103	T	117	66.8
5327	2010-05-16	187	1	85	T	117	66.8
5328	2010-05-16	272	1	84	T	117	66.8
5329	2010-05-16	138	1	78	T	117	66.8
5330	2010-05-16	5	1	79	T	117	66.8
5331	2010-05-16	120	1	78	T	117	66.8
5332	2010-05-16	246	1	82	T	117	66.8
5333	2010-05-16	6	1	81	T	117	66.8
5334	2010-05-16	21	1	88	T	117	66.8
5335	2010-05-16	150	1	82	T	117	66.8
5336	2010-05-16	166	1	79	T	117	66.8
5337	2010-05-16	243	1	84	T	117	66.8
5338	2010-05-16	49	1	86	T	117	66.8
5339	2010-05-16	241	1	87	T	117	66.8
5340	2010-05-16	273	1	75	T	117	66.8
5341	2010-05-16	185	1	76	T	117	66.8
5342	2010-05-16	269	1	88	T	117	66.8
5343	2010-05-16	130	1	82	T	117	66.8
5414	2010-06-20	66	3	105	N	131	73.0
5421	2010-06-06	117	3	81	N	131	73.0
5428	2010-06-06	214	3	86	N	131	73.0
5435	2010-06-08	195	3	90	N	131	73.0
5442	2010-06-08	174	3	91	N	131	73.0
5449	2010-06-09	196	3	95	N	131	73.0
5456	2010-06-10	167	3	85	N	131	73.0
5463	2010-06-09	124	3	93	N	131	73.0
5470	2010-06-09	51	3	91	N	131	73.0
5477	2010-06-10	177	3	100	N	131	73.0
5484	2010-06-11	168	3	90	N	131	73.0
5491	2010-06-11	230	3	90	N	131	73.0
5498	2010-06-12	230	3	94	N	131	73.0
5505	2010-06-12	124	3	89	N	131	73.0
5512	2010-06-24	133	3	104	N	131	73.0
5519	2010-06-24	224	3	80	N	131	73.0
5526	2010-06-25	174	3	92	N	131	73.0
5533	2010-06-25	100	3	83	N	131	73.0
5540	2010-06-25	167	3	77	N	131	73.0
5547	2010-06-26	127	3	88	N	131	73.0
5554	2010-06-26	39	3	87	N	131	73.0
5561	2010-08-01	219	3	80	N	131	73.0
5568	2010-08-01	268	3	95	N	131	73.0
5575	2010-08-01	36	3	90	N	131	73.0
5582	2010-08-01	172	3	97	N	131	73.0
5589	2010-08-01	42	3	94	N	131	73.0
5596	2010-08-01	212	3	97	N	131	73.0
5603	2010-08-01	171	3	94	N	131	73.0
5610	2010-08-01	127	3	87	N	131	73.0
5617	2010-08-01	252	3	85	N	131	73.0
5624	2010-08-01	64	3	100	N	131	73.0
5631	2010-08-03	179	3	100	N	131	73.0
5638	2010-08-03	47	3	85	N	131	73.0
5645	2010-08-01	114	3	103	N	131	73.0
5652	2010-08-03	53	3	96	N	131	73.0
5415	2010-06-20	66	3	88	N	131	73.0
5422	2010-06-06	40	3	95	N	131	73.0
5429	2010-06-07	142	3	91	N	131	73.0
5436	2010-06-08	39	3	87	N	131	73.0
5443	2010-06-08	243	3	84	N	131	73.0
5450	2010-06-09	248	3	104	N	131	73.0
5457	2010-06-10	124	3	97	N	131	73.0
5464	2010-06-09	150	3	82	N	131	73.0
5471	2010-06-09	49	3	99	N	131	73.0
5478	2010-06-10	33	3	96	N	131	73.0
5485	2010-06-11	38	3	96	N	131	73.0
5492	2010-06-09	83	3	95	N	131	73.0
5499	2010-06-12	36	3	96	N	131	73.0
5506	2010-06-12	194	3	95	N	131	73.0
5513	2010-06-24	88	3	99	N	131	73.0
5520	2010-06-25	35	3	93	N	131	73.0
5527	2010-06-25	232	3	89	N	131	73.0
5534	2010-06-25	162	3	84	N	131	73.0
5541	2010-06-25	168	3	95	N	131	73.0
5548	2010-06-26	53	3	93	N	131	73.0
5555	2010-06-26	52	3	99	N	131	73.0
5562	2010-08-01	39	3	81	N	131	73.0
5569	2010-08-01	148	3	102	N	131	73.0
5576	2010-08-01	206	3	95	N	131	73.0
5583	2010-08-01	22	3	91	N	131	73.0
5590	2010-08-01	95	3	99	N	131	73.0
5597	2010-08-01	80	3	101	N	131	73.0
5604	2010-08-01	261	3	98	N	131	73.0
5611	2010-08-01	217	3	91	N	131	73.0
5618	2010-08-01	52	3	106	N	131	73.0
5625	2010-08-02	219	3	74	N	131	73.0
5632	2010-08-03	193	3	95	N	131	73.0
5639	2010-08-03	108	3	92	N	131	73.0
5646	2010-08-01	140	3	103	N	131	73.0
5653	2010-08-03	39	3	84	N	131	73.0
5416	2010-06-06	80	3	108	N	131	73.0
5423	2010-06-06	132	3	97	N	131	73.0
5430	2010-06-07	232	3	99	N	131	73.0
5437	2010-06-08	46	3	95	N	131	73.0
5444	2010-06-08	47	3	91	N	131	73.0
5451	2010-06-09	192	3	104	N	131	73.0
5458	2010-06-10	162	3	92	N	131	73.0
5465	2010-06-09	167	3	79	N	131	73.0
5472	2010-06-09	243	3	93	N	131	73.0
5479	2010-06-10	105	3	105	N	131	73.0
5486	2010-06-11	180	3	106	N	131	73.0
5493	2010-06-09	216	3	91	N	131	73.0
5500	2010-06-12	263	3	93	N	131	73.0
5507	2010-06-12	88	3	97	N	131	73.0
5514	2010-06-24	163	3	97	N	131	73.0
5521	2010-06-25	119	3	99	N	131	73.0
5528	2010-06-25	224	3	89	N	131	73.0
5535	2010-06-25	230	3	93	N	131	73.0
5542	2010-06-25	126	3	108	N	131	73.0
5549	2010-06-26	148	3	89	N	131	73.0
5556	2010-06-26	128	3	94	N	131	73.0
5563	2010-08-01	269	3	91	N	131	73.0
5570	2010-08-01	130	3	92	N	131	73.0
5577	2010-08-01	72	3	101	N	131	73.0
5584	2010-08-01	259	3	99	N	131	73.0
5591	2010-08-01	215	3	99	N	131	73.0
5598	2010-08-01	86	3	104	N	131	73.0
5605	2010-08-01	44	3	94	N	131	73.0
5612	2010-08-01	104	3	89	N	131	73.0
5619	2010-08-01	165	3	90	N	131	73.0
5626	2010-08-02	217	3	82	N	131	73.0
5633	2010-08-01	59	3	89	N	131	73.0
5640	2010-08-02	192	3	101	N	131	73.0
5647	2010-08-01	263	3	90	N	131	73.0
5417	2010-06-06	80	3	103	N	131	73.0
5424	2010-06-06	92	3	97	N	131	73.0
5431	2010-06-08	224	3	89	N	131	73.0
5438	2010-06-08	212	3	100	N	131	73.0
5445	2010-06-09	38	3	107	N	131	73.0
5452	2010-06-09	187	3	91	N	131	73.0
5459	2010-06-10	221	3	89	N	131	73.0
5466	2010-06-09	88	3	98	N	131	73.0
5473	2010-06-10	93	3	99	N	131	73.0
5480	2010-06-10	179	3	93	N	131	73.0
5487	2010-06-11	81	3	108	N	131	73.0
5494	2010-06-12	216	3	94	N	131	73.0
5501	2010-06-12	96	3	100	N	131	73.0
5508	2010-06-13	33	3	96	N	131	73.0
5515	2010-06-24	79	3	80	N	131	73.0
5522	2010-06-25	226	3	92	N	131	73.0
5529	2010-06-24	59	3	88	N	131	73.0
5536	2010-06-25	69	3	86	N	131	73.0
5543	2010-06-25	126	3	96	N	131	73.0
5550	2010-06-26	216	3	94	N	131	73.0
5557	2010-06-26	86	3	104	N	131	73.0
5564	2010-08-01	168	3	92	N	131	73.0
5571	2010-08-01	34	3	92	N	131	73.0
5578	2010-08-01	224	3	86	N	131	73.0
5585	2010-08-01	128	3	106	N	131	73.0
5592	2010-08-01	245	3	105	N	131	73.0
5599	2010-08-01	166	3	90	N	131	73.0
5606	2010-08-01	132	3	96	N	131	73.0
5613	2010-08-01	190	3	90	N	131	73.0
5620	2010-08-01	96	3	102	N	131	73.0
5627	2010-08-02	133	3	97	N	131	73.0
5634	2010-08-01	174	3	83	N	131	73.0
5641	2010-08-03	126	3	99	N	131	73.0
5648	2010-08-03	33	3	95	N	131	73.0
5418	2010-06-06	39	3	84	N	131	73.0
5425	2010-06-06	47	3	86	N	131	73.0
5432	2010-06-08	49	3	97	N	131	73.0
5439	2010-06-08	175	3	89	N	131	73.0
5446	2010-06-09	168	3	99	N	131	73.0
5453	2010-06-09	179	3	93	N	131	73.0
5460	2010-06-10	65	3	93	N	131	73.0
5467	2010-06-09	217	3	87	N	131	73.0
5474	2010-06-10	96	3	102	N	131	73.0
5481	2010-06-10	61	3	95	N	131	73.0
5488	2010-06-11	36	3	94	N	131	73.0
5495	2010-06-12	83	3	94	N	131	73.0
5502	2010-06-12	93	3	92	N	131	73.0
5509	2010-06-13	171	3	104	N	131	73.0
5516	2010-06-24	233	3	95	N	131	73.0
5523	2010-06-25	48	3	102	N	131	73.0
5530	2010-06-25	274	3	86	N	131	73.0
5537	2010-06-25	49	3	91	N	131	73.0
5544	2010-06-26	125	3	109	N	131	73.0
5551	2010-06-26	210	3	87	N	131	73.0
5558	2010-06-26	186	3	80	N	131	73.0
5565	2010-08-01	241	3	95	N	131	73.0
5572	2010-08-01	135	3	103	N	131	73.0
5579	2010-08-01	100	3	92	N	131	73.0
5586	2010-08-01	202	3	103	N	131	73.0
5593	2010-08-01	142	3	101	N	131	73.0
5600	2010-08-01	88	3	99	N	131	73.0
5607	2010-08-01	113	3	96	N	131	73.0
5614	2010-08-01	53	3	98	N	131	73.0
5621	2010-08-01	175	3	91	N	131	73.0
5628	2010-08-03	82	3	110	N	131	73.0
5635	2010-08-03	259	3	96	N	131	73.0
5642	2010-08-02	232	3	91	N	131	73.0
5649	2010-08-02	105	3	112	N	131	73.0
5344	2010-05-18	87	1	76	T	117	66.8
5345	2010-05-18	87	1	76	T	117	66.8
5346	2010-05-18	87	1	77	T	117	66.8
5347	2010-05-18	87	1	79	T	117	66.8
5348	2010-05-22	128	1	106	T	117	66.8
5349	2010-05-22	175	1	78	T	117	66.8
5350	2010-05-22	229	1	88	T	117	66.8
5351	2010-05-22	18	1	89	T	117	66.8
5352	2010-05-22	128	1	109	T	117	66.8
5353	2010-05-22	175	1	85	T	117	66.8
5354	2010-05-22	229	1	95	T	117	66.8
5355	2010-05-22	18	1	101	T	117	66.8
5356	2010-05-22	13	1	104	T	117	66.8
5357	2010-05-22	272	1	88	T	117	66.8
5358	2010-05-22	162	1	95	T	117	66.8
5359	2010-05-22	167	1	73	T	117	66.8
5360	2010-05-22	1	1	104	T	117	66.8
5361	2010-05-22	226	1	94	T	117	66.8
5362	2010-05-22	7	1	98	T	117	66.8
5363	2010-05-22	13	1	104	T	117	66.8
5364	2010-05-22	272	1	81	T	117	66.8
5365	2010-05-22	51	1	88	T	117	66.8
5366	2010-05-22	162	1	93	T	117	66.8
5367	2010-05-22	167	1	86	T	117	66.8
5368	2010-05-22	1	1	88	T	117	66.8
5369	2010-05-22	226	1	86	T	117	66.8
5370	2010-05-23	167	1	70	T	117	66.8
5371	2010-05-23	1	1	94	T	117	66.8
5372	2010-05-23	13	1	95	T	117	66.8
5373	2010-05-23	15	1	98	T	117	66.8
5374	2010-05-23	175	1	78	T	117	66.8
5375	2010-05-23	238	1	96	T	117	66.8
5376	2010-05-23	162	1	87	T	117	66.8
5377	2010-05-23	128	1	101	T	117	66.8
5378	2010-05-23	220	1	113	T	117	66.8
5379	2010-05-23	226	1	87	T	117	66.8
5380	2010-05-23	4	1	101	T	117	66.8
5381	2010-05-23	229	1	86	T	117	66.8
5382	2010-05-23	16	1	89	T	117	66.8
5383	2010-05-23	21	1	84	T	117	66.8
5384	2010-05-23	86	1	101	T	117	66.8
5385	2010-05-23	5	1	91	T	117	66.8
5386	2010-05-23	272	1	82	T	117	66.8
5387	2010-05-23	18	1	92	T	117	66.8
5388	2010-05-23	23	1	97	T	117	66.8
5389	2010-05-26	117	1	79	T	117	66.8
5390	2010-05-26	167	1	81	T	117	66.8
5391	2010-05-26	1	1	89	T	117	66.8
5392	2010-05-26	8	1	102	T	117	66.8
5393	2010-05-26	8	1	98	T	117	66.8
5394	2010-05-26	175	1	88	T	117	66.8
5395	2010-05-26	1	1	98	T	117	66.8
5396	2010-05-26	167	1	71	T	117	66.8
5397	2010-05-26	117	1	80	T	117	66.8
5398	2010-05-26	8	1	102	T	117	66.8
5399	2010-05-26	1	1	97	T	117	66.8
5400	2010-05-26	167	1	78	T	117	66.8
5401	2010-05-26	117	1	81	T	117	66.8
5402	2010-05-26	117	1	82	T	117	66.8
5419	2010-06-06	46	3	93	N	131	73.0
5426	2010-06-06	263	3	95	N	131	73.0
5433	2010-06-08	233	3	98	N	131	73.0
5440	2010-06-08	178	3	102	N	131	73.0
5447	2010-06-09	109	3	96	N	131	73.0
5454	2010-06-09	112	3	100	N	131	73.0
5461	2010-06-09	221	3	78	N	131	73.0
5468	2010-06-09	152	3	87	N	131	73.0
5475	2010-06-10	263	3	96	N	131	73.0
5482	2010-06-10	108	3	95	N	131	73.0
5489	2010-06-11	49	3	93	N	131	73.0
5496	2010-06-12	97	3	100	N	131	73.0
5503	2010-06-12	221	3	85	N	131	73.0
5510	2010-06-13	171	3	94	N	131	73.0
5517	2010-06-24	195	3	94	N	131	73.0
5524	2010-06-25	195	3	93	N	131	73.0
5531	2010-06-25	46	3	91	N	131	73.0
5538	2010-06-25	49	3	92	N	131	73.0
5545	2010-06-26	175	3	88	N	131	73.0
5552	2010-06-26	124	3	91	N	131	73.0
5559	2010-06-26	215	3	93	N	131	73.0
5566	2010-08-01	238	3	110	N	131	73.0
5573	2010-08-01	33	3	112	N	131	73.0
5580	2010-08-01	225	3	94	N	131	73.0
5587	2010-08-01	230	3	104	N	131	73.0
5594	2010-08-01	256	3	89	N	131	73.0
5601	2010-08-01	103	3	104	N	131	73.0
5608	2010-08-01	112	3	102	N	131	73.0
5615	2010-08-01	46	3	100	N	131	73.0
5622	2010-08-01	231	3	90	N	131	73.0
5629	2010-08-03	192	3	94	N	131	73.0
5636	2010-08-02	187	3	93	N	131	73.0
5643	2010-08-02	195	3	93	N	131	73.0
5650	2010-08-03	141	3	92	N	131	73.0
5420	2010-06-06	156	3	96	N	131	73.0
5427	2010-06-07	117	3	77	N	131	73.0
5434	2010-06-08	195	3	98	N	131	73.0
5441	2010-06-08	86	3	102	N	131	73.0
5448	2010-06-09	196	3	100	N	131	73.0
5455	2010-06-10	49	3	91	N	131	73.0
5462	2010-06-09	210	3	92	N	131	73.0
5469	2010-06-09	107	3	97	N	131	73.0
5476	2010-06-10	125	3	104	N	131	73.0
5403	2010-05-27	1	1	98	T	117	66.8
5404	2010-05-27	175	1	88	T	117	66.8
5405	2010-05-27	8	1	98	T	117	66.8
5406	2010-05-27	272	1	83	T	117	66.8
5407	2010-05-27	117	1	80	T	117	66.8
5408	2010-05-27	117	1	81	T	117	66.8
5409	2010-05-27	272	1	91	T	117	66.8
5410	2010-05-27	8	1	102	T	117	66.8
5411	2010-05-27	1	1	97	T	117	66.8
5412	2010-05-27	117	1	82	T	117	66.8
5413	2010-05-27	8	1	99	T	117	66.8
5483	2010-06-11	148	3	94	N	131	73.0
5490	2010-06-11	217	3	83	N	131	73.0
5497	2010-06-12	120	3	93	N	131	73.0
5504	2010-06-12	210	3	90	N	131	73.0
5511	2010-06-13	109	3	104	N	131	73.0
5518	2010-06-24	232	3	91	N	131	73.0
5525	2010-06-25	233	3	98	N	131	73.0
5532	2010-06-25	53	3	92	N	131	73.0
5539	2010-06-25	79	3	85	N	131	73.0
5546	2010-06-26	178	3	93	N	131	73.0
5553	2010-06-26	46	3	90	N	131	73.0
5560	2010-08-01	186	3	75	N	131	73.0
5567	2010-08-01	106	3	112	N	131	73.0
5574	2010-08-01	47	3	93	N	131	73.0
5581	2010-08-01	61	3	93	N	131	73.0
5588	2010-08-01	243	3	92	N	131	73.0
5595	2010-08-01	109	3	104	N	131	73.0
5602	2010-08-01	169	3	98	N	131	73.0
5609	2010-08-01	62	3	89	N	131	73.0
5616	2010-08-01	79	3	86	N	131	73.0
5623	2010-08-01	117	3	85	N	131	73.0
5630	2010-08-03	180	3	95	N	131	73.0
5637	2010-08-03	226	3	94	N	131	73.0
5644	2010-08-02	233	3	100	N	131	73.0
5651	2010-08-03	46	3	92	N	131	73.0
\.


--
-- Data for Name: web_team; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_team (id, name, teamtrophy_id) FROM stdin;
1	hills kings	1
5	golf warriors	1
6	team ngc	1
7	Tirupur tigers	1
8	tirupur titans	1
9	wellington warriers	1
10	coonoor cavalier	1
11	bangalore boys	1
12	Indian tigers	1
13	Super golfers	1
3	Sultans of swing	1
2	Blue Mountains	1
4	Fairway minors	1
\.


--
-- Data for Name: web_team_members; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_team_members (id, team_id, matchentry_id) FROM stdin;
1	1	608
2	1	546
3	1	612
4	1	627
5	1	532
6	1	597
7	1	602
33	5	544
34	5	545
35	5	578
36	5	553
37	5	620
38	5	559
39	5	629
40	5	600
41	5	573
42	5	542
43	6	609
44	6	548
45	6	566
46	6	583
47	6	552
48	6	589
49	6	624
50	6	596
51	6	598
52	6	599
53	7	576
54	7	577
55	7	611
56	7	613
57	7	584
58	7	561
59	7	595
60	7	605
61	8	579
62	8	622
63	8	637
64	8	631
65	8	570
66	8	538
67	8	638
68	8	543
69	9	550
70	9	590
71	9	560
72	9	626
73	9	564
74	9	534
75	9	568
76	9	628
77	9	571
78	9	540
79	10	603
80	10	585
81	10	555
82	10	623
83	10	562
84	10	632
85	10	607
86	10	635
87	10	636
88	10	572
89	11	610
90	11	547
91	11	554
92	11	625
93	11	594
94	11	567
95	12	633
96	12	634
97	12	621
98	12	606
99	12	535
100	13	593
101	13	619
102	13	551
103	13	574
104	13	591
105	3	581
106	3	614
107	3	616
108	3	618
109	3	556
110	3	558
111	3	592
112	3	533
113	3	537
114	3	541
115	2	549
116	2	617
117	2	586
118	2	563
119	2	565
120	2	604
121	4	580
122	4	615
123	4	587
124	4	630
125	4	569
126	4	536
127	4	601
128	4	539
129	4	575
\.


--
-- Data for Name: web_teamtrophy; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_teamtrophy (id, name, tournament_id, handlimit, best, format) FROM stdin;
1	intercity championship	12	24	6	AG
\.


--
-- Data for Name: web_tee; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_tee (id, course_id, colour, description, sloperating, courserating) FROM stdin;
3	2	WT	Gents Tee	131	73.0
1	1	WT	Gents Tee	117	66.8
5	4	WT	JWGC	111	65.9
6	4	RD	Ladies Tee	104	67.2
4	2	RD	Ladies Tee	121	72.7
2	1	RD	Ladies	114	67.0
\.


--
-- Data for Name: web_teeoff; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_teeoff (id, draw_id, hole, starttime, fourballs, threeballs, twoballs, singles, priority) FROM stdin;
12	6	1	07:30:00	0	6	0	0	1
13	6	16	07:40:00	1	2	0	0	2
14	7	1	07:30:00	0	8	0	0	1
15	7	10	07:30:00	1	5	0	0	2
16	8	1	07:30:00	0	6	0	0	1
17	8	16	07:45:00	0	4	0	0	2
18	9	1	07:30:00	0	8	0	0	1
19	9	10	07:30:00	0	7	0	0	2
9	5	1	07:30:00	0	6	0	0	1
10	5	16	07:45:00	0	2	0	0	2
11	5	2	01:30:00	0	2	0	0	3
20	10	1	07:15:00	1	8	0	0	1
21	10	10	07:15:00	1	8	0	0	2
22	11	1	07:30:00	2	5	0	0	1
23	12	1	07:30:00	0	7	0	0	1
24	12	16	07:45:00	2	2	0	0	2
25	13	1	07:30:00	0	7	0	0	1
26	13	10	07:45:00	0	7	0	0	2
27	13	16	08:00:00	0	7	0	0	3
28	14	1	07:30:00	1	6	0	0	1
29	14	16	08:00:00	1	4	0	0	2
30	15	1	07:00:00	0	10	0	0	1
31	15	10	07:00:00	0	10	0	0	2
32	15	16	07:45:00	1	6	0	0	3
33	16	1	07:30:00	2	5	0	0	1
34	17	1	07:30:00	0	6	0	0	1
35	17	16	07:45:00	1	3	0	0	2
36	18	1	07:30:00	0	8	0	0	1
37	18	10	07:30:00	1	6	0	0	2
38	19	1	07:00:00	6	0	0	0	1
39	19	10	07:00:00	4	0	0	0	2
40	20	1	07:30:00	0	6	0	0	1
41	20	16	07:45:00	0	4	0	0	2
42	21	1	07:30:00	0	7	0	0	1
43	21	10	07:30:00	0	6	0	0	2
44	22	1	07:30:00	0	7	0	0	1
45	22	10	07:30:00	1	4	0	0	2
46	23	1	07:30:00	1	4	0	0	1
47	23	16	07:45:00	0	4	0	0	2
48	24	1	07:30:00	1	5	0	0	1
49	24	10	07:30:00	0	6	0	0	2
\.


--
-- Data for Name: web_tempreg; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_tempreg (id, username, email, date, code) FROM stdin;
\.


--
-- Data for Name: web_tournament; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_tournament (id, startdate, rounds, course_id, closed) FROM stdin;
29	2010-10-01	1	1	f
30	2010-10-02	2	1	f
31	2010-09-03	1	1	f
6	2010-04-18	1	1	t
1	2010-02-20	1	1	t
2	2010-02-21	1	1	t
3	2010-03-21	1	1	t
4	2010-04-16	1	1	t
5	2010-04-17	1	1	t
7	2010-04-23	1	1	t
8	2010-04-24	1	1	t
9	2010-04-25	1	1	t
10	2010-04-30	1	1	t
11	2010-05-01	1	1	t
12	2010-05-02	1	1	t
13	2010-05-07	1	1	t
14	2010-05-08	1	1	t
15	2010-05-09	1	1	t
16	2010-05-14	1	1	t
17	2010-05-15	1	1	t
18	2010-05-16	1	1	t
19	2010-05-18	4	1	t
20	2010-05-19	3	1	t
21	2010-05-22	2	1	t
22	2010-05-23	1	1	t
23	2010-05-26	4	1	t
24	2010-05-27	3	1	t
25	2010-05-29	1	1	t
26	2010-06-06	1	1	t
27	2010-07-11	1	2	t
28	2010-09-26	1	1	t
\.


--
-- Data for Name: web_trophy; Type: TABLE DATA; Schema: public; Owner: lawgon
--

COPY web_trophy (id, tournament_id, name, format, handicapmax, handicapmin) FROM stdin;
1	1	G.B.Nahar	ST	30	17
2	1	Khems Trophy	ST	16	0
3	1	Khems 2	GS	30	0
10	3	Dr Velappan memorial trophy max 24 strokes	VL	30	0
7	3	Dr Velappan trophy	GB	30	0
19	7	Khatau Memorial Trophy	ST	16	0
4	2	Variety Hall Ooty Trophy	ST	16	0
20	7	Chalmers Cup	ST	30	17
5	2	Variety Hall Ooty Trophy 1	ST	30	17
6	2	Variety Hall Ooty Trophy  2	GS	30	0
12	4	Kairagarth Cup	ST	30	17
11	4	M.C.T.Muthiah Silver Salver 	ST	16	0
13	5	PPI Trophy	AG	16	0
14	5	Club Challenge 	AG	30	17
15	5	PPI Trophy 1	GG	30	0
16	6	Jaihind Mills Trophy 	ST	16	0
17	6	Jaihind Mills Trophy 1	GS	30	0
18	6	Pravin Tex Trophy	ST	30	17
21	8	Mari Trophy	ST	16	0
22	8	Mari Trophy 1	ST	30	17
23	8	Mari Trophy 2	GS	30	0
24	9	Kingfisher Cup	ST	16	0
25	9	Kingfisher Cup 1	ST	30	17
26	9	Kingfisher Cup 2	GS	30	0
27	10	Bejois VSOP Trophy	ST	16	0
28	10	Bejois VSOP Trophy 1	ST	30	17
33	11	Arokiaswamy Memorial Trophy	ST	16	0
34	11	Arokiaswamy Memorial Trophy 1	GS	30	0
35	11	Bobjee Cup	ST	30	17
32	10	Bejois VSOP Trophy 2	GS	30	0
36	12	Ambal Trophy	AG	16	0
37	12	Ambal Trophy 1	AG	30	17
38	12	Ambal Trophy 2	GG	30	0
39	12	Intercity - Melur Cup	ST	30	0
40	13	Holdsworth Memorial Trophy	ST	16	0
41	13	Holdsworth Memorial Trophy 1	ST	30	17
45	15	Shri K.Rajagopal Trophy	ST	16	0
50	16	The Bali Cup 	AG	18	0
51	16	The Bali Cup 1	AG	30	19
48	15	Shri K.Rajagopal Trophy 1	ST	30	17
49	15	Shri K.Rajagopal Trophy 2	GS	30	0
42	14	Mathew Philip Memorial Trophy	ST	16	0
43	14	Mathew Philip Memorial Trophy 1	ST	30	17
44	14	Mathew Philip Memorial Trophy 2	GS	30	0
52	17	Good Shepherd International School Trophy	MR	18	0
53	17	Good Shepherd Internationa School Trophy 1	MR	30	19
54	17	Good Shepherd International School Trophy 2	GM	30	0
55	18	Centwin Trophy	AG	18	0
56	18	Centwin Trophy 1	AG	30	19
57	18	Centwin Trophy 2	GG	30	0
58	19	TN open A	A	30	0
59	19	TN open B	B	30	0
60	19	TN open C	C	30	0
61	19	TN open A&B	AB	30	0
65	21	The Dunlop Shield	MR	24	0
63	20	TN open girls A&B	BG	30	0
64	20	TN open C girls	CG	30	0
62	20	TN open D	D	30	0
66	21	The Dunlop Shield 1	GM	24	0
67	22	Cotton City Challenge 	MR	16	0
68	22	Cotton City Challenge 1	MR	30	17
69	22	Cotton City Challenge 2	GM	30	0
70	23	The 107th Open Amateur Golf Championship of Southern India	MR	24	0
72	23	The 107th Open Amateur Golf Championship of Southern India 1	GM	24	0
74	24	Senior Open	MR	26	0
75	25	Mitsubishi EDM / Laser Trophy	MR	18	0
76	25	Mitsubishi EDM / Laser Trophy 1	MR	30	19
77	25	Miysubishi EDM / Laser Trophy 2	GM	30	0
78	24	Senior Open 1	GM	26	0
79	27	sam pumps trophy 	ST	18	0
80	27	golkuldas mem trophy 	ST	30	19
81	27	sam pumps trophy  1	GS	0	30
82	28	Anand Polytronics Trophy	AG	18	0
83	28	Mahendra Trophy	AG	30	19
84	28	Anand Polytronics Trophy 1	GG	30	0
91	29	Elgi Trophy	ST	18	0
92	29	N.K.Trophy	ST	30	19
93	29	Elgi Trophy 1	GS	30	0
95	30	Hanau Cup	MR	24	0
97	31	Kumaran Trophy	MR	18	0
98	31	Kumaran Trophy 1	MR	30	19
99	31	Kumaran Trophy 2	GM	30	0
94	30	Centenary Open	GM	24	0
96	30	Senior Open	GM	24	0
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_message_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_comment_flags_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_pkey PRIMARY KEY (id);


--
-- Name: django_comment_flags_user_id_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_key UNIQUE (user_id, comment_id, flag);


--
-- Name: django_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: web_course_name_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_course
    ADD CONSTRAINT web_course_name_key UNIQUE (name);


--
-- Name: web_course_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_course
    ADD CONSTRAINT web_course_pkey PRIMARY KEY (id);


--
-- Name: web_currenthandicap_member_id_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_currenthandicap
    ADD CONSTRAINT web_currenthandicap_member_id_key UNIQUE (member_id);


--
-- Name: web_currenthandicap_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_currenthandicap
    ADD CONSTRAINT web_currenthandicap_pkey PRIMARY KEY (id);


--
-- Name: web_draw_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_draw
    ADD CONSTRAINT web_draw_pkey PRIMARY KEY (id);


--
-- Name: web_draw_tournament_id_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_draw
    ADD CONSTRAINT web_draw_tournament_id_key UNIQUE (tournament_id, day);


--
-- Name: web_handicap_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_handicap
    ADD CONSTRAINT web_handicap_pkey PRIMARY KEY (id);


--
-- Name: web_handicap_player_id_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_handicap
    ADD CONSTRAINT web_handicap_player_id_key UNIQUE (player_id, valto);


--
-- Name: web_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_hole
    ADD CONSTRAINT web_hole_pkey PRIMARY KEY (id);


--
-- Name: web_hole_tee_id_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_hole
    ADD CONSTRAINT web_hole_tee_id_key UNIQUE (tee_id, number);


--
-- Name: web_matchentry_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_matchentry
    ADD CONSTRAINT web_matchentry_pkey PRIMARY KEY (id);


--
-- Name: web_matchentry_tournament_player_round_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_matchentry
    ADD CONSTRAINT web_matchentry_tournament_player_round_key UNIQUE (tournament_id, player_id, round);


--
-- Name: web_member_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_member
    ADD CONSTRAINT web_member_pkey PRIMARY KEY (id);


--
-- Name: web_member_player_id_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_member
    ADD CONSTRAINT web_member_player_id_key UNIQUE (player_id);


--
-- Name: web_partner_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_partner
    ADD CONSTRAINT web_partner_pkey PRIMARY KEY (id);


--
-- Name: web_partnershiptrophy_name_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_partnershiptrophy
    ADD CONSTRAINT web_partnershiptrophy_name_key UNIQUE (name, tournament_id);


--
-- Name: web_partnershiptrophy_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_partnershiptrophy
    ADD CONSTRAINT web_partnershiptrophy_pkey PRIMARY KEY (id);


--
-- Name: web_player_first_name_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_player
    ADD CONSTRAINT web_player_first_name_key UNIQUE (first_name, last_name);


--
-- Name: web_player_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_player
    ADD CONSTRAINT web_player_pkey PRIMARY KEY (id);


--
-- Name: web_practiceround_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_practiceround
    ADD CONSTRAINT web_practiceround_pkey PRIMARY KEY (id);


--
-- Name: web_practiceround_rounddate_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_practiceround
    ADD CONSTRAINT web_practiceround_rounddate_key UNIQUE (rounddate, member_id);


--
-- Name: web_pscore_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_pscore
    ADD CONSTRAINT web_pscore_pkey PRIMARY KEY (id);


--
-- Name: web_pscore_practiceround_id_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_pscore
    ADD CONSTRAINT web_pscore_practiceround_id_key UNIQUE (practiceround_id, hole_id);


--
-- Name: web_round_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_round
    ADD CONSTRAINT web_round_pkey PRIMARY KEY (id);


--
-- Name: web_round_tournament_id_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_round
    ADD CONSTRAINT web_round_tournament_id_key UNIQUE (tournament_id, num);


--
-- Name: web_score_matchentry_id_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_score
    ADD CONSTRAINT web_score_matchentry_id_key UNIQUE (matchentry_id, hole_id);


--
-- Name: web_score_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_score
    ADD CONSTRAINT web_score_pkey PRIMARY KEY (id);


--
-- Name: web_scoringrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_scoringrecord
    ADD CONSTRAINT web_scoringrecord_pkey PRIMARY KEY (id);


--
-- Name: web_team_members_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_team_members
    ADD CONSTRAINT web_team_members_pkey PRIMARY KEY (id);


--
-- Name: web_team_members_team_id_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_team_members
    ADD CONSTRAINT web_team_members_team_id_key UNIQUE (team_id, matchentry_id);


--
-- Name: web_team_name_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_team
    ADD CONSTRAINT web_team_name_key UNIQUE (name);


--
-- Name: web_team_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_team
    ADD CONSTRAINT web_team_pkey PRIMARY KEY (id);


--
-- Name: web_teamtrophy_name_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_teamtrophy
    ADD CONSTRAINT web_teamtrophy_name_key UNIQUE (name);


--
-- Name: web_teamtrophy_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_teamtrophy
    ADD CONSTRAINT web_teamtrophy_pkey PRIMARY KEY (id);


--
-- Name: web_tee_course_id_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_tee
    ADD CONSTRAINT web_tee_course_id_key UNIQUE (course_id, colour);


--
-- Name: web_tee_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_tee
    ADD CONSTRAINT web_tee_pkey PRIMARY KEY (id);


--
-- Name: web_teeoff_draw_id_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_teeoff
    ADD CONSTRAINT web_teeoff_draw_id_key UNIQUE (draw_id, hole, starttime);


--
-- Name: web_teeoff_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_teeoff
    ADD CONSTRAINT web_teeoff_pkey PRIMARY KEY (id);


--
-- Name: web_tempreg_email_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_tempreg
    ADD CONSTRAINT web_tempreg_email_key UNIQUE (email);


--
-- Name: web_tempreg_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_tempreg
    ADD CONSTRAINT web_tempreg_pkey PRIMARY KEY (id);


--
-- Name: web_tempreg_username_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_tempreg
    ADD CONSTRAINT web_tempreg_username_key UNIQUE (username);


--
-- Name: web_tournament_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_tournament
    ADD CONSTRAINT web_tournament_pkey PRIMARY KEY (id);


--
-- Name: web_tournament_startdate_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_tournament
    ADD CONSTRAINT web_tournament_startdate_key UNIQUE (startdate);


--
-- Name: web_trophy_name_key; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_trophy
    ADD CONSTRAINT web_trophy_name_key UNIQUE (name, tournament_id);


--
-- Name: web_trophy_pkey; Type: CONSTRAINT; Schema: public; Owner: lawgon; Tablespace: 
--

ALTER TABLE ONLY web_trophy
    ADD CONSTRAINT web_trophy_pkey PRIMARY KEY (id);


--
-- Name: auth_message_user_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX auth_message_user_id ON auth_message USING btree (user_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_comment_flags_comment_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX django_comment_flags_comment_id ON django_comment_flags USING btree (comment_id);


--
-- Name: django_comment_flags_flag; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX django_comment_flags_flag ON django_comment_flags USING btree (flag);


--
-- Name: django_comment_flags_flag_like; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX django_comment_flags_flag_like ON django_comment_flags USING btree (flag varchar_pattern_ops);


--
-- Name: django_comment_flags_user_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX django_comment_flags_user_id ON django_comment_flags USING btree (user_id);


--
-- Name: django_comments_content_type_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX django_comments_content_type_id ON django_comments USING btree (content_type_id);


--
-- Name: django_comments_site_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX django_comments_site_id ON django_comments USING btree (site_id);


--
-- Name: django_comments_user_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX django_comments_user_id ON django_comments USING btree (user_id);


--
-- Name: web_draw_tournament_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_draw_tournament_id ON web_draw USING btree (tournament_id);


--
-- Name: web_handicap_player_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_handicap_player_id ON web_handicap USING btree (player_id);


--
-- Name: web_hole_tee_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_hole_tee_id ON web_hole USING btree (tee_id);


--
-- Name: web_matchentry_player_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_matchentry_player_id ON web_matchentry USING btree (player_id);


--
-- Name: web_matchentry_tee_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_matchentry_tee_id ON web_matchentry USING btree (tee_id);


--
-- Name: web_matchentry_tournament_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_matchentry_tournament_id ON web_matchentry USING btree (tournament_id);


--
-- Name: web_partner_member1_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_partner_member1_id ON web_partner USING btree (member1_id);


--
-- Name: web_partner_member2_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_partner_member2_id ON web_partner USING btree (member2_id);


--
-- Name: web_partner_tournament_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_partner_tournament_id ON web_partner USING btree (tournament_id);


--
-- Name: web_partnershiptrophy_tournament_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_partnershiptrophy_tournament_id ON web_partnershiptrophy USING btree (tournament_id);


--
-- Name: web_player_homeclub_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_player_homeclub_id ON web_player USING btree (homeclub_id);


--
-- Name: web_player_tee_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_player_tee_id ON web_player USING btree (tee_id);


--
-- Name: web_practiceround_member_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_practiceround_member_id ON web_practiceround USING btree (member_id);


--
-- Name: web_practiceround_tee_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_practiceround_tee_id ON web_practiceround USING btree (tee_id);


--
-- Name: web_pscore_hole_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_pscore_hole_id ON web_pscore USING btree (hole_id);


--
-- Name: web_pscore_practiceround_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_pscore_practiceround_id ON web_pscore USING btree (practiceround_id);


--
-- Name: web_round_tournament_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_round_tournament_id ON web_round USING btree (tournament_id);


--
-- Name: web_score_hole_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_score_hole_id ON web_score USING btree (hole_id);


--
-- Name: web_score_matchentry_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_score_matchentry_id ON web_score USING btree (matchentry_id);


--
-- Name: web_scoringrecord_member_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_scoringrecord_member_id ON web_scoringrecord USING btree (member_id);


--
-- Name: web_scoringrecord_tee_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_scoringrecord_tee_id ON web_scoringrecord USING btree (tee_id);


--
-- Name: web_team_members_matchentry_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_team_members_matchentry_id ON web_team_members USING btree (matchentry_id);


--
-- Name: web_team_members_team_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_team_members_team_id ON web_team_members USING btree (team_id);


--
-- Name: web_team_teamtrophy_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_team_teamtrophy_id ON web_team USING btree (teamtrophy_id);


--
-- Name: web_teamtrophy_tournament_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_teamtrophy_tournament_id ON web_teamtrophy USING btree (tournament_id);


--
-- Name: web_tee_course_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_tee_course_id ON web_tee USING btree (course_id);


--
-- Name: web_tournament_course_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_tournament_course_id ON web_tournament USING btree (course_id);


--
-- Name: web_trophy_tournament_id; Type: INDEX; Schema: public; Owner: lawgon; Tablespace: 
--

CREATE INDEX web_trophy_tournament_id ON web_trophy USING btree (tournament_id);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_message_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_288599e6; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT content_type_id_refs_id_288599e6 FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_728de91f; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_728de91f FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d5868a5; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT content_type_id_refs_id_d5868a5 FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comment_flags_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES django_comments(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_3cea63fe; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_3cea63fe FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_id_refs_id_7248df08; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT site_id_refs_id_7248df08 FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: team_id_refs_id_f8f87ef; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_team_members
    ADD CONSTRAINT team_id_refs_id_f8f87ef FOREIGN KEY (team_id) REFERENCES web_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_603c4dcb; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT user_id_refs_id_603c4dcb FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_7ceef80f; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_7ceef80f FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_7e9ddfef; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT user_id_refs_id_7e9ddfef FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_dfbab7d; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_dfbab7d FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_currenthandicap_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_currenthandicap
    ADD CONSTRAINT web_currenthandicap_member_id_fkey FOREIGN KEY (member_id) REFERENCES web_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_draw_tournament_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_draw
    ADD CONSTRAINT web_draw_tournament_id_fkey FOREIGN KEY (tournament_id) REFERENCES web_tournament(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_handicap_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_handicap
    ADD CONSTRAINT web_handicap_player_id_fkey FOREIGN KEY (player_id) REFERENCES web_player(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_hole_tee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_hole
    ADD CONSTRAINT web_hole_tee_id_fkey FOREIGN KEY (tee_id) REFERENCES web_tee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_matchentry_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_matchentry
    ADD CONSTRAINT web_matchentry_player_id_fkey FOREIGN KEY (player_id) REFERENCES web_player(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_matchentry_tee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_matchentry
    ADD CONSTRAINT web_matchentry_tee_id_fkey FOREIGN KEY (tee_id) REFERENCES web_tee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_matchentry_tournament_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_matchentry
    ADD CONSTRAINT web_matchentry_tournament_id_fkey FOREIGN KEY (tournament_id) REFERENCES web_tournament(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_member_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_member
    ADD CONSTRAINT web_member_player_id_fkey FOREIGN KEY (player_id) REFERENCES web_player(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_partner_member1_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_partner
    ADD CONSTRAINT web_partner_member1_id_fkey FOREIGN KEY (member1_id) REFERENCES web_matchentry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_partner_member2_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_partner
    ADD CONSTRAINT web_partner_member2_id_fkey FOREIGN KEY (member2_id) REFERENCES web_matchentry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_partner_tournament_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_partner
    ADD CONSTRAINT web_partner_tournament_id_fkey FOREIGN KEY (tournament_id) REFERENCES web_tournament(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_partnershiptrophy_tournament_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_partnershiptrophy
    ADD CONSTRAINT web_partnershiptrophy_tournament_id_fkey FOREIGN KEY (tournament_id) REFERENCES web_tournament(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_player_homeclub_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_player
    ADD CONSTRAINT web_player_homeclub_id_fkey FOREIGN KEY (homeclub_id) REFERENCES web_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_player_tee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_player
    ADD CONSTRAINT web_player_tee_id_fkey FOREIGN KEY (tee_id) REFERENCES web_tee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_practiceround_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_practiceround
    ADD CONSTRAINT web_practiceround_member_id_fkey FOREIGN KEY (member_id) REFERENCES web_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_practiceround_tee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_practiceround
    ADD CONSTRAINT web_practiceround_tee_id_fkey FOREIGN KEY (tee_id) REFERENCES web_tee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_pscore_hole_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_pscore
    ADD CONSTRAINT web_pscore_hole_id_fkey FOREIGN KEY (hole_id) REFERENCES web_hole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_pscore_practiceround_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_pscore
    ADD CONSTRAINT web_pscore_practiceround_id_fkey FOREIGN KEY (practiceround_id) REFERENCES web_practiceround(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_round_tournament_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_round
    ADD CONSTRAINT web_round_tournament_id_fkey FOREIGN KEY (tournament_id) REFERENCES web_tournament(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_score_hole_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_score
    ADD CONSTRAINT web_score_hole_id_fkey FOREIGN KEY (hole_id) REFERENCES web_hole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_score_matchentry_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_score
    ADD CONSTRAINT web_score_matchentry_id_fkey FOREIGN KEY (matchentry_id) REFERENCES web_matchentry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_scoringrecord_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_scoringrecord
    ADD CONSTRAINT web_scoringrecord_member_id_fkey FOREIGN KEY (member_id) REFERENCES web_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_scoringrecord_tee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_scoringrecord
    ADD CONSTRAINT web_scoringrecord_tee_id_fkey FOREIGN KEY (tee_id) REFERENCES web_tee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_team_members_matchentry_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_team_members
    ADD CONSTRAINT web_team_members_matchentry_id_fkey FOREIGN KEY (matchentry_id) REFERENCES web_matchentry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_team_teamtrophy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_team
    ADD CONSTRAINT web_team_teamtrophy_id_fkey FOREIGN KEY (teamtrophy_id) REFERENCES web_teamtrophy(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_teamtrophy_tournament_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_teamtrophy
    ADD CONSTRAINT web_teamtrophy_tournament_id_fkey FOREIGN KEY (tournament_id) REFERENCES web_tournament(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_tee_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_tee
    ADD CONSTRAINT web_tee_course_id_fkey FOREIGN KEY (course_id) REFERENCES web_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_teeoff_draw_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_teeoff
    ADD CONSTRAINT web_teeoff_draw_id_fkey FOREIGN KEY (draw_id) REFERENCES web_draw(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_tournament_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_tournament
    ADD CONSTRAINT web_tournament_course_id_fkey FOREIGN KEY (course_id) REFERENCES web_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_trophy_tournament_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lawgon
--

ALTER TABLE ONLY web_trophy
    ADD CONSTRAINT web_trophy_tournament_id_fkey FOREIGN KEY (tournament_id) REFERENCES web_tournament(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

