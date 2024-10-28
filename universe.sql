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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_types character varying(50),
    numbers_of_stars numeric,
    numbers_of_planets integer
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
-- Name: habitable_zone; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.habitable_zone (
    habitable_zone_id integer NOT NULL,
    star_id integer NOT NULL,
    inner_radius numeric(10,2),
    outer_radius numeric(10,2),
    description text,
    name character varying(255)
);


ALTER TABLE public.habitable_zone OWNER TO freecodecamp;

--
-- Name: habitable_zone_habitable_zone_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.habitable_zone_habitable_zone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.habitable_zone_habitable_zone_id_seq OWNER TO freecodecamp;

--
-- Name: habitable_zone_habitable_zone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.habitable_zone_habitable_zone_id_seq OWNED BY public.habitable_zone.habitable_zone_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    is_observed boolean,
    orbital_period double precision,
    distance_from_planet double precision,
    has_rings boolean,
    discovery_date date,
    planet_id integer
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
    name character varying(100) NOT NULL,
    is_observed boolean,
    orbital_period double precision,
    distance_from_star double precision,
    has_rings boolean,
    discovery_date date,
    star_id integer
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
    name character varying(100) NOT NULL,
    star_type character varying(50),
    stellar_age integer,
    mass double precision,
    temperature double precision,
    description text,
    is_visible boolean,
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: habitable_zone habitable_zone_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitable_zone ALTER COLUMN habitable_zone_id SET DEFAULT nextval('public.habitable_zone_habitable_zone_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000000000, 8);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 1000000000000, 14);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 50000000000, 10);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 30000000000, 5);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 80000000000, 4);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Giant Elliptical', 200000000000, 0);


