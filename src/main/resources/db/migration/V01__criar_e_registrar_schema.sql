--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

-- Started on 2018-03-26 01:06:50

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2399 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 32789)
-- Name: agenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE agenda (
    id integer NOT NULL,
    data date NOT NULL,
    objetivo integer NOT NULL,
    rota integer NOT NULL,
    doacao integer NOT NULL
);


ALTER TABLE agenda OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 32792)
-- Name: agenda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE agenda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE agenda_id_seq OWNER TO postgres;

--
-- TOC entry 2400 (class 0 OID 0)
-- Dependencies: 186
-- Name: agenda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE agenda_id_seq OWNED BY agenda.id;


--
-- TOC entry 187 (class 1259 OID 32794)
-- Name: bairro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bairro (
    id integer NOT NULL,
    nome character varying,
    cidade integer
);


ALTER TABLE bairro OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 32800)
-- Name: bairro_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bairro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bairro_id_seq OWNER TO postgres;

--
-- TOC entry 2401 (class 0 OID 0)
-- Dependencies: 188
-- Name: bairro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bairro_id_seq OWNED BY bairro.id;


--
-- TOC entry 222 (class 1259 OID 40984)
-- Name: banco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE banco (
    id integer NOT NULL,
    nome character varying NOT NULL,
    logradouro character varying,
    numero character varying,
    complemento character varying,
    bairro integer,
    telefone character varying,
    email character varying
);


ALTER TABLE banco OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 40982)
-- Name: banco_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE banco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE banco_id_seq OWNER TO postgres;

--
-- TOC entry 2402 (class 0 OID 0)
-- Dependencies: 221
-- Name: banco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE banco_id_seq OWNED BY banco.id;


--
-- TOC entry 189 (class 1259 OID 32802)
-- Name: cidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cidade (
    id integer NOT NULL,
    nome character varying NOT NULL,
    estado integer
);


ALTER TABLE cidade OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 32808)
-- Name: cidade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cidade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cidade_id_seq OWNER TO postgres;

--
-- TOC entry 2403 (class 0 OID 0)
-- Dependencies: 190
-- Name: cidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cidade_id_seq OWNED BY cidade.id;


--
-- TOC entry 191 (class 1259 OID 32810)
-- Name: dia_semana; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dia_semana (
    id integer NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE dia_semana OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 32816)
-- Name: dia_semana_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dia_semana_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dia_semana_id_seq OWNER TO postgres;

--
-- TOC entry 2404 (class 0 OID 0)
-- Dependencies: 192
-- Name: dia_semana_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dia_semana_id_seq OWNED BY dia_semana.id;


--
-- TOC entry 193 (class 1259 OID 32818)
-- Name: doacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE doacao (
    id integer NOT NULL,
    doadora_parto integer,
    banco integer NOT NULL
);


ALTER TABLE doacao OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 32821)
-- Name: doacao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE doacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE doacao_id_seq OWNER TO postgres;

--
-- TOC entry 2405 (class 0 OID 0)
-- Dependencies: 194
-- Name: doacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE doacao_id_seq OWNED BY doacao.id;


--
-- TOC entry 195 (class 1259 OID 32823)
-- Name: doadora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE doadora (
    id integer NOT NULL,
    pessoa integer NOT NULL,
    ativo boolean
);


ALTER TABLE doadora OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 32826)
-- Name: doadora_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE doadora_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE doadora_id_seq OWNER TO postgres;

--
-- TOC entry 2406 (class 0 OID 0)
-- Dependencies: 196
-- Name: doadora_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE doadora_id_seq OWNED BY doadora.id;


--
-- TOC entry 227 (class 1259 OID 49207)
-- Name: doadora_parto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE doadora_parto (
    id integer NOT NULL,
    doadora integer NOT NULL,
    data_parto date,
    nome_bebe character varying
);


ALTER TABLE doadora_parto OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 49205)
-- Name: doadora_parto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE doadora_parto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE doadora_parto_id_seq OWNER TO postgres;

--
-- TOC entry 2407 (class 0 OID 0)
-- Dependencies: 226
-- Name: doadora_parto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE doadora_parto_id_seq OWNED BY doadora_parto.id;


--
-- TOC entry 220 (class 1259 OID 33097)
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE estado (
    id integer NOT NULL,
    sigla character varying(2) NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE estado OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 33095)
-- Name: estado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE estado_id_seq OWNER TO postgres;

--
-- TOC entry 2408 (class 0 OID 0)
-- Dependencies: 219
-- Name: estado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estado_id_seq OWNED BY estado.id;


--
-- TOC entry 197 (class 1259 OID 32838)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funcionario (
    id integer NOT NULL,
    pessoa integer NOT NULL,
    ativo boolean NOT NULL
);


ALTER TABLE funcionario OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 32841)
-- Name: funcionario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE funcionario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE funcionario_id_seq OWNER TO postgres;

--
-- TOC entry 2409 (class 0 OID 0)
-- Dependencies: 198
-- Name: funcionario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE funcionario_id_seq OWNED BY funcionario.id;


--
-- TOC entry 199 (class 1259 OID 32843)
-- Name: horario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE horario (
    id integer NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE horario OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 32849)
-- Name: horario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE horario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE horario_id_seq OWNER TO postgres;

--
-- TOC entry 2410 (class 0 OID 0)
-- Dependencies: 200
-- Name: horario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE horario_id_seq OWNED BY horario.id;


--
-- TOC entry 201 (class 1259 OID 32851)
-- Name: motivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE motivo (
    id integer NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE motivo OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 32857)
-- Name: motivo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE motivo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE motivo_id_seq OWNER TO postgres;

--
-- TOC entry 2411 (class 0 OID 0)
-- Dependencies: 202
-- Name: motivo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE motivo_id_seq OWNED BY motivo.id;


--
-- TOC entry 203 (class 1259 OID 32859)
-- Name: motivo_status_agenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE motivo_status_agenda (
    id integer NOT NULL,
    status_agenda integer NOT NULL,
    motivo integer
);


ALTER TABLE motivo_status_agenda OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 32862)
-- Name: motivo_status_agenda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE motivo_status_agenda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE motivo_status_agenda_id_seq OWNER TO postgres;

--
-- TOC entry 2412 (class 0 OID 0)
-- Dependencies: 204
-- Name: motivo_status_agenda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE motivo_status_agenda_id_seq OWNED BY motivo_status_agenda.id;


--
-- TOC entry 205 (class 1259 OID 32864)
-- Name: objetivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE objetivo (
    id integer NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE objetivo OWNER TO postgres;

--
-- TOC entry 2413 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE objetivo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE objetivo IS '--INFORMAR O OBJETIVO SE É ENVIO DE MATERIAL OU COLETA DE MATERIAL';


--
-- TOC entry 206 (class 1259 OID 32870)
-- Name: objetivo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE objetivo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE objetivo_id_seq OWNER TO postgres;

--
-- TOC entry 2414 (class 0 OID 0)
-- Dependencies: 206
-- Name: objetivo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE objetivo_id_seq OWNED BY objetivo.id;


--
-- TOC entry 223 (class 1259 OID 49173)
-- Name: permissao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE permissao (
    id integer NOT NULL,
    descricao character varying
);


ALTER TABLE permissao OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 32872)
-- Name: pessoa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pessoa (
    id integer NOT NULL,
    nome character varying NOT NULL,
    data_nascimento date NOT NULL,
    logradouro character varying,
    numero character varying,
    bairro integer,
    complemento character varying
);


ALTER TABLE pessoa OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 32878)
-- Name: pessoa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pessoa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pessoa_id_seq OWNER TO postgres;

--
-- TOC entry 2415 (class 0 OID 0)
-- Dependencies: 208
-- Name: pessoa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pessoa_id_seq OWNED BY pessoa.id;


--
-- TOC entry 209 (class 1259 OID 32880)
-- Name: rota; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rota (
    id integer NOT NULL,
    horario integer NOT NULL,
    dia_semana integer NOT NULL
);


ALTER TABLE rota OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 32883)
-- Name: rota_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rota_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rota_id_seq OWNER TO postgres;

--
-- TOC entry 2416 (class 0 OID 0)
-- Dependencies: 210
-- Name: rota_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rota_id_seq OWNED BY rota.id;


--
-- TOC entry 211 (class 1259 OID 32885)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE status (
    id integer NOT NULL,
    nome character varying
);


ALTER TABLE status OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 32891)
-- Name: status_agenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE status_agenda (
    id integer NOT NULL,
    data date NOT NULL,
    agenda integer NOT NULL,
    status integer NOT NULL,
    observacao character varying,
    usuario integer NOT NULL
);


ALTER TABLE status_agenda OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 32897)
-- Name: status_agenda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE status_agenda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE status_agenda_id_seq OWNER TO postgres;

--
-- TOC entry 2417 (class 0 OID 0)
-- Dependencies: 213
-- Name: status_agenda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE status_agenda_id_seq OWNED BY status_agenda.id;


--
-- TOC entry 214 (class 1259 OID 32899)
-- Name: status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE status_id_seq OWNER TO postgres;

--
-- TOC entry 2418 (class 0 OID 0)
-- Dependencies: 214
-- Name: status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE status_id_seq OWNED BY status.id;


--
-- TOC entry 215 (class 1259 OID 32901)
-- Name: tipo_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipo_usuario (
    id integer NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE tipo_usuario OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 32907)
-- Name: tipo_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_usuario_id_seq OWNER TO postgres;

--
-- TOC entry 2419 (class 0 OID 0)
-- Dependencies: 216
-- Name: tipo_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_usuario_id_seq OWNED BY tipo_usuario.id;


--
-- TOC entry 225 (class 1259 OID 49183)
-- Name: tipo_usuario_permissao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipo_usuario_permissao (
    id integer NOT NULL,
    tipo_usuario integer NOT NULL,
    permissao integer NOT NULL
);


ALTER TABLE tipo_usuario_permissao OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 49181)
-- Name: tipo_usuario_permissao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_usuario_permissao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_usuario_permissao_id_seq OWNER TO postgres;

--
-- TOC entry 2420 (class 0 OID 0)
-- Dependencies: 224
-- Name: tipo_usuario_permissao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_usuario_permissao_id_seq OWNED BY tipo_usuario_permissao.id;


--
-- TOC entry 217 (class 1259 OID 32909)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    id integer NOT NULL,
    email character varying NOT NULL,
    password character varying,
    tipo_usuario integer NOT NULL,
    pessoa integer,
    ativo boolean NOT NULL
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 32915)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_seq OWNER TO postgres;

--
-- TOC entry 2421 (class 0 OID 0)
-- Dependencies: 218
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_seq OWNED BY usuario.id;


--
-- TOC entry 228 (class 1259 OID 49266)
-- Name: v_agenda; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW v_agenda AS
 SELECT a.id,
    a.doacao,
    pessoa.nome AS doadora,
    obj.nome AS objetivo,
    a.data AS data_agenda,
    (((ds.nome)::text || ' - '::text) || (hr.nome)::text) AS rota,
    sts.nome AS status,
    sa.data AS data_status,
    usu.email AS usuario_status
   FROM (((((((((((agenda a
     JOIN status_agenda sa ON ((sa.id = ( SELECT sa2.id
           FROM status_agenda sa2
          WHERE (sa2.agenda = a.id)
          ORDER BY sa2.data DESC
         LIMIT 1))))
     JOIN status sts ON ((sts.id = sa.status)))
     JOIN objetivo obj ON ((obj.id = a.objetivo)))
     JOIN rota rota ON ((rota.id = a.rota)))
     JOIN dia_semana ds ON ((ds.id = rota.dia_semana)))
     JOIN horario hr ON ((hr.id = rota.horario)))
     JOIN doacao d ON ((d.id = a.doacao)))
     JOIN doadora_parto dp ON ((dp.id = d.doadora_parto)))
     JOIN doadora doadora ON ((doadora.id = dp.doadora)))
     JOIN pessoa pessoa ON ((pessoa.id = doadora.pessoa)))
     JOIN usuario usu ON ((usu.id = sa.usuario)));


ALTER TABLE v_agenda OWNER TO postgres;

--
-- TOC entry 2144 (class 2604 OID 32917)
-- Name: agenda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agenda ALTER COLUMN id SET DEFAULT nextval('agenda_id_seq'::regclass);


--
-- TOC entry 2145 (class 2604 OID 32918)
-- Name: bairro id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bairro ALTER COLUMN id SET DEFAULT nextval('bairro_id_seq'::regclass);


--
-- TOC entry 2162 (class 2604 OID 40987)
-- Name: banco id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY banco ALTER COLUMN id SET DEFAULT nextval('banco_id_seq'::regclass);


--
-- TOC entry 2146 (class 2604 OID 32919)
-- Name: cidade id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidade ALTER COLUMN id SET DEFAULT nextval('cidade_id_seq'::regclass);


--
-- TOC entry 2147 (class 2604 OID 32920)
-- Name: dia_semana id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dia_semana ALTER COLUMN id SET DEFAULT nextval('dia_semana_id_seq'::regclass);


--
-- TOC entry 2148 (class 2604 OID 32921)
-- Name: doacao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY doacao ALTER COLUMN id SET DEFAULT nextval('doacao_id_seq'::regclass);


--
-- TOC entry 2149 (class 2604 OID 32922)
-- Name: doadora id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY doadora ALTER COLUMN id SET DEFAULT nextval('doadora_id_seq'::regclass);


--
-- TOC entry 2164 (class 2604 OID 49210)
-- Name: doadora_parto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY doadora_parto ALTER COLUMN id SET DEFAULT nextval('doadora_parto_id_seq'::regclass);


--
-- TOC entry 2161 (class 2604 OID 33100)
-- Name: estado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado ALTER COLUMN id SET DEFAULT nextval('estado_id_seq'::regclass);


--
-- TOC entry 2150 (class 2604 OID 32925)
-- Name: funcionario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario ALTER COLUMN id SET DEFAULT nextval('funcionario_id_seq'::regclass);


--
-- TOC entry 2151 (class 2604 OID 32926)
-- Name: horario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY horario ALTER COLUMN id SET DEFAULT nextval('horario_id_seq'::regclass);


--
-- TOC entry 2152 (class 2604 OID 32927)
-- Name: motivo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY motivo ALTER COLUMN id SET DEFAULT nextval('motivo_id_seq'::regclass);


--
-- TOC entry 2153 (class 2604 OID 32928)
-- Name: motivo_status_agenda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY motivo_status_agenda ALTER COLUMN id SET DEFAULT nextval('motivo_status_agenda_id_seq'::regclass);


--
-- TOC entry 2154 (class 2604 OID 32929)
-- Name: objetivo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY objetivo ALTER COLUMN id SET DEFAULT nextval('objetivo_id_seq'::regclass);


--
-- TOC entry 2155 (class 2604 OID 32930)
-- Name: pessoa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pessoa ALTER COLUMN id SET DEFAULT nextval('pessoa_id_seq'::regclass);


--
-- TOC entry 2156 (class 2604 OID 32931)
-- Name: rota id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rota ALTER COLUMN id SET DEFAULT nextval('rota_id_seq'::regclass);


--
-- TOC entry 2157 (class 2604 OID 32932)
-- Name: status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY status ALTER COLUMN id SET DEFAULT nextval('status_id_seq'::regclass);


--
-- TOC entry 2158 (class 2604 OID 32933)
-- Name: status_agenda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY status_agenda ALTER COLUMN id SET DEFAULT nextval('status_agenda_id_seq'::regclass);


--
-- TOC entry 2159 (class 2604 OID 32934)
-- Name: tipo_usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_usuario ALTER COLUMN id SET DEFAULT nextval('tipo_usuario_id_seq'::regclass);


--
-- TOC entry 2163 (class 2604 OID 49186)
-- Name: tipo_usuario_permissao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_usuario_permissao ALTER COLUMN id SET DEFAULT nextval('tipo_usuario_permissao_id_seq'::regclass);


--
-- TOC entry 2160 (class 2604 OID 32935)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq'::regclass);


--
-- TOC entry 2350 (class 0 OID 32789)
-- Dependencies: 185
-- Data for Name: agenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO agenda (id, data, objetivo, rota, doacao) VALUES (4, '2018-03-25', 1, 1, 1);
INSERT INTO agenda (id, data, objetivo, rota, doacao) VALUES (5, '2018-03-25', 1, 2, 2);


--
-- TOC entry 2422 (class 0 OID 0)
-- Dependencies: 186
-- Name: agenda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('agenda_id_seq', 5, true);


