PGDMP     !                
    y            kien    13.4    13.4 T    #           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            $           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            %           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            &           1262    35731    kien    DATABASE     h   CREATE DATABASE kien WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE kien;
                postgres    false            �            1259    35732 
   categories    TABLE     �   CREATE TABLE public.categories (
    id integer NOT NULL,
    "parentId" integer,
    "categoryName" character varying(255),
    "categoryLevel" integer DEFAULT 1,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    35736    categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          postgres    false    200            '           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public          postgres    false    201            �            1259    35738    contacts    TABLE     �   CREATE TABLE public.contacts (
    id integer NOT NULL,
    contactdate character varying(255),
    content text,
    "userId" integer
);
    DROP TABLE public.contacts;
       public         heap    postgres    false            �            1259    35744    contacts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.contacts_id_seq;
       public          postgres    false    202            (           0    0    contacts_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;
          public          postgres    false    203            �            1259    35746    orderdetails    TABLE     �   CREATE TABLE public.orderdetails (
    id integer NOT NULL,
    "Quantity" integer,
    price double precision,
    "orderId" integer,
    "productId" integer
);
     DROP TABLE public.orderdetails;
       public         heap    postgres    false            �            1259    35749    orderdetails_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orderdetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orderdetails_id_seq;
       public          postgres    false    204            )           0    0    orderdetails_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orderdetails_id_seq OWNED BY public.orderdetails.id;
          public          postgres    false    205            �            1259    35751    orderproducts    TABLE     �   CREATE TABLE public.orderproducts (
    id integer NOT NULL,
    orderate character varying(255),
    "totalPrice" double precision,
    status character varying(255),
    "userId" integer
);
 !   DROP TABLE public.orderproducts;
       public         heap    postgres    false            �            1259    35757    orderproducts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orderproducts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.orderproducts_id_seq;
       public          postgres    false    206            *           0    0    orderproducts_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.orderproducts_id_seq OWNED BY public.orderproducts.id;
          public          postgres    false    207            �            1259    35759 	   producers    TABLE     �   CREATE TABLE public.producers (
    id integer NOT NULL,
    "producerName" character varying(255),
    address character varying(255)
);
    DROP TABLE public.producers;
       public         heap    postgres    false            �            1259    35765    producers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.producers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.producers_id_seq;
       public          postgres    false    208            +           0    0    producers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.producers_id_seq OWNED BY public.producers.id;
          public          postgres    false    209            �            1259    35767    productimages    TABLE        CREATE TABLE public.productimages (
    id integer NOT NULL,
    "ImageUrl" character varying(255),
    "productId" integer
);
 !   DROP TABLE public.productimages;
       public         heap    postgres    false            �            1259    35770    productImages_id_seq    SEQUENCE     �   CREATE SEQUENCE public."productImages_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."productImages_id_seq";
       public          postgres    false    210            ,           0    0    productImages_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."productImages_id_seq" OWNED BY public.productimages.id;
          public          postgres    false    211            �            1259    35772    products    TABLE     i  CREATE TABLE public.products (
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
       public         heap    postgres    false            �            1259    35778    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    212            -           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    213            �            1259    35780    reviews    TABLE     �   CREATE TABLE public.reviews (
    id integer NOT NULL,
    "reviewDate" character varying(255),
    "reviewContent" text,
    "numberStar" integer,
    "reviewImg" text,
    "userId" integer,
    "productId" integer
);
    DROP TABLE public.reviews;
       public         heap    postgres    false            �            1259    35786    reviews_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.reviews_id_seq;
       public          postgres    false    214            .           0    0    reviews_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;
          public          postgres    false    215            �            1259    35788    roles    TABLE     �   CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    35791 
   user_roles    TABLE     �   CREATE TABLE public.user_roles (
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "roleId" integer NOT NULL,
    "userId" integer NOT NULL
);
    DROP TABLE public.user_roles;
       public         heap    postgres    false            �            1259    35794    users    TABLE     C  CREATE TABLE public.users (
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
       public         heap    postgres    false            �            1259    35800    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    218            /           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    219            a           2604    35802    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200            b           2604    35803    contacts id    DEFAULT     j   ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);
 :   ALTER TABLE public.contacts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202            c           2604    35804    orderdetails id    DEFAULT     r   ALTER TABLE ONLY public.orderdetails ALTER COLUMN id SET DEFAULT nextval('public.orderdetails_id_seq'::regclass);
 >   ALTER TABLE public.orderdetails ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204            d           2604    35805    orderproducts id    DEFAULT     t   ALTER TABLE ONLY public.orderproducts ALTER COLUMN id SET DEFAULT nextval('public.orderproducts_id_seq'::regclass);
 ?   ALTER TABLE public.orderproducts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206            e           2604    35806    producers id    DEFAULT     l   ALTER TABLE ONLY public.producers ALTER COLUMN id SET DEFAULT nextval('public.producers_id_seq'::regclass);
 ;   ALTER TABLE public.producers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208            f           2604    35807    productimages id    DEFAULT     v   ALTER TABLE ONLY public.productimages ALTER COLUMN id SET DEFAULT nextval('public."productImages_id_seq"'::regclass);
 ?   ALTER TABLE public.productimages ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210            g           2604    35808    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212            h           2604    35809 
   reviews id    DEFAULT     h   ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);
 9   ALTER TABLE public.reviews ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214            i           2604    35810    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218                      0    35732 
   categories 
   TABLE DATA           o   COPY public.categories (id, "parentId", "categoryName", "categoryLevel", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    200   qc                 0    35738    contacts 
   TABLE DATA           F   COPY public.contacts (id, contactdate, content, "userId") FROM stdin;
    public          postgres    false    202   Sd                 0    35746    orderdetails 
   TABLE DATA           U   COPY public.orderdetails (id, "Quantity", price, "orderId", "productId") FROM stdin;
    public          postgres    false    204   pd                 0    35751    orderproducts 
   TABLE DATA           U   COPY public.orderproducts (id, orderate, "totalPrice", status, "userId") FROM stdin;
    public          postgres    false    206   �d                 0    35759 	   producers 
   TABLE DATA           @   COPY public.producers (id, "producerName", address) FROM stdin;
    public          postgres    false    208   �d                 0    35767    productimages 
   TABLE DATA           D   COPY public.productimages (id, "ImageUrl", "productId") FROM stdin;
    public          postgres    false    210   Be                 0    35772    products 
   TABLE DATA           �   COPY public.products (id, productname, description, guarantee, makingdate, price, quantity, saleoff, imageurl, status, categoryid, producerid) FROM stdin;
    public          postgres    false    212   sn                 0    35780    reviews 
   TABLE DATA           v   COPY public.reviews (id, "reviewDate", "reviewContent", "numberStar", "reviewImg", "userId", "productId") FROM stdin;
    public          postgres    false    214   "�                 0    35788    roles 
   TABLE DATA           C   COPY public.roles (id, name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    216   ?�                 0    35791 
   user_roles 
   TABLE DATA           R   COPY public.user_roles ("createdAt", "updatedAt", "roleId", "userId") FROM stdin;
    public          postgres    false    217   ��                 0    35794    users 
   TABLE DATA           n   COPY public.users (id, username, email, password, phonenumber, address, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    218   ��       0           0    0    categories_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categories_id_seq', 6, true);
          public          postgres    false    201            1           0    0    contacts_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.contacts_id_seq', 1, false);
          public          postgres    false    203            2           0    0    orderdetails_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orderdetails_id_seq', 1, false);
          public          postgres    false    205            3           0    0    orderproducts_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.orderproducts_id_seq', 1, false);
          public          postgres    false    207            4           0    0    producers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.producers_id_seq', 1, false);
          public          postgres    false    209            5           0    0    productImages_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."productImages_id_seq"', 1, false);
          public          postgres    false    211            6           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 1, false);
          public          postgres    false    213            7           0    0    reviews_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.reviews_id_seq', 1, false);
          public          postgres    false    215            8           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 22, true);
          public          postgres    false    219            k           2606    35812    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    200            m           2606    35814    contacts contacts_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.contacts DROP CONSTRAINT contacts_pkey;
       public            postgres    false    202            o           2606    35816    orderdetails orderdetails_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.orderdetails DROP CONSTRAINT orderdetails_pkey;
       public            postgres    false    204            q           2606    35818     orderproducts orderproducts_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.orderproducts
    ADD CONSTRAINT orderproducts_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.orderproducts DROP CONSTRAINT orderproducts_pkey;
       public            postgres    false    206            s           2606    35820    producers producers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.producers
    ADD CONSTRAINT producers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.producers DROP CONSTRAINT producers_pkey;
       public            postgres    false    208            u           2606    35822     productimages productImages_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.productimages
    ADD CONSTRAINT "productImages_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.productimages DROP CONSTRAINT "productImages_pkey";
       public            postgres    false    210            w           2606    35824    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    212            y           2606    35826    reviews reviews_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            postgres    false    214            {           2606    35828    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    216            }           2606    35830    user_roles user_roles_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY ("roleId", "userId");
 D   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_pkey;
       public            postgres    false    217    217                       2606    35832    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    218            �           2606    35833    contacts contacts_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT "contacts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.contacts DROP CONSTRAINT "contacts_userId_fkey";
       public          postgres    false    202    218    2943            �           2606    35838 &   orderdetails orderdetails_orderId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT "orderdetails_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public.orderproducts(id) ON UPDATE CASCADE ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.orderdetails DROP CONSTRAINT "orderdetails_orderId_fkey";
       public          postgres    false    2929    206    204            �           2606    35843 (   orderdetails orderdetails_productId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT "orderdetails_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.orderdetails DROP CONSTRAINT "orderdetails_productId_fkey";
       public          postgres    false    212    204    2935            �           2606    35848 '   orderproducts orderproducts_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderproducts
    ADD CONSTRAINT "orderproducts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public.orderproducts DROP CONSTRAINT "orderproducts_userId_fkey";
       public          postgres    false    206    2943    218            �           2606    35853 *   productimages productImages_productId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productimages
    ADD CONSTRAINT "productImages_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE SET NULL;
 V   ALTER TABLE ONLY public.productimages DROP CONSTRAINT "productImages_productId_fkey";
       public          postgres    false    2935    210    212            �           2606    35858 !   products products_categoryId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT "products_categoryId_fkey" FOREIGN KEY (categoryid) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public.products DROP CONSTRAINT "products_categoryId_fkey";
       public          postgres    false    212    2923    200            �           2606    35863 !   products products_producerId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT "products_producerId_fkey" FOREIGN KEY (producerid) REFERENCES public.producers(id) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public.products DROP CONSTRAINT "products_producerId_fkey";
       public          postgres    false    212    2931    208            �           2606    35868    reviews reviews_productId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT "reviews_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE SET NULL;
 J   ALTER TABLE ONLY public.reviews DROP CONSTRAINT "reviews_productId_fkey";
       public          postgres    false    2935    214    212            �           2606    35873    reviews reviews_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT "reviews_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.reviews DROP CONSTRAINT "reviews_userId_fkey";
       public          postgres    false    218    214    2943            �           2606    35878 !   user_roles user_roles_roleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT "user_roles_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT "user_roles_roleId_fkey";
       public          postgres    false    2939    217    216            �           2606    35883 !   user_roles user_roles_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT "user_roles_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT "user_roles_userId_fkey";
       public          postgres    false    218    217    2943               �   x�M��
�0�����(Kw��`��m-���b���Tg*���}!A���L��CG/��z�B?vÄ���0H	8�mk&U���3ЪI�E�`P|����2�PՙA��a�c�<�G��<zOa/�G�(��Ơ0T2ݤ�&L��%��^�
(`l���#+ըit)�j���O��"�|�]g@�f~�!��.頋v�o����uEo��Yd            x������ � �            x������ � �            x������ � �         �   x�E�;�0@g�>@���� ��ԅ��
&5J�(M�O7�'=����91�-s��汧$+*�[�H ug�iݚF���%�8[�V��	�i�8�b*a��J����H=>v����a%w����xe��?�ι8�18         !	  x�͝kr�8�wQГ�bO0U*�`����$�� ����Vj*S�Ib�iZ�Zm�Ŀvm{h�	�uV=��<��*o����
�yV�pmZS���p��Ӻ��׻<��bo�y�(��!�4_�t�r���"Ib�ƙ1Q�	��ݫk&���"R���_<H�r(-��+����W>�0 @,��<�D3���X�Є�yɏ����"`��:���oU�����g`w��m`��|t��{�4��InVB(�2�dQ�6�$�1Q�������]��Z�C�q�^8�����:0/
%�������0VǋI�8p�Ŧs9��d�	��`��B2��XY�q&��S��4Zr���I�c%��Lt5��
8�{σ�/��p��0� j�
Nfg�Q�WX�M�#�!���C�w�W��􂚮È�ĕ�o��Ṿu^\<b0��h�[sw�h��ҡx��4Q:o��U3����׷�r�~���_�IO�/��@�T�^���T�Y�:D˺E+����-��EV�]���<��.�7e���c[�M����p�3}j|�Y�os�DE�9ʜA}>�H�튬wT[;Sm�S��Qڟ�c#��?'G8D�N�p���rα_�E������R_�
?�Y��)���2 ��:@��?돲����<��W�Ui֏zST0��`�B4�K��/p���@�G
D�VaVu�kN��l�f�dA�l��fO�4Q:M"�5�y~�h��`�c]�� S������o�rJOGbD���"D�&P8%��7eq �wL]{��@!*�
Ki��*ˏ#�m��@ih��%B�����Y�Q�D�&�BF"��M�H����MC�H7�I�Wc��� Btt�ec��	��^H׌�����YA��v$C�;d��
Q��I�e�nw���2Ei?�.ᕸ��7�� Z��;�:�,s��x�㉗y�^<|�Y���O|��S��ݢ�� ^f�;��os[�Ƿ�{1� ��9��yH�+��e&��V[��A��/�=W�؊��J��G���P5,�Vv9rؙ���MQ>u}16�b��3�}cׂR�@l��_�u�cD\�o`�n����u @�q��(���`��(�A�X������f0�阓&o�`��?�iM��c������~-˛b[�FTJ*��Q��]�H[��Cmf����(͜Q�4�!�i��0\�er�`bܵ�Y$�=�0|�A�\��:wD)b��Fx����}�;�2���H2���������-�J����H�([�cJD�Q.��I6R 
���qG1 �v �� ~;Ԯ+���� �ۦ�뺉�t�'x!���9b����W���Ln�,`x�{'\���� W��Qx�n�!x�f�!x�\�!�`1m�0�y�/�}s�NT���a�����@r�ˋ�Ĵ,C�:N�Â����,k�u�e��װp;o����'+q[l= ��v�z >Xx��� �P:>��(�j~8�ֱ�.�.XN�w�us����|8e( �:x�$�a�ʧ��Xن��ke��	F��Z��Sx~��/�ʋ���H��	O������ϣ~��_��������W�S�	�Hg?C��g
�~�o]�C��u��	W���*�-��$M�t"�g�k���=�?�'\�N�.m�G�t�>��3���Qq�'�W��	���0=J(�R>Oى���	;Q�R�M׉³f/��'(��I�Ƨ`'
�z)�C���j���[�{��5yc�� ��u0|�½o�k����k�����BϘ���+�<|��U��Yx"�N<b��V�^�_ϊ~oZ��h<%�@��mb�ࣰ�j�e|UW�5�c�&��*�-R4��F��
�a}8Ԥ���Ñ��~/i��r	�x/I�y\]HCf ��� ]��.��QOa������B�(N&\�g#&�L�8I�=ު��� q�;�I̒(Md�� ��J1����V*y��Q���X.ʓ�G�SN8�(�3yҳe}Y���|��d�CM~tLL<�)�\�a���oFW�71����M�$�MQen�ˁ�� y���#y���!!��w8t4�'˾�;X~T1�L�/�Z6�B�@|Y���/�Z5a���xxm4��g�`��,��xm5\Df���F����um8Y��*k�u�(4���N)����}ou�t�K�̕�;���*W�^���U��k}��W�&]SCvOI&�/����+�/��jءѫh���7���p������\����/�B��!��"���            x��][oב~�~Ł�%�9�;I[ ��1e��x� ��l��;��sz����
C0����a�L�����`�2z⟘��s��}z8��,	LK�/�ԩ��^S���i�a�����u��[��%!��.{���u}U���,>yx� c�� �����,_|���C�eat�K�7��Y��E>� a�ǧ"���K|������N�Ӈl;���	��Sx
�$�Â�?Ã�n���)|��5<>���V���1,/��bO^|3,9����=1d�������g������h<�0��|��$@����z���l�d�p|�4aI������1�k<��GÍ/'�$\v�z>���n�Q�+a{ᐅC�I��Fl ��'�+��e;)���!��߯̽>>:Laq_����Ǐ����\;ğ����&�,��z���u��b�w���j����߆��U����,�u����ƣ�k��W�&x:R�0a{��ѓ�2W�/����zm��XY����jչzu.��Q߯5��w�����~wn�����\k�v��٭�nϘqƌ�(f���UŌd�Z-�pѕ&�0�3>�d|h1ؔL9=�g��ǣ��<x0�.:/f�џ؝�wl��h֫)�O������<.�͸�q�EF�z�Y-�dd�8J�<'.'��>v����g����ب.T�ȏ����X�xߥ��rn��e���K�c��W�-�������OY�ى3T�q��saUj�%b0���^ �y!����[����ze*u�Q�B�:oj�ui���7� b����͙�2˗�ºK�zK+n���8��6���\�M�����;i�a�*�E/�Slݜ{Od<�4�/�U|�em?���B<��zn���`���쎞�3��Cئ?n�G�#(y1�ǮyHƶ�$ft����9�!%������Z�������_�w�����?&��xg�݌���p�c����Ƨ ��5��U���0�g�������rN�%�����>��~E���v��|�}
d����b�p�s�[�m;���s�y�u�������0���6�=��c$r��2�!º�gH"�D�5���gk��Z�'<�w��2׸R����%�ы����x�b�:IIX�0m����������gl~ټe�U&�ӛ�;�/�g>c����jm��:��U��*��3�4��?���(����3v���bw�y�fK9;���0{����V�1�`�zS�[�Uc���c}��Z����g,����3)�"Y���˅�k3}�����"�茴 �:�z�pa�Κ3О1�b�)$-�%�a]�]����=c������n�����߼{�M�V'I���W������k'����`�u^�=u#�f����z�,���F�A'�O6���;[���}uQ���"��W;�J��k��E�@�N���y~B@��>tv�΀/���������������@��!Pَ��pޗ?w��A��d�fC�㑓��,��2�	���Dl���Q��)���,$�*�[��N2��}G�	�(�[��t��Q|a(XM8X$]�� ��C�7X��a����K�J��ru�o6��[;Da�<�����<�g�kX���K��A���v��،�O&��Ѓ�T���=�v��p�!A��f!��]�
k����;`��T���+��%��6S���Fb~ܑǰ(�!����� ��xd]B/`�_��#��O�*h�����ֆ�?�V��k�j����tP,q��� ��@�jCY�s�+��	����:[��� b�-�f�~(��s�˩`�B�ekjE$��]!���Y���g����� T�BA�Yį[z�  |oA�ٻr��J����	=�е�D�񀬔t�7�
��G��ޖ ����F�/'�w�"P&�-H��+P������c����A��%aA;�w�J�e�����A���cP	Ҹ��,��7;���v%���+ל��9�}u�7���o�M�d�W؇����\d�����
�R�_'�H�6d�v���'��bK�+�����^��Z�	��~�0����^|ڎb�K'���*��D�]ڣ��B������������<����|,p"�03[�J��OAh��!�Oo�V]��=�@���^�G�\�<�fغڞ��r��jI[C�.t/�ܐ۱����iVa�FG�����|0I��x��犍�%�%��wi�Ԛ5��#�k~9��*R4�n6�]�3$Kn�ʌӳ�m�=�C��0�K�!N��5�'6�I�L�`:�tk>�?�J�6���/��'��T7x{���5�?U�=Q��ȵ�w�mv��'�n;5�����
U�R�P�\�"n���c{�q�Կ�~9�B���e6���*g(ޔ`�iF�.?9�@��������![bi��o�������p*ů� ��|.M(Q��Ѯ�<G��4�֣!��J�l/%��1��d�#��)����堀�6��0�I�	���
[�'�ZD�E���|rΎG]���@�k#dSF��}.	ęqXs�.?	��w�����,�@C�n�
+��\��)Tl�C��?�����˧WjZ��Ω�Be^o5�R��X��v��9i���﹨��N$#ܾ�NS&�ldQ�-��E��*�"#��$-�M����R������ZE��y�h��6��[�Dv�Ȧ��e��5*{1��<
:�n������&B����`BOü��kX���ے�.?C-Q򞋾�����]M�/,�'��WcZy�r�? VD:��rP�C�{@
^�  ߦ��'Q+G�S�e�������r��a�D���Ǧ��G�<�ؽ�a(���F���<B'L���/�K�L�`r�3��\0�2F�����_j8a�-l�Q���͹牱��i��E��;8"�5�J���0cF)EB�>�F<K���ˠ=v�DltH�'
����.�Ũ��Q��F�+x�[�?�g
�r�N�nw|4�h��vf)!�N�ݨcv��[��z{�MN��U�4�U�F���v�n���v��nQ�H�`-����)e����}Dg�||>��t���ٕ��K����@Ii\O!�3�k��Nb�Bp�z�2�k��g��&��3�v��DZ(�l�H�ubu~T�!3ȿ�s��/}�W��= ���~���
�q��	�ĕ�k�������$qO9������`4�|r��a	�I�]1����N��ӈ1 �����~0!�|�_{����O3 ,�.L�<�`x��g����5�
�ĝX�V��|a_��!_��;�N��W�o��dۑ~�:���X�*�X��.��IԔ��hHq8�Ƒ�|��D��\L��W�}KZ� P�4]����#��ĸ�]�� ^�_��{���c�ݠ_��MC�%^�nI���q�|K��p�#�gF	7Y쒩�~�ёP���0�)leU�FEк���pB ف	�aX��v$�ەV]$�0�f���#�<�BK�y
���ͨ�Yk~a��-�d����Q������o�敢Z�KLV���%���!f��)J�x�Ã���*O�>j�O�r54���N"�e�OrF�tŨ�>�3�#dX��G��m��B�L0"_�*cv��k��X��ı�,��-&��U�ptI��1eI�!�e���- �Ģ*�����J���~��,�14���F��:�m����ٖ�<PM�BR��\>�ְz��m�ē[E�~R�X�f�lE�L���Ѹ����ɩ��yq�:�!/0$�c����d묚����@;s7	��6?ؑ�V����rY]8�o��C��CI�P��9tVl�f���}&糖�3�1�T�Vsf�R�uӳ�l��#���3+y��F\��|Z�ʴ��M�.n���~NLj�0>s	5��!�<��x8�	NZʝ�h ى�\&)A_�+�����ލX�h��-f�S;�D �  �����D��X�~��p���Z��XɅu�8�mE�vE
�$B�����nO���0�g�'�i���g��.������ �L��gK����-<ډ��*��Y]\�;����³��	����o��5ެ�����MaJ�[�TT�������8}�T:��d�I�m��XE*�З�OJնu`)(�Ե�>��E"�a���g�2��4$7c0��s�vA$�¢s���	{�T�^E�&oS����-Ì�:TH������J��f譶`�KX�,��T�)"z�/)��/�k�4ڒ3�� ��,_pPVn�d�u<�M_�(�a���F�C��r:��2k��	����sҥ�Y�R��������8�o���i��#t����ʄ�'a�����\��,aCE��Jj�X^�0���M�Zȑg�c��F�,�.U*E�e�	�񸦮[�������e��/Hd7�x��4��}h"��խ�ʜy��g���m�[�ۍ���*r^)��p�d���0GA����Y�UR�����q���D&���'jdi�\�}��ơ�V�ۺ����w���h)���B�QӨ��NL�E��,�K��3���q@�EE�����\��V*��@���e�v9�3U������T�f�v JU���L��~t�>�9�ϣ�ŗV����r��U���H!����E��x�I��"?N�-�zo�� 0:ԍ���m�]�3"�`��G�����h���c�������6_^�\#����ʹ6�N�1��n�����V�6�[r/s��k8�������w,��4(1�-C[Dbl=�_^ާ�.�8ar�Q�D�u�����l�mU��I&�����0J.�
�L�֔�ء3�\� ����a&D�K5�cPĺ�����N�UB�jB���kN�/���	��~!���=��X���"qII�iژn�&kl�,rLH�
:	��חg��U�m�"�H��6o�ۂsҮ����Ӯ�����jh���е**��jWVns��y��`�̨�*]>o���q�=g1�B����\�J�n/ ӏp����n��~�	�%W�v堗�J�W��v�
�9�޶Bs���p*l]:=Ȝ��)�tNّdiw�L��U��9�;�Y�	}����P�4?x����&��,��
C��� ��\7�椥I9HU뫻���m��*� �%����B4����?�9���Tb*���)R��@�)�bE ��g�`Ԋ7���W�-ϥ�vSA�KjuZ3���e�m[.OL#�mJ,�Y me�cmo�, 3�E�� �6��_U���߀�clcX��d���ӕ����U����'%BI3{��%Mh�bF뵅I�G�p��=�L�;����9��yh�˝uP��Za�ٗ��]i/�*�b��88�na,��DP�/
g��u"v��"T��� �d:�-��X=���Xz�l}y��I����91B"�CQ-LD�ֵ�k��t.cST4g��p���H�d��	���W�
"�t�V�wR�MS!��}h��mQB���$�au
q��d �^���xA�h�,����U#����l-L�H�N̹	W�<�ڄ�`�ΰ�f��y�\>��Ԩ��<�uԼ�JJP�[�,����]y�b�xg�w�xg�w�xg�w�x�����ԩ�[N�W�M�pu��)U��ǁV��	���d�9	��kg�o��.�"=��S��$��P�Z|�ȒJ g�����\��+s�I�p@�%��b7��ۙ�^��bK4�bH���9;�����$�Qm~%"T<n
Bcna�y���t/�B�9���&�ʢk�G˰�5��/v��=�D]ʾ�9�ϡ�k�ʻ6��(1���\c{<`)�Q:�я��%����i��e���I��n����Ez�D�fX��JY�5��W��ڎk��Z�Y_�_i�1ٿ}�e����^I�ia�^I���l�'!\#�쁯��\�	Y~���MR�_h�� ��IN�e
j��Li�����G�/��e���� �bNUw��H�fu����W�����iW"#k�¯o�e*rL)JrHV�U��>Д��?��~� y�(*�h�}���d
�gw����РKP (H�&2�$s":\�Ỿ���5�����V�1Ӷ/]����A�G4��]�����s�����|}϶5�=�sv�MD�:I�6,/�<��9X�u������]kS�͛��n7K�g��{1�Z���֌P�T__T�$*Kt�6k.�ߵ�0/r������)���ԟ�\;�)x�ڐf��w$}�x�_�_�F�p(k�x��{*ayG�U��,��h
hORe( ����ܢ��z� 4Ue�':�g��ḟ���f�1�h�~�]WV�@8^"�U������_��`�J�p�dZ�� ±Nd!�zZ`%�-���N�WZ[`��	���&���(�84'��)�g�h��(�o~���"+�jw�䤬ܛXXDlp5��{�s�L�t�Y	-��I�Ȁ�S�RX6|Ҫ\�|.����X��N_r'b1��~(�c�j�%��D�-�U��U%���;(����Z�,���x���mr��+[��Ԩ�d�<J�\]�#��*�hQ� v��'H	/CŮ \�&�U��c��&���c�-�Z�z�}�aerT��� �E��j��z{��mx`D��.k�N1���GB�܍Y�Ѫօ ����7��LY��ov�?�T���E�:�1	���>��u}��H��� �� 4U�ON�a��UE��3/)h8�f5Gx��ۺ?B������m���D�'�-@��קL�������C�ز�+.!����Bǎ)�l�]��$��4�&8wk��X͞�p+ܻ�X�MZ<d���'����AA���N���d~��qx�F���q�)'�ȣ�<$�$�b��Txo����Bw�t�<�$� Ig5�������ڹ�)������Kc	��\�\`�&<�K�L�뻚�l07NxZQ��}s�M$u�����$o*L�x�.�&�5����erǅ���:X���aO� �O��'���N>2�G�?O�$K�����"��ґ���P��y���7@����B,�z�Q��b�I!��M �c�E:��?O~@I
c�d$�������CC/w���ߗmZN��g;qя��A*��;��h����]T��/	�z:�}�H��t^jD��~3�41��Ņ�5.s��dٲ'�f�ɤ9q�CKG�NW%n:�_QV:ͅ�;��d���$��)�Ԗj�u9�	�̞��o�!+,$\�0���w�UR��B�O��rJ�:9*�^��L�̔aǳ�X��H5�䜀�Ub�qOz�F�km�q����7+�&�c��[6�p7B��R�#�����^!z�s]<�2�]<���Z��]�����R�Zvi�f59H�9��UV6�T����1�ᤦ�3�ʸ֑/os4��0,??ʌ@�O��o�!O3Jò����t*�`XZ�}�n/M[���7{M��u�t|&M�G�Un�;Q�糛=0h�C��]���vGQ���\Î�����ƅ�<9\�Zk�z֠X2��X�Tȭ��V��3�����Yb�v�k%�#��0_����Ӟ�#I"��w#�|҃��V���@^c��Y[{Z�^�r�e@Q����Z�g�P\_��`T������X���̧�|�|�������]��W�+W����y[            x������ � �         G   x�3���OI-J,�/�4202�54�54W02�22�21�365�60�#�e�YZ�J�fc�Ĕ��<2u��qqq ��'g         O   x�}ͱ� D�O�>��3��:�8�O_�FTX������i�pCe���45W�O�.���W�FO�E�
*"/�+�         @  x�u�;r�@ ��z9�]��`��$bDA|�0iV`\P2>���9b�I�I&&������͇u��$Jz�Lx��~����5�������	�S��t<ci�/�Z����z���V�O����&�F��BL�8~�Sq:��nb�$�LP�mD��^!��"�,�)x�u�>
�b�7ּ�����c�����R�f����j��T�C�N��3FT��`*x*d�q��P0�5z��7I��2,Ω�����C�v�a�z�t��E�h��6��8�[�F��{>�QȿT5L(0���tx��� �H��g(I�樄�     