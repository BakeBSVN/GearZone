--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: btree_gin; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS btree_gin WITH SCHEMA public;


--
-- Name: EXTENSION btree_gin; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gin IS 'support for indexing common datatypes in GIN';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_address; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.account_address (
    id integer NOT NULL,
    first_name character varying(256) NOT NULL,
    last_name character varying(256) NOT NULL,
    company_name character varying(256) NOT NULL,
    street_address_1 character varying(256) NOT NULL,
    street_address_2 character varying(256) NOT NULL,
    city character varying(256) NOT NULL,
    postal_code character varying(20) NOT NULL,
    country character varying(2) NOT NULL,
    country_area character varying(128) NOT NULL,
    phone character varying(128) NOT NULL,
    city_area character varying(128) NOT NULL
);


ALTER TABLE public.account_address OWNER TO saleor;

--
-- Name: account_customerevent; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.account_customerevent (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    type character varying(255) NOT NULL,
    parameters jsonb NOT NULL,
    order_id integer,
    user_id integer NOT NULL
);


ALTER TABLE public.account_customerevent OWNER TO saleor;

--
-- Name: account_customerevent_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.account_customerevent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_customerevent_id_seq OWNER TO saleor;

--
-- Name: account_customerevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.account_customerevent_id_seq OWNED BY public.account_customerevent.id;


