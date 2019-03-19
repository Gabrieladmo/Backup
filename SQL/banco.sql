--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.0

-- Started on 2018-11-15 20:58:45

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "DBVemMonstro";
--
-- TOC entry 2815 (class 1262 OID 32923)
-- Name: DBVemMonstro; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "DBVemMonstro" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';


ALTER DATABASE "DBVemMonstro" OWNER TO postgres;

\connect "DBVemMonstro"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2818 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 32926)
-- Name: alimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE alimento (
    codigo integer NOT NULL,
    nome character varying(50) NOT NULL,
    carboidrato numeric(8,2) NOT NULL,
    gordura numeric(8,2) NOT NULL,
    proteina numeric(8,2) NOT NULL
);


ALTER TABLE alimento OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 32924)
-- Name: alimento_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE alimento_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alimento_codigo_seq OWNER TO postgres;

--
-- TOC entry 2819 (class 0 OID 0)
-- Dependencies: 196
-- Name: alimento_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE alimento_codigo_seq OWNED BY alimento.codigo;


--
-- TOC entry 200 (class 1259 OID 32940)
-- Name: alimento_refeicao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE alimento_refeicao (
    codigo_alimento integer NOT NULL,
    codigo_refeicao integer NOT NULL,
    quantidade numeric(8,2) NOT NULL
);


ALTER TABLE alimento_refeicao OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 32934)
-- Name: refeicao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE refeicao (
    codigo integer NOT NULL,
    descricao character varying(50) NOT NULL
);


ALTER TABLE refeicao OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 32932)
-- Name: refeicao_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE refeicao_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE refeicao_codigo_seq OWNER TO postgres;

--
-- TOC entry 2820 (class 0 OID 0)
-- Dependencies: 198
-- Name: refeicao_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE refeicao_codigo_seq OWNED BY refeicao.codigo;


--
-- TOC entry 2680 (class 2604 OID 32929)
-- Name: alimento codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alimento ALTER COLUMN codigo SET DEFAULT nextval('alimento_codigo_seq'::regclass);


--
-- TOC entry 2681 (class 2604 OID 32937)
-- Name: refeicao codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY refeicao ALTER COLUMN codigo SET DEFAULT nextval('refeicao_codigo_seq'::regclass);


--
-- TOC entry 2683 (class 2606 OID 32931)
-- Name: alimento alimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alimento
    ADD CONSTRAINT alimento_pkey PRIMARY KEY (codigo);


--
-- TOC entry 2687 (class 2606 OID 32944)
-- Name: alimento_refeicao alimento_refeicao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alimento_refeicao
    ADD CONSTRAINT alimento_refeicao_pkey PRIMARY KEY (codigo_alimento, codigo_refeicao);


--
-- TOC entry 2685 (class 2606 OID 32939)
-- Name: refeicao refeicao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY refeicao
    ADD CONSTRAINT refeicao_pkey PRIMARY KEY (codigo);


--
-- TOC entry 2688 (class 2606 OID 32945)
-- Name: alimento_refeicao fk_alimento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alimento_refeicao
    ADD CONSTRAINT fk_alimento FOREIGN KEY (codigo_alimento) REFERENCES alimento(codigo);


--
-- TOC entry 2689 (class 2606 OID 32950)
-- Name: alimento_refeicao fk_refeicao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alimento_refeicao
    ADD CONSTRAINT fk_refeicao FOREIGN KEY (codigo_refeicao) REFERENCES refeicao(codigo);


--
-- TOC entry 2817 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-11-15 20:58:46

--
-- PostgreSQL database dump complete
--

