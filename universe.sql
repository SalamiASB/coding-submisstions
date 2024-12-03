--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: celestial_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_info (
    celestial_info_id integer NOT NULL,
    name character varying(255) NOT NULL,
    temperature integer NOT NULL,
    num_moons integer NOT NULL
);


ALTER TABLE public.celestial_info OWNER TO freecodecamp;

--
-- Name: celestial_info_celestial_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_info_celestial_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_info_celestial_info_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_info_celestial_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_info_celestial_info_id_seq OWNED BY public.celestial_info.celestial_info_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    has_life boolean DEFAULT false NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    distance_from_planet numeric(10,2)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    planet_types text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    luminosity numeric(10,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: celestial_info celestial_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_info ALTER COLUMN celestial_info_id SET DEFAULT nextval('public.celestial_info_celestial_info_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: celestial_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_info VALUES (1, 'Sun', 5778, 0);
INSERT INTO public.celestial_info VALUES (2, 'Earth', 15, 1);
INSERT INTO public.celestial_info VALUES (3, 'Jupiter', -108, 79);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy containing our solar system', true, 13000, 0.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'A spiral galaxy near the Milky Way', false, 10000, 2.50);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A small galaxy in the local group', false, 12000, 3.00);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A well-known spiral galaxy', true, 12000, 15.50);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'A galaxy with a large bulge and dark dust lane', false, 14000, 28.00);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'A spiral galaxy with arms of stars', true, 8000, 24.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, true, 384400.00);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, false, 9377.00);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, false, 23460.00);
INSERT INTO public.moon VALUES (4, 'Io', 4, true, 421700.00);
INSERT INTO public.moon VALUES (5, 'Europa', 4, true, 670900.00);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, true, 1070400.00);
INSERT INTO public.moon VALUES (7, 'Callisto', 4, true, 1882700.00);
INSERT INTO public.moon VALUES (8, 'Titan', 5, true, 1222000.00);
INSERT INTO public.moon VALUES (9, 'Rhea', 5, true, 527040.00);
INSERT INTO public.moon VALUES (10, 'Iapetus', 5, true, 3561300.00);
INSERT INTO public.moon VALUES (11, 'Mimas', 5, true, 1855400.00);
INSERT INTO public.moon VALUES (12, 'Enceladus', 5, true, 238000.00);
INSERT INTO public.moon VALUES (13, 'Triton', 6, true, 354760.00);
INSERT INTO public.moon VALUES (14, 'Charon', 7, true, 19350.00);
INSERT INTO public.moon VALUES (15, 'Plutoid', 7, true, 500000.00);
INSERT INTO public.moon VALUES (16, 'Haumea', 8, true, 125000.00);
INSERT INTO public.moon VALUES (17, 'Makemake', 8, true, 650000.00);
INSERT INTO public.moon VALUES (18, 'Eris', 9, true, 670000.00);
INSERT INTO public.moon VALUES (19, 'Ceres', 10, true, 330000.00);
INSERT INTO public.moon VALUES (20, 'PLaceholder', 10, true, 111000.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 'Rocky');
INSERT INTO public.planet VALUES (2, 'Mars', 1, true, 'Rocky');
INSERT INTO public.planet VALUES (3, 'Venus', 1, true, 'Rocky');
INSERT INTO public.planet VALUES (4, 'Jupiter', 2, true, 'Gas Giant');
INSERT INTO public.planet VALUES (5, 'Saturn', 2, true, 'Gas Giant');
INSERT INTO public.planet VALUES (6, 'Uranus', 3, true, 'Ice Giant');
INSERT INTO public.planet VALUES (7, 'Neptune', 3, true, 'Ice Giant');
INSERT INTO public.planet VALUES (8, 'Mercury', 1, true, 'Rocky');
INSERT INTO public.planet VALUES (9, 'Pluto', 6, true, 'Dwarf');
INSERT INTO public.planet VALUES (10, 'Ceres', 6, true, 'Dwarf');
INSERT INTO public.planet VALUES (11, 'Eris', 4, true, 'Dwarf');
INSERT INTO public.planet VALUES (12, 'Haumea', 5, true, 'Dwarf');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, true, 3.80);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, true, 4.20);
INSERT INTO public.star VALUES (3, 'Sirius', 2, true, 25.40);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 3, true, 1000.00);
INSERT INTO public.star VALUES (5, 'Rigel', 4, true, 1200.00);
INSERT INTO public.star VALUES (6, 'Polaris', 5, true, 2.20);


--
-- Name: celestial_info_celestial_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_info_celestial_info_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: celestial_info celestial_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_info
    ADD CONSTRAINT celestial_info_name_key UNIQUE (name);


--
-- Name: celestial_info celestial_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_info
    ADD CONSTRAINT celestial_info_pkey PRIMARY KEY (celestial_info_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