--
-- Name: account_customernote; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.account_customernote (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    content text NOT NULL,
    is_public boolean NOT NULL,
    customer_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.account_customernote OWNER TO saleor;

--
-- Name: account_customernote_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.account_customernote_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_customernote_id_seq OWNER TO saleor;

--
-- Name: account_customernote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.account_customernote_id_seq OWNED BY public.account_customernote.id;


--
-- Name: account_serviceaccount; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.account_serviceaccount (
    id integer NOT NULL,
    private_meta jsonb,
    meta jsonb,
    name character varying(60) NOT NULL,
    created timestamp with time zone NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.account_serviceaccount OWNER TO saleor;

--
-- Name: account_serviceaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.account_serviceaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_serviceaccount_id_seq OWNER TO saleor;

--
-- Name: account_serviceaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.account_serviceaccount_id_seq OWNED BY public.account_serviceaccount.id;


--
-- Name: account_serviceaccount_permissions; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.account_serviceaccount_permissions (
    id integer NOT NULL,
    serviceaccount_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.account_serviceaccount_permissions OWNER TO saleor;

--
-- Name: account_serviceaccount_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.account_serviceaccount_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_serviceaccount_permissions_id_seq OWNER TO saleor;

--
-- Name: account_serviceaccount_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.account_serviceaccount_permissions_id_seq OWNED BY public.account_serviceaccount_permissions.id;


--
-- Name: account_serviceaccounttoken; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.account_serviceaccounttoken (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    auth_token character varying(30) NOT NULL,
    service_account_id integer NOT NULL
);


ALTER TABLE public.account_serviceaccounttoken OWNER TO saleor;

--
-- Name: account_serviceaccounttoken_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.account_serviceaccounttoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_serviceaccounttoken_id_seq OWNER TO saleor;

--
-- Name: account_serviceaccounttoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.account_serviceaccounttoken_id_seq OWNED BY public.account_serviceaccounttoken.id;


--
-- Name: account_user; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.account_user (
    id integer NOT NULL,
    is_superuser boolean NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    password character varying(128) NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    last_login timestamp with time zone,
    default_billing_address_id integer,
    default_shipping_address_id integer,
    note text,
    first_name character varying(256) NOT NULL,
    last_name character varying(256) NOT NULL,
    avatar character varying(100),
    private_meta jsonb,
    meta jsonb
);


ALTER TABLE public.account_user OWNER TO saleor;

--
-- Name: account_user_addresses; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.account_user_addresses (
    id integer NOT NULL,
    user_id integer NOT NULL,
    address_id integer NOT NULL
);


ALTER TABLE public.account_user_addresses OWNER TO saleor;

--
-- Name: account_user_groups; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.account_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.account_user_groups OWNER TO saleor;

--
-- Name: account_user_user_permissions; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.account_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.account_user_user_permissions OWNER TO saleor;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO saleor;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO saleor;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO saleor;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO saleor;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO saleor;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO saleor;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: checkout_checkoutline; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.checkout_checkoutline (
    id integer NOT NULL,
    quantity integer NOT NULL,
    checkout_id uuid NOT NULL,
    variant_id integer NOT NULL,
    data jsonb NOT NULL,
    CONSTRAINT cart_cartline_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.checkout_checkoutline OWNER TO saleor;

--
-- Name: cart_cartline_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.cart_cartline_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_cartline_id_seq OWNER TO saleor;

--
-- Name: cart_cartline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.cart_cartline_id_seq OWNED BY public.checkout_checkoutline.id;


--
-- Name: checkout_checkout; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.checkout_checkout (
    created timestamp with time zone NOT NULL,
    last_change timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL,
    token uuid NOT NULL,
    quantity integer NOT NULL,
    user_id integer,
    billing_address_id integer,
    discount_amount numeric(12,0) NOT NULL,
    discount_name character varying(255),
    note text NOT NULL,
    shipping_address_id integer,
    shipping_method_id integer,
    voucher_code character varying(12),
    translated_discount_name character varying(255),
    meta jsonb,
    private_meta jsonb,
    currency character varying(3) NOT NULL,
    CONSTRAINT cart_cart_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.checkout_checkout OWNER TO saleor;

--
-- Name: checkout_checkout_gift_cards; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.checkout_checkout_gift_cards (
    id integer NOT NULL,
    checkout_id uuid NOT NULL,
    giftcard_id integer NOT NULL
);


ALTER TABLE public.checkout_checkout_gift_cards OWNER TO saleor;

--
-- Name: checkout_checkout_gift_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.checkout_checkout_gift_cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checkout_checkout_gift_cards_id_seq OWNER TO saleor;

--
-- Name: checkout_checkout_gift_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.checkout_checkout_gift_cards_id_seq OWNED BY public.checkout_checkout_gift_cards.id;


--
-- Name: discount_sale; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.discount_sale (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(10) NOT NULL,
    value numeric(12,0) NOT NULL,
    end_date timestamp with time zone,
    start_date timestamp with time zone NOT NULL
);


ALTER TABLE public.discount_sale OWNER TO saleor;

--
-- Name: discount_sale_categories; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.discount_sale_categories (
    id integer NOT NULL,
    sale_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.discount_sale_categories OWNER TO saleor;

--
-- Name: discount_sale_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.discount_sale_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_sale_categories_id_seq OWNER TO saleor;

--
-- Name: discount_sale_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.discount_sale_categories_id_seq OWNED BY public.discount_sale_categories.id;


--
-- Name: discount_sale_collections; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.discount_sale_collections (
    id integer NOT NULL,
    sale_id integer NOT NULL,
    collection_id integer NOT NULL
);


ALTER TABLE public.discount_sale_collections OWNER TO saleor;

--
-- Name: discount_sale_collections_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.discount_sale_collections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_sale_collections_id_seq OWNER TO saleor;

--
-- Name: discount_sale_collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.discount_sale_collections_id_seq OWNED BY public.discount_sale_collections.id;


--
-- Name: discount_sale_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.discount_sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_sale_id_seq OWNER TO saleor;

--
-- Name: discount_sale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.discount_sale_id_seq OWNED BY public.discount_sale.id;


--
-- Name: discount_sale_products; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.discount_sale_products (
    id integer NOT NULL,
    sale_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.discount_sale_products OWNER TO saleor;

--
-- Name: discount_sale_products_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.discount_sale_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_sale_products_id_seq OWNER TO saleor;

--
-- Name: discount_sale_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.discount_sale_products_id_seq OWNED BY public.discount_sale_products.id;


--
-- Name: discount_saletranslation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.discount_saletranslation (
    id integer NOT NULL,
    language_code character varying(10) NOT NULL,
    name character varying(255),
    sale_id integer NOT NULL
);


ALTER TABLE public.discount_saletranslation OWNER TO saleor;

--
-- Name: discount_saletranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.discount_saletranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_saletranslation_id_seq OWNER TO saleor;

--
-- Name: discount_saletranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.discount_saletranslation_id_seq OWNED BY public.discount_saletranslation.id;


--
-- Name: discount_voucher; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.discount_voucher (
    id integer NOT NULL,
    type character varying(20) NOT NULL,
    name character varying(255),
    code character varying(12) NOT NULL,
    usage_limit integer,
    used integer NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone,
    discount_value_type character varying(10) NOT NULL,
    discount_value numeric(12,0) NOT NULL,
    min_spent_amount numeric(12,0),
    apply_once_per_order boolean NOT NULL,
    countries character varying(749) NOT NULL,
    min_checkout_items_quantity integer,
    apply_once_per_customer boolean NOT NULL,
    currency character varying(3) NOT NULL,
    CONSTRAINT discount_voucher_min_checkout_items_quantity_check CHECK ((min_checkout_items_quantity >= 0)),
    CONSTRAINT discount_voucher_usage_limit_check CHECK ((usage_limit >= 0)),
    CONSTRAINT discount_voucher_used_check CHECK ((used >= 0))
);


ALTER TABLE public.discount_voucher OWNER TO saleor;

--
-- Name: discount_voucher_categories; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.discount_voucher_categories (
    id integer NOT NULL,
    voucher_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.discount_voucher_categories OWNER TO saleor;

--
-- Name: discount_voucher_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.discount_voucher_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_voucher_categories_id_seq OWNER TO saleor;

--
-- Name: discount_voucher_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.discount_voucher_categories_id_seq OWNED BY public.discount_voucher_categories.id;


--
-- Name: discount_voucher_collections; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.discount_voucher_collections (
    id integer NOT NULL,
    voucher_id integer NOT NULL,
    collection_id integer NOT NULL
);


ALTER TABLE public.discount_voucher_collections OWNER TO saleor;

--
-- Name: discount_voucher_collections_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.discount_voucher_collections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_voucher_collections_id_seq OWNER TO saleor;

--
-- Name: discount_voucher_collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.discount_voucher_collections_id_seq OWNED BY public.discount_voucher_collections.id;


--
-- Name: discount_voucher_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.discount_voucher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_voucher_id_seq OWNER TO saleor;

--
-- Name: discount_voucher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.discount_voucher_id_seq OWNED BY public.discount_voucher.id;


--
-- Name: discount_voucher_products; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.discount_voucher_products (
    id integer NOT NULL,
    voucher_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.discount_voucher_products OWNER TO saleor;

--
-- Name: discount_voucher_products_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.discount_voucher_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_voucher_products_id_seq OWNER TO saleor;

--
-- Name: discount_voucher_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.discount_voucher_products_id_seq OWNED BY public.discount_voucher_products.id;


--
-- Name: discount_vouchercustomer; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.discount_vouchercustomer (
    id integer NOT NULL,
    customer_email character varying(254) NOT NULL,
    voucher_id integer NOT NULL
);


ALTER TABLE public.discount_vouchercustomer OWNER TO saleor;

--
-- Name: discount_vouchercustomer_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.discount_vouchercustomer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_vouchercustomer_id_seq OWNER TO saleor;

--
-- Name: discount_vouchercustomer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.discount_vouchercustomer_id_seq OWNED BY public.discount_vouchercustomer.id;


--
-- Name: discount_vouchertranslation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.discount_vouchertranslation (
    id integer NOT NULL,
    language_code character varying(10) NOT NULL,
    name character varying(255),
    voucher_id integer NOT NULL
);


ALTER TABLE public.discount_vouchertranslation OWNER TO saleor;

--
-- Name: discount_vouchertranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.discount_vouchertranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_vouchertranslation_id_seq OWNER TO saleor;

--
-- Name: discount_vouchertranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.discount_vouchertranslation_id_seq OWNED BY public.discount_vouchertranslation.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO saleor;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO saleor;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO saleor;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO saleor;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_prices_openexchangerates_conversionrate; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.django_prices_openexchangerates_conversionrate (
    id integer NOT NULL,
    to_currency character varying(3) NOT NULL,
    rate numeric(20,12) NOT NULL,
    modified_at timestamp with time zone NOT NULL
);


ALTER TABLE public.django_prices_openexchangerates_conversionrate OWNER TO saleor;

--
-- Name: django_prices_openexchangerates_conversionrate_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.django_prices_openexchangerates_conversionrate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_prices_openexchangerates_conversionrate_id_seq OWNER TO saleor;

--
-- Name: django_prices_openexchangerates_conversionrate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.django_prices_openexchangerates_conversionrate_id_seq OWNED BY public.django_prices_openexchangerates_conversionrate.id;


--
-- Name: django_prices_vatlayer_ratetypes; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.django_prices_vatlayer_ratetypes (
    id integer NOT NULL,
    types text NOT NULL
);


ALTER TABLE public.django_prices_vatlayer_ratetypes OWNER TO saleor;

--
-- Name: django_prices_vatlayer_ratetypes_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.django_prices_vatlayer_ratetypes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_prices_vatlayer_ratetypes_id_seq OWNER TO saleor;

--
-- Name: django_prices_vatlayer_ratetypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.django_prices_vatlayer_ratetypes_id_seq OWNED BY public.django_prices_vatlayer_ratetypes.id;


--
-- Name: django_prices_vatlayer_vat; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.django_prices_vatlayer_vat (
    id integer NOT NULL,
    country_code character varying(2) NOT NULL,
    data text NOT NULL
);


ALTER TABLE public.django_prices_vatlayer_vat OWNER TO saleor;

--
-- Name: django_prices_vatlayer_vat_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.django_prices_vatlayer_vat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_prices_vatlayer_vat_id_seq OWNER TO saleor;

--
-- Name: django_prices_vatlayer_vat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.django_prices_vatlayer_vat_id_seq OWNED BY public.django_prices_vatlayer_vat.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO saleor;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO saleor;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO saleor;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: extensions_pluginconfiguration; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.extensions_pluginconfiguration (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description text NOT NULL,
    active boolean NOT NULL,
    configuration jsonb
);


ALTER TABLE public.extensions_pluginconfiguration OWNER TO saleor;

--
-- Name: extensions_pluginconfiguration_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.extensions_pluginconfiguration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extensions_pluginconfiguration_id_seq OWNER TO saleor;

--
-- Name: extensions_pluginconfiguration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.extensions_pluginconfiguration_id_seq OWNED BY public.extensions_pluginconfiguration.id;


--
-- Name: giftcard_giftcard; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.giftcard_giftcard (
    id integer NOT NULL,
    code character varying(16) NOT NULL,
    created timestamp with time zone NOT NULL,
    start_date date NOT NULL,
    end_date date,
    last_used_on timestamp with time zone,
    is_active boolean NOT NULL,
    initial_balance_amount numeric(12,0) NOT NULL,
    current_balance_amount numeric(12,0) NOT NULL,
    user_id integer,
    currency character varying(3) NOT NULL
);


ALTER TABLE public.giftcard_giftcard OWNER TO saleor;

--
-- Name: giftcard_giftcard_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.giftcard_giftcard_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.giftcard_giftcard_id_seq OWNER TO saleor;

--
-- Name: giftcard_giftcard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.giftcard_giftcard_id_seq OWNED BY public.giftcard_giftcard.id;


--
-- Name: impersonate_impersonationlog; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.impersonate_impersonationlog (
    id integer NOT NULL,
    session_key character varying(40) NOT NULL,
    session_started_at timestamp with time zone,
    session_ended_at timestamp with time zone,
    impersonating_id integer NOT NULL,
    impersonator_id integer NOT NULL
);


ALTER TABLE public.impersonate_impersonationlog OWNER TO saleor;

--
-- Name: impersonate_impersonationlog_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.impersonate_impersonationlog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.impersonate_impersonationlog_id_seq OWNER TO saleor;

--
-- Name: impersonate_impersonationlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.impersonate_impersonationlog_id_seq OWNED BY public.impersonate_impersonationlog.id;


--
-- Name: keyboard_builder_product; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.keyboard_builder_product (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price numeric(10,2) NOT NULL,
    image character varying(100) NOT NULL,
    category character varying(50) NOT NULL
);


ALTER TABLE public.keyboard_builder_product OWNER TO saleor;

--
-- Name: keyboard_builder_product_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.keyboard_builder_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.keyboard_builder_product_id_seq OWNER TO saleor;

--
-- Name: keyboard_builder_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.keyboard_builder_product_id_seq OWNED BY public.keyboard_builder_product.id;


--
-- Name: menu_menu; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.menu_menu (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    json_content jsonb NOT NULL
);


ALTER TABLE public.menu_menu OWNER TO saleor;

--
-- Name: menu_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.menu_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_menu_id_seq OWNER TO saleor;

--
-- Name: menu_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.menu_menu_id_seq OWNED BY public.menu_menu.id;


--
-- Name: menu_menuitem; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.menu_menuitem (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    sort_order integer,
    url character varying(256),
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    category_id integer,
    collection_id integer,
    menu_id integer NOT NULL,
    page_id integer,
    parent_id integer,
    CONSTRAINT menu_menuitem_level_check CHECK ((level >= 0)),
    CONSTRAINT menu_menuitem_lft_check CHECK ((lft >= 0)),
    CONSTRAINT menu_menuitem_rght_check CHECK ((rght >= 0)),
    CONSTRAINT menu_menuitem_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.menu_menuitem OWNER TO saleor;

--
-- Name: menu_menuitem_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.menu_menuitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_menuitem_id_seq OWNER TO saleor;

--
-- Name: menu_menuitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.menu_menuitem_id_seq OWNED BY public.menu_menuitem.id;


--
-- Name: menu_menuitemtranslation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.menu_menuitemtranslation (
    id integer NOT NULL,
    language_code character varying(10) NOT NULL,
    name character varying(128) NOT NULL,
    menu_item_id integer NOT NULL
);


ALTER TABLE public.menu_menuitemtranslation OWNER TO saleor;

--
-- Name: menu_menuitemtranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.menu_menuitemtranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_menuitemtranslation_id_seq OWNER TO saleor;

--
-- Name: menu_menuitemtranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.menu_menuitemtranslation_id_seq OWNED BY public.menu_menuitemtranslation.id;


--
-- Name: order_fulfillment; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.order_fulfillment (
    id integer NOT NULL,
    tracking_number character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    order_id integer NOT NULL,
    fulfillment_order integer NOT NULL,
    status character varying(32) NOT NULL,
    meta jsonb,
    private_meta jsonb,
    CONSTRAINT order_fulfillment_fulfillment_order_check CHECK ((fulfillment_order >= 0))
);


ALTER TABLE public.order_fulfillment OWNER TO saleor;

--
-- Name: order_fulfillment_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.order_fulfillment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_fulfillment_id_seq OWNER TO saleor;

--
-- Name: order_fulfillment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.order_fulfillment_id_seq OWNED BY public.order_fulfillment.id;


--
-- Name: order_fulfillmentline; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.order_fulfillmentline (
    id integer NOT NULL,
    order_line_id integer NOT NULL,
    quantity integer NOT NULL,
    fulfillment_id integer NOT NULL,
    CONSTRAINT order_fulfillmentline_quantity_81b787d3_check CHECK ((quantity >= 0))
);


ALTER TABLE public.order_fulfillmentline OWNER TO saleor;

--
-- Name: order_fulfillmentline_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.order_fulfillmentline_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_fulfillmentline_id_seq OWNER TO saleor;

--
-- Name: order_fulfillmentline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.order_fulfillmentline_id_seq OWNED BY public.order_fulfillmentline.id;


--
-- Name: order_order; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.order_order (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    tracking_client_id character varying(36) NOT NULL,
    user_email character varying(254) NOT NULL,
    token character varying(36) NOT NULL,
    billing_address_id integer,
    shipping_address_id integer,
    user_id integer,
    total_net_amount numeric(12,0) NOT NULL,
    discount_amount numeric(12,0) NOT NULL,
    discount_name character varying(255) NOT NULL,
    voucher_id integer,
    language_code character varying(35) NOT NULL,
    shipping_price_gross_amount numeric(12,0) NOT NULL,
    total_gross_amount numeric(12,0) NOT NULL,
    shipping_price_net_amount numeric(12,0) NOT NULL,
    status character varying(32) NOT NULL,
    shipping_method_name character varying(255),
    shipping_method_id integer,
    display_gross_prices boolean NOT NULL,
    translated_discount_name character varying(255) NOT NULL,
    customer_note text NOT NULL,
    weight double precision NOT NULL,
    checkout_token character varying(36) NOT NULL,
    currency character varying(3) NOT NULL,
    meta jsonb,
    private_meta jsonb
);


ALTER TABLE public.order_order OWNER TO saleor;

--
-- Name: order_order_gift_cards; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.order_order_gift_cards (
    id integer NOT NULL,
    order_id integer NOT NULL,
    giftcard_id integer NOT NULL
);


ALTER TABLE public.order_order_gift_cards OWNER TO saleor;

--
-- Name: order_order_gift_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.order_order_gift_cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_order_gift_cards_id_seq OWNER TO saleor;

--
-- Name: order_order_gift_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.order_order_gift_cards_id_seq OWNED BY public.order_order_gift_cards.id;


--
-- Name: order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.order_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_order_id_seq OWNER TO saleor;

--
-- Name: order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.order_order_id_seq OWNED BY public.order_order.id;


--
-- Name: order_orderline; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.order_orderline (
    id integer NOT NULL,
    product_name character varying(386) NOT NULL,
    product_sku character varying(255) NOT NULL,
    quantity integer NOT NULL,
    unit_price_net_amount numeric(12,0) NOT NULL,
    unit_price_gross_amount numeric(12,0) NOT NULL,
    is_shipping_required boolean NOT NULL,
    order_id integer NOT NULL,
    quantity_fulfilled integer NOT NULL,
    variant_id integer,
    tax_rate numeric(5,2) NOT NULL,
    translated_product_name character varying(386) NOT NULL,
    currency character varying(3) NOT NULL,
    translated_variant_name character varying(255) NOT NULL,
    variant_name character varying(255) NOT NULL
);


ALTER TABLE public.order_orderline OWNER TO saleor;

--
-- Name: order_ordereditem_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.order_ordereditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_ordereditem_id_seq OWNER TO saleor;

--
-- Name: order_ordereditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.order_ordereditem_id_seq OWNED BY public.order_orderline.id;


--
-- Name: order_orderevent; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.order_orderevent (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    type character varying(255) NOT NULL,
    order_id integer NOT NULL,
    user_id integer,
    parameters jsonb NOT NULL
);


ALTER TABLE public.order_orderevent OWNER TO saleor;

--
-- Name: order_orderevent_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.order_orderevent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_orderevent_id_seq OWNER TO saleor;

--
-- Name: order_orderevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.order_orderevent_id_seq OWNED BY public.order_orderevent.id;


--
-- Name: page_page; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.page_page (
    id integer NOT NULL,
    slug character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    content text NOT NULL,
    created timestamp with time zone NOT NULL,
    is_published boolean NOT NULL,
    publication_date date,
    seo_description character varying(300),
    seo_title character varying(70),
    content_json jsonb NOT NULL
);


ALTER TABLE public.page_page OWNER TO saleor;

--
-- Name: page_page_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.page_page_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_page_id_seq OWNER TO saleor;

--
-- Name: page_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.page_page_id_seq OWNED BY public.page_page.id;


--
-- Name: page_pagetranslation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.page_pagetranslation (
    id integer NOT NULL,
    seo_title character varying(70),
    seo_description character varying(300),
    language_code character varying(10) NOT NULL,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    page_id integer NOT NULL,
    content_json jsonb NOT NULL
);


ALTER TABLE public.page_pagetranslation OWNER TO saleor;

--
-- Name: page_pagetranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.page_pagetranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_pagetranslation_id_seq OWNER TO saleor;

--
-- Name: page_pagetranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.page_pagetranslation_id_seq OWNED BY public.page_pagetranslation.id;


--
-- Name: payment_payment; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.payment_payment (
    id integer NOT NULL,
    gateway character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    charge_status character varying(20) NOT NULL,
    billing_first_name character varying(256) NOT NULL,
    billing_last_name character varying(256) NOT NULL,
    billing_company_name character varying(256) NOT NULL,
    billing_address_1 character varying(256) NOT NULL,
    billing_address_2 character varying(256) NOT NULL,
    billing_city character varying(256) NOT NULL,
    billing_city_area character varying(128) NOT NULL,
    billing_postal_code character varying(256) NOT NULL,
    billing_country_code character varying(2) NOT NULL,
    billing_country_area character varying(256) NOT NULL,
    billing_email character varying(254) NOT NULL,
    customer_ip_address inet,
    cc_brand character varying(40) NOT NULL,
    cc_exp_month integer,
    cc_exp_year integer,
    cc_first_digits character varying(6) NOT NULL,
    cc_last_digits character varying(4) NOT NULL,
    extra_data text NOT NULL,
    token character varying(128) NOT NULL,
    currency character varying(3) NOT NULL,
    total numeric(12,0) NOT NULL,
    captured_amount numeric(12,0) NOT NULL,
    checkout_id uuid,
    order_id integer,
    CONSTRAINT payment_paymentmethod_cc_exp_month_check CHECK ((cc_exp_month >= 0)),
    CONSTRAINT payment_paymentmethod_cc_exp_year_check CHECK ((cc_exp_year >= 0))
);


ALTER TABLE public.payment_payment OWNER TO saleor;

--
-- Name: payment_paymentmethod_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.payment_paymentmethod_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_paymentmethod_id_seq OWNER TO saleor;

--
-- Name: payment_paymentmethod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.payment_paymentmethod_id_seq OWNED BY public.payment_payment.id;


--
-- Name: payment_transaction; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.payment_transaction (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    token character varying(128) NOT NULL,
    kind character varying(10) NOT NULL,
    is_success boolean NOT NULL,
    error character varying(256),
    currency character varying(3) NOT NULL,
    amount numeric(12,0) NOT NULL,
    gateway_response jsonb NOT NULL,
    payment_id integer NOT NULL,
    customer_id character varying(256)
);


ALTER TABLE public.payment_transaction OWNER TO saleor;

--
-- Name: payment_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.payment_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_transaction_id_seq OWNER TO saleor;

--
-- Name: payment_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.payment_transaction_id_seq OWNED BY public.payment_transaction.id;


--
-- Name: product_assignedproductattribute; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_assignedproductattribute (
    id integer NOT NULL,
    product_id integer NOT NULL,
    assignment_id integer NOT NULL
);


ALTER TABLE public.product_assignedproductattribute OWNER TO saleor;

--
-- Name: product_assignedproductattribute_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_assignedproductattribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_assignedproductattribute_id_seq OWNER TO saleor;

--
-- Name: product_assignedproductattribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_assignedproductattribute_id_seq OWNED BY public.product_assignedproductattribute.id;


--
-- Name: product_assignedproductattribute_values; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_assignedproductattribute_values (
    id integer NOT NULL,
    assignedproductattribute_id integer NOT NULL,
    attributevalue_id integer NOT NULL
);


ALTER TABLE public.product_assignedproductattribute_values OWNER TO saleor;

--
-- Name: product_assignedproductattribute_values_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_assignedproductattribute_values_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_assignedproductattribute_values_id_seq OWNER TO saleor;

--
-- Name: product_assignedproductattribute_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_assignedproductattribute_values_id_seq OWNED BY public.product_assignedproductattribute_values.id;


--
-- Name: product_assignedvariantattribute; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_assignedvariantattribute (
    id integer NOT NULL,
    variant_id integer NOT NULL,
    assignment_id integer NOT NULL
);


ALTER TABLE public.product_assignedvariantattribute OWNER TO saleor;

--
-- Name: product_assignedvariantattribute_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_assignedvariantattribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_assignedvariantattribute_id_seq OWNER TO saleor;

--
-- Name: product_assignedvariantattribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_assignedvariantattribute_id_seq OWNED BY public.product_assignedvariantattribute.id;


--
-- Name: product_assignedvariantattribute_values; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_assignedvariantattribute_values (
    id integer NOT NULL,
    assignedvariantattribute_id integer NOT NULL,
    attributevalue_id integer NOT NULL
);


ALTER TABLE public.product_assignedvariantattribute_values OWNER TO saleor;

--
-- Name: product_assignedvariantattribute_values_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_assignedvariantattribute_values_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_assignedvariantattribute_values_id_seq OWNER TO saleor;

--
-- Name: product_assignedvariantattribute_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_assignedvariantattribute_values_id_seq OWNED BY public.product_assignedvariantattribute_values.id;


--
-- Name: product_attribute; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_attribute (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    meta jsonb,
    private_meta jsonb,
    input_type character varying(50) NOT NULL,
    available_in_grid boolean NOT NULL,
    visible_in_storefront boolean NOT NULL,
    filterable_in_dashboard boolean NOT NULL,
    filterable_in_storefront boolean NOT NULL,
    value_required boolean NOT NULL,
    storefront_search_position integer NOT NULL,
    is_variant_only boolean NOT NULL
);


ALTER TABLE public.product_attribute OWNER TO saleor;

--
-- Name: product_attributevalue; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_attributevalue (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    attribute_id integer NOT NULL,
    slug character varying(100) NOT NULL,
    sort_order integer,
    value character varying(100) NOT NULL
);


ALTER TABLE public.product_attributevalue OWNER TO saleor;

--
-- Name: product_attributechoicevalue_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_attributechoicevalue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_attributechoicevalue_id_seq OWNER TO saleor;

--
-- Name: product_attributechoicevalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_attributechoicevalue_id_seq OWNED BY public.product_attributevalue.id;


--
-- Name: product_attributevaluetranslation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_attributevaluetranslation (
    id integer NOT NULL,
    language_code character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    attribute_value_id integer NOT NULL
);


ALTER TABLE public.product_attributevaluetranslation OWNER TO saleor;

--
-- Name: product_attributechoicevaluetranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_attributechoicevaluetranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_attributechoicevaluetranslation_id_seq OWNER TO saleor;

--
-- Name: product_attributechoicevaluetranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_attributechoicevaluetranslation_id_seq OWNED BY public.product_attributevaluetranslation.id;


--
-- Name: product_attributeproduct; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_attributeproduct (
    id integer NOT NULL,
    attribute_id integer NOT NULL,
    product_type_id integer NOT NULL,
    sort_order integer
);


ALTER TABLE public.product_attributeproduct OWNER TO saleor;

--
-- Name: product_attributeproduct_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_attributeproduct_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_attributeproduct_id_seq OWNER TO saleor;

--
-- Name: product_attributeproduct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_attributeproduct_id_seq OWNED BY public.product_attributeproduct.id;


--
-- Name: product_attributetranslation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_attributetranslation (
    id integer NOT NULL,
    language_code character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    attribute_id integer NOT NULL
);


ALTER TABLE public.product_attributetranslation OWNER TO saleor;

--
-- Name: product_attributevariant; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_attributevariant (
    id integer NOT NULL,
    attribute_id integer NOT NULL,
    product_type_id integer NOT NULL,
    sort_order integer
);


ALTER TABLE public.product_attributevariant OWNER TO saleor;

--
-- Name: product_attributevariant_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_attributevariant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_attributevariant_id_seq OWNER TO saleor;

--
-- Name: product_attributevariant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_attributevariant_id_seq OWNED BY public.product_attributevariant.id;


--
-- Name: product_category; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_category (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    slug character varying(128) NOT NULL,
    description text NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id integer,
    background_image character varying(100),
    seo_description character varying(300),
    seo_title character varying(70),
    background_image_alt character varying(128) NOT NULL,
    description_json jsonb NOT NULL,
    meta jsonb,
    private_meta jsonb,
    show_in_customize boolean NOT NULL,
    CONSTRAINT product_category_level_check CHECK ((level >= 0)),
    CONSTRAINT product_category_lft_check CHECK ((lft >= 0)),
    CONSTRAINT product_category_rght_check CHECK ((rght >= 0)),
    CONSTRAINT product_category_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.product_category OWNER TO saleor;

--
-- Name: product_category_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_category_id_seq OWNER TO saleor;

--
-- Name: product_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_category_id_seq OWNED BY public.product_category.id;


--
-- Name: product_categorytranslation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_categorytranslation (
    id integer NOT NULL,
    seo_title character varying(70),
    seo_description character varying(300),
    language_code character varying(10) NOT NULL,
    name character varying(128) NOT NULL,
    description text NOT NULL,
    category_id integer NOT NULL,
    description_json jsonb NOT NULL
);


ALTER TABLE public.product_categorytranslation OWNER TO saleor;

--
-- Name: product_categorytranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_categorytranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_categorytranslation_id_seq OWNER TO saleor;

--
-- Name: product_categorytranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_categorytranslation_id_seq OWNED BY public.product_categorytranslation.id;


--
-- Name: product_collection; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_collection (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    slug character varying(128) NOT NULL,
    background_image character varying(100),
    seo_description character varying(300),
    seo_title character varying(70),
    is_published boolean NOT NULL,
    description text NOT NULL,
    publication_date date,
    background_image_alt character varying(128) NOT NULL,
    description_json jsonb NOT NULL,
    meta jsonb,
    private_meta jsonb
);


ALTER TABLE public.product_collection OWNER TO saleor;

--
-- Name: product_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_collection_id_seq OWNER TO saleor;

--
-- Name: product_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_collection_id_seq OWNED BY public.product_collection.id;


--
-- Name: product_collectionproduct; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_collectionproduct (
    id integer NOT NULL,
    collection_id integer NOT NULL,
    product_id integer NOT NULL,
    sort_order integer
);


ALTER TABLE public.product_collectionproduct OWNER TO saleor;

--
-- Name: product_collection_products_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_collection_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_collection_products_id_seq OWNER TO saleor;

--
-- Name: product_collection_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_collection_products_id_seq OWNED BY public.product_collectionproduct.id;


--
-- Name: product_collectiontranslation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_collectiontranslation (
    id integer NOT NULL,
    seo_title character varying(70),
    seo_description character varying(300),
    language_code character varying(10) NOT NULL,
    name character varying(128) NOT NULL,
    collection_id integer NOT NULL,
    description text NOT NULL,
    description_json jsonb NOT NULL
);


ALTER TABLE public.product_collectiontranslation OWNER TO saleor;

--
-- Name: product_collectiontranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_collectiontranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_collectiontranslation_id_seq OWNER TO saleor;

--
-- Name: product_collectiontranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_collectiontranslation_id_seq OWNED BY public.product_collectiontranslation.id;


--
-- Name: product_digitalcontent; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_digitalcontent (
    id integer NOT NULL,
    use_default_settings boolean NOT NULL,
    automatic_fulfillment boolean NOT NULL,
    content_type character varying(128) NOT NULL,
    content_file character varying(100) NOT NULL,
    max_downloads integer,
    url_valid_days integer,
    product_variant_id integer NOT NULL,
    meta jsonb,
    private_meta jsonb
);


ALTER TABLE public.product_digitalcontent OWNER TO saleor;

--
-- Name: product_digitalcontent_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_digitalcontent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_digitalcontent_id_seq OWNER TO saleor;

--
-- Name: product_digitalcontent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_digitalcontent_id_seq OWNED BY public.product_digitalcontent.id;


--
-- Name: product_digitalcontenturl; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_digitalcontenturl (
    id integer NOT NULL,
    token uuid NOT NULL,
    created timestamp with time zone NOT NULL,
    download_num integer NOT NULL,
    content_id integer NOT NULL,
    line_id integer
);


ALTER TABLE public.product_digitalcontenturl OWNER TO saleor;

--
-- Name: product_digitalcontenturl_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_digitalcontenturl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_digitalcontenturl_id_seq OWNER TO saleor;

--
-- Name: product_digitalcontenturl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_digitalcontenturl_id_seq OWNED BY public.product_digitalcontenturl.id;


--
-- Name: product_product; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_product (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description text NOT NULL,
    price_amount numeric(12,0) NOT NULL,
    publication_date date,
    updated_at timestamp with time zone,
    product_type_id integer NOT NULL,
    is_published boolean NOT NULL,
    category_id integer,
    seo_description character varying(300),
    seo_title character varying(70),
    charge_taxes boolean NOT NULL,
    weight double precision,
    description_json jsonb NOT NULL,
    meta jsonb,
    private_meta jsonb,
    minimal_variant_price_amount numeric(12,0) NOT NULL,
    currency character varying(3) NOT NULL
);


ALTER TABLE public.product_product OWNER TO saleor;

--
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_product_id_seq OWNER TO saleor;

--
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product_product.id;


--
-- Name: product_productattribute_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_productattribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_productattribute_id_seq OWNER TO saleor;

--
-- Name: product_productattribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_productattribute_id_seq OWNED BY public.product_attribute.id;


--
-- Name: product_productattributetranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_productattributetranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_productattributetranslation_id_seq OWNER TO saleor;

--
-- Name: product_productattributetranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_productattributetranslation_id_seq OWNED BY public.product_attributetranslation.id;


--
-- Name: product_producttype; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_producttype (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    has_variants boolean NOT NULL,
    is_shipping_required boolean NOT NULL,
    weight double precision NOT NULL,
    is_digital boolean NOT NULL,
    meta jsonb,
    private_meta jsonb
);


ALTER TABLE public.product_producttype OWNER TO saleor;

--
-- Name: product_productclass_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_productclass_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_productclass_id_seq OWNER TO saleor;

--
-- Name: product_productclass_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_productclass_id_seq OWNED BY public.product_producttype.id;


--
-- Name: product_productimage; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_productimage (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    ppoi character varying(20) NOT NULL,
    alt character varying(128) NOT NULL,
    sort_order integer,
    product_id integer NOT NULL
);


ALTER TABLE public.product_productimage OWNER TO saleor;

--
-- Name: product_productimage_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_productimage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_productimage_id_seq OWNER TO saleor;

--
-- Name: product_productimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_productimage_id_seq OWNED BY public.product_productimage.id;


--
-- Name: product_producttranslation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_producttranslation (
    id integer NOT NULL,
    seo_title character varying(70),
    seo_description character varying(300),
    language_code character varying(10) NOT NULL,
    name character varying(128) NOT NULL,
    description text NOT NULL,
    product_id integer NOT NULL,
    description_json jsonb NOT NULL
);


ALTER TABLE public.product_producttranslation OWNER TO saleor;

--
-- Name: product_producttranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_producttranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_producttranslation_id_seq OWNER TO saleor;

--
-- Name: product_producttranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_producttranslation_id_seq OWNED BY public.product_producttranslation.id;


--
-- Name: product_productvariant; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_productvariant (
    id integer NOT NULL,
    sku character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    price_override_amount numeric(12,0),
    product_id integer NOT NULL,
    cost_price_amount numeric(12,0),
    quantity integer NOT NULL,
    quantity_allocated integer NOT NULL,
    track_inventory boolean NOT NULL,
    weight double precision,
    meta jsonb,
    private_meta jsonb,
    currency character varying(3)
);


ALTER TABLE public.product_productvariant OWNER TO saleor;

--
-- Name: product_productvariant_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_productvariant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_productvariant_id_seq OWNER TO saleor;

--
-- Name: product_productvariant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_productvariant_id_seq OWNED BY public.product_productvariant.id;


--
-- Name: product_productvarianttranslation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_productvarianttranslation (
    id integer NOT NULL,
    language_code character varying(10) NOT NULL,
    name character varying(255) NOT NULL,
    product_variant_id integer NOT NULL
);


ALTER TABLE public.product_productvarianttranslation OWNER TO saleor;

--
-- Name: product_productvarianttranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_productvarianttranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_productvarianttranslation_id_seq OWNER TO saleor;

--
-- Name: product_productvarianttranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_productvarianttranslation_id_seq OWNED BY public.product_productvarianttranslation.id;


--
-- Name: product_variantimage; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_variantimage (
    id integer NOT NULL,
    image_id integer NOT NULL,
    variant_id integer NOT NULL
);


ALTER TABLE public.product_variantimage OWNER TO saleor;

--
-- Name: product_variantimage_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_variantimage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_variantimage_id_seq OWNER TO saleor;

--
-- Name: product_variantimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_variantimage_id_seq OWNED BY public.product_variantimage.id;


--
-- Name: shipping_shippingmethod; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.shipping_shippingmethod (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    maximum_order_price_amount numeric(12,0),
    maximum_order_weight double precision,
    minimum_order_price_amount numeric(12,0),
    minimum_order_weight double precision,
    price_amount numeric(12,0) NOT NULL,
    type character varying(30) NOT NULL,
    shipping_zone_id integer NOT NULL,
    meta jsonb NOT NULL,
    currency character varying(3) NOT NULL
);


ALTER TABLE public.shipping_shippingmethod OWNER TO saleor;

--
-- Name: shipping_shippingmethod_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.shipping_shippingmethod_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_shippingmethod_id_seq OWNER TO saleor;

--
-- Name: shipping_shippingmethod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.shipping_shippingmethod_id_seq OWNED BY public.shipping_shippingmethod.id;


--
-- Name: shipping_shippingmethodtranslation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.shipping_shippingmethodtranslation (
    id integer NOT NULL,
    language_code character varying(10) NOT NULL,
    name character varying(255),
    shipping_method_id integer NOT NULL
);


ALTER TABLE public.shipping_shippingmethodtranslation OWNER TO saleor;

--
-- Name: shipping_shippingmethodtranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.shipping_shippingmethodtranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_shippingmethodtranslation_id_seq OWNER TO saleor;

--
-- Name: shipping_shippingmethodtranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.shipping_shippingmethodtranslation_id_seq OWNED BY public.shipping_shippingmethodtranslation.id;


--
-- Name: shipping_shippingzone; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.shipping_shippingzone (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    countries character varying(749) NOT NULL,
    "default" boolean NOT NULL
);


ALTER TABLE public.shipping_shippingzone OWNER TO saleor;

--
-- Name: shipping_shippingzone_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.shipping_shippingzone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_shippingzone_id_seq OWNER TO saleor;

--
-- Name: shipping_shippingzone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.shipping_shippingzone_id_seq OWNED BY public.shipping_shippingzone.id;


--
-- Name: site_authorizationkey; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.site_authorizationkey (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    key text NOT NULL,
    password text NOT NULL,
    site_settings_id integer NOT NULL
);


ALTER TABLE public.site_authorizationkey OWNER TO saleor;

--
-- Name: site_authorizationkey_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.site_authorizationkey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_authorizationkey_id_seq OWNER TO saleor;

--
-- Name: site_authorizationkey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.site_authorizationkey_id_seq OWNED BY public.site_authorizationkey.id;


--
-- Name: site_sitesettings; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.site_sitesettings (
    id integer NOT NULL,
    header_text character varying(200) NOT NULL,
    description character varying(500) NOT NULL,
    site_id integer NOT NULL,
    bottom_menu_id integer,
    top_menu_id integer,
    display_gross_prices boolean NOT NULL,
    include_taxes_in_prices boolean NOT NULL,
    charge_taxes_on_shipping boolean NOT NULL,
    track_inventory_by_default boolean NOT NULL,
    homepage_collection_id integer,
    default_weight_unit character varying(10) NOT NULL,
    automatic_fulfillment_digital_products boolean NOT NULL,
    default_digital_max_downloads integer,
    default_digital_url_valid_days integer,
    company_address_id integer,
    default_mail_sender_address character varying(254),
    default_mail_sender_name character varying(78) NOT NULL,
    customer_set_password_url character varying(255)
);


ALTER TABLE public.site_sitesettings OWNER TO saleor;

--
-- Name: site_sitesettings_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.site_sitesettings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_sitesettings_id_seq OWNER TO saleor;

--
-- Name: site_sitesettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.site_sitesettings_id_seq OWNED BY public.site_sitesettings.id;


--
-- Name: site_sitesettingstranslation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.site_sitesettingstranslation (
    id integer NOT NULL,
    language_code character varying(10) NOT NULL,
    header_text character varying(200) NOT NULL,
    description character varying(500) NOT NULL,
    site_settings_id integer NOT NULL
);


ALTER TABLE public.site_sitesettingstranslation OWNER TO saleor;

--
-- Name: site_sitesettingstranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.site_sitesettingstranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_sitesettingstranslation_id_seq OWNER TO saleor;

--
-- Name: site_sitesettingstranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.site_sitesettingstranslation_id_seq OWNED BY public.site_sitesettingstranslation.id;


--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO saleor;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.social_auth_association_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO saleor;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO saleor;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.social_auth_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO saleor;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO saleor;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO saleor;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO saleor;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO saleor;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO saleor;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO saleor;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: userprofile_address_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.userprofile_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofile_address_id_seq OWNER TO saleor;

--
-- Name: userprofile_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.userprofile_address_id_seq OWNED BY public.account_address.id;


--
-- Name: userprofile_user_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.userprofile_user_addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofile_user_addresses_id_seq OWNER TO saleor;

--
-- Name: userprofile_user_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.userprofile_user_addresses_id_seq OWNED BY public.account_user_addresses.id;


--
-- Name: userprofile_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.userprofile_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofile_user_groups_id_seq OWNER TO saleor;

--
-- Name: userprofile_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.userprofile_user_groups_id_seq OWNED BY public.account_user_groups.id;


--
-- Name: userprofile_user_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.userprofile_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofile_user_id_seq OWNER TO saleor;

--
-- Name: userprofile_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.userprofile_user_id_seq OWNED BY public.account_user.id;


--
-- Name: userprofile_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.userprofile_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofile_user_user_permissions_id_seq OWNER TO saleor;

--
-- Name: userprofile_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.userprofile_user_user_permissions_id_seq OWNED BY public.account_user_user_permissions.id;


--
-- Name: webhook_webhook; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.webhook_webhook (
    id integer NOT NULL,
    target_url character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    secret_key character varying(255),
    service_account_id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.webhook_webhook OWNER TO saleor;

--
-- Name: webhook_webhook_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.webhook_webhook_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.webhook_webhook_id_seq OWNER TO saleor;

--
-- Name: webhook_webhook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.webhook_webhook_id_seq OWNED BY public.webhook_webhook.id;


--
-- Name: webhook_webhookevent; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.webhook_webhookevent (
    id integer NOT NULL,
    event_type character varying(128) NOT NULL,
    webhook_id integer NOT NULL
);


ALTER TABLE public.webhook_webhookevent OWNER TO saleor;

--
-- Name: webhook_webhookevent_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.webhook_webhookevent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.webhook_webhookevent_id_seq OWNER TO saleor;

--
-- Name: webhook_webhookevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.webhook_webhookevent_id_seq OWNED BY public.webhook_webhookevent.id;


--
-- Name: account_address id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_address ALTER COLUMN id SET DEFAULT nextval('public.userprofile_address_id_seq'::regclass);


--
-- Name: account_customerevent id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_customerevent ALTER COLUMN id SET DEFAULT nextval('public.account_customerevent_id_seq'::regclass);


--
-- Name: account_customernote id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_customernote ALTER COLUMN id SET DEFAULT nextval('public.account_customernote_id_seq'::regclass);


--
-- Name: account_serviceaccount id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_serviceaccount ALTER COLUMN id SET DEFAULT nextval('public.account_serviceaccount_id_seq'::regclass);


--
-- Name: account_serviceaccount_permissions id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_serviceaccount_permissions ALTER COLUMN id SET DEFAULT nextval('public.account_serviceaccount_permissions_id_seq'::regclass);


--
-- Name: account_serviceaccounttoken id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_serviceaccounttoken ALTER COLUMN id SET DEFAULT nextval('public.account_serviceaccounttoken_id_seq'::regclass);


--
-- Name: account_user id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user ALTER COLUMN id SET DEFAULT nextval('public.userprofile_user_id_seq'::regclass);


--
-- Name: account_user_addresses id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_addresses ALTER COLUMN id SET DEFAULT nextval('public.userprofile_user_addresses_id_seq'::regclass);


--
-- Name: account_user_groups id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_groups ALTER COLUMN id SET DEFAULT nextval('public.userprofile_user_groups_id_seq'::regclass);


--
-- Name: account_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.userprofile_user_user_permissions_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: checkout_checkout_gift_cards id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_checkout_gift_cards ALTER COLUMN id SET DEFAULT nextval('public.checkout_checkout_gift_cards_id_seq'::regclass);


--
-- Name: checkout_checkoutline id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_checkoutline ALTER COLUMN id SET DEFAULT nextval('public.cart_cartline_id_seq'::regclass);


--
-- Name: discount_sale id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale ALTER COLUMN id SET DEFAULT nextval('public.discount_sale_id_seq'::regclass);


--
-- Name: discount_sale_categories id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_categories ALTER COLUMN id SET DEFAULT nextval('public.discount_sale_categories_id_seq'::regclass);


--
-- Name: discount_sale_collections id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_collections ALTER COLUMN id SET DEFAULT nextval('public.discount_sale_collections_id_seq'::regclass);


--
-- Name: discount_sale_products id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_products ALTER COLUMN id SET DEFAULT nextval('public.discount_sale_products_id_seq'::regclass);


--
-- Name: discount_saletranslation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_saletranslation ALTER COLUMN id SET DEFAULT nextval('public.discount_saletranslation_id_seq'::regclass);


--
-- Name: discount_voucher id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher ALTER COLUMN id SET DEFAULT nextval('public.discount_voucher_id_seq'::regclass);


--
-- Name: discount_voucher_categories id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_categories ALTER COLUMN id SET DEFAULT nextval('public.discount_voucher_categories_id_seq'::regclass);


--
-- Name: discount_voucher_collections id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_collections ALTER COLUMN id SET DEFAULT nextval('public.discount_voucher_collections_id_seq'::regclass);


--
-- Name: discount_voucher_products id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_products ALTER COLUMN id SET DEFAULT nextval('public.discount_voucher_products_id_seq'::regclass);


--
-- Name: discount_vouchercustomer id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_vouchercustomer ALTER COLUMN id SET DEFAULT nextval('public.discount_vouchercustomer_id_seq'::regclass);


--
-- Name: discount_vouchertranslation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_vouchertranslation ALTER COLUMN id SET DEFAULT nextval('public.discount_vouchertranslation_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_prices_openexchangerates_conversionrate id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_prices_openexchangerates_conversionrate ALTER COLUMN id SET DEFAULT nextval('public.django_prices_openexchangerates_conversionrate_id_seq'::regclass);


--
-- Name: django_prices_vatlayer_ratetypes id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_prices_vatlayer_ratetypes ALTER COLUMN id SET DEFAULT nextval('public.django_prices_vatlayer_ratetypes_id_seq'::regclass);


--
-- Name: django_prices_vatlayer_vat id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_prices_vatlayer_vat ALTER COLUMN id SET DEFAULT nextval('public.django_prices_vatlayer_vat_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: extensions_pluginconfiguration id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.extensions_pluginconfiguration ALTER COLUMN id SET DEFAULT nextval('public.extensions_pluginconfiguration_id_seq'::regclass);


--
-- Name: giftcard_giftcard id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.giftcard_giftcard ALTER COLUMN id SET DEFAULT nextval('public.giftcard_giftcard_id_seq'::regclass);


--
-- Name: impersonate_impersonationlog id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.impersonate_impersonationlog ALTER COLUMN id SET DEFAULT nextval('public.impersonate_impersonationlog_id_seq'::regclass);


--
-- Name: keyboard_builder_product id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.keyboard_builder_product ALTER COLUMN id SET DEFAULT nextval('public.keyboard_builder_product_id_seq'::regclass);


--
-- Name: menu_menu id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menu ALTER COLUMN id SET DEFAULT nextval('public.menu_menu_id_seq'::regclass);


--
-- Name: menu_menuitem id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menuitem ALTER COLUMN id SET DEFAULT nextval('public.menu_menuitem_id_seq'::regclass);


--
-- Name: menu_menuitemtranslation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menuitemtranslation ALTER COLUMN id SET DEFAULT nextval('public.menu_menuitemtranslation_id_seq'::regclass);


--
-- Name: order_fulfillment id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_fulfillment ALTER COLUMN id SET DEFAULT nextval('public.order_fulfillment_id_seq'::regclass);


--
-- Name: order_fulfillmentline id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_fulfillmentline ALTER COLUMN id SET DEFAULT nextval('public.order_fulfillmentline_id_seq'::regclass);


--
-- Name: order_order id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_order ALTER COLUMN id SET DEFAULT nextval('public.order_order_id_seq'::regclass);


--
-- Name: order_order_gift_cards id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_order_gift_cards ALTER COLUMN id SET DEFAULT nextval('public.order_order_gift_cards_id_seq'::regclass);


--
-- Name: order_orderevent id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_orderevent ALTER COLUMN id SET DEFAULT nextval('public.order_orderevent_id_seq'::regclass);


--
-- Name: order_orderline id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_orderline ALTER COLUMN id SET DEFAULT nextval('public.order_ordereditem_id_seq'::regclass);


--
-- Name: page_page id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.page_page ALTER COLUMN id SET DEFAULT nextval('public.page_page_id_seq'::regclass);


--
-- Name: page_pagetranslation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.page_pagetranslation ALTER COLUMN id SET DEFAULT nextval('public.page_pagetranslation_id_seq'::regclass);


--
-- Name: payment_payment id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.payment_payment ALTER COLUMN id SET DEFAULT nextval('public.payment_paymentmethod_id_seq'::regclass);


--
-- Name: payment_transaction id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.payment_transaction ALTER COLUMN id SET DEFAULT nextval('public.payment_transaction_id_seq'::regclass);


--
-- Name: product_assignedproductattribute id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_assignedproductattribute ALTER COLUMN id SET DEFAULT nextval('public.product_assignedproductattribute_id_seq'::regclass);


--
-- Name: product_assignedproductattribute_values id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_assignedproductattribute_values ALTER COLUMN id SET DEFAULT nextval('public.product_assignedproductattribute_values_id_seq'::regclass);


--
-- Name: product_assignedvariantattribute id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_assignedvariantattribute ALTER COLUMN id SET DEFAULT nextval('public.product_assignedvariantattribute_id_seq'::regclass);


--
-- Name: product_assignedvariantattribute_values id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_assignedvariantattribute_values ALTER COLUMN id SET DEFAULT nextval('public.product_assignedvariantattribute_values_id_seq'::regclass);


--
-- Name: product_attribute id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attribute ALTER COLUMN id SET DEFAULT nextval('public.product_productattribute_id_seq'::regclass);


--
-- Name: product_attributeproduct id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributeproduct ALTER COLUMN id SET DEFAULT nextval('public.product_attributeproduct_id_seq'::regclass);


--
-- Name: product_attributetranslation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributetranslation ALTER COLUMN id SET DEFAULT nextval('public.product_productattributetranslation_id_seq'::regclass);


--
-- Name: product_attributevalue id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributevalue ALTER COLUMN id SET DEFAULT nextval('public.product_attributechoicevalue_id_seq'::regclass);


--
-- Name: product_attributevaluetranslation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributevaluetranslation ALTER COLUMN id SET DEFAULT nextval('public.product_attributechoicevaluetranslation_id_seq'::regclass);


--
-- Name: product_attributevariant id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributevariant ALTER COLUMN id SET DEFAULT nextval('public.product_attributevariant_id_seq'::regclass);


--
-- Name: product_category id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_category ALTER COLUMN id SET DEFAULT nextval('public.product_category_id_seq'::regclass);


--
-- Name: product_categorytranslation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_categorytranslation ALTER COLUMN id SET DEFAULT nextval('public.product_categorytranslation_id_seq'::regclass);


--
-- Name: product_collection id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collection ALTER COLUMN id SET DEFAULT nextval('public.product_collection_id_seq'::regclass);


--
-- Name: product_collectionproduct id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collectionproduct ALTER COLUMN id SET DEFAULT nextval('public.product_collection_products_id_seq'::regclass);


--
-- Name: product_collectiontranslation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collectiontranslation ALTER COLUMN id SET DEFAULT nextval('public.product_collectiontranslation_id_seq'::regclass);


--
-- Name: product_digitalcontent id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_digitalcontent ALTER COLUMN id SET DEFAULT nextval('public.product_digitalcontent_id_seq'::regclass);


--
-- Name: product_digitalcontenturl id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_digitalcontenturl ALTER COLUMN id SET DEFAULT nextval('public.product_digitalcontenturl_id_seq'::regclass);


--
-- Name: product_product id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_product ALTER COLUMN id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- Name: product_productimage id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productimage ALTER COLUMN id SET DEFAULT nextval('public.product_productimage_id_seq'::regclass);


--
-- Name: product_producttranslation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_producttranslation ALTER COLUMN id SET DEFAULT nextval('public.product_producttranslation_id_seq'::regclass);


--
-- Name: product_producttype id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_producttype ALTER COLUMN id SET DEFAULT nextval('public.product_productclass_id_seq'::regclass);


--
-- Name: product_productvariant id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productvariant ALTER COLUMN id SET DEFAULT nextval('public.product_productvariant_id_seq'::regclass);


--
-- Name: product_productvarianttranslation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productvarianttranslation ALTER COLUMN id SET DEFAULT nextval('public.product_productvarianttranslation_id_seq'::regclass);


--
-- Name: product_variantimage id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_variantimage ALTER COLUMN id SET DEFAULT nextval('public.product_variantimage_id_seq'::regclass);


--
-- Name: shipping_shippingmethod id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.shipping_shippingmethod ALTER COLUMN id SET DEFAULT nextval('public.shipping_shippingmethod_id_seq'::regclass);


--
-- Name: shipping_shippingmethodtranslation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.shipping_shippingmethodtranslation ALTER COLUMN id SET DEFAULT nextval('public.shipping_shippingmethodtranslation_id_seq'::regclass);


--
-- Name: shipping_shippingzone id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.shipping_shippingzone ALTER COLUMN id SET DEFAULT nextval('public.shipping_shippingzone_id_seq'::regclass);


--
-- Name: site_authorizationkey id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_authorizationkey ALTER COLUMN id SET DEFAULT nextval('public.site_authorizationkey_id_seq'::regclass);


--
-- Name: site_sitesettings id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettings ALTER COLUMN id SET DEFAULT nextval('public.site_sitesettings_id_seq'::regclass);


--
-- Name: site_sitesettingstranslation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettingstranslation ALTER COLUMN id SET DEFAULT nextval('public.site_sitesettingstranslation_id_seq'::regclass);


--
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Name: webhook_webhook id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.webhook_webhook ALTER COLUMN id SET DEFAULT nextval('public.webhook_webhook_id_seq'::regclass);


--
-- Name: webhook_webhookevent id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.webhook_webhookevent ALTER COLUMN id SET DEFAULT nextval('public.webhook_webhookevent_id_seq'::regclass);


--
-- Data for Name: account_address; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.account_address (id, first_name, last_name, company_name, street_address_1, street_address_2, city, postal_code, country, country_area, phone, city_area) FROM stdin;
1	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
2	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
3	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
4	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
5	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
6	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
7	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
8	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
9	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
10	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
11	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
12	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
13	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
14	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
15	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
16	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
17	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
18	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
19	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
20	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
21	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
22	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
23	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
24	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
25	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
26	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
27	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
28	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
29	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
30	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
31	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
32	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
33	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
34	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
35	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
36	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
37	phong13	le	da nang	hoa tien	hoa tien	DA NANG	2133	VN		+43774578640	
38	a	a	a	a	a	A	a	VN		+84774578640	
39	a	a	a	a	a	A	a	VN		+84774578640	
40	a	a	a	a	a	A	a	VN		+84774578640	
41	a	a	a	a	a	A	a	VN		+84774578640	
42	a	a	a	a	a	A	a	VN		+84774578640	
43	a	a	a	a	a	A	a	VN		+84774578640	
44	a	a	a	a	a	A	a	VN		+84774578640	
\.


--
-- Data for Name: account_customerevent; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.account_customerevent (id, date, type, parameters, order_id, user_id) FROM stdin;
1	2025-01-12 08:39:39.603424+00	placed_order	{}	1	2
2	2025-01-12 08:46:30.375998+00	placed_order	{}	2	2
3	2025-01-12 09:08:05.360998+00	placed_order	{}	3	2
4	2025-01-12 09:12:42.185724+00	placed_order	{}	4	2
5	2025-01-12 09:14:12.86976+00	note_added_to_order	{"message": ""}	4	2
6	2025-01-12 09:14:15.169196+00	note_added_to_order	{"message": ""}	4	2
7	2025-01-12 09:24:08.941042+00	placed_order	{}	5	2
8	2025-01-12 09:26:16.850784+00	placed_order	{}	6	2
9	2025-01-12 09:30:09.938495+00	placed_order	{}	7	2
10	2025-01-12 09:30:52.071669+00	placed_order	{}	8	2
11	2025-01-12 10:14:52.367262+00	placed_order	{}	9	2
12	2025-01-12 10:17:36.433822+00	placed_order	{}	10	2
13	2025-01-12 10:44:19.786246+00	placed_order	{}	11	2
14	2025-01-12 10:47:30.208121+00	placed_order	{}	12	2
15	2025-01-12 10:50:28.619624+00	placed_order	{}	13	2
16	2025-01-12 10:55:24.723816+00	placed_order	{}	14	2
17	2025-01-12 10:59:06.141704+00	placed_order	{}	15	2
18	2025-01-12 11:02:43.64165+00	placed_order	{}	16	2
19	2025-01-12 11:04:43.21424+00	placed_order	{}	17	2
20	2025-01-12 11:05:49.022983+00	placed_order	{}	18	2
21	2025-01-12 22:39:11.309902+00	account_created	{}	\N	3
22	2025-01-12 22:39:29.361145+00	account_created	{}	\N	4
23	2025-01-12 22:45:21.306955+00	account_created	{}	\N	5
24	2025-01-12 22:51:18.852654+00	account_created	{}	\N	6
25	2025-01-12 23:09:47.075258+00	placed_order	{}	19	6
26	2025-01-12 23:10:07.268277+00	placed_order	{}	20	6
27	2025-01-12 23:10:20.600817+00	note_added_to_order	{"message": ""}	20	6
28	2025-01-12 23:20:00.462589+00	account_created	{}	\N	7
\.


--
-- Data for Name: account_customernote; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.account_customernote (id, date, content, is_public, customer_id, user_id) FROM stdin;
\.


--
-- Data for Name: account_serviceaccount; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.account_serviceaccount (id, private_meta, meta, name, created, is_active) FROM stdin;
\.


--
-- Data for Name: account_serviceaccount_permissions; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.account_serviceaccount_permissions (id, serviceaccount_id, permission_id) FROM stdin;
\.


--
-- Data for Name: account_serviceaccounttoken; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.account_serviceaccounttoken (id, name, auth_token, service_account_id) FROM stdin;
\.


--
-- Data for Name: account_user; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.account_user (id, is_superuser, email, is_staff, is_active, password, date_joined, last_login, default_billing_address_id, default_shipping_address_id, note, first_name, last_name, avatar, private_meta, meta) FROM stdin;
3	f	binmilo156@tgmil.com	f	t	pbkdf2_sha256$150000$N6u67Qpecd3u$5PoGjy5TmRFAG4HH/9JLK+sh1zQsap6Lbp25eN6mssE=	2025-01-12 22:39:11.194567+00	2025-01-12 22:39:11.471082+00	\N	\N	\N				{}	{}
4	f	demo@demo.com	f	t	pbkdf2_sha256$150000$5za96558fORa$90I4D6bsNWkGl6ymPqDSma+0V+uJjuxr40A/Q3UzcnI=	2025-01-12 22:39:29.247699+00	2025-01-12 22:39:29.465749+00	\N	\N	\N				{}	{}
5	f	test@test.com	f	t	pbkdf2_sha256$150000$KDBzfwGXnP9E$neQXnNBYUpNbesbqKnEVooeJ7hKHf51+4qF1c33J0Rw=	2025-01-12 22:45:21.189613+00	2025-01-12 22:45:21.646126+00	\N	\N	\N				{}	{}
6	f	abc@gmail.com	f	t	pbkdf2_sha256$150000$QlcaRwT5em0c$NeaHfrNz30DJjBr2mcU9ICl4kPpSGTm0bfg0Zek5uEs=	2025-01-12 22:51:18.738416+00	2025-01-12 23:10:30.556755+00	40	40	\N				{}	{}
7	f	demo@gmail.com	f	t	pbkdf2_sha256$150000$GbMXsvqzdigM$MFjnglGUzMaDaG8Kl3YAuXCirx+orKwB5N0qV1hBX4E=	2025-01-12 23:20:00.347588+00	2025-01-12 23:20:00.627844+00	\N	\N	\N				{}	{}
1	t	staff@gmail.com	t	f	pbkdf2_sha256$150000$ZteQlx2k7i4f$ba5gOZKkjpGlTz2cR8mvqZfgyDDVZvq9as99YQJAafA=	2025-01-10 05:34:22.505586+00	2025-01-10 05:34:43.290999+00	\N	\N	\N				{}	{}
8	f	test2@gmail.com	t	t	pbkdf2_sha256$150000$XUzXlU75AeJR$QafFYED4OVqtY2L1SB2y0CNiGGXG4jAwKdO5naFFeLI=	2025-01-13 00:56:16.171423+00	\N	\N	\N	\N	123	123		{}	{}
2	t	admin@admin.com	t	t	pbkdf2_sha256$150000$9XbVvaAoZ6fe$C/ToxFa8Jqh5f2kfDORhZ7adbjfE2KSfV8Se9Tumkbk=	2025-01-10 08:52:54.797917+00	2025-01-13 01:15:03.929179+00	3	3	\N				{}	{}
\.


--
-- Data for Name: account_user_addresses; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.account_user_addresses (id, user_id, address_id) FROM stdin;
1	2	3
2	6	40
\.


--
-- Data for Name: account_user_groups; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.account_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: account_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.account_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add content type	1	add_contenttype
2	Can change content type	1	change_contenttype
3	Can delete content type	1	delete_contenttype
4	Can view content type	1	view_contenttype
5	Can add session	2	add_session
6	Can change session	2	change_session
7	Can delete session	2	delete_session
8	Can view session	2	view_session
9	Can add site	3	add_site
10	Can change site	3	change_site
11	Can delete site	3	delete_site
12	Can view site	3	view_site
13	Can add permission	4	add_permission
14	Can change permission	4	change_permission
15	Can delete permission	4	delete_permission
16	Can view permission	4	view_permission
17	Can add group	5	add_group
18	Can change group	5	change_group
19	Can delete group	5	delete_group
20	Can view group	5	view_group
21	Can add plugin configuration	6	add_pluginconfiguration
22	Can change plugin configuration	6	change_pluginconfiguration
23	Can delete plugin configuration	6	delete_pluginconfiguration
24	Can view plugin configuration	6	view_pluginconfiguration
25	Manage plugins	6	manage_plugins
26	Can add user	7	add_user
27	Can change user	7	change_user
28	Can delete user	7	delete_user
29	Can view user	7	view_user
30	Manage customers.	7	manage_users
31	Manage staff.	7	manage_staff
32	Impersonate customers.	7	impersonate_users
33	Can add address	8	add_address
34	Can change address	8	change_address
35	Can delete address	8	delete_address
36	Can view address	8	view_address
37	Can add customer note	9	add_customernote
38	Can change customer note	9	change_customernote
39	Can delete customer note	9	delete_customernote
40	Can view customer note	9	view_customernote
41	Can add customer event	10	add_customerevent
42	Can change customer event	10	change_customerevent
43	Can delete customer event	10	delete_customerevent
44	Can view customer event	10	view_customerevent
45	Can add service account	11	add_serviceaccount
46	Can change service account	11	change_serviceaccount
47	Can delete service account	11	delete_serviceaccount
48	Can view service account	11	view_serviceaccount
49	Manage service account	11	manage_service_accounts
50	Can add service account token	12	add_serviceaccounttoken
51	Can change service account token	12	change_serviceaccounttoken
52	Can delete service account token	12	delete_serviceaccounttoken
53	Can view service account token	12	view_serviceaccounttoken
54	Can add sale	13	add_sale
55	Can change sale	13	change_sale
56	Can delete sale	13	delete_sale
57	Can view sale	13	view_sale
58	Manage sales and vouchers.	13	manage_discounts
59	Can add voucher	14	add_voucher
60	Can change voucher	14	change_voucher
61	Can delete voucher	14	delete_voucher
62	Can view voucher	14	view_voucher
63	Can add voucher translation	15	add_vouchertranslation
64	Can change voucher translation	15	change_vouchertranslation
65	Can delete voucher translation	15	delete_vouchertranslation
66	Can view voucher translation	15	view_vouchertranslation
67	Can add sale translation	16	add_saletranslation
68	Can change sale translation	16	change_saletranslation
69	Can delete sale translation	16	delete_saletranslation
70	Can view sale translation	16	view_saletranslation
71	Can add voucher customer	17	add_vouchercustomer
72	Can change voucher customer	17	change_vouchercustomer
73	Can delete voucher customer	17	delete_vouchercustomer
74	Can view voucher customer	17	view_vouchercustomer
75	Can add gift card	18	add_giftcard
76	Can change gift card	18	change_giftcard
77	Can delete gift card	18	delete_giftcard
78	Can view gift card	18	view_giftcard
79	Manage gift cards.	18	manage_gift_card
80	Can add category	19	add_category
81	Can change category	19	change_category
82	Can delete category	19	delete_category
83	Can view category	19	view_category
84	Can add product	20	add_product
85	Can change product	20	change_product
86	Can delete product	20	delete_product
87	Can view product	20	view_product
88	Manage products.	20	manage_products
89	Can add product image	21	add_productimage
90	Can change product image	21	change_productimage
91	Can delete product image	21	delete_productimage
92	Can view product image	21	view_productimage
93	Can add product variant	22	add_productvariant
94	Can change product variant	22	change_productvariant
95	Can delete product variant	22	delete_productvariant
96	Can view product variant	22	view_productvariant
97	Can add variant image	23	add_variantimage
98	Can change variant image	23	change_variantimage
99	Can delete variant image	23	delete_variantimage
100	Can view variant image	23	view_variantimage
101	Can add product type	24	add_producttype
102	Can change product type	24	change_producttype
103	Can delete product type	24	delete_producttype
104	Can view product type	24	view_producttype
105	Can add collection product	25	add_collectionproduct
106	Can change collection product	25	change_collectionproduct
107	Can delete collection product	25	delete_collectionproduct
108	Can view collection product	25	view_collectionproduct
109	Can add collection	26	add_collection
110	Can change collection	26	change_collection
111	Can delete collection	26	delete_collection
112	Can view collection	26	view_collection
113	Can add category translation	27	add_categorytranslation
114	Can change category translation	27	change_categorytranslation
115	Can delete category translation	27	delete_categorytranslation
116	Can view category translation	27	view_categorytranslation
117	Can add collection translation	28	add_collectiontranslation
118	Can change collection translation	28	change_collectiontranslation
119	Can delete collection translation	28	delete_collectiontranslation
120	Can view collection translation	28	view_collectiontranslation
121	Can add product translation	29	add_producttranslation
122	Can change product translation	29	change_producttranslation
123	Can delete product translation	29	delete_producttranslation
124	Can view product translation	29	view_producttranslation
125	Can add product variant translation	30	add_productvarianttranslation
126	Can change product variant translation	30	change_productvarianttranslation
127	Can delete product variant translation	30	delete_productvarianttranslation
128	Can view product variant translation	30	view_productvarianttranslation
129	Can add attribute	31	add_attribute
130	Can change attribute	31	change_attribute
131	Can delete attribute	31	delete_attribute
132	Can view attribute	31	view_attribute
133	Can add attribute value translation	32	add_attributevaluetranslation
134	Can change attribute value translation	32	change_attributevaluetranslation
135	Can delete attribute value translation	32	delete_attributevaluetranslation
136	Can view attribute value translation	32	view_attributevaluetranslation
137	Can add attribute value	33	add_attributevalue
138	Can change attribute value	33	change_attributevalue
139	Can delete attribute value	33	delete_attributevalue
140	Can view attribute value	33	view_attributevalue
141	Can add attribute translation	34	add_attributetranslation
142	Can change attribute translation	34	change_attributetranslation
143	Can delete attribute translation	34	delete_attributetranslation
144	Can view attribute translation	34	view_attributetranslation
145	Can add digital content	35	add_digitalcontent
146	Can change digital content	35	change_digitalcontent
147	Can delete digital content	35	delete_digitalcontent
148	Can view digital content	35	view_digitalcontent
149	Can add digital content url	36	add_digitalcontenturl
150	Can change digital content url	36	change_digitalcontenturl
151	Can delete digital content url	36	delete_digitalcontenturl
152	Can view digital content url	36	view_digitalcontenturl
153	Can add attribute product	37	add_attributeproduct
154	Can change attribute product	37	change_attributeproduct
155	Can delete attribute product	37	delete_attributeproduct
156	Can view attribute product	37	view_attributeproduct
157	Can add attribute variant	38	add_attributevariant
158	Can change attribute variant	38	change_attributevariant
159	Can delete attribute variant	38	delete_attributevariant
160	Can view attribute variant	38	view_attributevariant
161	Can add assigned product attribute	39	add_assignedproductattribute
162	Can change assigned product attribute	39	change_assignedproductattribute
163	Can delete assigned product attribute	39	delete_assignedproductattribute
164	Can view assigned product attribute	39	view_assignedproductattribute
165	Can add assigned variant attribute	40	add_assignedvariantattribute
166	Can change assigned variant attribute	40	change_assignedvariantattribute
167	Can delete assigned variant attribute	40	delete_assignedvariantattribute
168	Can view assigned variant attribute	40	view_assignedvariantattribute
169	Can add checkout	41	add_checkout
170	Can change checkout	41	change_checkout
171	Can delete checkout	41	delete_checkout
172	Can view checkout	41	view_checkout
173	Can add checkout line	42	add_checkoutline
174	Can change checkout line	42	change_checkoutline
175	Can delete checkout line	42	delete_checkoutline
176	Can view checkout line	42	view_checkoutline
177	Can add menu	43	add_menu
178	Can change menu	43	change_menu
179	Can delete menu	43	delete_menu
180	Can view menu	43	view_menu
181	Manage navigation.	43	manage_menus
182	Can add menu item	44	add_menuitem
183	Can change menu item	44	change_menuitem
184	Can delete menu item	44	delete_menuitem
185	Can view menu item	44	view_menuitem
186	Can add menu item translation	45	add_menuitemtranslation
187	Can change menu item translation	45	change_menuitemtranslation
188	Can delete menu item translation	45	delete_menuitemtranslation
189	Can view menu item translation	45	view_menuitemtranslation
190	Can add order	46	add_order
191	Can change order	46	change_order
192	Can delete order	46	delete_order
193	Can view order	46	view_order
194	Manage orders.	46	manage_orders
195	Can add order line	47	add_orderline
196	Can change order line	47	change_orderline
197	Can delete order line	47	delete_orderline
198	Can view order line	47	view_orderline
199	Can add fulfillment	48	add_fulfillment
200	Can change fulfillment	48	change_fulfillment
201	Can delete fulfillment	48	delete_fulfillment
202	Can view fulfillment	48	view_fulfillment
203	Can add fulfillment line	49	add_fulfillmentline
204	Can change fulfillment line	49	change_fulfillmentline
205	Can delete fulfillment line	49	delete_fulfillmentline
206	Can view fulfillment line	49	view_fulfillmentline
207	Can add order event	50	add_orderevent
208	Can change order event	50	change_orderevent
209	Can delete order event	50	delete_orderevent
210	Can view order event	50	view_orderevent
211	Can add shipping method	51	add_shippingmethod
212	Can change shipping method	51	change_shippingmethod
213	Can delete shipping method	51	delete_shippingmethod
214	Can view shipping method	51	view_shippingmethod
215	Can add shipping method translation	52	add_shippingmethodtranslation
216	Can change shipping method translation	52	change_shippingmethodtranslation
217	Can delete shipping method translation	52	delete_shippingmethodtranslation
218	Can view shipping method translation	52	view_shippingmethodtranslation
219	Can add shipping zone	53	add_shippingzone
220	Can change shipping zone	53	change_shippingzone
221	Can delete shipping zone	53	delete_shippingzone
222	Can view shipping zone	53	view_shippingzone
223	Manage shipping.	53	manage_shipping
224	Can add site settings	54	add_sitesettings
225	Can change site settings	54	change_sitesettings
226	Can delete site settings	54	delete_sitesettings
227	Can view site settings	54	view_sitesettings
228	Manage settings.	54	manage_settings
229	Manage translations.	54	manage_translations
230	Can add authorization key	55	add_authorizationkey
231	Can change authorization key	55	change_authorizationkey
232	Can delete authorization key	55	delete_authorizationkey
233	Can view authorization key	55	view_authorizationkey
234	Can add site settings translation	56	add_sitesettingstranslation
235	Can change site settings translation	56	change_sitesettingstranslation
236	Can delete site settings translation	56	delete_sitesettingstranslation
237	Can view site settings translation	56	view_sitesettingstranslation
238	Can add page	57	add_page
239	Can change page	57	change_page
240	Can delete page	57	delete_page
241	Can view page	57	view_page
242	Manage pages.	57	manage_pages
243	Can add page translation	58	add_pagetranslation
244	Can change page translation	58	change_pagetranslation
245	Can delete page translation	58	delete_pagetranslation
246	Can view page translation	58	view_pagetranslation
247	Can add transaction	59	add_transaction
248	Can change transaction	59	change_transaction
249	Can delete transaction	59	delete_transaction
250	Can view transaction	59	view_transaction
251	Can add payment	60	add_payment
252	Can change payment	60	change_payment
253	Can delete payment	60	delete_payment
254	Can view payment	60	view_payment
255	Can add webhook	61	add_webhook
256	Can change webhook	61	change_webhook
257	Can delete webhook	61	delete_webhook
258	Can view webhook	61	view_webhook
259	Manage webhooks	61	manage_webhooks
260	Can add webhook event	62	add_webhookevent
261	Can change webhook event	62	change_webhookevent
262	Can delete webhook event	62	delete_webhookevent
263	Can view webhook event	62	view_webhookevent
264	Can add conversion rate	63	add_conversionrate
265	Can change conversion rate	63	change_conversionrate
266	Can delete conversion rate	63	delete_conversionrate
267	Can view conversion rate	63	view_conversionrate
268	Can add vat	64	add_vat
269	Can change vat	64	change_vat
270	Can delete vat	64	delete_vat
271	Can view vat	64	view_vat
272	Can add rate types	65	add_ratetypes
273	Can change rate types	65	change_ratetypes
274	Can delete rate types	65	delete_ratetypes
275	Can view rate types	65	view_ratetypes
276	Can add association	66	add_association
277	Can change association	66	change_association
278	Can delete association	66	delete_association
279	Can view association	66	view_association
280	Can add code	67	add_code
281	Can change code	67	change_code
282	Can delete code	67	delete_code
283	Can view code	67	view_code
284	Can add nonce	68	add_nonce
285	Can change nonce	68	change_nonce
286	Can delete nonce	68	delete_nonce
287	Can view nonce	68	view_nonce
288	Can add user social auth	69	add_usersocialauth
289	Can change user social auth	69	change_usersocialauth
290	Can delete user social auth	69	delete_usersocialauth
291	Can view user social auth	69	view_usersocialauth
292	Can add partial	70	add_partial
293	Can change partial	70	change_partial
294	Can delete partial	70	delete_partial
295	Can view partial	70	view_partial
296	Can add impersonation log	71	add_impersonationlog
297	Can change impersonation log	71	change_impersonationlog
298	Can delete impersonation log	71	delete_impersonationlog
299	Can view impersonation log	71	view_impersonationlog
300	Can add product	72	add_product
301	Can change product	72	change_product
302	Can delete product	72	delete_product
303	Can view product	72	view_product
\.


--
-- Data for Name: checkout_checkout; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.checkout_checkout (created, last_change, email, token, quantity, user_id, billing_address_id, discount_amount, discount_name, note, shipping_address_id, shipping_method_id, voucher_code, translated_discount_name, meta, private_meta, currency) FROM stdin;
2025-01-10 06:53:23.498045+00	2025-01-10 06:53:23.498072+00	hphong1v1@gmail.com	a573218e-0174-475c-b4cf-b3ae1b171d0c	0	1	\N	0	\N		\N	\N	\N	\N	{}	{}	VND
\.


--
-- Data for Name: checkout_checkout_gift_cards; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.checkout_checkout_gift_cards (id, checkout_id, giftcard_id) FROM stdin;
\.


--
-- Data for Name: checkout_checkoutline; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.checkout_checkoutline (id, quantity, checkout_id, variant_id, data) FROM stdin;
\.


--
-- Data for Name: discount_sale; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.discount_sale (id, name, type, value, end_date, start_date) FROM stdin;
1	Uu dai dep tet	percentage	15	2025-01-22 17:00:00+00	2025-01-12 17:00:00+00
\.


--
-- Data for Name: discount_sale_categories; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.discount_sale_categories (id, sale_id, category_id) FROM stdin;
1	1	7
\.


--
-- Data for Name: discount_sale_collections; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.discount_sale_collections (id, sale_id, collection_id) FROM stdin;
\.


--
-- Data for Name: discount_sale_products; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.discount_sale_products (id, sale_id, product_id) FROM stdin;
1	1	7
2	1	8
\.


--
-- Data for Name: discount_saletranslation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.discount_saletranslation (id, language_code, name, sale_id) FROM stdin;
\.


--
-- Data for Name: discount_voucher; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.discount_voucher (id, type, name, code, usage_limit, used, start_date, end_date, discount_value_type, discount_value, min_spent_amount, apply_once_per_order, countries, min_checkout_items_quantity, apply_once_per_customer, currency) FROM stdin;
1	entire_order	happy new year	cmnr2025	5	1	2025-01-09 17:00:00+00	2025-01-16 17:00:00+00	percentage	20	300000	f		\N	f	VND
\.


--
-- Data for Name: discount_voucher_categories; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.discount_voucher_categories (id, voucher_id, category_id) FROM stdin;
\.


--
-- Data for Name: discount_voucher_collections; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.discount_voucher_collections (id, voucher_id, collection_id) FROM stdin;
\.


--
-- Data for Name: discount_voucher_products; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.discount_voucher_products (id, voucher_id, product_id) FROM stdin;
\.


--
-- Data for Name: discount_vouchercustomer; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.discount_vouchercustomer (id, customer_email, voucher_id) FROM stdin;
\.


--
-- Data for Name: discount_vouchertranslation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.discount_vouchertranslation (id, language_code, name, voucher_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	contenttypes	contenttype
2	sessions	session
3	sites	site
4	auth	permission
5	auth	group
6	extensions	pluginconfiguration
7	account	user
8	account	address
9	account	customernote
10	account	customerevent
11	account	serviceaccount
12	account	serviceaccounttoken
13	discount	sale
14	discount	voucher
15	discount	vouchertranslation
16	discount	saletranslation
17	discount	vouchercustomer
18	giftcard	giftcard
19	product	category
20	product	product
21	product	productimage
22	product	productvariant
23	product	variantimage
24	product	producttype
25	product	collectionproduct
26	product	collection
27	product	categorytranslation
28	product	collectiontranslation
29	product	producttranslation
30	product	productvarianttranslation
31	product	attribute
32	product	attributevaluetranslation
33	product	attributevalue
34	product	attributetranslation
35	product	digitalcontent
36	product	digitalcontenturl
37	product	attributeproduct
38	product	attributevariant
39	product	assignedproductattribute
40	product	assignedvariantattribute
41	checkout	checkout
42	checkout	checkoutline
43	menu	menu
44	menu	menuitem
45	menu	menuitemtranslation
46	order	order
47	order	orderline
48	order	fulfillment
49	order	fulfillmentline
50	order	orderevent
51	shipping	shippingmethod
52	shipping	shippingmethodtranslation
53	shipping	shippingzone
54	site	sitesettings
55	site	authorizationkey
56	site	sitesettingstranslation
57	page	page
58	page	pagetranslation
59	payment	transaction
60	payment	payment
61	webhook	webhook
62	webhook	webhookevent
63	django_prices_openexchangerates	conversionrate
64	django_prices_vatlayer	vat
65	django_prices_vatlayer	ratetypes
66	social_django	association
67	social_django	code
68	social_django	nonce
69	social_django	usersocialauth
70	social_django	partial
71	impersonate	impersonationlog
72	keyboard_builder	product
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2025-01-10 05:20:11.330907+00
2	contenttypes	0002_remove_content_type_name	2025-01-10 05:20:11.341615+00
3	auth	0001_initial	2025-01-10 05:20:11.369549+00
4	auth	0002_alter_permission_name_max_length	2025-01-10 05:20:11.397539+00
5	auth	0003_alter_user_email_max_length	2025-01-10 05:20:11.403718+00
6	auth	0004_alter_user_username_opts	2025-01-10 05:20:11.411277+00
7	auth	0005_alter_user_last_login_null	2025-01-10 05:20:11.417819+00
8	auth	0006_require_contenttypes_0002	2025-01-10 05:20:11.420793+00
9	auth	0007_alter_validators_add_error_messages	2025-01-10 05:20:11.427691+00
10	auth	0008_alter_user_username_max_length	2025-01-10 05:20:11.435069+00
11	auth	0009_alter_user_last_name_max_length	2025-01-10 05:20:11.441563+00
12	auth	0010_alter_group_name_max_length	2025-01-10 05:20:11.450203+00
13	auth	0011_update_proxy_permissions	2025-01-10 05:20:11.457187+00
14	product	0001_initial	2025-01-10 05:20:11.581388+00
15	product	0002_auto_20150722_0545	2025-01-10 05:20:11.680718+00
16	product	0003_auto_20150820_2016	2025-01-10 05:20:11.713164+00
17	product	0003_auto_20150820_1955	2025-01-10 05:20:11.722598+00
18	product	0004_merge	2025-01-10 05:20:11.725033+00
19	product	0005_auto_20150825_1433	2025-01-10 05:20:11.755833+00
20	product	0006_product_updated_at	2025-01-10 05:20:11.764684+00
21	product	0007_auto_20160112_1025	2025-01-10 05:20:11.790271+00
22	product	0008_auto_20160114_0733	2025-01-10 05:20:11.811314+00
23	product	0009_discount_categories	2025-01-10 05:20:11.82508+00
24	product	0010_auto_20160129_0826	2025-01-10 05:20:11.857174+00
25	product	0011_stock_quantity_allocated	2025-01-10 05:20:11.866626+00
26	product	0012_auto_20160218_0812	2025-01-10 05:20:11.889007+00
27	product	0013_auto_20161207_0555	2025-01-10 05:20:11.915838+00
28	product	0014_auto_20161207_0840	2025-01-10 05:20:11.932659+00
29	product	0015_transfer_locations	2025-01-10 05:20:11.947565+00
30	product	0016_auto_20161207_0843	2025-01-10 05:20:11.966472+00
31	product	0017_remove_stock_location	2025-01-10 05:20:11.976852+00
32	product	0018_auto_20161207_0844	2025-01-10 05:20:12.001949+00
33	product	0019_auto_20161212_0230	2025-01-10 05:20:12.040761+00
34	product	0020_attribute_data_to_class	2025-01-10 05:20:12.079543+00
35	product	0021_add_hstore_extension	2025-01-10 05:20:12.107452+00
36	product	0022_auto_20161212_0301	2025-01-10 05:20:12.143427+00
37	product	0023_auto_20161211_1912	2025-01-10 05:20:12.154712+00
38	product	0024_migrate_json_data	2025-01-10 05:20:12.182164+00
39	product	0025_auto_20161219_0517	2025-01-10 05:20:12.284413+00
40	product	0026_auto_20161230_0347	2025-01-10 05:20:12.291399+00
41	product	0027_auto_20170113_0435	2025-01-10 05:20:12.329891+00
42	product	0013_auto_20161130_0608	2025-01-10 05:20:12.333799+00
43	product	0014_remove_productvariant_attributes	2025-01-10 05:20:12.343539+00
44	product	0015_productvariant_attributes	2025-01-10 05:20:12.35423+00
45	product	0016_auto_20161204_0311	2025-01-10 05:20:12.366796+00
46	product	0017_attributechoicevalue_slug	2025-01-10 05:20:12.375159+00
47	product	0018_auto_20161212_0725	2025-01-10 05:20:12.395686+00
48	product	0026_merge_20161221_0845	2025-01-10 05:20:12.398948+00
49	product	0028_merge_20170116_1016	2025-01-10 05:20:12.40301+00
50	product	0029_product_is_featured	2025-01-10 05:20:12.413832+00
51	product	0030_auto_20170206_0407	2025-01-10 05:20:12.525298+00
52	product	0031_auto_20170206_0601	2025-01-10 05:20:12.546015+00
53	product	0032_auto_20170216_0438	2025-01-10 05:20:12.557636+00
54	product	0033_auto_20170227_0757	2025-01-10 05:20:12.580801+00
55	product	0034_product_is_published	2025-01-10 05:20:12.591574+00
56	product	0035_auto_20170919_0846	2025-01-10 05:20:12.606435+00
57	product	0036_auto_20171115_0608	2025-01-10 05:20:12.614656+00
58	product	0037_auto_20171124_0847	2025-01-10 05:20:12.627919+00
59	product	0038_auto_20171129_0616	2025-01-10 05:20:12.654918+00
60	product	0037_auto_20171129_1004	2025-01-10 05:20:12.689631+00
61	product	0039_merge_20171130_0727	2025-01-10 05:20:12.692378+00
62	product	0040_auto_20171205_0428	2025-01-10 05:20:12.704597+00
63	product	0041_auto_20171205_0546	2025-01-10 05:20:12.714257+00
64	product	0042_auto_20171206_0501	2025-01-10 05:20:12.7214+00
65	product	0043_auto_20171207_0839	2025-01-10 05:20:12.730055+00
66	product	0044_auto_20180108_0814	2025-01-10 05:20:12.984265+00
67	product	0045_md_to_html	2025-01-10 05:20:12.998434+00
68	product	0046_product_category	2025-01-10 05:20:13.022774+00
69	product	0047_auto_20180117_0359	2025-01-10 05:20:13.053629+00
70	product	0048_product_class_to_type	2025-01-10 05:20:13.127937+00
71	product	0049_collection	2025-01-10 05:20:13.167056+00
72	product	0050_auto_20180131_0746	2025-01-10 05:20:13.193545+00
73	product	0051_auto_20180202_1106	2025-01-10 05:20:13.201424+00
74	product	0052_slug_field_length	2025-01-10 05:20:13.233794+00
75	product	0053_product_seo_description	2025-01-10 05:20:13.254753+00
76	product	0053_auto_20180305_1002	2025-01-10 05:20:13.269644+00
77	product	0054_merge_20180320_1108	2025-01-10 05:20:13.275143+00
78	shipping	0001_initial	2025-01-10 05:20:13.303309+00
79	shipping	0002_auto_20160906_0741	2025-01-10 05:20:13.317482+00
80	shipping	0003_auto_20170116_0700	2025-01-10 05:20:13.323672+00
81	shipping	0004_auto_20170206_0407	2025-01-10 05:20:13.347536+00
82	shipping	0005_auto_20170906_0556	2025-01-10 05:20:13.353084+00
83	shipping	0006_auto_20171109_0908	2025-01-10 05:20:13.358048+00
84	shipping	0007_auto_20171129_1004	2025-01-10 05:20:13.365347+00
85	shipping	0008_auto_20180108_0814	2025-01-10 05:20:13.385971+00
86	userprofile	0001_initial	2025-01-10 05:20:13.446108+00
87	order	0001_initial	2025-01-10 05:20:13.59659+00
88	order	0002_auto_20150820_1955	2025-01-10 05:20:13.660131+00
89	order	0003_auto_20150825_1433	2025-01-10 05:20:13.69089+00
90	order	0004_order_total	2025-01-10 05:20:13.704295+00
91	order	0005_deliverygroup_last_updated	2025-01-10 05:20:13.716846+00
92	order	0006_deliverygroup_shipping_method	2025-01-10 05:20:13.728666+00
93	order	0007_deliverygroup_tracking_number	2025-01-10 05:20:13.749293+00
94	order	0008_auto_20151026_0820	2025-01-10 05:20:13.782904+00
95	order	0009_auto_20151201_0820	2025-01-10 05:20:13.82777+00
96	order	0010_auto_20160119_0541	2025-01-10 05:20:13.862897+00
97	discount	0001_initial	2025-01-10 05:20:13.898132+00
98	discount	0002_voucher	2025-01-10 05:20:13.947483+00
99	discount	0003_auto_20160207_0534	2025-01-10 05:20:14.168437+00
100	order	0011_auto_20160207_0534	2025-01-10 05:20:14.212974+00
101	order	0012_auto_20160216_1032	2025-01-10 05:20:14.249157+00
102	order	0013_auto_20160906_0741	2025-01-10 05:20:14.300692+00
103	order	0014_auto_20161028_0955	2025-01-10 05:20:14.31703+00
104	order	0015_auto_20170206_0407	2025-01-10 05:20:14.653295+00
105	order	0016_order_language_code	2025-01-10 05:20:14.672883+00
106	order	0017_auto_20170906_0556	2025-01-10 05:20:14.688092+00
107	order	0018_auto_20170919_0839	2025-01-10 05:20:14.704182+00
108	order	0019_auto_20171109_1423	2025-01-10 05:20:14.93634+00
109	order	0020_auto_20171123_0609	2025-01-10 05:20:14.975389+00
110	order	0021_auto_20171129_1004	2025-01-10 05:20:15.03041+00
111	order	0022_auto_20171205_0428	2025-01-10 05:20:15.05519+00
112	order	0023_auto_20171206_0506	2025-01-10 05:20:15.089429+00
113	order	0024_remove_order_status	2025-01-10 05:20:15.104485+00
114	order	0025_auto_20171214_1015	2025-01-10 05:20:15.128684+00
115	order	0026_auto_20171218_0428	2025-01-10 05:20:15.16751+00
116	order	0027_auto_20180108_0814	2025-01-10 05:20:15.723203+00
117	order	0028_status_fsm	2025-01-10 05:20:15.740034+00
118	order	0029_auto_20180111_0845	2025-01-10 05:20:15.7752+00
119	order	0030_auto_20180118_0605	2025-01-10 05:20:15.814879+00
120	order	0031_auto_20180119_0405	2025-01-10 05:20:15.86826+00
121	order	0032_orderline_is_shipping_required	2025-01-10 05:20:15.904209+00
122	order	0033_auto_20180123_0832	2025-01-10 05:20:15.917138+00
123	order	0034_auto_20180221_1056	2025-01-10 05:20:15.950422+00
124	order	0035_auto_20180221_1057	2025-01-10 05:20:15.976192+00
125	order	0036_remove_order_total_tax	2025-01-10 05:20:15.991146+00
126	order	0037_auto_20180228_0450	2025-01-10 05:20:16.056646+00
127	order	0038_auto_20180228_0451	2025-01-10 05:20:16.082578+00
128	order	0039_auto_20180312_1203	2025-01-10 05:20:16.108128+00
129	order	0040_auto_20180210_0422	2025-01-10 05:20:16.250147+00
130	order	0041_auto_20180222_0458	2025-01-10 05:20:16.289397+00
131	order	0042_auto_20180227_0436	2025-01-10 05:20:16.515658+00
132	order	0043_auto_20180322_0655	2025-01-10 05:20:16.545926+00
133	order	0044_auto_20180326_1055	2025-01-10 05:20:16.654332+00
134	order	0045_auto_20180329_0142	2025-01-10 05:20:16.778205+00
135	order	0046_order_line_taxes	2025-01-10 05:20:16.811023+00
136	order	0047_order_line_name_length	2025-01-10 05:20:16.824806+00
137	order	0048_auto_20180629_1055	2025-01-10 05:20:16.864146+00
138	order	0049_auto_20180719_0520	2025-01-10 05:20:16.88075+00
139	order	0050_auto_20180803_0528	2025-01-10 05:20:16.912378+00
140	order	0050_auto_20180803_0337	2025-01-10 05:20:16.939531+00
141	order	0051_merge_20180807_0704	2025-01-10 05:20:16.942583+00
142	order	0052_auto_20180822_0720	2025-01-10 05:20:16.983295+00
143	order	0053_orderevent	2025-01-10 05:20:17.009967+00
144	order	0054_move_data_to_order_events	2025-01-10 05:20:17.066038+00
145	order	0055_remove_order_note_order_history_entry	2025-01-10 05:20:17.161123+00
146	order	0056_auto_20180911_1541	2025-01-10 05:20:17.177652+00
147	order	0057_orderevent_parameters_new	2025-01-10 05:20:17.21311+00
148	order	0058_remove_orderevent_parameters	2025-01-10 05:20:17.226824+00
149	order	0059_auto_20180913_0841	2025-01-10 05:20:17.246551+00
150	order	0060_auto_20180919_0731	2025-01-10 05:20:17.26116+00
151	order	0061_auto_20180920_0859	2025-01-10 05:20:17.275293+00
152	order	0062_auto_20180921_0949	2025-01-10 05:20:17.453742+00
153	order	0063_auto_20180926_0446	2025-01-10 05:20:17.470157+00
154	order	0064_auto_20181016_0819	2025-01-10 05:20:17.497273+00
155	cart	0001_initial	2025-01-10 05:20:17.560902+00
156	cart	0002_auto_20161014_1221	2025-01-10 05:20:17.614138+00
157	cart	fix_empty_data_in_lines	2025-01-10 05:20:17.64012+00
158	cart	0001_auto_20170113_0435	2025-01-10 05:20:17.689973+00
159	cart	0002_auto_20170206_0407	2025-01-10 05:20:17.803999+00
160	cart	0003_auto_20170906_0556	2025-01-10 05:20:17.821003+00
161	cart	0004_auto_20171129_1004	2025-01-10 05:20:17.844281+00
162	cart	0005_auto_20180108_0814	2025-01-10 05:20:18.044886+00
163	cart	0006_auto_20180221_0825	2025-01-10 05:20:18.059831+00
164	userprofile	0002_auto_20150907_0602	2025-01-10 05:20:18.093125+00
165	userprofile	0003_auto_20151104_1102	2025-01-10 05:20:18.111007+00
166	userprofile	0004_auto_20160114_0419	2025-01-10 05:20:18.122488+00
167	userprofile	0005_auto_20160205_0651	2025-01-10 05:20:18.140323+00
168	userprofile	0006_auto_20160829_0819	2025-01-10 05:20:18.163863+00
169	userprofile	0007_auto_20161115_0940	2025-01-10 05:20:18.182137+00
170	userprofile	0008_auto_20161115_1011	2025-01-10 05:20:18.195129+00
171	userprofile	0009_auto_20170206_0407	2025-01-10 05:20:18.254191+00
172	userprofile	0010_auto_20170919_0839	2025-01-10 05:20:18.267339+00
173	userprofile	0011_auto_20171110_0552	2025-01-10 05:20:18.279946+00
174	userprofile	0012_auto_20171117_0846	2025-01-10 05:20:18.292844+00
175	userprofile	0013_auto_20171120_0521	2025-01-10 05:20:18.328763+00
176	userprofile	0014_auto_20171129_1004	2025-01-10 05:20:18.347672+00
177	userprofile	0015_auto_20171213_0734	2025-01-10 05:20:18.358052+00
178	userprofile	0016_auto_20180108_0814	2025-01-10 05:20:18.70693+00
179	account	0017_auto_20180206_0957	2025-01-10 05:20:18.732252+00
180	account	0018_auto_20180426_0641	2025-01-10 05:20:18.794237+00
181	account	0019_auto_20180528_1205	2025-01-10 05:20:18.834688+00
182	checkout	0007_merge_cart_with_checkout	2025-01-10 05:20:19.063078+00
183	checkout	0008_rename_tables	2025-01-10 05:20:19.106784+00
184	checkout	0009_cart_translated_discount_name	2025-01-10 05:20:19.119934+00
185	checkout	0010_auto_20180822_0720	2025-01-10 05:20:19.154106+00
186	checkout	0011_auto_20180913_0817	2025-01-10 05:20:19.213232+00
187	checkout	0012_remove_cartline_data	2025-01-10 05:20:19.229591+00
188	checkout	0013_auto_20180913_0841	2025-01-10 05:20:19.260875+00
189	checkout	0014_auto_20180921_0751	2025-01-10 05:20:19.276144+00
190	checkout	0015_auto_20181017_1346	2025-01-10 05:20:19.289273+00
191	payment	0001_initial	2025-01-10 05:20:19.348957+00
192	payment	0002_transfer_payment_to_payment_method	2025-01-10 05:20:19.390702+00
193	order	0065_auto_20181017_1346	2025-01-10 05:20:19.647351+00
194	order	0066_auto_20181023_0319	2025-01-10 05:20:19.680961+00
195	order	0067_auto_20181102_1054	2025-01-10 05:20:19.696569+00
196	order	0068_order_checkout_token	2025-01-10 05:20:19.715666+00
197	order	0069_auto_20190225_2305	2025-01-10 05:20:19.725994+00
198	order	0070_drop_update_event_and_rename_events	2025-01-10 05:20:19.800785+00
199	account	0020_user_token	2025-01-10 05:20:19.816859+00
200	account	0021_unique_token	2025-01-10 05:20:19.858298+00
201	account	0022_auto_20180718_0956	2025-01-10 05:20:19.870166+00
202	account	0023_auto_20180719_0520	2025-01-10 05:20:19.882536+00
203	account	0024_auto_20181011_0737	2025-01-10 05:20:19.908563+00
204	account	0025_auto_20190314_0550	2025-01-10 05:20:19.918715+00
205	account	0026_user_avatar	2025-01-10 05:20:19.931923+00
206	account	0027_customerevent	2025-01-10 05:20:19.959909+00
207	account	0028_user_private_meta	2025-01-10 05:20:19.984355+00
208	account	0029_user_meta	2025-01-10 05:20:19.998144+00
209	account	0030_auto_20190719_0733	2025-01-10 05:20:20.011337+00
210	account	0031_auto_20190719_0745	2025-01-10 05:20:20.026715+00
211	account	0032_remove_user_token	2025-01-10 05:20:20.041709+00
212	account	0033_serviceaccount	2025-01-10 05:20:20.076464+00
213	account	0034_service_account_token	2025-01-10 05:20:20.161748+00
214	giftcard	0001_initial	2025-01-10 05:20:20.195377+00
215	shipping	0009_auto_20180629_1055	2025-01-10 05:20:20.210974+00
216	shipping	0010_auto_20180719_0520	2025-01-10 05:20:20.220844+00
217	shipping	0011_auto_20180802_1238	2025-01-10 05:20:20.229409+00
218	shipping	0012_remove_legacy_shipping_methods	2025-01-10 05:20:20.2621+00
219	shipping	0013_auto_20180822_0721	2025-01-10 05:20:20.405822+00
220	shipping	0014_auto_20180920_0956	2025-01-10 05:20:20.428581+00
221	shipping	0015_auto_20190305_0640	2025-01-10 05:20:20.436956+00
222	sites	0001_initial	2025-01-10 05:20:20.447507+00
223	sites	0002_alter_domain_unique	2025-01-10 05:20:20.459042+00
224	site	0001_initial	2025-01-10 05:20:20.471772+00
225	site	0002_add_default_data	2025-01-10 05:20:20.511726+00
226	site	0003_sitesettings_description	2025-01-10 05:20:20.522951+00
227	site	0004_auto_20170221_0426	2025-01-10 05:20:20.544675+00
228	site	0005_auto_20170906_0556	2025-01-10 05:20:20.555107+00
229	site	0006_auto_20171025_0454	2025-01-10 05:20:20.565291+00
230	site	0007_auto_20171027_0856	2025-01-10 05:20:20.605397+00
231	site	0008_auto_20171027_0856	2025-01-10 05:20:20.630185+00
232	site	0009_auto_20171109_0849	2025-01-10 05:20:20.637937+00
233	site	0010_auto_20171113_0958	2025-01-10 05:20:20.645269+00
234	site	0011_auto_20180108_0814	2025-01-10 05:20:20.667313+00
235	page	0001_initial	2025-01-10 05:20:20.683571+00
236	menu	0001_initial	2025-01-10 05:20:20.89352+00
237	menu	0002_auto_20180319_0412	2025-01-10 05:20:20.985136+00
238	site	0012_auto_20180405_0757	2025-01-10 05:20:21.041082+00
239	menu	0003_auto_20180405_0854	2025-01-10 05:20:21.102231+00
240	site	0013_assign_default_menus	2025-01-10 05:20:21.142446+00
241	site	0014_handle_taxes	2025-01-10 05:20:21.163846+00
242	site	0015_sitesettings_handle_stock_by_default	2025-01-10 05:20:21.172602+00
243	site	0016_auto_20180719_0520	2025-01-10 05:20:21.18221+00
244	site	0017_auto_20180803_0528	2025-01-10 05:20:21.229847+00
245	product	0055_auto_20180321_0417	2025-01-10 05:20:21.286625+00
246	product	0056_auto_20180330_0321	2025-01-10 05:20:21.312844+00
247	product	0057_auto_20180403_0852	2025-01-10 05:20:21.327288+00
248	product	0058_auto_20180329_0142	2025-01-10 05:20:21.437788+00
249	product	0059_generate_variant_name_from_attrs	2025-01-10 05:20:21.478232+00
250	product	0060_collection_is_published	2025-01-10 05:20:21.493695+00
251	product	0061_product_taxes	2025-01-10 05:20:21.526461+00
252	product	0062_sortable_models	2025-01-10 05:20:21.612163+00
253	product	0063_required_attr_value_order	2025-01-10 05:20:21.624628+00
254	product	0064_productvariant_handle_stock	2025-01-10 05:20:21.635528+00
255	product	0065_auto_20180719_0520	2025-01-10 05:20:21.650816+00
256	product	0066_auto_20180803_0528	2025-01-10 05:20:21.806915+00
257	site	0018_sitesettings_homepage_collection	2025-01-10 05:20:22.05688+00
258	product	0067_remove_product_is_featured	2025-01-10 05:20:22.079946+00
259	product	0068_auto_20180822_0720	2025-01-10 05:20:22.109172+00
260	product	0069_auto_20180912_0326	2025-01-10 05:20:22.118413+00
261	product	0070_auto_20180912_0329	2025-01-10 05:20:22.13795+00
262	product	0071_attributechoicevalue_value	2025-01-10 05:20:22.148981+00
263	product	0072_auto_20180925_1048	2025-01-10 05:20:22.399155+00
264	product	0073_auto_20181010_0729	2025-01-10 05:20:22.44453+00
265	product	0074_auto_20181010_0730	2025-01-10 05:20:22.569181+00
266	product	0075_auto_20181010_0842	2025-01-10 05:20:22.613629+00
267	product	0076_auto_20181012_1146	2025-01-10 05:20:22.623893+00
268	product	0077_generate_versatile_background_images	2025-01-10 05:20:22.627339+00
269	product	0078_auto_20181120_0437	2025-01-10 05:20:22.649154+00
270	product	0079_default_tax_rate_instead_of_empty_field	2025-01-10 05:20:22.69175+00
271	product	0080_collection_published_date	2025-01-10 05:20:22.705192+00
272	product	0080_auto_20181214_0440	2025-01-10 05:20:22.724496+00
273	product	0081_merge_20181215_1659	2025-01-10 05:20:22.728043+00
274	product	0081_auto_20181218_0024	2025-01-10 05:20:22.739349+00
275	product	0082_merge_20181219_1440	2025-01-10 05:20:22.742867+00
276	product	0083_auto_20190104_0443	2025-01-10 05:20:22.759725+00
277	product	0084_auto_20190122_0113	2025-01-10 05:20:22.77699+00
278	product	0085_auto_20190125_0025	2025-01-10 05:20:22.784452+00
279	product	0086_product_publication_date	2025-01-10 05:20:22.798378+00
280	product	0087_auto_20190208_0326	2025-01-10 05:20:22.812756+00
281	product	0088_auto_20190220_1928	2025-01-10 05:20:22.823774+00
282	product	0089_auto_20190225_0252	2025-01-10 05:20:22.888486+00
283	product	0090_auto_20190328_0608	2025-01-10 05:20:22.904832+00
284	product	0091_auto_20190402_0853	2025-01-10 05:20:22.969906+00
285	payment	0003_rename_payment_method_to_payment	2025-01-10 05:20:23.292565+00
286	payment	0004_auto_20181206_0031	2025-01-10 05:20:23.312593+00
287	payment	0005_auto_20190104_0443	2025-01-10 05:20:23.330917+00
288	payment	0006_auto_20190109_0358	2025-01-10 05:20:23.342328+00
289	payment	0007_auto_20190206_0938	2025-01-10 05:20:23.353469+00
290	payment	0007_auto_20190125_0242	2025-01-10 05:20:23.370767+00
291	payment	0008_merge_20190214_0447	2025-01-10 05:20:23.374036+00
292	payment	0009_convert_to_partially_charged_and_partially_refunded	2025-01-10 05:20:23.415427+00
293	payment	0010_auto_20190220_2001	2025-01-10 05:20:23.432938+00
294	checkout	0016_auto_20190112_0506	2025-01-10 05:20:23.45044+00
295	checkout	0017_auto_20190130_0207	2025-01-10 05:20:23.467697+00
296	checkout	0018_auto_20190410_0132	2025-01-10 05:20:23.715974+00
297	checkout	0019_checkout_gift_cards	2025-01-10 05:20:23.760004+00
298	checkout	0020_auto_20190723_0722	2025-01-10 05:20:23.810864+00
299	checkout	0021_django_price_2	2025-01-10 05:20:23.832469+00
300	checkout	0022_auto_20241218_1654	2025-01-10 05:20:23.87055+00
301	discount	0004_auto_20170206_0407	2025-01-10 05:20:24.212208+00
302	discount	0005_auto_20170919_0839	2025-01-10 05:20:24.238764+00
303	discount	0006_auto_20171129_1004	2025-01-10 05:20:24.263549+00
304	discount	0007_auto_20180108_0814	2025-01-10 05:20:24.501561+00
305	discount	0008_sale_collections	2025-01-10 05:20:24.525945+00
306	discount	0009_auto_20180719_0520	2025-01-10 05:20:24.561496+00
307	discount	0010_auto_20180724_1251	2025-01-10 05:20:24.754403+00
308	discount	0011_auto_20180803_0528	2025-01-10 05:20:24.821797+00
309	discount	0012_auto_20190329_0836	2025-01-10 05:20:24.868442+00
310	discount	0013_auto_20190618_0733	2025-01-10 05:20:24.952663+00
311	discount	0014_auto_20190701_0402	2025-01-10 05:20:25.013633+00
312	discount	0015_voucher_min_quantity_of_products	2025-01-10 05:20:25.030909+00
313	discount	0016_auto_20190716_0330	2025-01-10 05:20:25.067641+00
314	discount	0017_django_price_2	2025-01-10 05:20:25.107142+00
315	discount	0018_auto_20190827_0315	2025-01-10 05:20:25.339476+00
316	discount	0019_auto_20241218_1654	2025-01-10 05:20:25.41723+00
317	django_prices_openexchangerates	0001_initial	2025-01-10 05:20:25.433294+00
318	django_prices_openexchangerates	0002_auto_20160329_0702	2025-01-10 05:20:25.452974+00
319	django_prices_openexchangerates	0003_auto_20161018_0707	2025-01-10 05:20:25.474374+00
320	django_prices_openexchangerates	0004_auto_20170316_0944	2025-01-10 05:20:25.482053+00
321	django_prices_vatlayer	0001_initial	2025-01-10 05:20:25.500084+00
322	django_prices_vatlayer	0002_ratetypes	2025-01-10 05:20:25.517819+00
323	django_prices_vatlayer	0003_auto_20180316_1053	2025-01-10 05:20:25.532444+00
324	extensions	0001_initial	2025-01-10 05:20:25.547632+00
325	giftcard	0002_auto_20190814_0413	2025-01-10 05:20:25.650715+00
326	giftcard	0003_auto_20241218_1654	2025-01-10 05:20:25.702287+00
327	impersonate	0001_initial	2025-01-10 05:20:25.744055+00
328	menu	0004_sort_order_index	2025-01-10 05:20:25.772076+00
329	menu	0005_auto_20180719_0520	2025-01-10 05:20:25.780406+00
330	menu	0006_auto_20180803_0528	2025-01-10 05:20:25.828773+00
331	menu	0007_auto_20180807_0547	2025-01-10 05:20:25.891444+00
332	menu	0008_menu_json_content_new	2025-01-10 05:20:25.944051+00
333	menu	0009_remove_menu_json_content	2025-01-10 05:20:25.952266+00
334	menu	0010_auto_20180913_0841	2025-01-10 05:20:25.969867+00
335	menu	0011_auto_20181204_0004	2025-01-10 05:20:25.978996+00
336	menu	0012_auto_20190104_0443	2025-01-10 05:20:25.98839+00
337	menu	0013_auto_20190507_0309	2025-01-10 05:20:26.054132+00
338	menu	0014_auto_20190523_0759	2025-01-10 05:20:26.072911+00
339	menu	0015_auto_20190725_0811	2025-01-10 05:20:26.095878+00
340	order	0071_order_gift_cards	2025-01-10 05:20:26.139293+00
341	order	0072_django_price_2	2025-01-10 05:20:26.556378+00
342	order	0073_auto_20190829_0249	2025-01-10 05:20:26.644486+00
343	order	0074_auto_20190930_0731	2025-01-10 05:20:26.692093+00
344	order	0075_auto_20191006_1433	2025-01-10 05:20:26.717202+00
345	order	0076_auto_20191018_0554	2025-01-10 05:20:26.760695+00
346	order	0077_auto_20191118_0606	2025-01-10 05:20:26.808497+00
347	order	0078_auto_20241218_1654	2025-01-10 05:20:27.122757+00
348	page	0002_auto_20180321_0417	2025-01-10 05:20:27.149025+00
349	page	0003_auto_20180719_0520	2025-01-10 05:20:27.157902+00
350	page	0004_auto_20180803_0528	2025-01-10 05:20:27.207777+00
351	page	0005_auto_20190208_0456	2025-01-10 05:20:27.436291+00
352	page	0006_auto_20190220_1928	2025-01-10 05:20:27.448904+00
353	page	0007_auto_20190225_0252	2025-01-10 05:20:27.47751+00
354	page	0008_raw_html_to_json	2025-01-10 05:20:27.583723+00
355	page	0009_auto_20191108_0402	2025-01-10 05:20:27.592738+00
356	payment	0011_auto_20190516_0901	2025-01-10 05:20:27.604573+00
357	payment	0012_transaction_customer_id	2025-01-10 05:20:27.618074+00
358	payment	0013_auto_20190813_0735	2025-01-10 05:20:27.631807+00
359	payment	0014_django_price_2	2025-01-10 05:20:27.684794+00
360	payment	0015_auto_20241218_1654	2025-01-10 05:20:27.774102+00
361	product	0092_auto_20190507_0309	2025-01-10 05:20:27.822584+00
362	product	0093_auto_20190521_0124	2025-01-10 05:20:27.909509+00
363	product	0094_auto_20190618_0430	2025-01-10 05:20:27.938532+00
364	product	0095_auto_20190618_0842	2025-01-10 05:20:28.003736+00
365	product	0096_auto_20190719_0339	2025-01-10 05:20:28.019619+00
366	product	0097_auto_20190719_0458	2025-01-10 05:20:28.044275+00
367	product	0098_auto_20190719_0733	2025-01-10 05:20:28.066371+00
368	product	0099_auto_20190719_0745	2025-01-10 05:20:28.08528+00
369	product	0096_raw_html_to_json	2025-01-10 05:20:28.199059+00
370	product	0100_merge_20190719_0803	2025-01-10 05:20:28.206327+00
371	product	0101_auto_20190719_0839	2025-01-10 05:20:28.310663+00
372	product	0102_migrate_data_enterprise_grade_attributes	2025-01-10 05:20:28.725801+00
373	product	0103_schema_data_enterprise_grade_attributes	2025-01-10 05:20:29.155061+00
374	product	0104_fix_invalid_attributes_map	2025-01-10 05:20:29.280726+00
375	product	0105_product_minimal_variant_price	2025-01-10 05:20:29.355467+00
376	product	0106_django_prices_2	2025-01-10 05:20:29.423694+00
377	product	0107_attributes_map_to_m2m	2025-01-10 05:20:29.865998+00
378	product	0108_auto_20191003_0422	2025-01-10 05:20:30.002296+00
379	product	0109_auto_20191006_1433	2025-01-10 05:20:30.022342+00
380	product	0110_auto_20191108_0340	2025-01-10 05:20:30.075515+00
381	product	0111_auto_20241218_1654	2025-01-10 05:20:30.183308+00
382	sessions	0001_initial	2025-01-10 05:20:30.196874+00
383	shipping	0016_shippingmethod_meta	2025-01-10 05:20:30.228171+00
384	shipping	0017_django_price_2	2025-01-10 05:20:30.324192+00
385	shipping	0018_auto_20241218_1654	2025-01-10 05:20:30.382564+00
386	site	0019_sitesettings_default_weight_unit	2025-01-10 05:20:30.402265+00
387	site	0020_auto_20190301_0336	2025-01-10 05:20:30.417341+00
388	site	0021_auto_20190326_0521	2025-01-10 05:20:30.459686+00
389	site	0022_sitesettings_company_address	2025-01-10 05:20:30.493553+00
390	site	0023_auto_20191007_0835	2025-01-10 05:20:30.542922+00
391	site	0024_sitesettings_customer_set_password_url	2025-01-10 05:20:30.567132+00
392	site	0025_auto_20191024_0552	2025-01-10 05:20:30.608781+00
393	default	0001_initial	2025-01-10 05:20:30.706176+00
394	social_auth	0001_initial	2025-01-10 05:20:30.708453+00
395	default	0002_add_related_name	2025-01-10 05:20:30.759663+00
396	social_auth	0002_add_related_name	2025-01-10 05:20:30.76141+00
397	default	0003_alter_email_max_length	2025-01-10 05:20:30.770754+00
398	social_auth	0003_alter_email_max_length	2025-01-10 05:20:30.772394+00
399	default	0004_auto_20160423_0400	2025-01-10 05:20:30.791102+00
400	social_auth	0004_auto_20160423_0400	2025-01-10 05:20:30.79283+00
401	social_auth	0005_auto_20160727_2333	2025-01-10 05:20:30.804459+00
402	social_django	0006_partial	2025-01-10 05:20:30.818455+00
403	social_django	0007_code_timestamp	2025-01-10 05:20:30.832437+00
404	social_django	0008_partial_timestamp	2025-01-10 05:20:30.851085+00
405	webhook	0001_initial	2025-01-10 05:20:30.948861+00
406	webhook	0002_webhook_name	2025-01-10 05:20:30.976986+00
407	account	0010_auto_20170919_0839	2025-01-10 05:20:30.983489+00
408	account	0008_auto_20161115_1011	2025-01-10 05:20:30.986728+00
409	account	0009_auto_20170206_0407	2025-01-10 05:20:30.989869+00
410	account	0006_auto_20160829_0819	2025-01-10 05:20:30.992002+00
411	account	0013_auto_20171120_0521	2025-01-10 05:20:30.994682+00
412	account	0001_initial	2025-01-10 05:20:30.997474+00
413	account	0014_auto_20171129_1004	2025-01-10 05:20:31.000637+00
414	account	0004_auto_20160114_0419	2025-01-10 05:20:31.004629+00
415	account	0003_auto_20151104_1102	2025-01-10 05:20:31.008239+00
416	account	0005_auto_20160205_0651	2025-01-10 05:20:31.011355+00
417	account	0002_auto_20150907_0602	2025-01-10 05:20:31.014474+00
418	account	0015_auto_20171213_0734	2025-01-10 05:20:31.017336+00
419	account	0007_auto_20161115_0940	2025-01-10 05:20:31.020596+00
420	account	0011_auto_20171110_0552	2025-01-10 05:20:31.023345+00
421	account	0012_auto_20171117_0846	2025-01-10 05:20:31.02606+00
422	account	0016_auto_20180108_0814	2025-01-10 05:20:31.02934+00
423	checkout	fix_empty_data_in_lines	2025-01-10 05:20:31.032862+00
424	checkout	0002_auto_20161014_1221	2025-01-10 05:20:31.035537+00
425	checkout	0005_auto_20180108_0814	2025-01-10 05:20:31.038176+00
426	checkout	0006_auto_20180221_0825	2025-01-10 05:20:31.04085+00
427	checkout	0002_auto_20170206_0407	2025-01-10 05:20:31.043794+00
428	checkout	0001_initial	2025-01-10 05:20:31.047476+00
429	checkout	0001_auto_20170113_0435	2025-01-10 05:20:31.05128+00
430	checkout	0003_auto_20170906_0556	2025-01-10 05:20:31.054711+00
431	checkout	0004_auto_20171129_1004	2025-01-10 05:20:31.057541+00
432	social_django	0001_initial	2025-01-10 05:20:31.060466+00
433	social_django	0005_auto_20160727_2333	2025-01-10 05:20:31.063478+00
434	social_django	0003_alter_email_max_length	2025-01-10 05:20:31.066903+00
435	social_django	0002_add_related_name	2025-01-10 05:20:31.069815+00
436	social_django	0004_auto_20160423_0400	2025-01-10 05:20:31.072772+00
437	keyboard_builder	0001_initial	2025-01-10 22:12:30.640108+00
438	product	0112_category_show_in_customize	2025-01-10 22:12:30.670479+00
\.


--
-- Data for Name: django_prices_openexchangerates_conversionrate; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.django_prices_openexchangerates_conversionrate (id, to_currency, rate, modified_at) FROM stdin;
\.


--
-- Data for Name: django_prices_vatlayer_ratetypes; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.django_prices_vatlayer_ratetypes (id, types) FROM stdin;
\.


--
-- Data for Name: django_prices_vatlayer_vat; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.django_prices_vatlayer_vat (id, country_code, data) FROM stdin;
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
vb95aq4oa27zh2x969hre9xw44xm2wqg	ZWNhOGVhYTQ5MTE5YjdiNTNhMjUwNTZlMGJjMTEwYjkwOWVhZmI3NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5NzRhZjU4YmIxMTA3YTljN2NlZWYzZmVmYzdlYzg5NThmMzZiYjIzIn0=	2025-01-24 07:49:04.723529+00
13x08t81sqb1r3q3m5mejaq93o8hxndl	YmE5NGQyZGM4OTIwMDhmMDBkZGYyMmJkODE1ZDkwYWIyMzgxYmVkYjp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJ3NWhLMllkdkZwS240MHV1amc1SU9hemhXSVlpR1Y0RCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MGQxYzY1YTQ5ZjY0YjdjMzM3ODM2YzMyY2UwZTYxMDk0OTkzYmY2In0=	2025-01-27 01:15:55.538253+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.django_site (id, domain, name) FROM stdin;
1	localhost:8000	Saleor e-commerce
\.


--
-- Data for Name: extensions_pluginconfiguration; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.extensions_pluginconfiguration (id, name, description, active, configuration) FROM stdin;
1	Avalara		f	[{"name": "Username or account", "value": null}, {"name": "Password or license", "value": null}, {"name": "Use sandbox", "value": true}, {"name": "Company name", "value": "DEFAULT"}, {"name": "Autocommit", "value": false}]
2	Vatlayer		f	\N
3	Webhooks		t	\N
5	Stripe		f	[{"name": "Public API key", "value": null}, {"name": "Secret API key", "value": null}, {"name": "Store customers card", "value": false}, {"name": "Automatic payment capture", "value": true}]
7	Razorpay		f	[{"name": "Template path", "value": "order/payment/razorpay.html"}, {"name": "Public API key", "value": null}, {"name": "Secret API key", "value": null}, {"name": "Store customers card", "value": false}, {"name": "Automatic payment capture", "value": true}]
6	Braintree		f	[{"name": "Template path", "value": "order/payment/braintree.html"}, {"name": "Public API key", "value": "fpm2d93dybzbqwtq"}, {"name": "Secret API key", "value": "aa2a4e74b78486c9280a0e80adb507a4"}, {"name": "Use sandbox", "value": true}, {"name": "Merchant ID", "value": "5g6rnxtzbq7c5g85"}, {"name": "Store customers card", "value": true}, {"name": "Automatic payment capture", "value": true}, {"name": "Require 3D secure", "value": true}]
4	Dummy		t	[{"name": "Store customers card", "value": true}, {"name": "Automatic payment capture", "value": true}, {"name": "Template path", "value": "order/payment/dummy.html"}]
\.


--
-- Data for Name: giftcard_giftcard; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.giftcard_giftcard (id, code, created, start_date, end_date, last_used_on, is_active, initial_balance_amount, current_balance_amount, user_id, currency) FROM stdin;
\.


--
-- Data for Name: impersonate_impersonationlog; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.impersonate_impersonationlog (id, session_key, session_started_at, session_ended_at, impersonating_id, impersonator_id) FROM stdin;
\.


--
-- Data for Name: keyboard_builder_product; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.keyboard_builder_product (id, name, price, image, category) FROM stdin;
\.


--
-- Data for Name: menu_menu; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.menu_menu (id, name, json_content) FROM stdin;
1	navbar	[{"url": "/vi/products/category/keycaps-1/", "name": "KeyCaps", "child_items": [{"url": "/vi/products/category/xda-2/", "name": "XDA", "child_items": [], "translations": {}}, {"url": "/vi/products/category/dda-5/", "name": "DDA", "child_items": [], "translations": {}}, {"url": "/vi/products/category/cherry-3/", "name": "Cherry", "child_items": [], "translations": {}}], "translations": {}}, {"url": "/vi/products/category/switchs-10/", "name": "Switchs", "child_items": [{"url": "/vi/products/category/switch-linear-11/", "name": "linear", "child_items": [], "translations": {}}, {"url": "/vi/products/category/switch-tactile-12/", "name": "tactile", "child_items": [], "translations": {}}, {"url": "/vi/products/category/switch-clicky-13/", "name": "clicky", "child_items": [], "translations": {}}], "translations": {}}, {"url": "/vi/products/category/kits-6/", "name": "Kits", "child_items": [{"url": "/vi/products/category/layout-60-65-7/", "name": "Layout 60-65%", "child_items": [], "translations": {}}, {"url": "/vi/products/category/layout-75-8/", "name": "Layout 75%", "child_items": [], "translations": {}}, {"url": "/vi/products/category/layout-fullsize-9/", "name": "FullSize", "child_items": [], "translations": {}}], "translations": {}}, {"url": "/vi/products/category/keyboard-14/", "name": "KeyBoards", "child_items": [], "translations": {}}]
\.


--
-- Data for Name: menu_menuitem; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.menu_menuitem (id, name, sort_order, url, lft, rght, tree_id, level, category_id, collection_id, menu_id, page_id, parent_id) FROM stdin;
2	XDA	0	\N	2	3	1	1	2	\N	1	\N	1
3	DDA	1	\N	4	5	1	1	5	\N	1	\N	1
4	Cherry	2	\N	6	7	1	1	3	\N	1	\N	1
1	KeyCaps	0	\N	1	8	1	0	1	\N	1	\N	\N
6	linear	0	\N	2	3	2	1	11	\N	1	\N	5
7	tactile	1	\N	4	5	2	1	12	\N	1	\N	5
5	Switchs	3	\N	1	8	2	0	10	\N	1	\N	\N
8	clicky	2	\N	6	7	2	1	13	\N	1	\N	5
10	Layout 60-65%	0	\N	2	3	3	1	7	\N	1	\N	9
11	Layout 75%	1	\N	4	5	3	1	8	\N	1	\N	9
9	Kits	4	\N	1	8	3	0	6	\N	1	\N	\N
12	FullSize	2	\N	6	7	3	1	9	\N	1	\N	9
13	KeyBoards	5	\N	1	2	4	0	14	\N	1	\N	\N
\.


--
-- Data for Name: menu_menuitemtranslation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.menu_menuitemtranslation (id, language_code, name, menu_item_id) FROM stdin;
\.


--
-- Data for Name: order_fulfillment; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.order_fulfillment (id, tracking_number, created, order_id, fulfillment_order, status, meta, private_meta) FROM stdin;
1		2025-01-12 09:25:24.904493+00	5	1	fulfilled	{}	{}
2		2025-01-12 09:25:45.829563+00	4	1	fulfilled	{}	{}
3		2025-01-12 09:32:01.304969+00	6	1	canceled	{}	{}
4		2025-01-12 10:13:54.455859+00	6	2	fulfilled	{}	{}
5		2025-01-12 10:54:12.666529+00	13	1	fulfilled	{}	{}
6		2025-01-12 10:54:59.194472+00	12	1	fulfilled	{}	{}
7		2025-01-12 11:06:21.126497+00	18	1	fulfilled	{}	{}
\.


--
-- Data for Name: order_fulfillmentline; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.order_fulfillmentline (id, order_line_id, quantity, fulfillment_id) FROM stdin;
1	5	1	1
2	4	1	2
3	6	3	3
4	6	3	4
5	14	1	5
6	13	1	6
7	19	1	7
\.


--
-- Data for Name: order_order; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.order_order (id, created, tracking_client_id, user_email, token, billing_address_id, shipping_address_id, user_id, total_net_amount, discount_amount, discount_name, voucher_id, language_code, shipping_price_gross_amount, total_gross_amount, shipping_price_net_amount, status, shipping_method_name, shipping_method_id, display_gross_prices, translated_discount_name, customer_note, weight, checkout_token, currency, meta, private_meta) FROM stdin;
1	2025-01-12 08:39:39.593395+00	696503bb-9120-5d15-963a-59b332a58365	admin@admin.com	622457d2-9730-4dcd-b1d6-b76c365bc341	2	1	2	2450000	600000	happy new year	1	vi	50000	2450000	50000	unfulfilled	GHTK	1	t			0	b08e8c70-2c5f-44f8-8d0e-c1b418f689b1	VND	{}	{}
2	2025-01-12 08:46:30.368528+00	696503bb-9120-5d15-963a-59b332a58365	admin@admin.com	a438e010-2eb5-41ea-ac59-041af58f3c0a	5	4	2	350000	0		\N	vi	50000	350000	50000	unfulfilled	GHTK	1	t			1000	a11c4e5a-b22f-4182-8241-bb2218c2d918	VND	{}	{}
3	2025-01-12 09:08:05.355489+00	696503bb-9120-5d15-963a-59b332a58365	admin@admin.com	3eb44809-8d3e-4696-9d09-633ba134c911	7	6	2	2940000	0		\N	vi	50000	2940000	50000	unfulfilled	GHTK	1	t			0	e0bd794d-6734-49dd-bc5a-c0148bb09568	VND	{}	{}
18	2025-01-12 11:05:49.016527+00	696503bb-9120-5d15-963a-59b332a58365	admin@admin.com	bb1ac2c0-2e61-4e29-8971-49a0b510b751	37	36	2	529999	0		\N	vi	50000	529999	50000	fulfilled	GHTK	1	t			0	c29da33c-d21f-49b0-8e77-2b8fe70b0aba	VND	{}	{}
19	2025-01-12 23:09:47.066948+00	696503bb-9120-5d15-963a-59b332a58365	abc@gmail.com	ae10ecbf-8302-4aab-91e5-763d1cfa557d	39	38	6	12049992	0		\N	vi	50000	12049992	50000	unfulfilled	GHTK	1	t			0	d38d4e63-6b75-43e5-a224-9ed33d667903	VND	{}	{}
5	2025-01-12 09:24:08.935161+00	696503bb-9120-5d15-963a-59b332a58365	admin@admin.com	a69c27c8-c4ac-4379-9b38-4940bb46bc93	11	10	2	550000	0		\N	vi	50000	550000	50000	fulfilled	GHTK	1	t			0	3c66c2b8-531a-471b-b2d9-792ac648a761	VND	{}	{}
4	2025-01-12 09:12:42.181155+00	696503bb-9120-5d15-963a-59b332a58365	admin@admin.com	3fee8ee6-085c-4c5f-8d7c-401ec4097110	9	8	2	2940000	0		\N	vi	50000	2940000	50000	fulfilled	GHTK	1	t			0	f0db6b4a-ef28-45c8-9023-be3efb62a387	VND	{}	{}
7	2025-01-12 09:30:09.932289+00	696503bb-9120-5d15-963a-59b332a58365	admin@admin.com	4fbb4f42-842d-4262-ba55-9009c4c9cb3d	15	14	2	5350000	0		\N	vi	50000	5350000	50000	unfulfilled	GHTK	1	t			0	07a3e68c-30ae-4765-be62-8e1318e681a6	VND	{}	{}
8	2025-01-12 09:30:52.066598+00	696503bb-9120-5d15-963a-59b332a58365	admin@admin.com	6a2a3b78-b644-4d77-a081-03584f2a2ff4	17	16	2	329999	0		\N	vi	50000	329999	50000	unfulfilled	GHTK	1	t			0	984432cb-510b-4e64-acfa-227dc08f2972	VND	{}	{}
20	2025-01-12 23:10:07.260225+00	696503bb-9120-5d15-963a-59b332a58365	abc@gmail.com	96bb9b34-d09c-4a99-8a83-92df5d7e73de	42	41	6	8720000	0		\N	vi	50000	8720000	50000	unfulfilled	GHTK	1	t			0	0a739280-f76d-483d-b41c-e4b31b6be9da	VND	{}	{}
6	2025-01-12 09:26:16.846211+00	696503bb-9120-5d15-963a-59b332a58365	admin@admin.com	b53220cd-4fca-4f94-a49a-8c12eecb4546	13	12	2	1550000	0		\N	vi	50000	1550000	50000	fulfilled	GHTK	1	t			0	f9733995-c43a-47b4-a2bb-693a5bb8a98f	VND	{}	{}
9	2025-01-12 10:14:52.360832+00	696503bb-9120-5d15-963a-59b332a58365	admin@admin.com	9408e031-a90e-4f55-bed5-b8723faff678	19	18	2	3050000	0		\N	vi	50000	3050000	50000	unfulfilled	GHTK	1	t			0	73435b43-5691-4507-b5ee-33526303479b	VND	{}	{}
10	2025-01-12 10:17:36.428422+00	696503bb-9120-5d15-963a-59b332a58365	admin@admin.com	6cfff8dd-c960-4a80-8dae-2f22f1911d61	21	20	2	2350000	0		\N	vi	50000	2350000	50000	unfulfilled	GHTK	1	t			0	426641cd-8be8-432c-8e88-aae3b4b85c4b	VND	{}	{}
11	2025-01-12 10:44:19.776692+00	696503bb-9120-5d15-963a-59b332a58365	admin@admin.com	17619666-f562-41b1-9cfd-fdcd296e5178	23	22	2	1549999	0		\N	vi	50000	1549999	50000	unfulfilled	GHTK	1	t			0	460ce328-b5c4-410d-8feb-b24c8505bd79	VND	{}	{}
13	2025-01-12 10:50:28.614346+00	696503bb-9120-5d15-963a-59b332a58365	admin@admin.com	47d06cc9-c3da-431d-b017-8fc544e9160a	27	26	2	3050000	0		\N	vi	50000	3050000	50000	fulfilled	GHTK	1	t			0	5672003c-53c0-457b-873a-a3624962f5bc	VND	{}	{}
12	2025-01-12 10:47:30.20375+00	696503bb-9120-5d15-963a-59b332a58365	admin@admin.com	6d89db08-6691-434d-a211-d34818a2f098	25	24	2	2940000	0		\N	vi	50000	2940000	50000	fulfilled	GHTK	1	t			0	820ac4c2-b453-42b4-9a60-674ef25adbe8	VND	{}	{}
14	2025-01-12 10:55:24.71736+00	696503bb-9120-5d15-963a-59b332a58365	admin@admin.com	7a240258-46a0-4cd7-9c49-dd5b758409c3	29	28	2	12050000	0		\N	vi	50000	12050000	50000	unfulfilled	GHTK	1	t			0	368fd927-08eb-4355-8659-019749e4603f	VND	{}	{}
15	2025-01-12 10:59:06.13528+00	696503bb-9120-5d15-963a-59b332a58365	admin@admin.com	5fe1d34a-cc8d-4231-8038-4ff76e11b27e	31	30	2	549999	0		\N	vi	50000	549999	50000	unfulfilled	GHTK	1	t			0	ca5925ba-afa1-4f4d-9438-9cdf82a78209	VND	{}	{}
16	2025-01-12 11:02:43.637987+00	696503bb-9120-5d15-963a-59b332a58365	admin@admin.com	b9d2029e-d9fe-4574-8596-1a67d3a4e82b	33	32	2	3050000	0		\N	vi	50000	3050000	50000	unfulfilled	GHTK	1	t			0	baf4e4bd-6b07-4919-9f6f-782f51b90814	VND	{}	{}
17	2025-01-12 11:04:43.202664+00	696503bb-9120-5d15-963a-59b332a58365	admin@admin.com	3dffc41e-0caa-4353-994e-686bd06f2e2a	35	34	2	550000	0		\N	vi	50000	550000	50000	unfulfilled	GHTK	1	t			0	6190d1e3-4628-47ba-b30d-10242db15a8e	VND	{}	{}
21	2025-01-12 23:21:13.386592+00	696503bb-9120-5d15-963a-59b332a58365	abc2101@gmail.com	629587ba-3c65-49fd-8a4a-4a40126fa1a5	44	43	\N	549999	0		\N	vi	50000	549999	50000	unfulfilled	GHTK	1	t			0	de64a70c-e71f-4bdb-8df4-6d1c12983626	VND	{}	{}
\.


--
-- Data for Name: order_order_gift_cards; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.order_order_gift_cards (id, order_id, giftcard_id) FROM stdin;
\.


--
-- Data for Name: order_orderevent; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.order_orderevent (id, date, type, order_id, user_id, parameters) FROM stdin;
1	2025-01-12 08:39:39.606243+00	placed	1	2	{}
2	2025-01-12 08:39:39.815345+00	email_sent	1	2	{"email": "admin@admin.com", "email_type": "order_confirmation"}
3	2025-01-12 08:46:30.377118+00	placed	2	2	{}
4	2025-01-12 08:46:30.57112+00	email_sent	2	2	{"email": "admin@admin.com", "email_type": "order_confirmation"}
5	2025-01-12 09:08:05.362028+00	placed	3	2	{}
6	2025-01-12 09:12:42.186664+00	placed	4	2	{}
7	2025-01-12 09:14:03.326803+00	order_fully_paid	4	\N	{}
8	2025-01-12 09:14:03.329625+00	email_sent	4	\N	{"email": "admin@admin.com", "email_type": "payment_confirmation"}
9	2025-01-12 09:14:12.873206+00	note_added	4	2	{"message": ""}
10	2025-01-12 09:14:15.17064+00	note_added	4	2	{"message": ""}
11	2025-01-12 09:14:48.146523+00	payment_failed	3	2	{"gateway": "Dummy", "message": "Cannot find successful auth transaction", "payment_id": ""}
12	2025-01-12 09:18:43.348915+00	payment_failed	3	2	{"gateway": "Dummy", "message": "Cannot find successful auth transaction", "payment_id": ""}
13	2025-01-12 09:21:01.23731+00	payment_refunded	4	2	{"amount": "2940000", "payment_id": "", "payment_gateway": "Dummy"}
14	2025-01-12 09:21:52.802883+00	order_fully_paid	4	\N	{}
15	2025-01-12 09:21:52.806755+00	email_sent	4	\N	{"email": "admin@admin.com", "email_type": "payment_confirmation"}
16	2025-01-12 09:24:08.942044+00	placed	5	2	{}
17	2025-01-12 09:24:13.686582+00	order_fully_paid	5	\N	{}
18	2025-01-12 09:24:13.68974+00	email_sent	5	\N	{"email": "admin@admin.com", "email_type": "payment_confirmation"}
19	2025-01-12 09:25:24.943949+00	fulfillment_fulfilled_items	5	2	{"fulfilled_items": [1]}
20	2025-01-12 09:25:24.965864+00	email_sent	5	2	{"email": "admin@admin.com", "email_type": "fulfillment_confirmation"}
21	2025-01-12 09:25:45.855995+00	fulfillment_fulfilled_items	4	2	{"fulfilled_items": [2]}
22	2025-01-12 09:25:45.878845+00	email_sent	4	2	{"email": "admin@admin.com", "email_type": "fulfillment_confirmation"}
23	2025-01-12 09:26:16.851664+00	placed	6	2	{}
24	2025-01-12 09:30:09.939419+00	placed	7	2	{}
25	2025-01-12 09:30:13.469265+00	order_fully_paid	7	\N	{}
26	2025-01-12 09:30:13.470874+00	email_sent	7	\N	{"email": "admin@admin.com", "email_type": "payment_confirmation"}
27	2025-01-12 09:30:52.072523+00	placed	8	2	{}
28	2025-01-12 09:32:01.321735+00	fulfillment_fulfilled_items	6	2	{"fulfilled_items": [3]}
29	2025-01-12 09:32:01.342044+00	email_sent	6	2	{"email": "admin@admin.com", "email_type": "fulfillment_confirmation"}
30	2025-01-12 09:32:36.622506+00	payment_failed	6	2	{"gateway": "Dummy", "message": "Cannot find successful auth transaction", "payment_id": ""}
31	2025-01-12 09:46:05.889169+00	payment_failed	6	2	{"gateway": "Dummy", "message": "Cannot find successful auth transaction", "payment_id": ""}
32	2025-01-12 09:46:07.081501+00	payment_failed	6	2	{"gateway": "Dummy", "message": "Cannot find successful auth transaction", "payment_id": ""}
33	2025-01-12 10:13:40.748919+00	payment_failed	6	2	{"gateway": "Dummy", "message": "Cannot find successful auth transaction", "payment_id": ""}
34	2025-01-12 10:13:50.007566+00	fulfillment_canceled	6	2	{"composed_id": "6-1"}
35	2025-01-12 10:13:50.010915+00	fulfillment_restocked_items	6	2	{"quantity": 3}
36	2025-01-12 10:13:54.50709+00	fulfillment_fulfilled_items	6	2	{"fulfilled_items": [4]}
37	2025-01-12 10:13:54.536114+00	email_sent	6	2	{"email": "admin@admin.com", "email_type": "fulfillment_confirmation"}
38	2025-01-12 10:14:52.368157+00	placed	9	2	{}
39	2025-01-12 10:14:52.441004+00	email_sent	9	2	{"email": "admin@admin.com", "email_type": "order_confirmation"}
40	2025-01-12 10:17:36.434765+00	placed	10	2	{}
41	2025-01-12 10:44:19.788915+00	placed	11	2	{}
42	2025-01-12 10:44:19.981767+00	email_sent	11	2	{"email": "admin@admin.com", "email_type": "order_confirmation"}
43	2025-01-12 10:47:30.209037+00	placed	12	2	{}
44	2025-01-12 10:50:28.620492+00	placed	13	2	{}
45	2025-01-12 10:54:12.688199+00	fulfillment_fulfilled_items	13	2	{"fulfilled_items": [5]}
46	2025-01-12 10:54:12.719334+00	email_sent	13	2	{"email": "admin@admin.com", "email_type": "fulfillment_confirmation"}
47	2025-01-12 10:54:23.22251+00	order_fully_paid	13	\N	{}
48	2025-01-12 10:54:23.223622+00	email_sent	13	\N	{"email": "admin@admin.com", "email_type": "payment_confirmation"}
49	2025-01-12 10:54:23.246668+00	payment_captured	13	2	{"amount": "3050000", "payment_id": "", "payment_gateway": "Dummy"}
50	2025-01-12 10:54:46.096847+00	payment_failed	12	2	{"gateway": "Braintree", "message": "Cannot find successful auth transaction", "payment_id": ""}
51	2025-01-12 10:54:59.213005+00	fulfillment_fulfilled_items	12	2	{"fulfilled_items": [6]}
52	2025-01-12 10:54:59.233884+00	email_sent	12	2	{"email": "admin@admin.com", "email_type": "fulfillment_confirmation"}
53	2025-01-12 10:55:01.578128+00	payment_failed	12	2	{"gateway": "Braintree", "message": "Cannot find successful auth transaction", "payment_id": ""}
54	2025-01-12 10:55:02.449188+00	payment_failed	12	2	{"gateway": "Braintree", "message": "Cannot find successful auth transaction", "payment_id": ""}
55	2025-01-12 10:55:24.724728+00	placed	14	2	{}
56	2025-01-12 10:55:30.5343+00	order_fully_paid	14	\N	{}
57	2025-01-12 10:55:30.535936+00	email_sent	14	\N	{"email": "admin@admin.com", "email_type": "payment_confirmation"}
58	2025-01-12 10:59:06.142943+00	placed	15	2	{}
59	2025-01-12 11:02:43.642432+00	placed	16	2	{}
60	2025-01-12 11:04:43.215375+00	placed	17	2	{}
61	2025-01-12 11:05:14.132799+00	order_fully_paid	17	\N	{}
62	2025-01-12 11:05:14.13587+00	email_sent	17	\N	{"email": "admin@admin.com", "email_type": "payment_confirmation"}
63	2025-01-12 11:05:49.024013+00	placed	18	2	{}
64	2025-01-12 11:06:02.266826+00	order_fully_paid	18	\N	{}
65	2025-01-12 11:06:02.268013+00	email_sent	18	\N	{"email": "admin@admin.com", "email_type": "payment_confirmation"}
66	2025-01-12 11:06:02.293059+00	payment_captured	18	2	{"amount": "529999", "payment_id": "", "payment_gateway": "Dummy"}
67	2025-01-12 11:06:21.146263+00	fulfillment_fulfilled_items	18	2	{"fulfilled_items": [7]}
68	2025-01-12 11:06:21.165849+00	email_sent	18	2	{"email": "admin@admin.com", "email_type": "fulfillment_confirmation"}
69	2025-01-12 23:09:47.07669+00	placed	19	6	{}
70	2025-01-12 23:10:07.269513+00	placed	20	6	{}
71	2025-01-12 23:10:13.340442+00	order_fully_paid	20	\N	{}
72	2025-01-12 23:10:13.344415+00	email_sent	20	\N	{"email": "abc@gmail.com", "email_type": "payment_confirmation"}
73	2025-01-12 23:10:20.604033+00	note_added	20	6	{"message": ""}
74	2025-01-12 23:21:13.394562+00	placed	21	\N	{}
75	2025-01-12 23:21:13.580803+00	email_sent	21	\N	{"email": "abc2101@gmail.com", "email_type": "order_confirmation"}
76	2025-01-12 23:21:20.513871+00	note_added	21	\N	{"message": ""}
\.


--
-- Data for Name: order_orderline; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.order_orderline (id, product_name, product_sku, quantity, unit_price_net_amount, unit_price_gross_amount, is_shipping_required, order_id, quantity_fulfilled, variant_id, tax_rate, translated_product_name, currency, translated_variant_name, variant_name) FROM stdin;
1	Switch clicky1	CLK001	1	3000000	3000000	t	1	0	2	0.00		VND		CLK001
2	Switch Liniear1	SW001	1	300000	300000	t	2	0	1	0.00		VND		SW001
3	Keydous NJ80 – AP 2022	kb00111	1	2890000	2890000	t	3	0	10	0.00		VND		kb00111
5	Cherry1	KC0001	1	500000	500000	t	5	1	4	0.00		VND		KC0001
4	Keydous NJ80 – AP 2022	kb00111	1	2890000	2890000	t	4	1	10	0.00		VND		kb00111
7	Bàn Phím Cơ Keycool Y75 – 3Mode, Mạch Xuôi, Led Viền RGB	kb0002	1	3000000	3000000	t	7	0	12	0.00		VND		blue
8	Bàn Phím Cơ Keycool Y75 – 3Mode, Mạch Xuôi, Led Viền RGB	bk00999	1	2300000	2300000	t	7	0	11	0.00		VND		Red
9	Switch tactile 1	swk0001	1	279999	279999	t	8	0	3	0.00		VND		swk0001
6	Cherry1	KC0001	3	500000	500000	t	6	3	4	0.00		VND		KC0001
10	Bàn Phím Cơ Keycool Y75 – 3Mode, Mạch Xuôi, Led Viền RGB	kb0002	1	3000000	3000000	t	9	0	12	0.00		VND		blue
11	Bàn Phím Cơ Keycool Y75 – 3Mode, Mạch Xuôi, Led Viền RGB	bk00999	1	2300000	2300000	t	10	0	11	0.00		VND		Red
12	kit demo1	kit01111	1	1499999	1499999	t	11	0	7	0.00		VND		kit01111
14	Switch clicky1	CLK001	1	3000000	3000000	t	13	1	2	0.00		VND		CLK001
13	Keydous NJ80 – AP 2022	kb00111	1	2890000	2890000	t	12	1	10	0.00		VND		kb00111
15	Switch clicky1	CLK001	4	3000000	3000000	t	14	0	2	0.00		VND		CLK001
16	DDA1	KY00002	1	499999	499999	t	15	0	5	0.00		VND		KY00002
17	Switch clicky1	CLK001	1	3000000	3000000	t	16	0	2	0.00		VND		CLK001
18	Cherry1	KC0001	1	500000	500000	t	17	0	4	0.00		VND		KC0001
19	XDA	KC00003	1	479999	479999	t	18	1	6	0.00		VND		KC00003
20	kit demo1	kit01111	8	1499999	1499999	t	19	0	7	0.00		VND		kit01111
21	Keydous NJ80 – AP 2022	kb00111	3	2890000	2890000	t	20	0	10	0.00		VND		kb00111
22	DDA1	KY00002	1	499999	499999	t	21	0	5	0.00		VND		KY00002
\.


--
-- Data for Name: page_page; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.page_page (id, slug, title, content, created, is_published, publication_date, seo_description, seo_title, content_json) FROM stdin;
\.


--
-- Data for Name: page_pagetranslation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.page_pagetranslation (id, seo_title, seo_description, language_code, title, content, page_id, content_json) FROM stdin;
\.


--
-- Data for Name: payment_payment; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.payment_payment (id, gateway, is_active, created, modified, charge_status, billing_first_name, billing_last_name, billing_company_name, billing_address_1, billing_address_2, billing_city, billing_city_area, billing_postal_code, billing_country_code, billing_country_area, billing_email, customer_ip_address, cc_brand, cc_exp_month, cc_exp_year, cc_first_digits, cc_last_digits, extra_data, token, currency, total, captured_amount, checkout_id, order_id) FROM stdin;
1	Dummy	t	2025-01-12 08:39:58.065141+00	2025-01-12 08:39:58.065165+00	not-charged	phong13	le	da nang	hoa tien	hoa tien	DA NANG		2133	VN		admin@admin.com	172.19.0.1		\N	\N			{'customer_user_agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0'}		VND	2450000	0	\N	1
2	Dummy	t	2025-01-12 08:46:34.019235+00	2025-01-12 08:46:34.019287+00	not-charged	phong13	le	da nang	hoa tien	hoa tien	DA NANG		2133	VN		admin@admin.com	172.19.0.1		\N	\N			{'customer_user_agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0'}		VND	350000	0	\N	2
3	Dummy	t	2025-01-12 09:08:07.084659+00	2025-01-12 09:08:07.084677+00	not-charged	phong13	le	da nang	hoa tien	hoa tien	DA NANG		2133	VN		admin@admin.com	172.19.0.1		\N	\N			{'customer_user_agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0'}		VND	2940000	0	\N	3
4	Dummy	f	2025-01-12 09:13:03.796473+00	2025-01-12 09:13:03.796491+00	fully-refunded	phong13	le	da nang	hoa tien	hoa tien	DA NANG		2133	VN		admin@admin.com	172.19.0.1		\N	\N			{'customer_user_agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0'}		VND	2940000	0	\N	4
5	Dummy	t	2025-01-12 09:21:49.736902+00	2025-01-12 09:21:49.736918+00	fully-charged	phong13	le	da nang	hoa tien	hoa tien	DA NANG		2133	VN		admin@admin.com	172.19.0.1		\N	\N			{'customer_user_agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0'}		VND	2940000	2940000	\N	4
6	Dummy	t	2025-01-12 09:24:10.48635+00	2025-01-12 09:24:10.486366+00	fully-charged	phong13	le	da nang	hoa tien	hoa tien	DA NANG		2133	VN		admin@admin.com	172.19.0.1		\N	\N			{'customer_user_agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0'}		VND	550000	550000	\N	5
7	Dummy	t	2025-01-12 09:26:20.129618+00	2025-01-12 09:26:20.129634+00	not-charged	phong13	le	da nang	hoa tien	hoa tien	DA NANG		2133	VN		admin@admin.com	172.19.0.1		\N	\N			{'customer_user_agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0'}		VND	1550000	0	\N	6
8	Dummy	t	2025-01-12 09:30:12.087132+00	2025-01-12 09:30:12.087149+00	fully-charged	phong13	le	da nang	hoa tien	hoa tien	DA NANG		2133	VN		admin@admin.com	172.19.0.1		\N	\N			{'customer_user_agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0'}		VND	5350000	5350000	\N	7
9	Dummy	t	2025-01-12 09:31:29.12891+00	2025-01-12 09:31:29.128938+00	not-charged	phong13	le	da nang	hoa tien	hoa tien	DA NANG		2133	VN		admin@admin.com	172.19.0.1		\N	\N			{'customer_user_agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0'}		VND	329999	0	\N	8
10	Dummy	t	2025-01-12 10:14:54.775898+00	2025-01-12 10:14:54.775927+00	not-charged	phong13	le	da nang	hoa tien	hoa tien	DA NANG		2133	VN		admin@admin.com	172.19.0.1		\N	\N			{'customer_user_agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0'}		VND	3050000	0	\N	9
11	Braintree	t	2025-01-12 10:17:42.699381+00	2025-01-12 10:17:42.699408+00	not-charged	phong13	le	da nang	hoa tien	hoa tien	DA NANG		2133	VN		admin@admin.com	172.19.0.1		\N	\N			{'customer_user_agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0'}		VND	2350000	0	\N	10
12	Braintree	t	2025-01-12 10:44:25.331144+00	2025-01-12 10:44:25.3312+00	not-charged	phong13	le	da nang	hoa tien	hoa tien	DA NANG		2133	VN		admin@admin.com	172.19.0.1		\N	\N			{'customer_user_agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0'}		VND	1549999	0	\N	11
13	Braintree	t	2025-01-12 10:47:34.513235+00	2025-01-12 10:47:34.513271+00	not-charged	phong13	le	da nang	hoa tien	hoa tien	DA NANG		2133	VN		admin@admin.com	172.19.0.1		\N	\N			{'customer_user_agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0'}		VND	2940000	0	\N	12
14	Dummy	t	2025-01-12 10:50:30.240929+00	2025-01-12 10:50:30.240948+00	fully-charged	phong13	le	da nang	hoa tien	hoa tien	DA NANG		2133	VN		admin@admin.com	172.19.0.1		\N	\N			{'customer_user_agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0'}		VND	3050000	3050000	\N	13
15	Dummy	t	2025-01-12 10:55:26.245164+00	2025-01-12 10:55:26.245182+00	fully-charged	phong13	le	da nang	hoa tien	hoa tien	DA NANG		2133	VN		admin@admin.com	172.19.0.1		\N	\N			{'customer_user_agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0'}		VND	12050000	12050000	\N	14
16	Dummy	t	2025-01-12 10:59:07.55558+00	2025-01-12 10:59:07.555599+00	not-charged	phong13	le	da nang	hoa tien	hoa tien	DA NANG		2133	VN		admin@admin.com	172.19.0.1		\N	\N			{'customer_user_agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0'}		VND	549999	0	\N	15
17	Dummy	t	2025-01-12 11:02:44.897478+00	2025-01-12 11:02:44.897507+00	not-charged	phong13	le	da nang	hoa tien	hoa tien	DA NANG		2133	VN		admin@admin.com	172.19.0.1		\N	\N			{'customer_user_agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0'}		VND	3050000	0	\N	16
18	Dummy	t	2025-01-12 11:04:52.341378+00	2025-01-12 11:04:52.341395+00	fully-charged	phong13	le	da nang	hoa tien	hoa tien	DA NANG		2133	VN		admin@admin.com	172.19.0.1		\N	\N			{'customer_user_agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0'}		VND	550000	550000	\N	17
19	Dummy	t	2025-01-12 11:05:50.329276+00	2025-01-12 11:05:50.329295+00	fully-charged	phong13	le	da nang	hoa tien	hoa tien	DA NANG		2133	VN		admin@admin.com	172.19.0.1		\N	\N			{'customer_user_agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0'}		VND	529999	529999	\N	18
20	Dummy	t	2025-01-12 23:10:10.86405+00	2025-01-12 23:10:10.864074+00	fully-charged	a	a	a	a	a	A		a	VN		abc@gmail.com	172.19.0.1		\N	\N			{'customer_user_agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0'}		VND	8720000	8720000	\N	20
21	Dummy	t	2025-01-12 23:21:15.229281+00	2025-01-12 23:21:15.229304+00	not-charged	a	a	a	a	a	A		a	VN		abc2101@gmail.com	172.19.0.1		\N	\N			{'customer_user_agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0'}		VND	549999	0	\N	21
\.


--
-- Data for Name: payment_transaction; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.payment_transaction (id, created, token, kind, is_success, error, currency, amount, gateway_response, payment_id, customer_id) FROM stdin;
1	2025-01-12 09:14:03.320867+00	fully-charged	capture	t	\N	VND	2940000	{}	4	\N
2	2025-01-12 09:21:01.227677+00	fully-charged	refund	t	\N	VND	2940000	{}	4	\N
3	2025-01-12 09:21:52.796689+00	fully-charged	capture	t	\N	VND	2940000	{}	5	\N
4	2025-01-12 09:24:13.681317+00	fully-charged	capture	t	\N	VND	550000	{}	6	\N
5	2025-01-12 09:30:13.466046+00	fully-charged	capture	t	\N	VND	5350000	{}	8	\N
6	2025-01-12 10:18:32.239899+00	tokencc_bj_kw6ykc_3c2zw6_hzk6ff_s8wqrr_qby	capture	f	Không thể thực hiện giao dịch. Thử lại trong giây lát	VND	2350000	{"errors": [{"code": "81528", "message": "Amount is too large."}]}	11	\N
7	2025-01-12 10:53:47.535587+00	not-charged	auth	t	\N	VND	3050000	{}	14	\N
8	2025-01-12 10:54:23.215339+00	not-charged	capture	t	\N	VND	3050000	{}	14	\N
9	2025-01-12 10:55:30.527129+00	fully-charged	capture	t	\N	VND	12050000	{}	15	\N
10	2025-01-12 11:05:14.12946+00	fully-charged	capture	t	\N	VND	550000	{}	18	\N
11	2025-01-12 11:05:51.316648+00	not-charged	auth	t	\N	VND	529999	{}	19	\N
12	2025-01-12 11:06:02.257467+00	not-charged	capture	t	\N	VND	529999	{}	19	\N
13	2025-01-12 23:10:13.330524+00	fully-charged	capture	t	\N	VND	8720000	{}	20	\N
14	2025-01-12 23:21:16.719255+00	not-charged	auth	t	\N	VND	549999	{}	21	\N
\.


--
-- Data for Name: product_assignedproductattribute; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_assignedproductattribute (id, product_id, assignment_id) FROM stdin;
\.


--
-- Data for Name: product_assignedproductattribute_values; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_assignedproductattribute_values (id, assignedproductattribute_id, attributevalue_id) FROM stdin;
\.


--
-- Data for Name: product_assignedvariantattribute; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_assignedvariantattribute (id, variant_id, assignment_id) FROM stdin;
1	11	2
2	12	2
\.


--
-- Data for Name: product_assignedvariantattribute_values; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_assignedvariantattribute_values (id, assignedvariantattribute_id, attributevalue_id) FROM stdin;
1	1	38
2	2	39
\.


--
-- Data for Name: product_attribute; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_attribute (id, slug, name, meta, private_meta, input_type, available_in_grid, visible_in_storefront, filterable_in_dashboard, filterable_in_storefront, value_required, storefront_search_position, is_variant_only) FROM stdin;
1	AcF	Actuation Force	{}	{}	dropdown	t	t	t	t	f	0	f
2	SwType	Switch Type	{}	{}	dropdown	t	t	t	t	f	0	f
3	MaT	Material	{}	{}	dropdown	t	t	t	t	f	0	f
4	PF	Profile	{}	{}	dropdown	t	t	t	t	f	0	f
5	Comtib	Compatibility	{}	{}	dropdown	t	t	t	t	f	0	f
6	LaS	Layouts	{}	{}	dropdown	t	t	t	t	f	0	f
7	LebS	LED Support	{}	{}	dropdown	t	t	t	t	f	0	f
8	H-S	Hot-swap	{}	{}	dropdown	t	t	t	t	f	0	f
9	RGB	RGB	{}	{}	dropdown	t	t	t	t	f	0	f
10	sf	Sound Profile	{}	{}	dropdown	t	t	t	t	f	0	f
11	KC-T	Keycap Thickness	{}	{}	dropdown	t	t	t	t	f	0	f
12	Color	Color	{}	{}	dropdown	t	t	t	t	f	0	f
\.


--
-- Data for Name: product_attributeproduct; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_attributeproduct (id, attribute_id, product_type_id, sort_order) FROM stdin;
\.


--
-- Data for Name: product_attributetranslation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_attributetranslation (id, language_code, name, attribute_id) FROM stdin;
\.


--
-- Data for Name: product_attributevalue; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_attributevalue (id, name, attribute_id, slug, sort_order, value) FROM stdin;
36	layout 65%	6	layout-65	0	
38	Red	12	red	0	
39	blue	12	blue	1	
40	white	12	white	2	
41	gray	12	gray	3	
\.


--
-- Data for Name: product_attributevaluetranslation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_attributevaluetranslation (id, language_code, name, attribute_value_id) FROM stdin;
\.


--
-- Data for Name: product_attributevariant; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_attributevariant (id, attribute_id, product_type_id, sort_order) FROM stdin;
1	12	2	\N
2	12	4	\N
3	12	3	\N
4	12	1	\N
\.


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_category (id, name, slug, description, lft, rght, tree_id, level, parent_id, background_image, seo_description, seo_title, background_image_alt, description_json, meta, private_meta, show_in_customize) FROM stdin;
5	DDA	dda		8	9	1	1	1					{}	{}	{}	f
7	Layout 60-65%	layout-60-65		2	3	2	1	6					{}	{}	{}	f
8	Layout 75%	layout-75		4	5	2	1	6	category-backgrounds/accessories_BlAkezp.jpg				{}	{}	{}	f
9	Layout FullSize	layout-fullsize		6	7	2	1	6	category-backgrounds/accessories_Zfu5TXI.jpg				{}	{}	{}	f
1	KeyCaps	keycaps		1	10	1	0	\N	category-backgrounds/accessories.jpg				{}	{}	{}	f
6	Kits	kits		1	8	2	0	\N	category-backgrounds/accessories_gfxoUYY.jpg				{}	{}	{}	f
11	Switch linear	switch-linear		2	3	3	1	10	category-backgrounds/switches_qdh4Hnk.jpg				{}	{}	{}	f
12	Switch tactile	switch-tactile		4	5	3	1	10	category-backgrounds/switches_9iQuuDo.jpg				{}	{}	{}	f
10	Switchs	switchs		1	8	3	0	\N	category-backgrounds/switches.jpg				{}	{}	{}	f
13	Switch clicky	switch-clicky		6	7	3	1	10	category-backgrounds/switches_BHTBRKK.jpg				{}	{}	{}	f
2	XDA	xda		2	3	1	1	1	category-backgrounds/keycaps-banner_XHiFNGa.jpeg				{}	{}	{}	f
3	Cherry	cherry		4	5	1	1	1	category-backgrounds/keycaps-banner_o9p34qd.jpeg				{}	{}	{}	f
14	KeyBoard	keyboard		1	2	4	0	\N	category-backgrounds/desk-mat.jpeg				{}	{}	{}	f
\.


--
-- Data for Name: product_categorytranslation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_categorytranslation (id, seo_title, seo_description, language_code, name, description, category_id, description_json) FROM stdin;
\.


--
-- Data for Name: product_collection; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_collection (id, name, slug, background_image, seo_description, seo_title, is_published, description, publication_date, background_image_alt, description_json, meta, private_meta) FROM stdin;
\.


--
-- Data for Name: product_collectionproduct; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_collectionproduct (id, collection_id, product_id, sort_order) FROM stdin;
\.


--
-- Data for Name: product_collectiontranslation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_collectiontranslation (id, seo_title, seo_description, language_code, name, collection_id, description, description_json) FROM stdin;
\.


--
-- Data for Name: product_digitalcontent; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_digitalcontent (id, use_default_settings, automatic_fulfillment, content_type, content_file, max_downloads, url_valid_days, product_variant_id, meta, private_meta) FROM stdin;
\.


--
-- Data for Name: product_digitalcontenturl; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_digitalcontenturl (id, token, created, download_num, content_id, line_id) FROM stdin;
\.


--
-- Data for Name: product_product; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_product (id, name, description, price_amount, publication_date, updated_at, product_type_id, is_published, category_id, seo_description, seo_title, charge_taxes, weight, description_json, meta, private_meta, minimal_variant_price_amount, currency) FROM stdin;
3	Switch tactile 1	<p>Loại switch: tactile 1<br></p><p>Hãng sản xuất: Cherry</p><p>Lực nhấn: 45g</p><p>Hành trình phím: 4mm</p><p>Độ bền: 50 triệu lần nhấn</p><p>Chất liệu: PBT</p><p>Màu sắc: Đen</p>	390000	\N	2025-01-10 07:32:35.926718+00	1	t	12	Loại switch: Liniear1Hãng sản xuất: CherryLực nhấn: 45gHành trình phím: 4mmĐộ bền: 50 triệu lần nhấnChất liệu: PBTMàu sắc: Đen		f	\N	{}	{}	{}	279999	VND
2	Switch clicky1	<p>Loại switch: clicky1</p><p>Hãng sản xuất: Cherry</p><p>Lực nhấn: 45g</p><p>Hành trình phím: 4mm</p><p>Độ bền: 50 triệu lần nhấn</p><p>Chất liệu: PBT</p><p>Màu sắc: Đen</p><p align="right">Tính năng đặc biệt: Hot-swap</p><p>Cảm nhận: Nhẹ nhàng, êm ái, phù hợp cho đánh máy và chơi game MOBA.</p><p>Ứng dụng: Phù hợp cho người dùng văn phòng và game thủ MOBA.</p>	300000	\N	2025-01-10 07:32:47.334165+00	1	t	13	Loại switch: clicky1Hãng sản xuất: CherryLực nhấn: 45gHành trình phím: 4mmĐộ bền: 50 triệu lần nhấnChất liệu: PBTMàu sắc: ĐenTính năng đặc biệt: Hot-swapCảm nhận: Nhẹ nhàng, êm ái, phù hợp cho đánh máy và chơi game MOBA.Ứng dụng: Phù hợp cho người dùng văn phòng và game thủ MOBA.		f	\N	{}	{}	{}	300000	VND
8	kit demo2	<p>Kit bàn phím cơ kit demo2</p><p>    PCB:</p><p>        Layout: 75% <br></p><p>        Chất liệu: FR-4</p><p>        Hỗ trợ hot-swap: Có</p><p>        Số lượng cổng USB: 1</p><p>    Switch: Chưa bao gồm (tùy chọn)</p><p>    Keycap: Chưa bao gồm (tùy chọn)</p><p>    Các bộ phận khác: Stabilizer Cherry, dây cáp USB-C</p><p>    Hãng sản xuất: OLKB</p><p>    Thiết kế: Vỏ nhôm, đơn giản, tinh tế</p><p>    Tính năng: Hỗ trợ QMK, VIA, tùy biến cao</p>	1399999	\N	2025-01-10 07:40:43.782195+00	3	t	8	Kit bàn phím cơ kit demo2 PCB: Layout: 75%  Chất liệu: FR-4 Hỗ trợ hot-swap: Có Số lượng cổng USB: 1 Switch: Chưa bao gồm (tùy chọn) Keycap: Chưa bao gồm (tùy chọn) Các bộ phận khác: Stabilizer Cherry, dây cáp USB-C Hãng sản xuất: OLKB Thiết kế: Vỏ nhôm, đơn giản, tinh tế Tính năng: Hỗ trợ QMK, VIA…		f	\N	{}	{}	{}	1190000	VND
1	Switch Liniear1	<p><br></p><p>Loại switch: Liniear1</p><p>Hãng sản xuất: Cherry</p><p>Lực nhấn: 45g</p><p>Hành trình phím: 4mm</p><p>Độ bền: 50 triệu lần nhấn</p><p>Chất liệu: PBT</p><p>Màu sắc: Đen</p>	300000	\N	2025-01-10 07:14:51.150298+00	1	t	11	Loại switch: Linear Hành trình phím: 3.5mm Lực nhấn: 45g Kết nối: USB-C có dây Tương thích: Windows, macOS, Linux Kích thước: 360 x 140 x 40mm Trọng lượng: 850g Chất liệu: Nhựa ABS Đèn nền: RGB tùy chỉnh Tốc độ phản hồi: 1ms Độ bền: 50 triệu lần nhấn Thiết kế: Minimalist, phù hợp với không gian là…		f	\N	{}	{}	{}	300000	VND
11	Bàn Phím Cơ Keycool Y75 – 3Mode, Mạch Xuôi, Led Viền RGB	<p>Kit bàn phím cơ OLKB Planck</p><p>    PCB:</p><p>        Layout: 40% ortholinear</p><p>        Chất liệu: FR-4</p><p>        Hỗ trợ hot-swap: Có</p><p>        Số lượng cổng USB: 1</p><p>    Switch: Chưa bao gồm (tùy chọn)</p><p>    Keycap: Chưa bao gồm (tùy chọn)</p><p>    Các bộ phận khác: Stabilizer Cherry, dây cáp USB-C</p><p>    Hãng sản xuất: OLKB</p><p>    Thiết kế: Vỏ nhôm, đơn giản, tinh tế</p><p>    Tính năng: Hỗ trợ QMK, VIA, tùy biến cao</p>	3000000	\N	2025-01-12 09:28:32.1707+00	4	t	14	Kit bàn phím cơ OLKB Planck PCB: Layout: 40% ortholinear Chất liệu: FR-4 Hỗ trợ hot-swap: Có Số lượng cổng USB: 1 Switch: Chưa bao gồm (tùy chọn) Keycap: Chưa bao gồm (tùy chọn) Các bộ phận khác: Stabilizer Cherry, dây cáp USB-C Hãng sản xuất: OLKB Thiết kế: Vỏ nhôm, đơn giản, tinh tế Tính năng: Hỗ…		f	\N	{}	{}	{}	2300000	VND
9	kit full size demo	<p>Kit bàn phím cơ kit demo2</p><p>PCB:</p><p>Layout:&nbsp; full size</p><p>Chất liệu: FR-4</p><p>Hỗ trợ hot-swap: Có</p><p>Số lượng cổng USB: 1</p><p>Switch: Chưa bao gồm (tùy chọn)</p><p>Keycap: Chưa bao gồm (tùy chọn)</p><p>Các bộ phận khác: Stabilizer Cherry, dây cáp USB-C</p><p>Hãng sản xuất: OLKB</p><p>Thiết kế: Vỏ nhôm, đơn giản, tinh tế</p><p>Tính năng: Hỗ trợ QMK, VIA, tùy biến cao</p>	1500000	\N	2025-01-10 07:43:40.317931+00	3	t	9	Kit bàn phím cơ kit demo2PCB:Layout:&nbsp; full sizeChất liệu: FR-4Hỗ trợ hot-swap: CóSố lượng cổng USB: 1Switch: Chưa bao gồm (tùy chọn)Keycap: Chưa bao gồm (tùy chọn)Các bộ phận khác: Stabilizer Cherry, dây cáp USB-CHãng sản xuất: OLKBThiết kế: Vỏ nhôm, đơn giản, tinh tếTính năng: Hỗ trợ QMK, VIA…		f	\N	{}	{}	{}	1290000	VND
4	Cherry1	<p><br></p><p>    Chất liệu: PBT</p><p>    Profile: Cherry</p><p>    Độ dày: 1.5mm</p><p>    Phương pháp in: Dye-sub</p><p>    Font chữ: GMK Olivia</p><p>    Màu sắc: Gradient xanh dương</p><p>    Bộ keycap: Fullset</p><p>    Tương thích: ANSI</p><p>    Cảm giác: Bề mặt nhám, mịn màng, không bám bẩn.</p><p>    Thiết kế: Đơn giản, thanh lịch.</p><p></p>	500000	\N	2025-01-10 07:25:53.093578+00	2	t	3	 Chất liệu: PBT Profile: Cherry Độ dày: 1.5mm Phương pháp in: Dye-sub Font chữ: GMK Olivia Màu sắc: Gradient xanh dương Bộ keycap: Fullset Tương thích: ANSI Cảm giác: Bề mặt nhám, mịn màng, không bám bẩn. Thiết kế: Đơn giản, thanh lịch.		f	\N	{}	{}	{}	500000	VND
5	DDA1	<p>    Chất liệu: PBT</p><p>    Profile: DDA</p><p>    Độ dày: 1.5mm</p><p>    Phương pháp in: Dye-sub</p><p>    Font chữ: GMK Olivia</p><p>    Màu sắc: Gradient xanh dương</p><p>    Bộ keycap: Fullset</p><p>    Tương thích: ANSI</p><p>    Cảm giác: Bề mặt nhám, mịn màng, không bám bẩn.</p><p>    Thiết kế: Đơn giản, thanh lịch.</p>	500000	\N	2025-01-10 07:29:27.566969+00	2	t	5	Chất liệu: PBT Profile: DDA Độ dày: 1.5mm Phương pháp in: Dye-sub Font chữ: GMK Olivia Màu sắc: Gradient xanh dương Bộ keycap: Fullset Tương thích: ANSI Cảm giác: Bề mặt nhám, mịn màng, không bám bẩn. Thiết kế: Đơn giản, thanh lịch.		f	\N	{}	{}	{}	499999	VND
6	XDA	<p>    Chất liệu: PBT</p><p>    Profile: XDA<br></p><p>    Độ dày: 1.5mm</p><p>    Phương pháp in: Dye-sub</p><p>    Font chữ: GMK Olivia</p><p>    Màu sắc: Gradient xanh dương</p><p>    Bộ keycap: Fullset</p><p>    Tương thích: ANSI</p><p>    Cảm giác: Bề mặt nhám, mịn màng, không bám bẩn.</p><p>    Thiết kế: Đơn giản, thanh lịch.</p>	480000	\N	2025-01-10 07:31:17.484736+00	2	t	2	 Chất liệu: PBT Profile: XDA Độ dày: 1.5mm Phương pháp in: Dye-sub Font chữ: GMK Olivia Màu sắc: Gradient xanh dương Bộ keycap: Fullset Tương thích: ANSI Cảm giác: Bề mặt nhám, mịn màng, không bám bẩn. Thiết kế: Đơn giản, thanh lịch.		f	\N	{}	{}	{}	479999	VND
10	Keydous NJ80 – AP 2022	<p>Bàn phím cơ: Keydous NJ80 – AP 2022 </p><p>    Switch: Gateron Brown (có thể thay thế)</p><p>    Keycap: PBT Double-shot</p><p>    PCB: Hot-swap, hỗ trợ nhiều layout</p><p>    Vỏ: Nhôm, màu xanh</p><p>    Tính năng: RGB, N-key rollover, Windows/Mac OS</p><p>    Kết nối: Có dây, Bluetooth</p><p>    Hãng sản xuất: Keychron</p>	2890000	\N	2025-01-10 12:20:48.601168+00	4	t	14	Bàn phím cơ: Keydous NJ80 – AP 2022  Switch: Gateron Brown (có thể thay thế) Keycap: PBT Double-shot PCB: Hot-swap, hỗ trợ nhiều layout Vỏ: Nhôm, màu xanh Tính năng: RGB, N-key rollover, Windows/Mac OS Kết nối: Có dây, Bluetooth Hãng sản xuất: Keychron		f	\N	{}	{}	{}	2890000	VND
7	kit demo1	<p>Kit bàn phím cơ kit demo1</p><p>    PCB:</p><p>        Layout: 65% <br></p><p>        Chất liệu: FR-4</p><p>        Hỗ trợ hot-swap: Có</p><p>        Số lượng cổng USB: 1</p><p>    Switch: Chưa bao gồm (tùy chọn)</p><p>    Keycap: Chưa bao gồm (tùy chọn)</p><p>    Các bộ phận khác: Stabilizer Cherry, dây cáp USB-C</p><p>    Hãng sản xuất: OLKB</p><p>    Thiết kế: Vỏ nhôm, đơn giản, tinh tế</p><p>    Tính năng: Hỗ trợ QMK, VIA, tùy biến cao</p>	1499999	\N	2025-01-10 12:15:26.862762+00	3	t	7	Kit bàn phím cơ kit demo1 PCB: Layout: 65%  Chất liệu: FR-4 Hỗ trợ hot-swap: Có Số lượng cổng USB: 1 Switch: Chưa bao gồm (tùy chọn) Keycap: Chưa bao gồm (tùy chọn) Các bộ phận khác: Stabilizer Cherry, dây cáp USB-C Hãng sản xuất: OLKB Thiết kế: Vỏ nhôm, đơn giản, tinh tế Tính năng: Hỗ trợ QMK, VIA…		f	\N	{}	{}	{}	1275000	VND
\.


--
-- Data for Name: product_productimage; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_productimage (id, image, ppoi, alt, sort_order, product_id) FROM stdin;
32	products/9a849f4043c7fc47cc6b52492610c079_938ad41a-b4c0-4f57-8aac-361.jpg	0.5x0.5		0	4
33	products/9a849f4043c7fc47cc6b52492610c079_938ad41a-b4c0-4f57-8aac-361_1.jpg	0.5x0.5		1	4
34	products/9a849f4043c7fc47cc6b52492610c079_938ad41a-b4c0-4f57-8aac-361_3jVrcSH.jpg	0.5x0.5		2	4
35	products/1_46e35779-79f9-418d-a04a-3b0efcf459cc.jpg	0.5x0.5		0	5
36	products/1_46e35779-79f9-418d-a04a-3b0efcf459cc_gMevbaG.jpg	0.5x0.5		1	5
37	products/1_46e35779-79f9-418d-a04a-3b0efcf459cc_PCd1Az0.jpg	0.5x0.5		2	5
38	products/ACGAM_Gardens_Cherry_Profile_Keycap_Set_174_Keys_1.jpg	0.5x0.5		0	6
39	products/ACGAM_Gardens_Cherry_Profile_Keycap_Set_174_Keys_1_saJoJYE.jpg	0.5x0.5		1	6
40	products/ACGAM_Gardens_Cherry_Profile_Keycap_Set_174_Keys_1_tV8DxGY.jpg	0.5x0.5		2	6
41	products/18754-NQ7NL-Wuque-Studio-Silent-Tactile-50g.jpg	0.5x0.5		0	1
42	products/18754-NQ7NL-Wuque-Studio-Silent-Tactile-50g_1.jpg	0.5x0.5		1	1
43	products/18754-NQ7NL-Wuque-Studio-Silent-Tactile-50g_xUXHfza.jpg	0.5x0.5		2	1
44	products/5-pins.jpeg	0.5x0.5		0	2
45	products/5-pins_1.jpeg	0.5x0.5		1	2
46	products/5-pins_aS9vY7T.jpeg	0.5x0.5		2	2
47	products/3-pins.jpeg	0.5x0.5		0	3
48	products/3-pins_1.jpeg	0.5x0.5		1	3
49	products/3-pins_02aAaki.jpeg	0.5x0.5		2	3
50	products/ban-phim-co-kit-ck820-feker-cnc-nhom-21.jpg	0.5x0.5		0	7
52	products/ban-phim-co-kit-ck820-feker-cnc-nhom-21_V8KgBar.jpg	0.5x0.5		1	7
53	products/ban-phim-co-kit-ck820-feker-cnc-nhom-21_ylx2tWq.jpg	0.5x0.5		2	7
54	products/kit-mk870-2.jpg	0.5x0.5		0	8
55	products/kit-mk870-2_ZWbaYPD.jpg	0.5x0.5		1	8
56	products/kit-mk870-2_VZSCT55.jpg	0.5x0.5		2	8
59	products/kit-ir75-feker-75v3-1.png	0.5x0.5		0	9
60	products/kit-ir75-feker-75v3-1_YviIB6U.png	0.5x0.5		1	9
61	products/kit-ir75-feker-75v3-1_jLR76q3.png	0.5x0.5		2	9
62	products/ban-phim-co-keydous-nj98-9-7.jpg	0.5x0.5		0	10
63	products/ban-phim-co-keydous-nj98-9-8.jpg	0.5x0.5		1	10
64	products/ban-phim-co-keydous-nj98-9-11.jpg	0.5x0.5		2	10
65	products/keycool-y75-3mode-mach-xuoi-led-vien-rgb1-rotated.jpg	0.5x0.5		0	11
66	products/keycool-y75-3mode-mach-xuoi-led-vien-rgb5-768x768.jpg	0.5x0.5		1	11
67	products/keycool-y75-3mode-mach-xuoi-led-vien-rgb-12.jpg	0.5x0.5		2	11
\.


--
-- Data for Name: product_producttranslation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_producttranslation (id, seo_title, seo_description, language_code, name, description, product_id, description_json) FROM stdin;
\.


--
-- Data for Name: product_producttype; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_producttype (id, name, has_variants, is_shipping_required, weight, is_digital, meta, private_meta) FROM stdin;
2	KeyCaps	t	t	0	f	{}	{}
4	Keyboard	t	t	0	f	{}	{}
3	Kit	t	t	0	f	{}	{}
1	Switch	t	t	0	f	{}	{}
\.


--
-- Data for Name: product_productvariant; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_productvariant (id, sku, name, price_override_amount, product_id, cost_price_amount, quantity, quantity_allocated, track_inventory, weight, meta, private_meta, currency) FROM stdin;
8	kit011122		\N	8	\N	100000	0	t	\N	{}	{}	VND
9	kit03333		1290000	9	\N	19999	0	t	\N	{}	{}	VND
1	SW001		\N	1	260000	1000	1	t	1000	{}	{}	VND
3	swk0001		279999	3	\N	100000	1	t	\N	{}	{}	VND
12	kb0002	blue	\N	11	\N	1000	2	t	0	{}	{}	VND
11	bk00999	Red	2300000	11	2200000	10000	2	t	\N	{}	{}	VND
2	CLK001		3000000	2	\N	99999	6	t	\N	{}	{}	VND
4	KC0001		500000	4	\N	9996	1	t	\N	{}	{}	VND
6	KC00003		479999	6	\N	99999	0	t	\N	{}	{}	VND
7	kit01111		\N	7	\N	10000	9	t	\N	{}	{}	VND
10	kb00111		\N	10	\N	9998	4	t	\N	{}	{}	VND
5	KY00002		499999	5	\N	10000	2	t	\N	{}	{}	VND
\.


--
-- Data for Name: product_productvarianttranslation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_productvarianttranslation (id, language_code, name, product_variant_id) FROM stdin;
\.


--
-- Data for Name: product_variantimage; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_variantimage (id, image_id, variant_id) FROM stdin;
3	66	11
\.


--
-- Data for Name: shipping_shippingmethod; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.shipping_shippingmethod (id, name, maximum_order_price_amount, maximum_order_weight, minimum_order_price_amount, minimum_order_weight, price_amount, type, shipping_zone_id, meta, currency) FROM stdin;
1	GHTK	\N	\N	0	0	50000	price	1	{}	VND
\.


--
-- Data for Name: shipping_shippingmethodtranslation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.shipping_shippingmethodtranslation (id, language_code, name, shipping_method_id) FROM stdin;
\.


--
-- Data for Name: shipping_shippingzone; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.shipping_shippingzone (id, name, countries, "default") FROM stdin;
1	VietNam		t
\.


--
-- Data for Name: site_authorizationkey; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.site_authorizationkey (id, name, key, password, site_settings_id) FROM stdin;
\.


--
-- Data for Name: site_sitesettings; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.site_sitesettings (id, header_text, description, site_id, bottom_menu_id, top_menu_id, display_gross_prices, include_taxes_in_prices, charge_taxes_on_shipping, track_inventory_by_default, homepage_collection_id, default_weight_unit, automatic_fulfillment_digital_products, default_digital_max_downloads, default_digital_url_valid_days, company_address_id, default_mail_sender_address, default_mail_sender_name, customer_set_password_url) FROM stdin;
1	Phongdemo_Tesst		1	1	1	t	t	t	t	\N	kg	f	\N	\N	\N	\N		\N
\.


--
-- Data for Name: site_sitesettingstranslation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.site_sitesettingstranslation (id, language_code, header_text, description, site_settings_id) FROM stdin;
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: webhook_webhook; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.webhook_webhook (id, target_url, is_active, secret_key, service_account_id, name) FROM stdin;
\.


--
-- Data for Name: webhook_webhookevent; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.webhook_webhookevent (id, event_type, webhook_id) FROM stdin;
\.


--
-- Name: account_customerevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.account_customerevent_id_seq', 28, true);


--
-- Name: account_customernote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.account_customernote_id_seq', 1, false);


--
-- Name: account_serviceaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.account_serviceaccount_id_seq', 1, false);


--
-- Name: account_serviceaccount_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.account_serviceaccount_permissions_id_seq', 1, false);


--
-- Name: account_serviceaccounttoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.account_serviceaccounttoken_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 303, true);


--
-- Name: cart_cartline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.cart_cartline_id_seq', 23, true);


--
-- Name: checkout_checkout_gift_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.checkout_checkout_gift_cards_id_seq', 1, false);


--
-- Name: discount_sale_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.discount_sale_categories_id_seq', 1, true);


--
-- Name: discount_sale_collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.discount_sale_collections_id_seq', 1, false);


--
-- Name: discount_sale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.discount_sale_id_seq', 1, true);


--
-- Name: discount_sale_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.discount_sale_products_id_seq', 2, true);


--
-- Name: discount_saletranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.discount_saletranslation_id_seq', 1, false);


--
-- Name: discount_voucher_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.discount_voucher_categories_id_seq', 1, false);


--
-- Name: discount_voucher_collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.discount_voucher_collections_id_seq', 1, false);


--
-- Name: discount_voucher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.discount_voucher_id_seq', 1, true);


--
-- Name: discount_voucher_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.discount_voucher_products_id_seq', 1, false);


--
-- Name: discount_vouchercustomer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.discount_vouchercustomer_id_seq', 1, false);


--
-- Name: discount_vouchertranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.discount_vouchertranslation_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 72, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 438, true);


--
-- Name: django_prices_openexchangerates_conversionrate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.django_prices_openexchangerates_conversionrate_id_seq', 1, false);


--
-- Name: django_prices_vatlayer_ratetypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.django_prices_vatlayer_ratetypes_id_seq', 1, false);


--
-- Name: django_prices_vatlayer_vat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.django_prices_vatlayer_vat_id_seq', 1, false);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: extensions_pluginconfiguration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.extensions_pluginconfiguration_id_seq', 7, true);


--
-- Name: giftcard_giftcard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.giftcard_giftcard_id_seq', 1, false);


--
-- Name: impersonate_impersonationlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.impersonate_impersonationlog_id_seq', 1, false);


--
-- Name: keyboard_builder_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.keyboard_builder_product_id_seq', 1, false);


--
-- Name: menu_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.menu_menu_id_seq', 2, true);


--
-- Name: menu_menuitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.menu_menuitem_id_seq', 13, true);


--
-- Name: menu_menuitemtranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.menu_menuitemtranslation_id_seq', 1, false);


--
-- Name: order_fulfillment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.order_fulfillment_id_seq', 7, true);


--
-- Name: order_fulfillmentline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.order_fulfillmentline_id_seq', 7, true);


--
-- Name: order_order_gift_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.order_order_gift_cards_id_seq', 1, false);


--
-- Name: order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.order_order_id_seq', 21, true);


--
-- Name: order_ordereditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.order_ordereditem_id_seq', 22, true);


--
-- Name: order_orderevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.order_orderevent_id_seq', 76, true);


--
-- Name: page_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.page_page_id_seq', 1, false);


--
-- Name: page_pagetranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.page_pagetranslation_id_seq', 1, false);


--
-- Name: payment_paymentmethod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.payment_paymentmethod_id_seq', 21, true);


--
-- Name: payment_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.payment_transaction_id_seq', 14, true);


--
-- Name: product_assignedproductattribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_assignedproductattribute_id_seq', 2, true);


--
-- Name: product_assignedproductattribute_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_assignedproductattribute_values_id_seq', 4, true);


--
-- Name: product_assignedvariantattribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_assignedvariantattribute_id_seq', 2, true);


--
-- Name: product_assignedvariantattribute_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_assignedvariantattribute_values_id_seq', 2, true);


--
-- Name: product_attributechoicevalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_attributechoicevalue_id_seq', 41, true);


--
-- Name: product_attributechoicevaluetranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_attributechoicevaluetranslation_id_seq', 1, false);


--
-- Name: product_attributeproduct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_attributeproduct_id_seq', 5, true);


--
-- Name: product_attributevariant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_attributevariant_id_seq', 4, true);


--
-- Name: product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_category_id_seq', 14, true);


--
-- Name: product_categorytranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_categorytranslation_id_seq', 1, false);


--
-- Name: product_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_collection_id_seq', 1, false);


--
-- Name: product_collection_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_collection_products_id_seq', 1, false);


--
-- Name: product_collectiontranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_collectiontranslation_id_seq', 1, false);


--
-- Name: product_digitalcontent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_digitalcontent_id_seq', 1, false);


--
-- Name: product_digitalcontenturl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_digitalcontenturl_id_seq', 1, false);


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_product_id_seq', 11, true);


--
-- Name: product_productattribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_productattribute_id_seq', 12, true);


--
-- Name: product_productattributetranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_productattributetranslation_id_seq', 1, false);


--
-- Name: product_productclass_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_productclass_id_seq', 4, true);


--
-- Name: product_productimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_productimage_id_seq', 67, true);


--
-- Name: product_producttranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_producttranslation_id_seq', 1, false);


--
-- Name: product_productvariant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_productvariant_id_seq', 12, true);


--
-- Name: product_productvarianttranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_productvarianttranslation_id_seq', 1, false);


--
-- Name: product_variantimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_variantimage_id_seq', 3, true);


--
-- Name: shipping_shippingmethod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.shipping_shippingmethod_id_seq', 1, true);


--
-- Name: shipping_shippingmethodtranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.shipping_shippingmethodtranslation_id_seq', 1, false);


--
-- Name: shipping_shippingzone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.shipping_shippingzone_id_seq', 1, true);


--
-- Name: site_authorizationkey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.site_authorizationkey_id_seq', 1, true);


--
-- Name: site_sitesettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.site_sitesettings_id_seq', 1, true);


--
-- Name: site_sitesettingstranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.site_sitesettingstranslation_id_seq', 1, false);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, false);


--
-- Name: userprofile_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.userprofile_address_id_seq', 44, true);


--
-- Name: userprofile_user_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.userprofile_user_addresses_id_seq', 2, true);


--
-- Name: userprofile_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.userprofile_user_groups_id_seq', 1, false);


--
-- Name: userprofile_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.userprofile_user_id_seq', 8, true);


--
-- Name: userprofile_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.userprofile_user_user_permissions_id_seq', 1, false);


--
-- Name: webhook_webhook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.webhook_webhook_id_seq', 1, false);


--
-- Name: webhook_webhookevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.webhook_webhookevent_id_seq', 1, false);


--
-- Name: account_customerevent account_customerevent_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_customerevent
    ADD CONSTRAINT account_customerevent_pkey PRIMARY KEY (id);


--
-- Name: account_customernote account_customernote_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_customernote
    ADD CONSTRAINT account_customernote_pkey PRIMARY KEY (id);


--
-- Name: account_serviceaccount_permissions account_serviceaccount_p_serviceaccount_id_permis_1686b2ab_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_serviceaccount_permissions
    ADD CONSTRAINT account_serviceaccount_p_serviceaccount_id_permis_1686b2ab_uniq UNIQUE (serviceaccount_id, permission_id);


--
-- Name: account_serviceaccount_permissions account_serviceaccount_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_serviceaccount_permissions
    ADD CONSTRAINT account_serviceaccount_permissions_pkey PRIMARY KEY (id);


--
-- Name: account_serviceaccount account_serviceaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_serviceaccount
    ADD CONSTRAINT account_serviceaccount_pkey PRIMARY KEY (id);


--
-- Name: account_serviceaccounttoken account_serviceaccounttoken_auth_token_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_serviceaccounttoken
    ADD CONSTRAINT account_serviceaccounttoken_auth_token_key UNIQUE (auth_token);


--
-- Name: account_serviceaccounttoken account_serviceaccounttoken_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_serviceaccounttoken
    ADD CONSTRAINT account_serviceaccounttoken_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: checkout_checkout cart_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_checkout
    ADD CONSTRAINT cart_cart_pkey PRIMARY KEY (token);


--
-- Name: checkout_checkoutline cart_cartline_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_checkoutline
    ADD CONSTRAINT cart_cartline_pkey PRIMARY KEY (id);


--
-- Name: checkout_checkoutline checkout_cartline_cart_id_variant_id_data_new_de3d8fca_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_checkoutline
    ADD CONSTRAINT checkout_cartline_cart_id_variant_id_data_new_de3d8fca_uniq UNIQUE (checkout_id, variant_id, data);


--
-- Name: checkout_checkout_gift_cards checkout_checkout_gift_c_checkout_id_giftcard_id_401ba79e_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_checkout_gift_cards
    ADD CONSTRAINT checkout_checkout_gift_c_checkout_id_giftcard_id_401ba79e_uniq UNIQUE (checkout_id, giftcard_id);


--
-- Name: checkout_checkout_gift_cards checkout_checkout_gift_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_checkout_gift_cards
    ADD CONSTRAINT checkout_checkout_gift_cards_pkey PRIMARY KEY (id);


--
-- Name: discount_sale_categories discount_sale_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_categories
    ADD CONSTRAINT discount_sale_categories_pkey PRIMARY KEY (id);


--
-- Name: discount_sale_categories discount_sale_categories_sale_id_category_id_be438401_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_categories
    ADD CONSTRAINT discount_sale_categories_sale_id_category_id_be438401_uniq UNIQUE (sale_id, category_id);


--
-- Name: discount_sale_collections discount_sale_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_collections
    ADD CONSTRAINT discount_sale_collections_pkey PRIMARY KEY (id);


--
-- Name: discount_sale_collections discount_sale_collections_sale_id_collection_id_01b57fc3_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_collections
    ADD CONSTRAINT discount_sale_collections_sale_id_collection_id_01b57fc3_uniq UNIQUE (sale_id, collection_id);


--
-- Name: discount_sale discount_sale_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale
    ADD CONSTRAINT discount_sale_pkey PRIMARY KEY (id);


--
-- Name: discount_sale_products discount_sale_products_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_products
    ADD CONSTRAINT discount_sale_products_pkey PRIMARY KEY (id);


--
-- Name: discount_sale_products discount_sale_products_sale_id_product_id_1c2df1f8_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_products
    ADD CONSTRAINT discount_sale_products_sale_id_product_id_1c2df1f8_uniq UNIQUE (sale_id, product_id);


--
-- Name: discount_saletranslation discount_saletranslation_language_code_sale_id_e956163f_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_saletranslation
    ADD CONSTRAINT discount_saletranslation_language_code_sale_id_e956163f_uniq UNIQUE (language_code, sale_id);


--
-- Name: discount_saletranslation discount_saletranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_saletranslation
    ADD CONSTRAINT discount_saletranslation_pkey PRIMARY KEY (id);


--
-- Name: discount_voucher_categories discount_voucher_categor_voucher_id_category_id_bb5f8954_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_categories
    ADD CONSTRAINT discount_voucher_categor_voucher_id_category_id_bb5f8954_uniq UNIQUE (voucher_id, category_id);


--
-- Name: discount_voucher_categories discount_voucher_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_categories
    ADD CONSTRAINT discount_voucher_categories_pkey PRIMARY KEY (id);


--
-- Name: discount_voucher discount_voucher_code_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher
    ADD CONSTRAINT discount_voucher_code_key UNIQUE (code);


--
-- Name: discount_voucher_collections discount_voucher_collect_voucher_id_collection_id_736b8f24_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_collections
    ADD CONSTRAINT discount_voucher_collect_voucher_id_collection_id_736b8f24_uniq UNIQUE (voucher_id, collection_id);


--
-- Name: discount_voucher_collections discount_voucher_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_collections
    ADD CONSTRAINT discount_voucher_collections_pkey PRIMARY KEY (id);


--
-- Name: discount_voucher discount_voucher_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher
    ADD CONSTRAINT discount_voucher_pkey PRIMARY KEY (id);


--
-- Name: discount_voucher_products discount_voucher_products_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_products
    ADD CONSTRAINT discount_voucher_products_pkey PRIMARY KEY (id);


--
-- Name: discount_voucher_products discount_voucher_products_voucher_id_product_id_2b092ec4_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_products
    ADD CONSTRAINT discount_voucher_products_voucher_id_product_id_2b092ec4_uniq UNIQUE (voucher_id, product_id);


--
-- Name: discount_vouchercustomer discount_vouchercustomer_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_vouchercustomer
    ADD CONSTRAINT discount_vouchercustomer_pkey PRIMARY KEY (id);


--
-- Name: discount_vouchercustomer discount_vouchercustomer_voucher_id_customer_emai_b7b1d6a1_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_vouchercustomer
    ADD CONSTRAINT discount_vouchercustomer_voucher_id_customer_emai_b7b1d6a1_uniq UNIQUE (voucher_id, customer_email);


--
-- Name: discount_vouchertranslation discount_vouchertranslat_language_code_voucher_id_af4428b5_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_vouchertranslation
    ADD CONSTRAINT discount_vouchertranslat_language_code_voucher_id_af4428b5_uniq UNIQUE (language_code, voucher_id);


--
-- Name: discount_vouchertranslation discount_vouchertranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_vouchertranslation
    ADD CONSTRAINT discount_vouchertranslation_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_prices_openexchangerates_conversionrate django_prices_openexchangerates_conversionrate_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_prices_openexchangerates_conversionrate
    ADD CONSTRAINT django_prices_openexchangerates_conversionrate_pkey PRIMARY KEY (id);


--
-- Name: django_prices_openexchangerates_conversionrate django_prices_openexchangerates_conversionrate_to_currency_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_prices_openexchangerates_conversionrate
    ADD CONSTRAINT django_prices_openexchangerates_conversionrate_to_currency_key UNIQUE (to_currency);


--
-- Name: django_prices_vatlayer_ratetypes django_prices_vatlayer_ratetypes_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_prices_vatlayer_ratetypes
    ADD CONSTRAINT django_prices_vatlayer_ratetypes_pkey PRIMARY KEY (id);


--
-- Name: django_prices_vatlayer_vat django_prices_vatlayer_vat_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_prices_vatlayer_vat
    ADD CONSTRAINT django_prices_vatlayer_vat_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: extensions_pluginconfiguration extensions_pluginconfiguration_name_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.extensions_pluginconfiguration
    ADD CONSTRAINT extensions_pluginconfiguration_name_key UNIQUE (name);


--
-- Name: extensions_pluginconfiguration extensions_pluginconfiguration_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.extensions_pluginconfiguration
    ADD CONSTRAINT extensions_pluginconfiguration_pkey PRIMARY KEY (id);


--
-- Name: giftcard_giftcard giftcard_giftcard_code_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.giftcard_giftcard
    ADD CONSTRAINT giftcard_giftcard_code_key UNIQUE (code);


--
-- Name: giftcard_giftcard giftcard_giftcard_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.giftcard_giftcard
    ADD CONSTRAINT giftcard_giftcard_pkey PRIMARY KEY (id);


--
-- Name: impersonate_impersonationlog impersonate_impersonationlog_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.impersonate_impersonationlog
    ADD CONSTRAINT impersonate_impersonationlog_pkey PRIMARY KEY (id);


--
-- Name: keyboard_builder_product keyboard_builder_product_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.keyboard_builder_product
    ADD CONSTRAINT keyboard_builder_product_pkey PRIMARY KEY (id);


--
-- Name: menu_menu menu_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menu
    ADD CONSTRAINT menu_menu_pkey PRIMARY KEY (id);


--
-- Name: menu_menuitem menu_menuitem_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menuitem
    ADD CONSTRAINT menu_menuitem_pkey PRIMARY KEY (id);


--
-- Name: menu_menuitemtranslation menu_menuitemtranslation_language_code_menu_item__508dcdd8_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menuitemtranslation
    ADD CONSTRAINT menu_menuitemtranslation_language_code_menu_item__508dcdd8_uniq UNIQUE (language_code, menu_item_id);


--
-- Name: menu_menuitemtranslation menu_menuitemtranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menuitemtranslation
    ADD CONSTRAINT menu_menuitemtranslation_pkey PRIMARY KEY (id);


--
-- Name: order_fulfillment order_fulfillment_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_fulfillment
    ADD CONSTRAINT order_fulfillment_pkey PRIMARY KEY (id);


--
-- Name: order_fulfillmentline order_fulfillmentline_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_fulfillmentline
    ADD CONSTRAINT order_fulfillmentline_pkey PRIMARY KEY (id);


--
-- Name: order_order_gift_cards order_order_gift_cards_order_id_giftcard_id_f58e7356_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_order_gift_cards
    ADD CONSTRAINT order_order_gift_cards_order_id_giftcard_id_f58e7356_uniq UNIQUE (order_id, giftcard_id);


--
-- Name: order_order_gift_cards order_order_gift_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_order_gift_cards
    ADD CONSTRAINT order_order_gift_cards_pkey PRIMARY KEY (id);


--
-- Name: order_order order_order_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_pkey PRIMARY KEY (id);


--
-- Name: order_order order_order_token_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_token_key UNIQUE (token);


--
-- Name: order_orderline order_ordereditem_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_orderline
    ADD CONSTRAINT order_ordereditem_pkey PRIMARY KEY (id);


--
-- Name: order_orderevent order_orderevent_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_orderevent
    ADD CONSTRAINT order_orderevent_pkey PRIMARY KEY (id);


--
-- Name: page_page page_page_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.page_page
    ADD CONSTRAINT page_page_pkey PRIMARY KEY (id);


--
-- Name: page_page page_page_slug_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.page_page
    ADD CONSTRAINT page_page_slug_key UNIQUE (slug);


--
-- Name: page_pagetranslation page_pagetranslation_language_code_page_id_35685962_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.page_pagetranslation
    ADD CONSTRAINT page_pagetranslation_language_code_page_id_35685962_uniq UNIQUE (language_code, page_id);


--
-- Name: page_pagetranslation page_pagetranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.page_pagetranslation
    ADD CONSTRAINT page_pagetranslation_pkey PRIMARY KEY (id);


--
-- Name: payment_payment payment_paymentmethod_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.payment_payment
    ADD CONSTRAINT payment_paymentmethod_pkey PRIMARY KEY (id);


--
-- Name: payment_transaction payment_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.payment_transaction
    ADD CONSTRAINT payment_transaction_pkey PRIMARY KEY (id);


--
-- Name: product_assignedproductattribute_values product_assignedproducta_assignedproductattribute_ee1fc0ab_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_assignedproductattribute_values
    ADD CONSTRAINT product_assignedproducta_assignedproductattribute_ee1fc0ab_uniq UNIQUE (assignedproductattribute_id, attributevalue_id);


--
-- Name: product_assignedproductattribute product_assignedproducta_product_id_assignment_id_d7f5aab5_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_assignedproductattribute
    ADD CONSTRAINT product_assignedproducta_product_id_assignment_id_d7f5aab5_uniq UNIQUE (product_id, assignment_id);


--
-- Name: product_assignedproductattribute product_assignedproductattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_assignedproductattribute
    ADD CONSTRAINT product_assignedproductattribute_pkey PRIMARY KEY (id);


--
-- Name: product_assignedproductattribute_values product_assignedproductattribute_values_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_assignedproductattribute_values
    ADD CONSTRAINT product_assignedproductattribute_values_pkey PRIMARY KEY (id);


--
-- Name: product_assignedvariantattribute_values product_assignedvarianta_assignedvariantattribute_8ffaee19_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_assignedvariantattribute_values
    ADD CONSTRAINT product_assignedvarianta_assignedvariantattribute_8ffaee19_uniq UNIQUE (assignedvariantattribute_id, attributevalue_id);


--
-- Name: product_assignedvariantattribute product_assignedvarianta_variant_id_assignment_id_16584418_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_assignedvariantattribute
    ADD CONSTRAINT product_assignedvarianta_variant_id_assignment_id_16584418_uniq UNIQUE (variant_id, assignment_id);


--
-- Name: product_assignedvariantattribute product_assignedvariantattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_assignedvariantattribute
    ADD CONSTRAINT product_assignedvariantattribute_pkey PRIMARY KEY (id);


--
-- Name: product_assignedvariantattribute_values product_assignedvariantattribute_values_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_assignedvariantattribute_values
    ADD CONSTRAINT product_assignedvariantattribute_values_pkey PRIMARY KEY (id);


--
-- Name: product_attribute product_attribute_slug_a2ba35f2_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attribute
    ADD CONSTRAINT product_attribute_slug_a2ba35f2_uniq UNIQUE (slug);


--
-- Name: product_attributevaluetranslation product_attributechoicev_language_code_attribute__9b58af18_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributevaluetranslation
    ADD CONSTRAINT product_attributechoicev_language_code_attribute__9b58af18_uniq UNIQUE (language_code, attribute_value_id);


--
-- Name: product_attributevalue product_attributechoicevalue_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributevalue
    ADD CONSTRAINT product_attributechoicevalue_pkey PRIMARY KEY (id);


--
-- Name: product_attributevaluetranslation product_attributechoicevaluetranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributevaluetranslation
    ADD CONSTRAINT product_attributechoicevaluetranslation_pkey PRIMARY KEY (id);


--
-- Name: product_attributeproduct product_attributeproduct_attribute_id_product_typ_85ea87be_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributeproduct
    ADD CONSTRAINT product_attributeproduct_attribute_id_product_typ_85ea87be_uniq UNIQUE (attribute_id, product_type_id);


--
-- Name: product_attributeproduct product_attributeproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributeproduct
    ADD CONSTRAINT product_attributeproduct_pkey PRIMARY KEY (id);


--
-- Name: product_attributevalue product_attributevalue_slug_attribute_id_a9b19472_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributevalue
    ADD CONSTRAINT product_attributevalue_slug_attribute_id_a9b19472_uniq UNIQUE (slug, attribute_id);


--
-- Name: product_attributevariant product_attributevariant_attribute_id_product_typ_304d6c95_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributevariant
    ADD CONSTRAINT product_attributevariant_attribute_id_product_typ_304d6c95_uniq UNIQUE (attribute_id, product_type_id);


--
-- Name: product_attributevariant product_attributevariant_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributevariant
    ADD CONSTRAINT product_attributevariant_pkey PRIMARY KEY (id);


--
-- Name: product_category product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (id);


--
-- Name: product_categorytranslation product_categorytranslat_language_code_category_i_f71fd11d_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_categorytranslation
    ADD CONSTRAINT product_categorytranslat_language_code_category_i_f71fd11d_uniq UNIQUE (language_code, category_id);


--
-- Name: product_categorytranslation product_categorytranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_categorytranslation
    ADD CONSTRAINT product_categorytranslation_pkey PRIMARY KEY (id);


--
-- Name: product_collection product_collection_name_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collection
    ADD CONSTRAINT product_collection_name_key UNIQUE (name);


--
-- Name: product_collection product_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collection
    ADD CONSTRAINT product_collection_pkey PRIMARY KEY (id);


--
-- Name: product_collectionproduct product_collection_products_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collectionproduct
    ADD CONSTRAINT product_collection_products_pkey PRIMARY KEY (id);


--
-- Name: product_collectionproduct product_collectionproduc_collection_id_product_id_e582d799_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collectionproduct
    ADD CONSTRAINT product_collectionproduc_collection_id_product_id_e582d799_uniq UNIQUE (collection_id, product_id);


--
-- Name: product_collectiontranslation product_collectiontransl_language_code_collection_b1200cd5_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collectiontranslation
    ADD CONSTRAINT product_collectiontransl_language_code_collection_b1200cd5_uniq UNIQUE (language_code, collection_id);


--
-- Name: product_collectiontranslation product_collectiontranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collectiontranslation
    ADD CONSTRAINT product_collectiontranslation_pkey PRIMARY KEY (id);


--
-- Name: product_digitalcontent product_digitalcontent_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_digitalcontent
    ADD CONSTRAINT product_digitalcontent_pkey PRIMARY KEY (id);


--
-- Name: product_digitalcontent product_digitalcontent_product_variant_id_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_digitalcontent
    ADD CONSTRAINT product_digitalcontent_product_variant_id_key UNIQUE (product_variant_id);


--
-- Name: product_digitalcontenturl product_digitalcontenturl_line_id_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_digitalcontenturl
    ADD CONSTRAINT product_digitalcontenturl_line_id_key UNIQUE (line_id);


--
-- Name: product_digitalcontenturl product_digitalcontenturl_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_digitalcontenturl
    ADD CONSTRAINT product_digitalcontenturl_pkey PRIMARY KEY (id);


--
-- Name: product_digitalcontenturl product_digitalcontenturl_token_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_digitalcontenturl
    ADD CONSTRAINT product_digitalcontenturl_token_key UNIQUE (token);


--
-- Name: product_product product_product_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_pkey PRIMARY KEY (id);


--
-- Name: product_attributetranslation product_productattribute_language_code_product_at_58451db2_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributetranslation
    ADD CONSTRAINT product_productattribute_language_code_product_at_58451db2_uniq UNIQUE (language_code, attribute_id);


--
-- Name: product_attribute product_productattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attribute
    ADD CONSTRAINT product_productattribute_pkey PRIMARY KEY (id);


--
-- Name: product_attributetranslation product_productattributetranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributetranslation
    ADD CONSTRAINT product_productattributetranslation_pkey PRIMARY KEY (id);


--
-- Name: product_producttype product_productclass_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_producttype
    ADD CONSTRAINT product_productclass_pkey PRIMARY KEY (id);


--
-- Name: product_productimage product_productimage_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productimage
    ADD CONSTRAINT product_productimage_pkey PRIMARY KEY (id);


--
-- Name: product_producttranslation product_producttranslati_language_code_product_id_b06ba774_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_producttranslation
    ADD CONSTRAINT product_producttranslati_language_code_product_id_b06ba774_uniq UNIQUE (language_code, product_id);


--
-- Name: product_producttranslation product_producttranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_producttranslation
    ADD CONSTRAINT product_producttranslation_pkey PRIMARY KEY (id);


--
-- Name: product_productvariant product_productvariant_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productvariant
    ADD CONSTRAINT product_productvariant_pkey PRIMARY KEY (id);


--
-- Name: product_productvariant product_productvariant_sku_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productvariant
    ADD CONSTRAINT product_productvariant_sku_key UNIQUE (sku);


--
-- Name: product_productvarianttranslation product_productvarianttr_language_code_product_va_cf16d8d0_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productvarianttranslation
    ADD CONSTRAINT product_productvarianttr_language_code_product_va_cf16d8d0_uniq UNIQUE (language_code, product_variant_id);


--
-- Name: product_productvarianttranslation product_productvarianttranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productvarianttranslation
    ADD CONSTRAINT product_productvarianttranslation_pkey PRIMARY KEY (id);


--
-- Name: product_variantimage product_variantimage_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_variantimage
    ADD CONSTRAINT product_variantimage_pkey PRIMARY KEY (id);


--
-- Name: shipping_shippingmethod shipping_shippingmethod_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.shipping_shippingmethod
    ADD CONSTRAINT shipping_shippingmethod_pkey PRIMARY KEY (id);


--
-- Name: shipping_shippingmethodtranslation shipping_shippingmethodt_language_code_shipping_m_70e4f786_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.shipping_shippingmethodtranslation
    ADD CONSTRAINT shipping_shippingmethodt_language_code_shipping_m_70e4f786_uniq UNIQUE (language_code, shipping_method_id);


--
-- Name: shipping_shippingmethodtranslation shipping_shippingmethodtranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.shipping_shippingmethodtranslation
    ADD CONSTRAINT shipping_shippingmethodtranslation_pkey PRIMARY KEY (id);


--
-- Name: shipping_shippingzone shipping_shippingzone_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.shipping_shippingzone
    ADD CONSTRAINT shipping_shippingzone_pkey PRIMARY KEY (id);


--
-- Name: site_authorizationkey site_authorizationkey_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_authorizationkey
    ADD CONSTRAINT site_authorizationkey_pkey PRIMARY KEY (id);


--
-- Name: site_authorizationkey site_authorizationkey_site_settings_id_name_c5f8d1e6_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_authorizationkey
    ADD CONSTRAINT site_authorizationkey_site_settings_id_name_c5f8d1e6_uniq UNIQUE (site_settings_id, name);


--
-- Name: site_sitesettings site_sitesettings_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettings
    ADD CONSTRAINT site_sitesettings_pkey PRIMARY KEY (id);


--
-- Name: site_sitesettings site_sitesettings_site_id_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettings
    ADD CONSTRAINT site_sitesettings_site_id_key UNIQUE (site_id);


--
-- Name: site_sitesettingstranslation site_sitesettingstransla_language_code_site_setti_e767d9e7_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettingstranslation
    ADD CONSTRAINT site_sitesettingstransla_language_code_site_setti_e767d9e7_uniq UNIQUE (language_code, site_settings_id);


--
-- Name: site_sitesettingstranslation site_sitesettingstranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettingstranslation
    ADD CONSTRAINT site_sitesettingstranslation_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: account_address userprofile_address_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_address
    ADD CONSTRAINT userprofile_address_pkey PRIMARY KEY (id);


--
-- Name: account_user_addresses userprofile_user_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_addresses
    ADD CONSTRAINT userprofile_user_addresses_pkey PRIMARY KEY (id);


--
-- Name: account_user_addresses userprofile_user_addresses_user_id_address_id_6cb87bcc_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_addresses
    ADD CONSTRAINT userprofile_user_addresses_user_id_address_id_6cb87bcc_uniq UNIQUE (user_id, address_id);


--
-- Name: account_user userprofile_user_email_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT userprofile_user_email_key UNIQUE (email);


--
-- Name: account_user_groups userprofile_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT userprofile_user_groups_pkey PRIMARY KEY (id);


--
-- Name: account_user_groups userprofile_user_groups_user_id_group_id_90ce1781_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT userprofile_user_groups_user_id_group_id_90ce1781_uniq UNIQUE (user_id, group_id);


--
-- Name: account_user userprofile_user_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT userprofile_user_pkey PRIMARY KEY (id);


--
-- Name: account_user_user_permissions userprofile_user_user_pe_user_id_permission_id_706d65c8_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT userprofile_user_user_pe_user_id_permission_id_706d65c8_uniq UNIQUE (user_id, permission_id);


--
-- Name: account_user_user_permissions userprofile_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT userprofile_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: webhook_webhook webhook_webhook_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.webhook_webhook
    ADD CONSTRAINT webhook_webhook_pkey PRIMARY KEY (id);


--
-- Name: webhook_webhookevent webhook_webhookevent_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.webhook_webhookevent
    ADD CONSTRAINT webhook_webhookevent_pkey PRIMARY KEY (id);


--
-- Name: account_customerevent_order_id_2d6e2d20; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX account_customerevent_order_id_2d6e2d20 ON public.account_customerevent USING btree (order_id);


--
-- Name: account_customerevent_user_id_b3d6ec36; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX account_customerevent_user_id_b3d6ec36 ON public.account_customerevent USING btree (user_id);


--
-- Name: account_customernote_customer_id_ec50cbf6; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX account_customernote_customer_id_ec50cbf6 ON public.account_customernote USING btree (customer_id);


--
-- Name: account_customernote_date_231c3474; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX account_customernote_date_231c3474 ON public.account_customernote USING btree (date);


--
-- Name: account_customernote_user_id_b10a6c14; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX account_customernote_user_id_b10a6c14 ON public.account_customernote USING btree (user_id);


--
-- Name: account_serviceaccount_permissions_permission_id_449791f0; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX account_serviceaccount_permissions_permission_id_449791f0 ON public.account_serviceaccount_permissions USING btree (permission_id);


--
-- Name: account_serviceaccount_permissions_serviceaccount_id_ec78f497; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX account_serviceaccount_permissions_serviceaccount_id_ec78f497 ON public.account_serviceaccount_permissions USING btree (serviceaccount_id);


--
-- Name: account_serviceaccounttoken_auth_token_e4c38601_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX account_serviceaccounttoken_auth_token_e4c38601_like ON public.account_serviceaccounttoken USING btree (auth_token varchar_pattern_ops);


--
-- Name: account_serviceaccounttoken_service_account_id_a8e6dee8; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX account_serviceaccounttoken_service_account_id_a8e6dee8 ON public.account_serviceaccounttoken USING btree (service_account_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: cart_cart_billing_address_id_9eb62ddd; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX cart_cart_billing_address_id_9eb62ddd ON public.checkout_checkout USING btree (billing_address_id);


--
-- Name: cart_cart_shipping_address_id_adfddaf9; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX cart_cart_shipping_address_id_adfddaf9 ON public.checkout_checkout USING btree (shipping_address_id);


--
-- Name: cart_cart_shipping_method_id_835c02e0; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX cart_cart_shipping_method_id_835c02e0 ON public.checkout_checkout USING btree (shipping_method_id);


--
-- Name: cart_cart_user_id_9b4220b9; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX cart_cart_user_id_9b4220b9 ON public.checkout_checkout USING btree (user_id);


--
-- Name: cart_cartline_cart_id_c7b9981e; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX cart_cartline_cart_id_c7b9981e ON public.checkout_checkoutline USING btree (checkout_id);


--
-- Name: cart_cartline_product_id_1a54130f; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX cart_cartline_product_id_1a54130f ON public.checkout_checkoutline USING btree (variant_id);


--
-- Name: checkout_checkout_gift_cards_checkout_id_e314728d; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX checkout_checkout_gift_cards_checkout_id_e314728d ON public.checkout_checkout_gift_cards USING btree (checkout_id);


--
-- Name: checkout_checkout_gift_cards_giftcard_id_f5994462; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX checkout_checkout_gift_cards_giftcard_id_f5994462 ON public.checkout_checkout_gift_cards USING btree (giftcard_id);


--
-- Name: discount_sale_categories_category_id_64e132af; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_sale_categories_category_id_64e132af ON public.discount_sale_categories USING btree (category_id);


--
-- Name: discount_sale_categories_sale_id_2aeee4a7; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_sale_categories_sale_id_2aeee4a7 ON public.discount_sale_categories USING btree (sale_id);


--
-- Name: discount_sale_collections_collection_id_f66df9d7; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_sale_collections_collection_id_f66df9d7 ON public.discount_sale_collections USING btree (collection_id);


--
-- Name: discount_sale_collections_sale_id_a912da4a; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_sale_collections_sale_id_a912da4a ON public.discount_sale_collections USING btree (sale_id);


--
-- Name: discount_sale_products_product_id_d42c9636; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_sale_products_product_id_d42c9636 ON public.discount_sale_products USING btree (product_id);


--
-- Name: discount_sale_products_sale_id_10e3a20f; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_sale_products_sale_id_10e3a20f ON public.discount_sale_products USING btree (sale_id);


--
-- Name: discount_saletranslation_sale_id_36a69b0a; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_saletranslation_sale_id_36a69b0a ON public.discount_saletranslation USING btree (sale_id);


--
-- Name: discount_voucher_categories_category_id_fc9d044a; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_voucher_categories_category_id_fc9d044a ON public.discount_voucher_categories USING btree (category_id);


--
-- Name: discount_voucher_categories_voucher_id_19a56338; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_voucher_categories_voucher_id_19a56338 ON public.discount_voucher_categories USING btree (voucher_id);


--
-- Name: discount_voucher_code_ff8dc52c_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_voucher_code_ff8dc52c_like ON public.discount_voucher USING btree (code varchar_pattern_ops);


--
-- Name: discount_voucher_collections_collection_id_b9de6b54; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_voucher_collections_collection_id_b9de6b54 ON public.discount_voucher_collections USING btree (collection_id);


--
-- Name: discount_voucher_collections_voucher_id_4ce1fde3; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_voucher_collections_voucher_id_4ce1fde3 ON public.discount_voucher_collections USING btree (voucher_id);


--
-- Name: discount_voucher_products_product_id_4a3131ff; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_voucher_products_product_id_4a3131ff ON public.discount_voucher_products USING btree (product_id);


--
-- Name: discount_voucher_products_voucher_id_8a2e6c3a; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_voucher_products_voucher_id_8a2e6c3a ON public.discount_voucher_products USING btree (voucher_id);


--
-- Name: discount_vouchercustomer_voucher_id_bb55c04f; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_vouchercustomer_voucher_id_bb55c04f ON public.discount_vouchercustomer USING btree (voucher_id);


--
-- Name: discount_vouchertranslation_voucher_id_288246a9; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_vouchertranslation_voucher_id_288246a9 ON public.discount_vouchertranslation USING btree (voucher_id);


--
-- Name: django_prices_openexchan_to_currency_92c4a4e1_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX django_prices_openexchan_to_currency_92c4a4e1_like ON public.django_prices_openexchangerates_conversionrate USING btree (to_currency varchar_pattern_ops);


--
-- Name: django_prices_vatlayer_vat_country_code_858b2cc4; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX django_prices_vatlayer_vat_country_code_858b2cc4 ON public.django_prices_vatlayer_vat USING btree (country_code);


--
-- Name: django_prices_vatlayer_vat_country_code_858b2cc4_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX django_prices_vatlayer_vat_country_code_858b2cc4_like ON public.django_prices_vatlayer_vat USING btree (country_code varchar_pattern_ops);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: extensions_pluginconfiguration_name_ae3110fb_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX extensions_pluginconfiguration_name_ae3110fb_like ON public.extensions_pluginconfiguration USING btree (name varchar_pattern_ops);


--
-- Name: giftcard_giftcard_code_f6fb6be8_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX giftcard_giftcard_code_f6fb6be8_like ON public.giftcard_giftcard USING btree (code varchar_pattern_ops);


--
-- Name: giftcard_giftcard_user_id_ce2401b5; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX giftcard_giftcard_user_id_ce2401b5 ON public.giftcard_giftcard USING btree (user_id);


--
-- Name: impersonate_impersonationlog_impersonating_id_afd114fc; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX impersonate_impersonationlog_impersonating_id_afd114fc ON public.impersonate_impersonationlog USING btree (impersonating_id);


--
-- Name: impersonate_impersonationlog_impersonator_id_1ecfe8ce; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX impersonate_impersonationlog_impersonator_id_1ecfe8ce ON public.impersonate_impersonationlog USING btree (impersonator_id);


--
-- Name: menu_menuitem_category_id_af353a3b; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX menu_menuitem_category_id_af353a3b ON public.menu_menuitem USING btree (category_id);


--
-- Name: menu_menuitem_collection_id_b913b19e; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX menu_menuitem_collection_id_b913b19e ON public.menu_menuitem USING btree (collection_id);


--
-- Name: menu_menuitem_menu_id_f466b139; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX menu_menuitem_menu_id_f466b139 ON public.menu_menuitem USING btree (menu_id);


--
-- Name: menu_menuitem_page_id_a0c8f92d; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX menu_menuitem_page_id_a0c8f92d ON public.menu_menuitem USING btree (page_id);


--
-- Name: menu_menuitem_parent_id_439f55a5; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX menu_menuitem_parent_id_439f55a5 ON public.menu_menuitem USING btree (parent_id);


--
-- Name: menu_menuitem_sort_order_f96ed184; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX menu_menuitem_sort_order_f96ed184 ON public.menu_menuitem USING btree (sort_order);


--
-- Name: menu_menuitem_tree_id_0d2e9c9a; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX menu_menuitem_tree_id_0d2e9c9a ON public.menu_menuitem USING btree (tree_id);


--
-- Name: menu_menuitemtranslation_menu_item_id_3445926c; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX menu_menuitemtranslation_menu_item_id_3445926c ON public.menu_menuitemtranslation USING btree (menu_item_id);


--
-- Name: order_fulfillment_order_id_02695111; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_fulfillment_order_id_02695111 ON public.order_fulfillment USING btree (order_id);


--
-- Name: order_fulfillmentline_fulfillment_id_68f3291d; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_fulfillmentline_fulfillment_id_68f3291d ON public.order_fulfillmentline USING btree (fulfillment_id);


--
-- Name: order_fulfillmentline_order_line_id_7d40e054; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_fulfillmentline_order_line_id_7d40e054 ON public.order_fulfillmentline USING btree (order_line_id);


--
-- Name: order_order_billing_address_id_8fe537cf; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_order_billing_address_id_8fe537cf ON public.order_order USING btree (billing_address_id);


--
-- Name: order_order_gift_cards_giftcard_id_f6844926; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_order_gift_cards_giftcard_id_f6844926 ON public.order_order_gift_cards USING btree (giftcard_id);


--
-- Name: order_order_gift_cards_order_id_ce5608c4; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_order_gift_cards_order_id_ce5608c4 ON public.order_order_gift_cards USING btree (order_id);


--
-- Name: order_order_shipping_address_id_57e64931; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_order_shipping_address_id_57e64931 ON public.order_order USING btree (shipping_address_id);


--
-- Name: order_order_shipping_method_id_2a742834; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_order_shipping_method_id_2a742834 ON public.order_order USING btree (shipping_method_id);


--
-- Name: order_order_token_ddb7fb7b_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_order_token_ddb7fb7b_like ON public.order_order USING btree (token varchar_pattern_ops);


--
-- Name: order_order_user_id_7cf9bc2b; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_order_user_id_7cf9bc2b ON public.order_order USING btree (user_id);


--
-- Name: order_order_voucher_id_0748ca22; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_order_voucher_id_0748ca22 ON public.order_order USING btree (voucher_id);


--
-- Name: order_orderevent_order_id_09aa7ccd; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_orderevent_order_id_09aa7ccd ON public.order_orderevent USING btree (order_id);


--
-- Name: order_orderevent_user_id_1056ac9c; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_orderevent_user_id_1056ac9c ON public.order_orderevent USING btree (user_id);


--
-- Name: order_orderline_order_id_eb04ec2d; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_orderline_order_id_eb04ec2d ON public.order_orderline USING btree (order_id);


--
-- Name: order_orderline_variant_id_866774cb; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_orderline_variant_id_866774cb ON public.order_orderline USING btree (variant_id);


--
-- Name: page_page_slug_d6b7c8ed_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX page_page_slug_d6b7c8ed_like ON public.page_page USING btree (slug varchar_pattern_ops);


--
-- Name: page_pagetranslation_page_id_60216ef5; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX page_pagetranslation_page_id_60216ef5 ON public.page_pagetranslation USING btree (page_id);


--
-- Name: payment_paymentmethod_checkout_id_5c0aae3d; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX payment_paymentmethod_checkout_id_5c0aae3d ON public.payment_payment USING btree (checkout_id);


--
-- Name: payment_paymentmethod_order_id_58acb979; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX payment_paymentmethod_order_id_58acb979 ON public.payment_payment USING btree (order_id);


--
-- Name: payment_transaction_payment_method_id_d35e75c1; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX payment_transaction_payment_method_id_d35e75c1 ON public.payment_transaction USING btree (payment_id);


--
-- Name: product_assignedproductatt_assignedproductattribute_i_6d497dfa; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_assignedproductatt_assignedproductattribute_i_6d497dfa ON public.product_assignedproductattribute_values USING btree (assignedproductattribute_id);


--
-- Name: product_assignedproductatt_attributevalue_id_5bd29b24; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_assignedproductatt_attributevalue_id_5bd29b24 ON public.product_assignedproductattribute_values USING btree (attributevalue_id);


--
-- Name: product_assignedproductattribute_assignment_id_eb2f81a4; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_assignedproductattribute_assignment_id_eb2f81a4 ON public.product_assignedproductattribute USING btree (assignment_id);


--
-- Name: product_assignedproductattribute_product_id_68be10a3; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_assignedproductattribute_product_id_68be10a3 ON public.product_assignedproductattribute USING btree (product_id);


--
-- Name: product_assignedvariantatt_assignedvariantattribute_i_8d6d62ef; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_assignedvariantatt_assignedvariantattribute_i_8d6d62ef ON public.product_assignedvariantattribute_values USING btree (assignedvariantattribute_id);


--
-- Name: product_assignedvariantatt_attributevalue_id_41cc2454; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_assignedvariantatt_attributevalue_id_41cc2454 ON public.product_assignedvariantattribute_values USING btree (attributevalue_id);


--
-- Name: product_assignedvariantattribute_assignment_id_8fdbffe8; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_assignedvariantattribute_assignment_id_8fdbffe8 ON public.product_assignedvariantattribute USING btree (assignment_id);


--
-- Name: product_assignedvariantattribute_variant_id_27483e6a; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_assignedvariantattribute_variant_id_27483e6a ON public.product_assignedvariantattribute USING btree (variant_id);


--
-- Name: product_attribute_slug_a2ba35f2_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_attribute_slug_a2ba35f2_like ON public.product_attribute USING btree (slug varchar_pattern_ops);


--
-- Name: product_attributechoiceval_attribute_choice_value_id_71c4c0a7; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_attributechoiceval_attribute_choice_value_id_71c4c0a7 ON public.product_attributevaluetranslation USING btree (attribute_value_id);


--
-- Name: product_attributechoicevalue_attribute_id_c28c6c92; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_attributechoicevalue_attribute_id_c28c6c92 ON public.product_attributevalue USING btree (attribute_id);


--
-- Name: product_attributechoicevalue_slug_e0d2d25b; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_attributechoicevalue_slug_e0d2d25b ON public.product_attributevalue USING btree (slug);


--
-- Name: product_attributechoicevalue_slug_e0d2d25b_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_attributechoicevalue_slug_e0d2d25b_like ON public.product_attributevalue USING btree (slug varchar_pattern_ops);


--
-- Name: product_attributechoicevalue_sort_order_c4c071c4; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_attributechoicevalue_sort_order_c4c071c4 ON public.product_attributevalue USING btree (sort_order);


--
-- Name: product_attributeproduct_attribute_id_0051c706; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_attributeproduct_attribute_id_0051c706 ON public.product_attributeproduct USING btree (attribute_id);


--
-- Name: product_attributeproduct_product_type_id_54357b3b; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_attributeproduct_product_type_id_54357b3b ON public.product_attributeproduct USING btree (product_type_id);


--
-- Name: product_attributeproduct_sort_order_cec8a8e2; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_attributeproduct_sort_order_cec8a8e2 ON public.product_attributeproduct USING btree (sort_order);


--
-- Name: product_attributevariant_attribute_id_e47d3bc3; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_attributevariant_attribute_id_e47d3bc3 ON public.product_attributevariant USING btree (attribute_id);


--
-- Name: product_attributevariant_product_type_id_ba95c6dd; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_attributevariant_product_type_id_ba95c6dd ON public.product_attributevariant USING btree (product_type_id);


--
-- Name: product_attributevariant_sort_order_cf4b00ef; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_attributevariant_sort_order_cf4b00ef ON public.product_attributevariant USING btree (sort_order);


--
-- Name: product_category_parent_id_f6860923; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_category_parent_id_f6860923 ON public.product_category USING btree (parent_id);


--
-- Name: product_category_slug_e1f8ccc4; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_category_slug_e1f8ccc4 ON public.product_category USING btree (slug);


--
-- Name: product_category_slug_e1f8ccc4_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_category_slug_e1f8ccc4_like ON public.product_category USING btree (slug varchar_pattern_ops);


--
-- Name: product_category_tree_id_f3c46461; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_category_tree_id_f3c46461 ON public.product_category USING btree (tree_id);


--
-- Name: product_categorytranslation_category_id_aa8d0917; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_categorytranslation_category_id_aa8d0917 ON public.product_categorytranslation USING btree (category_id);


--
-- Name: product_collection_name_03bb818b_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_collection_name_03bb818b_like ON public.product_collection USING btree (name varchar_pattern_ops);


--
-- Name: product_collection_products_collection_id_0bc817dc; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_collection_products_collection_id_0bc817dc ON public.product_collectionproduct USING btree (collection_id);


--
-- Name: product_collection_products_product_id_a45a5b06; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_collection_products_product_id_a45a5b06 ON public.product_collectionproduct USING btree (product_id);


--
-- Name: product_collection_slug_ec186116; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_collection_slug_ec186116 ON public.product_collection USING btree (slug);


--
-- Name: product_collection_slug_ec186116_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_collection_slug_ec186116_like ON public.product_collection USING btree (slug varchar_pattern_ops);


--
-- Name: product_collectionproduct_sort_order_5e7b55bb; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_collectionproduct_sort_order_5e7b55bb ON public.product_collectionproduct USING btree (sort_order);


--
-- Name: product_collectiontranslation_collection_id_cfbbd453; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_collectiontranslation_collection_id_cfbbd453 ON public.product_collectiontranslation USING btree (collection_id);


--
-- Name: product_digitalcontenturl_content_id_654197bd; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_digitalcontenturl_content_id_654197bd ON public.product_digitalcontenturl USING btree (content_id);


--
-- Name: product_product_category_id_0c725779; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_product_category_id_0c725779 ON public.product_product USING btree (category_id);


--
-- Name: product_product_product_class_id_0547c998; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_product_product_class_id_0547c998 ON public.product_product USING btree (product_type_id);


--
-- Name: product_productattributetr_product_attribute_id_56b48511; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_productattributetr_product_attribute_id_56b48511 ON public.product_attributetranslation USING btree (attribute_id);


--
-- Name: product_productimage_product_id_544084bb; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_productimage_product_id_544084bb ON public.product_productimage USING btree (product_id);


--
-- Name: product_productimage_sort_order_dfda9c19; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_productimage_sort_order_dfda9c19 ON public.product_productimage USING btree (sort_order);


--
-- Name: product_producttranslation_product_id_2c2c7532; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_producttranslation_product_id_2c2c7532 ON public.product_producttranslation USING btree (product_id);


--
-- Name: product_productvariant_product_id_43c5a310; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_productvariant_product_id_43c5a310 ON public.product_productvariant USING btree (product_id);


--
-- Name: product_productvariant_sku_50706818_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_productvariant_sku_50706818_like ON public.product_productvariant USING btree (sku varchar_pattern_ops);


--
-- Name: product_productvarianttranslation_product_variant_id_1b144a85; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_productvarianttranslation_product_variant_id_1b144a85 ON public.product_productvarianttranslation USING btree (product_variant_id);


--
-- Name: product_variantimage_image_id_bef14106; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_variantimage_image_id_bef14106 ON public.product_variantimage USING btree (image_id);


--
-- Name: product_variantimage_variant_id_81123814; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_variantimage_variant_id_81123814 ON public.product_variantimage USING btree (variant_id);


--
-- Name: shipping_shippingmethod_shipping_zone_id_265b7413; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX shipping_shippingmethod_shipping_zone_id_265b7413 ON public.shipping_shippingmethod USING btree (shipping_zone_id);


--
-- Name: shipping_shippingmethodtranslation_shipping_method_id_31d925d2; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX shipping_shippingmethodtranslation_shipping_method_id_31d925d2 ON public.shipping_shippingmethodtranslation USING btree (shipping_method_id);


--
-- Name: site_authorizationkey_site_settings_id_d8397c0f; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX site_authorizationkey_site_settings_id_d8397c0f ON public.site_authorizationkey USING btree (site_settings_id);


--
-- Name: site_sitesettings_bottom_menu_id_e2a78098; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX site_sitesettings_bottom_menu_id_e2a78098 ON public.site_sitesettings USING btree (bottom_menu_id);


--
-- Name: site_sitesettings_company_address_id_f0825427; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX site_sitesettings_company_address_id_f0825427 ON public.site_sitesettings USING btree (company_address_id);


--
-- Name: site_sitesettings_homepage_collection_id_82f45d33; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX site_sitesettings_homepage_collection_id_82f45d33 ON public.site_sitesettings USING btree (homepage_collection_id);


--
-- Name: site_sitesettings_top_menu_id_ab6f8c46; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX site_sitesettings_top_menu_id_ab6f8c46 ON public.site_sitesettings USING btree (top_menu_id);


--
-- Name: site_sitesettingstranslation_site_settings_id_ca085ff6; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX site_sitesettingstranslation_site_settings_id_ca085ff6 ON public.site_sitesettingstranslation USING btree (site_settings_id);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: userprofile_user_addresses_address_id_ad7646b4; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX userprofile_user_addresses_address_id_ad7646b4 ON public.account_user_addresses USING btree (address_id);


--
-- Name: userprofile_user_addresses_user_id_bb5aa55e; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX userprofile_user_addresses_user_id_bb5aa55e ON public.account_user_addresses USING btree (user_id);


--
-- Name: userprofile_user_default_billing_address_id_0489abf1; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX userprofile_user_default_billing_address_id_0489abf1 ON public.account_user USING btree (default_billing_address_id);


--
-- Name: userprofile_user_default_shipping_address_id_aae7a203; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX userprofile_user_default_shipping_address_id_aae7a203 ON public.account_user USING btree (default_shipping_address_id);


--
-- Name: userprofile_user_email_b0fb0137_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX userprofile_user_email_b0fb0137_like ON public.account_user USING btree (email varchar_pattern_ops);


--
-- Name: userprofile_user_groups_group_id_c7eec74e; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX userprofile_user_groups_group_id_c7eec74e ON public.account_user_groups USING btree (group_id);


--
-- Name: userprofile_user_groups_user_id_5e712a24; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX userprofile_user_groups_user_id_5e712a24 ON public.account_user_groups USING btree (user_id);


--
-- Name: userprofile_user_user_permissions_permission_id_1caa8a71; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX userprofile_user_user_permissions_permission_id_1caa8a71 ON public.account_user_user_permissions USING btree (permission_id);


--
-- Name: userprofile_user_user_permissions_user_id_6d654469; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX userprofile_user_user_permissions_user_id_6d654469 ON public.account_user_user_permissions USING btree (user_id);


--
-- Name: webhook_webhook_service_account_id_1073b057; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX webhook_webhook_service_account_id_1073b057 ON public.webhook_webhook USING btree (service_account_id);


--
-- Name: webhook_webhookevent_event_type_cd6b8c13; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX webhook_webhookevent_event_type_cd6b8c13 ON public.webhook_webhookevent USING btree (event_type);


--
-- Name: webhook_webhookevent_event_type_cd6b8c13_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX webhook_webhookevent_event_type_cd6b8c13_like ON public.webhook_webhookevent USING btree (event_type varchar_pattern_ops);


--
-- Name: webhook_webhookevent_webhook_id_73b5c9e1; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX webhook_webhookevent_webhook_id_73b5c9e1 ON public.webhook_webhookevent USING btree (webhook_id);


--
-- Name: account_customerevent account_customerevent_order_id_2d6e2d20_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_customerevent
    ADD CONSTRAINT account_customerevent_order_id_2d6e2d20_fk_order_order_id FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_customerevent account_customerevent_user_id_b3d6ec36_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_customerevent
    ADD CONSTRAINT account_customerevent_user_id_b3d6ec36_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_customernote account_customernote_customer_id_ec50cbf6_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_customernote
    ADD CONSTRAINT account_customernote_customer_id_ec50cbf6_fk_account_user_id FOREIGN KEY (customer_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_customernote account_customernote_user_id_b10a6c14_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_customernote
    ADD CONSTRAINT account_customernote_user_id_b10a6c14_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_serviceaccount_permissions account_serviceaccou_permission_id_449791f0_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_serviceaccount_permissions
    ADD CONSTRAINT account_serviceaccou_permission_id_449791f0_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_serviceaccounttoken account_serviceaccou_service_account_id_a8e6dee8_fk_account_s; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_serviceaccounttoken
    ADD CONSTRAINT account_serviceaccou_service_account_id_a8e6dee8_fk_account_s FOREIGN KEY (service_account_id) REFERENCES public.account_serviceaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_serviceaccount_permissions account_serviceaccou_serviceaccount_id_ec78f497_fk_account_s; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_serviceaccount_permissions
    ADD CONSTRAINT account_serviceaccou_serviceaccount_id_ec78f497_fk_account_s FOREIGN KEY (serviceaccount_id) REFERENCES public.account_serviceaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_addresses account_user_address_address_id_d218822a_fk_account_a; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_addresses
    ADD CONSTRAINT account_user_address_address_id_d218822a_fk_account_a FOREIGN KEY (address_id) REFERENCES public.account_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_addresses account_user_addresses_user_id_2fcc8301_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_addresses
    ADD CONSTRAINT account_user_addresses_user_id_2fcc8301_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: checkout_checkout cart_cart_billing_address_id_9eb62ddd_fk_account_address_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_checkout
    ADD CONSTRAINT cart_cart_billing_address_id_9eb62ddd_fk_account_address_id FOREIGN KEY (billing_address_id) REFERENCES public.account_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: checkout_checkout cart_cart_shipping_address_id_adfddaf9_fk_account_address_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_checkout
    ADD CONSTRAINT cart_cart_shipping_address_id_adfddaf9_fk_account_address_id FOREIGN KEY (shipping_address_id) REFERENCES public.account_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: checkout_checkoutline cart_cartline_variant_id_dbca56c9_fk_product_productvariant_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_checkoutline
    ADD CONSTRAINT cart_cartline_variant_id_dbca56c9_fk_product_productvariant_id FOREIGN KEY (variant_id) REFERENCES public.product_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: checkout_checkoutline checkout_cartline_checkout_id_41d95a5d_fk_checkout_; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_checkoutline
    ADD CONSTRAINT checkout_cartline_checkout_id_41d95a5d_fk_checkout_ FOREIGN KEY (checkout_id) REFERENCES public.checkout_checkout(token) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: checkout_checkout_gift_cards checkout_checkout_gi_checkout_id_e314728d_fk_checkout_; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_checkout_gift_cards
    ADD CONSTRAINT checkout_checkout_gi_checkout_id_e314728d_fk_checkout_ FOREIGN KEY (checkout_id) REFERENCES public.checkout_checkout(token) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: checkout_checkout_gift_cards checkout_checkout_gi_giftcard_id_f5994462_fk_giftcard_; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_checkout_gift_cards
    ADD CONSTRAINT checkout_checkout_gi_giftcard_id_f5994462_fk_giftcard_ FOREIGN KEY (giftcard_id) REFERENCES public.giftcard_giftcard(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: checkout_checkout checkout_checkout_shipping_method_id_8796abd0_fk_shipping_; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_checkout
    ADD CONSTRAINT checkout_checkout_shipping_method_id_8796abd0_fk_shipping_ FOREIGN KEY (shipping_method_id) REFERENCES public.shipping_shippingmethod(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: checkout_checkout checkout_checkout_user_id_8b2fe298_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_checkout
    ADD CONSTRAINT checkout_checkout_user_id_8b2fe298_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_sale_categories discount_sale_catego_category_id_64e132af_fk_product_c; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_categories
    ADD CONSTRAINT discount_sale_catego_category_id_64e132af_fk_product_c FOREIGN KEY (category_id) REFERENCES public.product_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_sale_categories discount_sale_categories_sale_id_2aeee4a7_fk_discount_sale_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_categories
    ADD CONSTRAINT discount_sale_categories_sale_id_2aeee4a7_fk_discount_sale_id FOREIGN KEY (sale_id) REFERENCES public.discount_sale(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_sale_collections discount_sale_collec_collection_id_f66df9d7_fk_product_c; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_collections
    ADD CONSTRAINT discount_sale_collec_collection_id_f66df9d7_fk_product_c FOREIGN KEY (collection_id) REFERENCES public.product_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_sale_collections discount_sale_collections_sale_id_a912da4a_fk_discount_sale_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_collections
    ADD CONSTRAINT discount_sale_collections_sale_id_a912da4a_fk_discount_sale_id FOREIGN KEY (sale_id) REFERENCES public.discount_sale(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_sale_products discount_sale_produc_product_id_d42c9636_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_products
    ADD CONSTRAINT discount_sale_produc_product_id_d42c9636_fk_product_p FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_sale_products discount_sale_products_sale_id_10e3a20f_fk_discount_sale_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_products
    ADD CONSTRAINT discount_sale_products_sale_id_10e3a20f_fk_discount_sale_id FOREIGN KEY (sale_id) REFERENCES public.discount_sale(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_saletranslation discount_saletranslation_sale_id_36a69b0a_fk_discount_sale_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_saletranslation
    ADD CONSTRAINT discount_saletranslation_sale_id_36a69b0a_fk_discount_sale_id FOREIGN KEY (sale_id) REFERENCES public.discount_sale(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_voucher_categories discount_voucher_cat_category_id_fc9d044a_fk_product_c; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_categories
    ADD CONSTRAINT discount_voucher_cat_category_id_fc9d044a_fk_product_c FOREIGN KEY (category_id) REFERENCES public.product_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_voucher_categories discount_voucher_cat_voucher_id_19a56338_fk_discount_; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_categories
    ADD CONSTRAINT discount_voucher_cat_voucher_id_19a56338_fk_discount_ FOREIGN KEY (voucher_id) REFERENCES public.discount_voucher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_voucher_collections discount_voucher_col_collection_id_b9de6b54_fk_product_c; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_collections
    ADD CONSTRAINT discount_voucher_col_collection_id_b9de6b54_fk_product_c FOREIGN KEY (collection_id) REFERENCES public.product_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_voucher_collections discount_voucher_col_voucher_id_4ce1fde3_fk_discount_; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_collections
    ADD CONSTRAINT discount_voucher_col_voucher_id_4ce1fde3_fk_discount_ FOREIGN KEY (voucher_id) REFERENCES public.discount_voucher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_voucher_products discount_voucher_pro_product_id_4a3131ff_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_products
    ADD CONSTRAINT discount_voucher_pro_product_id_4a3131ff_fk_product_p FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_voucher_products discount_voucher_pro_voucher_id_8a2e6c3a_fk_discount_; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_products
    ADD CONSTRAINT discount_voucher_pro_voucher_id_8a2e6c3a_fk_discount_ FOREIGN KEY (voucher_id) REFERENCES public.discount_voucher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_vouchercustomer discount_vouchercust_voucher_id_bb55c04f_fk_discount_; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_vouchercustomer
    ADD CONSTRAINT discount_vouchercust_voucher_id_bb55c04f_fk_discount_ FOREIGN KEY (voucher_id) REFERENCES public.discount_voucher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_vouchertranslation discount_vouchertran_voucher_id_288246a9_fk_discount_; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_vouchertranslation
    ADD CONSTRAINT discount_vouchertran_voucher_id_288246a9_fk_discount_ FOREIGN KEY (voucher_id) REFERENCES public.discount_voucher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: giftcard_giftcard giftcard_giftcard_user_id_ce2401b5_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.giftcard_giftcard
    ADD CONSTRAINT giftcard_giftcard_user_id_ce2401b5_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: impersonate_impersonationlog impersonate_imperson_impersonating_id_afd114fc_fk_account_u; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.impersonate_impersonationlog
    ADD CONSTRAINT impersonate_imperson_impersonating_id_afd114fc_fk_account_u FOREIGN KEY (impersonating_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: impersonate_impersonationlog impersonate_imperson_impersonator_id_1ecfe8ce_fk_account_u; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.impersonate_impersonationlog
    ADD CONSTRAINT impersonate_imperson_impersonator_id_1ecfe8ce_fk_account_u FOREIGN KEY (impersonator_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: menu_menuitem menu_menuitem_category_id_af353a3b_fk_product_category_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menuitem
    ADD CONSTRAINT menu_menuitem_category_id_af353a3b_fk_product_category_id FOREIGN KEY (category_id) REFERENCES public.product_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: menu_menuitem menu_menuitem_collection_id_b913b19e_fk_product_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menuitem
    ADD CONSTRAINT menu_menuitem_collection_id_b913b19e_fk_product_collection_id FOREIGN KEY (collection_id) REFERENCES public.product_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: menu_menuitem menu_menuitem_menu_id_f466b139_fk_menu_menu_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menuitem
    ADD CONSTRAINT menu_menuitem_menu_id_f466b139_fk_menu_menu_id FOREIGN KEY (menu_id) REFERENCES public.menu_menu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: menu_menuitem menu_menuitem_page_id_a0c8f92d_fk_page_page_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menuitem
    ADD CONSTRAINT menu_menuitem_page_id_a0c8f92d_fk_page_page_id FOREIGN KEY (page_id) REFERENCES public.page_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: menu_menuitem menu_menuitem_parent_id_439f55a5_fk_menu_menuitem_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menuitem
    ADD CONSTRAINT menu_menuitem_parent_id_439f55a5_fk_menu_menuitem_id FOREIGN KEY (parent_id) REFERENCES public.menu_menuitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: menu_menuitemtranslation menu_menuitemtransla_menu_item_id_3445926c_fk_menu_menu; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menuitemtranslation
    ADD CONSTRAINT menu_menuitemtransla_menu_item_id_3445926c_fk_menu_menu FOREIGN KEY (menu_item_id) REFERENCES public.menu_menuitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_fulfillment order_fulfillment_order_id_02695111_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_fulfillment
    ADD CONSTRAINT order_fulfillment_order_id_02695111_fk_order_order_id FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_fulfillmentline order_fulfillmentlin_fulfillment_id_68f3291d_fk_order_ful; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_fulfillmentline
    ADD CONSTRAINT order_fulfillmentlin_fulfillment_id_68f3291d_fk_order_ful FOREIGN KEY (fulfillment_id) REFERENCES public.order_fulfillment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_fulfillmentline order_fulfillmentlin_order_line_id_7d40e054_fk_order_ord; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_fulfillmentline
    ADD CONSTRAINT order_fulfillmentlin_order_line_id_7d40e054_fk_order_ord FOREIGN KEY (order_line_id) REFERENCES public.order_orderline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_billing_address_id_8fe537cf_fk_userprofi; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_billing_address_id_8fe537cf_fk_userprofi FOREIGN KEY (billing_address_id) REFERENCES public.account_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order_gift_cards order_order_gift_car_giftcard_id_f6844926_fk_giftcard_; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_order_gift_cards
    ADD CONSTRAINT order_order_gift_car_giftcard_id_f6844926_fk_giftcard_ FOREIGN KEY (giftcard_id) REFERENCES public.giftcard_giftcard(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order_gift_cards order_order_gift_cards_order_id_ce5608c4_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_order_gift_cards
    ADD CONSTRAINT order_order_gift_cards_order_id_ce5608c4_fk_order_order_id FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_shipping_address_id_57e64931_fk_userprofi; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_shipping_address_id_57e64931_fk_userprofi FOREIGN KEY (shipping_address_id) REFERENCES public.account_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_shipping_method_id_2a742834_fk_shipping_; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_shipping_method_id_2a742834_fk_shipping_ FOREIGN KEY (shipping_method_id) REFERENCES public.shipping_shippingmethod(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_user_id_7cf9bc2b_fk_userprofile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_user_id_7cf9bc2b_fk_userprofile_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_voucher_id_0748ca22_fk_discount_voucher_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_voucher_id_0748ca22_fk_discount_voucher_id FOREIGN KEY (voucher_id) REFERENCES public.discount_voucher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_orderevent order_orderevent_order_id_09aa7ccd_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_orderevent
    ADD CONSTRAINT order_orderevent_order_id_09aa7ccd_fk_order_order_id FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_orderevent order_orderevent_user_id_1056ac9c_fk_userprofile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_orderevent
    ADD CONSTRAINT order_orderevent_user_id_1056ac9c_fk_userprofile_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_orderline order_orderline_order_id_eb04ec2d_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_orderline
    ADD CONSTRAINT order_orderline_order_id_eb04ec2d_fk_order_order_id FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_orderline order_orderline_variant_id_866774cb_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_orderline
    ADD CONSTRAINT order_orderline_variant_id_866774cb_fk_product_p FOREIGN KEY (variant_id) REFERENCES public.product_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_pagetranslation page_pagetranslation_page_id_60216ef5_fk_page_page_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.page_pagetranslation
    ADD CONSTRAINT page_pagetranslation_page_id_60216ef5_fk_page_page_id FOREIGN KEY (page_id) REFERENCES public.page_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payment_payment payment_payment_checkout_id_1f32e1ab_fk_checkout_checkout_token; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.payment_payment
    ADD CONSTRAINT payment_payment_checkout_id_1f32e1ab_fk_checkout_checkout_token FOREIGN KEY (checkout_id) REFERENCES public.checkout_checkout(token) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payment_payment payment_payment_order_id_22b45881_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.payment_payment
    ADD CONSTRAINT payment_payment_order_id_22b45881_fk_order_order_id FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payment_transaction payment_transaction_payment_id_df9808d7_fk_payment_payment_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.payment_transaction
    ADD CONSTRAINT payment_transaction_payment_id_df9808d7_fk_payment_payment_id FOREIGN KEY (payment_id) REFERENCES public.payment_payment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_assignedproductattribute_values product_assignedprod_assignedproductattri_6d497dfa_fk_product_a; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_assignedproductattribute_values
    ADD CONSTRAINT product_assignedprod_assignedproductattri_6d497dfa_fk_product_a FOREIGN KEY (assignedproductattribute_id) REFERENCES public.product_assignedproductattribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_assignedproductattribute product_assignedprod_assignment_id_eb2f81a4_fk_product_a; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_assignedproductattribute
    ADD CONSTRAINT product_assignedprod_assignment_id_eb2f81a4_fk_product_a FOREIGN KEY (assignment_id) REFERENCES public.product_attributeproduct(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_assignedproductattribute_values product_assignedprod_attributevalue_id_5bd29b24_fk_product_a; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_assignedproductattribute_values
    ADD CONSTRAINT product_assignedprod_attributevalue_id_5bd29b24_fk_product_a FOREIGN KEY (attributevalue_id) REFERENCES public.product_attributevalue(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_assignedproductattribute product_assignedprod_product_id_68be10a3_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_assignedproductattribute
    ADD CONSTRAINT product_assignedprod_product_id_68be10a3_fk_product_p FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_assignedvariantattribute_values product_assignedvari_assignedvariantattri_8d6d62ef_fk_product_a; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_assignedvariantattribute_values
    ADD CONSTRAINT product_assignedvari_assignedvariantattri_8d6d62ef_fk_product_a FOREIGN KEY (assignedvariantattribute_id) REFERENCES public.product_assignedvariantattribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_assignedvariantattribute product_assignedvari_assignment_id_8fdbffe8_fk_product_a; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_assignedvariantattribute
    ADD CONSTRAINT product_assignedvari_assignment_id_8fdbffe8_fk_product_a FOREIGN KEY (assignment_id) REFERENCES public.product_attributevariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_assignedvariantattribute_values product_assignedvari_attributevalue_id_41cc2454_fk_product_a; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_assignedvariantattribute_values
    ADD CONSTRAINT product_assignedvari_attributevalue_id_41cc2454_fk_product_a FOREIGN KEY (attributevalue_id) REFERENCES public.product_attributevalue(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_assignedvariantattribute product_assignedvari_variant_id_27483e6a_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_assignedvariantattribute
    ADD CONSTRAINT product_assignedvari_variant_id_27483e6a_fk_product_p FOREIGN KEY (variant_id) REFERENCES public.product_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_attributevalue product_attributecho_attribute_id_c28c6c92_fk_product_a; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributevalue
    ADD CONSTRAINT product_attributecho_attribute_id_c28c6c92_fk_product_a FOREIGN KEY (attribute_id) REFERENCES public.product_attribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_attributeproduct product_attributepro_attribute_id_0051c706_fk_product_a; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributeproduct
    ADD CONSTRAINT product_attributepro_attribute_id_0051c706_fk_product_a FOREIGN KEY (attribute_id) REFERENCES public.product_attribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_attributeproduct product_attributepro_product_type_id_54357b3b_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributeproduct
    ADD CONSTRAINT product_attributepro_product_type_id_54357b3b_fk_product_p FOREIGN KEY (product_type_id) REFERENCES public.product_producttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_attributetranslation product_attributetra_attribute_id_238dabfc_fk_product_a; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributetranslation
    ADD CONSTRAINT product_attributetra_attribute_id_238dabfc_fk_product_a FOREIGN KEY (attribute_id) REFERENCES public.product_attribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_attributevaluetranslation product_attributeval_attribute_value_id_8b2cb275_fk_product_a; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributevaluetranslation
    ADD CONSTRAINT product_attributeval_attribute_value_id_8b2cb275_fk_product_a FOREIGN KEY (attribute_value_id) REFERENCES public.product_attributevalue(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_attributevariant product_attributevar_attribute_id_e47d3bc3_fk_product_a; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributevariant
    ADD CONSTRAINT product_attributevar_attribute_id_e47d3bc3_fk_product_a FOREIGN KEY (attribute_id) REFERENCES public.product_attribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_attributevariant product_attributevar_product_type_id_ba95c6dd_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributevariant
    ADD CONSTRAINT product_attributevar_product_type_id_ba95c6dd_fk_product_p FOREIGN KEY (product_type_id) REFERENCES public.product_producttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_category product_category_parent_id_f6860923_fk_product_category_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_parent_id_f6860923_fk_product_category_id FOREIGN KEY (parent_id) REFERENCES public.product_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_categorytranslation product_categorytran_category_id_aa8d0917_fk_product_c; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_categorytranslation
    ADD CONSTRAINT product_categorytran_category_id_aa8d0917_fk_product_c FOREIGN KEY (category_id) REFERENCES public.product_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_collectionproduct product_collection_p_collection_id_0bc817dc_fk_product_c; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collectionproduct
    ADD CONSTRAINT product_collection_p_collection_id_0bc817dc_fk_product_c FOREIGN KEY (collection_id) REFERENCES public.product_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_collectionproduct product_collection_p_product_id_a45a5b06_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collectionproduct
    ADD CONSTRAINT product_collection_p_product_id_a45a5b06_fk_product_p FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_collectiontranslation product_collectiontr_collection_id_cfbbd453_fk_product_c; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collectiontranslation
    ADD CONSTRAINT product_collectiontr_collection_id_cfbbd453_fk_product_c FOREIGN KEY (collection_id) REFERENCES public.product_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_digitalcontenturl product_digitalconte_content_id_654197bd_fk_product_d; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_digitalcontenturl
    ADD CONSTRAINT product_digitalconte_content_id_654197bd_fk_product_d FOREIGN KEY (content_id) REFERENCES public.product_digitalcontent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_digitalcontenturl product_digitalconte_line_id_82056694_fk_order_ord; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_digitalcontenturl
    ADD CONSTRAINT product_digitalconte_line_id_82056694_fk_order_ord FOREIGN KEY (line_id) REFERENCES public.order_orderline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_digitalcontent product_digitalconte_product_variant_id_211462a5_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_digitalcontent
    ADD CONSTRAINT product_digitalconte_product_variant_id_211462a5_fk_product_p FOREIGN KEY (product_variant_id) REFERENCES public.product_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_product product_product_category_id_0c725779_fk_product_category_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_category_id_0c725779_fk_product_category_id FOREIGN KEY (category_id) REFERENCES public.product_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_product product_product_product_type_id_4bfbbfda_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_product_type_id_4bfbbfda_fk_product_p FOREIGN KEY (product_type_id) REFERENCES public.product_producttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_productimage product_productimage_product_id_544084bb_fk_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productimage
    ADD CONSTRAINT product_productimage_product_id_544084bb_fk_product_product_id FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_producttranslation product_producttrans_product_id_2c2c7532_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_producttranslation
    ADD CONSTRAINT product_producttrans_product_id_2c2c7532_fk_product_p FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_productvariant product_productvaria_product_id_43c5a310_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productvariant
    ADD CONSTRAINT product_productvaria_product_id_43c5a310_fk_product_p FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_productvarianttranslation product_productvaria_product_variant_id_1b144a85_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productvarianttranslation
    ADD CONSTRAINT product_productvaria_product_variant_id_1b144a85_fk_product_p FOREIGN KEY (product_variant_id) REFERENCES public.product_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_variantimage product_variantimage_image_id_bef14106_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_variantimage
    ADD CONSTRAINT product_variantimage_image_id_bef14106_fk_product_p FOREIGN KEY (image_id) REFERENCES public.product_productimage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_variantimage product_variantimage_variant_id_81123814_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_variantimage
    ADD CONSTRAINT product_variantimage_variant_id_81123814_fk_product_p FOREIGN KEY (variant_id) REFERENCES public.product_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shipping_shippingmethodtranslation shipping_shippingmet_shipping_method_id_31d925d2_fk_shipping_; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.shipping_shippingmethodtranslation
    ADD CONSTRAINT shipping_shippingmet_shipping_method_id_31d925d2_fk_shipping_ FOREIGN KEY (shipping_method_id) REFERENCES public.shipping_shippingmethod(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shipping_shippingmethod shipping_shippingmet_shipping_zone_id_265b7413_fk_shipping_; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.shipping_shippingmethod
    ADD CONSTRAINT shipping_shippingmet_shipping_zone_id_265b7413_fk_shipping_ FOREIGN KEY (shipping_zone_id) REFERENCES public.shipping_shippingzone(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_authorizationkey site_authorizationke_site_settings_id_d8397c0f_fk_site_site; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_authorizationkey
    ADD CONSTRAINT site_authorizationke_site_settings_id_d8397c0f_fk_site_site FOREIGN KEY (site_settings_id) REFERENCES public.site_sitesettings(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_sitesettings site_sitesettings_bottom_menu_id_e2a78098_fk_menu_menu_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettings
    ADD CONSTRAINT site_sitesettings_bottom_menu_id_e2a78098_fk_menu_menu_id FOREIGN KEY (bottom_menu_id) REFERENCES public.menu_menu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_sitesettings site_sitesettings_company_address_id_f0825427_fk_account_a; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettings
    ADD CONSTRAINT site_sitesettings_company_address_id_f0825427_fk_account_a FOREIGN KEY (company_address_id) REFERENCES public.account_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_sitesettings site_sitesettings_homepage_collection__82f45d33_fk_product_c; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettings
    ADD CONSTRAINT site_sitesettings_homepage_collection__82f45d33_fk_product_c FOREIGN KEY (homepage_collection_id) REFERENCES public.product_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_sitesettings site_sitesettings_site_id_64dd8ff8_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettings
    ADD CONSTRAINT site_sitesettings_site_id_64dd8ff8_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_sitesettings site_sitesettings_top_menu_id_ab6f8c46_fk_menu_menu_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettings
    ADD CONSTRAINT site_sitesettings_top_menu_id_ab6f8c46_fk_menu_menu_id FOREIGN KEY (top_menu_id) REFERENCES public.menu_menu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_sitesettingstranslation site_sitesettingstra_site_settings_id_ca085ff6_fk_site_site; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettingstranslation
    ADD CONSTRAINT site_sitesettingstra_site_settings_id_ca085ff6_fk_site_site FOREIGN KEY (site_settings_id) REFERENCES public.site_sitesettings(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user userprofile_user_default_billing_addr_0489abf1_fk_userprofi; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT userprofile_user_default_billing_addr_0489abf1_fk_userprofi FOREIGN KEY (default_billing_address_id) REFERENCES public.account_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user userprofile_user_default_shipping_add_aae7a203_fk_userprofi; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT userprofile_user_default_shipping_add_aae7a203_fk_userprofi FOREIGN KEY (default_shipping_address_id) REFERENCES public.account_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_groups userprofile_user_groups_group_id_c7eec74e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT userprofile_user_groups_group_id_c7eec74e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_groups userprofile_user_groups_user_id_5e712a24_fk_userprofile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT userprofile_user_groups_user_id_5e712a24_fk_userprofile_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_user_permissions userprofile_user_use_permission_id_1caa8a71_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT userprofile_user_use_permission_id_1caa8a71_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_user_permissions userprofile_user_use_user_id_6d654469_fk_userprofi; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT userprofile_user_use_user_id_6d654469_fk_userprofi FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webhook_webhook webhook_webhook_service_account_id_1073b057_fk_account_s; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.webhook_webhook
    ADD CONSTRAINT webhook_webhook_service_account_id_1073b057_fk_account_s FOREIGN KEY (service_account_id) REFERENCES public.account_serviceaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webhook_webhookevent webhook_webhookevent_webhook_id_73b5c9e1_fk_webhook_webhook_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.webhook_webhookevent
    ADD CONSTRAINT webhook_webhookevent_webhook_id_73b5c9e1_fk_webhook_webhook_id FOREIGN KEY (webhook_id) REFERENCES public.webhook_webhook(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

