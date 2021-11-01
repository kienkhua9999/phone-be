PGDMP                     	    y         	   app_phone    13.4    13.4 T    #           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            $           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            %           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            &           1262    26613 	   app_phone    DATABASE     m   CREATE DATABASE app_phone WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE app_phone;
                postgres    false            �            1259    35578 
   categories    TABLE     �   CREATE TABLE public.categories (
    id integer NOT NULL,
    "parentId" integer,
    "categoryName" character varying(255),
    "categoryLevel" integer DEFAULT 1,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    35576    categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          postgres    false    204            '           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public          postgres    false    203            �            1259    35684    contacts    TABLE     �   CREATE TABLE public.contacts (
    id integer NOT NULL,
    contactdate character varying(255),
    content text,
    "userId" integer
);
    DROP TABLE public.contacts;
       public         heap    postgres    false            �            1259    35682    contacts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.contacts_id_seq;
       public          postgres    false    218            (           0    0    contacts_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;
          public          postgres    false    217            �            1259    35632    orderdetails    TABLE     �   CREATE TABLE public.orderdetails (
    id integer NOT NULL,
    "Quantity" integer,
    price double precision,
    "orderId" integer,
    "productId" integer
);
     DROP TABLE public.orderdetails;
       public         heap    postgres    false            �            1259    35630    orderdetails_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orderdetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orderdetails_id_seq;
       public          postgres    false    212            )           0    0    orderdetails_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orderdetails_id_seq OWNED BY public.orderdetails.id;
          public          postgres    false    211            �            1259    35619    orderproducts    TABLE     �   CREATE TABLE public.orderproducts (
    id integer NOT NULL,
    orderate character varying(255),
    "totalPrice" double precision,
    status character varying(255),
    "userId" integer
);
 !   DROP TABLE public.orderproducts;
       public         heap    postgres    false            �            1259    35617    orderproducts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orderproducts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.orderproducts_id_seq;
       public          postgres    false    210            *           0    0    orderproducts_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.orderproducts_id_seq OWNED BY public.orderproducts.id;
          public          postgres    false    209            �            1259    35587 	   producers    TABLE     �   CREATE TABLE public.producers (
    id integer NOT NULL,
    "producerName" character varying(255),
    address character varying(255)
);
    DROP TABLE public.producers;
       public         heap    postgres    false            �            1259    35585    producers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.producers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.producers_id_seq;
       public          postgres    false    206            +           0    0    producers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.producers_id_seq OWNED BY public.producers.id;
          public          postgres    false    205            �            1259    35650    productImages    TABLE     �   CREATE TABLE public."productImages" (
    id integer NOT NULL,
    "ImageUrl" character varying(255),
    "productId" integer
);
 #   DROP TABLE public."productImages";
       public         heap    postgres    false            �            1259    35648    productImages_id_seq    SEQUENCE     �   CREATE SEQUENCE public."productImages_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."productImages_id_seq";
       public          postgres    false    214            ,           0    0    productImages_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."productImages_id_seq" OWNED BY public."productImages".id;
          public          postgres    false    213            �            1259    35598    products    TABLE     i  CREATE TABLE public.products (
    id integer NOT NULL,
    productname character varying(255),
    description text,
    guarantee character varying(255),
    makingdate character varying(255),
    price double precision,
    quantity integer,
    saleoff double precision,
    imageurl text,
    status text,
    categoryid integer,
    producerid integer
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    35596    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    208            -           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    207            �            1259    35663    reviews    TABLE     �   CREATE TABLE public.reviews (
    id integer NOT NULL,
    "reviewDate" character varying(255),
    "reviewContent" text,
    "numberStar" integer,
    "reviewImg" text,
    "userId" integer,
    "productId" integer
);
    DROP TABLE public.reviews;
       public         heap    postgres    false            �            1259    35661    reviews_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.reviews_id_seq;
       public          postgres    false    216            .           0    0    reviews_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;
          public          postgres    false    215            �            1259    35571    roles    TABLE     �   CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    35698 
   user_roles    TABLE     �   CREATE TABLE public.user_roles (
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "roleId" integer NOT NULL,
    "userId" integer NOT NULL
);
    DROP TABLE public.user_roles;
       public         heap    postgres    false            �            1259    35556    users    TABLE     C  CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    password character varying(255),
    phonenumber character varying(255),
    address character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    35554    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    201            /           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    200            a           2604    35581    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    203    204            i           2604    35687    contacts id    DEFAULT     j   ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);
 :   ALTER TABLE public.contacts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            f           2604    35635    orderdetails id    DEFAULT     r   ALTER TABLE ONLY public.orderdetails ALTER COLUMN id SET DEFAULT nextval('public.orderdetails_id_seq'::regclass);
 >   ALTER TABLE public.orderdetails ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            e           2604    35622    orderproducts id    DEFAULT     t   ALTER TABLE ONLY public.orderproducts ALTER COLUMN id SET DEFAULT nextval('public.orderproducts_id_seq'::regclass);
 ?   ALTER TABLE public.orderproducts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            c           2604    35590    producers id    DEFAULT     l   ALTER TABLE ONLY public.producers ALTER COLUMN id SET DEFAULT nextval('public.producers_id_seq'::regclass);
 ;   ALTER TABLE public.producers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    205    206            g           2604    35653    productImages id    DEFAULT     x   ALTER TABLE ONLY public."productImages" ALTER COLUMN id SET DEFAULT nextval('public."productImages_id_seq"'::regclass);
 A   ALTER TABLE public."productImages" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            d           2604    35601    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    207    208            h           2604    35666 
   reviews id    DEFAULT     h   ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);
 9   ALTER TABLE public.reviews ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            `           2604    35563    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    201    201                      0    35578 
   categories 
   TABLE DATA           o   COPY public.categories (id, "parentId", "categoryName", "categoryLevel", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    204   �c                 0    35684    contacts 
   TABLE DATA           F   COPY public.contacts (id, contactdate, content, "userId") FROM stdin;
    public          postgres    false    218   �d                 0    35632    orderdetails 
   TABLE DATA           U   COPY public.orderdetails (id, "Quantity", price, "orderId", "productId") FROM stdin;
    public          postgres    false    212   �d                 0    35619    orderproducts 
   TABLE DATA           U   COPY public.orderproducts (id, orderate, "totalPrice", status, "userId") FROM stdin;
    public          postgres    false    210   �d                 0    35587 	   producers 
   TABLE DATA           @   COPY public.producers (id, "producerName", address) FROM stdin;
    public          postgres    false    206   e                 0    35650    productImages 
   TABLE DATA           F   COPY public."productImages" (id, "ImageUrl", "productId") FROM stdin;
    public          postgres    false    214   �e                 0    35598    products 
   TABLE DATA           �   COPY public.products (id, productname, description, guarantee, makingdate, price, quantity, saleoff, imageurl, status, categoryid, producerid) FROM stdin;
    public          postgres    false    208   �e                 0    35663    reviews 
   TABLE DATA           v   COPY public.reviews (id, "reviewDate", "reviewContent", "numberStar", "reviewImg", "userId", "productId") FROM stdin;
    public          postgres    false    216   �k                 0    35571    roles 
   TABLE DATA           C   COPY public.roles (id, name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    202   �k                  0    35698 
   user_roles 
   TABLE DATA           R   COPY public.user_roles ("createdAt", "updatedAt", "roleId", "userId") FROM stdin;
    public          postgres    false    219    l                 0    35556    users 
   TABLE DATA           n   COPY public.users (id, username, email, password, phonenumber, address, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    201   l       0           0    0    categories_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categories_id_seq', 6, true);
          public          postgres    false    203            1           0    0    contacts_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.contacts_id_seq', 1, false);
          public          postgres    false    217            2           0    0    orderdetails_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orderdetails_id_seq', 1, false);
          public          postgres    false    211            3           0    0    orderproducts_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.orderproducts_id_seq', 1, false);
          public          postgres    false    209            4           0    0    producers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.producers_id_seq', 1, false);
          public          postgres    false    205            5           0    0    productImages_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."productImages_id_seq"', 1, false);
          public          postgres    false    213            6           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 1, false);
          public          postgres    false    207            7           0    0    reviews_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.reviews_id_seq', 1, false);
          public          postgres    false    215            8           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 22, true);
          public          postgres    false    200            o           2606    35584    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    204            }           2606    35692    contacts contacts_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.contacts DROP CONSTRAINT contacts_pkey;
       public            postgres    false    218            w           2606    35637    orderdetails orderdetails_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.orderdetails DROP CONSTRAINT orderdetails_pkey;
       public            postgres    false    212            u           2606    35624     orderproducts orderproducts_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.orderproducts
    ADD CONSTRAINT orderproducts_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.orderproducts DROP CONSTRAINT orderproducts_pkey;
       public            postgres    false    210            q           2606    35595    producers producers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.producers
    ADD CONSTRAINT producers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.producers DROP CONSTRAINT producers_pkey;
       public            postgres    false    206            y           2606    35655     productImages productImages_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."productImages"
    ADD CONSTRAINT "productImages_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."productImages" DROP CONSTRAINT "productImages_pkey";
       public            postgres    false    214            s           2606    35606    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    208            {           2606    35671    reviews reviews_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            postgres    false    216            m           2606    35575    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    202                       2606    35702    user_roles user_roles_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY ("roleId", "userId");
 D   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_pkey;
       public            postgres    false    219    219            k           2606    35570    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    201            �           2606    35693    contacts contacts_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT "contacts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.contacts DROP CONSTRAINT "contacts_userId_fkey";
       public          postgres    false    218    2923    201            �           2606    35638 &   orderdetails orderdetails_orderId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT "orderdetails_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public.orderproducts(id) ON UPDATE CASCADE ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.orderdetails DROP CONSTRAINT "orderdetails_orderId_fkey";
       public          postgres    false    210    212    2933            �           2606    35643 (   orderdetails orderdetails_productId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT "orderdetails_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.orderdetails DROP CONSTRAINT "orderdetails_productId_fkey";
       public          postgres    false    2931    212    208            �           2606    35625 '   orderproducts orderproducts_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderproducts
    ADD CONSTRAINT "orderproducts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public.orderproducts DROP CONSTRAINT "orderproducts_userId_fkey";
       public          postgres    false    210    201    2923            �           2606    35656 *   productImages productImages_productId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."productImages"
    ADD CONSTRAINT "productImages_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE SET NULL;
 X   ALTER TABLE ONLY public."productImages" DROP CONSTRAINT "productImages_productId_fkey";
       public          postgres    false    208    214    2931            �           2606    35607 !   products products_categoryId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT "products_categoryId_fkey" FOREIGN KEY (categoryid) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public.products DROP CONSTRAINT "products_categoryId_fkey";
       public          postgres    false    2927    204    208            �           2606    35612 !   products products_producerId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT "products_producerId_fkey" FOREIGN KEY (producerid) REFERENCES public.producers(id) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public.products DROP CONSTRAINT "products_producerId_fkey";
       public          postgres    false    2929    208    206            �           2606    35677    reviews reviews_productId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT "reviews_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE SET NULL;
 J   ALTER TABLE ONLY public.reviews DROP CONSTRAINT "reviews_productId_fkey";
       public          postgres    false    2931    216    208            �           2606    35672    reviews reviews_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT "reviews_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.reviews DROP CONSTRAINT "reviews_userId_fkey";
       public          postgres    false    216    2923    201            �           2606    35703 !   user_roles user_roles_roleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT "user_roles_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT "user_roles_roleId_fkey";
       public          postgres    false    2925    219    202            �           2606    35708 !   user_roles user_roles_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT "user_roles_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT "user_roles_userId_fkey";
       public          postgres    false    219    2923    201               �   x�M��
�0�����(Kw��`��m-���b���Tg*���}!A���L��CG/��z�B?vÄ���0H	8�mk&U���3ЪI�E�`P|����2�PՙA��a�c�<�G��<zOa/�G�(��Ơ0T2ݤ�&L��%��^�
(`l���#+ըit)�j���O��"�|�]g@�f~�!��.頋v�o����uEo��Yd            x������ � �            x������ � �            x������ � �         �   x�E�;�0@g�>@���� ��ԅ��
&5J�(M�O7�'=����91�-s��汧$+*�[�H ug�iݚF���%�8[�V��	�i�8�b*a��J����H=>v����a%w����xe��?�ι8�18            x������ � �         �  x��_k�F���O1�H\��r��\Hңm8�6�'Xj,ɵ�}H�C)��ZJ9��r$MH�	�(y�ɓ���Ig$�Vd%wG��c���ٙ���ΆI�cݶ6�)�������2�.2'��l��%��<�^��`ؤt���y��l�z�i[���%�tͅm��R@o/��n3�~3�n�6>��5c�>��A7�G��s`�`9�\����m=�^�^�+sj6jv�e�ʁ-��ͽ���_����px�6��[�૤\�I�K��6H�$j���҈�-PG�+k`��5��v&�����vÁn�3���ۡN|DƛA�C=��S�Օ)XY��Iѭ6�����QBG8�l�܄�\���a(�6���߻�5,v�;L��*��X��ɺJ��n`T��+=��]�C�W��$Ƨ�˜I<_,��%1Y�%�ʔ5���Z�����}Y*Hl�'P��,�a�k���ޞ%����8��s*��;E���"h��}2аH買k�y}��3�H*��c�5���z��$���C~5�àO����*����m|W&z�9�w{m�37��A��;�N��\�)g%9�>�M	։oG�"��	��q�ӧ�)�w�e;���걁��
���xϱ���H'�u�hI�t�4����1Z���tt�|bڽ6�;m�|������؉ָ��;�vѹj��	��`�53G��x�>z_�0�-�$�0;n��ӹ��A�D"�z�)�k՚mjO�P��"'�#���C��
9�Q	�E���&�	�b��c�!+rq���A|���ly=M�R�&��}d��*��<�%��aig��Bb?F\�
���Q���<�F+czid�Ҹ��CϤ�-��"x�7����j5Z��tN�M�bUޟB��K�$Fu�KO�y��vָZMi�.��v=Xu��!��[l0�-ه7�A��?�
y���iyo
y<-q*ru�9���N-�B&�hf��^�*�N�mg�_W���$}N	�?�~gdő��*�'�����_�6 �$*cרؽx����1��>`]V�t��4`#�ΠB�t�N�y3�R�']K��n�*�[:�����w�(x���n+�,X'�(�Jt��al������Yڐ����܎c�.{n� GI����i��F����^�H>����-ݍ"}i�����,�yI�Ⱥ�%�wѿQ�ќ(�)hיC.��8�I�	Ũe�9��3!S�g·��&�()��[}������ź����4� W��+��%]`>���7�*wp�Iz>�bn����8���#��\��3A����4�,b6ǰ�I���}�p�O�<#m���IP�H{�ʆ���c =��-yy���.�oI�gF�������i�]��>��|ώ3���ǈ�|TV̬� ��TG9��X��c�:�G�Ѵ$6���]$��q|�x��x������/            x������ � �         G   x�3���OI-J,�/�4202�54�54W02�22�21�365�60�#�e�YZ�J�fc�Ĕ��<2u��qqq ��'g          O   x�}ͱ� D�O�>��3��:�8�O_�FTX������i�pCe���45W�O�.���W�FO�E�
*"/�+�         @  x�u�;r�@ ��z9�]��`��$bDA|�0iV`\P2>���9b�I�I&&������͇u��$Jz�Lx��~����5�������	�S��t<ci�/�Z����z���V�O����&�F��BL�8~�Sq:��nb�$�LP�mD��^!��"�,�)x�u�>
�b�7ּ�����c�����R�f����j��T�C�N��3FT��`*x*d�q��P0�5z��7I��2,Ω�����C�v�a�z�t��E�h��6��8�[�F��{>�QȿT5L(0���tx��� �H��g(I�樄�     