--
-- TOC entry 2352 (class 0 OID 32794)
-- Dependencies: 187
-- Data for Name: bairro; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO bairro (id, nome, cidade) VALUES (2, 'VILA VELHA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (3, 'JARDIM GUANABARA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (4, 'JARDIM IRACEMA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (5, 'BARRA DO CEARÁ', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (6, 'FLORESTA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (7, 'ÁLVARO WEYNE', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (8, 'CRISTO REDENTOR', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (9, 'ELLERY', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (10, 'SÃO GERARDO', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (11, 'MONTE CASTELO', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (12, 'CARLITO PAMPLONA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (13, 'PIRAMBU', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (14, 'FARIAS BRITO', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (15, 'JACARECANGA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (16, 'MOURA BRASIL', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (17, 'ALDEOTA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (18, 'CAIS DO PORTO', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (19, 'CIDADE 2000', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (20, 'COCÓ', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (21, 'DE LOURDES', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (22, 'DIONÍSIO TORRES', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (23, 'ENGENHEIRO LUCIANO CALVALCANTE', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (24, 'GUARARAPES', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (25, 'JOAQUIM TÁVORA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (26, 'MANUEL DIAS BRANCO', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (27, 'MEIRELES', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (28, 'MUCURIPE', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (29, 'PAPICU', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (30, 'PRAIA DE IRACEMA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (31, 'PRAIA DO FUTURO I', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (32, 'PRAIA DO FUTURO II', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (33, 'SALINAS', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (34, 'SÃO JOÃO DO TAUAPE', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (35, 'VARJOTA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (36, 'VICENTE PINZON', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (37, 'AMADEU FURTADO', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (38, 'ANTÔNIO BEZERRA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (39, 'AUTRAN NUNES', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (40, 'BONSUCESSO', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (41, 'BELA VISTA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (42, 'DOM LUSTOSA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (43, 'HENRIQUE JORGE', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (44, 'JOÃO XXIII', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (45, 'JÓQUEI CLUBE', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (46, 'OLAVO OLIVEIRA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (47, 'PADRE ANDRADE', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (48, 'PARQUE ARAXÁ', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (49, 'PICI', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (50, 'PARQUELÂNDIA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (51, 'PRESIDENTE KENNEDY', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (52, 'RODOLFO TEÓFILO', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (53, 'QUINTINO CUNHA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (54, 'SÃO JOSÉ BONIFÁCIO', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (55, 'BENFICA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (56, 'FÁTIMA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (57, 'JARDIM AMÉRICA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (58, 'DAMAS', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (59, 'PARREÃO', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (60, 'BOM FUTURO', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (61, 'VILA UNIÃO', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (62, 'MONTESE', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (63, 'COUTO FERNANDES', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (64, 'PAN AMERICANO', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (65, 'DEMÓCRITO ROCHA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (66, 'ITAOCA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (67, 'PARANGABA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (68, 'SERRINHA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (69, 'AEROPORTO', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (70, 'ITAPERI', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (71, 'DENDÊ', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (72, 'VILA PERY', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (73, 'CONJUNTO CEARÁ', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (74, 'SIQUEIRA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (75, 'MONDUBIM', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (76, 'CONJUNTO JOSÉ WALTER', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (77, 'GRANJA LISBOA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (78, 'GRANJA PORTUGAL', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (79, 'BOM JARDIM', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (80, 'GENIBAÚ', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (81, 'CANINDEZINHO', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (82, 'VILA MANOEL SÁTIRO', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (83, 'PARQUE SÃO JOSÉ', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (84, 'PARQUE SANTA ROSA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (85, 'MARAPONGA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (86, 'JARDIM CEARENSE', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (87, 'CONJUNTO ESPERANÇA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (88, 'PRESIDENTE VARGAS', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (89, 'PLANALTO AYRTON SENNA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (90, 'NOVO MONDUBIM', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (91, 'SABIAGUABA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (92, 'EDSON QUEIROZ', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (93, 'SAPIRANGA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (94, 'ALAGADIÇO NOVO', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (95, 'CURIÓ', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (96, 'GUAJERÚ', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (97, 'COAÇU', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (98, 'PAUPINA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (99, 'PARQUE MANIBURA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (100, 'CAMBEBA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (101, 'MESSEJANA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (102, 'ANCURI', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (103, 'PEDRAS', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (104, 'JARDIM DAS OLIVEIRAS', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (105, 'CIDADE DOS FUNCIONÁRIOS', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (106, 'PARQUE IRACEMA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (107, 'AUTO DA BALANÇA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (108, 'AEROLÂNDIA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (109, 'DIAS MACEDO', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (110, 'CASTELÃO', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (111, 'MATA GALINHA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (112, 'CAJAEIRAS', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (113, 'BARROSO', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (114, 'JANGURUSSU', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (115, 'PASSARÉ', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (116, 'PARQUE DOIS IRMÃOS', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (117, 'LAGOA REDONDA', 756);
INSERT INTO bairro (id, nome, cidade) VALUES (118, 'CENTRO', 756);


--
-- TOC entry 2423 (class 0 OID 0)
-- Dependencies: 188
-- Name: bairro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bairro_id_seq', 118, true);


--
-- TOC entry 2387 (class 0 OID 40984)
-- Dependencies: 222
-- Data for Name: banco; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO banco (id, nome, logradouro, numero, complemento, bairro, telefone, email) VALUES (1, 'MATERNIDADE ESCOLA ASSIS CHATEUBRIAND', 'RUA CORONEL NUNES DE MELO', 'S/N', NULL, 52, '(85) 3366-8536', 'blhmeac@meac.ufc.br');
INSERT INTO banco (id, nome, logradouro, numero, complemento, bairro, telefone, email) VALUES (2, 'HOSPITAL GERAL DE FORTALEZA', 'RUA AVILA GOULART', '900', NULL, 29, '(85) 3101-3335', 'blh@hgf.ce.gov.br');
INSERT INTO banco (id, nome, logradouro, numero, complemento, bairro, telefone, email) VALUES (3, 'HOSPITAL GERAL DR CESAR CALS', 'AVENIDA IMPERADOR', '545', NULL, 118, '0800-2804169 / (85) 3101-4189', 'bancodeleite@hgcc.ce.gov.br');
INSERT INTO banco (id, nome, logradouro, numero, complemento, bairro, telefone, email) VALUES (4, 'HOSPITAL INFANTIL ALBERT SABIN', 'RUA TERTULIANO SALES', '544', NULL, 61, '0800-2804169 / (85) 3101-4189', 'blh@hias.ce.gov.br');


--
-- TOC entry 2424 (class 0 OID 0)
-- Dependencies: 221
-- Name: banco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('banco_id_seq', 4, true);


--
-- TOC entry 2354 (class 0 OID 32802)
-- Dependencies: 189
-- Data for Name: cidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cidade (id, nome, estado) VALUES (2, 'ÁGUA DOCE DO NORTE', 8);
INSERT INTO cidade (id, nome, estado) VALUES (3, 'ÁGUIA BRANCA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (4, 'ALEGRE', 8);
INSERT INTO cidade (id, nome, estado) VALUES (5, 'ALFREDO CHAVES', 8);
INSERT INTO cidade (id, nome, estado) VALUES (6, 'ALTO RIO NOVO', 8);
INSERT INTO cidade (id, nome, estado) VALUES (7, 'ANCHIETA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (8, 'APIACÁ', 8);
INSERT INTO cidade (id, nome, estado) VALUES (9, 'ARACRUZ', 8);
INSERT INTO cidade (id, nome, estado) VALUES (10, 'ATILIO VIVACQUA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (11, 'BAIXO GUANDU', 8);
INSERT INTO cidade (id, nome, estado) VALUES (12, 'BARRA DE SÃO FRANCISCO', 8);
INSERT INTO cidade (id, nome, estado) VALUES (13, 'BOA ESPERANÇA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (14, 'BOM JESUS DO NORTE', 8);
INSERT INTO cidade (id, nome, estado) VALUES (15, 'BREJETUBA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (16, 'CACHOEIRO DE ITAPEMIRIM', 8);
INSERT INTO cidade (id, nome, estado) VALUES (17, 'CARIACICA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (18, 'CASTELO', 8);
INSERT INTO cidade (id, nome, estado) VALUES (19, 'COLATINA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (20, 'CONCEIÇÃO DA BARRA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (21, 'CONCEIÇÃO DO CASTELO', 8);
INSERT INTO cidade (id, nome, estado) VALUES (22, 'DIVINO DE SÃO LOURENÇO', 8);
INSERT INTO cidade (id, nome, estado) VALUES (23, 'DOMINGOS MARTINS', 8);
INSERT INTO cidade (id, nome, estado) VALUES (24, 'DORES DO RIO PRETO', 8);
INSERT INTO cidade (id, nome, estado) VALUES (25, 'ECOPORANGA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (26, 'FUNDÃO', 8);
INSERT INTO cidade (id, nome, estado) VALUES (27, 'GOVERNADOR LINDENBERG', 8);
INSERT INTO cidade (id, nome, estado) VALUES (28, 'GUAÇUÍ', 8);
INSERT INTO cidade (id, nome, estado) VALUES (29, 'GUARAPARI', 8);
INSERT INTO cidade (id, nome, estado) VALUES (30, 'IBATIBA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (31, 'IBIRAÇU', 8);
INSERT INTO cidade (id, nome, estado) VALUES (32, 'IBITIRAMA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (33, 'ICONHA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (34, 'IRUPI', 8);
INSERT INTO cidade (id, nome, estado) VALUES (35, 'ITAGUAÇU', 8);
INSERT INTO cidade (id, nome, estado) VALUES (36, 'ITAPEMIRIM', 8);
INSERT INTO cidade (id, nome, estado) VALUES (37, 'ITARANA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (38, 'IÚNA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (39, 'JAGUARÉ', 8);
INSERT INTO cidade (id, nome, estado) VALUES (40, 'JERÔNIMO MONTEIRO', 8);
INSERT INTO cidade (id, nome, estado) VALUES (41, 'JOÃO NEIVA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (42, 'LARANJA DA TERRA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (43, 'LINHARES', 8);
INSERT INTO cidade (id, nome, estado) VALUES (44, 'MANTENÓPOLIS', 8);
INSERT INTO cidade (id, nome, estado) VALUES (45, 'MARATAÍZES', 8);
INSERT INTO cidade (id, nome, estado) VALUES (46, 'MARECHAL FLORIANO', 8);
INSERT INTO cidade (id, nome, estado) VALUES (47, 'MARILÂNDIA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (48, 'MIMOSO DO SUL', 8);
INSERT INTO cidade (id, nome, estado) VALUES (49, 'MONTANHA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (50, 'MUCURICI', 8);
INSERT INTO cidade (id, nome, estado) VALUES (51, 'MUNIZ FREIRE', 8);
INSERT INTO cidade (id, nome, estado) VALUES (52, 'MUQUI', 8);
INSERT INTO cidade (id, nome, estado) VALUES (53, 'NOVA VENÉCIA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (54, 'PANCAS', 8);
INSERT INTO cidade (id, nome, estado) VALUES (55, 'PEDRO CANÁRIO', 8);
INSERT INTO cidade (id, nome, estado) VALUES (56, 'PINHEIROS', 8);
INSERT INTO cidade (id, nome, estado) VALUES (57, 'PIÚMA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (58, 'PONTO BELO', 8);
INSERT INTO cidade (id, nome, estado) VALUES (59, 'PRESIDENTE KENNEDY', 8);
INSERT INTO cidade (id, nome, estado) VALUES (60, 'RIO BANANAL', 8);
INSERT INTO cidade (id, nome, estado) VALUES (61, 'RIO NOVO DO SUL', 8);
INSERT INTO cidade (id, nome, estado) VALUES (62, 'SANTA LEOPOLDINA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (63, 'SANTA MARIA DE JETIBÁ', 8);
INSERT INTO cidade (id, nome, estado) VALUES (64, 'SANTA TERESA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (65, 'SÃO DOMINGOS DO NORTE', 8);
INSERT INTO cidade (id, nome, estado) VALUES (66, 'SÃO GABRIEL DA PALHA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (67, 'SÃO JOSÉ DO CALÇADO', 8);
INSERT INTO cidade (id, nome, estado) VALUES (68, 'SÃO MATEUS', 8);
INSERT INTO cidade (id, nome, estado) VALUES (69, 'SÃO ROQUE DO CANAÃ', 8);
INSERT INTO cidade (id, nome, estado) VALUES (70, 'SERRA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (71, 'SOORETAMA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (72, 'VARGEM ALTA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (73, 'VENDA NOVA DO IMIGRANTE', 8);
INSERT INTO cidade (id, nome, estado) VALUES (74, 'VIANA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (75, 'VILA PAVÃO', 8);
INSERT INTO cidade (id, nome, estado) VALUES (76, 'VILA VALÉRIO', 8);
INSERT INTO cidade (id, nome, estado) VALUES (77, 'VILA VELHA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (78, 'VITÓRIA', 8);
INSERT INTO cidade (id, nome, estado) VALUES (79, 'ACRELÂNDIA', 1);
INSERT INTO cidade (id, nome, estado) VALUES (80, 'ASSIS BRASIL', 1);
INSERT INTO cidade (id, nome, estado) VALUES (81, 'BRASILÉIA', 1);
INSERT INTO cidade (id, nome, estado) VALUES (82, 'BUJARI', 1);
INSERT INTO cidade (id, nome, estado) VALUES (83, 'CAPIXABA', 1);
INSERT INTO cidade (id, nome, estado) VALUES (84, 'CRUZEIRO DO SUL', 1);
INSERT INTO cidade (id, nome, estado) VALUES (85, 'EPITACIOLÂNDIA', 1);
INSERT INTO cidade (id, nome, estado) VALUES (86, 'FEIJÓ', 1);
INSERT INTO cidade (id, nome, estado) VALUES (87, 'JORDÃO', 1);
INSERT INTO cidade (id, nome, estado) VALUES (88, 'MÂNCIO LIMA', 1);
INSERT INTO cidade (id, nome, estado) VALUES (89, 'MANOEL URBANO', 1);
INSERT INTO cidade (id, nome, estado) VALUES (90, 'MARECHAL THAUMATURGO', 1);
INSERT INTO cidade (id, nome, estado) VALUES (91, 'PLÁCIDO DE CASTRO', 1);
INSERT INTO cidade (id, nome, estado) VALUES (92, 'PORTO ACRE', 1);
INSERT INTO cidade (id, nome, estado) VALUES (93, 'PORTO WALTER', 1);
INSERT INTO cidade (id, nome, estado) VALUES (94, 'RIO BRANCO', 1);
INSERT INTO cidade (id, nome, estado) VALUES (95, 'RODRIGUES ALVES', 1);
INSERT INTO cidade (id, nome, estado) VALUES (96, 'SANTA ROSA DO PURUS', 1);
INSERT INTO cidade (id, nome, estado) VALUES (97, 'SENA MADUREIRA', 1);
INSERT INTO cidade (id, nome, estado) VALUES (98, 'SENADOR GUIOMARD', 1);
INSERT INTO cidade (id, nome, estado) VALUES (99, 'TARAUACÁ', 1);
INSERT INTO cidade (id, nome, estado) VALUES (100, 'XAPURI', 1);
INSERT INTO cidade (id, nome, estado) VALUES (101, 'ÁGUA BRANCA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (102, 'ANADIA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (103, 'ARAPIRACA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (104, 'ATALAIA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (105, 'BARRA DE SANTO ANTÔNIO', 2);
INSERT INTO cidade (id, nome, estado) VALUES (106, 'BARRA DE SÃO MIGUEL', 2);
INSERT INTO cidade (id, nome, estado) VALUES (107, 'BATALHA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (108, 'BELÉM', 2);
INSERT INTO cidade (id, nome, estado) VALUES (109, 'BELO MONTE', 2);
INSERT INTO cidade (id, nome, estado) VALUES (110, 'BOCA DA MATA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (111, 'BRANQUINHA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (112, 'CACIMBINHAS', 2);
INSERT INTO cidade (id, nome, estado) VALUES (113, 'CAJUEIRO', 2);
INSERT INTO cidade (id, nome, estado) VALUES (114, 'CAMPESTRE', 2);
INSERT INTO cidade (id, nome, estado) VALUES (115, 'CAMPO ALEGRE', 2);
INSERT INTO cidade (id, nome, estado) VALUES (116, 'CAMPO GRANDE', 2);
INSERT INTO cidade (id, nome, estado) VALUES (117, 'CANAPI', 2);
INSERT INTO cidade (id, nome, estado) VALUES (118, 'CAPELA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (119, 'CARNEIROS', 2);
INSERT INTO cidade (id, nome, estado) VALUES (120, 'CHÃ PRETA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (121, 'COITÉ DO NÓIA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (122, 'COLÔNIA LEOPOLDINA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (123, 'COQUEIRO SECO', 2);
INSERT INTO cidade (id, nome, estado) VALUES (124, 'CORURIPE', 2);
INSERT INTO cidade (id, nome, estado) VALUES (125, 'CRAÍBAS', 2);
INSERT INTO cidade (id, nome, estado) VALUES (126, 'DELMIRO GOUVEIA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (127, 'DOIS RIACHOS', 2);
INSERT INTO cidade (id, nome, estado) VALUES (128, 'ESTRELA DE ALAGOAS', 2);
INSERT INTO cidade (id, nome, estado) VALUES (129, 'FEIRA GRANDE', 2);
INSERT INTO cidade (id, nome, estado) VALUES (130, 'FELIZ DESERTO', 2);
INSERT INTO cidade (id, nome, estado) VALUES (131, 'FLEXEIRAS', 2);
INSERT INTO cidade (id, nome, estado) VALUES (132, 'GIRAU DO PONCIANO', 2);
INSERT INTO cidade (id, nome, estado) VALUES (133, 'IBATEGUARA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (134, 'IGACI', 2);
INSERT INTO cidade (id, nome, estado) VALUES (135, 'IGREJA NOVA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (136, 'INHAPI', 2);
INSERT INTO cidade (id, nome, estado) VALUES (137, 'JACARÉ DOS HOMENS', 2);
INSERT INTO cidade (id, nome, estado) VALUES (138, 'JACUÍPE', 2);
INSERT INTO cidade (id, nome, estado) VALUES (139, 'JAPARATINGA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (140, 'JARAMATAIA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (141, 'JEQUIÁ DA PRAIA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (142, 'JOAQUIM GOMES', 2);
INSERT INTO cidade (id, nome, estado) VALUES (143, 'JUNDIÁ', 2);
INSERT INTO cidade (id, nome, estado) VALUES (144, 'JUNQUEIRO', 2);
INSERT INTO cidade (id, nome, estado) VALUES (145, 'LAGOA DA CANOA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (146, 'LIMOEIRO DE ANADIA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (147, 'MACEIÓ', 2);
INSERT INTO cidade (id, nome, estado) VALUES (148, 'MAJOR ISIDORO', 2);
INSERT INTO cidade (id, nome, estado) VALUES (149, 'MAR VERMELHO', 2);
INSERT INTO cidade (id, nome, estado) VALUES (150, 'MARAGOGI', 2);
INSERT INTO cidade (id, nome, estado) VALUES (151, 'MARAVILHA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (152, 'MARECHAL DEODORO', 2);
INSERT INTO cidade (id, nome, estado) VALUES (153, 'MARIBONDO', 2);
INSERT INTO cidade (id, nome, estado) VALUES (154, 'MATA GRANDE', 2);
INSERT INTO cidade (id, nome, estado) VALUES (155, 'MATRIZ DE CAMARAGIBE', 2);
INSERT INTO cidade (id, nome, estado) VALUES (156, 'MESSIAS', 2);
INSERT INTO cidade (id, nome, estado) VALUES (157, 'MINADOR DO NEGRÃO', 2);
INSERT INTO cidade (id, nome, estado) VALUES (158, 'MONTEIRÓPOLIS', 2);
INSERT INTO cidade (id, nome, estado) VALUES (159, 'MURICI', 2);
INSERT INTO cidade (id, nome, estado) VALUES (160, 'NOVO LINO', 2);
INSERT INTO cidade (id, nome, estado) VALUES (161, 'OLHO D`ÁGUA DAS FLORES', 2);
INSERT INTO cidade (id, nome, estado) VALUES (162, 'OLHO D`ÁGUA DO CASADO', 2);
INSERT INTO cidade (id, nome, estado) VALUES (163, 'OLHO D`ÁGUA GRANDE', 2);
INSERT INTO cidade (id, nome, estado) VALUES (164, 'OLIVENÇA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (165, 'OURO BRANCO', 2);
INSERT INTO cidade (id, nome, estado) VALUES (166, 'PALESTINA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (167, 'PALMEIRA DOS ÍNDIOS', 2);
INSERT INTO cidade (id, nome, estado) VALUES (168, 'PÃO DE AÇÚCAR', 2);
INSERT INTO cidade (id, nome, estado) VALUES (169, 'PARICONHA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (170, 'PARIPUEIRA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (171, 'PASSO DE CAMARAGIBE', 2);
INSERT INTO cidade (id, nome, estado) VALUES (172, 'PAULO JACINTO', 2);
INSERT INTO cidade (id, nome, estado) VALUES (173, 'PENEDO', 2);
INSERT INTO cidade (id, nome, estado) VALUES (174, 'PIAÇABUÇU', 2);
INSERT INTO cidade (id, nome, estado) VALUES (175, 'PILAR', 2);
INSERT INTO cidade (id, nome, estado) VALUES (176, 'PINDOBA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (177, 'PIRANHAS', 2);
INSERT INTO cidade (id, nome, estado) VALUES (178, 'POÇO DAS TRINCHEIRAS', 2);
INSERT INTO cidade (id, nome, estado) VALUES (179, 'PORTO CALVO', 2);
INSERT INTO cidade (id, nome, estado) VALUES (180, 'PORTO DE PEDRAS', 2);
INSERT INTO cidade (id, nome, estado) VALUES (181, 'PORTO REAL DO COLÉGIO', 2);
INSERT INTO cidade (id, nome, estado) VALUES (182, 'QUEBRANGULO', 2);
INSERT INTO cidade (id, nome, estado) VALUES (183, 'RIO LARGO', 2);
INSERT INTO cidade (id, nome, estado) VALUES (184, 'ROTEIRO', 2);
INSERT INTO cidade (id, nome, estado) VALUES (185, 'SANTA LUZIA DO NORTE', 2);
INSERT INTO cidade (id, nome, estado) VALUES (186, 'SANTANA DO IPANEMA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (187, 'SANTANA DO MUNDAÚ', 2);
INSERT INTO cidade (id, nome, estado) VALUES (188, 'SÃO BRÁS', 2);
INSERT INTO cidade (id, nome, estado) VALUES (189, 'SÃO JOSÉ DA LAJE', 2);
INSERT INTO cidade (id, nome, estado) VALUES (190, 'SÃO JOSÉ DA TAPERA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (191, 'SÃO LUÍS DO QUITUNDE', 2);
INSERT INTO cidade (id, nome, estado) VALUES (192, 'SÃO MIGUEL DOS CAMPOS', 2);
INSERT INTO cidade (id, nome, estado) VALUES (193, 'SÃO MIGUEL DOS MILAGRES', 2);
INSERT INTO cidade (id, nome, estado) VALUES (194, 'SÃO SEBASTIÃO', 2);
INSERT INTO cidade (id, nome, estado) VALUES (195, 'SATUBA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (196, 'SENADOR RUI PALMEIRA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (197, 'TANQUE D`ARCA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (198, 'TAQUARANA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (199, 'TEOTÔNIO VILELA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (200, 'TRAIPU', 2);
INSERT INTO cidade (id, nome, estado) VALUES (201, 'UNIÃO DOS PALMARES', 2);
INSERT INTO cidade (id, nome, estado) VALUES (202, 'VIÇOSA', 2);
INSERT INTO cidade (id, nome, estado) VALUES (203, 'AMAPÁ', 4);
INSERT INTO cidade (id, nome, estado) VALUES (204, 'CALÇOENE', 4);
INSERT INTO cidade (id, nome, estado) VALUES (205, 'CUTIAS', 4);
INSERT INTO cidade (id, nome, estado) VALUES (206, 'FERREIRA GOMES', 4);
INSERT INTO cidade (id, nome, estado) VALUES (207, 'ITAUBAL', 4);
INSERT INTO cidade (id, nome, estado) VALUES (208, 'LARANJAL DO JARI', 4);
INSERT INTO cidade (id, nome, estado) VALUES (209, 'MACAPÁ', 4);
INSERT INTO cidade (id, nome, estado) VALUES (210, 'MAZAGÃO', 4);
INSERT INTO cidade (id, nome, estado) VALUES (211, 'OIAPOQUE', 4);
INSERT INTO cidade (id, nome, estado) VALUES (212, 'PEDRA BRANCA DO AMAPARÍ', 4);
INSERT INTO cidade (id, nome, estado) VALUES (213, 'PORTO GRANDE', 4);
INSERT INTO cidade (id, nome, estado) VALUES (214, 'PRACUÚBA', 4);
INSERT INTO cidade (id, nome, estado) VALUES (215, 'SANTANA', 4);
INSERT INTO cidade (id, nome, estado) VALUES (216, 'SERRA DO NAVIO', 4);
INSERT INTO cidade (id, nome, estado) VALUES (217, 'TARTARUGALZINHO', 4);
INSERT INTO cidade (id, nome, estado) VALUES (218, 'VITÓRIA DO JARI', 4);
INSERT INTO cidade (id, nome, estado) VALUES (219, 'ALVARÃES', 3);
INSERT INTO cidade (id, nome, estado) VALUES (220, 'AMATURÁ', 3);
INSERT INTO cidade (id, nome, estado) VALUES (221, 'ANAMÃ', 3);
INSERT INTO cidade (id, nome, estado) VALUES (222, 'ANORI', 3);
INSERT INTO cidade (id, nome, estado) VALUES (223, 'APUÍ', 3);
INSERT INTO cidade (id, nome, estado) VALUES (224, 'ATALAIA DO NORTE', 3);
INSERT INTO cidade (id, nome, estado) VALUES (225, 'AUTAZES', 3);
INSERT INTO cidade (id, nome, estado) VALUES (226, 'BARCELOS', 3);
INSERT INTO cidade (id, nome, estado) VALUES (227, 'BARREIRINHA', 3);
INSERT INTO cidade (id, nome, estado) VALUES (228, 'BENJAMIN CONSTANT', 3);
INSERT INTO cidade (id, nome, estado) VALUES (229, 'BERURI', 3);
INSERT INTO cidade (id, nome, estado) VALUES (230, 'BOA VISTA DO RAMOS', 3);
INSERT INTO cidade (id, nome, estado) VALUES (231, 'BOCA DO ACRE', 3);
INSERT INTO cidade (id, nome, estado) VALUES (232, 'BORBA', 3);
INSERT INTO cidade (id, nome, estado) VALUES (233, 'CAAPIRANGA', 3);
INSERT INTO cidade (id, nome, estado) VALUES (234, 'CANUTAMA', 3);
INSERT INTO cidade (id, nome, estado) VALUES (235, 'CARAUARI', 3);
INSERT INTO cidade (id, nome, estado) VALUES (236, 'CAREIRO', 3);
INSERT INTO cidade (id, nome, estado) VALUES (237, 'CAREIRO DA VÁRZEA', 3);
INSERT INTO cidade (id, nome, estado) VALUES (238, 'COARI', 3);
INSERT INTO cidade (id, nome, estado) VALUES (239, 'CODAJÁS', 3);
INSERT INTO cidade (id, nome, estado) VALUES (240, 'EIRUNEPÉ', 3);
INSERT INTO cidade (id, nome, estado) VALUES (241, 'ENVIRA', 3);
INSERT INTO cidade (id, nome, estado) VALUES (242, 'FONTE BOA', 3);
INSERT INTO cidade (id, nome, estado) VALUES (243, 'GUAJARÁ', 3);
INSERT INTO cidade (id, nome, estado) VALUES (244, 'HUMAITÁ', 3);
INSERT INTO cidade (id, nome, estado) VALUES (245, 'IPIXUNA', 3);
INSERT INTO cidade (id, nome, estado) VALUES (246, 'IRANDUBA', 3);
INSERT INTO cidade (id, nome, estado) VALUES (247, 'ITACOATIARA', 3);
INSERT INTO cidade (id, nome, estado) VALUES (248, 'ITAMARATI', 3);
INSERT INTO cidade (id, nome, estado) VALUES (249, 'ITAPIRANGA', 3);
INSERT INTO cidade (id, nome, estado) VALUES (250, 'JAPURÁ', 3);
INSERT INTO cidade (id, nome, estado) VALUES (251, 'JURUÁ', 3);
INSERT INTO cidade (id, nome, estado) VALUES (252, 'JUTAÍ', 3);
INSERT INTO cidade (id, nome, estado) VALUES (253, 'LÁBREA', 3);
INSERT INTO cidade (id, nome, estado) VALUES (254, 'MANACAPURU', 3);
INSERT INTO cidade (id, nome, estado) VALUES (255, 'MANAQUIRI', 3);
INSERT INTO cidade (id, nome, estado) VALUES (256, 'MANAUS', 3);
INSERT INTO cidade (id, nome, estado) VALUES (257, 'MANICORÉ', 3);
INSERT INTO cidade (id, nome, estado) VALUES (258, 'MARAÃ', 3);
INSERT INTO cidade (id, nome, estado) VALUES (259, 'MAUÉS', 3);
INSERT INTO cidade (id, nome, estado) VALUES (260, 'NHAMUNDÁ', 3);
INSERT INTO cidade (id, nome, estado) VALUES (261, 'NOVA OLINDA DO NORTE', 3);
INSERT INTO cidade (id, nome, estado) VALUES (262, 'NOVO AIRÃO', 3);
INSERT INTO cidade (id, nome, estado) VALUES (263, 'NOVO ARIPUANÃ', 3);
INSERT INTO cidade (id, nome, estado) VALUES (264, 'PARINTINS', 3);
INSERT INTO cidade (id, nome, estado) VALUES (265, 'PAUINI', 3);
INSERT INTO cidade (id, nome, estado) VALUES (266, 'PRESIDENTE FIGUEIREDO', 3);
INSERT INTO cidade (id, nome, estado) VALUES (267, 'RIO PRETO DA EVA', 3);
INSERT INTO cidade (id, nome, estado) VALUES (268, 'SANTA ISABEL DO RIO NEGRO', 3);
INSERT INTO cidade (id, nome, estado) VALUES (269, 'SANTO ANTÔNIO DO IÇÁ', 3);
INSERT INTO cidade (id, nome, estado) VALUES (270, 'SÃO GABRIEL DA CACHOEIRA', 3);
INSERT INTO cidade (id, nome, estado) VALUES (271, 'SÃO PAULO DE OLIVENÇA', 3);
INSERT INTO cidade (id, nome, estado) VALUES (272, 'SÃO SEBASTIÃO DO UATUMÃ', 3);
INSERT INTO cidade (id, nome, estado) VALUES (273, 'SILVES', 3);
INSERT INTO cidade (id, nome, estado) VALUES (274, 'TABATINGA', 3);
INSERT INTO cidade (id, nome, estado) VALUES (275, 'TAPAUÁ', 3);
INSERT INTO cidade (id, nome, estado) VALUES (276, 'TEFÉ', 3);
INSERT INTO cidade (id, nome, estado) VALUES (277, 'TONANTINS', 3);
INSERT INTO cidade (id, nome, estado) VALUES (278, 'UARINI', 3);
INSERT INTO cidade (id, nome, estado) VALUES (279, 'URUCARÁ', 3);
INSERT INTO cidade (id, nome, estado) VALUES (280, 'URUCURITUBA', 3);
INSERT INTO cidade (id, nome, estado) VALUES (281, 'ABAÍRA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (282, 'ABARÉ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (283, 'ACAJUTIBA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (284, 'ADUSTINA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (285, 'ÁGUA FRIA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (286, 'AIQUARA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (287, 'ALAGOINHAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (288, 'ALCOBAÇA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (289, 'ALMADINA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (290, 'AMARGOSA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (291, 'AMÉLIA RODRIGUES', 5);
INSERT INTO cidade (id, nome, estado) VALUES (292, 'AMÉRICA DOURADA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (293, 'ANAGÉ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (294, 'ANDARAÍ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (295, 'ANDORINHA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (296, 'ANGICAL', 5);
INSERT INTO cidade (id, nome, estado) VALUES (297, 'ANGUERA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (298, 'ANTAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (299, 'ANTÔNIO CARDOSO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (300, 'ANTÔNIO GONÇALVES', 5);
INSERT INTO cidade (id, nome, estado) VALUES (301, 'APORÁ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (302, 'APUAREMA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (303, 'ARAÇAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (304, 'ARACATU', 5);
INSERT INTO cidade (id, nome, estado) VALUES (305, 'ARACI', 5);
INSERT INTO cidade (id, nome, estado) VALUES (306, 'ARAMARI', 5);
INSERT INTO cidade (id, nome, estado) VALUES (307, 'ARATACA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (308, 'ARATUÍPE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (309, 'AURELINO LEAL', 5);
INSERT INTO cidade (id, nome, estado) VALUES (310, 'BAIANÓPOLIS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (311, 'BAIXA GRANDE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (312, 'BANZAÊ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (313, 'BARRA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (314, 'BARRA DA ESTIVA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (315, 'BARRA DO CHOÇA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (316, 'BARRA DO MENDES', 5);
INSERT INTO cidade (id, nome, estado) VALUES (317, 'BARRA DO ROCHA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (318, 'BARREIRAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (319, 'BARRO ALTO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (320, 'BARRO PRETO (ANTIGO GOV. LOMANTO JR.)', 5);
INSERT INTO cidade (id, nome, estado) VALUES (321, 'BARROCAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (322, 'BELMONTE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (323, 'BELO CAMPO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (324, 'BIRITINGA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (325, 'BOA NOVA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (326, 'BOA VISTA DO TUPIM', 5);
INSERT INTO cidade (id, nome, estado) VALUES (327, 'BOM JESUS DA LAPA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (328, 'BOM JESUS DA SERRA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (329, 'BONINAL', 5);
INSERT INTO cidade (id, nome, estado) VALUES (330, 'BONITO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (331, 'BOQUIRA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (332, 'BOTUPORÃ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (333, 'BREJÕES', 5);
INSERT INTO cidade (id, nome, estado) VALUES (334, 'BREJOLÂNDIA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (335, 'BROTAS DE MACAÚBAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (336, 'BRUMADO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (337, 'BUERAREMA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (338, 'BURITIRAMA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (339, 'CAATIBA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (340, 'CABACEIRAS DO PARAGUAÇU', 5);
INSERT INTO cidade (id, nome, estado) VALUES (341, 'CACHOEIRA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (342, 'CACULÉ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (343, 'CAÉM', 5);
INSERT INTO cidade (id, nome, estado) VALUES (344, 'CAETANOS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (345, 'CAETITÉ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (346, 'CAFARNAUM', 5);
INSERT INTO cidade (id, nome, estado) VALUES (347, 'CAIRU', 5);
INSERT INTO cidade (id, nome, estado) VALUES (348, 'CALDEIRÃO GRANDE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (349, 'CAMACAN', 5);
INSERT INTO cidade (id, nome, estado) VALUES (350, 'CAMAÇARI', 5);
INSERT INTO cidade (id, nome, estado) VALUES (351, 'CAMAMU', 5);
INSERT INTO cidade (id, nome, estado) VALUES (352, 'CAMPO ALEGRE DE LOURDES', 5);
INSERT INTO cidade (id, nome, estado) VALUES (353, 'CAMPO FORMOSO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (354, 'CANÁPOLIS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (355, 'CANARANA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (356, 'CANAVIEIRAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (357, 'CANDEAL', 5);
INSERT INTO cidade (id, nome, estado) VALUES (358, 'CANDEIAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (359, 'CANDIBA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (360, 'CÂNDIDO SALES', 5);
INSERT INTO cidade (id, nome, estado) VALUES (361, 'CANSANÇÃO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (362, 'CANUDOS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (363, 'CAPELA DO ALTO ALEGRE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (364, 'CAPIM GROSSO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (365, 'CARAÍBAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (366, 'CARAVELAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (367, 'CARDEAL DA SILVA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (368, 'CARINHANHA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (369, 'CASA NOVA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (370, 'CASTRO ALVES', 5);
INSERT INTO cidade (id, nome, estado) VALUES (371, 'CATOLÂNDIA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (372, 'CATU', 5);
INSERT INTO cidade (id, nome, estado) VALUES (373, 'CATURAMA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (374, 'CENTRAL', 5);
INSERT INTO cidade (id, nome, estado) VALUES (375, 'CHORROCHÓ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (376, 'CÍCERO DANTAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (377, 'CIPÓ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (378, 'COARACI', 5);
INSERT INTO cidade (id, nome, estado) VALUES (379, 'COCOS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (380, 'CONCEIÇÃO DA FEIRA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (381, 'CONCEIÇÃO DO ALMEIDA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (382, 'CONCEIÇÃO DO COITÉ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (383, 'CONCEIÇÃO DO JACUÍPE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (384, 'CONDE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (385, 'CONDEÚBA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (386, 'CONTENDAS DO SINCORÁ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (387, 'CORAÇÃO DE MARIA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (388, 'CORDEIROS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (389, 'CORIBE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (390, 'CORONEL JOÃO SÁ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (391, 'CORRENTINA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (392, 'COTEGIPE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (393, 'CRAVOLÂNDIA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (394, 'CRISÓPOLIS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (395, 'CRISTÓPOLIS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (396, 'CRUZ DAS ALMAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (397, 'CURAÇÁ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (398, 'DÁRIO MEIRA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (399, 'DIAS D`ÁVILA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (400, 'DOM BASÍLIO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (401, 'DOM MACEDO COSTA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (402, 'ELÍSIO MEDRADO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (403, 'ENCRUZILHADA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (404, 'ENTRE RIOS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (405, 'ÉRICO CARDOSO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (406, 'ESPLANADA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (407, 'EUCLIDES DA CUNHA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (408, 'EUNÁPOLIS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (409, 'FÁTIMA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (410, 'FEIRA DA MATA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (411, 'FEIRA DE SANTANA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (412, 'FILADÉLFIA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (413, 'FIRMINO ALVES', 5);
INSERT INTO cidade (id, nome, estado) VALUES (414, 'FLORESTA AZUL', 5);
INSERT INTO cidade (id, nome, estado) VALUES (415, 'FORMOSA DO RIO PRETO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (416, 'GANDU', 5);
INSERT INTO cidade (id, nome, estado) VALUES (417, 'GAVIÃO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (418, 'GENTIO DO OURO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (419, 'GLÓRIA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (420, 'GONGOGI', 5);
INSERT INTO cidade (id, nome, estado) VALUES (421, 'GOVERNADOR MANGABEIRA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (422, 'GUAJERU', 5);
INSERT INTO cidade (id, nome, estado) VALUES (423, 'GUANAMBI', 5);
INSERT INTO cidade (id, nome, estado) VALUES (424, 'GUARATINGA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (425, 'HELIÓPOLIS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (426, 'IAÇU', 5);
INSERT INTO cidade (id, nome, estado) VALUES (427, 'IBIASSUCÊ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (428, 'IBICARAÍ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (429, 'IBICOARA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (430, 'IBICUÍ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (431, 'IBIPEBA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (432, 'IBIPITANGA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (433, 'IBIQUERA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (434, 'IBIRAPITANGA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (435, 'IBIRAPUÃ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (436, 'IBIRATAIA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (437, 'IBITIARA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (438, 'IBITITÁ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (439, 'IBOTIRAMA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (440, 'ICHU', 5);
INSERT INTO cidade (id, nome, estado) VALUES (441, 'IGAPORÃ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (442, 'IGRAPIÚNA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (443, 'IGUAÍ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (444, 'ILHÉUS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (445, 'INHAMBUPE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (446, 'IPECAETÁ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (447, 'IPIAÚ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (448, 'IPIRÁ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (449, 'IPUPIARA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (450, 'IRAJUBA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (451, 'IRAMAIA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (452, 'IRAQUARA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (453, 'IRARÁ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (454, 'IRECÊ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (455, 'ITABELA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (456, 'ITABERABA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (457, 'ITABUNA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (458, 'ITACARÉ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (459, 'ITAETÉ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (460, 'ITAGI', 5);
INSERT INTO cidade (id, nome, estado) VALUES (461, 'ITAGIBÁ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (462, 'ITAGIMIRIM', 5);
INSERT INTO cidade (id, nome, estado) VALUES (463, 'ITAGUAÇU DA BAHIA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (464, 'ITAJU DO COLÔNIA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (465, 'ITAJUÍPE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (466, 'ITAMARAJU', 5);
INSERT INTO cidade (id, nome, estado) VALUES (467, 'ITAMARI', 5);
INSERT INTO cidade (id, nome, estado) VALUES (468, 'ITAMBÉ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (469, 'ITANAGRA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (470, 'ITANHÉM', 5);
INSERT INTO cidade (id, nome, estado) VALUES (471, 'ITAPARICA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (472, 'ITAPÉ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (473, 'ITAPEBI', 5);
INSERT INTO cidade (id, nome, estado) VALUES (474, 'ITAPETINGA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (475, 'ITAPICURU', 5);
INSERT INTO cidade (id, nome, estado) VALUES (476, 'ITAPITANGA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (477, 'ITAQUARA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (478, 'ITARANTIM', 5);
INSERT INTO cidade (id, nome, estado) VALUES (479, 'ITATIM', 5);
INSERT INTO cidade (id, nome, estado) VALUES (480, 'ITIRUÇU', 5);
INSERT INTO cidade (id, nome, estado) VALUES (481, 'ITIÚBA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (482, 'ITORORÓ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (483, 'ITUAÇU', 5);
INSERT INTO cidade (id, nome, estado) VALUES (484, 'ITUBERÁ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (485, 'IUIÚ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (486, 'JABORANDI', 5);
INSERT INTO cidade (id, nome, estado) VALUES (487, 'JACARACI', 5);
INSERT INTO cidade (id, nome, estado) VALUES (488, 'JACOBINA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (489, 'JAGUAQUARA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (490, 'JAGUARARI', 5);
INSERT INTO cidade (id, nome, estado) VALUES (491, 'JAGUARIPE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (492, 'JANDAÍRA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (493, 'JEQUIÉ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (494, 'JEREMOABO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (495, 'JIQUIRIÇÁ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (496, 'JITAÚNA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (497, 'JOÃO DOURADO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (498, 'JUAZEIRO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (499, 'JUCURUÇU', 5);
INSERT INTO cidade (id, nome, estado) VALUES (500, 'JUSSARA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (501, 'JUSSARI', 5);
INSERT INTO cidade (id, nome, estado) VALUES (502, 'JUSSIAPE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (503, 'LAFAIETE COUTINHO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (504, 'LAGOA REAL', 5);
INSERT INTO cidade (id, nome, estado) VALUES (505, 'LAJE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (506, 'LAJEDÃO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (507, 'LAJEDINHO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (508, 'LAJEDO DO TABOCAL', 5);
INSERT INTO cidade (id, nome, estado) VALUES (509, 'LAMARÃO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (510, 'LAPÃO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (511, 'LAURO DE FREITAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (512, 'LENÇÓIS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (513, 'LICÍNIO DE ALMEIDA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (514, 'LIVRAMENTO DE NOSSA SENHORA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (515, 'LUÍS EDUARDO MAGALHÃES', 5);
INSERT INTO cidade (id, nome, estado) VALUES (516, 'MACAJUBA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (517, 'MACARANI', 5);
INSERT INTO cidade (id, nome, estado) VALUES (518, 'MACAÚBAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (519, 'MACURURÉ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (520, 'MADRE DE DEUS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (521, 'MAETINGA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (522, 'MAIQUINIQUE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (523, 'MAIRI', 5);
INSERT INTO cidade (id, nome, estado) VALUES (524, 'MALHADA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (525, 'MALHADA DE PEDRAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (526, 'MANOEL VITORINO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (527, 'MANSIDÃO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (528, 'MARACÁS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (529, 'MARAGOGIPE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (530, 'MARAÚ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (531, 'MARCIONÍLIO SOUZA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (532, 'MASCOTE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (533, 'MATA DE SÃO JOÃO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (534, 'MATINA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (535, 'MEDEIROS NETO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (536, 'MIGUEL CALMON', 5);
INSERT INTO cidade (id, nome, estado) VALUES (537, 'MILAGRES', 5);
INSERT INTO cidade (id, nome, estado) VALUES (538, 'MIRANGABA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (539, 'MIRANTE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (540, 'MONTE SANTO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (541, 'MORPARÁ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (542, 'MORRO DO CHAPÉU', 5);
INSERT INTO cidade (id, nome, estado) VALUES (543, 'MORTUGABA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (544, 'MUCUGÊ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (545, 'MUCURI', 5);
INSERT INTO cidade (id, nome, estado) VALUES (546, 'MULUNGU DO MORRO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (547, 'MUNDO NOVO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (548, 'MUNIZ FERREIRA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (549, 'MUQUÉM DE SÃO FRANCISCO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (550, 'MURITIBA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (551, 'MUTUÍPE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (552, 'NAZARÉ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (553, 'NILO PEÇANHA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (554, 'NORDESTINA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (555, 'NOVA CANAÃ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (556, 'NOVA FÁTIMA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (557, 'NOVA IBIÁ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (558, 'NOVA ITARANA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (559, 'NOVA REDENÇÃO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (560, 'NOVA SOURE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (561, 'NOVA VIÇOSA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (562, 'NOVO HORIZONTE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (563, 'NOVO TRIUNFO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (564, 'OLINDINA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (565, 'OLIVEIRA DOS BREJINHOS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (566, 'OURIÇANGAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (567, 'OUROLÂNDIA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (568, 'PALMAS DE MONTE ALTO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (569, 'PALMEIRAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (570, 'PARAMIRIM', 5);
INSERT INTO cidade (id, nome, estado) VALUES (571, 'PARATINGA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (572, 'PARIPIRANGA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (573, 'PAU BRASIL', 5);
INSERT INTO cidade (id, nome, estado) VALUES (574, 'PAULO AFONSO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (575, 'PÉ DE SERRA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (576, 'PEDRÃO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (577, 'PEDRO ALEXANDRE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (578, 'PIATÃ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (579, 'PILÃO ARCADO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (580, 'PINDAÍ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (581, 'PINDOBAÇU', 5);
INSERT INTO cidade (id, nome, estado) VALUES (582, 'PINTADAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (583, 'PIRAÍ DO NORTE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (584, 'PIRIPÁ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (585, 'PIRITIBA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (586, 'PLANALTINO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (587, 'PLANALTO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (588, 'POÇÕES', 5);
INSERT INTO cidade (id, nome, estado) VALUES (589, 'POJUCA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (590, 'PONTO NOVO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (591, 'PORTO SEGURO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (592, 'POTIRAGUÁ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (593, 'PRADO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (594, 'PRESIDENTE DUTRA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (595, 'PRESIDENTE JÂNIO QUADROS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (596, 'PRESIDENTE TANCREDO NEVES', 5);
INSERT INTO cidade (id, nome, estado) VALUES (597, 'QUEIMADAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (598, 'QUIJINGUE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (599, 'QUIXABEIRA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (600, 'RAFAEL JAMBEIRO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (601, 'REMANSO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (602, 'RETIROLÂNDIA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (603, 'RIACHÃO DAS NEVES', 5);
INSERT INTO cidade (id, nome, estado) VALUES (604, 'RIACHÃO DO JACUÍPE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (605, 'RIACHO DE SANTANA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (606, 'RIBEIRA DO AMPARO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (607, 'RIBEIRA DO POMBAL', 5);
INSERT INTO cidade (id, nome, estado) VALUES (608, 'RIBEIRÃO DO LARGO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (609, 'RIO DE CONTAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (610, 'RIO DO ANTÔNIO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (611, 'RIO DO PIRES', 5);
INSERT INTO cidade (id, nome, estado) VALUES (612, 'RIO REAL', 5);
INSERT INTO cidade (id, nome, estado) VALUES (613, 'RODELAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (614, 'RUY BARBOSA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (615, 'SALINAS DA MARGARIDA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (616, 'SALVADOR', 5);
INSERT INTO cidade (id, nome, estado) VALUES (617, 'SANTA BÁRBARA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (618, 'SANTA BRÍGIDA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (619, 'SANTA CRUZ CABRÁLIA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (620, 'SANTA CRUZ DA VITÓRIA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (621, 'SANTA INÊS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (622, 'SANTA LUZIA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (623, 'SANTA MARIA DA VITÓRIA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (624, 'SANTA RITA DE CÁSSIA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (625, 'SANTA TERESINHA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (626, 'SANTALUZ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (627, 'SANTANA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (628, 'SANTANÓPOLIS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (629, 'SANTO AMARO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (630, 'SANTO ANTÔNIO DE JESUS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (631, 'SANTO ESTÊVÃO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (632, 'SÃO DESIDÉRIO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (633, 'SÃO DOMINGOS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (634, 'SÃO FELIPE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (635, 'SÃO FÉLIX', 5);
INSERT INTO cidade (id, nome, estado) VALUES (636, 'SÃO FÉLIX DO CORIBE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (637, 'SÃO FRANCISCO DO CONDE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (638, 'SÃO GABRIEL', 5);
INSERT INTO cidade (id, nome, estado) VALUES (639, 'SÃO GONÇALO DOS CAMPOS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (640, 'SÃO JOSÉ DA VITÓRIA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (641, 'SÃO JOSÉ DO JACUÍPE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (642, 'SÃO MIGUEL DAS MATAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (643, 'SÃO SEBASTIÃO DO PASSÉ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (644, 'SAPEAÇU', 5);
INSERT INTO cidade (id, nome, estado) VALUES (645, 'SÁTIRO DIAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (646, 'SAUBARA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (647, 'SAÚDE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (648, 'SEABRA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (649, 'SEBASTIÃO LARANJEIRAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (650, 'SENHOR DO BONFIM', 5);
INSERT INTO cidade (id, nome, estado) VALUES (651, 'SENTO SÉ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (652, 'SERRA DO RAMALHO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (653, 'SERRA DOURADA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (654, 'SERRA PRETA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (655, 'SERRINHA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (656, 'SERROLÂNDIA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (657, 'SIMÕES FILHO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (658, 'SÍTIO DO MATO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (659, 'SÍTIO DO QUINTO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (660, 'SOBRADINHO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (661, 'SOUTO SOARES', 5);
INSERT INTO cidade (id, nome, estado) VALUES (662, 'TABOCAS DO BREJO VELHO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (663, 'TANHAÇU', 5);
INSERT INTO cidade (id, nome, estado) VALUES (664, 'TANQUE NOVO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (665, 'TANQUINHO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (666, 'TAPEROÁ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (667, 'TAPIRAMUTÁ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (668, 'TEIXEIRA DE FREITAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (669, 'TEODORO SAMPAIO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (670, 'TEOFILÂNDIA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (671, 'TEOLÂNDIA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (672, 'TERRA NOVA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (673, 'TREMEDAL', 5);
INSERT INTO cidade (id, nome, estado) VALUES (674, 'TUCANO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (675, 'UAUÁ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (676, 'UBAÍRA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (677, 'UBAITABA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (678, 'UBATÃ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (679, 'UIBAÍ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (680, 'UMBURANAS', 5);
INSERT INTO cidade (id, nome, estado) VALUES (681, 'UNA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (682, 'URANDI', 5);
INSERT INTO cidade (id, nome, estado) VALUES (683, 'URUÇUCA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (684, 'UTINGA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (685, 'VALENÇA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (686, 'VALENTE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (687, 'VÁRZEA DA ROÇA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (688, 'VÁRZEA DO POÇO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (689, 'VÁRZEA NOVA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (690, 'VARZEDO', 5);
INSERT INTO cidade (id, nome, estado) VALUES (691, 'VERA CRUZ', 5);
INSERT INTO cidade (id, nome, estado) VALUES (692, 'VEREDA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (693, 'VITÓRIA DA CONQUISTA', 5);
INSERT INTO cidade (id, nome, estado) VALUES (694, 'WAGNER', 5);
INSERT INTO cidade (id, nome, estado) VALUES (695, 'WANDERLEY', 5);
INSERT INTO cidade (id, nome, estado) VALUES (696, 'WENCESLAU GUIMARÃES', 5);
INSERT INTO cidade (id, nome, estado) VALUES (697, 'XIQUE-XIQUE', 5);
INSERT INTO cidade (id, nome, estado) VALUES (698, 'ABAIARA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (699, 'ACARAPE', 6);
INSERT INTO cidade (id, nome, estado) VALUES (700, 'ACARAÚ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (701, 'ACOPIARA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (702, 'AIUABA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (703, 'ALCÂNTARAS', 6);
INSERT INTO cidade (id, nome, estado) VALUES (704, 'ALTANEIRA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (705, 'ALTO SANTO', 6);
INSERT INTO cidade (id, nome, estado) VALUES (706, 'AMONTADA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (707, 'ANTONINA DO NORTE', 6);
INSERT INTO cidade (id, nome, estado) VALUES (708, 'APUIARÉS', 6);
INSERT INTO cidade (id, nome, estado) VALUES (709, 'AQUIRAZ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (710, 'ARACATI', 6);
INSERT INTO cidade (id, nome, estado) VALUES (711, 'ARACOIABA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (712, 'ARARENDÁ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (713, 'ARARIPE', 6);
INSERT INTO cidade (id, nome, estado) VALUES (714, 'ARATUBA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (715, 'ARNEIROZ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (716, 'ASSARÉ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (717, 'AURORA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (718, 'BAIXIO', 6);
INSERT INTO cidade (id, nome, estado) VALUES (719, 'BANABUIÚ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (720, 'BARBALHA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (721, 'BARREIRA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (722, 'BARRO', 6);
INSERT INTO cidade (id, nome, estado) VALUES (723, 'BARROQUINHA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (724, 'BATURITÉ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (725, 'BEBERIBE', 6);
INSERT INTO cidade (id, nome, estado) VALUES (726, 'BELA CRUZ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (727, 'BOA VIAGEM', 6);
INSERT INTO cidade (id, nome, estado) VALUES (728, 'BREJO SANTO', 6);
INSERT INTO cidade (id, nome, estado) VALUES (729, 'CAMOCIM', 6);
INSERT INTO cidade (id, nome, estado) VALUES (730, 'CAMPOS SALES', 6);
INSERT INTO cidade (id, nome, estado) VALUES (731, 'CANINDÉ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (732, 'CAPISTRANO', 6);
INSERT INTO cidade (id, nome, estado) VALUES (733, 'CARIDADE', 6);
INSERT INTO cidade (id, nome, estado) VALUES (734, 'CARIRÉ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (735, 'CARIRIAÇU', 6);
INSERT INTO cidade (id, nome, estado) VALUES (736, 'CARIÚS', 6);
INSERT INTO cidade (id, nome, estado) VALUES (737, 'CARNAUBAL', 6);
INSERT INTO cidade (id, nome, estado) VALUES (738, 'CASCAVEL', 6);
INSERT INTO cidade (id, nome, estado) VALUES (739, 'CATARINA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (740, 'CATUNDA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (741, 'CAUCAIA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (742, 'CEDRO', 6);
INSERT INTO cidade (id, nome, estado) VALUES (743, 'CHAVAL', 6);
INSERT INTO cidade (id, nome, estado) VALUES (744, 'CHORÓ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (745, 'CHOROZINHO', 6);
INSERT INTO cidade (id, nome, estado) VALUES (746, 'COREAÚ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (747, 'CRATEÚS', 6);
INSERT INTO cidade (id, nome, estado) VALUES (748, 'CRATO', 6);
INSERT INTO cidade (id, nome, estado) VALUES (749, 'CROATÁ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (750, 'CRUZ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (751, 'DEPUTADO IRAPUAN PINHEIRO', 6);
INSERT INTO cidade (id, nome, estado) VALUES (752, 'ERERÊ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (753, 'EUSÉBIO', 6);
INSERT INTO cidade (id, nome, estado) VALUES (754, 'FARIAS BRITO', 6);
INSERT INTO cidade (id, nome, estado) VALUES (755, 'FORQUILHA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (756, 'FORTALEZA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (757, 'FORTIM', 6);
INSERT INTO cidade (id, nome, estado) VALUES (758, 'FRECHEIRINHA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (759, 'GENERAL SAMPAIO', 6);
INSERT INTO cidade (id, nome, estado) VALUES (760, 'GRAÇA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (761, 'GRANJA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (762, 'GRANJEIRO', 6);
INSERT INTO cidade (id, nome, estado) VALUES (763, 'GROAÍRAS', 6);
INSERT INTO cidade (id, nome, estado) VALUES (764, 'GUAIÚBA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (765, 'GUARACIABA DO NORTE', 6);
INSERT INTO cidade (id, nome, estado) VALUES (766, 'GUARAMIRANGA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (767, 'HIDROLÂNDIA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (768, 'HORIZONTE', 6);
INSERT INTO cidade (id, nome, estado) VALUES (769, 'IBARETAMA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (770, 'IBIAPINA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (771, 'IBICUITINGA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (772, 'ICAPUÍ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (773, 'ICÓ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (774, 'IGUATU', 6);
INSERT INTO cidade (id, nome, estado) VALUES (775, 'INDEPENDÊNCIA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (776, 'IPAPORANGA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (777, 'IPAUMIRIM', 6);
INSERT INTO cidade (id, nome, estado) VALUES (778, 'IPU', 6);
INSERT INTO cidade (id, nome, estado) VALUES (779, 'IPUEIRAS', 6);
INSERT INTO cidade (id, nome, estado) VALUES (780, 'IRACEMA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (781, 'IRAUÇUBA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (782, 'ITAIÇABA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (783, 'ITAITINGA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (784, 'ITAPAGÉ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (785, 'ITAPIPOCA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (786, 'ITAPIÚNA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (787, 'ITAREMA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (788, 'ITATIRA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (789, 'JAGUARETAMA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (790, 'JAGUARIBARA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (791, 'JAGUARIBE', 6);
INSERT INTO cidade (id, nome, estado) VALUES (792, 'JAGUARUANA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (793, 'JARDIM', 6);
INSERT INTO cidade (id, nome, estado) VALUES (794, 'JATI', 6);
INSERT INTO cidade (id, nome, estado) VALUES (795, 'JIJOCA DE JERICOACOARA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (796, 'JUAZEIRO DO NORTE', 6);
INSERT INTO cidade (id, nome, estado) VALUES (797, 'JUCÁS', 6);
INSERT INTO cidade (id, nome, estado) VALUES (798, 'LAVRAS DA MANGABEIRA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (799, 'LIMOEIRO DO NORTE', 6);
INSERT INTO cidade (id, nome, estado) VALUES (800, 'MADALENA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (801, 'MARACANAÚ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (802, 'MARANGUAPE', 6);
INSERT INTO cidade (id, nome, estado) VALUES (803, 'MARCO', 6);
INSERT INTO cidade (id, nome, estado) VALUES (804, 'MARTINÓPOLE', 6);
INSERT INTO cidade (id, nome, estado) VALUES (805, 'MASSAPÊ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (806, 'MAURITI', 6);
INSERT INTO cidade (id, nome, estado) VALUES (807, 'MERUOCA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (808, 'MILAGRES', 6);
INSERT INTO cidade (id, nome, estado) VALUES (809, 'MILHÃ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (810, 'MIRAÍMA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (811, 'MISSÃO VELHA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (812, 'MOMBAÇA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (813, 'MONSENHOR TABOSA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (814, 'MORADA NOVA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (815, 'MORAÚJO', 6);
INSERT INTO cidade (id, nome, estado) VALUES (816, 'MORRINHOS', 6);
INSERT INTO cidade (id, nome, estado) VALUES (817, 'MUCAMBO', 6);
INSERT INTO cidade (id, nome, estado) VALUES (818, 'MULUNGU', 6);
INSERT INTO cidade (id, nome, estado) VALUES (819, 'NOVA OLINDA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (820, 'NOVA RUSSAS', 6);
INSERT INTO cidade (id, nome, estado) VALUES (821, 'NOVO ORIENTE', 6);
INSERT INTO cidade (id, nome, estado) VALUES (822, 'OCARA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (823, 'ORÓS', 6);
INSERT INTO cidade (id, nome, estado) VALUES (824, 'PACAJUS', 6);
INSERT INTO cidade (id, nome, estado) VALUES (825, 'PACATUBA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (826, 'PACOTI', 6);
INSERT INTO cidade (id, nome, estado) VALUES (827, 'PACUJÁ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (828, 'PALHANO', 6);
INSERT INTO cidade (id, nome, estado) VALUES (829, 'PALMÁCIA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (830, 'PARACURU', 6);
INSERT INTO cidade (id, nome, estado) VALUES (831, 'PARAIPABA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (832, 'PARAMBU', 6);
INSERT INTO cidade (id, nome, estado) VALUES (833, 'PARAMOTI', 6);
INSERT INTO cidade (id, nome, estado) VALUES (834, 'PEDRA BRANCA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (835, 'PENAFORTE', 6);
INSERT INTO cidade (id, nome, estado) VALUES (836, 'PENTECOSTE', 6);
INSERT INTO cidade (id, nome, estado) VALUES (837, 'PEREIRO', 6);
INSERT INTO cidade (id, nome, estado) VALUES (838, 'PINDORETAMA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (839, 'PIQUET CARNEIRO', 6);
INSERT INTO cidade (id, nome, estado) VALUES (840, 'PIRES FERREIRA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (841, 'PORANGA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (842, 'PORTEIRAS', 6);
INSERT INTO cidade (id, nome, estado) VALUES (843, 'POTENGI', 6);
INSERT INTO cidade (id, nome, estado) VALUES (844, 'POTIRETAMA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (845, 'QUITERIANÓPOLIS', 6);
INSERT INTO cidade (id, nome, estado) VALUES (846, 'QUIXADÁ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (847, 'QUIXELÔ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (848, 'QUIXERAMOBIM', 6);
INSERT INTO cidade (id, nome, estado) VALUES (849, 'QUIXERÉ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (850, 'REDENÇÃO', 6);
INSERT INTO cidade (id, nome, estado) VALUES (851, 'RERIUTABA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (852, 'RUSSAS', 6);
INSERT INTO cidade (id, nome, estado) VALUES (853, 'SABOEIRO', 6);
INSERT INTO cidade (id, nome, estado) VALUES (854, 'SALITRE', 6);
INSERT INTO cidade (id, nome, estado) VALUES (855, 'SANTA QUITÉRIA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (856, 'SANTANA DO ACARAÚ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (857, 'SANTANA DO CARIRI', 6);
INSERT INTO cidade (id, nome, estado) VALUES (858, 'SÃO BENEDITO', 6);
INSERT INTO cidade (id, nome, estado) VALUES (859, 'SÃO GONÇALO DO AMARANTE', 6);
INSERT INTO cidade (id, nome, estado) VALUES (860, 'SÃO JOÃO DO JAGUARIBE', 6);
INSERT INTO cidade (id, nome, estado) VALUES (861, 'SÃO LUÍS DO CURU', 6);
INSERT INTO cidade (id, nome, estado) VALUES (862, 'SENADOR POMPEU', 6);
INSERT INTO cidade (id, nome, estado) VALUES (863, 'SENADOR SÁ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (864, 'SOBRAL', 6);
INSERT INTO cidade (id, nome, estado) VALUES (865, 'SOLONÓPOLE', 6);
INSERT INTO cidade (id, nome, estado) VALUES (866, 'TABULEIRO DO NORTE', 6);
INSERT INTO cidade (id, nome, estado) VALUES (867, 'TAMBORIL', 6);
INSERT INTO cidade (id, nome, estado) VALUES (868, 'TARRAFAS', 6);
INSERT INTO cidade (id, nome, estado) VALUES (869, 'TAUÁ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (870, 'TEJUÇUOCA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (871, 'TIANGUÁ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (872, 'TRAIRI', 6);
INSERT INTO cidade (id, nome, estado) VALUES (873, 'TURURU', 6);
INSERT INTO cidade (id, nome, estado) VALUES (874, 'UBAJARA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (875, 'UMARI', 6);
INSERT INTO cidade (id, nome, estado) VALUES (876, 'UMIRIM', 6);
INSERT INTO cidade (id, nome, estado) VALUES (877, 'URUBURETAMA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (878, 'URUOCA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (879, 'VARJOTA', 6);
INSERT INTO cidade (id, nome, estado) VALUES (880, 'VÁRZEA ALEGRE', 6);
INSERT INTO cidade (id, nome, estado) VALUES (881, 'VIÇOSA DO CEARÁ', 6);
INSERT INTO cidade (id, nome, estado) VALUES (882, 'BRASÍLIA', 7);
INSERT INTO cidade (id, nome, estado) VALUES (883, 'ABADIA DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (884, 'ABADIÂNIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (885, 'ACREÚNA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (886, 'ADELÂNDIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (887, 'ÁGUA FRIA DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (888, 'ÁGUA LIMPA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (889, 'ÁGUAS LINDAS DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (890, 'ALEXÂNIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (891, 'ALOÂNDIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (892, 'ALTO HORIZONTE', 9);
INSERT INTO cidade (id, nome, estado) VALUES (893, 'ALTO PARAÍSO DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (894, 'ALVORADA DO NORTE', 9);
INSERT INTO cidade (id, nome, estado) VALUES (895, 'AMARALINA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (896, 'AMERICANO DO BRASIL', 9);
INSERT INTO cidade (id, nome, estado) VALUES (897, 'AMORINÓPOLIS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (898, 'ANÁPOLIS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (899, 'ANHANGUERA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (900, 'ANICUNS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (901, 'APARECIDA DE GOIÂNIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (902, 'APARECIDA DO RIO DOCE', 9);
INSERT INTO cidade (id, nome, estado) VALUES (903, 'APORÉ', 9);
INSERT INTO cidade (id, nome, estado) VALUES (904, 'ARAÇU', 9);
INSERT INTO cidade (id, nome, estado) VALUES (905, 'ARAGARÇAS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (906, 'ARAGOIÂNIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (907, 'ARAGUAPAZ', 9);
INSERT INTO cidade (id, nome, estado) VALUES (908, 'ARENÓPOLIS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (909, 'ARUANÃ', 9);
INSERT INTO cidade (id, nome, estado) VALUES (910, 'AURILÂNDIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (911, 'AVELINÓPOLIS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (912, 'BALIZA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (913, 'BARRO ALTO', 9);
INSERT INTO cidade (id, nome, estado) VALUES (914, 'BELA VISTA DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (915, 'BOM JARDIM DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (916, 'BOM JESUS DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (917, 'BONFINÓPOLIS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (918, 'BONÓPOLIS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (919, 'BRAZABRANTES', 9);
INSERT INTO cidade (id, nome, estado) VALUES (920, 'BRITÂNIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (921, 'BURITI ALEGRE', 9);
INSERT INTO cidade (id, nome, estado) VALUES (922, 'BURITI DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (923, 'BURITINÓPOLIS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (924, 'CABECEIRAS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (925, 'CACHOEIRA ALTA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (926, 'CACHOEIRA DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (927, 'CACHOEIRA DOURADA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (928, 'CAÇU', 9);
INSERT INTO cidade (id, nome, estado) VALUES (929, 'CAIAPÔNIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (930, 'CALDAS NOVAS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (931, 'CALDAZINHA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (932, 'CAMPESTRE DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (933, 'CAMPINAÇU', 9);
INSERT INTO cidade (id, nome, estado) VALUES (934, 'CAMPINORTE', 9);
INSERT INTO cidade (id, nome, estado) VALUES (935, 'CAMPO ALEGRE DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (936, 'CAMPO LIMPO DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (937, 'CAMPOS BELOS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (938, 'CAMPOS VERDES', 9);
INSERT INTO cidade (id, nome, estado) VALUES (939, 'CARMO DO RIO VERDE', 9);
INSERT INTO cidade (id, nome, estado) VALUES (940, 'CASTELÂNDIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (941, 'CATALÃO', 9);
INSERT INTO cidade (id, nome, estado) VALUES (942, 'CATURAÍ', 9);
INSERT INTO cidade (id, nome, estado) VALUES (943, 'CAVALCANTE', 9);
INSERT INTO cidade (id, nome, estado) VALUES (944, 'CERES', 9);
INSERT INTO cidade (id, nome, estado) VALUES (945, 'CEZARINA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (946, 'CHAPADÃO DO CÉU', 9);
INSERT INTO cidade (id, nome, estado) VALUES (947, 'CIDADE OCIDENTAL', 9);
INSERT INTO cidade (id, nome, estado) VALUES (948, 'COCALZINHO DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (949, 'COLINAS DO SUL', 9);
INSERT INTO cidade (id, nome, estado) VALUES (950, 'CÓRREGO DO OURO', 9);
INSERT INTO cidade (id, nome, estado) VALUES (951, 'CORUMBÁ DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (952, 'CORUMBAÍBA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (953, 'CRISTALINA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (954, 'CRISTIANÓPOLIS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (955, 'CRIXÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (956, 'CROMÍNIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (957, 'CUMARI', 9);
INSERT INTO cidade (id, nome, estado) VALUES (958, 'DAMIANÓPOLIS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (959, 'DAMOLÂNDIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (960, 'DAVINÓPOLIS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (961, 'DIORAMA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (962, 'DIVINÓPOLIS DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (963, 'DOVERLÂNDIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (964, 'EDEALINA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (965, 'EDÉIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (966, 'ESTRELA DO NORTE', 9);
INSERT INTO cidade (id, nome, estado) VALUES (967, 'FAINA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (968, 'FAZENDA NOVA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (969, 'FIRMINÓPOLIS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (970, 'FLORES DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (971, 'FORMOSA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (972, 'FORMOSO', 9);
INSERT INTO cidade (id, nome, estado) VALUES (973, 'GAMELEIRA DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (974, 'GOIANÁPOLIS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (975, 'GOIANDIRA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (976, 'GOIANÉSIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (977, 'GOIÂNIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (978, 'GOIANIRA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (979, 'GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (980, 'GOIATUBA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (981, 'GOUVELÂNDIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (982, 'GUAPÓ', 9);
INSERT INTO cidade (id, nome, estado) VALUES (983, 'GUARAÍTA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (984, 'GUARANI DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (985, 'GUARINOS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (986, 'HEITORAÍ', 9);
INSERT INTO cidade (id, nome, estado) VALUES (987, 'HIDROLÂNDIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (988, 'HIDROLINA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (989, 'IACIARA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (990, 'INACIOLÂNDIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (991, 'INDIARA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (992, 'INHUMAS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (993, 'IPAMERI', 9);
INSERT INTO cidade (id, nome, estado) VALUES (994, 'IPIRANGA DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (995, 'IPORÁ', 9);
INSERT INTO cidade (id, nome, estado) VALUES (996, 'ISRAELÂNDIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (997, 'ITABERAÍ', 9);
INSERT INTO cidade (id, nome, estado) VALUES (998, 'ITAGUARI', 9);
INSERT INTO cidade (id, nome, estado) VALUES (999, 'ITAGUARU', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1000, 'ITAJÁ', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1001, 'ITAPACI', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1002, 'ITAPIRAPUÃ', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1003, 'ITAPURANGA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1004, 'ITARUMÃ', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1005, 'ITAUÇU', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1006, 'ITUMBIARA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1007, 'IVOLÂNDIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1008, 'JANDAIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1009, 'JARAGUÁ', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1010, 'JATAÍ', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1011, 'JAUPACI', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1012, 'JESÚPOLIS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1013, 'JOVIÂNIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1014, 'JUSSARA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1015, 'LAGOA SANTA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1016, 'LEOPOLDO DE BULHÕES', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1017, 'LUZIÂNIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1018, 'MAIRIPOTABA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1019, 'MAMBAÍ', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1020, 'MARA ROSA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1021, 'MARZAGÃO', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1022, 'MATRINCHÃ', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1023, 'MAURILÂNDIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1024, 'MIMOSO DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1025, 'MINAÇU', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1026, 'MINEIROS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1027, 'MOIPORÁ', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1028, 'MONTE ALEGRE DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1029, 'MONTES CLAROS DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1030, 'MONTIVIDIU', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1031, 'MONTIVIDIU DO NORTE', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1032, 'MORRINHOS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1033, 'MORRO AGUDO DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1034, 'MOSSÂMEDES', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1035, 'MOZARLÂNDIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1036, 'MUNDO NOVO', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1037, 'MUTUNÓPOLIS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1038, 'NAZÁRIO', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1039, 'NERÓPOLIS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1040, 'NIQUELÂNDIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1041, 'NOVA AMÉRICA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1042, 'NOVA AURORA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1043, 'NOVA CRIXÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1044, 'NOVA GLÓRIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1045, 'NOVA IGUAÇU DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1046, 'NOVA ROMA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1047, 'NOVA VENEZA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1048, 'NOVO BRASIL', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1049, 'NOVO GAMA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1050, 'NOVO PLANALTO', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1051, 'ORIZONA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1052, 'OURO VERDE DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1053, 'OUVIDOR', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1054, 'PADRE BERNARDO', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1055, 'PALESTINA DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1056, 'PALMEIRAS DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1057, 'PALMELO', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1058, 'PALMINÓPOLIS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1059, 'PANAMÁ', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1060, 'PARANAIGUARA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1061, 'PARAÚNA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1062, 'PEROLÂNDIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1063, 'PETROLINA DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1064, 'PILAR DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1065, 'PIRACANJUBA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1066, 'PIRANHAS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1067, 'PIRENÓPOLIS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1068, 'PIRES DO RIO', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1069, 'PLANALTINA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1070, 'PONTALINA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1071, 'PORANGATU', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1072, 'PORTEIRÃO', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1073, 'PORTELÂNDIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1074, 'POSSE', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1075, 'PROFESSOR JAMIL', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1076, 'QUIRINÓPOLIS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1077, 'RIALMA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1078, 'RIANÁPOLIS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1079, 'RIO QUENTE', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1080, 'RIO VERDE', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1081, 'RUBIATABA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1082, 'SANCLERLÂNDIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1083, 'SANTA BÁRBARA DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1084, 'SANTA CRUZ DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1085, 'SANTA FÉ DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1086, 'SANTA HELENA DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1087, 'SANTA ISABEL', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1088, 'SANTA RITA DO ARAGUAIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1089, 'SANTA RITA DO NOVO DESTINO', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1090, 'SANTA ROSA DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1091, 'SANTA TEREZA DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1092, 'SANTA TEREZINHA DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1093, 'SANTO ANTÔNIO DA BARRA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1094, 'SANTO ANTÔNIO DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1095, 'SANTO ANTÔNIO DO DESCOBERTO', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1096, 'SÃO DOMINGOS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1097, 'SÃO FRANCISCO DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1098, 'SÃO JOÃO D`ALIANÇA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1099, 'SÃO JOÃO DA PARAÚNA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1100, 'SÃO LUÍS DE MONTES BELOS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1101, 'SÃO LUÍZ DO NORTE', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1102, 'SÃO MIGUEL DO ARAGUAIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1103, 'SÃO MIGUEL DO PASSA QUATRO', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1104, 'SÃO PATRÍCIO', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1105, 'SÃO SIMÃO', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1106, 'SENADOR CANEDO', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1107, 'SERRANÓPOLIS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1108, 'SILVÂNIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1109, 'SIMOLÂNDIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1110, 'SÍTIO D`ABADIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1111, 'TAQUARAL DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1112, 'TERESINA DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1113, 'TEREZÓPOLIS DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1114, 'TRÊS RANCHOS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1115, 'TRINDADE', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1116, 'TROMBAS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1117, 'TURVÂNIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1118, 'TURVELÂNDIA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1119, 'UIRAPURU', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1120, 'URUAÇU', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1121, 'URUANA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1122, 'URUTAÍ', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1123, 'VALPARAÍSO DE GOIÁS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1124, 'VARJÃO', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1125, 'VIANÓPOLIS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1126, 'VICENTINÓPOLIS', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1127, 'VILA BOA', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1128, 'VILA PROPÍCIO', 9);
INSERT INTO cidade (id, nome, estado) VALUES (1129, 'AÇAILÂNDIA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1130, 'AFONSO CUNHA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1131, 'ÁGUA DOCE DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1132, 'ALCÂNTARA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1133, 'ALDEIAS ALTAS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1134, 'ALTAMIRA DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1135, 'ALTO ALEGRE DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1136, 'ALTO ALEGRE DO PINDARÉ', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1137, 'ALTO PARNAÍBA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1138, 'AMAPÁ DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1139, 'AMARANTE DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1140, 'ANAJATUBA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1141, 'ANAPURUS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1142, 'APICUM-AÇU', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1143, 'ARAGUANÃ', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1144, 'ARAIOSES', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1145, 'ARAME', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1146, 'ARARI', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1147, 'AXIXÁ', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1148, 'BACABAL', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1149, 'BACABEIRA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1150, 'BACURI', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1151, 'BACURITUBA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1152, 'BALSAS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1153, 'BARÃO DE GRAJAÚ', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1154, 'BARRA DO CORDA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1155, 'BARREIRINHAS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1156, 'BELA VISTA DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1157, 'BELÁGUA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1158, 'BENEDITO LEITE', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1159, 'BEQUIMÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1160, 'BERNARDO DO MEARIM', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1161, 'BOA VISTA DO GURUPI', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1162, 'BOM JARDIM', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1163, 'BOM JESUS DAS SELVAS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1164, 'BOM LUGAR', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1165, 'BREJO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1166, 'BREJO DE AREIA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1167, 'BURITI', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1168, 'BURITI BRAVO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1169, 'BURITICUPU', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1170, 'BURITIRANA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1171, 'CACHOEIRA GRANDE', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1172, 'CAJAPIÓ', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1173, 'CAJARI', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1174, 'CAMPESTRE DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1175, 'CÂNDIDO MENDES', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1176, 'CANTANHEDE', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1177, 'CAPINZAL DO NORTE', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1178, 'CAROLINA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1179, 'CARUTAPERA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1180, 'CAXIAS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1181, 'CEDRAL', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1182, 'CENTRAL DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1183, 'CENTRO DO GUILHERME', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1184, 'CENTRO NOVO DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1185, 'CHAPADINHA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1186, 'CIDELÂNDIA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1187, 'CODÓ', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1188, 'COELHO NETO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1189, 'COLINAS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1190, 'CONCEIÇÃO DO LAGO-AÇU', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1191, 'COROATÁ', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1192, 'CURURUPU', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1193, 'DAVINÓPOLIS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1194, 'DOM PEDRO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1195, 'DUQUE BACELAR', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1196, 'ESPERANTINÓPOLIS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1197, 'ESTREITO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1198, 'FEIRA NOVA DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1199, 'FERNANDO FALCÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1200, 'FORMOSA DA SERRA NEGRA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1201, 'FORTALEZA DOS NOGUEIRAS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1202, 'FORTUNA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1203, 'GODOFREDO VIANA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1204, 'GONÇALVES DIAS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1205, 'GOVERNADOR ARCHER', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1206, 'GOVERNADOR EDISON LOBÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1207, 'GOVERNADOR EUGÊNIO BARROS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1208, 'GOVERNADOR LUIZ ROCHA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1209, 'GOVERNADOR NEWTON BELLO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1210, 'GOVERNADOR NUNES FREIRE', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1211, 'GRAÇA ARANHA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1212, 'GRAJAÚ', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1213, 'GUIMARÃES', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1214, 'HUMBERTO DE CAMPOS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1215, 'ICATU', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1216, 'IGARAPÉ DO MEIO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1217, 'IGARAPÉ GRANDE', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1218, 'IMPERATRIZ', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1219, 'ITAIPAVA DO GRAJAÚ', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1220, 'ITAPECURU MIRIM', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1221, 'ITINGA DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1222, 'JATOBÁ', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1223, 'JENIPAPO DOS VIEIRAS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1224, 'JOÃO LISBOA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1225, 'JOSELÂNDIA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1226, 'JUNCO DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1227, 'LAGO DA PEDRA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1228, 'LAGO DO JUNCO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1229, 'LAGO DOS RODRIGUES', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1230, 'LAGO VERDE', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1231, 'LAGOA DO MATO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1232, 'LAGOA GRANDE DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1233, 'LAJEADO NOVO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1234, 'LIMA CAMPOS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1235, 'LORETO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1236, 'LUÍS DOMINGUES', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1237, 'MAGALHÃES DE ALMEIDA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1238, 'MARACAÇUMÉ', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1239, 'MARAJÁ DO SENA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1240, 'MARANHÃOZINHO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1241, 'MATA ROMA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1242, 'MATINHA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1243, 'MATÕES', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1244, 'MATÕES DO NORTE', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1245, 'MILAGRES DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1246, 'MIRADOR', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1247, 'MIRANDA DO NORTE', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1248, 'MIRINZAL', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1249, 'MONÇÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1250, 'MONTES ALTOS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1251, 'MORROS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1252, 'NINA RODRIGUES', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1253, 'NOVA COLINAS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1254, 'NOVA IORQUE', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1255, 'NOVA OLINDA DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1256, 'OLHO D`ÁGUA DAS CUNHÃS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1257, 'OLINDA NOVA DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1258, 'PAÇO DO LUMIAR', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1259, 'PALMEIRÂNDIA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1260, 'PARAIBANO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1261, 'PARNARAMA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1262, 'PASSAGEM FRANCA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1263, 'PASTOS BONS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1264, 'PAULINO NEVES', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1265, 'PAULO RAMOS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1266, 'PEDREIRAS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1267, 'PEDRO DO ROSÁRIO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1268, 'PENALVA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1269, 'PERI MIRIM', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1270, 'PERITORÓ', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1271, 'PINDARÉ-MIRIM', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1272, 'PINHEIRO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1273, 'PIO XII', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1274, 'PIRAPEMAS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1275, 'POÇÃO DE PEDRAS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1276, 'PORTO FRANCO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1277, 'PORTO RICO DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1278, 'PRESIDENTE DUTRA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1279, 'PRESIDENTE JUSCELINO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1280, 'PRESIDENTE MÉDICI', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1281, 'PRESIDENTE SARNEY', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1282, 'PRESIDENTE VARGAS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1283, 'PRIMEIRA CRUZ', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1284, 'RAPOSA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1285, 'RIACHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1286, 'RIBAMAR FIQUENE', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1287, 'ROSÁRIO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1288, 'SAMBAÍBA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1289, 'SANTA FILOMENA DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1290, 'SANTA HELENA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1291, 'SANTA INÊS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1292, 'SANTA LUZIA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1293, 'SANTA LUZIA DO PARUÁ', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1294, 'SANTA QUITÉRIA DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1295, 'SANTA RITA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1296, 'SANTANA DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1297, 'SANTO AMARO DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1298, 'SANTO ANTÔNIO DOS LOPES', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1299, 'SÃO BENEDITO DO RIO PRETO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1300, 'SÃO BENTO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1301, 'SÃO BERNARDO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1302, 'SÃO DOMINGOS DO AZEITÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1303, 'SÃO DOMINGOS DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1304, 'SÃO FÉLIX DE BALSAS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1305, 'SÃO FRANCISCO DO BREJÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1306, 'SÃO FRANCISCO DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1307, 'SÃO JOÃO BATISTA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1308, 'SÃO JOÃO DO CARÚ', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1309, 'SÃO JOÃO DO PARAÍSO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1310, 'SÃO JOÃO DO SOTER', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1311, 'SÃO JOÃO DOS PATOS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1312, 'SÃO JOSÉ DE RIBAMAR', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1313, 'SÃO JOSÉ DOS BASÍLIOS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1314, 'SÃO LUÍS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1315, 'SÃO LUÍS GONZAGA DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1316, 'SÃO MATEUS DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1317, 'SÃO PEDRO DA ÁGUA BRANCA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1318, 'SÃO PEDRO DOS CRENTES', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1319, 'SÃO RAIMUNDO DAS MANGABEIRAS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1320, 'SÃO RAIMUNDO DO DOCA BEZERRA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1321, 'SÃO ROBERTO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1322, 'SÃO VICENTE FERRER', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1323, 'SATUBINHA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1324, 'SENADOR ALEXANDRE COSTA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1325, 'SENADOR LA ROCQUE', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1326, 'SERRANO DO MARANHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1327, 'SÍTIO NOVO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1328, 'SUCUPIRA DO NORTE', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1329, 'SUCUPIRA DO RIACHÃO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1330, 'TASSO FRAGOSO', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1331, 'TIMBIRAS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1332, 'TIMON', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1333, 'TRIZIDELA DO VALE', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1334, 'TUFILÂNDIA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1335, 'TUNTUM', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1336, 'TURIAÇU', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1337, 'TURILÂNDIA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1338, 'TUTÓIA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1339, 'URBANO SANTOS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1340, 'VARGEM GRANDE', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1341, 'VIANA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1342, 'VILA NOVA DOS MARTÍRIOS', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1343, 'VITÓRIA DO MEARIM', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1344, 'VITORINO FREIRE', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1345, 'ZÉ DOCA', 10);
INSERT INTO cidade (id, nome, estado) VALUES (1346, 'ACORIZAL', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1347, 'ÁGUA BOA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1348, 'ALTA FLORESTA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1349, 'ALTO ARAGUAIA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1350, 'ALTO BOA VISTA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1351, 'ALTO GARÇAS', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1352, 'ALTO PARAGUAI', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1353, 'ALTO TAQUARI', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1354, 'APIACÁS', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1355, 'ARAGUAIANA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1356, 'ARAGUAINHA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1357, 'ARAPUTANGA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1358, 'ARENÁPOLIS', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1359, 'ARIPUANÃ', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1360, 'BARÃO DE MELGAÇO', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1361, 'BARRA DO BUGRES', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1362, 'BARRA DO GARÇAS', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1363, 'BOM JESUS DO ARAGUAIA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1364, 'BRASNORTE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1365, 'CÁCERES', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1366, 'CAMPINÁPOLIS', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1367, 'CAMPO NOVO DO PARECIS', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1368, 'CAMPO VERDE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1369, 'CAMPOS DE JÚLIO', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1370, 'CANABRAVA DO NORTE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1371, 'CANARANA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1372, 'CARLINDA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1373, 'CASTANHEIRA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1374, 'CHAPADA DOS GUIMARÃES', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1375, 'CLÁUDIA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1376, 'COCALINHO', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1377, 'COLÍDER', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1378, 'COLNIZA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1379, 'COMODORO', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1380, 'CONFRESA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1381, 'CONQUISTA D`OESTE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1382, 'COTRIGUAÇU', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1383, 'CUIABÁ', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1384, 'CURVELÂNDIA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1385, 'CURVELÂNDIA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1386, 'DENISE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1387, 'DIAMANTINO', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1388, 'DOM AQUINO', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1389, 'FELIZ NATAL', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1390, 'FIGUEIRÓPOLIS D`OESTE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1391, 'GAÚCHA DO NORTE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1392, 'GENERAL CARNEIRO', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1393, 'GLÓRIA D`OESTE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1394, 'GUARANTÃ DO NORTE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1395, 'GUIRATINGA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1396, 'INDIAVAÍ', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1397, 'IPIRANGA DO NORTE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1398, 'ITANHANGÁ', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1399, 'ITAÚBA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1400, 'ITIQUIRA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1401, 'JACIARA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1402, 'JANGADA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1403, 'JAURU', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1404, 'JUARA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1405, 'JUÍNA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1406, 'JURUENA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1407, 'JUSCIMEIRA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1408, 'LAMBARI D`OESTE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1409, 'LUCAS DO RIO VERDE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1410, 'LUCIÁRA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1411, 'MARCELÂNDIA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1412, 'MATUPÁ', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1413, 'MIRASSOL D`OESTE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1414, 'NOBRES', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1415, 'NORTELÂNDIA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1416, 'NOSSA SENHORA DO LIVRAMENTO', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1417, 'NOVA BANDEIRANTES', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1418, 'NOVA BRASILÂNDIA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1419, 'NOVA CANAÃ DO NORTE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1420, 'NOVA GUARITA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1421, 'NOVA LACERDA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1422, 'NOVA MARILÂNDIA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1423, 'NOVA MARINGÁ', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1424, 'NOVA MONTE VERDE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1425, 'NOVA MUTUM', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1426, 'NOVA OLÍMPIA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1427, 'NOVA SANTA HELENA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1428, 'NOVA UBIRATÃ', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1429, 'NOVA XAVANTINA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1430, 'NOVO HORIZONTE DO NORTE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1431, 'NOVO MUNDO', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1432, 'NOVO SANTO ANTÔNIO', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1433, 'NOVO SÃO JOAQUIM', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1434, 'PARANAÍTA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1435, 'PARANATINGA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1436, 'PEDRA PRETA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1437, 'PEIXOTO DE AZEVEDO', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1438, 'PLANALTO DA SERRA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1439, 'POCONÉ', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1440, 'PONTAL DO ARAGUAIA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1441, 'PONTE BRANCA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1442, 'PONTES E LACERDA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1443, 'PORTO ALEGRE DO NORTE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1444, 'PORTO DOS GAÚCHOS', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1445, 'PORTO ESPERIDIÃO', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1446, 'PORTO ESTRELA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1447, 'POXORÉO', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1448, 'PRIMAVERA DO LESTE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1449, 'QUERÊNCIA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1450, 'RESERVA DO CABAÇAL', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1451, 'RIBEIRÃO CASCALHEIRA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1452, 'RIBEIRÃOZINHO', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1453, 'RIO BRANCO', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1454, 'RONDOLÂNDIA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1455, 'RONDONÓPOLIS', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1456, 'ROSÁRIO OESTE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1457, 'SALTO DO CÉU', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1458, 'SANTA CARMEM', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1459, 'SANTA CRUZ DO XINGU', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1460, 'SANTA RITA DO TRIVELATO', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1461, 'SANTA TEREZINHA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1462, 'SANTO AFONSO', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1463, 'SANTO ANTÔNIO DO LESTE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1464, 'SANTO ANTÔNIO DO LEVERGER', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1465, 'SÃO FÉLIX DO ARAGUAIA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1466, 'SÃO JOSÉ DO POVO', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1467, 'SÃO JOSÉ DO RIO CLARO', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1468, 'SÃO JOSÉ DO XINGU', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1469, 'SÃO JOSÉ DOS QUATRO MARCOS', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1470, 'SÃO PEDRO DA CIPA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1471, 'SAPEZAL', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1472, 'SERRA NOVA DOURADA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1473, 'SINOP', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1474, 'SORRISO', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1475, 'TABAPORÃ', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1476, 'TANGARÁ DA SERRA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1477, 'TAPURAH', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1478, 'TERRA NOVA DO NORTE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1479, 'TESOURO', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1480, 'TORIXORÉU', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1481, 'UNIÃO DO SUL', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1482, 'VALE DE SÃO DOMINGOS', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1483, 'VÁRZEA GRANDE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1484, 'VERA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1485, 'VILA BELA DA SANTÍSSIMA TRINDADE', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1486, 'VILA RICA', 13);
INSERT INTO cidade (id, nome, estado) VALUES (1487, 'ÁGUA CLARA', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1488, 'ALCINÓPOLIS', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1489, 'AMAMBAÍ', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1490, 'ANASTÁCIO', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1491, 'ANAURILÂNDIA', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1492, 'ANGÉLICA', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1493, 'ANTÔNIO JOÃO', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1494, 'APARECIDA DO TABOADO', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1495, 'AQUIDAUANA', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1496, 'ARAL MOREIRA', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1497, 'BANDEIRANTES', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1498, 'BATAGUASSU', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1499, 'BATAIPORÃ', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1500, 'BELA VISTA', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1501, 'BODOQUENA', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1502, 'BONITO', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1503, 'BRASILÂNDIA', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1504, 'CAARAPÓ', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1505, 'CAMAPUÃ', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1506, 'CAMPO GRANDE', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1507, 'CARACOL', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1508, 'CASSILÂNDIA', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1509, 'CHAPADÃO DO SUL', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1510, 'CORGUINHO', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1511, 'CORONEL SAPUCAIA', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1512, 'CORUMBÁ', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1513, 'COSTA RICA', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1514, 'COXIM', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1515, 'DEODÁPOLIS', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1516, 'DOIS IRMÃOS DO BURITI', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1517, 'DOURADINA', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1518, 'DOURADOS', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1519, 'ELDORADO', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1520, 'FÁTIMA DO SUL', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1521, 'FIGUEIRÃO', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1522, 'GLÓRIA DE DOURADOS', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1523, 'GUIA LOPES DA LAGUNA', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1524, 'IGUATEMI', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1525, 'INOCÊNCIA', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1526, 'ITAPORÃ', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1527, 'ITAQUIRAÍ', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1528, 'IVINHEMA', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1529, 'JAPORÃ', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1530, 'JARAGUARI', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1531, 'JARDIM', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1532, 'JATEÍ', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1533, 'JUTI', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1534, 'LADÁRIO', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1535, 'LAGUNA CARAPÃ', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1536, 'MARACAJU', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1537, 'MIRANDA', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1538, 'MUNDO NOVO', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1539, 'NAVIRAÍ', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1540, 'NIOAQUE', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1541, 'NOVA ALVORADA DO SUL', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1542, 'NOVA ANDRADINA', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1543, 'NOVO HORIZONTE DO SUL', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1544, 'PARANAÍBA', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1545, 'PARANHOS', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1546, 'PEDRO GOMES', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1547, 'PONTA PORÃ', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1548, 'PORTO MURTINHO', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1549, 'RIBAS DO RIO PARDO', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1550, 'RIO BRILHANTE', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1551, 'RIO NEGRO', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1552, 'RIO VERDE DE MATO GROSSO', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1553, 'ROCHEDO', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1554, 'SANTA RITA DO PARDO', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1555, 'SÃO GABRIEL DO OESTE', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1556, 'SELVÍRIA', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1557, 'SETE QUEDAS', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1558, 'SIDROLÂNDIA', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1559, 'SONORA', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1560, 'TACURU', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1561, 'TAQUARUSSU', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1562, 'TERENOS', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1563, 'TRÊS LAGOAS', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1564, 'VICENTINA', 12);
INSERT INTO cidade (id, nome, estado) VALUES (1565, 'ABADIA DOS DOURADOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1566, 'ABAETÉ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1567, 'ABRE CAMPO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1568, 'ACAIACA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1569, 'AÇUCENA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1570, 'ÁGUA BOA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1571, 'ÁGUA COMPRIDA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1572, 'AGUANIL', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1573, 'ÁGUAS FORMOSAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1574, 'ÁGUAS VERMELHAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1575, 'AIMORÉS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1576, 'AIURUOCA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1577, 'ALAGOA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1578, 'ALBERTINA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1579, 'ALÉM PARAÍBA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1580, 'ALFENAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1581, 'ALFREDO VASCONCELOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1582, 'ALMENARA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1583, 'ALPERCATA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1584, 'ALPINÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1585, 'ALTEROSA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1586, 'ALTO CAPARAÓ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1587, 'ALTO JEQUITIBÁ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1588, 'ALTO RIO DOCE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1589, 'ALVARENGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1590, 'ALVINÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1591, 'ALVORADA DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1592, 'AMPARO DO SERRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1593, 'ANDRADAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1594, 'ANDRELÂNDIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1595, 'ANGELÂNDIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1596, 'ANTÔNIO CARLOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1597, 'ANTÔNIO DIAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1598, 'ANTÔNIO PRADO DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1599, 'ARAÇAÍ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1600, 'ARACITABA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1601, 'ARAÇUAÍ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1602, 'ARAGUARI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1603, 'ARANTINA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1604, 'ARAPONGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1605, 'ARAPORÃ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1606, 'ARAPUÁ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1607, 'ARAÚJOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1608, 'ARAXÁ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1609, 'ARCEBURGO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1610, 'ARCOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1611, 'AREADO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1612, 'ARGIRITA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1613, 'ARICANDUVA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1614, 'ARINOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1615, 'ASTOLFO DUTRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1616, 'ATALÉIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1617, 'AUGUSTO DE LIMA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1618, 'BAEPENDI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1619, 'BALDIM', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1620, 'BAMBUÍ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1621, 'BANDEIRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1622, 'BANDEIRA DO SUL', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1623, 'BARÃO DE COCAIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1624, 'BARÃO DE MONTE ALTO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1625, 'BARBACENA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1626, 'BARRA LONGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1627, 'BARROSO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1628, 'BELA VISTA DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1629, 'BELMIRO BRAGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1630, 'BELO HORIZONTE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1631, 'BELO ORIENTE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1632, 'BELO VALE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1633, 'BERILO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1634, 'BERIZAL', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1635, 'BERTÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1636, 'BETIM', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1637, 'BIAS FORTES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1638, 'BICAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1639, 'BIQUINHAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1640, 'BOA ESPERANÇA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1641, 'BOCAINA DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1642, 'BOCAIÚVA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1643, 'BOM DESPACHO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1644, 'BOM JARDIM DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1645, 'BOM JESUS DA PENHA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1646, 'BOM JESUS DO AMPARO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1647, 'BOM JESUS DO GALHO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1648, 'BOM REPOUSO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1649, 'BOM SUCESSO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1650, 'BONFIM', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1651, 'BONFINÓPOLIS DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1652, 'BONITO DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1653, 'BORDA DA MATA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1654, 'BOTELHOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1655, 'BOTUMIRIM', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1656, 'BRÁS PIRES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1657, 'BRASILÂNDIA DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1658, 'BRASÍLIA DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1659, 'BRASÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1660, 'BRAÚNAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1661, 'BRUMADINHO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1662, 'BUENO BRANDÃO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1663, 'BUENÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1664, 'BUGRE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1665, 'BURITIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1666, 'BURITIZEIRO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1667, 'CABECEIRA GRANDE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1668, 'CABO VERDE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1669, 'CACHOEIRA DA PRATA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1670, 'CACHOEIRA DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1671, 'CACHOEIRA DE PAJEÚ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1672, 'CACHOEIRA DOURADA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1673, 'CAETANÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1674, 'CAETÉ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1675, 'CAIANA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1676, 'CAJURI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1677, 'CALDAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1678, 'CAMACHO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1679, 'CAMANDUCAIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1680, 'CAMBUÍ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1681, 'CAMBUQUIRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1682, 'CAMPANÁRIO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1683, 'CAMPANHA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1684, 'CAMPESTRE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1685, 'CAMPINA VERDE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1686, 'CAMPO AZUL', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1687, 'CAMPO BELO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1688, 'CAMPO DO MEIO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1689, 'CAMPO FLORIDO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1690, 'CAMPOS ALTOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1691, 'CAMPOS GERAIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1692, 'CANA VERDE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1693, 'CANAÃ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1694, 'CANÁPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1695, 'CANDEIAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1696, 'CANTAGALO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1697, 'CAPARAÓ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1698, 'CAPELA NOVA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1699, 'CAPELINHA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1700, 'CAPETINGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1701, 'CAPIM BRANCO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1702, 'CAPINÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1703, 'CAPITÃO ANDRADE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1704, 'CAPITÃO ENÉAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1705, 'CAPITÓLIO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1706, 'CAPUTIRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1707, 'CARAÍ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1708, 'CARANAÍBA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1709, 'CARANDAÍ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1710, 'CARANGOLA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1711, 'CARATINGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1712, 'CARBONITA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1713, 'CAREAÇU', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1714, 'CARLOS CHAGAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1715, 'CARMÉSIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1716, 'CARMO DA CACHOEIRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1717, 'CARMO DA MATA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1718, 'CARMO DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1719, 'CARMO DO CAJURU', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1720, 'CARMO DO PARANAÍBA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1721, 'CARMO DO RIO CLARO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1722, 'CARMÓPOLIS DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1723, 'CARNEIRINHO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1724, 'CARRANCAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1725, 'CARVALHÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1726, 'CARVALHOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1727, 'CASA GRANDE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1728, 'CASCALHO RICO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1729, 'CÁSSIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1730, 'CATAGUASES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1731, 'CATAS ALTAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1732, 'CATAS ALTAS DA NORUEGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1733, 'CATUJI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1734, 'CATUTI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1735, 'CAXAMBU', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1736, 'CEDRO DO ABAETÉ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1737, 'CENTRAL DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1738, 'CENTRALINA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1739, 'CHÁCARA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1740, 'CHALÉ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1741, 'CHAPADA DO NORTE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1742, 'CHAPADA GAÚCHA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1743, 'CHIADOR', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1744, 'CIPOTÂNEA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1745, 'CLARAVAL', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1746, 'CLARO DOS POÇÕES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1747, 'CLÁUDIO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1748, 'COIMBRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1749, 'COLUNA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1750, 'COMENDADOR GOMES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1751, 'COMERCINHO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1752, 'CONCEIÇÃO DA APARECIDA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1753, 'CONCEIÇÃO DA BARRA DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1754, 'CONCEIÇÃO DAS ALAGOAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1755, 'CONCEIÇÃO DAS PEDRAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1756, 'CONCEIÇÃO DE IPANEMA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1757, 'CONCEIÇÃO DO MATO DENTRO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1758, 'CONCEIÇÃO DO PARÁ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1759, 'CONCEIÇÃO DO RIO VERDE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1760, 'CONCEIÇÃO DOS OUROS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1761, 'CÔNEGO MARINHO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1762, 'CONFINS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1763, 'CONGONHAL', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1764, 'CONGONHAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1765, 'CONGONHAS DO NORTE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1766, 'CONQUISTA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1767, 'CONSELHEIRO LAFAIETE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1768, 'CONSELHEIRO PENA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1769, 'CONSOLAÇÃO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1770, 'CONTAGEM', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1771, 'COQUEIRAL', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1772, 'CORAÇÃO DE JESUS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1773, 'CORDISBURGO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1774, 'CORDISLÂNDIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1775, 'CORINTO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1776, 'COROACI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1777, 'COROMANDEL', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1778, 'CORONEL FABRICIANO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1779, 'CORONEL MURTA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1780, 'CORONEL PACHECO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1781, 'CORONEL XAVIER CHAVES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1782, 'CÓRREGO DANTA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1783, 'CÓRREGO DO BOM JESUS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1784, 'CÓRREGO FUNDO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1785, 'CÓRREGO NOVO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1786, 'COUTO DE MAGALHÃES DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1787, 'CRISÓLITA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1788, 'CRISTAIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1789, 'CRISTÁLIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1790, 'CRISTIANO OTONI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1791, 'CRISTINA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1792, 'CRUCILÂNDIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1793, 'CRUZEIRO DA FORTALEZA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1794, 'CRUZÍLIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1795, 'CUPARAQUE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1796, 'CURRAL DE DENTRO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1797, 'CURVELO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1798, 'DATAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1799, 'DELFIM MOREIRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1800, 'DELFINÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1801, 'DELTA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1802, 'DESCOBERTO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1803, 'DESTERRO DE ENTRE RIOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1804, 'DESTERRO DO MELO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1805, 'DIAMANTINA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1806, 'DIOGO DE VASCONCELOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1807, 'DIONÍSIO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1808, 'DIVINÉSIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1809, 'DIVINO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1810, 'DIVINO DAS LARANJEIRAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1811, 'DIVINOLÂNDIA DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1812, 'DIVINÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1813, 'DIVISA ALEGRE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1814, 'DIVISA NOVA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1815, 'DIVISÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1816, 'DOM BOSCO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1817, 'DOM CAVATI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1818, 'DOM JOAQUIM', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1819, 'DOM SILVÉRIO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1820, 'DOM VIÇOSO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1821, 'DONA EUSÉBIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1822, 'DORES DE CAMPOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1823, 'DORES DE GUANHÃES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1824, 'DORES DO INDAIÁ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1825, 'DORES DO TURVO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1826, 'DORESÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1827, 'DOURADOQUARA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1828, 'DURANDÉ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1829, 'ELÓI MENDES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1830, 'ENGENHEIRO CALDAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1831, 'ENGENHEIRO NAVARRO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1832, 'ENTRE FOLHAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1833, 'ENTRE RIOS DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1834, 'ERVÁLIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1835, 'ESMERALDAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1836, 'ESPERA FELIZ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1837, 'ESPINOSA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1838, 'ESPÍRITO SANTO DO DOURADO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1839, 'ESTIVA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1840, 'ESTRELA DALVA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1841, 'ESTRELA DO INDAIÁ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1842, 'ESTRELA DO SUL', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1843, 'EUGENÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1844, 'EWBANK DA CÂMARA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1845, 'EXTREMA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1846, 'FAMA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1847, 'FARIA LEMOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1848, 'FELÍCIO DOS SANTOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1849, 'FELISBURGO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1850, 'FELIXLÂNDIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1851, 'FERNANDES TOURINHO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1852, 'FERROS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1853, 'FERVEDOURO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1854, 'FLORESTAL', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1855, 'FORMIGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1856, 'FORMOSO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1857, 'FORTALEZA DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1858, 'FORTUNA DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1859, 'FRANCISCO BADARÓ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1860, 'FRANCISCO DUMONT', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1861, 'FRANCISCO SÁ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1862, 'FRANCISCÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1863, 'FREI GASPAR', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1864, 'FREI INOCÊNCIO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1865, 'FREI LAGONEGRO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1866, 'FRONTEIRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1867, 'FRONTEIRA DOS VALES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1868, 'FRUTA DE LEITE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1869, 'FRUTAL', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1870, 'FUNILÂNDIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1871, 'GALILÉIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1872, 'GAMELEIRAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1873, 'GLAUCILÂNDIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1874, 'GOIABEIRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1875, 'GOIANÁ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1876, 'GONÇALVES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1877, 'GONZAGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1878, 'GOUVEIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1879, 'GOVERNADOR VALADARES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1880, 'GRÃO MOGOL', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1881, 'GRUPIARA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1882, 'GUANHÃES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1883, 'GUAPÉ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1884, 'GUARACIABA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1885, 'GUARACIAMA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1886, 'GUARANÉSIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1887, 'GUARANI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1888, 'GUARARÁ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1889, 'GUARDA-MOR', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1890, 'GUAXUPÉ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1891, 'GUIDOVAL', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1892, 'GUIMARÂNIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1893, 'GUIRICEMA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1894, 'GURINHATÃ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1895, 'HELIODORA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1896, 'IAPU', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1897, 'IBERTIOGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1898, 'IBIÁ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1899, 'IBIAÍ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1900, 'IBIRACATU', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1901, 'IBIRACI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1902, 'IBIRITÉ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1903, 'IBITIÚRA DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1904, 'IBITURUNA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1905, 'ICARAÍ DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1906, 'IGARAPÉ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1907, 'IGARATINGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1908, 'IGUATAMA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1909, 'IJACI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1910, 'ILICÍNEA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1911, 'IMBÉ DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1912, 'INCONFIDENTES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1913, 'INDAIABIRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1914, 'INDIANÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1915, 'INGAÍ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1916, 'INHAPIM', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1917, 'INHAÚMA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1918, 'INIMUTABA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1919, 'IPABA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1920, 'IPANEMA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1921, 'IPATINGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1922, 'IPIAÇU', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1923, 'IPUIÚNA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1924, 'IRAÍ DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1925, 'ITABIRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1926, 'ITABIRINHA DE MANTENA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1927, 'ITABIRITO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1928, 'ITACAMBIRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1929, 'ITACARAMBI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1930, 'ITAGUARA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1931, 'ITAIPÉ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1932, 'ITAJUBÁ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1933, 'ITAMARANDIBA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1934, 'ITAMARATI DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1935, 'ITAMBACURI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1936, 'ITAMBÉ DO MATO DENTRO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1937, 'ITAMOGI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1938, 'ITAMONTE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1939, 'ITANHANDU', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1940, 'ITANHOMI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1941, 'ITAOBIM', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1942, 'ITAPAGIPE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1943, 'ITAPECERICA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1944, 'ITAPEVA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1945, 'ITATIAIUÇU', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1946, 'ITAÚ DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1947, 'ITAÚNA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1948, 'ITAVERAVA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1949, 'ITINGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1950, 'ITUETA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1951, 'ITUIUTABA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1952, 'ITUMIRIM', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1953, 'ITURAMA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1954, 'ITUTINGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1955, 'JABOTICATUBAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1956, 'JACINTO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1957, 'JACUÍ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1958, 'JACUTINGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1959, 'JAGUARAÇU', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1960, 'JAÍBA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1961, 'JAMPRUCA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1962, 'JANAÚBA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1963, 'JANUÁRIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1964, 'JAPARAÍBA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1965, 'JAPONVAR', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1966, 'JECEABA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1967, 'JENIPAPO DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1968, 'JEQUERI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1969, 'JEQUITAÍ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1970, 'JEQUITIBÁ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1971, 'JEQUITINHONHA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1972, 'JESUÂNIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1973, 'JOAÍMA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1974, 'JOANÉSIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1975, 'JOÃO MONLEVADE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1976, 'JOÃO PINHEIRO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1977, 'JOAQUIM FELÍCIO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1978, 'JORDÂNIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1979, 'JOSÉ GONÇALVES DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1980, 'JOSÉ RAYDAN', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1981, 'JOSENÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1982, 'JUATUBA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1983, 'JUIZ DE FORA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1984, 'JURAMENTO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1985, 'JURUAIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1986, 'JUVENÍLIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1987, 'LADAINHA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1988, 'LAGAMAR', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1989, 'LAGOA DA PRATA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1990, 'LAGOA DOS PATOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1991, 'LAGOA DOURADA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1992, 'LAGOA FORMOSA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1993, 'LAGOA GRANDE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1994, 'LAGOA SANTA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1995, 'LAJINHA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1996, 'LAMBARI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1997, 'LAMIM', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1998, 'LARANJAL', 11);
INSERT INTO cidade (id, nome, estado) VALUES (1999, 'LASSANCE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2000, 'LAVRAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2001, 'LEANDRO FERREIRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2002, 'LEME DO PRADO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2003, 'LEOPOLDINA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2004, 'LIBERDADE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2005, 'LIMA DUARTE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2006, 'LIMEIRA DO OESTE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2007, 'LONTRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2008, 'LUISBURGO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2009, 'LUISLÂNDIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2010, 'LUMINÁRIAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2011, 'LUZ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2012, 'MACHACALIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2013, 'MACHADO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2014, 'MADRE DE DEUS DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2015, 'MALACACHETA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2016, 'MAMONAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2017, 'MANGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2018, 'MANHUAÇU', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2019, 'MANHUMIRIM', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2020, 'MANTENA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2021, 'MAR DE ESPANHA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2022, 'MARAVILHAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2023, 'MARIA DA FÉ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2024, 'MARIANA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2025, 'MARILAC', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2026, 'MÁRIO CAMPOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2027, 'MARIPÁ DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2028, 'MARLIÉRIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2029, 'MARMELÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2030, 'MARTINHO CAMPOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2031, 'MARTINS SOARES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2032, 'MATA VERDE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2033, 'MATERLÂNDIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2034, 'MATEUS LEME', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2035, 'MATHIAS LOBATO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2036, 'MATIAS BARBOSA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2037, 'MATIAS CARDOSO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2038, 'MATIPÓ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2039, 'MATO VERDE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2040, 'MATOZINHOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2041, 'MATUTINA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2042, 'MEDEIROS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2043, 'MEDINA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2044, 'MENDES PIMENTEL', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2045, 'MERCÊS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2046, 'MESQUITA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2047, 'MINAS NOVAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2048, 'MINDURI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2049, 'MIRABELA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2050, 'MIRADOURO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2051, 'MIRAÍ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2052, 'MIRAVÂNIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2053, 'MOEDA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2054, 'MOEMA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2055, 'MONJOLOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2056, 'MONSENHOR PAULO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2057, 'MONTALVÂNIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2058, 'MONTE ALEGRE DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2059, 'MONTE AZUL', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2060, 'MONTE BELO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2061, 'MONTE CARMELO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2062, 'MONTE FORMOSO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2063, 'MONTE SANTO DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2064, 'MONTE SIÃO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2065, 'MONTES CLAROS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2066, 'MONTEZUMA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2067, 'MORADA NOVA DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2068, 'MORRO DA GARÇA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2069, 'MORRO DO PILAR', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2070, 'MUNHOZ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2071, 'MURIAÉ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2072, 'MUTUM', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2073, 'MUZAMBINHO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2074, 'NACIP RAYDAN', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2075, 'NANUQUE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2076, 'NAQUE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2077, 'NATALÂNDIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2078, 'NATÉRCIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2079, 'NAZARENO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2080, 'NEPOMUCENO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2081, 'NINHEIRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2082, 'NOVA BELÉM', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2083, 'NOVA ERA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2084, 'NOVA LIMA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2085, 'NOVA MÓDICA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2086, 'NOVA PONTE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2087, 'NOVA PORTEIRINHA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2088, 'NOVA RESENDE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2089, 'NOVA SERRANA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2090, 'NOVA UNIÃO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2091, 'NOVO CRUZEIRO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2092, 'NOVO ORIENTE DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2093, 'NOVORIZONTE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2094, 'OLARIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2095, 'OLHOS-D`ÁGUA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2096, 'OLÍMPIO NORONHA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2097, 'OLIVEIRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2098, 'OLIVEIRA FORTES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2099, 'ONÇA DE PITANGUI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2100, 'ORATÓRIOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2101, 'ORIZÂNIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2102, 'OURO BRANCO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2103, 'OURO FINO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2104, 'OURO PRETO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2105, 'OURO VERDE DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2106, 'PADRE CARVALHO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2107, 'PADRE PARAÍSO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2108, 'PAI PEDRO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2109, 'PAINEIRAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2110, 'PAINS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2111, 'PAIVA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2112, 'PALMA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2113, 'PALMÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2114, 'PAPAGAIOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2115, 'PARÁ DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2116, 'PARACATU', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2117, 'PARAGUAÇU', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2118, 'PARAISÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2119, 'PARAOPEBA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2120, 'PASSA QUATRO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2121, 'PASSA TEMPO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2122, 'PASSABÉM', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2123, 'PASSA-VINTE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2124, 'PASSOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2125, 'PATIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2126, 'PATOS DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2127, 'PATROCÍNIO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2128, 'PATROCÍNIO DO MURIAÉ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2129, 'PAULA CÂNDIDO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2130, 'PAULISTAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2131, 'PAVÃO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2132, 'PEÇANHA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2133, 'PEDRA AZUL', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2134, 'PEDRA BONITA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2135, 'PEDRA DO ANTA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2136, 'PEDRA DO INDAIÁ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2137, 'PEDRA DOURADA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2138, 'PEDRALVA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2139, 'PEDRAS DE MARIA DA CRUZ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2140, 'PEDRINÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2141, 'PEDRO LEOPOLDO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2142, 'PEDRO TEIXEIRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2143, 'PEQUERI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2144, 'PEQUI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2145, 'PERDIGÃO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2146, 'PERDIZES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2147, 'PERDÕES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2148, 'PERIQUITO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2149, 'PESCADOR', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2150, 'PIAU', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2151, 'PIEDADE DE CARATINGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2152, 'PIEDADE DE PONTE NOVA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2153, 'PIEDADE DO RIO GRANDE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2154, 'PIEDADE DOS GERAIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2155, 'PIMENTA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2156, 'PINGO-D`ÁGUA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2157, 'PINTÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2158, 'PIRACEMA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2159, 'PIRAJUBA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2160, 'PIRANGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2161, 'PIRANGUÇU', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2162, 'PIRANGUINHO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2163, 'PIRAPETINGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2164, 'PIRAPORA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2165, 'PIRAÚBA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2166, 'PITANGUI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2167, 'PIUMHI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2168, 'PLANURA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2169, 'POÇO FUNDO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2170, 'POÇOS DE CALDAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2171, 'POCRANE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2172, 'POMPÉU', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2173, 'PONTE NOVA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2174, 'PONTO CHIQUE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2175, 'PONTO DOS VOLANTES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2176, 'PORTEIRINHA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2177, 'PORTO FIRME', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2178, 'POTÉ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2179, 'POUSO ALEGRE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2180, 'POUSO ALTO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2181, 'PRADOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2182, 'PRATA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2183, 'PRATÁPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2184, 'PRATINHA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2185, 'PRESIDENTE BERNARDES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2186, 'PRESIDENTE JUSCELINO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2187, 'PRESIDENTE KUBITSCHEK', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2188, 'PRESIDENTE OLEGÁRIO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2189, 'PRUDENTE DE MORAIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2190, 'QUARTEL GERAL', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2191, 'QUELUZITO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2192, 'RAPOSOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2193, 'RAUL SOARES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2194, 'RECREIO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2195, 'REDUTO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2196, 'RESENDE COSTA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2197, 'RESPLENDOR', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2198, 'RESSAQUINHA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2199, 'RIACHINHO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2200, 'RIACHO DOS MACHADOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2201, 'RIBEIRÃO DAS NEVES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2202, 'RIBEIRÃO VERMELHO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2203, 'RIO ACIMA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2204, 'RIO CASCA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2205, 'RIO DO PRADO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2206, 'RIO DOCE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2207, 'RIO ESPERA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2208, 'RIO MANSO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2209, 'RIO NOVO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2210, 'RIO PARANAÍBA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2211, 'RIO PARDO DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2212, 'RIO PIRACICABA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2213, 'RIO POMBA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2214, 'RIO PRETO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2215, 'RIO VERMELHO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2216, 'RITÁPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2217, 'ROCHEDO DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2218, 'RODEIRO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2219, 'ROMARIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2220, 'ROSÁRIO DA LIMEIRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2221, 'RUBELITA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2222, 'RUBIM', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2223, 'SABARÁ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2224, 'SABINÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2225, 'SACRAMENTO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2226, 'SALINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2227, 'SALTO DA DIVISA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2228, 'SANTA BÁRBARA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2229, 'SANTA BÁRBARA DO LESTE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2230, 'SANTA BÁRBARA DO MONTE VERDE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2231, 'SANTA BÁRBARA DO TUGÚRIO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2232, 'SANTA CRUZ DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2233, 'SANTA CRUZ DE SALINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2234, 'SANTA CRUZ DO ESCALVADO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2235, 'SANTA EFIGÊNIA DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2236, 'SANTA FÉ DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2237, 'SANTA HELENA DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2238, 'SANTA JULIANA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2239, 'SANTA LUZIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2240, 'SANTA MARGARIDA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2241, 'SANTA MARIA DE ITABIRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2242, 'SANTA MARIA DO SALTO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2243, 'SANTA MARIA DO SUAÇUÍ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2244, 'SANTA RITA DE CALDAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2245, 'SANTA RITA DE IBITIPOCA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2246, 'SANTA RITA DE JACUTINGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2247, 'SANTA RITA DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2248, 'SANTA RITA DO ITUETO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2249, 'SANTA RITA DO SAPUCAÍ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2250, 'SANTA ROSA DA SERRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2251, 'SANTA VITÓRIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2252, 'SANTANA DA VARGEM', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2253, 'SANTANA DE CATAGUASES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2254, 'SANTANA DE PIRAPAMA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2255, 'SANTANA DO DESERTO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2256, 'SANTANA DO GARAMBÉU', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2257, 'SANTANA DO JACARÉ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2258, 'SANTANA DO MANHUAÇU', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2259, 'SANTANA DO PARAÍSO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2260, 'SANTANA DO RIACHO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2261, 'SANTANA DOS MONTES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2262, 'SANTO ANTÔNIO DO AMPARO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2263, 'SANTO ANTÔNIO DO AVENTUREIRO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2264, 'SANTO ANTÔNIO DO GRAMA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2265, 'SANTO ANTÔNIO DO ITAMBÉ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2266, 'SANTO ANTÔNIO DO JACINTO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2267, 'SANTO ANTÔNIO DO MONTE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2268, 'SANTO ANTÔNIO DO RETIRO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2269, 'SANTO ANTÔNIO DO RIO ABAIXO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2270, 'SANTO HIPÓLITO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2271, 'SANTOS DUMONT', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2272, 'SÃO BENTO ABADE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2273, 'SÃO BRÁS DO SUAÇUÍ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2274, 'SÃO DOMINGOS DAS DORES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2275, 'SÃO DOMINGOS DO PRATA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2276, 'SÃO FÉLIX DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2277, 'SÃO FRANCISCO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2278, 'SÃO FRANCISCO DE PAULA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2279, 'SÃO FRANCISCO DE SALES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2280, 'SÃO FRANCISCO DO GLÓRIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2281, 'SÃO GERALDO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2282, 'SÃO GERALDO DA PIEDADE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2283, 'SÃO GERALDO DO BAIXIO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2284, 'SÃO GONÇALO DO ABAETÉ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2285, 'SÃO GONÇALO DO PARÁ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2286, 'SÃO GONÇALO DO RIO ABAIXO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2287, 'SÃO GONÇALO DO RIO PRETO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2288, 'SÃO GONÇALO DO SAPUCAÍ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2289, 'SÃO GOTARDO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2290, 'SÃO JOÃO BATISTA DO GLÓRIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2291, 'SÃO JOÃO DA LAGOA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2292, 'SÃO JOÃO DA MATA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2293, 'SÃO JOÃO DA PONTE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2294, 'SÃO JOÃO DAS MISSÕES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2295, 'SÃO JOÃO DEL REI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2296, 'SÃO JOÃO DO MANHUAÇU', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2297, 'SÃO JOÃO DO MANTENINHA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2298, 'SÃO JOÃO DO ORIENTE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2299, 'SÃO JOÃO DO PACUÍ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2300, 'SÃO JOÃO DO PARAÍSO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2301, 'SÃO JOÃO EVANGELISTA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2302, 'SÃO JOÃO NEPOMUCENO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2303, 'SÃO JOAQUIM DE BICAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2304, 'SÃO JOSÉ DA BARRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2305, 'SÃO JOSÉ DA LAPA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2306, 'SÃO JOSÉ DA SAFIRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2307, 'SÃO JOSÉ DA VARGINHA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2308, 'SÃO JOSÉ DO ALEGRE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2309, 'SÃO JOSÉ DO DIVINO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2310, 'SÃO JOSÉ DO GOIABAL', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2311, 'SÃO JOSÉ DO JACURI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2312, 'SÃO JOSÉ DO MANTIMENTO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2313, 'SÃO LOURENÇO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2314, 'SÃO MIGUEL DO ANTA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2315, 'SÃO PEDRO DA UNIÃO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2316, 'SÃO PEDRO DO SUAÇUÍ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2317, 'SÃO PEDRO DOS FERROS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2318, 'SÃO ROMÃO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2319, 'SÃO ROQUE DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2320, 'SÃO SEBASTIÃO DA BELA VISTA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2321, 'SÃO SEBASTIÃO DA VARGEM ALEGRE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2322, 'SÃO SEBASTIÃO DO ANTA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2323, 'SÃO SEBASTIÃO DO MARANHÃO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2324, 'SÃO SEBASTIÃO DO OESTE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2325, 'SÃO SEBASTIÃO DO PARAÍSO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2326, 'SÃO SEBASTIÃO DO RIO PRETO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2327, 'SÃO SEBASTIÃO DO RIO VERDE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2328, 'SÃO THOMÉ DAS LETRAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2329, 'SÃO TIAGO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2330, 'SÃO TOMÁS DE AQUINO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2331, 'SÃO VICENTE DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2332, 'SAPUCAÍ-MIRIM', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2333, 'SARDOÁ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2334, 'SARZEDO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2335, 'SEM-PEIXE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2336, 'SENADOR AMARAL', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2337, 'SENADOR CORTES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2338, 'SENADOR FIRMINO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2339, 'SENADOR JOSÉ BENTO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2340, 'SENADOR MODESTINO GONÇALVES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2341, 'SENHORA DE OLIVEIRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2342, 'SENHORA DO PORTO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2343, 'SENHORA DOS REMÉDIOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2344, 'SERICITA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2345, 'SERITINGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2346, 'SERRA AZUL DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2347, 'SERRA DA SAUDADE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2348, 'SERRA DO SALITRE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2349, 'SERRA DOS AIMORÉS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2350, 'SERRANIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2351, 'SERRANÓPOLIS DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2352, 'SERRANOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2353, 'SERRO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2354, 'SETE LAGOAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2355, 'SETUBINHA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2356, 'SILVEIRÂNIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2357, 'SILVIANÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2358, 'SIMÃO PEREIRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2359, 'SIMONÉSIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2360, 'SOBRÁLIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2361, 'SOLEDADE DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2362, 'TABULEIRO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2363, 'TAIOBEIRAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2364, 'TAPARUBA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2365, 'TAPIRA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2366, 'TAPIRAÍ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2367, 'TAQUARAÇU DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2368, 'TARUMIRIM', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2369, 'TEIXEIRAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2370, 'TEÓFILO OTONI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2371, 'TIMÓTEO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2372, 'TIRADENTES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2373, 'TIROS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2374, 'TOCANTINS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2375, 'TOCOS DO MOJI', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2376, 'TOLEDO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2377, 'TOMBOS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2378, 'TRÊS CORAÇÕES', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2379, 'TRÊS MARIAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2380, 'TRÊS PONTAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2381, 'TUMIRITINGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2382, 'TUPACIGUARA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2383, 'TURMALINA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2384, 'TURVOLÂNDIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2385, 'UBÁ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2386, 'UBAÍ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2387, 'UBAPORANGA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2388, 'UBERABA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2389, 'UBERLÂNDIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2390, 'UMBURATIBA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2391, 'UNAÍ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2392, 'UNIÃO DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2393, 'URUANA DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2394, 'URUCÂNIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2395, 'URUCUIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2396, 'VARGEM ALEGRE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2397, 'VARGEM BONITA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2398, 'VARGEM GRANDE DO RIO PARDO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2399, 'VARGINHA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2400, 'VARJÃO DE MINAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2401, 'VÁRZEA DA PALMA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2402, 'VARZELÂNDIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2403, 'VAZANTE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2404, 'VERDELÂNDIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2405, 'VEREDINHA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2406, 'VERÍSSIMO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2407, 'VERMELHO NOVO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2408, 'VESPASIANO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2409, 'VIÇOSA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2410, 'VIEIRAS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2411, 'VIRGEM DA LAPA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2412, 'VIRGÍNIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2413, 'VIRGINÓPOLIS', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2414, 'VIRGOLÂNDIA', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2415, 'VISCONDE DO RIO BRANCO', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2416, 'VOLTA GRANDE', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2417, 'WENCESLAU BRAZ', 11);
INSERT INTO cidade (id, nome, estado) VALUES (2418, 'ABAETETUBA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2419, 'ABEL FIGUEIREDO', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2420, 'ACARÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2421, 'AFUÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2422, 'ÁGUA AZUL DO NORTE', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2423, 'ALENQUER', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2424, 'ALMEIRIM', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2425, 'ALTAMIRA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2426, 'ANAJÁS', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2427, 'ANANINDEUA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2428, 'ANAPU', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2429, 'AUGUSTO CORRÊA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2430, 'AURORA DO PARÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2431, 'AVEIRO', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2432, 'BAGRE', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2433, 'BAIÃO', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2434, 'BANNACH', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2435, 'BARCARENA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2436, 'BELÉM', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2437, 'BELTERRA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2438, 'BENEVIDES', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2439, 'BOM JESUS DO TOCANTINS', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2440, 'BONITO', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2441, 'BRAGANÇA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2442, 'BRASIL NOVO', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2443, 'BREJO GRANDE DO ARAGUAIA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2444, 'BREU BRANCO', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2445, 'BREVES', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2446, 'BUJARU', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2447, 'CACHOEIRA DO ARARI', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2448, 'CACHOEIRA DO PIRIÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2449, 'CAMETÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2450, 'CANAÃ DOS CARAJÁS', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2451, 'CAPANEMA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2452, 'CAPITÃO POÇO', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2453, 'CASTANHAL', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2454, 'CHAVES', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2455, 'COLARES', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2456, 'CONCEIÇÃO DO ARAGUAIA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2457, 'CONCÓRDIA DO PARÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2458, 'CUMARU DO NORTE', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2459, 'CURIONÓPOLIS', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2460, 'CURRALINHO', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2461, 'CURUÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2462, 'CURUÇÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2463, 'DOM ELISEU', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2464, 'ELDORADO DOS CARAJÁS', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2465, 'FARO', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2466, 'FLORESTA DO ARAGUAIA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2467, 'GARRAFÃO DO NORTE', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2468, 'GOIANÉSIA DO PARÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2469, 'GURUPÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2470, 'IGARAPÉ-AÇU', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2471, 'IGARAPÉ-MIRI', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2472, 'INHANGAPI', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2473, 'IPIXUNA DO PARÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2474, 'IRITUIA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2475, 'ITAITUBA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2476, 'ITUPIRANGA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2477, 'JACAREACANGA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2478, 'JACUNDÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2479, 'JURUTI', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2480, 'LIMOEIRO DO AJURU', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2481, 'MÃE DO RIO', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2482, 'MAGALHÃES BARATA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2483, 'MARABÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2484, 'MARACANÃ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2485, 'MARAPANIM', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2486, 'MARITUBA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2487, 'MEDICILÂNDIA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2488, 'MELGAÇO', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2489, 'MOCAJUBA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2490, 'MOJU', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2491, 'MONTE ALEGRE', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2492, 'MUANÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2493, 'NOVA ESPERANÇA DO PIRIÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2494, 'NOVA IPIXUNA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2495, 'NOVA TIMBOTEUA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2496, 'NOVO PROGRESSO', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2497, 'NOVO REPARTIMENTO', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2498, 'ÓBIDOS', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2499, 'OEIRAS DO PARÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2500, 'ORIXIMINÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2501, 'OURÉM', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2502, 'OURILÂNDIA DO NORTE', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2503, 'PACAJÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2504, 'PALESTINA DO PARÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2505, 'PARAGOMINAS', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2506, 'PARAUAPEBAS', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2507, 'PAU D`ARCO', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2508, 'PEIXE-BOI', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2509, 'PIÇARRA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2510, 'PLACAS', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2511, 'PONTA DE PEDRAS', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2512, 'PORTEL', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2513, 'PORTO DE MOZ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2514, 'PRAINHA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2515, 'PRIMAVERA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2516, 'QUATIPURU', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2517, 'REDENÇÃO', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2518, 'RIO MARIA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2519, 'RONDON DO PARÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2520, 'RURÓPOLIS', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2521, 'SALINÓPOLIS', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2522, 'SALVATERRA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2523, 'SANTA BÁRBARA DO PARÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2524, 'SANTA CRUZ DO ARARI', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2525, 'SANTA ISABEL DO PARÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2526, 'SANTA LUZIA DO PARÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2527, 'SANTA MARIA DAS BARREIRAS', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2528, 'SANTA MARIA DO PARÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2529, 'SANTANA DO ARAGUAIA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2530, 'SANTARÉM', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2531, 'SANTARÉM NOVO', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2532, 'SANTO ANTÔNIO DO TAUÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2533, 'SÃO CAETANO DE ODIVELAS', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2534, 'SÃO DOMINGOS DO ARAGUAIA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2535, 'SÃO DOMINGOS DO CAPIM', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2536, 'SÃO FÉLIX DO XINGU', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2537, 'SÃO FRANCISCO DO PARÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2538, 'SÃO GERALDO DO ARAGUAIA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2539, 'SÃO JOÃO DA PONTA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2540, 'SÃO JOÃO DE PIRABAS', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2541, 'SÃO JOÃO DO ARAGUAIA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2542, 'SÃO MIGUEL DO GUAMÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2543, 'SÃO SEBASTIÃO DA BOA VISTA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2544, 'SAPUCAIA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2545, 'SENADOR JOSÉ PORFÍRIO', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2546, 'SOURE', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2547, 'TAILÂNDIA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2548, 'TERRA ALTA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2549, 'TERRA SANTA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2550, 'TOMÉ-AÇU', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2551, 'TRACUATEUA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2552, 'TRAIRÃO', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2553, 'TUCUMÃ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2554, 'TUCURUÍ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2555, 'ULIANÓPOLIS', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2556, 'URUARÁ', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2557, 'VIGIA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2558, 'VISEU', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2559, 'VITÓRIA DO XINGU', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2560, 'XINGUARA', 14);
INSERT INTO cidade (id, nome, estado) VALUES (2561, 'ÁGUA BRANCA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2562, 'AGUIAR', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2563, 'ALAGOA GRANDE', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2564, 'ALAGOA NOVA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2565, 'ALAGOINHA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2566, 'ALCANTIL', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2567, 'ALGODÃO DE JANDAÍRA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2568, 'ALHANDRA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2569, 'AMPARO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2570, 'APARECIDA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2571, 'ARAÇAGI', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2572, 'ARARA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2573, 'ARARUNA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2574, 'AREIA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2575, 'AREIA DE BARAÚNAS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2576, 'AREIAL', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2577, 'AROEIRAS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2578, 'ASSUNÇÃO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2579, 'BAÍA DA TRAIÇÃO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2580, 'BANANEIRAS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2581, 'BARAÚNA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2582, 'BARRA DE SANTA ROSA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2583, 'BARRA DE SANTANA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2584, 'BARRA DE SÃO MIGUEL', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2585, 'BAYEUX', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2586, 'BELÉM', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2587, 'BELÉM DO BREJO DO CRUZ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2588, 'BERNARDINO BATISTA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2589, 'BOA VENTURA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2590, 'BOA VISTA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2591, 'BOM JESUS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2592, 'BOM SUCESSO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2593, 'BONITO DE SANTA FÉ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2594, 'BOQUEIRÃO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2595, 'BORBOREMA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2596, 'BREJO DO CRUZ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2597, 'BREJO DOS SANTOS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2598, 'CAAPORÃ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2599, 'CABACEIRAS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2600, 'CABEDELO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2601, 'CACHOEIRA DOS ÍNDIOS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2602, 'CACIMBA DE AREIA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2603, 'CACIMBA DE DENTRO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2604, 'CACIMBAS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2605, 'CAIÇARA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2606, 'CAJAZEIRAS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2607, 'CAJAZEIRINHAS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2608, 'CALDAS BRANDÃO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2609, 'CAMALAÚ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2610, 'CAMPINA GRANDE', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2611, 'CAMPO DE SANTANA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2612, 'CAPIM', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2613, 'CARAÚBAS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2614, 'CARRAPATEIRA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2615, 'CASSERENGUE', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2616, 'CATINGUEIRA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2617, 'CATOLÉ DO ROCHA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2618, 'CATURITÉ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2619, 'CONCEIÇÃO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2620, 'CONDADO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2621, 'CONDE', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2622, 'CONGO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2623, 'COREMAS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2624, 'COXIXOLA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2625, 'CRUZ DO ESPÍRITO SANTO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2626, 'CUBATI', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2627, 'CUITÉ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2628, 'CUITÉ DE MAMANGUAPE', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2629, 'CUITEGI', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2630, 'CURRAL DE CIMA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2631, 'CURRAL VELHO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2632, 'DAMIÃO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2633, 'DESTERRO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2634, 'DIAMANTE', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2635, 'DONA INÊS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2636, 'DUAS ESTRADAS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2637, 'EMAS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2638, 'ESPERANÇA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2639, 'FAGUNDES', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2640, 'FREI MARTINHO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2641, 'GADO BRAVO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2642, 'GUARABIRA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2643, 'GURINHÉM', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2644, 'GURJÃO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2645, 'IBIARA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2646, 'IGARACY', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2647, 'IMACULADA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2648, 'INGÁ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2649, 'ITABAIANA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2650, 'ITAPORANGA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2651, 'ITAPOROROCA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2652, 'ITATUBA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2653, 'JACARAÚ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2654, 'JERICÓ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2655, 'JOÃO PESSOA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2656, 'JUAREZ TÁVORA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2657, 'JUAZEIRINHO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2658, 'JUNCO DO SERIDÓ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2659, 'JURIPIRANGA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2660, 'JURU', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2661, 'LAGOA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2662, 'LAGOA DE DENTRO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2663, 'LAGOA SECA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2664, 'LASTRO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2665, 'LIVRAMENTO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2666, 'LOGRADOURO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2667, 'LUCENA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2668, 'MÃE D`ÁGUA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2669, 'MALTA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2670, 'MAMANGUAPE', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2671, 'MANAÍRA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2672, 'MARCAÇÃO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2673, 'MARI', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2674, 'MARIZÓPOLIS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2675, 'MASSARANDUBA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2676, 'MATARACA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2677, 'MATINHAS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2678, 'MATO GROSSO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2679, 'MATURÉIA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2680, 'MOGEIRO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2681, 'MONTADAS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2682, 'MONTE HOREBE', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2683, 'MONTEIRO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2684, 'MULUNGU', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2685, 'NATUBA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2686, 'NAZAREZINHO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2687, 'NOVA FLORESTA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2688, 'NOVA OLINDA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2689, 'NOVA PALMEIRA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2690, 'OLHO D`ÁGUA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2691, 'OLIVEDOS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2692, 'OURO VELHO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2693, 'PARARI', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2694, 'PASSAGEM', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2695, 'PATOS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2696, 'PAULISTA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2697, 'PEDRA BRANCA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2698, 'PEDRA LAVRADA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2699, 'PEDRAS DE FOGO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2700, 'PEDRO RÉGIS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2701, 'PIANCÓ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2702, 'PICUÍ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2703, 'PILAR', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2704, 'PILÕES', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2705, 'PILÕEZINHOS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2706, 'PIRPIRITUBA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2707, 'PITIMBU', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2708, 'POCINHOS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2709, 'POÇO DANTAS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2710, 'POÇO DE JOSÉ DE MOURA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2711, 'POMBAL', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2712, 'PRATA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2713, 'PRINCESA ISABEL', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2714, 'PUXINANÃ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2715, 'QUEIMADAS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2716, 'QUIXABÁ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2717, 'REMÍGIO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2718, 'RIACHÃO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2719, 'RIACHÃO DO BACAMARTE', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2720, 'RIACHÃO DO POÇO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2721, 'RIACHO DE SANTO ANTÔNIO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2722, 'RIACHO DOS CAVALOS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2723, 'RIO TINTO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2724, 'SALGADINHO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2725, 'SALGADO DE SÃO FÉLIX', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2726, 'SANTA CECÍLIA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2727, 'SANTA CRUZ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2728, 'SANTA HELENA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2729, 'SANTA INÊS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2730, 'SANTA LUZIA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2731, 'SANTA RITA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2732, 'SANTA TERESINHA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2733, 'SANTANA DE MANGUEIRA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2734, 'SANTANA DOS GARROTES', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2735, 'SANTARÉM', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2736, 'SANTO ANDRÉ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2737, 'SÃO BENTINHO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2738, 'SÃO BENTO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2739, 'SÃO DOMINGOS DE POMBAL', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2740, 'SÃO DOMINGOS DO CARIRI', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2741, 'SÃO FRANCISCO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2742, 'SÃO JOÃO DO CARIRI', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2743, 'SÃO JOÃO DO RIO DO PEIXE', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2744, 'SÃO JOÃO DO TIGRE', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2745, 'SÃO JOSÉ DA LAGOA TAPADA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2746, 'SÃO JOSÉ DE CAIANA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2747, 'SÃO JOSÉ DE ESPINHARAS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2748, 'SÃO JOSÉ DE PIRANHAS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2749, 'SÃO JOSÉ DE PRINCESA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2750, 'SÃO JOSÉ DO BONFIM', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2751, 'SÃO JOSÉ DO BREJO DO CRUZ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2752, 'SÃO JOSÉ DO SABUGI', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2753, 'SÃO JOSÉ DOS CORDEIROS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2754, 'SÃO JOSÉ DOS RAMOS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2755, 'SÃO MAMEDE', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2756, 'SÃO MIGUEL DE TAIPU', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2757, 'SÃO SEBASTIÃO DE LAGOA DE ROÇA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2758, 'SÃO SEBASTIÃO DO UMBUZEIRO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2759, 'SAPÉ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2760, 'SERIDÓ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2761, 'SERRA BRANCA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2762, 'SERRA DA RAIZ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2763, 'SERRA GRANDE', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2764, 'SERRA REDONDA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2765, 'SERRARIA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2766, 'SERTÃOZINHO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2767, 'SOBRADO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2768, 'SOLÂNEA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2769, 'SOLEDADE', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2770, 'SOSSÊGO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2771, 'SOUSA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2772, 'SUMÉ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2773, 'TAPEROÁ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2774, 'TAVARES', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2775, 'TEIXEIRA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2776, 'TENÓRIO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2777, 'TRIUNFO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2778, 'UIRAÚNA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2779, 'UMBUZEIRO', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2780, 'VÁRZEA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2781, 'VIEIRÓPOLIS', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2782, 'VISTA SERRANA', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2783, 'ZABELÊ', 15);
INSERT INTO cidade (id, nome, estado) VALUES (2784, 'ABATIÁ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2785, 'ADRIANÓPOLIS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2786, 'AGUDOS DO SUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2787, 'ALMIRANTE TAMANDARÉ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2788, 'ALTAMIRA DO PARANÁ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2789, 'ALTO PARAÍSO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2790, 'ALTO PARANÁ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2791, 'ALTO PIQUIRI', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2792, 'ALTÔNIA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2793, 'ALVORADA DO SUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2794, 'AMAPORÃ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2795, 'AMPÉRE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2796, 'ANAHY', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2797, 'ANDIRÁ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2798, 'ÂNGULO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2799, 'ANTONINA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2800, 'ANTÔNIO OLINTO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2801, 'APUCARANA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2802, 'ARAPONGAS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2803, 'ARAPOTI', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2804, 'ARAPUÃ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2805, 'ARARUNA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2806, 'ARAUCÁRIA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2807, 'ARIRANHA DO IVAÍ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2808, 'ASSAÍ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2809, 'ASSIS CHATEAUBRIAND', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2810, 'ASTORGA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2811, 'ATALAIA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2812, 'BALSA NOVA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2813, 'BANDEIRANTES', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2814, 'BARBOSA FERRAZ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2815, 'BARRA DO JACARÉ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2816, 'BARRACÃO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2817, 'BELA VISTA DA CAROBA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2818, 'BELA VISTA DO PARAÍSO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2819, 'BITURUNA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2820, 'BOA ESPERANÇA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2821, 'BOA ESPERANÇA DO IGUAÇU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2822, 'BOA VENTURA DE SÃO ROQUE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2823, 'BOA VISTA DA APARECIDA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2824, 'BOCAIÚVA DO SUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2825, 'BOM JESUS DO SUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2826, 'BOM SUCESSO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2827, 'BOM SUCESSO DO SUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2828, 'BORRAZÓPOLIS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2829, 'BRAGANEY', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2830, 'BRASILÂNDIA DO SUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2831, 'CAFEARA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2832, 'CAFELÂNDIA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2833, 'CAFEZAL DO SUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2834, 'CALIFÓRNIA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2835, 'CAMBARÁ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2836, 'CAMBÉ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2837, 'CAMBIRA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2838, 'CAMPINA DA LAGOA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2839, 'CAMPINA DO SIMÃO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2840, 'CAMPINA GRANDE DO SUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2841, 'CAMPO BONITO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2842, 'CAMPO DO TENENTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2843, 'CAMPO LARGO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2844, 'CAMPO MAGRO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2845, 'CAMPO MOURÃO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2846, 'CÂNDIDO DE ABREU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2847, 'CANDÓI', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2848, 'CANTAGALO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2849, 'CAPANEMA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2850, 'CAPITÃO LEÔNIDAS MARQUES', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2851, 'CARAMBEÍ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2852, 'CARLÓPOLIS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2853, 'CASCAVEL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2854, 'CASTRO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2855, 'CATANDUVAS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2856, 'CENTENÁRIO DO SUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2857, 'CERRO AZUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2858, 'CÉU AZUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2859, 'CHOPINZINHO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2860, 'CIANORTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2861, 'CIDADE GAÚCHA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2862, 'CLEVELÂNDIA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2863, 'COLOMBO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2864, 'COLORADO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2865, 'CONGONHINHAS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2866, 'CONSELHEIRO MAIRINCK', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2867, 'CONTENDA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2868, 'CORBÉLIA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2869, 'CORNÉLIO PROCÓPIO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2870, 'CORONEL DOMINGOS SOARES', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2871, 'CORONEL VIVIDA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2872, 'CORUMBATAÍ DO SUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2873, 'CRUZ MACHADO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2874, 'CRUZEIRO DO IGUAÇU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2875, 'CRUZEIRO DO OESTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2876, 'CRUZEIRO DO SUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2877, 'CRUZMALTINA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2878, 'CURITIBA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2879, 'CURIÚVA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2880, 'DIAMANTE D`OESTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2881, 'DIAMANTE DO NORTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2882, 'DIAMANTE DO SUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2883, 'DOIS VIZINHOS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2884, 'DOURADINA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2885, 'DOUTOR CAMARGO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2886, 'DOUTOR ULYSSES', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2887, 'ENÉAS MARQUES', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2888, 'ENGENHEIRO BELTRÃO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2889, 'ENTRE RIOS DO OESTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2890, 'ESPERANÇA NOVA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2891, 'ESPIGÃO ALTO DO IGUAÇU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2892, 'FAROL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2893, 'FAXINAL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2894, 'FAZENDA RIO GRANDE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2895, 'FÊNIX', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2896, 'FERNANDES PINHEIRO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2897, 'FIGUEIRA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2898, 'FLOR DA SERRA DO SUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2899, 'FLORAÍ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2900, 'FLORESTA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2901, 'FLORESTÓPOLIS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2902, 'FLÓRIDA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2903, 'FORMOSA DO OESTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2904, 'FOZ DO IGUAÇU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2905, 'FOZ DO JORDÃO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2906, 'FRANCISCO ALVES', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2907, 'FRANCISCO BELTRÃO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2908, 'GENERAL CARNEIRO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2909, 'GODOY MOREIRA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2910, 'GOIOERÊ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2911, 'GOIOXIM', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2912, 'GRANDES RIOS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2913, 'GUAÍRA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2914, 'GUAIRAÇÁ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2915, 'GUAMIRANGA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2916, 'GUAPIRAMA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2917, 'GUAPOREMA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2918, 'GUARACI', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2919, 'GUARANIAÇU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2920, 'GUARAPUAVA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2921, 'GUARAQUEÇABA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2922, 'GUARATUBA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2923, 'HONÓRIO SERPA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2924, 'IBAITI', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2925, 'IBEMA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2926, 'IBIPORÃ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2927, 'ICARAÍMA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2928, 'IGUARAÇU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2929, 'IGUATU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2930, 'IMBAÚ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2931, 'IMBITUVA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2932, 'INÁCIO MARTINS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2933, 'INAJÁ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2934, 'INDIANÓPOLIS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2935, 'IPIRANGA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2936, 'IPORÃ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2937, 'IRACEMA DO OESTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2938, 'IRATI', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2939, 'IRETAMA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2940, 'ITAGUAJÉ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2941, 'ITAIPULÂNDIA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2942, 'ITAMBARACÁ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2943, 'ITAMBÉ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2944, 'ITAPEJARA D`OESTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2945, 'ITAPERUÇU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2946, 'ITAÚNA DO SUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2947, 'IVAÍ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2948, 'IVAIPORÃ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2949, 'IVATÉ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2950, 'IVATUBA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2951, 'JABOTI', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2952, 'JACAREZINHO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2953, 'JAGUAPITÃ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2954, 'JAGUARIAÍVA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2955, 'JANDAIA DO SUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2956, 'JANIÓPOLIS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2957, 'JAPIRA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2958, 'JAPURÁ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2959, 'JARDIM ALEGRE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2960, 'JARDIM OLINDA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2961, 'JATAIZINHO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2962, 'JESUÍTAS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2963, 'JOAQUIM TÁVORA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2964, 'JUNDIAÍ DO SUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2965, 'JURANDA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2966, 'JUSSARA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2967, 'KALORÉ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2968, 'LAPA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2969, 'LARANJAL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2970, 'LARANJEIRAS DO SUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2971, 'LEÓPOLIS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2972, 'LIDIANÓPOLIS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2973, 'LINDOESTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2974, 'LOANDA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2975, 'LOBATO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2976, 'LONDRINA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2977, 'LUIZIANA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2978, 'LUNARDELLI', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2979, 'LUPIONÓPOLIS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2980, 'MALLET', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2981, 'MAMBORÊ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2982, 'MANDAGUAÇU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2983, 'MANDAGUARI', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2984, 'MANDIRITUBA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2985, 'MANFRINÓPOLIS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2986, 'MANGUEIRINHA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2987, 'MANOEL RIBAS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2988, 'MARECHAL CÂNDIDO RONDON', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2989, 'MARIA HELENA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2990, 'MARIALVA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2991, 'MARILÂNDIA DO SUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2992, 'MARILENA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2993, 'MARILUZ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2994, 'MARINGÁ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2995, 'MARIÓPOLIS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2996, 'MARIPÁ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2997, 'MARMELEIRO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2998, 'MARQUINHO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (2999, 'MARUMBI', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3000, 'MATELÂNDIA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3001, 'MATINHOS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3002, 'MATO RICO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3003, 'MAUÁ DA SERRA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3004, 'MEDIANEIRA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3005, 'MERCEDES', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3006, 'MIRADOR', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3007, 'MIRASELVA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3008, 'MISSAL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3009, 'MOREIRA SALES', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3010, 'MORRETES', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3011, 'MUNHOZ DE MELO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3012, 'NOSSA SENHORA DAS GRAÇAS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3013, 'NOVA ALIANÇA DO IVAÍ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3014, 'NOVA AMÉRICA DA COLINA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3015, 'NOVA AURORA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3016, 'NOVA CANTU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3017, 'NOVA ESPERANÇA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3018, 'NOVA ESPERANÇA DO SUDOESTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3019, 'NOVA FÁTIMA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3020, 'NOVA LARANJEIRAS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3021, 'NOVA LONDRINA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3022, 'NOVA OLÍMPIA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3023, 'NOVA PRATA DO IGUAÇU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3024, 'NOVA SANTA BÁRBARA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3025, 'NOVA SANTA ROSA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3026, 'NOVA TEBAS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3027, 'NOVO ITACOLOMI', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3028, 'ORTIGUEIRA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3029, 'OURIZONA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3030, 'OURO VERDE DO OESTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3031, 'PAIÇANDU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3032, 'PALMAS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3033, 'PALMEIRA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3034, 'PALMITAL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3035, 'PALOTINA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3036, 'PARAÍSO DO NORTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3037, 'PARANACITY', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3038, 'PARANAGUÁ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3039, 'PARANAPOEMA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3040, 'PARANAVAÍ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3041, 'PATO BRAGADO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3042, 'PATO BRANCO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3043, 'PAULA FREITAS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3044, 'PAULO FRONTIN', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3045, 'PEABIRU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3046, 'PEROBAL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3047, 'PÉROLA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3048, 'PÉROLA D`OESTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3049, 'PIÊN', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3050, 'PINHAIS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3051, 'PINHAL DE SÃO BENTO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3052, 'PINHALÃO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3053, 'PINHÃO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3054, 'PIRAÍ DO SUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3055, 'PIRAQUARA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3056, 'PITANGA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3057, 'PITANGUEIRAS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3058, 'PLANALTINA DO PARANÁ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3059, 'PLANALTO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3060, 'PONTA GROSSA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3061, 'PONTAL DO PARANÁ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3062, 'PORECATU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3063, 'PORTO AMAZONAS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3064, 'PORTO BARREIRO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3065, 'PORTO RICO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3066, 'PORTO VITÓRIA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3067, 'PRADO FERREIRA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3068, 'PRANCHITA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3069, 'PRESIDENTE CASTELO BRANCO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3070, 'PRIMEIRO DE MAIO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3071, 'PRUDENTÓPOLIS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3072, 'QUARTO CENTENÁRIO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3073, 'QUATIGUÁ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3074, 'QUATRO BARRAS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3075, 'QUATRO PONTES', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3076, 'QUEDAS DO IGUAÇU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3077, 'QUERÊNCIA DO NORTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3078, 'QUINTA DO SOL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3079, 'QUITANDINHA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3080, 'RAMILÂNDIA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3081, 'RANCHO ALEGRE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3082, 'RANCHO ALEGRE D`OESTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3083, 'REALEZA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3084, 'REBOUÇAS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3085, 'RENASCENÇA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3086, 'RESERVA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3087, 'RESERVA DO IGUAÇU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3088, 'RIBEIRÃO CLARO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3089, 'RIBEIRÃO DO PINHAL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3090, 'RIO AZUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3091, 'RIO BOM', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3092, 'RIO BONITO DO IGUAÇU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3093, 'RIO BRANCO DO IVAÍ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3094, 'RIO BRANCO DO SUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3095, 'RIO NEGRO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3096, 'ROLÂNDIA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3097, 'RONCADOR', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3098, 'RONDON', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3099, 'ROSÁRIO DO IVAÍ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3100, 'SABÁUDIA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3101, 'SALGADO FILHO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3102, 'SALTO DO ITARARÉ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3103, 'SALTO DO LONTRA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3104, 'SANTA AMÉLIA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3105, 'SANTA CECÍLIA DO PAVÃO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3106, 'SANTA CRUZ DE MONTE CASTELO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3107, 'SANTA FÉ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3108, 'SANTA HELENA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3109, 'SANTA INÊS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3110, 'SANTA ISABEL DO IVAÍ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3111, 'SANTA IZABEL DO OESTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3112, 'SANTA LÚCIA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3113, 'SANTA MARIA DO OESTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3114, 'SANTA MARIANA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3115, 'SANTA MÔNICA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3116, 'SANTA TEREZA DO OESTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3117, 'SANTA TEREZINHA DE ITAIPU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3118, 'SANTANA DO ITARARÉ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3119, 'SANTO ANTÔNIO DA PLATINA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3120, 'SANTO ANTÔNIO DO CAIUÁ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3121, 'SANTO ANTÔNIO DO PARAÍSO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3122, 'SANTO ANTÔNIO DO SUDOESTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3123, 'SANTO INÁCIO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3124, 'SÃO CARLOS DO IVAÍ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3125, 'SÃO JERÔNIMO DA SERRA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3126, 'SÃO JOÃO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3127, 'SÃO JOÃO DO CAIUÁ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3128, 'SÃO JOÃO DO IVAÍ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3129, 'SÃO JOÃO DO TRIUNFO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3130, 'SÃO JORGE D`OESTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3131, 'SÃO JORGE DO IVAÍ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3132, 'SÃO JORGE DO PATROCÍNIO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3133, 'SÃO JOSÉ DA BOA VISTA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3134, 'SÃO JOSÉ DAS PALMEIRAS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3135, 'SÃO JOSÉ DOS PINHAIS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3136, 'SÃO MANOEL DO PARANÁ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3137, 'SÃO MATEUS DO SUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3138, 'SÃO MIGUEL DO IGUAÇU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3139, 'SÃO PEDRO DO IGUAÇU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3140, 'SÃO PEDRO DO IVAÍ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3141, 'SÃO PEDRO DO PARANÁ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3142, 'SÃO SEBASTIÃO DA AMOREIRA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3143, 'SÃO TOMÉ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3144, 'SAPOPEMA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3145, 'SARANDI', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3146, 'SAUDADE DO IGUAÇU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3147, 'SENGÉS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3148, 'SERRANÓPOLIS DO IGUAÇU', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3149, 'SERTANEJA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3150, 'SERTANÓPOLIS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3151, 'SIQUEIRA CAMPOS', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3152, 'SULINA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3153, 'TAMARANA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3154, 'TAMBOARA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3155, 'TAPEJARA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3156, 'TAPIRA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3157, 'TEIXEIRA SOARES', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3158, 'TELÊMACO BORBA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3159, 'TERRA BOA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3160, 'TERRA RICA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3161, 'TERRA ROXA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3162, 'TIBAGI', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3163, 'TIJUCAS DO SUL', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3164, 'TOLEDO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3165, 'TOMAZINA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3166, 'TRÊS BARRAS DO PARANÁ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3167, 'TUNAS DO PARANÁ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3168, 'TUNEIRAS DO OESTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3169, 'TUPÃSSI', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3170, 'TURVO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3171, 'UBIRATÃ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3172, 'UMUARAMA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3173, 'UNIÃO DA VITÓRIA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3174, 'UNIFLOR', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3175, 'URAÍ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3176, 'VENTANIA', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3177, 'VERA CRUZ DO OESTE', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3178, 'VERÊ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3179, 'VIRMOND', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3180, 'VITORINO', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3181, 'WENCESLAU BRAZ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3182, 'XAMBRÊ', 18);
INSERT INTO cidade (id, nome, estado) VALUES (3183, 'ABREU E LIMA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3184, 'AFOGADOS DA INGAZEIRA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3185, 'AFRÂNIO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3186, 'AGRESTINA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3187, 'ÁGUA PRETA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3188, 'ÁGUAS BELAS', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3189, 'ALAGOINHA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3190, 'ALIANÇA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3191, 'ALTINHO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3192, 'AMARAJI', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3193, 'ANGELIM', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3194, 'ARAÇOIABA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3195, 'ARARIPINA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3196, 'ARCOVERDE', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3197, 'BARRA DE GUABIRABA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3198, 'BARREIROS', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3199, 'BELÉM DE MARIA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3200, 'BELÉM DE SÃO FRANCISCO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3201, 'BELO JARDIM', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3202, 'BETÂNIA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3203, 'BEZERROS', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3204, 'BODOCÓ', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3205, 'BOM CONSELHO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3206, 'BOM JARDIM', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3207, 'BONITO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3208, 'BREJÃO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3209, 'BREJINHO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3210, 'BREJO DA MADRE DE DEUS', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3211, 'BUENOS AIRES', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3212, 'BUÍQUE', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3213, 'CABO DE SANTO AGOSTINHO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3214, 'CABROBÓ', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3215, 'CACHOEIRINHA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3216, 'CAETÉS', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3217, 'CALÇADO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3218, 'CALUMBI', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3219, 'CAMARAGIBE', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3220, 'CAMOCIM DE SÃO FÉLIX', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3221, 'CAMUTANGA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3222, 'CANHOTINHO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3223, 'CAPOEIRAS', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3224, 'CARNAÍBA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3225, 'CARNAUBEIRA DA PENHA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3226, 'CARPINA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3227, 'CARUARU', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3228, 'CASINHAS', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3229, 'CATENDE', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3230, 'CEDRO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3231, 'CHÃ DE ALEGRIA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3232, 'CHÃ GRANDE', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3233, 'CONDADO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3234, 'CORRENTES', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3235, 'CORTÊS', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3236, 'CUMARU', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3237, 'CUPIRA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3238, 'CUSTÓDIA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3239, 'DORMENTES', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3240, 'ESCADA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3241, 'EXU', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3242, 'FEIRA NOVA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3243, 'FERNANDO DE NORONHA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3244, 'FERREIROS', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3245, 'FLORES', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3246, 'FLORESTA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3247, 'FREI MIGUELINHO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3248, 'GAMELEIRA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3249, 'GARANHUNS', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3250, 'GLÓRIA DO GOITÁ', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3251, 'GOIANA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3252, 'GRANITO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3253, 'GRAVATÁ', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3254, 'IATI', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3255, 'IBIMIRIM', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3256, 'IBIRAJUBA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3257, 'IGARASSU', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3258, 'IGUARACI', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3259, 'ILHA DE ITAMARACÁ', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3260, 'INAJÁ', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3261, 'INGAZEIRA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3262, 'IPOJUCA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3263, 'IPUBI', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3264, 'ITACURUBA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3265, 'ITAÍBA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3266, 'ITAMBÉ', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3267, 'ITAPETIM', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3268, 'ITAPISSUMA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3269, 'ITAQUITINGA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3270, 'JABOATÃO DOS GUARARAPES', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3271, 'JAQUEIRA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3272, 'JATAÚBA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3273, 'JATOBÁ', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3274, 'JOÃO ALFREDO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3275, 'JOAQUIM NABUCO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3276, 'JUCATI', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3277, 'JUPI', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3278, 'JUREMA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3279, 'LAGOA DO CARRO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3280, 'LAGOA DO ITAENGA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3281, 'LAGOA DO OURO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3282, 'LAGOA DOS GATOS', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3283, 'LAGOA GRANDE', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3284, 'LAJEDO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3285, 'LIMOEIRO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3286, 'MACAPARANA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3287, 'MACHADOS', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3288, 'MANARI', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3289, 'MARAIAL', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3290, 'MIRANDIBA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3291, 'MOREILÂNDIA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3292, 'MORENO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3293, 'NAZARÉ DA MATA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3294, 'OLINDA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3295, 'OROBÓ', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3296, 'OROCÓ', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3297, 'OURICURI', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3298, 'PALMARES', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3299, 'PALMEIRINA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3300, 'PANELAS', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3301, 'PARANATAMA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3302, 'PARNAMIRIM', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3303, 'PASSIRA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3304, 'PAUDALHO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3305, 'PAULISTA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3306, 'PEDRA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3307, 'PESQUEIRA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3308, 'PETROLÂNDIA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3309, 'PETROLINA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3310, 'POÇÃO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3311, 'POMBOS', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3312, 'PRIMAVERA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3313, 'QUIPAPÁ', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3314, 'QUIXABA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3315, 'RECIFE', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3316, 'RIACHO DAS ALMAS', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3317, 'RIBEIRÃO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3318, 'RIO FORMOSO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3319, 'SAIRÉ', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3320, 'SALGADINHO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3321, 'SALGUEIRO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3322, 'SALOÁ', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3323, 'SANHARÓ', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3324, 'SANTA CRUZ', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3325, 'SANTA CRUZ DA BAIXA VERDE', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3326, 'SANTA CRUZ DO CAPIBARIBE', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3327, 'SANTA FILOMENA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3328, 'SANTA MARIA DA BOA VISTA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3329, 'SANTA MARIA DO CAMBUCÁ', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3330, 'SANTA TEREZINHA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3331, 'SÃO BENEDITO DO SUL', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3332, 'SÃO BENTO DO UNA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3333, 'SÃO CAITANO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3334, 'SÃO JOÃO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3335, 'SÃO JOAQUIM DO MONTE', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3336, 'SÃO JOSÉ DA COROA GRANDE', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3337, 'SÃO JOSÉ DO BELMONTE', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3338, 'SÃO JOSÉ DO EGITO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3339, 'SÃO LOURENÇO DA MATA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3340, 'SÃO VICENTE FERRER', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3341, 'SERRA TALHADA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3342, 'SERRITA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3343, 'SERTÂNIA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3344, 'SIRINHAÉM', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3345, 'SOLIDÃO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3346, 'SURUBIM', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3347, 'TABIRA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3348, 'TACAIMBÓ', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3349, 'TACARATU', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3350, 'TAMANDARÉ', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3351, 'TAQUARITINGA DO NORTE', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3352, 'TEREZINHA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3353, 'TERRA NOVA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3354, 'TIMBAÚBA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3355, 'TORITAMA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3356, 'TRACUNHAÉM', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3357, 'TRINDADE', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3358, 'TRIUNFO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3359, 'TUPANATINGA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3360, 'TUPARETAMA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3361, 'VENTUROSA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3362, 'VERDEJANTE', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3363, 'VERTENTE DO LÉRIO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3364, 'VERTENTES', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3365, 'VICÊNCIA', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3366, 'VITÓRIA DE SANTO ANTÃO', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3367, 'XEXÉU', 16);
INSERT INTO cidade (id, nome, estado) VALUES (3368, 'ACAUÃ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3369, 'AGRICOLÂNDIA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3370, 'ÁGUA BRANCA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3371, 'ALAGOINHA DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3372, 'ALEGRETE DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3373, 'ALTO LONGÁ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3374, 'ALTOS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3375, 'ALVORADA DO GURGUÉIA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3376, 'AMARANTE', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3377, 'ANGICAL DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3378, 'ANÍSIO DE ABREU', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3379, 'ANTÔNIO ALMEIDA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3380, 'AROAZES', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3381, 'AROEIRAS DO ITAIM', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3382, 'ARRAIAL', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3383, 'ASSUNÇÃO DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3384, 'AVELINO LOPES', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3385, 'BAIXA GRANDE DO RIBEIRO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3386, 'BARRA D`ALCÂNTARA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3387, 'BARRAS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3388, 'BARREIRAS DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3389, 'BARRO DURO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3390, 'BATALHA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3391, 'BELA VISTA DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3392, 'BELÉM DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3393, 'BENEDITINOS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3394, 'BERTOLÍNIA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3395, 'BETÂNIA DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3396, 'BOA HORA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3397, 'BOCAINA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3398, 'BOM JESUS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3399, 'BOM PRINCÍPIO DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3400, 'BONFIM DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3401, 'BOQUEIRÃO DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3402, 'BRASILEIRA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3403, 'BREJO DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3404, 'BURITI DOS LOPES', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3405, 'BURITI DOS MONTES', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3406, 'CABECEIRAS DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3407, 'CAJAZEIRAS DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3408, 'CAJUEIRO DA PRAIA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3409, 'CALDEIRÃO GRANDE DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3410, 'CAMPINAS DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3411, 'CAMPO ALEGRE DO FIDALGO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3412, 'CAMPO GRANDE DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3413, 'CAMPO LARGO DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3414, 'CAMPO MAIOR', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3415, 'CANAVIEIRA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3416, 'CANTO DO BURITI', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3417, 'CAPITÃO DE CAMPOS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3418, 'CAPITÃO GERVÁSIO OLIVEIRA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3419, 'CARACOL', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3420, 'CARAÚBAS DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3421, 'CARIDADE DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3422, 'CASTELO DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3423, 'CAXINGÓ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3424, 'COCAL', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3425, 'COCAL DE TELHA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3426, 'COCAL DOS ALVES', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3427, 'COIVARAS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3428, 'COLÔNIA DO GURGUÉIA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3429, 'COLÔNIA DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3430, 'CONCEIÇÃO DO CANINDÉ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3431, 'CORONEL JOSÉ DIAS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3432, 'CORRENTE', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3433, 'CRISTALÂNDIA DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3434, 'CRISTINO CASTRO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3435, 'CURIMATÁ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3436, 'CURRAIS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3437, 'CURRAL NOVO DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3438, 'CURRALINHOS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3439, 'DEMERVAL LOBÃO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3440, 'DIRCEU ARCOVERDE', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3441, 'DOM EXPEDITO LOPES', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3442, 'DOM INOCÊNCIO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3443, 'DOMINGOS MOURÃO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3444, 'ELESBÃO VELOSO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3445, 'ELISEU MARTINS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3446, 'ESPERANTINA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3447, 'FARTURA DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3448, 'FLORES DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3449, 'FLORESTA DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3450, 'FLORIANO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3451, 'FRANCINÓPOLIS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3452, 'FRANCISCO AYRES', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3453, 'FRANCISCO MACEDO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3454, 'FRANCISCO SANTOS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3455, 'FRONTEIRAS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3456, 'GEMINIANO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3457, 'GILBUÉS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3458, 'GUADALUPE', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3459, 'GUARIBAS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3460, 'HUGO NAPOLEÃO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3461, 'ILHA GRANDE', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3462, 'INHUMA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3463, 'IPIRANGA DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3464, 'ISAÍAS COELHO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3465, 'ITAINÓPOLIS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3466, 'ITAUEIRA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3467, 'JACOBINA DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3468, 'JAICÓS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3469, 'JARDIM DO MULATO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3470, 'JATOBÁ DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3471, 'JERUMENHA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3472, 'JOÃO COSTA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3473, 'JOAQUIM PIRES', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3474, 'JOCA MARQUES', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3475, 'JOSÉ DE FREITAS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3476, 'JUAZEIRO DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3477, 'JÚLIO BORGES', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3478, 'JUREMA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3479, 'LAGOA ALEGRE', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3480, 'LAGOA DE SÃO FRANCISCO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3481, 'LAGOA DO BARRO DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3482, 'LAGOA DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3483, 'LAGOA DO SÍTIO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3484, 'LAGOINHA DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3485, 'LANDRI SALES', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3486, 'LUÍS CORREIA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3487, 'LUZILÂNDIA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3488, 'MADEIRO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3489, 'MANOEL EMÍDIO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3490, 'MARCOLÂNDIA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3491, 'MARCOS PARENTE', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3492, 'MASSAPÊ DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3493, 'MATIAS OLÍMPIO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3494, 'MIGUEL ALVES', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3495, 'MIGUEL LEÃO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3496, 'MILTON BRANDÃO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3497, 'MONSENHOR GIL', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3498, 'MONSENHOR HIPÓLITO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3499, 'MONTE ALEGRE DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3500, 'MORRO CABEÇA NO TEMPO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3501, 'MORRO DO CHAPÉU DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3502, 'MURICI DOS PORTELAS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3503, 'NAZARÉ DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3504, 'NOSSA SENHORA DE NAZARÉ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3505, 'NOSSA SENHORA DOS REMÉDIOS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3506, 'NOVA SANTA RITA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3507, 'NOVO ORIENTE DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3508, 'NOVO SANTO ANTÔNIO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3509, 'OEIRAS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3510, 'OLHO D`ÁGUA DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3511, 'PADRE MARCOS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3512, 'PAES LANDIM', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3513, 'PAJEÚ DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3514, 'PALMEIRA DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3515, 'PALMEIRAIS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3516, 'PAQUETÁ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3517, 'PARNAGUÁ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3518, 'PARNAÍBA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3519, 'PASSAGEM FRANCA DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3520, 'PATOS DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3521, 'PAU D`ARCO DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3522, 'PAULISTANA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3523, 'PAVUSSU', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3524, 'PEDRO II', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3525, 'PEDRO LAURENTINO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3526, 'PICOS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3527, 'PIMENTEIRAS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3528, 'PIO IX', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3529, 'PIRACURUCA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3530, 'PIRIPIRI', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3531, 'PORTO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3532, 'PORTO ALEGRE DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3533, 'PRATA DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3534, 'QUEIMADA NOVA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3535, 'REDENÇÃO DO GURGUÉIA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3536, 'REGENERAÇÃO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3537, 'RIACHO FRIO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3538, 'RIBEIRA DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3539, 'RIBEIRO GONÇALVES', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3540, 'RIO GRANDE DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3541, 'SANTA CRUZ DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3542, 'SANTA CRUZ DOS MILAGRES', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3543, 'SANTA FILOMENA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3544, 'SANTA LUZ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3545, 'SANTA ROSA DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3546, 'SANTANA DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3547, 'SANTO ANTÔNIO DE LISBOA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3548, 'SANTO ANTÔNIO DOS MILAGRES', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3549, 'SANTO INÁCIO DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3550, 'SÃO BRAZ DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3551, 'SÃO FÉLIX DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3552, 'SÃO FRANCISCO DE ASSIS DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3553, 'SÃO FRANCISCO DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3554, 'SÃO GONÇALO DO GURGUÉIA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3555, 'SÃO GONÇALO DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3556, 'SÃO JOÃO DA CANABRAVA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3557, 'SÃO JOÃO DA FRONTEIRA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3558, 'SÃO JOÃO DA SERRA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3559, 'SÃO JOÃO DA VARJOTA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3560, 'SÃO JOÃO DO ARRAIAL', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3561, 'SÃO JOÃO DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3562, 'SÃO JOSÉ DO DIVINO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3563, 'SÃO JOSÉ DO PEIXE', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3564, 'SÃO JOSÉ DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3565, 'SÃO JULIÃO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3566, 'SÃO LOURENÇO DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3567, 'SÃO LUIS DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3568, 'SÃO MIGUEL DA BAIXA GRANDE', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3569, 'SÃO MIGUEL DO FIDALGO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3570, 'SÃO MIGUEL DO TAPUIO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3571, 'SÃO PEDRO DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3572, 'SÃO RAIMUNDO NONATO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3573, 'SEBASTIÃO BARROS', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3574, 'SEBASTIÃO LEAL', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3575, 'SIGEFREDO PACHECO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3576, 'SIMÕES', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3577, 'SIMPLÍCIO MENDES', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3578, 'SOCORRO DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3579, 'SUSSUAPARA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3580, 'TAMBORIL DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3581, 'TANQUE DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3582, 'TERESINA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3583, 'UNIÃO', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3584, 'URUÇUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3585, 'VALENÇA DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3586, 'VÁRZEA BRANCA', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3587, 'VÁRZEA GRANDE', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3588, 'VERA MENDES', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3589, 'VILA NOVA DO PIAUÍ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3590, 'WALL FERRAZ', 17);
INSERT INTO cidade (id, nome, estado) VALUES (3591, 'ANGRA DOS REIS', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3592, 'APERIBÉ', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3593, 'ARARUAMA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3594, 'AREAL', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3595, 'ARMAÇÃO DOS BÚZIOS', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3596, 'ARRAIAL DO CABO', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3597, 'BARRA DO PIRAÍ', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3598, 'BARRA MANSA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3599, 'BELFORD ROXO', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3600, 'BOM JARDIM', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3601, 'BOM JESUS DO ITABAPOANA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3602, 'CABO FRIO', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3603, 'CACHOEIRAS DE MACACU', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3604, 'CAMBUCI', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3605, 'CAMPOS DOS GOYTACAZES', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3606, 'CANTAGALO', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3607, 'CARAPEBUS', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3608, 'CARDOSO MOREIRA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3609, 'CARMO', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3610, 'CASIMIRO DE ABREU', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3611, 'COMENDADOR LEVY GASPARIAN', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3612, 'CONCEIÇÃO DE MACABU', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3613, 'CORDEIRO', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3614, 'DUAS BARRAS', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3615, 'DUQUE DE CAXIAS', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3616, 'ENGENHEIRO PAULO DE FRONTIN', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3617, 'GUAPIMIRIM', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3618, 'IGUABA GRANDE', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3619, 'ITABORAÍ', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3620, 'ITAGUAÍ', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3621, 'ITALVA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3622, 'ITAOCARA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3623, 'ITAPERUNA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3624, 'ITATIAIA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3625, 'JAPERI', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3626, 'LAJE DO MURIAÉ', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3627, 'MACAÉ', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3628, 'MACUCO', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3629, 'MAGÉ', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3630, 'MANGARATIBA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3631, 'MARICÁ', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3632, 'MENDES', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3633, 'MESQUITA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3634, 'MIGUEL PEREIRA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3635, 'MIRACEMA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3636, 'NATIVIDADE', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3637, 'NILÓPOLIS', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3638, 'NITERÓI', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3639, 'NOVA FRIBURGO', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3640, 'NOVA IGUAÇU', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3641, 'PARACAMBI', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3642, 'PARAÍBA DO SUL', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3643, 'PARATI', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3644, 'PATY DO ALFERES', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3645, 'PETRÓPOLIS', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3646, 'PINHEIRAL', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3647, 'PIRAÍ', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3648, 'PORCIÚNCULA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3649, 'PORTO REAL', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3650, 'QUATIS', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3651, 'QUEIMADOS', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3652, 'QUISSAMÃ', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3653, 'RESENDE', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3654, 'RIO BONITO', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3655, 'RIO CLARO', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3656, 'RIO DAS FLORES', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3657, 'RIO DAS OSTRAS', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3658, 'RIO DE JANEIRO', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3659, 'SANTA MARIA MADALENA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3660, 'SANTO ANTÔNIO DE PÁDUA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3661, 'SÃO FIDÉLIS', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3662, 'SÃO FRANCISCO DE ITABAPOANA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3663, 'SÃO GONÇALO', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3664, 'SÃO JOÃO DA BARRA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3665, 'SÃO JOÃO DE MERITI', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3666, 'SÃO JOSÉ DE UBÁ', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3667, 'SÃO JOSÉ DO VALE DO RIO PRET', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3668, 'SÃO PEDRO DA ALDEIA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3669, 'SÃO SEBASTIÃO DO ALTO', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3670, 'SAPUCAIA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3671, 'SAQUAREMA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3672, 'SEROPÉDICA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3673, 'SILVA JARDIM', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3674, 'SUMIDOURO', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3675, 'TANGUÁ', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3676, 'TERESÓPOLIS', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3677, 'TRAJANO DE MORAIS', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3678, 'TRÊS RIOS', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3679, 'VALENÇA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3680, 'VARRE-SAI', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3681, 'VASSOURAS', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3682, 'VOLTA REDONDA', 19);
INSERT INTO cidade (id, nome, estado) VALUES (3683, 'ACARI', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3684, 'AÇU', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3685, 'AFONSO BEZERRA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3686, 'ÁGUA NOVA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3687, 'ALEXANDRIA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3688, 'ALMINO AFONSO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3689, 'ALTO DO RODRIGUES', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3690, 'ANGICOS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3691, 'ANTÔNIO MARTINS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3692, 'APODI', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3693, 'AREIA BRANCA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3694, 'ARÊS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3695, 'AUGUSTO SEVERO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3696, 'BAÍA FORMOSA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3697, 'BARAÚNA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3698, 'BARCELONA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3699, 'BENTO FERNANDES', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3700, 'BODÓ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3701, 'BOM JESUS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3702, 'BREJINHO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3703, 'CAIÇARA DO NORTE', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3704, 'CAIÇARA DO RIO DO VENTO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3705, 'CAICÓ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3706, 'CAMPO REDONDO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3707, 'CANGUARETAMA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3708, 'CARAÚBAS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3709, 'CARNAÚBA DOS DANTAS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3710, 'CARNAUBAIS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3711, 'CEARÁ-MIRIM', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3712, 'CERRO CORÁ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3713, 'CORONEL EZEQUIEL', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3714, 'CORONEL JOÃO PESSOA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3715, 'CRUZETA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3716, 'CURRAIS NOVOS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3717, 'DOUTOR SEVERIANO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3718, 'ENCANTO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3719, 'EQUADOR', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3720, 'ESPÍRITO SANTO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3721, 'EXTREMOZ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3722, 'FELIPE GUERRA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3723, 'FERNANDO PEDROZA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3724, 'FLORÂNIA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3725, 'FRANCISCO DANTAS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3726, 'FRUTUOSO GOMES', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3727, 'GALINHOS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3728, 'GOIANINHA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3729, 'GOVERNADOR DIX-SEPT ROSADO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3730, 'GROSSOS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3731, 'GUAMARÉ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3732, 'IELMO MARINHO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3733, 'IPANGUAÇU', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3734, 'IPUEIRA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3735, 'ITAJÁ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3736, 'ITAÚ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3737, 'JAÇANÃ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3738, 'JANDAÍRA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3739, 'JANDUÍS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3740, 'JANUÁRIO CICCO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3741, 'JAPI', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3742, 'JARDIM DE ANGICOS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3743, 'JARDIM DE PIRANHAS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3744, 'JARDIM DO SERIDÓ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3745, 'JOÃO CÂMARA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3746, 'JOÃO DIAS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3747, 'JOSÉ DA PENHA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3748, 'JUCURUTU', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3749, 'JUNDIÁ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3750, 'LAGOA D`ANTA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3751, 'LAGOA DE PEDRAS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3752, 'LAGOA DE VELHOS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3753, 'LAGOA NOVA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3754, 'LAGOA SALGADA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3755, 'LAJES', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3756, 'LAJES PINTADAS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3757, 'LUCRÉCIA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3758, 'LUÍS GOMES', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3759, 'MACAÍBA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3760, 'MACAU', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3761, 'MAJOR SALES', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3762, 'MARCELINO VIEIRA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3763, 'MARTINS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3764, 'MAXARANGUAPE', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3765, 'MESSIAS TARGINO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3766, 'MONTANHAS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3767, 'MONTE ALEGRE', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3768, 'MONTE DAS GAMELEIRAS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3769, 'MOSSORÓ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3770, 'NATAL', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3771, 'NÍSIA FLORESTA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3772, 'NOVA CRUZ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3773, 'OLHO-D`ÁGUA DO BORGES', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3774, 'OURO BRANCO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3775, 'PARANÁ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3776, 'PARAÚ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3777, 'PARAZINHO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3778, 'PARELHAS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3779, 'PARNAMIRIM', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3780, 'PASSA E FICA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3781, 'PASSAGEM', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3782, 'PATU', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3783, 'PAU DOS FERROS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3784, 'PEDRA GRANDE', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3785, 'PEDRA PRETA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3786, 'PEDRO AVELINO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3787, 'PEDRO VELHO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3788, 'PENDÊNCIAS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3789, 'PILÕES', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3790, 'POÇO BRANCO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3791, 'PORTALEGRE', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3792, 'PORTO DO MANGUE', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3793, 'PRESIDENTE JUSCELINO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3794, 'PUREZA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3795, 'RAFAEL FERNANDES', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3796, 'RAFAEL GODEIRO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3797, 'RIACHO DA CRUZ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3798, 'RIACHO DE SANTANA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3799, 'RIACHUELO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3800, 'RIO DO FOGO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3801, 'RODOLFO FERNANDES', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3802, 'RUY BARBOSA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3803, 'SANTA CRUZ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3804, 'SANTA MARIA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3805, 'SANTANA DO MATOS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3806, 'SANTANA DO SERIDÓ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3807, 'SANTO ANTÔNIO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3808, 'SÃO BENTO DO NORTE', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3809, 'SÃO BENTO DO TRAIRÍ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3810, 'SÃO FERNANDO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3811, 'SÃO FRANCISCO DO OESTE', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3812, 'SÃO GONÇALO DO AMARANTE', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3813, 'SÃO JOÃO DO SABUGI', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3814, 'SÃO JOSÉ DE MIPIBU', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3815, 'SÃO JOSÉ DO CAMPESTRE', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3816, 'SÃO JOSÉ DO SERIDÓ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3817, 'SÃO MIGUEL', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3818, 'SÃO MIGUEL DO GOSTOSO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3819, 'SÃO PAULO DO POTENGI', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3820, 'SÃO PEDRO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3821, 'SÃO RAFAEL', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3822, 'SÃO TOMÉ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3823, 'SÃO VICENTE', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3824, 'SENADOR ELÓI DE SOUZA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3825, 'SENADOR GEORGINO AVELINO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3826, 'SERRA DE SÃO BENTO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3827, 'SERRA DO MEL', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3828, 'SERRA NEGRA DO NORTE', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3829, 'SERRINHA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3830, 'SERRINHA DOS PINTOS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3831, 'SEVERIANO MELO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3832, 'SÍTIO NOVO', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3833, 'TABOLEIRO GRANDE', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3834, 'TAIPU', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3835, 'TANGARÁ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3836, 'TENENTE ANANIAS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3837, 'TENENTE LAURENTINO CRUZ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3838, 'TIBAU', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3839, 'TIBAU DO SUL', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3840, 'TIMBAÚBA DOS BATISTAS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3841, 'TOUROS', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3842, 'TRIUNFO POTIGUAR', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3843, 'UMARIZAL', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3844, 'UPANEMA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3845, 'VÁRZEA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3846, 'VENHA-VER', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3847, 'VERA CRUZ', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3848, 'VIÇOSA', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3849, 'VILA FLOR', 20);
INSERT INTO cidade (id, nome, estado) VALUES (3850, 'ACEGUÁ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3851, 'ÁGUA SANTA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3852, 'AGUDO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3853, 'AJURICABA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3854, 'ALECRIM', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3855, 'ALEGRETE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3856, 'ALEGRIA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3857, 'ALMIRANTE TAMANDARÉ DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3858, 'ALPESTRE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3859, 'ALTO ALEGRE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3860, 'ALTO FELIZ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3861, 'ALVORADA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3862, 'AMARAL FERRADOR', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3863, 'AMETISTA DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3864, 'ANDRÉ DA ROCHA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3865, 'ANTA GORDA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3866, 'ANTÔNIO PRADO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3867, 'ARAMBARÉ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3868, 'ARARICÁ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3869, 'ARATIBA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3870, 'ARROIO DO MEIO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3871, 'ARROIO DO PADRE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3872, 'ARROIO DO SAL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3873, 'ARROIO DO TIGRE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3874, 'ARROIO DOS RATOS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3875, 'ARROIO GRANDE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3876, 'ARVOREZINHA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3877, 'AUGUSTO PESTANA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3878, 'ÁUREA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3879, 'BAGÉ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3880, 'BALNEÁRIO PINHAL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3881, 'BARÃO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3882, 'BARÃO DE COTEGIPE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3883, 'BARÃO DO TRIUNFO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3884, 'BARRA DO GUARITA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3885, 'BARRA DO QUARAÍ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3886, 'BARRA DO RIBEIRO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3887, 'BARRA DO RIO AZUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3888, 'BARRA FUNDA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3889, 'BARRACÃO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3890, 'BARROS CASSAL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3891, 'BENJAMIN CONSTANT DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3892, 'BENTO GONÇALVES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3893, 'BOA VISTA DAS MISSÕES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3894, 'BOA VISTA DO BURICÁ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3895, 'BOA VISTA DO CADEADO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3896, 'BOA VISTA DO INCRA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3897, 'BOA VISTA DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3898, 'BOM JESUS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3899, 'BOM PRINCÍPIO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3900, 'BOM PROGRESSO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3901, 'BOM RETIRO DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3902, 'BOQUEIRÃO DO LEÃO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3903, 'BOSSOROCA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3904, 'BOZANO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3905, 'BRAGA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3906, 'BROCHIER', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3907, 'BUTIÁ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3908, 'CAÇAPAVA DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3909, 'CACEQUI', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3910, 'CACHOEIRA DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3911, 'CACHOEIRINHA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3912, 'CACIQUE DOBLE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3913, 'CAIBATÉ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3914, 'CAIÇARA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3915, 'CAMAQUÃ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3916, 'CAMARGO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3917, 'CAMBARÁ DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3918, 'CAMPESTRE DA SERRA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3919, 'CAMPINA DAS MISSÕES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3920, 'CAMPINAS DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3921, 'CAMPO BOM', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3922, 'CAMPO NOVO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3923, 'CAMPOS BORGES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3924, 'CANDELÁRIA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3925, 'CÂNDIDO GODÓI', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3926, 'CANDIOTA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3927, 'CANELA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3928, 'CANGUÇU', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3929, 'CANOAS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3930, 'CANUDOS DO VALE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3931, 'CAPÃO BONITO DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3932, 'CAPÃO DA CANOA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3933, 'CAPÃO DO CIPÓ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3934, 'CAPÃO DO LEÃO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3935, 'CAPELA DE SANTANA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3936, 'CAPITÃO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3937, 'CAPIVARI DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3938, 'CARAÁ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3939, 'CARAZINHO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3940, 'CARLOS BARBOSA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3941, 'CARLOS GOMES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3942, 'CASCA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3943, 'CASEIROS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3944, 'CATUÍPE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3945, 'CAXIAS DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3946, 'CENTENÁRIO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3947, 'CERRITO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3948, 'CERRO BRANCO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3949, 'CERRO GRANDE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3950, 'CERRO GRANDE DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3951, 'CERRO LARGO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3952, 'CHAPADA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3953, 'CHARQUEADAS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3954, 'CHARRUA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3955, 'CHIAPETA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3956, 'CHUÍ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3957, 'CHUVISCA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3958, 'CIDREIRA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3959, 'CIRÍACO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3960, 'COLINAS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3961, 'COLORADO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3962, 'CONDOR', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3963, 'CONSTANTINA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3964, 'COQUEIRO BAIXO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3965, 'COQUEIROS DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3966, 'CORONEL BARROS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3967, 'CORONEL BICACO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3968, 'CORONEL PILAR', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3969, 'COTIPORÃ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3970, 'COXILHA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3971, 'CRISSIUMAL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3972, 'CRISTAL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3973, 'CRISTAL DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3974, 'CRUZ ALTA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3975, 'CRUZALTENSE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3976, 'CRUZEIRO DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3977, 'DAVID CANABARRO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3978, 'DERRUBADAS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3979, 'DEZESSEIS DE NOVEMBRO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3980, 'DILERMANDO DE AGUIAR', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3981, 'DOIS IRMÃOS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3982, 'DOIS IRMÃOS DAS MISSÕES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3983, 'DOIS LAJEADOS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3984, 'DOM FELICIANO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3985, 'DOM PEDRITO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3986, 'DOM PEDRO DE ALCÂNTARA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3987, 'DONA FRANCISCA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3988, 'DOUTOR MAURÍCIO CARDOSO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3989, 'DOUTOR RICARDO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3990, 'ELDORADO DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3991, 'ENCANTADO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3992, 'ENCRUZILHADA DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3993, 'ENGENHO VELHO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3994, 'ENTRE RIOS DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3995, 'ENTRE-IJUÍS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3996, 'EREBANGO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3997, 'ERECHIM', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3998, 'ERNESTINA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (3999, 'ERVAL GRANDE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4000, 'ERVAL SECO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4001, 'ESMERALDA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4002, 'ESPERANÇA DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4003, 'ESPUMOSO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4004, 'ESTAÇÃO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4005, 'ESTÂNCIA VELHA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4006, 'ESTEIO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4007, 'ESTRELA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4008, 'ESTRELA VELHA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4009, 'EUGÊNIO DE CASTRO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4010, 'FAGUNDES VARELA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4011, 'FARROUPILHA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4012, 'FAXINAL DO SOTURNO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4013, 'FAXINALZINHO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4014, 'FAZENDA VILANOVA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4015, 'FELIZ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4016, 'FLORES DA CUNHA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4017, 'FLORIANO PEIXOTO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4018, 'FONTOURA XAVIER', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4019, 'FORMIGUEIRO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4020, 'FORQUETINHA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4021, 'FORTALEZA DOS VALOS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4022, 'FREDERICO WESTPHALEN', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4023, 'GARIBALDI', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4024, 'GARRUCHOS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4025, 'GAURAMA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4026, 'GENERAL CÂMARA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4027, 'GENTIL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4028, 'GETÚLIO VARGAS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4029, 'GIRUÁ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4030, 'GLORINHA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4031, 'GRAMADO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4032, 'GRAMADO DOS LOUREIROS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4033, 'GRAMADO XAVIER', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4034, 'GRAVATAÍ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4035, 'GUABIJU', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4036, 'GUAÍBA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4037, 'GUAPORÉ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4038, 'GUARANI DAS MISSÕES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4039, 'HARMONIA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4040, 'HERVAL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4041, 'HERVEIRAS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4042, 'HORIZONTINA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4043, 'HULHA NEGRA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4044, 'HUMAITÁ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4045, 'IBARAMA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4046, 'IBIAÇÁ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4047, 'IBIRAIARAS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4048, 'IBIRAPUITÃ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4049, 'IBIRUBÁ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4050, 'IGREJINHA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4051, 'IJUÍ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4052, 'ILÓPOLIS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4053, 'IMBÉ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4054, 'IMIGRANTE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4055, 'INDEPENDÊNCIA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4056, 'INHACORÁ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4057, 'IPÊ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4058, 'IPIRANGA DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4059, 'IRAÍ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4060, 'ITAARA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4061, 'ITACURUBI', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4062, 'ITAPUCA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4063, 'ITAQUI', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4064, 'ITATI', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4065, 'ITATIBA DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4066, 'IVORÁ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4067, 'IVOTI', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4068, 'JABOTICABA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4069, 'JACUIZINHO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4070, 'JACUTINGA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4071, 'JAGUARÃO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4072, 'JAGUARI', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4073, 'JAQUIRANA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4074, 'JARI', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4075, 'JÓIA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4076, 'JÚLIO DE CASTILHOS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4077, 'LAGOA BONITA DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4078, 'LAGOA DOS TRÊS CANTOS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4079, 'LAGOA VERMELHA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4080, 'LAGOÃO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4081, 'LAJEADO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4082, 'LAJEADO DO BUGRE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4083, 'LAVRAS DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4084, 'LIBERATO SALZANO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4085, 'LINDOLFO COLLOR', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4086, 'LINHA NOVA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4087, 'MAÇAMBARA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4088, 'MACHADINHO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4089, 'MAMPITUBA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4090, 'MANOEL VIANA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4091, 'MAQUINÉ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4092, 'MARATÁ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4093, 'MARAU', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4094, 'MARCELINO RAMOS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4095, 'MARIANA PIMENTEL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4096, 'MARIANO MORO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4097, 'MARQUES DE SOUZA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4098, 'MATA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4099, 'MATO CASTELHANO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4100, 'MATO LEITÃO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4101, 'MATO QUEIMADO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4102, 'MAXIMILIANO DE ALMEIDA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4103, 'MINAS DO LEÃO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4104, 'MIRAGUAÍ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4105, 'MONTAURI', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4106, 'MONTE ALEGRE DOS CAMPOS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4107, 'MONTE BELO DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4108, 'MONTENEGRO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4109, 'MORMAÇO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4110, 'MORRINHOS DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4111, 'MORRO REDONDO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4112, 'MORRO REUTER', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4113, 'MOSTARDAS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4114, 'MUÇUM', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4115, 'MUITOS CAPÕES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4116, 'MULITERNO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4117, 'NÃO-ME-TOQUE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4118, 'NICOLAU VERGUEIRO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4119, 'NONOAI', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4120, 'NOVA ALVORADA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4121, 'NOVA ARAÇÁ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4122, 'NOVA BASSANO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4123, 'NOVA BOA VISTA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4124, 'NOVA BRÉSCIA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4125, 'NOVA CANDELÁRIA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4126, 'NOVA ESPERANÇA DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4127, 'NOVA HARTZ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4128, 'NOVA PÁDUA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4129, 'NOVA PALMA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4130, 'NOVA PETRÓPOLIS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4131, 'NOVA PRATA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4132, 'NOVA RAMADA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4133, 'NOVA ROMA DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4134, 'NOVA SANTA RITA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4135, 'NOVO BARREIRO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4136, 'NOVO CABRAIS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4137, 'NOVO HAMBURGO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4138, 'NOVO MACHADO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4139, 'NOVO TIRADENTES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4140, 'NOVO XINGU', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4141, 'OSÓRIO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4142, 'PAIM FILHO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4143, 'PALMARES DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4144, 'PALMEIRA DAS MISSÕES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4145, 'PALMITINHO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4146, 'PANAMBI', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4147, 'PANTANO GRANDE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4148, 'PARAÍ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4149, 'PARAÍSO DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4150, 'PARECI NOVO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4151, 'PAROBÉ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4152, 'PASSA SETE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4153, 'PASSO DO SOBRADO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4154, 'PASSO FUNDO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4155, 'PAULO BENTO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4156, 'PAVERAMA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4157, 'PEDRAS ALTAS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4158, 'PEDRO OSÓRIO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4159, 'PEJUÇARA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4160, 'PELOTAS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4161, 'PICADA CAFÉ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4162, 'PINHAL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4163, 'PINHAL DA SERRA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4164, 'PINHAL GRANDE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4165, 'PINHEIRINHO DO VALE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4166, 'PINHEIRO MACHADO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4167, 'PIRAPÓ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4168, 'PIRATINI', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4169, 'PLANALTO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4170, 'POÇO DAS ANTAS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4171, 'PONTÃO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4172, 'PONTE PRETA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4173, 'PORTÃO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4174, 'PORTO ALEGRE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4175, 'PORTO LUCENA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4176, 'PORTO MAUÁ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4177, 'PORTO VERA CRUZ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4178, 'PORTO XAVIER', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4179, 'POUSO NOVO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4180, 'PRESIDENTE LUCENA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4181, 'PROGRESSO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4182, 'PROTÁSIO ALVES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4183, 'PUTINGA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4184, 'QUARAÍ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4185, 'QUATRO IRMÃOS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4186, 'QUEVEDOS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4187, 'QUINZE DE NOVEMBRO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4188, 'REDENTORA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4189, 'RELVADO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4190, 'RESTINGA SECA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4191, 'RIO DOS ÍNDIOS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4192, 'RIO GRANDE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4193, 'RIO PARDO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4194, 'RIOZINHO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4195, 'ROCA SALES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4196, 'RODEIO BONITO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4197, 'ROLADOR', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4198, 'ROLANTE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4199, 'RONDA ALTA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4200, 'RONDINHA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4201, 'ROQUE GONZALES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4202, 'ROSÁRIO DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4203, 'SAGRADA FAMÍLIA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4204, 'SALDANHA MARINHO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4205, 'SALTO DO JACUÍ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4206, 'SALVADOR DAS MISSÕES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4207, 'SALVADOR DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4208, 'SANANDUVA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4209, 'SANTA BÁRBARA DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4210, 'SANTA CECÍLIA DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4211, 'SANTA CLARA DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4212, 'SANTA CRUZ DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4213, 'SANTA MARGARIDA DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4214, 'SANTA MARIA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4215, 'SANTA MARIA DO HERVAL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4216, 'SANTA ROSA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4217, 'SANTA TEREZA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4218, 'SANTA VITÓRIA DO PALMAR', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4219, 'SANTANA DA BOA VISTA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4220, 'SANTANA DO LIVRAMENTO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4221, 'SANTIAGO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4222, 'SANTO ÂNGELO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4223, 'SANTO ANTÔNIO DA PATRULHA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4224, 'SANTO ANTÔNIO DAS MISSÕES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4225, 'SANTO ANTÔNIO DO PALMA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4226, 'SANTO ANTÔNIO DO PLANALTO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4227, 'SANTO AUGUSTO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4228, 'SANTO CRISTO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4229, 'SANTO EXPEDITO DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4230, 'SÃO BORJA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4231, 'SÃO DOMINGOS DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4232, 'SÃO FRANCISCO DE ASSIS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4233, 'SÃO FRANCISCO DE PAULA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4234, 'SÃO GABRIEL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4235, 'SÃO JERÔNIMO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4236, 'SÃO JOÃO DA URTIGA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4237, 'SÃO JOÃO DO POLÊSINE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4238, 'SÃO JORGE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4239, 'SÃO JOSÉ DAS MISSÕES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4240, 'SÃO JOSÉ DO HERVAL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4241, 'SÃO JOSÉ DO HORTÊNCIO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4242, 'SÃO JOSÉ DO INHACORÁ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4243, 'SÃO JOSÉ DO NORTE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4244, 'SÃO JOSÉ DO OURO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4245, 'SÃO JOSÉ DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4246, 'SÃO JOSÉ DOS AUSENTES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4247, 'SÃO LEOPOLDO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4248, 'SÃO LOURENÇO DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4249, 'SÃO LUIZ GONZAGA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4250, 'SÃO MARCOS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4251, 'SÃO MARTINHO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4252, 'SÃO MARTINHO DA SERRA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4253, 'SÃO MIGUEL DAS MISSÕES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4254, 'SÃO NICOLAU', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4255, 'SÃO PAULO DAS MISSÕES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4256, 'SÃO PEDRO DA SERRA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4257, 'SÃO PEDRO DAS MISSÕES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4258, 'SÃO PEDRO DO BUTIÁ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4259, 'SÃO PEDRO DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4260, 'SÃO SEBASTIÃO DO CAÍ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4261, 'SÃO SEPÉ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4262, 'SÃO VALENTIM', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4263, 'SÃO VALENTIM DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4264, 'SÃO VALÉRIO DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4265, 'SÃO VENDELINO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4266, 'SÃO VICENTE DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4267, 'SAPIRANGA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4268, 'SAPUCAIA DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4269, 'SARANDI', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4270, 'SEBERI', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4271, 'SEDE NOVA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4272, 'SEGREDO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4273, 'SELBACH', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4274, 'SENADOR SALGADO FILHO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4275, 'SENTINELA DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4276, 'SERAFINA CORRÊA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4277, 'SÉRIO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4278, 'SERTÃO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4279, 'SERTÃO SANTANA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4280, 'SETE DE SETEMBRO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4281, 'SEVERIANO DE ALMEIDA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4282, 'SILVEIRA MARTINS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4283, 'SINIMBU', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4284, 'SOBRADINHO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4285, 'SOLEDADE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4286, 'TABAÍ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4287, 'TAPEJARA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4288, 'TAPERA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4289, 'TAPES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4290, 'TAQUARA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4291, 'TAQUARI', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4292, 'TAQUARUÇU DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4293, 'TAVARES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4294, 'TENENTE PORTELA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4295, 'TERRA DE AREIA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4296, 'TEUTÔNIA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4297, 'TIO HUGO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4298, 'TIRADENTES DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4299, 'TOROPI', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4300, 'TORRES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4301, 'TRAMANDAÍ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4302, 'TRAVESSEIRO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4303, 'TRÊS ARROIOS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4304, 'TRÊS CACHOEIRAS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4305, 'TRÊS COROAS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4306, 'TRÊS DE MAIO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4307, 'TRÊS FORQUILHAS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4308, 'TRÊS PALMEIRAS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4309, 'TRÊS PASSOS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4310, 'TRINDADE DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4311, 'TRIUNFO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4312, 'TUCUNDUVA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4313, 'TUNAS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4314, 'TUPANCI DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4315, 'TUPANCIRETÃ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4316, 'TUPANDI', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4317, 'TUPARENDI', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4318, 'TURUÇU', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4319, 'UBIRETAMA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4320, 'UNIÃO DA SERRA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4321, 'UNISTALDA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4322, 'URUGUAIANA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4323, 'VACARIA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4324, 'VALE DO SOL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4325, 'VALE REAL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4326, 'VALE VERDE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4327, 'VANINI', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4328, 'VENÂNCIO AIRES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4329, 'VERA CRUZ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4330, 'VERANÓPOLIS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4331, 'VESPASIANO CORREA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4332, 'VIADUTOS', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4333, 'VIAMÃO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4334, 'VICENTE DUTRA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4335, 'VICTOR GRAEFF', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4336, 'VILA FLORES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4337, 'VILA LÂNGARO', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4338, 'VILA MARIA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4339, 'VILA NOVA DO SUL', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4340, 'VISTA ALEGRE', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4341, 'VISTA ALEGRE DO PRATA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4342, 'VISTA GAÚCHA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4343, 'VITÓRIA DAS MISSÕES', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4344, 'WESTFÁLIA', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4345, 'XANGRI-LÁ', 23);
INSERT INTO cidade (id, nome, estado) VALUES (4346, 'ALTA FLORESTA D`OESTE', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4347, 'ALTO ALEGRE DOS PARECIS', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4348, 'ALTO PARAÍSO', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4349, 'ALVORADA D`OESTE', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4350, 'ARIQUEMES', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4351, 'BURITIS', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4352, 'CABIXI', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4353, 'CACAULÂNDIA', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4354, 'CACOAL', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4355, 'CAMPO NOVO DE RONDÔNIA', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4356, 'CANDEIAS DO JAMARI', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4357, 'CASTANHEIRAS', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4358, 'CEREJEIRAS', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4359, 'CHUPINGUAIA', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4360, 'COLORADO DO OESTE', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4361, 'CORUMBIARA', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4362, 'COSTA MARQUES', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4363, 'CUJUBIM', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4364, 'ESPIGÃO D`OESTE', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4365, 'GOVERNADOR JORGE TEIXEIRA', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4366, 'GUAJARÁ-MIRIM', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4367, 'ITAPUÃ DO OESTE', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4368, 'JARU', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4369, 'JI-PARANÁ', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4370, 'MACHADINHO D`OESTE', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4371, 'MINISTRO ANDREAZZA', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4372, 'MIRANTE DA SERRA', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4373, 'MONTE NEGRO', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4374, 'NOVA BRASILÂNDIA D`OESTE', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4375, 'NOVA MAMORÉ', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4376, 'NOVA UNIÃO', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4377, 'NOVO HORIZONTE DO OESTE', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4378, 'OURO PRETO DO OESTE', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4379, 'PARECIS', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4380, 'PIMENTA BUENO', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4381, 'PIMENTEIRAS DO OESTE', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4382, 'PORTO VELHO', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4383, 'PRESIDENTE MÉDICI', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4384, 'PRIMAVERA DE RONDÔNIA', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4385, 'RIO CRESPO', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4386, 'ROLIM DE MOURA', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4387, 'SANTA LUZIA D`OESTE', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4388, 'SÃO FELIPE D`OESTE', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4389, 'SÃO FRANCISCO DO GUAPORÉ', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4390, 'SÃO MIGUEL DO GUAPORÉ', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4391, 'SERINGUEIRAS', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4392, 'TEIXEIRÓPOLIS', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4393, 'THEOBROMA', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4394, 'URUPÁ', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4395, 'VALE DO ANARI', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4396, 'VALE DO PARAÍSO', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4397, 'VILHENA', 21);
INSERT INTO cidade (id, nome, estado) VALUES (4398, 'ALTO ALEGRE', 22);
INSERT INTO cidade (id, nome, estado) VALUES (4399, 'AMAJARI', 22);
INSERT INTO cidade (id, nome, estado) VALUES (4400, 'BOA VISTA', 22);
INSERT INTO cidade (id, nome, estado) VALUES (4401, 'BONFIM', 22);
INSERT INTO cidade (id, nome, estado) VALUES (4402, 'CANTÁ', 22);
INSERT INTO cidade (id, nome, estado) VALUES (4403, 'CARACARAÍ', 22);
INSERT INTO cidade (id, nome, estado) VALUES (4404, 'CAROEBE', 22);
INSERT INTO cidade (id, nome, estado) VALUES (4405, 'IRACEMA', 22);
INSERT INTO cidade (id, nome, estado) VALUES (4406, 'MUCAJAÍ', 22);
INSERT INTO cidade (id, nome, estado) VALUES (4407, 'NORMANDIA', 22);
INSERT INTO cidade (id, nome, estado) VALUES (4408, 'PACARAIMA', 22);
INSERT INTO cidade (id, nome, estado) VALUES (4409, 'RORAINÓPOLIS', 22);
INSERT INTO cidade (id, nome, estado) VALUES (4410, 'SÃO JOÃO DA BALIZA', 22);
INSERT INTO cidade (id, nome, estado) VALUES (4411, 'SÃO LUIZ', 22);
INSERT INTO cidade (id, nome, estado) VALUES (4412, 'UIRAMUTÃ', 22);
INSERT INTO cidade (id, nome, estado) VALUES (4413, 'ABDON BATISTA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4414, 'ABELARDO LUZ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4415, 'AGROLÂNDIA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4416, 'AGRONÔMICA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4417, 'ÁGUA DOCE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4418, 'ÁGUAS DE CHAPECÓ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4419, 'ÁGUAS FRIAS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4420, 'ÁGUAS MORNAS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4421, 'ALFREDO WAGNER', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4422, 'ALTO BELA VISTA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4423, 'ANCHIETA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4424, 'ANGELINA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4425, 'ANITA GARIBALDI', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4426, 'ANITÁPOLIS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4427, 'ANTÔNIO CARLOS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4428, 'APIÚNA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4429, 'ARABUTÃ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4430, 'ARAQUARI', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4431, 'ARARANGUÁ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4432, 'ARMAZÉM', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4433, 'ARROIO TRINTA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4434, 'ARVOREDO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4435, 'ASCURRA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4436, 'ATALANTA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4437, 'AURORA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4438, 'BALNEÁRIO ARROIO DO SILVA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4439, 'BALNEÁRIO BARRA DO SUL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4440, 'BALNEÁRIO CAMBORIÚ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4441, 'BALNEÁRIO GAIVOTA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4442, 'BANDEIRANTE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4443, 'BARRA BONITA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4444, 'BARRA VELHA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4445, 'BELA VISTA DO TOLDO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4446, 'BELMONTE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4447, 'BENEDITO NOVO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4448, 'BIGUAÇU', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4449, 'BLUMENAU', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4450, 'BOCAINA DO SUL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4451, 'BOM JARDIM DA SERRA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4452, 'BOM JESUS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4453, 'BOM JESUS DO OESTE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4454, 'BOM RETIRO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4455, 'BOMBINHAS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4456, 'BOTUVERÁ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4457, 'BRAÇO DO NORTE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4458, 'BRAÇO DO TROMBUDO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4459, 'BRUNÓPOLIS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4460, 'BRUSQUE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4461, 'CAÇADOR', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4462, 'CAIBI', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4463, 'CALMON', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4464, 'CAMBORIÚ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4465, 'CAMPO ALEGRE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4466, 'CAMPO BELO DO SUL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4467, 'CAMPO ERÊ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4468, 'CAMPOS NOVOS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4469, 'CANELINHA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4470, 'CANOINHAS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4471, 'CAPÃO ALTO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4472, 'CAPINZAL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4473, 'CAPIVARI DE BAIXO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4474, 'CATANDUVAS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4475, 'CAXAMBU DO SUL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4476, 'CELSO RAMOS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4477, 'CERRO NEGRO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4478, 'CHAPADÃO DO LAGEADO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4479, 'CHAPECÓ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4480, 'COCAL DO SUL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4481, 'CONCÓRDIA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4482, 'CORDILHEIRA ALTA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4483, 'CORONEL FREITAS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4484, 'CORONEL MARTINS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4485, 'CORREIA PINTO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4486, 'CORUPÁ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4487, 'CRICIÚMA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4488, 'CUNHA PORÃ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4489, 'CUNHATAÍ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4490, 'CURITIBANOS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4491, 'DESCANSO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4492, 'DIONÍSIO CERQUEIRA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4493, 'DONA EMMA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4494, 'DOUTOR PEDRINHO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4495, 'ENTRE RIOS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4496, 'ERMO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4497, 'ERVAL VELHO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4498, 'FAXINAL DOS GUEDES', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4499, 'FLOR DO SERTÃO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4500, 'FLORIANÓPOLIS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4501, 'FORMOSA DO SUL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4502, 'FORQUILHINHA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4503, 'FRAIBURGO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4504, 'FREI ROGÉRIO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4505, 'GALVÃO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4506, 'GAROPABA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4507, 'GARUVA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4508, 'GASPAR', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4509, 'GOVERNADOR CELSO RAMOS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4510, 'GRÃO PARÁ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4511, 'GRAVATAL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4512, 'GUABIRUBA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4513, 'GUARACIABA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4514, 'GUARAMIRIM', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4515, 'GUARUJÁ DO SUL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4516, 'GUATAMBÚ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4517, 'HERVAL D`OESTE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4518, 'IBIAM', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4519, 'IBICARÉ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4520, 'IBIRAMA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4521, 'IÇARA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4522, 'ILHOTA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4523, 'IMARUÍ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4524, 'IMBITUBA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4525, 'IMBUIA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4526, 'INDAIAL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4527, 'IOMERÊ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4528, 'IPIRA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4529, 'IPORÃ DO OESTE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4530, 'IPUAÇU', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4531, 'IPUMIRIM', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4532, 'IRACEMINHA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4533, 'IRANI', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4534, 'IRATI', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4535, 'IRINEÓPOLIS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4536, 'ITÁ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4537, 'ITAIÓPOLIS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4538, 'ITAJAÍ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4539, 'ITAPEMA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4540, 'ITAPIRANGA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4541, 'ITAPOÁ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4542, 'ITUPORANGA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4543, 'JABORÁ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4544, 'JACINTO MACHADO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4545, 'JAGUARUNA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4546, 'JARAGUÁ DO SUL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4547, 'JARDINÓPOLIS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4548, 'JOAÇABA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4549, 'JOINVILLE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4550, 'JOSÉ BOITEUX', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4551, 'JUPIÁ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4552, 'LACERDÓPOLIS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4553, 'LAGES', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4554, 'LAGUNA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4555, 'LAJEADO GRANDE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4556, 'LAURENTINO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4557, 'LAURO MULLER', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4558, 'LEBON RÉGIS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4559, 'LEOBERTO LEAL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4560, 'LINDÓIA DO SUL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4561, 'LONTRAS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4562, 'LUIZ ALVES', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4563, 'LUZERNA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4564, 'MACIEIRA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4565, 'MAFRA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4566, 'MAJOR GERCINO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4567, 'MAJOR VIEIRA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4568, 'MARACAJÁ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4569, 'MARAVILHA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4570, 'MAREMA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4571, 'MASSARANDUBA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4572, 'MATOS COSTA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4573, 'MELEIRO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4574, 'MIRIM DOCE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4575, 'MODELO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4576, 'MONDAÍ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4577, 'MONTE CARLO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4578, 'MONTE CASTELO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4579, 'MORRO DA FUMAÇA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4580, 'MORRO GRANDE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4581, 'NAVEGANTES', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4582, 'NOVA ERECHIM', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4583, 'NOVA ITABERABA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4584, 'NOVA TRENTO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4585, 'NOVA VENEZA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4586, 'NOVO HORIZONTE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4587, 'ORLEANS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4588, 'OTACÍLIO COSTA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4589, 'OURO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4590, 'OURO VERDE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4591, 'PAIAL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4592, 'PAINEL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4593, 'PALHOÇA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4594, 'PALMA SOLA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4595, 'PALMEIRA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4596, 'PALMITOS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4597, 'PAPANDUVA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4598, 'PARAÍSO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4599, 'PASSO DE TORRES', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4600, 'PASSOS MAIA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4601, 'PAULO LOPES', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4602, 'PEDRAS GRANDES', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4603, 'PENHA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4604, 'PERITIBA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4605, 'PETROLÂNDIA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4606, 'PIÇARRAS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4607, 'PINHALZINHO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4608, 'PINHEIRO PRETO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4609, 'PIRATUBA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4610, 'PLANALTO ALEGRE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4611, 'POMERODE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4612, 'PONTE ALTA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4613, 'PONTE ALTA DO NORTE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4614, 'PONTE SERRADA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4615, 'PORTO BELO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4616, 'PORTO UNIÃO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4617, 'POUSO REDONDO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4618, 'PRAIA GRANDE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4619, 'PRESIDENTE CASTELO BRANCO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4620, 'PRESIDENTE GETÚLIO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4621, 'PRESIDENTE NEREU', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4622, 'PRINCESA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4623, 'QUILOMBO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4624, 'RANCHO QUEIMADO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4625, 'RIO DAS ANTAS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4626, 'RIO DO CAMPO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4627, 'RIO DO OESTE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4628, 'RIO DO SUL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4629, 'RIO DOS CEDROS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4630, 'RIO FORTUNA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4631, 'RIO NEGRINHO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4632, 'RIO RUFINO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4633, 'RIQUEZA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4634, 'RODEIO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4635, 'ROMELÂNDIA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4636, 'SALETE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4637, 'SALTINHO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4638, 'SALTO VELOSO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4639, 'SANGÃO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4640, 'SANTA CECÍLIA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4641, 'SANTA HELENA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4642, 'SANTA ROSA DE LIMA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4643, 'SANTA ROSA DO SUL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4644, 'SANTA TEREZINHA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4645, 'SANTA TEREZINHA DO PROGRESSO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4646, 'SANTIAGO DO SUL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4647, 'SANTO AMARO DA IMPERATRIZ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4648, 'SÃO BENTO DO SUL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4649, 'SÃO BERNARDINO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4650, 'SÃO BONIFÁCIO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4651, 'SÃO CARLOS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4652, 'SÃO CRISTOVÃO DO SUL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4653, 'SÃO DOMINGOS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4654, 'SÃO FRANCISCO DO SUL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4655, 'SÃO JOÃO BATISTA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4656, 'SÃO JOÃO DO ITAPERIÚ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4657, 'SÃO JOÃO DO OESTE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4658, 'SÃO JOÃO DO SUL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4659, 'SÃO JOAQUIM', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4660, 'SÃO JOSÉ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4661, 'SÃO JOSÉ DO CEDRO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4662, 'SÃO JOSÉ DO CERRITO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4663, 'SÃO LOURENÇO DO OESTE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4664, 'SÃO LUDGERO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4665, 'SÃO MARTINHO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4666, 'SÃO MIGUEL DA BOA VISTA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4667, 'SÃO MIGUEL DO OESTE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4668, 'SÃO PEDRO DE ALCÂNTARA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4669, 'SAUDADES', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4670, 'SCHROEDER', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4671, 'SEARA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4672, 'SERRA ALTA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4673, 'SIDERÓPOLIS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4674, 'SOMBRIO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4675, 'SUL BRASIL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4676, 'TAIÓ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4677, 'TANGARÁ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4678, 'TIGRINHOS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4679, 'TIJUCAS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4680, 'TIMBÉ DO SUL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4681, 'TIMBÓ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4682, 'TIMBÓ GRANDE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4683, 'TRÊS BARRAS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4684, 'TREVISO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4685, 'TREZE DE MAIO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4686, 'TREZE TÍLIAS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4687, 'TROMBUDO CENTRAL', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4688, 'TUBARÃO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4689, 'TUNÁPOLIS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4690, 'TURVO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4691, 'UNIÃO DO OESTE', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4692, 'URUBICI', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4693, 'URUPEMA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4694, 'URUSSANGA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4695, 'VARGEÃO', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4696, 'VARGEM', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4697, 'VARGEM BONITA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4698, 'VIDAL RAMOS', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4699, 'VIDEIRA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4700, 'VITOR MEIRELES', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4701, 'WITMARSUM', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4702, 'XANXERÊ', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4703, 'XAVANTINA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4704, 'XAXIM', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4705, 'ZORTÉA', 24);
INSERT INTO cidade (id, nome, estado) VALUES (4706, 'ADAMANTINA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4707, 'ADOLFO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4708, 'AGUAÍ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4709, 'ÁGUAS DA PRATA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4710, 'ÁGUAS DE LINDÓIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4711, 'ÁGUAS DE SANTA BÁRBARA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4712, 'ÁGUAS DE SÃO PEDRO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4713, 'AGUDOS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4714, 'ALAMBARI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4715, 'ALFREDO MARCONDES', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4716, 'ALTAIR', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4717, 'ALTINÓPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4718, 'ALTO ALEGRE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4719, 'ALUMÍNIO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4720, 'ÁLVARES FLORENCE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4721, 'ÁLVARES MACHADO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4722, 'ÁLVARO DE CARVALHO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4723, 'ALVINLÂNDIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4724, 'AMERICANA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4725, 'AMÉRICO BRASILIENSE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4726, 'AMÉRICO DE CAMPOS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4727, 'AMPARO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4728, 'ANALÂNDIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4729, 'ANDRADINA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4730, 'ANGATUBA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4731, 'ANHEMBI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4732, 'ANHUMAS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4733, 'APARECIDA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4734, 'APARECIDA D`OESTE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4735, 'APIAÍ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4736, 'ARAÇARIGUAMA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4737, 'ARAÇATUBA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4738, 'ARAÇOIABA DA SERRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4739, 'ARAMINA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4740, 'ARANDU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4741, 'ARAPEÍ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4742, 'ARARAQUARA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4743, 'ARARAS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4744, 'ARCO-ÍRIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4745, 'AREALVA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4746, 'AREIAS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4747, 'AREIÓPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4748, 'ARIRANHA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4749, 'ARTUR NOGUEIRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4750, 'ARUJÁ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4751, 'ASPÁSIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4752, 'ASSIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4753, 'ATIBAIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4754, 'AURIFLAMA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4755, 'AVAÍ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4756, 'AVANHANDAVA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4757, 'AVARÉ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4758, 'BADY BASSITT', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4759, 'BALBINOS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4760, 'BÁLSAMO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4761, 'BANANAL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4762, 'BARÃO DE ANTONINA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4763, 'BARBOSA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4764, 'BARIRI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4765, 'BARRA BONITA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4766, 'BARRA DO CHAPÉU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4767, 'BARRA DO TURVO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4768, 'BARRETOS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4769, 'BARRINHA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4770, 'BARUERI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4771, 'BASTOS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4772, 'BATATAIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4773, 'BAURU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4774, 'BEBEDOURO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4775, 'BENTO DE ABREU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4776, 'BERNARDINO DE CAMPOS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4777, 'BERTIOGA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4778, 'BILAC', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4779, 'BIRIGUI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4780, 'BIRITIBA-MIRIM', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4781, 'BOA ESPERANÇA DO SUL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4782, 'BOCAINA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4783, 'BOFETE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4784, 'BOITUVA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4785, 'BOM JESUS DOS PERDÕES', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4786, 'BOM SUCESSO DE ITARARÉ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4787, 'BORÁ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4788, 'BORACÉIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4789, 'BORBOREMA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4790, 'BOREBI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4791, 'BOTUCATU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4792, 'BRAGANÇA PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4793, 'BRAÚNA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4794, 'BREJO ALEGRE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4795, 'BRODOWSKI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4796, 'BROTAS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4797, 'BURI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4798, 'BURITAMA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4799, 'BURITIZAL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4800, 'CABRÁLIA PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4801, 'CABREÚVA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4802, 'CAÇAPAVA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4803, 'CACHOEIRA PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4804, 'CACONDE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4805, 'CAFELÂNDIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4806, 'CAIABU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4807, 'CAIEIRAS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4808, 'CAIUÁ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4809, 'CAJAMAR', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4810, 'CAJATI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4811, 'CAJOBI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4812, 'CAJURU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4813, 'CAMPINA DO MONTE ALEGRE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4814, 'CAMPINAS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4815, 'CAMPO LIMPO PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4816, 'CAMPOS DO JORDÃO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4817, 'CAMPOS NOVOS PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4818, 'CANANÉIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4819, 'CANAS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4820, 'CÂNDIDO MOTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4821, 'CÂNDIDO RODRIGUES', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4822, 'CANITAR', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4823, 'CAPÃO BONITO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4824, 'CAPELA DO ALTO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4825, 'CAPIVARI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4826, 'CARAGUATATUBA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4827, 'CARAPICUÍBA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4828, 'CARDOSO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4829, 'CASA BRANCA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4830, 'CÁSSIA DOS COQUEIROS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4831, 'CASTILHO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4832, 'CATANDUVA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4833, 'CATIGUÁ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4834, 'CEDRAL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4835, 'CERQUEIRA CÉSAR', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4836, 'CERQUILHO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4837, 'CESÁRIO LANGE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4838, 'CHARQUEADA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4839, 'CHAVANTES', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4840, 'CLEMENTINA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4841, 'COLINA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4842, 'COLÔMBIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4843, 'CONCHAL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4844, 'CONCHAS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4845, 'CORDEIRÓPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4846, 'COROADOS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4847, 'CORONEL MACEDO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4848, 'CORUMBATAÍ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4849, 'COSMÓPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4850, 'COSMORAMA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4851, 'COTIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4852, 'CRAVINHOS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4853, 'CRISTAIS PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4854, 'CRUZÁLIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4855, 'CRUZEIRO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4856, 'CUBATÃO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4857, 'CUNHA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4858, 'DESCALVADO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4859, 'DIADEMA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4860, 'DIRCE REIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4861, 'DIVINOLÂNDIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4862, 'DOBRADA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4863, 'DOIS CÓRREGOS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4864, 'DOLCINÓPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4865, 'DOURADO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4866, 'DRACENA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4867, 'DUARTINA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4868, 'DUMONT', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4869, 'ECHAPORÃ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4870, 'ELDORADO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4871, 'ELIAS FAUSTO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4872, 'ELISIÁRIO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4873, 'EMBAÚBA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4874, 'EMBU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4875, 'EMBU-GUAÇU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4876, 'EMILIANÓPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4877, 'ENGENHEIRO COELHO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4878, 'ESPÍRITO SANTO DO PINHAL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4879, 'ESPÍRITO SANTO DO TURVO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4880, 'ESTIVA GERBI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4881, 'ESTRELA D`OESTE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4882, 'ESTRELA DO NORTE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4883, 'EUCLIDES DA CUNHA PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4884, 'FARTURA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4885, 'FERNANDO PRESTES', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4886, 'FERNANDÓPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4887, 'FERNÃO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4888, 'FERRAZ DE VASCONCELOS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4889, 'FLORA RICA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4890, 'FLOREAL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4891, 'FLÓRIDA PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4892, 'FLORÍNIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4893, 'FRANCA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4894, 'FRANCISCO MORATO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4895, 'FRANCO DA ROCHA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4896, 'GABRIEL MONTEIRO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4897, 'GÁLIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4898, 'GARÇA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4899, 'GASTÃO VIDIGAL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4900, 'GAVIÃO PEIXOTO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4901, 'GENERAL SALGADO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4902, 'GETULINA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4903, 'GLICÉRIO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4904, 'GUAIÇARA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4905, 'GUAIMBÊ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4906, 'GUAÍRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4907, 'GUAPIAÇU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4908, 'GUAPIARA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4909, 'GUARÁ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4910, 'GUARAÇAÍ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4911, 'GUARACI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4912, 'GUARANI D`OESTE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4913, 'GUARANTÃ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4914, 'GUARARAPES', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4915, 'GUARAREMA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4916, 'GUARATINGUETÁ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4917, 'GUAREÍ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4918, 'GUARIBA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4919, 'GUARUJÁ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4920, 'GUARULHOS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4921, 'GUATAPARÁ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4922, 'GUZOLÂNDIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4923, 'HERCULÂNDIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4924, 'HOLAMBRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4925, 'HORTOLÂNDIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4926, 'IACANGA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4927, 'IACRI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4928, 'IARAS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4929, 'IBATÉ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4930, 'IBIRÁ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4931, 'IBIRAREMA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4932, 'IBITINGA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4933, 'IBIÚNA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4934, 'ICÉM', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4935, 'IEPÊ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4936, 'IGARAÇU DO TIETÊ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4937, 'IGARAPAVA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4938, 'IGARATÁ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4939, 'IGUAPE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4940, 'ILHA COMPRIDA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4941, 'ILHA SOLTEIRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4942, 'ILHABELA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4943, 'INDAIATUBA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4944, 'INDIANA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4945, 'INDIAPORÃ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4946, 'INÚBIA PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4947, 'IPAUSSU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4948, 'IPERÓ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4949, 'IPEÚNA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4950, 'IPIGUÁ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4951, 'IPORANGA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4952, 'IPUÃ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4953, 'IRACEMÁPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4954, 'IRAPUÃ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4955, 'IRAPURU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4956, 'ITABERÁ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4957, 'ITAÍ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4958, 'ITAJOBI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4959, 'ITAJU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4960, 'ITANHAÉM', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4961, 'ITAÓCA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4962, 'ITAPECERICA DA SERRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4963, 'ITAPETININGA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4964, 'ITAPEVA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4965, 'ITAPEVI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4966, 'ITAPIRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4967, 'ITAPIRAPUÃ PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4968, 'ITÁPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4969, 'ITAPORANGA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4970, 'ITAPUÍ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4971, 'ITAPURA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4972, 'ITAQUAQUECETUBA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4973, 'ITARARÉ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4974, 'ITARIRI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4975, 'ITATIBA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4976, 'ITATINGA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4977, 'ITIRAPINA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4978, 'ITIRAPUÃ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4979, 'ITOBI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4980, 'ITU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4981, 'ITUPEVA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4982, 'ITUVERAVA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4983, 'JABORANDI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4984, 'JABOTICABAL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4985, 'JACAREÍ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4986, 'JACI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4987, 'JACUPIRANGA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4988, 'JAGUARIÚNA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4989, 'JALES', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4990, 'JAMBEIRO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4991, 'JANDIRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4992, 'JARDINÓPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4993, 'JARINU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4994, 'JAÚ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4995, 'JERIQUARA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4996, 'JOANÓPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4997, 'JOÃO RAMALHO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4998, 'JOSÉ BONIFÁCIO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (4999, 'JÚLIO MESQUITA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5000, 'JUMIRIM', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5001, 'JUNDIAÍ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5002, 'JUNQUEIRÓPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5003, 'JUQUIÁ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5004, 'JUQUITIBA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5005, 'LAGOINHA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5006, 'LARANJAL PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5007, 'LAVÍNIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5008, 'LAVRINHAS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5009, 'LEME', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5010, 'LENÇÓIS PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5011, 'LIMEIRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5012, 'LINDÓIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5013, 'LINS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5014, 'LORENA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5015, 'LOURDES', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5016, 'LOUVEIRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5017, 'LUCÉLIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5018, 'LUCIANÓPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5019, 'LUÍS ANTÔNIO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5020, 'LUIZIÂNIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5021, 'LUPÉRCIO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5022, 'LUTÉCIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5023, 'MACATUBA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5024, 'MACAUBAL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5025, 'MACEDÔNIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5026, 'MAGDA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5027, 'MAIRINQUE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5028, 'MAIRIPORÃ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5029, 'MANDURI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5030, 'MARABÁ PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5031, 'MARACAÍ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5032, 'MARAPOAMA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5033, 'MARIÁPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5034, 'MARÍLIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5035, 'MARINÓPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5036, 'MARTINÓPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5037, 'MATÃO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5038, 'MAUÁ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5039, 'MENDONÇA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5040, 'MERIDIANO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5041, 'MESÓPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5042, 'MIGUELÓPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5043, 'MINEIROS DO TIETÊ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5044, 'MIRA ESTRELA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5045, 'MIRACATU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5046, 'MIRANDÓPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5047, 'MIRANTE DO PARANAPANEMA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5048, 'MIRASSOL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5049, 'MIRASSOLÂNDIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5050, 'MOCOCA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5051, 'MOGI DAS CRUZES', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5052, 'MOGI GUAÇU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5053, 'MOJI MIRIM', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5054, 'MOMBUCA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5055, 'MONÇÕES', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5056, 'MONGAGUÁ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5057, 'MONTE ALEGRE DO SUL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5058, 'MONTE ALTO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5059, 'MONTE APRAZÍVEL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5060, 'MONTE AZUL PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5061, 'MONTE CASTELO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5062, 'MONTE MOR', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5063, 'MONTEIRO LOBATO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5064, 'MORRO AGUDO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5065, 'MORUNGABA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5066, 'MOTUCA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5067, 'MURUTINGA DO SUL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5068, 'NANTES', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5069, 'NARANDIBA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5070, 'NATIVIDADE DA SERRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5071, 'NAZARÉ PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5072, 'NEVES PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5073, 'NHANDEARA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5074, 'NIPOÃ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5075, 'NOVA ALIANÇA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5076, 'NOVA CAMPINA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5077, 'NOVA CANAÃ PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5078, 'NOVA CASTILHO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5079, 'NOVA EUROPA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5080, 'NOVA GRANADA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5081, 'NOVA GUATAPORANGA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5082, 'NOVA INDEPENDÊNCIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5083, 'NOVA LUZITÂNIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5084, 'NOVA ODESSA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5085, 'NOVAIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5086, 'NOVO HORIZONTE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5087, 'NUPORANGA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5088, 'OCAUÇU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5089, 'ÓLEO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5090, 'OLÍMPIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5091, 'ONDA VERDE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5092, 'ORIENTE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5093, 'ORINDIÚVA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5094, 'ORLÂNDIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5095, 'OSASCO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5096, 'OSCAR BRESSANE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5097, 'OSVALDO CRUZ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5098, 'OURINHOS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5099, 'OURO VERDE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5100, 'OUROESTE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5101, 'PACAEMBU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5102, 'PALESTINA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5103, 'PALMARES PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5104, 'PALMEIRA D`OESTE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5105, 'PALMITAL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5106, 'PANORAMA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5107, 'PARAGUAÇU PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5108, 'PARAIBUNA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5109, 'PARAÍSO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5110, 'PARANAPANEMA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5111, 'PARANAPUÃ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5112, 'PARAPUÃ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5113, 'PARDINHO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5114, 'PARIQUERA-AÇU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5115, 'PARISI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5116, 'PATROCÍNIO PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5117, 'PAULICÉIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5118, 'PAULÍNIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5119, 'PAULISTÂNIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5120, 'PAULO DE FARIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5121, 'PEDERNEIRAS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5122, 'PEDRA BELA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5123, 'PEDRANÓPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5124, 'PEDREGULHO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5125, 'PEDREIRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5126, 'PEDRINHAS PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5127, 'PEDRO DE TOLEDO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5128, 'PENÁPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5129, 'PEREIRA BARRETO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5130, 'PEREIRAS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5131, 'PERUÍBE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5132, 'PIACATU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5133, 'PIEDADE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5134, 'PILAR DO SUL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5135, 'PINDAMONHANGABA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5136, 'PINDORAMA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5137, 'PINHALZINHO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5138, 'PIQUEROBI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5139, 'PIQUETE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5140, 'PIRACAIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5141, 'PIRACICABA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5142, 'PIRAJU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5143, 'PIRAJUÍ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5144, 'PIRANGI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5145, 'PIRAPORA DO BOM JESUS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5146, 'PIRAPOZINHO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5147, 'PIRASSUNUNGA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5148, 'PIRATININGA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5149, 'PITANGUEIRAS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5150, 'PLANALTO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5151, 'PLATINA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5152, 'POÁ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5153, 'POLONI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5154, 'POMPÉIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5155, 'PONGAÍ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5156, 'PONTAL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5157, 'PONTALINDA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5158, 'PONTES GESTAL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5159, 'POPULINA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5160, 'PORANGABA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5161, 'PORTO FELIZ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5162, 'PORTO FERREIRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5163, 'POTIM', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5164, 'POTIRENDABA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5165, 'PRACINHA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5166, 'PRADÓPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5167, 'PRAIA GRANDE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5168, 'PRATÂNIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5169, 'PRESIDENTE ALVES', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5170, 'PRESIDENTE BERNARDES', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5171, 'PRESIDENTE EPITÁCIO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5172, 'PRESIDENTE PRUDENTE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5173, 'PRESIDENTE VENCESLAU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5174, 'PROMISSÃO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5175, 'QUADRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5176, 'QUATÁ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5177, 'QUEIROZ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5178, 'QUELUZ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5179, 'QUINTANA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5180, 'RAFARD', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5181, 'RANCHARIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5182, 'REDENÇÃO DA SERRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5183, 'REGENTE FEIJÓ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5184, 'REGINÓPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5185, 'REGISTRO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5186, 'RESTINGA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5187, 'RIBEIRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5188, 'RIBEIRÃO BONITO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5189, 'RIBEIRÃO BRANCO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5190, 'RIBEIRÃO CORRENTE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5191, 'RIBEIRÃO DO SUL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5192, 'RIBEIRÃO DOS ÍNDIOS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5193, 'RIBEIRÃO GRANDE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5194, 'RIBEIRÃO PIRES', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5195, 'RIBEIRÃO PRETO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5196, 'RIFAINA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5197, 'RINCÃO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5198, 'RINÓPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5199, 'RIO CLARO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5200, 'RIO DAS PEDRAS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5201, 'RIO GRANDE DA SERRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5202, 'RIOLÂNDIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5203, 'RIVERSUL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5204, 'ROSANA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5205, 'ROSEIRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5206, 'RUBIÁCEA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5207, 'RUBINÉIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5208, 'SABINO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5209, 'SAGRES', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5210, 'SALES', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5211, 'SALES OLIVEIRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5212, 'SALESÓPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5213, 'SALMOURÃO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5214, 'SALTINHO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5215, 'SALTO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5216, 'SALTO DE PIRAPORA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5217, 'SALTO GRANDE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5218, 'SANDOVALINA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5219, 'SANTA ADÉLIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5220, 'SANTA ALBERTINA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5221, 'SANTA BÁRBARA D`OESTE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5222, 'SANTA BRANCA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5223, 'SANTA CLARA D`OESTE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5224, 'SANTA CRUZ DA CONCEIÇÃO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5225, 'SANTA CRUZ DA ESPERANÇA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5226, 'SANTA CRUZ DAS PALMEIRAS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5227, 'SANTA CRUZ DO RIO PARDO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5228, 'SANTA ERNESTINA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5229, 'SANTA FÉ DO SUL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5230, 'SANTA GERTRUDES', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5231, 'SANTA ISABEL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5232, 'SANTA LÚCIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5233, 'SANTA MARIA DA SERRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5234, 'SANTA MERCEDES', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5235, 'SANTA RITA D`OESTE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5236, 'SANTA RITA DO PASSA QUATRO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5237, 'SANTA ROSA DE VITERBO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5238, 'SANTA SALETE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5239, 'SANTANA DA PONTE PENSA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5240, 'SANTANA DE PARNAÍBA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5241, 'SANTO ANASTÁCIO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5242, 'SANTO ANDRÉ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5243, 'SANTO ANTÔNIO DA ALEGRIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5244, 'SANTO ANTÔNIO DE POSSE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5245, 'SANTO ANTÔNIO DO ARACANGUÁ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5246, 'SANTO ANTÔNIO DO JARDIM', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5247, 'SANTO ANTÔNIO DO PINHAL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5248, 'SANTO EXPEDITO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5249, 'SANTÓPOLIS DO AGUAPEÍ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5250, 'SANTOS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5251, 'SÃO BENTO DO SAPUCAÍ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5252, 'SÃO BERNARDO DO CAMPO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5253, 'SÃO CAETANO DO SUL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5254, 'SÃO CARLOS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5255, 'SÃO FRANCISCO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5256, 'SÃO JOÃO DA BOA VISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5257, 'SÃO JOÃO DAS DUAS PONTES', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5258, 'SÃO JOÃO DE IRACEMA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5259, 'SÃO JOÃO DO PAU D`ALHO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5260, 'SÃO JOAQUIM DA BARRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5261, 'SÃO JOSÉ DA BELA VISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5262, 'SÃO JOSÉ DO BARREIRO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5263, 'SÃO JOSÉ DO RIO PARDO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5264, 'SÃO JOSÉ DO RIO PRETO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5265, 'SÃO JOSÉ DOS CAMPOS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5266, 'SÃO LOURENÇO DA SERRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5267, 'SÃO LUÍS DO PARAITINGA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5268, 'SÃO MANUEL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5269, 'SÃO MIGUEL ARCANJO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5270, 'SÃO PAULO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5271, 'SÃO PEDRO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5272, 'SÃO PEDRO DO TURVO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5273, 'SÃO ROQUE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5274, 'SÃO SEBASTIÃO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5275, 'SÃO SEBASTIÃO DA GRAMA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5276, 'SÃO SIMÃO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5277, 'SÃO VICENTE', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5278, 'SARAPUÍ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5279, 'SARUTAIÁ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5280, 'SEBASTIANÓPOLIS DO SUL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5281, 'SERRA AZUL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5282, 'SERRA NEGRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5283, 'SERRANA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5284, 'SERTÃOZINHO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5285, 'SETE BARRAS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5286, 'SEVERÍNIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5287, 'SILVEIRAS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5288, 'SOCORRO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5289, 'SOROCABA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5290, 'SUD MENNUCCI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5291, 'SUMARÉ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5292, 'SUZANÁPOLIS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5293, 'SUZANO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5294, 'TABAPUÃ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5295, 'TABATINGA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5296, 'TABOÃO DA SERRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5297, 'TACIBA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5298, 'TAGUAÍ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5299, 'TAIAÇU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5300, 'TAIÚVA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5301, 'TAMBAÚ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5302, 'TANABI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5303, 'TAPIRAÍ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5304, 'TAPIRATIBA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5305, 'TAQUARAL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5306, 'TAQUARITINGA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5307, 'TAQUARITUBA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5308, 'TAQUARIVAÍ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5309, 'TARABAI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5310, 'TARUMÃ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5311, 'TATUÍ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5312, 'TAUBATÉ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5313, 'TEJUPÁ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5314, 'TEODORO SAMPAIO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5315, 'TERRA ROXA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5316, 'TIETÊ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5317, 'TIMBURI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5318, 'TORRE DE PEDRA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5319, 'TORRINHA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5320, 'TRABIJU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5321, 'TREMEMBÉ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5322, 'TRÊS FRONTEIRAS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5323, 'TUIUTI', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5324, 'TUPÃ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5325, 'TUPI PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5326, 'TURIÚBA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5327, 'TURMALINA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5328, 'UBARANA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5329, 'UBATUBA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5330, 'UBIRAJARA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5331, 'UCHOA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5332, 'UNIÃO PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5333, 'URÂNIA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5334, 'URU', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5335, 'URUPÊS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5336, 'VALENTIM GENTIL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5337, 'VALINHOS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5338, 'VALPARAÍSO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5339, 'VARGEM', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5340, 'VARGEM GRANDE DO SUL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5341, 'VARGEM GRANDE PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5342, 'VÁRZEA PAULISTA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5343, 'VERA CRUZ', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5344, 'VINHEDO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5345, 'VIRADOURO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5346, 'VISTA ALEGRE DO ALTO', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5347, 'VITÓRIA BRASIL', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5348, 'VOTORANTIM', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5349, 'VOTUPORANGA', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5350, 'ZACARIAS', 26);
INSERT INTO cidade (id, nome, estado) VALUES (5351, 'AMPARO DE SÃO FRANCISCO', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5352, 'AQUIDABÃ', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5353, 'ARACAJU', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5354, 'ARAUÁ', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5355, 'AREIA BRANCA', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5356, 'BARRA DOS COQUEIROS', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5357, 'BOQUIM', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5358, 'BREJO GRANDE', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5359, 'CAMPO DO BRITO', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5360, 'CANHOBA', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5361, 'CANINDÉ DE SÃO FRANCISCO', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5362, 'CAPELA', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5363, 'CARIRA', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5364, 'CARMÓPOLIS', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5365, 'CEDRO DE SÃO JOÃO', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5366, 'CRISTINÁPOLIS', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5367, 'CUMBE', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5368, 'DIVINA PASTORA', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5369, 'ESTÂNCIA', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5370, 'FEIRA NOVA', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5371, 'FREI PAULO', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5372, 'GARARU', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5373, 'GENERAL MAYNARD', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5374, 'GRACHO CARDOSO', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5375, 'ILHA DAS FLORES', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5376, 'INDIAROBA', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5377, 'ITABAIANA', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5378, 'ITABAIANINHA', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5379, 'ITABI', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5380, 'ITAPORANGA D`AJUDA', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5381, 'JAPARATUBA', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5382, 'JAPOATÃ', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5383, 'LAGARTO', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5384, 'LARANJEIRAS', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5385, 'MACAMBIRA', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5386, 'MALHADA DOS BOIS', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5387, 'MALHADOR', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5388, 'MARUIM', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5389, 'MOITA BONITA', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5390, 'MONTE ALEGRE DE SERGIPE', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5391, 'MURIBECA', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5392, 'NEÓPOLIS', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5393, 'NOSSA SENHORA APARECIDA', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5394, 'NOSSA SENHORA DA GLÓRIA', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5395, 'NOSSA SENHORA DAS DORES', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5396, 'NOSSA SENHORA DE LOURDES', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5397, 'NOSSA SENHORA DO SOCORRO', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5398, 'PACATUBA', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5399, 'PEDRA MOLE', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5400, 'PEDRINHAS', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5401, 'PINHÃO', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5402, 'PIRAMBU', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5403, 'POÇO REDONDO', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5404, 'POÇO VERDE', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5405, 'PORTO DA FOLHA', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5406, 'PROPRIÁ', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5407, 'RIACHÃO DO DANTAS', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5408, 'RIACHUELO', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5409, 'RIBEIRÓPOLIS', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5410, 'ROSÁRIO DO CATETE', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5411, 'SALGADO', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5412, 'SANTA LUZIA DO ITANHY', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5413, 'SANTA ROSA DE LIMA', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5414, 'SANTANA DO SÃO FRANCISCO', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5415, 'SANTO AMARO DAS BROTAS', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5416, 'SÃO CRISTÓVÃO', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5417, 'SÃO DOMINGOS', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5418, 'SÃO FRANCISCO', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5419, 'SÃO MIGUEL DO ALEIXO', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5420, 'SIMÃO DIAS', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5421, 'SIRIRI', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5422, 'TELHA', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5423, 'TOBIAS BARRETO', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5424, 'TOMAR DO GERU', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5425, 'UMBAÚBA', 25);
INSERT INTO cidade (id, nome, estado) VALUES (5426, 'ABREULÂNDIA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5427, 'AGUIARNÓPOLIS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5428, 'ALIANÇA DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5429, 'ALMAS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5430, 'ALVORADA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5431, 'ANANÁS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5432, 'ANGICO', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5433, 'APARECIDA DO RIO NEGRO', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5434, 'ARAGOMINAS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5435, 'ARAGUACEMA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5436, 'ARAGUAÇU', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5437, 'ARAGUAÍNA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5438, 'ARAGUANÃ', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5439, 'ARAGUATINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5440, 'ARAPOEMA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5441, 'ARRAIAS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5442, 'AUGUSTINÓPOLIS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5443, 'AURORA DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5444, 'AXIXÁ DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5445, 'BABAÇULÂNDIA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5446, 'BANDEIRANTES DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5447, 'BARRA DO OURO', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5448, 'BARROLÂNDIA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5449, 'BERNARDO SAYÃO', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5450, 'BOM JESUS DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5451, 'BRASILÂNDIA DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5452, 'BREJINHO DE NAZARÉ', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5453, 'BURITI DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5454, 'CACHOEIRINHA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5455, 'CAMPOS LINDOS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5456, 'CARIRI DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5457, 'CARMOLÂNDIA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5458, 'CARRASCO BONITO', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5459, 'CASEARA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5460, 'CENTENÁRIO', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5461, 'CHAPADA DA NATIVIDADE', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5462, 'CHAPADA DE AREIA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5463, 'COLINAS DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5464, 'COLMÉIA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5465, 'COMBINADO', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5466, 'CONCEIÇÃO DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5467, 'COUTO DE MAGALHÃES', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5468, 'CRISTALÂNDIA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5469, 'CRIXÁS DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5470, 'DARCINÓPOLIS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5471, 'DIANÓPOLIS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5472, 'DIVINÓPOLIS DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5473, 'DOIS IRMÃOS DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5474, 'DUERÉ', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5475, 'ESPERANTINA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5476, 'FÁTIMA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5477, 'FIGUEIRÓPOLIS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5478, 'FILADÉLFIA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5479, 'FORMOSO DO ARAGUAIA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5480, 'FORTALEZA DO TABOCÃO', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5481, 'GOIANORTE', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5482, 'GOIATINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5483, 'GUARAÍ', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5484, 'GURUPI', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5485, 'IPUEIRAS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5486, 'ITACAJÁ', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5487, 'ITAGUATINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5488, 'ITAPIRATINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5489, 'ITAPORÃ DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5490, 'JAÚ DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5491, 'JUARINA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5492, 'LAGOA DA CONFUSÃO', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5493, 'LAGOA DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5494, 'LAJEADO', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5495, 'LAVANDEIRA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5496, 'LIZARDA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5497, 'LUZINÓPOLIS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5498, 'MARIANÓPOLIS DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5499, 'MATEIROS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5500, 'MAURILÂNDIA DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5501, 'MIRACEMA DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5502, 'MIRANORTE', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5503, 'MONTE DO CARMO', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5504, 'MONTE SANTO DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5505, 'MURICILÂNDIA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5506, 'NATIVIDADE', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5507, 'NAZARÉ', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5508, 'NOVA OLINDA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5509, 'NOVA ROSALÂNDIA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5510, 'NOVO ACORDO', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5511, 'NOVO ALEGRE', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5512, 'NOVO JARDIM', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5513, 'OLIVEIRA DE FÁTIMA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5514, 'PALMAS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5515, 'PALMEIRANTE', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5516, 'PALMEIRAS DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5517, 'PALMEIRÓPOLIS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5518, 'PARAÍSO DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5519, 'PARANÃ', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5520, 'PAU D`ARCO', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5521, 'PEDRO AFONSO', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5522, 'PEIXE', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5523, 'PEQUIZEIRO', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5524, 'PINDORAMA DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5525, 'PIRAQUÊ', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5526, 'PIUM', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5527, 'PONTE ALTA DO BOM JESUS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5528, 'PONTE ALTA DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5529, 'PORTO ALEGRE DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5530, 'PORTO NACIONAL', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5531, 'PRAIA NORTE', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5532, 'PRESIDENTE KENNEDY', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5533, 'PUGMIL', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5534, 'RECURSOLÂNDIA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5535, 'RIACHINHO', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5536, 'RIO DA CONCEIÇÃO', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5537, 'RIO DOS BOIS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5538, 'RIO SONO', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5539, 'SAMPAIO', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5540, 'SANDOLÂNDIA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5541, 'SANTA FÉ DO ARAGUAIA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5542, 'SANTA MARIA DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5543, 'SANTA RITA DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5544, 'SANTA ROSA DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5545, 'SANTA TEREZA DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5546, 'SANTA TEREZINHA DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5547, 'SÃO BENTO DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5548, 'SÃO FÉLIX DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5549, 'SÃO MIGUEL DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5550, 'SÃO SALVADOR DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5551, 'SÃO SEBASTIÃO DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5552, 'SÃO VALÉRIO DA NATIVIDADE', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5553, 'SILVANÓPOLIS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5554, 'SÍTIO NOVO DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5555, 'SUCUPIRA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5556, 'TAGUATINGA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5557, 'TAIPAS DO TOCANTINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5558, 'TALISMÃ', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5559, 'TOCANTÍNIA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5560, 'TOCANTINÓPOLIS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5561, 'TUPIRAMA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5562, 'TUPIRATINS', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5563, 'WANDERLÂNDIA', 27);
INSERT INTO cidade (id, nome, estado) VALUES (5564, 'XAMBIOÁ', 27);
INSERT INTO cidade (id, nome, estado) VALUES (1, 'AFONSO CLÁUDIO', 8);


--
-- TOC entry 2425 (class 0 OID 0)
-- Dependencies: 190
-- Name: cidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cidade_id_seq', 5564, true);


--
-- TOC entry 2356 (class 0 OID 32810)
-- Dependencies: 191
-- Data for Name: dia_semana; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO dia_semana (id, nome) VALUES (5, 'SEXTA');
INSERT INTO dia_semana (id, nome) VALUES (6, 'SABADO');
INSERT INTO dia_semana (id, nome) VALUES (1, 'SEGUNDA');
INSERT INTO dia_semana (id, nome) VALUES (2, 'TERÇA');
INSERT INTO dia_semana (id, nome) VALUES (3, 'QUARTA');
INSERT INTO dia_semana (id, nome) VALUES (4, 'QUINTA');


--
-- TOC entry 2426 (class 0 OID 0)
-- Dependencies: 192
-- Name: dia_semana_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('dia_semana_id_seq', 6, true);


--
-- TOC entry 2358 (class 0 OID 32818)
-- Dependencies: 193
-- Data for Name: doacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO doacao (id, doadora_parto, banco) VALUES (1, 1, 1);
INSERT INTO doacao (id, doadora_parto, banco) VALUES (2, 2, 1);


--
-- TOC entry 2427 (class 0 OID 0)
-- Dependencies: 194
-- Name: doacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('doacao_id_seq', 2, true);


--
-- TOC entry 2360 (class 0 OID 32823)
-- Dependencies: 195
-- Data for Name: doadora; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO doadora (id, pessoa, ativo) VALUES (1, 1, true);
INSERT INTO doadora (id, pessoa, ativo) VALUES (2, 3, true);


--
-- TOC entry 2428 (class 0 OID 0)
-- Dependencies: 196
-- Name: doadora_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('doadora_id_seq', 2, true);


--
-- TOC entry 2392 (class 0 OID 49207)
-- Dependencies: 227
-- Data for Name: doadora_parto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO doadora_parto (id, doadora, data_parto, nome_bebe) VALUES (1, 1, '2015-08-31', 'CECILIA');
INSERT INTO doadora_parto (id, doadora, data_parto, nome_bebe) VALUES (2, 2, '2018-02-25', 'MARIAZINHA');


--
-- TOC entry 2429 (class 0 OID 0)
-- Dependencies: 226
-- Name: doadora_parto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('doadora_parto_id_seq', 2, true);


--
-- TOC entry 2385 (class 0 OID 33097)
-- Dependencies: 220
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO estado (id, sigla, nome) VALUES (2, 'AL', 'ALAGOAS');
INSERT INTO estado (id, sigla, nome) VALUES (3, 'AM', 'AMAZONAS');
INSERT INTO estado (id, sigla, nome) VALUES (4, 'AP', 'AMAPÁ');
INSERT INTO estado (id, sigla, nome) VALUES (5, 'BA', 'BAHIA');
INSERT INTO estado (id, sigla, nome) VALUES (6, 'CE', 'CEARÁ');
INSERT INTO estado (id, sigla, nome) VALUES (7, 'DF', 'DISTRITO FEDERAL');
INSERT INTO estado (id, sigla, nome) VALUES (8, 'ES', 'ESPÍRITO SANTO');
INSERT INTO estado (id, sigla, nome) VALUES (9, 'GO', 'GOIÁS');
INSERT INTO estado (id, sigla, nome) VALUES (10, 'MA', 'MARANHÃO');
INSERT INTO estado (id, sigla, nome) VALUES (11, 'MG', 'MINAS GERAIS');
INSERT INTO estado (id, sigla, nome) VALUES (12, 'MS', 'MATO GROSSO DO SUL');
INSERT INTO estado (id, sigla, nome) VALUES (13, 'MT', 'MATO GROSSO');
INSERT INTO estado (id, sigla, nome) VALUES (14, 'PA', 'PARÁ');
INSERT INTO estado (id, sigla, nome) VALUES (15, 'PB', 'PARAÍBA');
INSERT INTO estado (id, sigla, nome) VALUES (16, 'PE', 'PERNAMBUCO');
INSERT INTO estado (id, sigla, nome) VALUES (17, 'PI', 'PIAUÍ');
INSERT INTO estado (id, sigla, nome) VALUES (18, 'PR', 'PARANÁ');
INSERT INTO estado (id, sigla, nome) VALUES (19, 'RJ', 'RIO DE JANEIRO');
INSERT INTO estado (id, sigla, nome) VALUES (20, 'RN', 'RIO GRANDE DO NORTE');
INSERT INTO estado (id, sigla, nome) VALUES (21, 'RO', 'RONDÔNIA');
INSERT INTO estado (id, sigla, nome) VALUES (22, 'RR', 'RORAIMA');
INSERT INTO estado (id, sigla, nome) VALUES (23, 'RS', 'RIO GRANDE DO SUL');
INSERT INTO estado (id, sigla, nome) VALUES (24, 'SC', 'SANTA CATARINA');
INSERT INTO estado (id, sigla, nome) VALUES (25, 'SE', 'SERGIPE');
INSERT INTO estado (id, sigla, nome) VALUES (26, 'SP', 'SÃO PAULO');
INSERT INTO estado (id, sigla, nome) VALUES (27, 'TO', 'TOCANTINS');
INSERT INTO estado (id, sigla, nome) VALUES (1, 'AC', 'ACRE');


--
-- TOC entry 2430 (class 0 OID 0)
-- Dependencies: 219
-- Name: estado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estado_id_seq', 27, true);


--
-- TOC entry 2362 (class 0 OID 32838)
-- Dependencies: 197
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2431 (class 0 OID 0)
-- Dependencies: 198
-- Name: funcionario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('funcionario_id_seq', 1, false);


--
-- TOC entry 2364 (class 0 OID 32843)
-- Dependencies: 199
-- Data for Name: horario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO horario (id, nome) VALUES (1, 'MANHÃ');
INSERT INTO horario (id, nome) VALUES (2, 'TARDE');


--
-- TOC entry 2432 (class 0 OID 0)
-- Dependencies: 200
-- Name: horario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('horario_id_seq', 2, true);


--
-- TOC entry 2366 (class 0 OID 32851)
-- Dependencies: 201
-- Data for Name: motivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO motivo (id, nome) VALUES (1, 'DESISTÊNCIA');
INSERT INTO motivo (id, nome) VALUES (2, 'DOADORA NÃO LOCALIZADA');
INSERT INTO motivo (id, nome) VALUES (3, 'MOTOQUEIRO NÃO APARECEU');
INSERT INTO motivo (id, nome) VALUES (4, 'ROTA LOTADA');


--
-- TOC entry 2433 (class 0 OID 0)
-- Dependencies: 202
-- Name: motivo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('motivo_id_seq', 4, true);


--
-- TOC entry 2368 (class 0 OID 32859)
-- Dependencies: 203
-- Data for Name: motivo_status_agenda; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2434 (class 0 OID 0)
-- Dependencies: 204
-- Name: motivo_status_agenda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('motivo_status_agenda_id_seq', 1, false);


--
-- TOC entry 2370 (class 0 OID 32864)
-- Dependencies: 205
-- Data for Name: objetivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO objetivo (id, nome) VALUES (2, 'COLETAR POTE');
INSERT INTO objetivo (id, nome) VALUES (1, 'ENVIAR POTE');
INSERT INTO objetivo (id, nome) VALUES (3, 'ENVIO E COLETA DE POTE');


--
-- TOC entry 2435 (class 0 OID 0)
-- Dependencies: 206
-- Name: objetivo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('objetivo_id_seq', 3, true);


--
-- TOC entry 2388 (class 0 OID 49173)
-- Dependencies: 223
-- Data for Name: permissao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO permissao (id, descricao) VALUES (75, 'ROLE_PESQUISAR_STATUS_AGENDA');
INSERT INTO permissao (id, descricao) VALUES (25, 'ROLE_CADASTRAR_DIA_SEMANA');
INSERT INTO permissao (id, descricao) VALUES (26, 'ROLE_LISTAR_DIA_SEMANA');
INSERT INTO permissao (id, descricao) VALUES (27, 'ROLE_PESQUISAR_DIA_SEMANA');
INSERT INTO permissao (id, descricao) VALUES (28, 'ROLE_REMOVER_DIA_SEMANA');
INSERT INTO permissao (id, descricao) VALUES (29, 'ROLE_CADASTRAR_ESTADO');
INSERT INTO permissao (id, descricao) VALUES (30, 'ROLE_LISTAR_ESTADO');
INSERT INTO permissao (id, descricao) VALUES (31, 'ROLE_PESQUISAR_ESTADO');
INSERT INTO permissao (id, descricao) VALUES (32, 'ROLE_REMOVER_ESTADO');
INSERT INTO permissao (id, descricao) VALUES (33, 'ROLE_CADASTRAR_FILHO');
INSERT INTO permissao (id, descricao) VALUES (34, 'ROLE_LISTAR_FILHO');
INSERT INTO permissao (id, descricao) VALUES (35, 'ROLE_PESQUISAR_FILHO');
INSERT INTO permissao (id, descricao) VALUES (36, 'ROLE_REMOVER_FILHO');
INSERT INTO permissao (id, descricao) VALUES (41, 'ROLE_CADASTRAR_FUNCIONARIO');
INSERT INTO permissao (id, descricao) VALUES (1, 'ROLE_CADASTRAR_AGENDA');
INSERT INTO permissao (id, descricao) VALUES (2, 'ROLE_LISTAR_AGENDA');
INSERT INTO permissao (id, descricao) VALUES (3, 'ROLE_PESQUISAR_AGENDA');
INSERT INTO permissao (id, descricao) VALUES (4, 'ROLE_REMOVER_AGENDA');
INSERT INTO permissao (id, descricao) VALUES (42, 'ROLE_LISTAR_FUNCIONARIO');
INSERT INTO permissao (id, descricao) VALUES (5, 'ROLE_CADASTRAR_BAIRRO');
INSERT INTO permissao (id, descricao) VALUES (6, 'ROLE_LISTAR_BAIRRO');
INSERT INTO permissao (id, descricao) VALUES (7, 'ROLE_PESQUISAR_BAIRRO');
INSERT INTO permissao (id, descricao) VALUES (8, 'ROLE_REMOVER_BAIRRO');
INSERT INTO permissao (id, descricao) VALUES (9, 'ROLE_CADASTRAR_BANCO');
INSERT INTO permissao (id, descricao) VALUES (10, 'ROLE_LISTAR_BANCO');
INSERT INTO permissao (id, descricao) VALUES (11, 'ROLE_PESQUISAR_BANCO');
INSERT INTO permissao (id, descricao) VALUES (12, 'ROLE_REMOVER_BANCO');
INSERT INTO permissao (id, descricao) VALUES (13, 'ROLE_CADASTRAR_CIDADE');
INSERT INTO permissao (id, descricao) VALUES (14, 'ROLE_LISTAR_CIDADE');
INSERT INTO permissao (id, descricao) VALUES (15, 'ROLE_PESQUISAR_CIDADE');
INSERT INTO permissao (id, descricao) VALUES (16, 'ROLE_REMOVER_CIDADE');
INSERT INTO permissao (id, descricao) VALUES (43, 'ROLE_PESQUISAR_FUNCIONARIO');
INSERT INTO permissao (id, descricao) VALUES (44, 'ROLE_REMOVER_FUNCIONARIO');
INSERT INTO permissao (id, descricao) VALUES (45, 'ROLE_CADASTRAR_HORARIO');
INSERT INTO permissao (id, descricao) VALUES (46, 'ROLE_LISTAR_HORARIO');
INSERT INTO permissao (id, descricao) VALUES (17, 'ROLE_CADASTRAR_DOACAO');
INSERT INTO permissao (id, descricao) VALUES (18, 'ROLE_LISTAR_DOACAO');
INSERT INTO permissao (id, descricao) VALUES (19, 'ROLE_PESQUISAR_DOACAO');
INSERT INTO permissao (id, descricao) VALUES (20, 'ROLE_REMOVER_DOACAO');
INSERT INTO permissao (id, descricao) VALUES (21, 'ROLE_CADASTRAR_DOADORA');
INSERT INTO permissao (id, descricao) VALUES (22, 'ROLE_LISTAR_DOADORA');
INSERT INTO permissao (id, descricao) VALUES (23, 'ROLE_PESQUISAR_DOADORA');
INSERT INTO permissao (id, descricao) VALUES (24, 'ROLE_REMOVER_DOADORA');
INSERT INTO permissao (id, descricao) VALUES (76, 'ROLE_REMOVER_STATUS_AGENDA');
INSERT INTO permissao (id, descricao) VALUES (47, 'ROLE_PESQUISAR_HORARIO');
INSERT INTO permissao (id, descricao) VALUES (48, 'ROLE_REMOVER_HORARIO');
INSERT INTO permissao (id, descricao) VALUES (49, 'ROLE_CADASTRAR_MOTIVO');
INSERT INTO permissao (id, descricao) VALUES (50, 'ROLE_LISTAR_MOTIVO');
INSERT INTO permissao (id, descricao) VALUES (51, 'ROLE_PESQUISAR_MOTIVO');
INSERT INTO permissao (id, descricao) VALUES (52, 'ROLE_REMOVER_MOTIVO');
INSERT INTO permissao (id, descricao) VALUES (53, 'ROLE_CADASTRAR_MOTIVO_STATUS_AGENDA');
INSERT INTO permissao (id, descricao) VALUES (54, 'ROLE_LISTAR_MOTIVO_STATUS_AGENDA');
INSERT INTO permissao (id, descricao) VALUES (55, 'ROLE_PESQUISAR_MOTIVO_STATUS_AGENDA');
INSERT INTO permissao (id, descricao) VALUES (56, 'ROLE_REMOVER_MOTIVO_STATUS_AGENDA');
INSERT INTO permissao (id, descricao) VALUES (57, 'ROLE_CADASTRAR_OBJETIVO');
INSERT INTO permissao (id, descricao) VALUES (58, 'ROLE_LISTAR_OBJETIVO');
INSERT INTO permissao (id, descricao) VALUES (59, 'ROLE_PESQUISAR_OBJETIVO');
INSERT INTO permissao (id, descricao) VALUES (60, 'ROLE_REMOVER_OBJETIVO');
INSERT INTO permissao (id, descricao) VALUES (61, 'ROLE_CADASTRAR_PESSOA');
INSERT INTO permissao (id, descricao) VALUES (62, 'ROLE_LISTAR_PESSOA');
INSERT INTO permissao (id, descricao) VALUES (63, 'ROLE_PESQUISAR_PESSOA');
INSERT INTO permissao (id, descricao) VALUES (64, 'ROLE_REMOVER_PESSOA');
INSERT INTO permissao (id, descricao) VALUES (65, 'ROLE_CADASTRAR_ROTA');
INSERT INTO permissao (id, descricao) VALUES (66, 'ROLE_LISTAR_ROTA');
INSERT INTO permissao (id, descricao) VALUES (67, 'ROLE_PESQUISAR_ROTA');
INSERT INTO permissao (id, descricao) VALUES (68, 'ROLE_REMOVER_ROTA');
INSERT INTO permissao (id, descricao) VALUES (69, 'ROLE_CADASTRAR_STATUS');
INSERT INTO permissao (id, descricao) VALUES (70, 'ROLE_LISTAR_STATUS');
INSERT INTO permissao (id, descricao) VALUES (71, 'ROLE_PESQUISAR_STATUS');
INSERT INTO permissao (id, descricao) VALUES (72, 'ROLE_REMOVER_STATUS');
INSERT INTO permissao (id, descricao) VALUES (73, 'ROLE_CADASTRAR_STATUS_AGENDA');
INSERT INTO permissao (id, descricao) VALUES (74, 'ROLE_LISTAR_STATUS_AGENDA');
INSERT INTO permissao (id, descricao) VALUES (77, 'ROLE_CADASTRAR_USUARIO');
INSERT INTO permissao (id, descricao) VALUES (78, 'ROLE_LISTAR_USUARIO');
INSERT INTO permissao (id, descricao) VALUES (79, 'ROLE_PESQUISAR_USUARIO');
INSERT INTO permissao (id, descricao) VALUES (80, 'ROLE_REMOVER_USUARIO');
INSERT INTO permissao (id, descricao) VALUES (37, 'ROLE_CADASTRAR_DOADORA_PARTO');
INSERT INTO permissao (id, descricao) VALUES (38, 'ROLE_LISTAR_DOADORA_PARTO');
INSERT INTO permissao (id, descricao) VALUES (39, 'ROLE_PESQUISAR_DOADORA_PARTO');
INSERT INTO permissao (id, descricao) VALUES (40, 'ROLE_REMOVER_DOADORA_PARTO');


--
-- TOC entry 2372 (class 0 OID 32872)
-- Dependencies: 207
-- Data for Name: pessoa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pessoa (id, nome, data_nascimento, logradouro, numero, bairro, complemento) VALUES (1, 'RENATA FACO DE SABOIA CASTRO', '1980-05-27', 'RUA CORONEL JOAO CARNEIRO', '67', 56, 'APT 705');
INSERT INTO pessoa (id, nome, data_nascimento, logradouro, numero, bairro, complemento) VALUES (2, 'ENFERMEIRA DA SILVA SANTOS', '1976-03-20', 'RUA JAIME BENEVOLO', '150', 56, 'PROXIMO DOMINGOS OLIMPIO');
INSERT INTO pessoa (id, nome, data_nascimento, logradouro, numero, bairro, complemento) VALUES (3, 'MARIA TIBURCIO CAVALCANTE', '1985-11-15', 'RUA TIBURCIO CAVALCANTE', '3310', 17, 'APT 1201');


--
-- TOC entry 2436 (class 0 OID 0)
-- Dependencies: 208
-- Name: pessoa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pessoa_id_seq', 3, true);


--
-- TOC entry 2374 (class 0 OID 32880)
-- Dependencies: 209
-- Data for Name: rota; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO rota (id, horario, dia_semana) VALUES (1, 1, 1);
INSERT INTO rota (id, horario, dia_semana) VALUES (2, 2, 1);
INSERT INTO rota (id, horario, dia_semana) VALUES (3, 1, 2);
INSERT INTO rota (id, horario, dia_semana) VALUES (4, 2, 2);
INSERT INTO rota (id, horario, dia_semana) VALUES (5, 1, 3);
INSERT INTO rota (id, horario, dia_semana) VALUES (6, 2, 3);
INSERT INTO rota (id, horario, dia_semana) VALUES (7, 1, 4);
INSERT INTO rota (id, horario, dia_semana) VALUES (8, 2, 4);
INSERT INTO rota (id, horario, dia_semana) VALUES (9, 1, 5);
INSERT INTO rota (id, horario, dia_semana) VALUES (10, 2, 5);
INSERT INTO rota (id, horario, dia_semana) VALUES (11, 1, 6);
INSERT INTO rota (id, horario, dia_semana) VALUES (12, 2, 6);


--
-- TOC entry 2437 (class 0 OID 0)
-- Dependencies: 210
-- Name: rota_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rota_id_seq', 12, true);


--
-- TOC entry 2376 (class 0 OID 32885)
-- Dependencies: 211
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO status (id, nome) VALUES (1, 'SOLICITADO');
INSERT INTO status (id, nome) VALUES (2, 'CONFIRMADO');
INSERT INTO status (id, nome) VALUES (4, 'CANCELADO');
INSERT INTO status (id, nome) VALUES (5, 'REAGENDADO');
INSERT INTO status (id, nome) VALUES (3, 'CONCLUÍDO');


--
-- TOC entry 2377 (class 0 OID 32891)
-- Dependencies: 212
-- Data for Name: status_agenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO status_agenda (id, data, agenda, status, observacao, usuario) VALUES (1, '2018-03-20', 4, 1, NULL, 1);
INSERT INTO status_agenda (id, data, agenda, status, observacao, usuario) VALUES (2, '2018-03-21', 4, 2, NULL, 2);
INSERT INTO status_agenda (id, data, agenda, status, observacao, usuario) VALUES (3, '2018-03-24', 5, 1, NULL, 3);
INSERT INTO status_agenda (id, data, agenda, status, observacao, usuario) VALUES (6, '2018-03-25', 5, 2, NULL, 2);
INSERT INTO status_agenda (id, data, agenda, status, observacao, usuario) VALUES (7, '2018-03-25', 4, 3, NULL, 2);


--
-- TOC entry 2438 (class 0 OID 0)
-- Dependencies: 213
-- Name: status_agenda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('status_agenda_id_seq', 7, true);


--
-- TOC entry 2439 (class 0 OID 0)
-- Dependencies: 214
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('status_id_seq', 5, true);


--
-- TOC entry 2380 (class 0 OID 32901)
-- Dependencies: 215
-- Data for Name: tipo_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipo_usuario (id, nome) VALUES (1, 'DOADORA');
INSERT INTO tipo_usuario (id, nome) VALUES (2, 'FUNCIONARIO');


--
-- TOC entry 2440 (class 0 OID 0)
-- Dependencies: 216
-- Name: tipo_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_usuario_id_seq', 2, true);


--
-- TOC entry 2390 (class 0 OID 49183)
-- Dependencies: 225
-- Data for Name: tipo_usuario_permissao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (1, 1, 1);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (2, 1, 3);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (3, 1, 6);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (4, 1, 10);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (5, 1, 14);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (6, 1, 17);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (7, 1, 19);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (8, 1, 21);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (9, 1, 23);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (10, 1, 26);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (11, 1, 30);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (12, 1, 33);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (13, 1, 35);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (14, 1, 37);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (15, 1, 39);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (16, 1, 46);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (17, 1, 50);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (18, 1, 53);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (21, 1, 55);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (22, 1, 58);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (24, 1, 61);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (25, 1, 63);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (26, 1, 66);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (27, 1, 70);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (28, 1, 73);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (29, 1, 75);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (30, 1, 77);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (31, 1, 79);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (32, 2, 1);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (33, 2, 3);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (34, 2, 6);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (35, 2, 10);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (36, 2, 14);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (39, 2, 17);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (40, 2, 18);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (41, 2, 19);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (42, 2, 21);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (43, 2, 22);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (44, 2, 23);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (47, 2, 26);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (48, 2, 30);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (49, 2, 33);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (50, 2, 34);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (51, 2, 35);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (52, 2, 37);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (53, 2, 38);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (54, 2, 39);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (55, 2, 46);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (58, 2, 49);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (59, 2, 50);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (60, 2, 51);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (61, 2, 53);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (62, 2, 54);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (63, 2, 55);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (64, 2, 58);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (65, 2, 61);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (66, 2, 62);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (69, 2, 63);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (70, 2, 66);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (71, 2, 70);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (72, 2, 73);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (73, 2, 74);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (74, 2, 75);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (75, 2, 77);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (76, 2, 78);
INSERT INTO tipo_usuario_permissao (id, tipo_usuario, permissao) VALUES (77, 2, 79);


--
-- TOC entry 2441 (class 0 OID 0)
-- Dependencies: 224
-- Name: tipo_usuario_permissao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_usuario_permissao_id_seq', 77, true);


--
-- TOC entry 2382 (class 0 OID 32909)
-- Dependencies: 217
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario (id, email, password, tipo_usuario, pessoa, ativo) VALUES (1, 'renatafacocastro@gmail.com', '$2a$10$6dV4dX0qX5mOReKukuUQZ.Ug5Q/aWKMLZuVhcD7FVcoCPY2RwrU..', 1, 1, true);
INSERT INTO usuario (id, email, password, tipo_usuario, pessoa, ativo) VALUES (2, 'enfermeiradasilva@gmail.com', '$2a$10$aY92MjBKBg.pWkS0e7jsK.DE6z.sBFYlBQmafrpx6ZNKuiktMRLHC', 2, 2, true);
INSERT INTO usuario (id, email, password, tipo_usuario, pessoa, ativo) VALUES (3, 'mariatibuscio@gmail.com', '$2a$10$Q96qHcdo7rJSeVoWzYPMLON19d1MYSK5dzem/Cd./9DJ26kHrKvR6', 1, 3, true);


--
-- TOC entry 2442 (class 0 OID 0)
-- Dependencies: 218
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_seq', 3, true);


--
-- TOC entry 2166 (class 2606 OID 32937)
-- Name: agenda agenda_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agenda
    ADD CONSTRAINT agenda_pk PRIMARY KEY (id);


--
-- TOC entry 2168 (class 2606 OID 32939)
-- Name: bairro bairro_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bairro
    ADD CONSTRAINT bairro_pk PRIMARY KEY (id);


--
-- TOC entry 2202 (class 2606 OID 40992)
-- Name: banco banco_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY banco
    ADD CONSTRAINT banco_pk PRIMARY KEY (id);


--
-- TOC entry 2170 (class 2606 OID 32941)
-- Name: cidade cidade_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT cidade_pk PRIMARY KEY (id);


--
-- TOC entry 2172 (class 2606 OID 32943)
-- Name: dia_semana dia_semana_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dia_semana
    ADD CONSTRAINT dia_semana_pk PRIMARY KEY (id);


--
-- TOC entry 2174 (class 2606 OID 32945)
-- Name: doacao doacao_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY doacao
    ADD CONSTRAINT doacao_pk PRIMARY KEY (id);


--
-- TOC entry 2208 (class 2606 OID 49212)
-- Name: doadora_parto doadora_parto_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY doadora_parto
    ADD CONSTRAINT doadora_parto_pk PRIMARY KEY (id);


--
-- TOC entry 2176 (class 2606 OID 32947)
-- Name: doadora doadora_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY doadora
    ADD CONSTRAINT doadora_pk PRIMARY KEY (id);


--
-- TOC entry 2200 (class 2606 OID 33105)
-- Name: estado estado_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_pk PRIMARY KEY (id);


--
-- TOC entry 2178 (class 2606 OID 32953)
-- Name: funcionario funcionario_fk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_fk PRIMARY KEY (id);


--
-- TOC entry 2180 (class 2606 OID 32955)
-- Name: horario horario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY horario
    ADD CONSTRAINT horario_pk PRIMARY KEY (id);


--
-- TOC entry 2182 (class 2606 OID 32957)
-- Name: motivo motivo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY motivo
    ADD CONSTRAINT motivo_pk PRIMARY KEY (id);


--
-- TOC entry 2184 (class 2606 OID 32959)
-- Name: motivo_status_agenda motivo_status_agenda_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY motivo_status_agenda
    ADD CONSTRAINT motivo_status_agenda_pk PRIMARY KEY (id);


--
-- TOC entry 2186 (class 2606 OID 32961)
-- Name: objetivo objetivo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY objetivo
    ADD CONSTRAINT objetivo_pk PRIMARY KEY (id);


--
-- TOC entry 2204 (class 2606 OID 49180)
-- Name: permissao permissao_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permissao
    ADD CONSTRAINT permissao_pk PRIMARY KEY (id);


--
-- TOC entry 2188 (class 2606 OID 32963)
-- Name: pessoa pessoa_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pessoa
    ADD CONSTRAINT pessoa_pk PRIMARY KEY (id);


--
-- TOC entry 2190 (class 2606 OID 32965)
-- Name: rota rota_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rota
    ADD CONSTRAINT rota_pk PRIMARY KEY (id);


--
-- TOC entry 2194 (class 2606 OID 32967)
-- Name: status_agenda status_agenda_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY status_agenda
    ADD CONSTRAINT status_agenda_pk PRIMARY KEY (id);


--
-- TOC entry 2192 (class 2606 OID 32969)
-- Name: status status_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY status
    ADD CONSTRAINT status_pk PRIMARY KEY (id);


--
-- TOC entry 2206 (class 2606 OID 49188)
-- Name: tipo_usuario_permissao tipo_usuario_permissao_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_usuario_permissao
    ADD CONSTRAINT tipo_usuario_permissao_pk PRIMARY KEY (id);


--
-- TOC entry 2196 (class 2606 OID 32971)
-- Name: tipo_usuario tipo_usuario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_usuario
    ADD CONSTRAINT tipo_usuario_pk PRIMARY KEY (id);


--
-- TOC entry 2198 (class 2606 OID 32973)
-- Name: usuario usuario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pk PRIMARY KEY (id);


--
-- TOC entry 2211 (class 2606 OID 33090)
-- Name: agenda agenda_doacao_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agenda
    ADD CONSTRAINT agenda_doacao_fk FOREIGN KEY (doacao) REFERENCES doacao(id);


--
-- TOC entry 2209 (class 2606 OID 32979)
-- Name: agenda agenda_objetivo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agenda
    ADD CONSTRAINT agenda_objetivo_fk FOREIGN KEY (objetivo) REFERENCES objetivo(id);


--
-- TOC entry 2210 (class 2606 OID 32984)
-- Name: agenda agenda_rota_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agenda
    ADD CONSTRAINT agenda_rota_fk FOREIGN KEY (rota) REFERENCES rota(id);


--
-- TOC entry 2212 (class 2606 OID 32994)
-- Name: bairro bairro_cidade_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bairro
    ADD CONSTRAINT bairro_cidade_fk FOREIGN KEY (cidade) REFERENCES cidade(id);


--
-- TOC entry 2228 (class 2606 OID 40993)
-- Name: banco banco_bairro_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY banco
    ADD CONSTRAINT banco_bairro_fk FOREIGN KEY (bairro) REFERENCES bairro(id);


--
-- TOC entry 2213 (class 2606 OID 33113)
-- Name: cidade cidade_estado_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT cidade_estado_fk FOREIGN KEY (estado) REFERENCES estado(id);


--
-- TOC entry 2214 (class 2606 OID 40998)
-- Name: doacao doacao_banco_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY doacao
    ADD CONSTRAINT doacao_banco_fk FOREIGN KEY (banco) REFERENCES banco(id);


--
-- TOC entry 2215 (class 2606 OID 49226)
-- Name: doacao doacao_doadora_parto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY doacao
    ADD CONSTRAINT doacao_doadora_parto_fk FOREIGN KEY (doadora_parto) REFERENCES doadora_parto(id);


--
-- TOC entry 2231 (class 2606 OID 49213)
-- Name: doadora_parto doadora_parto_doadora_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY doadora_parto
    ADD CONSTRAINT doadora_parto_doadora_fk FOREIGN KEY (doadora) REFERENCES doadora(id);


--
-- TOC entry 2216 (class 2606 OID 33009)
-- Name: doadora doadora_pessoa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY doadora
    ADD CONSTRAINT doadora_pessoa_fk FOREIGN KEY (pessoa) REFERENCES pessoa(id);


--
-- TOC entry 2217 (class 2606 OID 33029)
-- Name: funcionario funcionario_pessoa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_pessoa_fk FOREIGN KEY (pessoa) REFERENCES pessoa(id);


--
-- TOC entry 2218 (class 2606 OID 33034)
-- Name: motivo_status_agenda motivo_status_agenda_motivo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY motivo_status_agenda
    ADD CONSTRAINT motivo_status_agenda_motivo_fk FOREIGN KEY (motivo) REFERENCES motivo(id);


--
-- TOC entry 2219 (class 2606 OID 33039)
-- Name: motivo_status_agenda motivo_status_agenda_status_agenda_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY motivo_status_agenda
    ADD CONSTRAINT motivo_status_agenda_status_agenda_fk FOREIGN KEY (status_agenda) REFERENCES status_agenda(id);


--
-- TOC entry 2220 (class 2606 OID 33044)
-- Name: pessoa pessoa_bairro_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pessoa
    ADD CONSTRAINT pessoa_bairro_fk FOREIGN KEY (bairro) REFERENCES bairro(id);


--
-- TOC entry 2221 (class 2606 OID 33049)
-- Name: rota rota_dia_semana_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rota
    ADD CONSTRAINT rota_dia_semana_fk FOREIGN KEY (dia_semana) REFERENCES dia_semana(id);


--
-- TOC entry 2222 (class 2606 OID 33054)
-- Name: rota rota_horario_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rota
    ADD CONSTRAINT rota_horario_fk FOREIGN KEY (horario) REFERENCES horario(id);


--
-- TOC entry 2223 (class 2606 OID 33059)
-- Name: status_agenda status_agenda_agenda_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY status_agenda
    ADD CONSTRAINT status_agenda_agenda_fk FOREIGN KEY (agenda) REFERENCES agenda(id);


--
-- TOC entry 2224 (class 2606 OID 33064)
-- Name: status_agenda status_agenda_status_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY status_agenda
    ADD CONSTRAINT status_agenda_status_fk FOREIGN KEY (status) REFERENCES status(id);


--
-- TOC entry 2225 (class 2606 OID 33069)
-- Name: status_agenda status_agenda_usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY status_agenda
    ADD CONSTRAINT status_agenda_usuario_fk FOREIGN KEY (usuario) REFERENCES usuario(id);


--
-- TOC entry 2230 (class 2606 OID 49194)
-- Name: tipo_usuario_permissao tipo_usuario_permissao_permissao_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_usuario_permissao
    ADD CONSTRAINT tipo_usuario_permissao_permissao_fk FOREIGN KEY (permissao) REFERENCES permissao(id);


--
-- TOC entry 2229 (class 2606 OID 49189)
-- Name: tipo_usuario_permissao tipo_usuario_permissao_tipo_usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_usuario_permissao
    ADD CONSTRAINT tipo_usuario_permissao_tipo_usuario_fk FOREIGN KEY (tipo_usuario) REFERENCES tipo_usuario(id);


--
-- TOC entry 2226 (class 2606 OID 33074)
-- Name: usuario usuario_pessoa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pessoa_fk FOREIGN KEY (pessoa) REFERENCES pessoa(id);


--
-- TOC entry 2227 (class 2606 OID 33079)
-- Name: usuario usuario_tipo_usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_tipo_usuario_fk FOREIGN KEY (tipo_usuario) REFERENCES tipo_usuario(id);


-- Completed on 2018-03-26 01:06:51

--
-- PostgreSQL database dump complete
--