--
-- Data for Name: habitable_zone; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.habitable_zone VALUES (1, 1, 1.50, 2.50, 'The habitable zone of Sirius, suitable for Earth-like planets.', 'Sirius HZ');
INSERT INTO public.habitable_zone VALUES (2, 2, 0.80, 1.20, 'Potential habitable zone around Betelgeuse, though conditions may vary.', 'Betelgeuse HZ');
INSERT INTO public.habitable_zone VALUES (3, 3, 1.00, 1.80, 'Alpha Centauri A has a habitable zone where liquid water could exist.', 'Alpha Centauri A HZ');
INSERT INTO public.habitable_zone VALUES (4, 8, 0.70, 1.40, 'Kepler-186 has a habitable zone with at least one confirmed exoplanet.', 'Kepler-186 HZ');
INSERT INTO public.habitable_zone VALUES (5, 9, 0.05, 0.10, 'TRAPPIST-1 has multiple Earth-sized planets in its habitable zone.', 'TRAPPIST-1 HZ');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', true, 27.3, 384400, false, '1970-01-01', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', true, 0.3, 9377, false, '1970-01-01', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', true, 1.3, 23460, false, '1970-01-01', 4);
INSERT INTO public.moon VALUES (4, 'Io', true, 1.8, 421700, false, '1970-01-01', 5);
INSERT INTO public.moon VALUES (5, 'Europa', true, 3.5, 671100, false, '1970-01-01', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, 7.2, 1070400, false, '1970-01-01', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', true, 16.7, 1882700, false, '1970-01-01', 5);
INSERT INTO public.moon VALUES (8, 'Titan', true, 15.9, 1222000, true, '1970-01-01', 6);
INSERT INTO public.moon VALUES (9, 'Rhea', true, 4.5, 527600, false, '1970-01-01', 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', true, 79.3, 3565000, false, '1970-01-01', 6);
INSERT INTO public.moon VALUES (11, 'Triton', true, 5.9, 354800, false, '1970-01-01', 8);
INSERT INTO public.moon VALUES (12, 'Kepler-186f I', true, 10, 50000, false, '2014-04-18', 10);
INSERT INTO public.moon VALUES (13, 'TRAPPIST-1e I', true, 5, 20000, false, '2017-02-22', 11);
INSERT INTO public.moon VALUES (14, 'HD 209458 b I', true, 2, 15000, false, '1999-11-25', 12);
INSERT INTO public.moon VALUES (15, 'Andromeda I', true, 30, 15000, false, '2023-01-01', 10);
INSERT INTO public.moon VALUES (16, 'Andromeda II', true, 45, 20000, false, '2023-01-01', 10);
INSERT INTO public.moon VALUES (17, 'Triangulum I', true, 25, 12000, false, '2023-01-01', 11);
INSERT INTO public.moon VALUES (18, 'Triangulum II', true, 35, 18000, false, '2023-01-01', 11);
INSERT INTO public.moon VALUES (19, 'Messier 81 I', true, 50, 25000, false, '2023-01-01', 5);
INSERT INTO public.moon VALUES (20, 'Messier 81 II', true, 60, 30000, false, '2023-01-01', 5);
INSERT INTO public.moon VALUES (21, 'Whirlpool I', true, 40, 22000, false, '2023-01-01', 6);
INSERT INTO public.moon VALUES (22, 'Whirlpool II', true, 55, 27000, false, '2023-01-01', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', true, 88, 57.91, false, '1970-01-01', 7);
INSERT INTO public.planet VALUES (2, 'Venus', true, 225, 108.2, false, '1970-01-01', 7);
INSERT INTO public.planet VALUES (3, 'Earth', true, 365.25, 149.6, false, '1970-01-01', 7);
INSERT INTO public.planet VALUES (4, 'Mars', true, 687, 227.9, false, '1970-01-01', 7);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, 4331, 778.5, true, '1970-01-01', 7);
INSERT INTO public.planet VALUES (6, 'Saturn', true, 10747, 1427, true, '1970-01-01', 7);
INSERT INTO public.planet VALUES (7, 'Uranus', true, 30589, 2871, true, '1970-01-01', 7);
INSERT INTO public.planet VALUES (8, 'Neptune', true, 59800, 4497.1, true, '1970-01-01', 7);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', true, 11.2, 0.0485, false, '2016-08-24', 3);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', true, 130, 582, false, '2014-04-18', 8);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', true, 6.1, 0.037, false, '2017-02-22', 9);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', true, 3.5, 0.047, false, '1999-11-25', 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'Main Sequence', 200, 2.1, 9940, 'The brightest star in the night sky.', true, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red Supergiant', 100000, 20, 3500, 'A red supergiant star in the constellation Orion.', true, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'Main Sequence', 5000, 1.1, 5790, 'The closest star system to the Solar System.', true, 1);
INSERT INTO public.star VALUES (4, 'Andromeda I', 'Dwarf Galaxy', 10000, 0.5, 4000, 'A satellite galaxy of the Andromeda Galaxy.', true, 2);
INSERT INTO public.star VALUES (5, 'Whirlpool Galaxy Star', 'Spiral', 1000000, 1.5, 7000, 'A star from the Whirlpool Galaxy.', true, 4);
INSERT INTO public.star VALUES (6, 'Sombrero Galaxy Star', 'Spiral', 5000000, 0.8, 6000, 'A star from the Sombrero Galaxy.', true, 5);
INSERT INTO public.star VALUES (7, 'Sun', NULL, NULL, NULL, NULL, NULL, true, 1);
INSERT INTO public.star VALUES (8, 'Kepler-186', 'Main Sequence', 2000, 0.54, 4900, 'A star system with at least one confirmed exoplanet.', false, 1);
INSERT INTO public.star VALUES (9, 'TRAPPIST-1', 'Ultra-cool Dwarf', 5000, 0.08, 2550, 'A small star with several Earth-sized planets in its orbit.', false, 1);
INSERT INTO public.star VALUES (10, 'HD 209458', 'Main Sequence', 1000, 1.1, 6100, 'A star known for hosting an exoplanet with a significant atmosphere.', true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: habitable_zone_habitable_zone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.habitable_zone_habitable_zone_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


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
-- Name: habitable_zone habitable_zone_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitable_zone
    ADD CONSTRAINT habitable_zone_name_key UNIQUE (name);


--
-- Name: habitable_zone habitable_zone_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitable_zone
    ADD CONSTRAINT habitable_zone_pkey PRIMARY KEY (habitable_zone_id);


--
-- Name: habitable_zone habitable_zone_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitable_zone
    ADD CONSTRAINT habitable_zone_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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
-- Name: galaxy unique_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: habitable_zone habitable_zone_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitable_zone
    ADD CONSTRAINT habitable_zone_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

