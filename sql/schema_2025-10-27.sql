--
-- PostgreSQL database dump
--

\restrict Orb96faLW7XjwYfLZGRzUgF4WMNEhiQhc6SFcQ6B1zCJZ1F4zDXghqiTNEgszbS

-- Dumped from database version 17.6 (Postgres.app)
-- Dumped by pg_dump version 17.6 (Postgres.app)

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
-- Name: core; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA core;


ALTER SCHEMA core OWNER TO postgres;

--
-- Name: etl; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA etl;


ALTER SCHEMA etl OWNER TO postgres;

--
-- Name: staging; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA staging;


ALTER SCHEMA staging OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _smoke; Type: TABLE; Schema: staging; Owner: postgres
--

CREATE TABLE staging._smoke (
    id integer
);


ALTER TABLE staging._smoke OWNER TO postgres;

--
-- Name: SCHEMA core; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA core TO mobility_app;


--
-- Name: SCHEMA etl; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA etl TO mobility_app;


--
-- Name: SCHEMA staging; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA staging TO mobility_app;


--
-- Name: TABLE _smoke; Type: ACL; Schema: staging; Owner: postgres
--

GRANT INSERT ON TABLE staging._smoke TO mobility_app;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: core; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA core GRANT SELECT ON TABLES TO mobility_app;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: etl; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA etl GRANT ALL ON FUNCTIONS TO mobility_app;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: staging; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA staging GRANT INSERT ON TABLES TO mobility_app;


--
-- PostgreSQL database dump complete
--

\unrestrict Orb96faLW7XjwYfLZGRzUgF4WMNEhiQhc6SFcQ6B1zCJZ1F4zDXghqiTNEgszbS

