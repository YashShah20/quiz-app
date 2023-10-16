--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

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

--
-- Name: category_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_seq
    START WITH 23
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    category_id integer DEFAULT nextval('public.category_seq'::regclass) NOT NULL,
    name text
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.options (
    question_id bigint,
    option text,
    is_correct boolean DEFAULT false NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE public.options OWNER TO postgres;

--
-- Name: options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.options_id_seq OWNER TO postgres;

--
-- Name: options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.options_id_seq OWNED BY public.options.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questions (
    id bigint NOT NULL,
    question text NOT NULL,
    type character varying(15),
    category_id integer NOT NULL,
    difficulty smallint
);


ALTER TABLE public.questions OWNER TO postgres;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO postgres;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: quizes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quizes (
    id bigint NOT NULL,
    category_id smallint,
    day timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    score integer,
    user_name text
);


ALTER TABLE public.quizes OWNER TO postgres;

--
-- Name: quizes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quizes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quizes_id_seq OWNER TO postgres;

--
-- Name: quizes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quizes_id_seq OWNED BY public.quizes.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name text,
    password text,
    role smallint
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: options id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options ALTER COLUMN id SET DEFAULT nextval('public.options_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: quizes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizes ALTER COLUMN id SET DEFAULT nextval('public.quizes_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (category_id, name) FROM stdin;
0	random
2	Entertainment: Video Games
3	Entertainment: Music
4	Sports
6	Geography
7	Entertainment: Books
8	Science: Mathematics
9	Science & Nature
10	Entertainment: Film
12	Entertainment: Board Games
13	History
14	Celebrities
15	Entertainment: Television
16	Politics
17	Animals
18	Entertainment: Japanese Anime & Manga
19	Entertainment: Cartoon & Animations
20	Mythology
21	Vehicles
22	Entertainment: Comics
\.


--
-- Data for Name: options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.options (question_id, option, is_correct, id) FROM stdin;
51	J.K. Rowling	t	5581
51	J.R.R. Tolkien	f	5582
51	Terry Pratchett	f	5583
51	Daniel Radcliffe	f	5584
52	George R. R. Martin	t	5585
52	George Lucas	f	5586
52	George Orwell	f	5587
52	George Eliot	f	5588
53	Frankenstein	t	5589
53	Dracula	f	5590
53	The Strange Case of Dr. Jekyll and Mr. Hyde 	f	5591
53	The Legend of Sleepy Hollow	f	5592
54	Herman Melville	t	5593
54	William Golding	f	5594
54	William Shakespeare	f	5595
54	J. R. R. Tolkien	f	5596
55	7	t	5597
55	6	f	5598
55	8	f	5599
55	5	f	5600
56	The Nautilus	t	5601
56	The Neptune	f	5602
56	The Poseidon  	f	5603
56	The Atlantis	f	5604
57	The Lord of the Rings	t	5605
57	The Little Prince	f	5606
57	Harry Potter and the Philosopher&#039;s Stone	f	5607
57	The Da Vinci Code	f	5608
58	Ira Levin	t	5609
58	Stephen King	f	5610
58	Robert Bloch	f	5611
58	Mary Shelley	f	5612
59	Astoria Greengrass	t	5613
59	Pansy Parkinson	f	5614
59	Millicent Bulstrode	f	5615
59	Hermione Granger	f	5616
60	Bilius	t	5617
60	Arthur	f	5618
60	John	f	5619
60	Dominic	f	5620
61	Gloin	t	5621
61	Thorin Oakenshield	f	5622
61	Bombur	f	5623
61	Dwalin	f	5624
62	Hunter S. Thompson	t	5625
62	F. Scott Fitzgerald	f	5626
62	Henry Miller	f	5627
62	William S. Burroughs	f	5628
63	Great Expectations	t	5629
63	The Pickwick Papers	f	5630
63	Nicholas Nickleby	f	5631
63	Oliver Twist	f	5632
64	Dr. Seuss	t	5633
64	Beatrix Potter	f	5634
64	Roald Dahl	f	5635
64	A.A. Milne	f	5636
65	Ian Fleming	t	5637
65	Joseph Conrad	f	5638
65	John Buchan	f	5639
65	Graham Greene	f	5640
66	Lincoln Island	t	5641
66	Vulcania Island	f	5642
66	Prometheus Island	f	5643
66	Neptune Island	f	5644
67	George Orwell	t	5645
67	Aldous Huxley	f	5646
67	Ernest Hemingway	f	5647
67	Ray Bradbury	f	5648
68	Albus Percival Wulfric Brian Dumbledore	t	5649
68	Albus Valum Jetta Mobius Dumbledore	f	5650
68	Albus James Lunae Otto Dumbledore	f	5651
68	Albus Valencium Horatio Kul Dumbledore	f	5652
69	Bard	t	5653
69	Bilbo Baggins	f	5654
69	Gandalf the Grey	f	5655
69	Frodo	f	5656
70	True	t	5657
70	False	f	5658
71	John Steinbeck 	t	5659
71	George Orwell	f	5660
71	Mark Twain 	f	5661
71	Harper Lee	f	5662
72	True	t	5663
72	False	f	5664
73	The Balmoral	t	5665
73	The Dunstane Hotel	f	5666
73	Hotel Novotel	f	5667
73	Sheraton Grand Hotel &amp; Spa	f	5668
74	True	t	5669
74	False	f	5670
75	My Struggle	t	5671
75	My Hatred	f	5672
75	My Sadness	f	5673
75	My Desire	f	5674
76	John Steinbeck	t	5675
76	F. Scott Fitzgerald	f	5676
76	Ernest Hemingway	f	5677
76	William Faulkner	f	5678
77	42	t	5679
77	Loving everyone around you	f	5680
77	Chocolate	f	5681
77	Death	f	5682
78	Antoine de Saint-Exup&eacute;ry	t	5683
78	Miguel de Cervantes Saavedra	f	5684
78	Jane Austen	f	5685
78	F. Scott Fitzgerald	f	5686
79	True	t	5687
79	False	f	5688
80	Maximum Ride	t	5689
80	Harry Potter	f	5690
80	The Legend of Xanth	f	5691
80	The Bartemaeus Trilogy	f	5692
81	9	t	5693
81	5	f	5694
81	11	f	5695
81	13	f	5696
82	Procompsognathus	t	5697
82	Dilophosaurus	f	5698
82	Tyrannosaurus Rex	f	5699
82	Velociraptor	f	5700
83	Answer a riddle	t	5701
83	Rhythmically tap barrels with a wand	f	5702
83	Speak a password	f	5703
83	Knock in sequence	f	5704
84	Mycroft Holmes	t	5705
84	Mederi Holmes	f	5706
84	Martin Holmes	f	5707
84	Herbie Hancock Holmes	f	5708
85	&quot;So long, and thanks for all the fish.&quot;	t	5709
85	&quot;The answer is 42.&quot;	f	5710
85	&quot;Land of the brave.&quot;	f	5711
85	&quot;Goodbye cruel world!&quot;	f	5712
86	1989 Toyota Land Cruiser	t	5713
86	1989 Jeep Wrangler YJ Sahar	f	5714
86	1989 Ford Explorer XLT	f	5715
86	Mercedes M-Class	f	5716
87	June	t	5717
87	August	f	5718
87	April	f	5719
87	May	f	5720
88	Joe Sugg	t	5721
88	Zoe Sugg	f	5722
88	Joe Weller	f	5723
88	Alfie Deyes	f	5724
89	Amy	t	5725
89	Beth	f	5726
89	Jo	f	5727
89	Meg	f	5728
90	Ulgrotha	t	5729
90	Bant	f	5730
90	Llanowar	f	5731
90	Tazeem	f	5732
91	A Clash of Kings	t	5733
91	A Dance with Dragons	f	5734
91	A Storm of Swords	f	5735
91	A Feast for Crows	f	5736
92	The Day of the Locust	t	5737
92	Catch-22	f	5738
92	Of Mice and Men	f	5739
92	A Separate Peace	f	5740
93	True	t	5741
93	False	f	5742
94	Wessex	t	5743
94	Barsetshire	f	5744
94	Fulchester	f	5745
94	Ambridge	f	5746
95	The Prince and the Pauper	t	5747
95	Hamlet	f	5748
95	Wealthy Boy and the Schmuck	f	5749
95	A Modern Twain Story	f	5750
96	Anna Karenina	t	5751
96	Notes from the Underground	f	5752
96	Crime and Punishment	f	5753
96	The Brothers Karamazov	f	5754
97	Falcon	t	5755
97	Eagle	f	5756
97	Kyte	f	5757
97	Swallow	f	5758
98	False	t	5759
98	True	f	5760
99	Godric&#039;s Hollow	t	5761
99	Hogsmeade	f	5762
99	Ottery St. Catchpole	f	5763
99	Little Hangleton	f	5764
100	Zhao Yun	t	5765
100	Liu Bei	f	5766
100	Guan Yu	f	5767
100	Zhang Fei	f	5768
101	Rope	t	5769
101	Psycho	f	5770
101	Vertigo	f	5771
101	Rebecca	f	5772
102	Tommy Lee Jones	t	5773
102	Harrison Ford	f	5774
102	Harvey Keitel	f	5775
102	Martin Landau	f	5776
103	Johnny Depp	t	5777
103	 Clint Eastwood	f	5778
103	Leonardo DiCaprio	f	5779
103	Ben Stiller	f	5780
104	Auric Goldfinger	t	5781
104	Dr. Julius No	f	5782
104	Rosa Klebb	f	5783
104	Emilio Largo	f	5784
105	Top Gun	t	5785
105	Days of Thunder	f	5786
105	The Color of Money	f	5787
105	Cocktail	f	5788
106	False	t	5789
106	True	f	5790
107	A galloping horse	t	5791
107	A woman in a dress	f	5792
107	A man walking	f	5793
107	A crackling fire	f	5794
108	The Hateful Eight	t	5795
108	Tron: Legacy	f	5796
108	The Giver	f	5797
108	True Grit	f	5798
109	Milla Jovovich	t	5799
109	Madison Derpe	f	5800
109	Milla Johnson	f	5801
109	Kim Demp	f	5802
110	Snow White and the Seven Dwarfs	t	5803
110	Pinocchio	f	5804
110	Dumbo	f	5805
110	Fantasia	f	5806
111	Jimmy Cooper	t	5807
111	Pete Townshend	f	5808
111	Franc Roddam	f	5809
111	Archie Bunker	f	5810
112	Victoria	t	5811
112	Ip Man 2	f	5812
112	The Bourne Legacy	f	5813
112	L&eacute;on: The Professional	f	5814
113	True	t	5815
113	False	f	5816
114	Wilson	t	5817
114	Carson	f	5818
114	Jackson	f	5819
114	Willy	f	5820
115	Men of Harlech	t	5821
115	Scotland the Brave	f	5822
115	Colonel Bogey March	f	5823
115	The British Grenadiers	f	5824
116	Vincent Vega	t	5825
116	Jules Winnfield	f	5826
116	Jimmie Dimmick	f	5827
116	Butch Coolidge	f	5828
117	Air	t	5829
117	The Schwartz	f	5830
117	Princess Lonestar	f	5831
117	Meatballs	f	5832
118	True	t	5833
118	False	f	5834
119	Always wear a shirt	t	5835
119	You do not talk about FIGHT CLUB	f	5836
119	Only two guys to a fight	f	5837
119	Fights will go on as long as they have to	f	5838
120	Anguirus	t	5839
120	King Kong	f	5840
120	Mothra	f	5841
120	King Ghidora	f	5842
121	Gunnar Hansen	t	5843
121	Edwin Neal	f	5844
121	John Dugan	f	5845
121	Joe Bill Hogan	f	5846
122	False	t	5847
122	True	f	5848
123	False	t	5849
123	True	f	5850
124	John Matrix	t	5851
124	Ben Richards	f	5852
124	Douglas Quaid	f	5853
124	Harry Tasker	f	5854
125	Fight Club	t	5855
125	The Island	f	5856
125	Unthinkable	f	5857
125	American Pie	f	5858
126	Aloysius O&#039;Hare	t	5859
126	Ted Wiggins	f	5860
126	The Once-Ler	f	5861
126	Grammy Norma	f	5862
127	Jack Black	t	5863
127	Mirana Jonnes	f	5864
127	McConahey Ramses	f	5865
127	Jim Petersson	f	5866
128	Mrs. Doubtfire	t	5867
128	Old Dogs	f	5868
128	Jumanji	f	5869
128	Awakenings	f	5870
129	Louis Theroux	t	5871
129	Errol Morris	f	5872
129	Joe Berlinger	f	5873
129	Adam Curtis	f	5874
130	Isla Nublar	t	5875
130	Isla Sorna	f	5876
130	Isla Muerta	f	5877
130	Isla Pena	f	5878
131	1985	t	5879
131	1988	f	5880
131	1986	f	5881
131	1993	f	5882
132	&quot;A Fistful of Dollars&quot;, &quot;For a Few Dollars More&quot;, &quot;The Good, the Bad, and the Ugly&quot;	t	5883
132	&quot;The Good, the Bad, and the Ugly&quot;, &quot;For A Few Dollars More&quot;, &quot;A Fistful of Dollars&quot;	f	5884
132	&quot;For a Few Dollars More&quot;, &quot;The Good, the Bad, and the Ugly&quot;, &quot;A Fistful of Dollars&quot;	f	5885
132	&quot;For a Few Dollars More&quot;, &quot;A Fistful of Dollars&quot;, &quot;The Good, the Bad, and the Ugly&quot;	f	5886
133	Leonard Nimoy	t	5887
133	William Shatner	f	5888
133	George Takei	f	5889
133	James Doohan	f	5890
134	Dave	t	5891
134	John	f	5892
134	Will	f	5893
134	Carl	f	5894
135	San Francisco	t	5895
135	Los Angeles	f	5896
135	Sacramento	f	5897
135	San Jose	f	5898
136	Pelekai	t	5899
136	Anoaʻi	f	5900
136	Kealoha	f	5901
136	Kuʻulei	f	5902
137	Baby penguins	t	5903
137	Baby monkeys	f	5904
137	Baby ostriches	f	5905
137	Baby bears	f	5906
138	Camp Crystal Lake	t	5907
138	Packanack	f	5908
138	Higgins Haven	f	5909
138	Camp Forest Green	f	5910
139	False	t	5911
139	True	f	5912
140	Gilbert Gottfried	t	5913
140	Robin Williams	f	5914
140	Pauly Shore	f	5915
140	Jonathan Freeman	f	5916
141	Plan 9 from Outer Space	t	5917
141	The Man from Planet X	f	5918
141	It Came from Outer Space	f	5919
141	The Day The Earth Stood Still	f	5920
142	The Muppets Take Manhattan	t	5921
142	The Great Muppet Caper	f	5922
142	The Muppet Christmas Carol	f	5923
142	The Muppet Movie	f	5924
143	Shirley Basey	t	5925
143	Tom Jones	f	5926
143	John Barry	f	5927
143	Sheena Easton	f	5928
144	Too Agonizing	t	5929
144	Too Loud	f	5930
144	Too Harsh	f	5931
144	Too Violent	f	5932
145	Nigeria	t	5933
145	United States	f	5934
145	China	f	5935
145	France	f	5936
146	Alan Alda	t	5937
146	Eddie Murphy	f	5938
146	Alec Baldwin	f	5939
146	Kevin Nealon	f	5940
147	Ben Burtt	t	5941
147	Ken Burns	f	5942
147	Ralph McQuarrie	f	5943
147	Miranda Keyes	f	5944
148	Minnesota	t	5945
148	North Dakota	f	5946
148	South Dakota	f	5947
148	Wisconsin	f	5948
149	Mining gear	t	5949
149	Clown costume	f	5950
149	Santa suit	f	5951
149	Police uniform	f	5952
150	RoboCop	t	5953
150	Blade Runner	f	5954
150	The Terminator	f	5955
150	Predator 2	f	5956
155	Drukqs	t	5973
155	Windowlicker	f	5974
155	Syro	f	5975
155	Collected Ambient Works 85-92	f	5976
156	N.W.A	t	5977
156	Wu-Tang Clan	f	5978
156	Run-D.M.C.	f	5979
156	Beastie Boys	f	5980
157	False	t	5981
157	True	f	5982
158	True	t	5983
158	False	f	5984
159	Les Paul Standard	t	5985
159	Fender Stratocaster	f	5986
159	LsL Mongrel	f	5987
159	Gretsch Falcon	f	5988
160	False	t	5989
160	True	f	5990
161	Ascent	t	5991
161	Monody	f	5992
161	Windfall	f	5993
161	Infinite Power!	f	5994
162	White	t	5995
162	Black	f	5996
162	Blue	f	5997
162	Yellow	f	5998
163	Portuguese	t	5999
163	Japanese	f	6000
163	French	f	6001
163	Spanish	f	6002
164	True	t	6003
164	False	f	6004
165	Canada	t	6005
165	United States	f	6006
165	Australia	f	6007
165	United Kingdom	f	6008
166	Silence	t	6009
166	Farts	f	6010
166	People talking	f	6011
166	Cricket chirps	f	6012
167	Left Alone	t	6013
167	What About Us	f	6014
167	This Song Is Not About A Girl	f	6015
167	Drop The Game	f	6016
168	Lisa Frank 420 / Modern Computing	t	6017
168	Smoke Weed 420 / Everyday	f	6018
168	Make Your Move 420 / My Mind	f	6019
168	It&#039;s All In Your Head 420 / Understand	f	6020
169	Karen Smith	t	6021
169	Gretchen Weiners	f	6022
169	Janice Ian	f	6023
169	Cady Heron	f	6024
170	The Beatles (White Album)	t	6025
170	Rubber Soul	f	6026
170	Abbey Road	f	6027
170	Magical Mystery Tour	f	6028
171	Adventure	t	6029
171	The City	f	6030
171	Icarus	f	6031
171	Pop Culture	f	6032
172	Welcome to Miami	t	6033
172	Dale	f	6034
172	Global Warming	f	6035
172	Armando	f	6036
173	Duran Duran	t	6037
173	The Cure	f	6038
173	New Order	f	6039
173	Depeche Mode	f	6040
174	Sukiyaki	t	6041
174	Takoyaki	f	6042
174	Sushi	f	6043
174	Oden	f	6044
175	Bass Guitar	t	6045
175	Drums	f	6046
175	Guitar	f	6047
175	Keyboards	f	6048
176	Illmatic	t	6049
176	The Low End Theory	f	6050
176	The Chronic	f	6051
176	Enter The Wu-Tang (36 Chambers)	f	6052
177	Compton	t	6053
177	Detroit	f	6054
177	New York	f	6055
177	Baltimore	f	6056
178	The Velvet Underground and Nico	t	6057
178	Abbey Road	f	6058
178	Led Zeppelin IV	f	6059
178	Pet Sounds	f	6060
179	True	t	6061
179	False	f	6062
180	Sweden	t	6063
180	Finland	f	6064
180	Denmark	f	6065
180	Norway	f	6066
181	Jamie Foxx	t	6067
181	Alec Baldwin	f	6068
181	Dwayne Johnson	f	6069
181	 Bruce Willis	f	6070
182	Bionicle	t	6071
182	Hero Factory	f	6072
182	Ben 10 Alien Force	f	6073
182	Star Wars	f	6074
183	Billie Joe Armstrong	t	6075
183	Mike Dirnt	f	6076
183	Sean Hughes	f	6077
183	Tr&eacute; Cool	f	6078
184	Get Lucky	t	6079
184	Doin&#039; It Right	f	6080
184	Instant Crush	f	6081
184	The Game of Love	f	6082
185	4	t	6083
185	5	f	6084
185	2	f	6085
185	18	f	6086
186	2012	t	6087
186	2015	f	6088
186	2010	f	6089
186	1967	f	6090
187	Ringo Starr	t	6091
187	George Harrison	f	6092
187	John Lennon	f	6093
187	Paul McCartney	f	6094
188	Dog Blood	t	6095
188	Jack &Uuml;	f	6096
188	What So Not	f	6097
188	Noisia	f	6098
189	Dave Navarro	t	6099
189	Tom Morello 	f	6100
189	Billy Corgan	f	6101
189	Ed O&#039;Brien	f	6102
190	Viktor Tsoi	t	6103
190	Jimi Hendrix	f	6104
190	Brian Jones	f	6105
190	Vladimir Vysotsky	f	6106
191	Animals	t	6107
191	The Wall	f	6108
191	Wish You Were Here	f	6109
191	The Final Cut	f	6110
192	Billy Corgan	t	6111
192	Brett Scallions	f	6112
192	Eddie Vedder	f	6113
192	Chino Moreno	f	6114
193	Deftones	t	6115
193	Tool	f	6116
193	Korn	f	6117
193	Type O Negative	f	6118
194	Red Hot Chilli Peppers	t	6119
194	Green Day	f	6120
194	Linkin Park	f	6121
194	Foo Fighters	f	6122
195	Can&#039;t Help Falling in Love	t	6123
195	Jailhouse Rock	f	6124
195	In the Ghetto	f	6125
195	Wooden Heart	f	6126
196	4	t	6127
196	5	f	6128
196	6	f	6129
196	8	f	6130
197	New Musical Express	t	6131
197	New Metro Entertainment	f	6132
197	Next Musical Enterprise	f	6133
197	North Manchester Express	f	6134
198	&quot;Database&quot;	t	6135
198	&quot;Dead End in Tokyo&quot;	f	6136
198	&quot;Raise Your Flag&quot;	f	6137
198	&quot;Out of Control&quot;	f	6138
199	Only Built 4 Cuban Linx	t	6139
199	Shaolin vs Wu-Tang	f	6140
199	The Wild	f	6141
199	The Lex Diamond Story	f	6142
200	Alex Turner	t	6143
200	Jamie Cook	f	6144
200	Matt Helders	f	6145
200	Nick O&#039;Malley	f	6146
201	False	t	6147
201	True	f	6148
202	Dexter	t	6149
202	Marvel&#039;s Daredevil	f	6150
202	Boardwalk Empire	f	6151
202	The Walking Dead	f	6152
203	Michael Emerson	t	6153
203	Jim Caviezel	f	6154
203	Taraji P. Henson	f	6155
203	Kevin Chapman	f	6156
204	Teardrop	t	6157
204	Protection	f	6158
204	Angel	f	6159
204	Black Milk	f	6160
205	Frankie Laine	t	6161
205	Guy Mitchell	f	6162
205	 Tennessee Ernie Ford	f	6163
205	Slim Whitman	f	6164
206	2007	t	6165
206	2008	f	6166
206	2006	f	6167
206	2009	f	6168
207	Walter White	t	6169
207	Saul Goodman	f	6170
207	Jesse Pinkman	f	6171
207	Skyler White	f	6172
208	Todd Chavez	t	6173
208	Lennie Turtletaub	f	6174
208	Princess Carolyn	f	6175
208	Tom Jumbo-Grumbo	f	6176
209	Kiefer Sutherland	t	6177
209	Kevin Bacon	f	6178
209	Hugh Laurie	f	6179
209	Rob Lowe	f	6180
210	Bubbles (2016)	t	6181
210	Twilight Sparkle	f	6182
210	Timmy Turner	f	6183
210	Harley Quinn	f	6184
211	Pinhead	t	6185
211	Starfish	f	6186
211	Larry	f	6187
211	Dirty Dan	f	6188
212	True	t	6189
212	False	f	6190
213	RiDGiD STUDiOS	t	6191
213	Dan Bell	f	6192
213	Billy Familia	f	6193
213	VeganGainz	f	6194
214	JonTron	t	6195
214	Pewdiepie	f	6196
214	Tobuscus	f	6197
214	Markiplier	f	6198
215	True	t	6199
215	False	f	6200
216	Green	t	6201
216	Blue	f	6202
216	Red	f	6203
216	Purple	f	6204
217	Essos	t	6205
217	Easteros	f	6206
217	Westereast	f	6207
217	Esuntos	f	6208
218	Petyr Baelish	t	6209
218	Podrick Payne	f	6210
218	Lancel Lannister	f	6211
218	Torrhen Karstark	f	6212
219	2013	t	6213
219	2014	f	6214
219	2016	f	6215
219	2015	f	6216
220	Should I Stay or Should I Go?	t	6217
220	Love Will Tear Us Apart	f	6218
220	This Charming Man	f	6219
220	Africa	f	6220
221	Scotland	t	6221
221	England	f	6222
221	Sweden	f	6223
221	Germany	f	6224
222	Oprah	t	6225
222	Jimmy Fallon	f	6226
222	Saturday Night Live	f	6227
222	Larry Rubert	f	6228
223	Juan Joya Borga	t	6229
223	Gabriel Garcia Marquez	f	6230
223	Jesus Quintero	f	6231
223	Ernesto Guevara	f	6232
224	Wolowizard	t	6233
224	Sheldor	f	6234
224	Rajesh	f	6235
224	Priya	f	6236
225	Dixon	t	6237
225	Grimes	f	6238
225	Dickinson	f	6239
225	Dicketson	f	6240
226	True	t	6241
226	False	f	6242
227	Steven Moffatt	t	6243
227	Phil Ford	f	6244
227	Russell T Davies	f	6245
227	Toby Whithouse	f	6246
228	Triple H	t	6247
228	Roman Reigns	f	6248
228	AJ Styles	f	6249
228	Dean Ambrose	f	6250
229	Megatron Griffin	t	6251
229	Who-Cares Griffin	f	6252
229	Neil Griffin	f	6253
229	Megan Griffin	f	6254
230	Stef&aacute;n Stef&aacute;nsson	t	6255
230	Adam Sandler	f	6256
230	Magn&uacute;s Scheving	f	6257
230	Stephen Carl	f	6258
231	Hors d&#039;oeuvre	t	6259
231	Racht	f	6260
231	Gagh	f	6261
231	Bloodwine	f	6262
232	True	t	6263
232	False	f	6264
233	True	t	6265
233	False	f	6266
234	Kahless the Unforgettable	t	6267
234	Lady Lukara of the Great Hall	f	6268
234	Molor the Unforgiving	f	6269
234	Dahar Master Kor	f	6270
235	Klingon	t	6271
235	Vulcan	f	6272
235	Human	f	6273
235	Botha	f	6274
236	Grapok sauce	t	6275
236	Gazorpazorp pudding	f	6276
236	Sweet chili sauce	f	6277
236	Grapork sauce	f	6278
237	5	t	6279
237	10	f	6280
237	2	f	6281
237	7	f	6282
238	2	t	6283
238	10	f	6284
238	5	f	6285
238	3	f	6286
239	Great Dane	t	6287
239	Pit bull	f	6288
239	Boxer	f	6289
239	Doberman Pinscher	f	6290
240	Roseanne	t	6291
240	Boy Meets World	f	6292
240	The X-Files	f	6293
240	NYPD Blue	f	6294
241	Kelly Clarkson	t	6295
241	Justin Guarini	f	6296
241	Ruben Studdard	f	6297
241	Chris Daughtry	f	6298
242	Chris Jericho	t	6299
242	Marty Jannetty	f	6300
242	Scott Hall	f	6301
242	Shawn Michaels	f	6302
243	Walkers	t	6303
243	Creepers	f	6304
243	Maggots	f	6305
243	Hell Pigs	f	6306
244	Beth	t	6307
244	Rick	f	6308
244	Jerry	f	6309
244	Morty	f	6310
245	1983	t	6311
245	1981	f	6312
245	1985	f	6313
245	1987	f	6314
246	Amanda Barrie	t	6315
246	Sue Nicholls	f	6316
246	Violet Carson	f	6317
246	Jean Alexander	f	6318
247	Longclaw	t	6319
247	Oathkeeper	f	6320
247	Widow&#039;s Wail	f	6321
247	Needle	f	6322
248	Major Fraud	t	6323
248	Ingram Cheater	f	6324
248	Coughing Major	f	6325
248	Millionaire Crime	f	6326
249	Alan Tudyk	t	6327
249	Adam Baldwin	f	6328
249	Nathan Fillion	f	6329
249	Sean Maher	f	6330
250	TT Type 40, Mark 3 (TARDIS)	t	6331
250	TT Type 1, Mark 3 (TARDIS)	f	6332
250	TT Type 40, Mark 5 (TARDIS)	f	6333
250	TT Type 1, Mark 5 (TARDIS)	f	6334
254	True	t	6347
254	False	f	6348
255	Pokemon	t	6349
255	Dragon Ball	f	6350
255	Sonic The Hedgehog	f	6351
255	Yugioh	f	6352
256	Slalom	t	6353
256	R.C. Pro-Am	f	6354
256	Donkey Kong Country	f	6355
256	Battletoads	f	6356
257	91.28 m/s^2	t	6357
257	110  m/s^2	f	6358
257	9.42  m/s^2	f	6359
257	4.4  m/s^2	f	6360
258	$4750	t	6361
258	$4500	f	6362
258	$4650	f	6363
258	$5000	f	6364
259	Townley	t	6365
259	De Santos	f	6366
259	Watson	f	6367
259	Simpson	f	6368
260	9	t	6369
260	10	f	6370
260	8	f	6371
260	7	f	6372
261	1998	t	6373
261	2004	f	6374
261	1999	f	6375
261	1997	f	6376
262	True	t	6377
262	False	f	6378
263	Pok&eacute;mon Crystal	t	6379
263	Pok&eacute;mon Platinum	f	6380
263	Pok&eacute;mon FireRed	f	6381
263	Pok&eacute;mon Black	f	6382
264	Novakid	t	6383
264	Avian	f	6384
264	Human	f	6385
264	Hylotl	f	6386
265	Mario Tennis	t	6387
265	Mario Party 3	f	6388
265	Mario Kart: Double Dash!!	f	6389
265	Mario Golf: Toadstool Tour	f	6390
266	&quot;You done?&quot;	t	6391
266	&quot;Whoa there.&quot;	f	6392
266	&quot;Hold up now.&quot;	f	6393
266	&quot;Don&#039;t move.&quot;	f	6394
267	Junkrat and Roadhog	t	6395
267	Roadrat and Junkhog	f	6396
267	Ana and Pharah	f	6397
267	McCree and Deadeye	f	6398
268	30	t	6399
268	5	f	6400
268	60	f	6401
268	15	f	6402
269	Shoot &#039;em up	t	6403
269	Strategy	f	6404
269	FPS	f	6405
269	Casual	f	6406
270	Skeleton King	t	6407
270	Reaper King	f	6408
270	Skull King	f	6409
270	Hell King	f	6410
271	James Heller	t	6411
271	Alex Mercer	f	6412
271	Dana Mercer	f	6413
271	Any Goliaths roaming around	f	6414
272	474	t	6415
272	376	f	6416
272	432	f	6417
272	589	f	6418
273	Shin Kuroi	t	6419
273	Kouya Aotsuki	f	6420
273	Soutarou Touno	f	6421
273	Torahiko Ooshima	f	6422
274	CDC	t	6423
274	Cleaners	f	6424
274	Last Man Batallion	f	6425
274	Rikers	f	6426
275	s	t	6427
275	n	f	6428
275	i	f	6429
275	m	f	6430
276	Cicero	t	6431
276	Lucien Lachance	f	6432
276	Archimedes	f	6433
276	Astrid	f	6434
277	Corrin	t	6435
277	Cloud	f	6436
277	Bayonnetta	f	6437
277	Ryu	f	6438
278	True	t	6439
278	False	f	6440
279	Pig	t	6441
279	Zombie	f	6442
279	Chicken	f	6443
279	Cow	f	6444
280	60	t	6445
280	65	f	6446
280	55	f	6447
280	70	f	6448
281	Delirium	t	6449
281	Mega Satan	f	6450
281	Hush	f	6451
281	The Lamb	f	6452
282	Sid Meier&#039;s Civilization VI	t	6453
282	Grand Theft Auto V	f	6454
282	Counter Strike: Global Offensive	f	6455
282	Dark Souls III	f	6456
283	Haley Joel Osment	t	6457
283	Kōki Uchiyama	f	6458
283	Jesse McCartney	f	6459
283	Miyu Irino	f	6460
284	Rank 1 Legend	t	6461
284	Rank 1 Elite	f	6462
284	Rank 1 Master	f	6463
284	Rank 1 Supreme	f	6464
285	October 24, 2005	t	6465
285	October 21, 2005	f	6466
285	March 29, 2006	f	6467
285	November 22, 2004	f	6468
286	Generator 5	t	6469
286	Generator 3	f	6470
286	Generator 4	f	6471
286	Excavation Site	f	6472
287	HRL-7	t	6473
287	Heavy Crossbow	f	6474
287	Thanatos .50 cal	f	6475
287	Broomstick Pistol	f	6476
288	Terraria	t	6477
288	Minecraft	f	6478
288	Starbound	f	6479
288	Factorio	f	6480
289	Rico Rodriguez	t	6481
289	Tom Sheldon	f	6482
289	Marcus Holloway	f	6483
289	Mario Frigo	f	6484
290	Scoot	t	6485
290	Drake	f	6486
290	Bill	f	6487
290	Mallary	f	6488
291	Hideo Kojima	t	6489
291	Hiroshi Yamauchi	f	6490
291	Shigeru Miyamoto	f	6491
291	Gunpei Yokoi	f	6492
292	Popo and Nana	t	6493
292	Popo and Nina	f	6494
292	Papi and Nana	f	6495
292	Papi and Nina	f	6496
293	A-Spec	t	6497
293	Championship	f	6498
293	Drive	f	6499
293	Nitro	f	6500
294	Ripper Roo	t	6501
294	Papu Papu	f	6502
294	Komodo brothers	f	6503
294	Nitros Oxide	f	6504
295	Shulk	t	6505
295	Reyn	f	6506
295	Fiora	f	6507
295	Dunban	f	6508
296	Sosnovka	t	6509
296	Novorepnoye	f	6510
296	Mylta	f	6511
296	Yasnaya	f	6512
297	The Knight	t	6513
297	The Wizard	f	6514
297	The Archer	f	6515
297	The Warrior	f	6516
298	True	t	6517
298	False	f	6518
299	Marlon	t	6519
299	Marnie	f	6520
299	Morris	f	6521
299	Marvin	f	6522
300	The landlord of the American headquarters	t	6523
300	Shigeru Miyamoto&#039;s father in law	f	6524
300	Satoru Iwata&#039;s plumber	f	6525
300	The date (Mar 10) that Donkey Kong was released.	f	6526
301	Carcassonne	t	6527
301	Paris	f	6528
301	Marseille	f	6529
301	Clermont-Ferrand	f	6530
302	True	t	6531
302	False	f	6532
303	Brown	t	6533
303	Green	f	6534
303	Yellow	f	6535
303	Blue	f	6536
304	40	t	6537
304	28	f	6538
304	55	f	6539
304	36	f	6540
305	Five	t	6541
305	Four	f	6542
305	Six	f	6543
305	Eight	f	6544
306	Free Parking	t	6545
306	Go to Jail	f	6546
306	Jail	f	6547
306	The Electric Company	f	6548
307	21	t	6549
307	24	f	6550
307	15	f	6551
307	18	f	6552
308	Electric Company	t	6553
308	Water Works	f	6554
308	Chance	f	6555
308	Community Chest	f	6556
309	Senet	t	6557
309	Chess	f	6558
309	Checkers	f	6559
309	Go	f	6560
310	False	t	6561
310	True	f	6562
311	1991	t	6563
311	1992	f	6564
311	1989	f	6565
311	1995	f	6566
312	The Gatekeeper	t	6567
312	The Kryptkeeper	f	6568
312	The Monster	f	6569
312	The Nightmare	f	6570
313	10	t	6571
313	8	f	6572
313	5	f	6573
313	6	f	6574
314	Monopoly	t	6575
314	Pay Day	f	6576
314	Cluedo	f	6577
314	Coppit	f	6578
315	True	t	6579
315	False	f	6580
316	True	t	6581
316	False	f	6582
317	$180	t	6583
317	$200	f	6584
317	$160	f	6585
317	$220	f	6586
318	$35	t	6587
318	$30	f	6588
318	$50	f	6589
318	$45	f	6590
319	Extreme Dungeons &amp; Dragons	t	6591
319	Advanced Dungeons &amp; Dragons	f	6592
319	Dungeons &amp; Dragons 3.5th edition	f	6593
319	Advanced Dungeons &amp; Dragons 2nd edition	f	6594
320	Atlantic City, New Jersey	t	6595
320	Las Vegas, Nevada	f	6596
320	Duluth, Minnesota	f	6597
320	Charleston, South Carolina	f	6598
321	Tsumo	t	6599
321	Ron	f	6600
321	Rīchi	f	6601
321	Kan	f	6602
322	Bishop and Rook	t	6603
322	Rook and King	f	6604
322	Knight and Bishop	f	6605
322	King and Knight	f	6606
323	False	t	6607
323	True	f	6608
324	Overlay at least 2 Monsters of the Same Level	t	6609
324	Activate a Spell and Send Monsters to the Graveyard	f	6610
324	Add the Monsters&#039; Levels Together to Match the Xyz Monster	f	6611
324	Banish A Number of Monsters From Your Hand And Deck	f	6612
325	Go	t	6613
325	Chess	f	6614
325	Mahjong	f	6615
325	Shogi	f	6616
326	True	t	6617
326	False	f	6618
327	1996	t	6619
327	2003	f	6620
327	1999	f	6621
327	1993	f	6622
328	Reiner Knizia	t	6623
328	Bruno Cathala	f	6624
328	Uwe Rosenburg	f	6625
328	Allison Kline	f	6626
329	Tarrasque	t	6627
329	Beholder	f	6628
329	Displacer Beast	f	6629
329	Lich	f	6630
330	Tom Vasel	t	6631
330	Jason LeVine	f	6632
330	Borth Sampson	f	6633
330	Uncle Pennybags	f	6634
331	Blinkmoth Infusion	t	6635
331	Vitalizing Wind	f	6636
331	 Chant of Vitu-Ghazi	f	6637
331	Assert Authority	f	6638
332	Chimichanga	t	6639
332	Burrito	f	6640
332	Taquito	f	6641
332	Enchilada	f	6642
333	Mocha Latte	t	6643
333	Decaf	f	6644
333	Frappuccino	f	6645
333	Macchiato	f	6646
334	Metalcraft	t	6647
334	Affinity	f	6648
334	Imprint	f	6649
334	Living Weapon	f	6650
335	Wyvern	t	6651
335	Pokemon	f	6652
335	Dominion	f	6653
335	Yu-Gi-Oh	f	6654
336	Uthden Troll	t	6655
336	Lotleth Troll	f	6656
336	Albino Troll	f	6657
336	Harvester Troll	f	6658
337	Bog Wraith	t	6659
337	Island	f	6660
337	Rock Hydra	f	6661
337	Elvish Archers	f	6662
338	Mana Clash	t	6663
338	Magic	f	6664
338	Magic Clash	f	6665
338	Mana Duels	f	6666
339	Lightning Dragon	t	6667
339	Revenant	f	6668
339	Beast of Burden	f	6669
339	Dirtcowl Wurm	f	6670
340	Intercepting	t	6671
340	Blocking	f	6672
340	Resisting	f	6673
340	Shielding	f	6674
341	Europa Universalis	t	6675
341	Europe and the Universe	f	6676
341	Europa!	f	6677
341	Power in Europe	f	6678
342	Turn to Frog	t	6679
342	Spore Frog	f	6680
342	Bloated Toad	f	6681
342	Frogmite	f	6682
343	Lava Axe	t	6683
343	Stone-Throwing Devils	f	6684
343	Ember Shot	f	6685
343	Throwing Knife	f	6686
344	April 1966	t	6687
344	September 1965	f	6688
344	January 1969	f	6689
344	February 1966	f	6690
345	Warlock	t	6691
345	Wizard	f	6692
345	Sorceror	f	6693
345	Cleric	f	6694
346	1993	t	6695
346	1987	f	6696
346	1998	f	6697
346	2003	f	6698
347	187	t	6699
347	207	f	6700
347	197	f	6701
347	177	f	6702
348	House	t	6703
348	Custom	f	6704
348	Extra	f	6705
348	Change	f	6706
349	20	t	6707
349	30	f	6708
349	15	f	6709
349	25	f	6710
350	7	t	6711
350	3	f	6712
350	10	f	6713
350	1	f	6714
351	Radius	t	6715
351	Patella	f	6716
351	Tibia	f	6717
351	Fibula 	f	6718
352	False	t	6719
352	True	f	6720
353	Blue	t	6721
353	Red	f	6722
353	Green	f	6723
353	Purple	f	6724
354	Acetone	t	6725
354	Water	f	6726
354	Mercury	f	6727
354	Benzene	f	6728
355	Dihydrogen Monoxide	t	6729
355	Ammonium chloride	f	6730
355	Anhydrous Sodium Carbonate	f	6731
355	Manganese dioxide	f	6732
356	Mitochondria	t	6733
356	Nucleus	f	6734
356	Chloroplast	f	6735
356	Endoplasmic Reticulum	f	6736
357	Venus	t	6737
357	Mars	f	6738
357	Mercury	f	6739
357	Jupiter	f	6740
358	100	t	6741
358	26	f	6742
358	50	f	6743
358	74	f	6744
359	Fruit Flies 	t	6745
359	Monkey	f	6746
359	Dog	f	6747
359	Mouse	f	6748
360	Shin Splints	t	6749
360	Tennis Elbow	f	6750
360	Carpal Tunnel	f	6751
360	Housemaid&#039;s Knee	f	6752
361	212	t	6753
361	326	f	6754
361	100	f	6755
361	451	f	6756
362	C6H12O6	t	6757
362	C2H4O2	f	6758
362	K+	f	6759
362	CH4	f	6760
363	Nitrogen	t	6761
363	Oxygen	f	6762
363	Hydrogen	f	6763
363	Neon	f	6764
364	Beryllium	t	6765
364	Gallium	f	6766
364	Caesium	f	6767
364	Mercury	f	6768
365	Brain	t	6769
365	Lungs	f	6770
365	Skin	f	6771
365	Heart	f	6772
366	Sputnik 1	t	6773
366	Soyuz 7K-OK	f	6774
366	Zenit-2	f	6775
366	Voskhod 3KV	f	6776
367	Vulpes Vulpes	t	6777
367	Vulpes Redus	f	6778
367	Red Fox	f	6779
367	Vulpes Vulpie	f	6780
368	True	t	6781
368	False	f	6782
369	Catholic	t	6783
369	Christian	f	6784
369	Jewish	f	6785
369	Islamic	f	6786
370	Ankle jerk reflex	t	6787
370	Gag reflex	f	6788
370	Pupillary light reflex	f	6789
370	Scratch reflex	f	6790
371	3	t	6791
371	4	f	6792
371	2	f	6793
371	1	f	6794
372	Hydrogen	t	6795
372	Helium	f	6796
372	Lithium	f	6797
372	Oxygen	f	6798
373	27&deg; Million F (15&deg; Million C)	t	6799
373	938,000&deg; F (521093.3&deg; C)	f	6800
373	8&deg; Billion F (&deg;4.4 Billion C)	f	6801
373	Absolute Zero (Both F and C)	f	6802
374	4	t	6803
374	3	f	6804
374	5	f	6805
374	6	f	6806
375	False	t	6807
375	True	f	6808
376	Uranium	t	6809
376	Sulfur	f	6810
376	Hydrogen	f	6811
376	Iron	f	6812
377	4.5 Billion Years	t	6813
377	3.5 Billion Years	f	6814
377	2.5 Billion Years	f	6815
377	5.5 Billion Years	f	6816
378	Cytosine	t	6817
378	Thymine	f	6818
378	Adenine	f	6819
378	Uracil	f	6820
379	False	t	6821
379	True	f	6822
380	Myofibrils	t	6823
380	Epimysium	f	6824
380	Myofiaments	f	6825
380	Myocardium	f	6826
381	Cat	t	6827
381	Dog	f	6828
381	Bat	f	6829
381	Butterfly	f	6830
382	False	t	6831
382	True	f	6832
383	Hydrogen &amp; Helium	t	6833
383	Hydrogen &amp; Nitrogen	f	6834
383	Carbon &amp; Nitrogen	f	6835
383	Carbon &amp; Helium	f	6836
384	STS-107	t	6837
384	STS-51-L	f	6838
384	STS-61-C	f	6839
384	STS-109	f	6840
385	Mars	t	6841
385	Saturn	f	6842
385	Jupiter	f	6843
385	Venus	f	6844
386	Gossypiboma	t	6845
386	Gongoozler	f	6846
386	Jentacular	f	6847
386	Meupareunia	f	6848
387	Sir Isaac Newton	t	6849
387	Albert Einstein	f	6850
387	Niels Bohr	f	6851
387	Enrico Fermi	f	6852
388	False	t	6853
388	True	f	6854
389	299,792,458 m/s	t	6855
389	50,461 m/s	f	6856
389	308,215,043 m/s	f	6857
389	751,665,014,151 m/s	f	6858
390	A genus of moths	t	6859
390	A combat stimulant from WW2	f	6860
390	A type of seasoning	f	6861
390	A port city in the carribean	f	6862
391	Diplophase	t	6863
391	Metaphase	f	6864
391	Anaphase	f	6865
391	Telophase	f	6866
392	Carbon dioxide	t	6867
392	Nitrogen	f	6868
392	Ammonia	f	6869
392	Oxygen	f	6870
393	Boron	t	6871
393	Oxygen	f	6872
393	Carbon	f	6873
393	Iron	f	6874
394	Histology	t	6875
394	Microbiology	f	6876
394	Anatomy	f	6877
394	Biochemistry	f	6878
395	Trapezius	t	6879
395	Trapezium	f	6880
395	Trapezoid	f	6881
395	Triquetrum	f	6882
396	Capillaries	t	6883
396	Arterioles	f	6884
396	Veinules	f	6885
396	Lymphatics	f	6886
397	Cytotoxic T cells	t	6887
397	Dendritic cells	f	6888
397	Natural killer cells	f	6889
397	White blood cells	f	6890
398	Dissociative identity disorder	t	6891
398	Body integrity identity disorder	f	6892
398	Identity crisis	f	6893
398	Schizophrenia	f	6894
399	Antimony	t	6895
399	Tin	f	6896
399	Bromine	f	6897
399	Rubidium	f	6898
400	1996	t	6899
400	2009	f	6900
400	1999	f	6901
400	1985	f	6902
451	The Letter A	t	7081
451	10	f	7082
451	The Number 0	f	7083
451	16	f	7084
452	Jerk	t	7085
452	Shift	f	7086
452	Bump	f	7087
452	Slide	f	7088
453	2.72	t	7089
453	3.14	f	7090
453	1.62	f	7091
453	1.41	f	7092
454	100	t	7093
454	10	f	7094
454	1,000	f	7095
454	1,000,000	f	7096
455	314.15 Inches	t	7097
455	380.1215 Inches	f	7098
455	3141.5 Inches	f	7099
455	1256.6 Inches	f	7100
456	False	t	7101
456	True	f	7102
457	3.14159	t	7103
457	3.14169	f	7104
457	3.12423	f	7105
457	3.25812	f	7106
458	40	t	7107
458	60	f	7108
458	15	f	7109
458	90	f	7110
459	D	t	7111
459	L	f	7112
459	C	f	7113
459	X	f	7114
460	7	t	7115
460	4	f	7116
460	12	f	7117
460	9	f	7118
461	1,000,000	t	7119
461	10	f	7120
461	1,000,000,000	f	7121
461	1000	f	7122
462	1279	t	7123
462	2203	f	7124
462	1009	f	7125
462	1069	f	7126
463	True	t	7127
463	False	f	7128
464	False	t	7129
464	True	f	7130
465	True	t	7131
465	False	f	7132
466	False	t	7133
466	True	f	7134
467	False	t	7135
467	True	f	7136
468	23	t	7137
468	25	f	7138
468	21	f	7139
468	27	f	7140
469	True	t	7141
469	False	f	7142
470	i	t	7143
470	e	f	7144
470	n	f	7145
470	x	f	7146
471	6	t	7147
471	3	f	7148
471	4	f	7149
471	5	f	7150
472	Sigma	t	7151
472	Delta	f	7152
472	Alpha	f	7153
472	Omega	f	7154
473	1F	t	7155
473	3D	f	7156
473	2E	f	7157
473	1B	f	7158
474	False	t	7159
474	True	f	7160
475	False	t	7161
475	True	f	7162
476	&Delta;r	t	7163
476	dr	f	7164
476	Dp	f	7165
476	r	f	7166
477	One Quintillionth	t	7167
477	One Billionth	f	7168
477	One Quadrillionth	f	7169
477	One Septillionth	f	7170
478	True	t	7171
478	False	f	7172
479	7	t	7173
479	8	f	7174
479	6	f	7175
479	5	f	7176
480	Folium of Descartes	t	7177
480	Elliptic Paraboloid of Descartes	f	7178
480	Cartesian Coordinates	f	7179
480	Descarte&#039;s Helicoid	f	7180
481	True	t	7181
481	False	f	7182
482	True	t	7183
482	False	f	7184
483	False	t	7185
483	True	f	7186
484	False	t	7187
484	True	f	7188
485	Parentheses, Exponents, Multiplication, Division, Addition, Subtraction	t	7189
485	Addition, Multiplication, Division, Subtraction, Addition, Parentheses	f	7190
485	Parentheses, Exponents, Addition, Substraction, Multiplication, Division	f	7191
485	The order in which the operations are written.	f	7192
486	True	t	7193
486	False	f	7194
487	True	t	7195
487	False	f	7196
488	False	t	7197
488	True	f	7198
489	True	t	7199
489	False	f	7200
490	4	t	7201
490	3	f	7202
490	5	f	7203
490	6	f	7204
491	1.58 x 10^20	t	7205
491	1.58 x 10^22	f	7206
491	1.58 x  10^18	f	7207
491	1.58 x 10^24	f	7208
492	Archimedes	t	7209
492	Euclid	f	7210
492	Homer	f	7211
492	Eratosthenes	f	7212
493	Galois	t	7213
493	Abel	f	7214
493	Euler	f	7215
493	Gauss	f	7216
494	13	t	7217
494	8	f	7218
494	10	f	7219
494	17	f	7220
495	10-sided die	t	7221
495	12-sided die	f	7222
495	20-sided die	f	7223
495	8-sided die	f	7224
496	Grigori Perelman	t	7225
496	Andrew Wiles	f	7226
496	Terence Tao	f	7227
496	Edward Witten	f	7228
497	1729	t	7229
497	91	f	7230
497	561	f	7231
497	4104	f	7232
498	1	t	7233
498	2	f	7234
498	3	f	7235
498	4	f	7236
499	90	t	7237
499	180	f	7238
499	270	f	7239
499	0	f	7240
500	Quadratic	t	7241
500	Rational	f	7242
500	Linear	f	7243
500	Exponential	f	7244
501	Crete	t	7245
501	Sardinia	f	7246
501	Sicily	f	7247
501	Cyprus	f	7248
502	Cursed to roll a boulder up a hill for eternity.	t	7249
502	Tied to a boulder for eternity, being pecked by birds.	f	7250
502	Standing in a lake filled with water he could not drink.	f	7251
502	To fell a tree that regenerated after every axe swing.	f	7252
503	Participating in cannibalism.	t	7253
503	Excessive mutilation of animal corpses.	f	7254
503	Performing a ritual involving murder.	f	7255
503	Drinking the blood of many slain animals.	f	7256
504	Apollo	t	7257
504	Demeter	f	7258
504	Zeus	f	7259
504	Athena	f	7260
505	Mars	t	7261
505	Jupiter	f	7262
505	Juno	f	7263
505	Ares	f	7264
506	Athena	t	7265
506	Ares	f	7266
506	Artemis	f	7267
506	Apollo	f	7268
507	True	t	7269
507	False	f	7270
508	A Horse	t	7271
508	A Dragon	f	7272
508	A Tiger	f	7273
508	A Lion	f	7274
509	Jason	t	7275
509	Castor	f	7276
509	Daedalus	f	7277
509	Odysseus	f	7278
510	Vulcan	t	7279
510	Apollo	f	7280
510	Jupiter	f	7281
510	Mercury	f	7282
511	Poseidon	t	7283
511	Ares	f	7284
511	Zeus	f	7285
511	Apollo	f	7286
512	Marriage	t	7287
512	Agriculture	f	7288
512	Sea	f	7289
512	War	f	7290
513	Enkidu	t	7291
513	Enki	f	7292
513	Enlil	f	7293
513	Enkimdu	f	7294
514	Eris	t	7295
514	Charon	f	7296
514	Ceres	f	7297
514	Dysnomia	f	7298
515	Zeus	t	7299
515	Apollo	f	7300
515	Hermes	f	7301
515	Poseidon	f	7302
516	Ariadne	t	7303
516	Athena	f	7304
516	Ariel	f	7305
516	Alana	f	7306
517	True	t	7307
517	False	f	7308
518	False	t	7309
518	True	f	7310
519	Nidhogg	t	7311
519	Bragi	f	7312
519	Odin	f	7313
519	Ymir	f	7314
520	Janus	t	7315
520	Vulcan	f	7316
520	Juno	f	7317
520	Mars	f	7318
521	Apollo	t	7319
521	Aphrodite	f	7320
521	Artemis	f	7321
521	Athena	f	7322
522	True	t	7323
522	False	f	7324
523	Paris	t	7325
523	Hector	f	7326
523	Helen	f	7327
523	Pericles	f	7328
524	The Sea	t	7329
524	War	f	7330
524	Sun	f	7331
524	Fire	f	7332
525	Orpheus	t	7333
525	Hercules	f	7334
525	Perseus	f	7335
525	Daedalus	f	7336
526	Norse	t	7337
526	Egyptian	f	7338
526	Greek	f	7339
526	Hindu	f	7340
527	False	t	7341
527	True	f	7342
528	Dionysus	t	7343
528	Hephaestus	f	7344
528	Demeter	f	7345
528	Apollo	f	7346
529	Min	t	7347
529	Menu	f	7348
529	Mut	f	7349
529	Meret	f	7350
530	Hera	t	7351
530	Aphrodite	f	7352
530	Athena	f	7353
530	Hestia	f	7354
531	False	t	7355
531	True	f	7356
532	Hephaestus	t	7357
532	Dyntos	f	7358
532	Vulcan	f	7359
532	Artagatus	f	7360
533	Set	t	7361
533	Horus	f	7362
533	Ra	f	7363
533	Anhur	f	7364
534	True	t	7365
534	False	f	7366
535	Centaur	t	7367
535	Minotaur	f	7368
535	Pegasus	f	7369
535	Gorgon	f	7370
536	Narcissus	t	7371
536	Clotho	f	7372
536	Atropos	f	7373
536	Lachesis	f	7374
537	Greek and Roman	t	7375
537	Roman and Spanish	f	7376
537	Greek and Chinese	f	7377
537	Greek, Roman and Norse	f	7378
538	New Zealand	t	7379
538	Vanuatu	f	7380
538	Fiji	f	7381
538	Hawaii	f	7382
539	False	t	7383
539	True	f	7384
540	Harpies	t	7385
540	Mermaids	f	7386
540	Nymph	f	7387
540	Lilith	f	7388
541	True	t	7389
541	False	f	7390
542	&#039;Oro	t	7391
542	Hina	f	7392
542	Kohara	f	7393
542	Māui	f	7394
543	Tree	t	7395
543	Mountain	f	7396
543	Temple	f	7397
543	Castle	f	7398
544	Cucumbers	t	7399
544	Kabocha	f	7400
544	Nasu	f	7401
544	Soba	f	7402
545	Thought &amp; Memory	t	7403
545	Power &amp; Peace	f	7404
545	War &amp; Learning	f	7405
545	Sleeping &amp; Waking	f	7406
546	Ask	t	7407
546	Asmund	f	7408
546	Ake	f	7409
546	Asger	f	7410
547	Thanatos	t	7411
547	Tartarus	f	7412
547	Hades	f	7413
547	Moros	f	7414
548	Loki	t	7415
548	Thor	f	7416
548	Odin	f	7417
548	Balder	f	7418
549	Bull	t	7419
549	Pig	f	7420
549	Ox	f	7421
549	Horse	f	7422
550	Aristaeus	t	7423
550	Autonoe	f	7424
550	Carme	f	7425
550	Cephisso	f	7426
551	Putney	t	7427
551	Hammersmith	f	7428
551	Vauxhall 	f	7429
551	Battersea	f	7430
552	Jordan	t	7431
552	Benetton	f	7432
552	Ferrari	f	7433
552	Mercedes	f	7434
553	Hammer	t	7435
553	Wrench	f	7436
553	Drill	f	7437
553	Screwdriver	f	7438
554	22	t	7439
554	20	f	7440
554	24	f	7441
554	26	f	7442
555	Badminton	t	7443
555	Table Tennis	f	7444
555	Rugby	f	7445
555	Cricket	f	7446
556	Leicester City	t	7447
556	Liverpool	f	7448
556	Cheslea	f	7449
556	Manchester United	f	7450
557	Golf Putting Green	t	7451
557	 Football Pitch	f	7452
557	Cricket Outfield	f	7453
557	Pinball Table	f	7454
558	Peter Fleming	t	7455
558	Mark Woodforde	f	7456
558	Michael Stich	f	7457
558	Mary Carillo	f	7458
559	True	t	7459
559	False	f	7460
560	Death of Ayrton Senna (San Marino)	t	7461
560	The Showdown (Australia)	f	7462
560	Verstappen on Fire (Germany)	f	7463
560	Schumacher&#039;s Ban (Britain)	f	7464
561	August 21	t	7465
561	August 23	f	7466
561	August 19	f	7467
561	August 17	f	7468
562	True	t	7469
562	False	f	7470
563	False	t	7471
563	True	f	7472
564	7 - 1	t	7473
564	0 - 1	f	7474
564	3 - 4	f	7475
564	16 - 0	f	7476
565	Moscow	t	7477
565	Barcelona	f	7478
565	Tokyo	f	7479
565	Los Angeles	f	7480
566	Penrith Panthers	t	7481
566	Melbourne Storm	f	7482
566	Sydney Roosters	f	7483
566	North Queensland Cowboys	f	7484
567	Ma Long (China)	t	7485
567	Zhang Jike (China)	f	7486
567	Jun Mizutani (Japan)	f	7487
567	Vladimir Samsonov (Belarus)	f	7488
568	False	t	7489
568	True	f	7490
569	Germany	t	7491
569	Argentina	f	7492
569	Brazil	f	7493
569	Netherlands	f	7494
570	Portugal	t	7495
570	France	f	7496
570	Germany	f	7497
570	England	f	7498
571	False	t	7499
571	True	f	7500
572	4	t	7501
572	1	f	7502
572	2	f	7503
572	3	f	7504
573	Mercedes-AMG Petronas	t	7505
573	Scuderia Ferrari	f	7506
573	McLaren Honda	f	7507
573	Red Bull Racing Renault	f	7508
574	Quebec City	t	7509
574	Houston	f	7510
574	Montreal	f	7511
574	New York	f	7512
575	False	t	7513
575	True	f	7514
576	2010	t	7515
576	2008	f	7516
576	2009	f	7517
576	2011	f	7518
577	84.39m	t	7519
577	100m	f	7520
577	100yd	f	7521
577	109.36yd	f	7522
578	Madeira	t	7523
578	Terceira	f	7524
578	Santa Maria	f	7525
578	Porto Santo	f	7526
579	Cristiano Ronaldo dos Santos Aveiro	t	7527
579	Cristiano Ronaldo los Santos Diego	f	7528
579	Cristiano Armando Diego Ronaldo	f	7529
579	Cristiano Luis Armando Ronaldo	f	7530
580	Ohio State Buckeyes	t	7531
580	Alabama Crimson Tide	f	7532
580	Clemson Tigers	f	7533
580	Wisconsin Badgers	f	7534
581	1969	t	7535
581	1968	f	7536
581	1971	f	7537
581	1970	f	7538
582	To prevent viewing games from outside the park.	t	7539
582	To make getting home runs harder.	f	7540
582	To display advertisements.	f	7541
582	To provide extra seating.	f	7542
583	Shaquille O&#039;Neal	t	7543
583	Allen Iverson	f	7544
583	Kobe Bryant	f	7545
583	Paul Pierce	f	7546
584	Mike Tyson	t	7547
584	Roy Jones Jr.	f	7548
584	Evander Holyfield	f	7549
584	Lennox Lewis	f	7550
585	Portugal	t	7551
585	West Germany	f	7552
585	Soviet Union	f	7553
585	Brazil	f	7554
586	Turkey	t	7555
586	Flamingo	f	7556
586	Birdie	f	7557
586	Eagle	f	7558
587	Pittsburgh	t	7559
587	New York	f	7560
587	Seattle	f	7561
587	Tampa Bay	f	7562
588	Ryan Giggs	t	7563
588	David Beckham	f	7564
588	Wayne Rooney	f	7565
588	Eric Cantona	f	7566
589	Leicester City	t	7567
589	Tottenham Hotspur	f	7568
589	Watford	f	7569
589	Stoke City	f	7570
590	Wayne Rooney	t	7571
590	Cristiano Ronaldo	f	7572
590	Robin Van Persie	f	7573
590	David Beckham	f	7574
591	Brooklyn	t	7575
591	Las Vegas	f	7576
591	Boston	f	7577
591	Seattle	f	7578
592	Owen Hart	t	7579
592	Chris Benoit	f	7580
592	Lex Luger	f	7581
592	Al Snow	f	7582
593	Real Madrid C.F.	t	7583
593	FC Bayern Munich	f	7584
593	Atletico Madrid	f	7585
593	Manchester City F.C.	f	7586
594	Toronto Marlies	t	7587
594	Toronto Rock	f	7588
594	Toronto Argonauts	f	7589
594	Toronto Wolfpack	f	7590
595	1991	t	7591
595	1990	f	7592
595	2000	f	7593
595	1987	f	7594
596	Russia	t	7595
596	Canada	f	7596
596	United States	f	7597
596	Germany	f	7598
597	Los Angeles Lakers	t	7599
597	Boston Celtics	f	7600
597	Philadelphia 76ers	f	7601
597	Golden State Warriors	f	7602
598	Daniel Ricciardo	t	7603
598	Sebastian Vettel	f	7604
598	Kimi Raikkonen	f	7605
598	Lewis Hamilton	f	7606
599	Providence Bruins	t	7607
599	New Haven Bruins	f	7608
599	Cambridge Bruins	f	7609
599	Hartford Bruins	f	7610
600	Hull City	t	7611
600	Cardiff City	f	7612
600	Bristol City	f	7613
600	Manchester City	f	7614
604	The United Kingdom	t	7627
604	Japan	f	7628
604	Austrailia	f	7629
604	Argentina	f	7630
605	Four	t	7631
605	Two	f	7632
605	Three	f	7633
605	One	f	7634
606	Uzbekistan	t	7635
606	Switzerland	f	7636
606	Bolivia	f	7637
606	Ethiopia	f	7638
607	True	t	7639
607	False	f	7640
608	Dubai	t	7641
608	Riyadh	f	7642
608	Mecca	f	7643
608	Medina	f	7644
609	26	t	7645
609	32	f	7646
609	28	f	7647
609	30	f	7648
610	False	t	7649
610	True	f	7650
611	Lesotho	t	7651
611	Swaziland	f	7652
611	Botswana	f	7653
611	Zimbabwe	f	7654
612	Cyprus	t	7655
612	Malta	f	7656
612	Greece	f	7657
612	Portugal	f	7658
613	Portugal, Ireland, Italy, Greece, Spain	t	7659
613	Poland, Iceland, Italy, Greece, Serbia	f	7660
613	Poland, Iceland, Italy, Greenland, Spain	f	7661
613	Portugal, Iceland, Ireland, Greece, Serbia	f	7662
614	Sweden	t	7663
614	Denmark	f	7664
614	Norway	f	7665
614	Germany	f	7666
615	False	t	7667
615	True	f	7668
616	Serbia	t	7669
616	Bosnia and Herzegovina	f	7670
616	Montenegro	f	7671
616	Croatia	f	7672
617	True	t	7673
617	False	f	7674
618	Mozambique	t	7675
618	Botswana	f	7676
618	Gabon	f	7677
618	Togo	f	7678
619	36,600	t	7679
619	2,400	f	7680
619	90,000	f	7681
619	323,400	f	7682
620	Electric Town	t	7683
620	Moon Walk River	f	7684
620	Otaku Central 	f	7685
620	Big Eyes	f	7686
621	Constantinople	t	7687
621	H&uuml;davendigar	f	7688
621	S&ouml;ğ&uuml;t	f	7689
621	Adrianople	f	7690
622	True	t	7691
622	False	f	7692
623	5	t	7693
623	2	f	7694
623	3	f	7695
623	4	f	7696
624	4	t	7697
624	3	f	7698
624	1	f	7699
624	6	f	7700
625	Dakar	t	7701
625	Nouakchott	f	7702
625	Conakry	f	7703
625	Monrovia	f	7704
626	Rosemead, California	t	7705
626	Sacramento, California	f	7706
626	Fresno, California	f	7707
626	San Diego, California	f	7708
627	Austria	t	7709
627	Germany	f	7710
627	Switzerland	f	7711
627	Czech Republic	f	7712
628	Albania	t	7713
628	Croatia	f	7714
628	Serbia	f	7715
628	Macedonia	f	7716
629	Andorra	t	7717
629	Liechtenstein	f	7718
629	Monaco	f	7719
629	San Marino	f	7720
630	True	t	7721
630	False	f	7722
631	Brazil	t	7723
631	China	f	7724
631	Russia	f	7725
631	The United States	f	7726
632	Niagara Falls	t	7727
632	Whistler, British Columbia	f	7728
632	Disney World	f	7729
632	Yosemite National Park	f	7730
633	Baffin Island	t	7731
633	Prince Edward Island	f	7732
633	Vancouver Island	f	7733
633	Newfoundland	f	7734
634	Gdańsk	t	7735
634	Warsaw	f	7736
634	Zakopane	f	7737
634	Poznań	f	7738
635	Anatolia	t	7739
635	Ismuth of Ottoma	f	7740
635	Ottoma	f	7741
635	Ismuth of Anatolia	f	7742
636	Atlanta, Georgia USA	t	7743
636	London, England	f	7744
636	Chicago,Illinois ISA	f	7745
636	Tokyo,Japan	f	7746
637	S&atilde;o Paulo	t	7747
637	New York	f	7748
637	Mexico City	f	7749
637	Los Angeles	f	7750
638	North America	t	7751
638	South America	f	7752
638	Asia	f	7753
638	Africa	f	7754
639	Sri Lanka	t	7755
639	Kiribati	f	7756
639	Scotland	f	7757
639	Bhutan	f	7758
640	Fairfax County, Virginia	t	7759
640	Medford, Oregon	f	7760
640	Braxton County, Virgina	f	7761
640	Lemon Grove, California	f	7762
641	True	t	7763
641	False	f	7764
642	Sydney	t	7765
642	Cairo	f	7766
642	Moscow	f	7767
642	Beijing	f	7768
643	True	t	7769
643	False	f	7770
644	National Baseball Hall of Fame	t	7771
644	Metropolitan Museum of Art	f	7772
644	National Toy Hall of Fame	f	7773
644	Museum of Modern Art	f	7774
645	11	t	7775
645	8	f	7776
645	5	f	7777
645	2	f	7778
646	Atlantic Plate	t	7779
646	North American Plate	f	7780
646	Eurasian Plate	f	7781
646	Nazca Plate	f	7782
647	Xi&#039;an	t	7783
647	Beijing	f	7784
647	Shanghai	f	7785
647	Hong Kong	f	7786
648	Niue	t	7787
648	Tuvalu	f	7788
648	South Sudan	f	7789
648	Montenegro	f	7790
649	Thailand	t	7791
649	Peru	f	7792
649	Mexico	f	7793
649	South Africa	f	7794
650	Country	t	7795
650	Region	f	7796
650	River	f	7797
650	City	f	7798
651	Silver	t	7799
651	Gold	f	7800
651	Juno	f	7801
651	Sword	f	7802
652	1789	t	7803
652	1823	f	7804
652	1756	f	7805
652	1799	f	7806
653	Buffalo Bill	t	7807
653	Billy the Kid	f	7808
653	Wild Bill Hickok	f	7809
653	Pawnee Bill	f	7810
654	True	t	7811
654	False	f	7812
655	Alexander Flemming	t	7813
655	Marie Curie	f	7814
655	Alfred Nobel	f	7815
655	Louis Pasteur	f	7816
656	False	t	7817
656	True	f	7818
657	Star Wars	t	7819
657	Jaws	f	7820
657	Blade Runner	f	7821
657	Alien	f	7822
658	Ukraine	t	7823
658	Belarus	f	7824
658	Latvia	f	7825
658	Lithuania	f	7826
659	1991	t	7827
659	1992	f	7828
659	1891	f	7829
659	1990	f	7830
660	November 4, 1952	t	7831
660	July 26, 1908	f	7832
660	 July 1, 1973	f	7833
660	 November 25, 2002	f	7834
661	False	t	7835
661	True	f	7836
662	55	t	7837
662	50	f	7838
662	60	f	7839
662	54	f	7840
663	Apollo 17	t	7841
663	Apollo 13	f	7842
663	Apollo 11	f	7843
663	Apollo 15	f	7844
664	Post cards	t	7845
664	Alcohol	f	7846
664	Cigarettes	f	7847
664	Sodas 	f	7848
665	January 25, 1945	t	7849
665	August 6, 1945	f	7850
665	December 7, 1941	f	7851
665	December 16, 1944	f	7852
666	True	t	7853
666	False	f	7854
667	True	t	7855
667	False	f	7856
668	John Blunt	t	7857
668	Daniel Defoe	f	7858
668	Robert Harley	f	7859
668	John Churchill	f	7860
669	32	t	7861
669	50	f	7862
669	31	f	7863
669	21	f	7864
670	South Africa	t	7865
670	Argentina	f	7866
670	Nepal	f	7867
670	Bulgaria	f	7868
671	April 20, 1889	t	7869
671	June 12, 1889	f	7870
671	February 6, 1889	f	7871
671	April 16, 1889	f	7872
672	Robbing Trains	t	7873
672	Murder for Hire	f	7874
672	Tax Evasion	f	7875
672	Identity Fraud	f	7876
673	September 4, 1998	t	7877
673	October 9, 1997	f	7878
673	December 12, 1989	f	7879
673	Feburary 7th, 2000	f	7880
674	2004	t	7881
674	2006	f	7882
674	2008	f	7883
674	2002	f	7884
675	1995	t	7885
675	2001	f	7886
675	2011	f	7887
675	1991	f	7888
676	Delaware	t	7889
676	Rhode Island	f	7890
676	Maine	f	7891
676	Virginia	f	7892
677	March 11th, 1990	t	7893
677	December 25th, 1991	f	7894
677	December 5th, 1991	f	7895
677	April 20th, 1989	f	7896
678	True	t	7897
678	False	f	7898
679	Nationalist Spain	t	7899
679	Republican Spain	f	7900
679	Popular Front	f	7901
679	Papal State	f	7902
680	Divorced, Beheaded, Died, Divorced, Beheaded, Survived	t	7903
680	Beheaded, Died, Divorced, Divorced, Beheaded, Survived	f	7904
680	Died, Beheaded, Divorced, Beheaded, Survived, Divorced	f	7905
680	Survived, Beheaded, Died, Divorced, Divorced, Beheaded	f	7906
681	The Apology	t	7907
681	The Euthyphro	f	7908
681	The Laws	f	7909
681	The Republic	f	7910
682	World War II	t	7911
682	Taiping Rebellion	f	7912
682	Three Kingdoms War	f	7913
682	Mongol conquests	f	7914
683	Martin Van Buren	t	7915
683	John Adams	f	7916
683	George Washington	f	7917
683	James Monroe 	f	7918
684	True	t	7919
684	False	f	7920
685	False	t	7921
685	True	f	7922
686	The Flamingo	t	7923
686	The MGM Grand	f	7924
686	The Sands	f	7925
686	The Sahara	f	7926
687	The Polish President	t	7927
687	Pope John Paul II	f	7928
687	Bang-Ding Ow	f	7929
687	Albert Putin	f	7930
688	The Central Powers	t	7931
688	The Axis Powers	f	7932
688	The Federation of Empires	f	7933
688	Authoritarian Alliance	f	7934
689	63 Days	t	7935
689	20 Days	f	7936
689	55 Days	f	7937
689	224 Days	f	7938
690	Operation Typhoon	t	7939
690	Operation Sunflower	f	7940
690	Operation Barbarossa	f	7941
690	Case Blue	f	7942
691	Goldsboro, North Carolina	t	7943
691	Hicksville, New York	f	7944
691	Jacksonville, Florida	f	7945
691	Conway, Arkansas	f	7946
692	116	t	7947
692	100	f	7948
692	90	f	7949
692	101	f	7950
693	56	t	7951
693	43	f	7952
693	65	f	7953
693	47	f	7954
694	USS Hornet	t	7955
694	USS Enterprise	f	7956
694	USS Lexington	f	7957
694	USS Saratoga	f	7958
695	Ceylon	t	7959
695	Myanmar	f	7960
695	Colombo	f	7961
695	Badulla	f	7962
696	Constantinople	t	7963
696	Rome	f	7964
696	Hamburg	f	7965
696	Athens	f	7966
697	Navarre	t	7967
697	Galicia	f	7968
697	Granada	f	7969
697	Catalonia	f	7970
698	Peace of Westphalia	t	7971
698	Treaty of Versailles	f	7972
698	Treaty of Paris	f	7973
698	Peace of Prague	f	7974
699	Erwin Rommel	t	7975
699	Gerd von Rundstadt	f	7976
699	Wilhelm Keitel	f	7977
699	Heinz Guderian 	f	7978
700	Enola Gay	t	7979
700	Necessary Evil	f	7980
700	The Great Artiste	f	7981
700	Full House	f	7982
701	Donald Trump	t	7983
701	Ted Cruz	f	7984
701	Marco Rubio	f	7985
701	Bernie Sanders	f	7986
702	Andrew Jackson	t	7987
702	Ronald Reagan	f	7988
702	John F. Kennedy	f	7989
702	Franklin Roosevelt	f	7990
703	George Washington	t	7991
703	Abraham Lincoln	f	7992
703	Richard Nixon	f	7993
703	Thomas Jefferson	f	7994
704	Ronald Reagan	t	7995
704	Jimmy Carter	f	7996
704	Bill Clinton	f	7997
704	Richard Nixon	f	7998
705	True Conservative Radio	t	7999
705	True Republican Radio	f	8000
705	Texan Capitalist Radio	f	8001
705	United Capitalists	f	8002
706	False	t	8003
706	True	f	8004
707	True	t	8005
707	False	f	8006
708	Tonga	t	8007
708	Palau	f	8008
708	Fiji	f	8009
708	Kiribati	f	8010
709	Yomba Shoshone Tribe	t	8011
709	Standing Rock Sioux Tribe	f	8012
709	Kiowa Tribe of Oklahoma	f	8013
709	Pawnee Nation of Oklahoma	f	8014
710	The United States of America	t	8015
710	Germany	f	8016
710	Japan	f	8017
710	United Kingdom	f	8018
711	False	t	8019
711	True	f	8020
712	Indonesia	t	8021
712	Thailand	f	8022
712	Brunei	f	8023
712	Malaysia	f	8024
713	Chinese Taipei	t	8025
713	Chinese Taiwan	f	8026
713	Republic of Taiwan	f	8027
713	Republic of Taipei 	f	8028
714	435	t	8029
714	260	f	8030
714	415	f	8031
714	50	f	8032
715	True	t	8033
715	False	f	8034
716	False	t	8035
716	True	f	8036
717	True	t	8037
717	False	f	8038
718	A	t	8039
718	X	f	8040
718	D	f	8041
718	B	f	8042
719	True	t	8043
719	False	f	8044
720	False	t	8045
720	True	f	8046
721	35	t	8047
721	30	f	8048
721	40	f	8049
721	45	f	8050
722	George W. Bush	t	8051
722	John Kerry	f	8052
722	Barack Obama	f	8053
722	Al Gore	f	8054
723	William Henry Harrison	t	8055
723	Zachary Taylor	f	8056
723	James A. Garfield	f	8057
723	Warren G. Harding	f	8058
724	True	t	8059
724	False	f	8060
725	Donald Trump	t	8061
725	Barack Obama	f	8062
725	Bill Clinton	f	8063
725	George Bush	f	8064
726	True	t	8065
726	False	f	8066
727	False	t	8067
727	True	f	8068
728	True	t	8069
728	False	f	8070
729	The Prince	t	8071
729	The Rape of Lucrece	f	8072
729	Will to Power	f	8073
729	Love&#039;s Labours Lost	f	8074
730	 Concentration of power and authority in a central organization.	t	8075
730	Conforming to one single common political agenda.	f	8076
730	Remaining politically neutral.	f	8077
730	The grey area in the spectrum of political left and right.	f	8078
731	Strom Thurmond	t	8079
731	Roy Blunt	f	8080
731	John Barrasso	f	8081
731	Chuck Schumer	f	8082
732	Jeremy Corbyn	t	8083
732	Ed Miliband	f	8084
732	David Cameron	f	8085
732	Theresa May	f	8086
733	William Jefferson Clinton	t	8087
733	William Roosevelt Clinton	f	8088
733	William Truman Clinton	f	8089
733	William Lincoln Clinton	f	8090
734	2000	t	8091
734	2012	f	8092
734	1988	f	8093
734	2008	f	8094
735	3	t	8095
735	1	f	8096
735	2	f	8097
735	0	f	8098
736	False	t	8099
736	True	f	8100
737	Saxophone	t	8101
737	Baritone horn	f	8102
737	Piano	f	8103
737	Violin	f	8104
738	Nikita Khrushchev	t	8105
738	Leonid Brezhnev	f	8106
738	Mikhail Gorbachev	f	8107
738	Boris Yeltsin	f	8108
739	The Kingfish	t	8109
739	The Champ	f	8110
739	The Hoot Owl	f	8111
739	The Oracle	f	8112
740	Qatar	t	8113
740	Bahrain	f	8114
740	United States of America	f	8115
740	Russia	f	8116
741	True	t	8117
741	False	f	8118
742	Robert Byrd	t	8119
742	Daniel Inouye	f	8120
742	Strom Thurmond	f	8121
742	Joe Biden	f	8122
743	Ronald Reagan	t	8123
743	Jimmy Carter	f	8124
743	Gerald Ford	f	8125
743	Richard Nixon	f	8126
744	Theodore Roosevelt	t	8127
744	Woodrow Wilson	f	8128
744	James F. Fielder	f	8129
744	Andrew Jackson	f	8130
745	False	t	8131
745	True	f	8132
746	1974	t	8133
746	1977	f	8134
746	1973	f	8135
746	1969	f	8136
747	2009	t	8137
747	2012	f	8138
747	2006	f	8139
747	1997	f	8140
748	Justin and Pierre	t	8141
748	John and Louis	f	8142
748	Brian and Justin	f	8143
748	Brian and Pierre	f	8144
749	1972	t	8145
749	1973	f	8146
749	1974	f	8147
749	1971	f	8148
750	Chile	t	8149
750	Ethiopia	f	8150
750	Indonesia	f	8151
750	Nicaragua	f	8152
751	Sundance	t	8153
751	Woodward	f	8154
751	Turner	f	8155
751	Booker	f	8156
752	Judy Garland	t	8157
752	Doris Day	f	8158
752	Julie Andrews	f	8159
752	Marilyn Monroe	f	8160
753	True	t	8161
753	False	f	8162
754	Christopher Poole	t	8163
754	Mark Zuckerberg	f	8164
754	Allison Harvard	f	8165
754	Catie Wayne	f	8166
755	The Nostalgia Critic	t	8167
755	The Angry Video Game Nerd	f	8168
755	AngryJoeShow	f	8169
755	The Cinema Snob	f	8170
756	James	t	8171
756	John	f	8172
756	Jack	f	8173
756	Justin	f	8174
757	Charlie Sheen	t	8175
757	Ricky Martin	f	8176
757	Bruno Mars	f	8177
757	Joaquin Phoenix	f	8178
758	Catherine Zeta-Jones	t	8179
758	Ruth Jones	f	8180
758	Pam Ferris	f	8181
758	Sara Sugarman	f	8182
759	John	t	8183
759	Jeff	f	8184
759	Jerald	f	8185
759	Jason	f	8186
760	1982	t	8187
760	1985	f	8188
760	1984	f	8189
760	1995	f	8190
761	Jon Jafari	t	8191
761	Rocco Botte	f	8192
761	Derrick Acosta	f	8193
761	Shawn Chatfield	f	8194
762	Pneumonia	t	8195
762	Stomach Cancer	f	8196
762	HIV	f	8197
762	Brain Hemorrhage	f	8198
763	January 8, 1935	t	8199
763	December 13, 1931	f	8200
763	July 18, 1940	f	8201
763	April 17, 1938	f	8202
764	Zoroastrianism	t	8203
764	Paganism	f	8204
764	Ashurism	f	8205
764	Judaism	f	8206
765	Abandoned Buildings and Dead Malls	t	8207
765	Historic Landmarks	f	8208
765	Action Films	f	8209
765	Documentaries 	f	8210
766	Drug Overdose	t	8211
766	Knife Attack	f	8212
766	House Fire	f	8213
766	Gunshot	f	8214
767	5&prime; 7&Prime;	t	8215
767	5&prime; 9&Prime;	f	8216
767	5&prime; 4&Prime;	f	8217
767	5&prime; 5&Prime;	f	8218
768	April 23rd, 1564	t	8219
768	July 4th, 1409	f	8220
768	September 29th, 1699	f	8221
768	December 1st, 1750	f	8222
769	2035	t	8223
769	2030	f	8224
769	2040	f	8225
769	2045	f	8226
770	The Party	t	8227
770	The Weather Girls	f	8228
770	The Pussycat Dolls	f	8229
770	The Cheetah Girls	f	8230
771	Kanye West	t	8231
771	Donald Trump	f	8232
771	Leonardo DiCaprio	f	8233
771	Miley Cyrus	f	8234
772	Drake	t	8235
772	Travis Scott	f	8236
772	Lil Wayne	f	8237
772	2 Chainz	f	8238
773	Atlanta, Georgia	t	8239
773	Chicago, Illinois	f	8240
773	Los Angeles, California	f	8241
773	Detroit, Michigan	f	8242
774	Joe DiMaggio	t	8243
774	Tino Martinez	f	8244
774	Babe Ruth	f	8245
774	Mason Williams	f	8246
775	James Dougherty	t	8247
775	Joe Dimaggio	f	8248
775	Kirk Douglas	f	8249
775	Arthur Miller	f	8250
776	False	t	8251
776	True	f	8252
777	Howard Stern	t	8253
777	Rush Limbaugh	f	8254
777	Pete Tong	f	8255
777	Ryan Seacrest	f	8256
778	60 lbs	t	8257
778	30 lbs	f	8258
778	50 lbs	f	8259
778	70 lbs	f	8260
779	Scorpio	t	8261
779	Jet	f	8262
779	Nightshade	f	8263
779	Falcon	f	8264
780	Kiernan Shipka	t	8265
780	Ariel Winter	f	8266
780	Emma Watson	f	8267
780	Bonnie Wright	f	8268
781	True	t	8269
781	False	f	8270
782	1995	t	8271
782	1986	f	8272
782	1989	f	8273
782	1997	f	8274
783	False	t	8275
783	True	f	8276
784	Auction Hunters	t	8277
784	Ramsay&#039;s Kitchen Nightmares	f	8278
784	Hotel Hell	f	8279
784	Hell&#039;s Kitchen	f	8280
785	Collingwood College	t	8281
785	Tomlinscote School	f	8282
785	Kings International College	f	8283
785	Lyndhurst School	f	8284
786	Gregg Turkington	t	8285
786	Nathan Fielder	f	8286
786	Tim Heidecker	f	8287
786	Todd Glass	f	8288
787	Moose	t	8289
787	Dog	f	8290
787	Bear	f	8291
787	Goat	f	8292
788	The Angry Video Game Nerd	t	8293
788	TotalBiscuit	f	8294
788	PeanutButterGamer	f	8295
788	PewDiePie	f	8296
789	Martin Sheen	t	8297
789	Charlie Sheen	f	8298
789	Ramon Sheen	f	8299
789	Emilio Estevez	f	8300
790	Ivana Zeln&iacute;čkov&aacute;	t	8301
790	Melania Knauss	f	8302
790	Marla Maples	f	8303
790	Nancy Davis	f	8304
791	1962 	t	8305
791	1970	f	8306
791	1960	f	8307
791	1972	f	8308
792	New York	t	8309
792	Arizona	f	8310
792	California	f	8311
792	Georgia	f	8312
793	Gordon Ramsay	t	8313
793	Jamie Oliver	f	8314
793	Ainsley Harriott	f	8315
793	Antony Worrall Thompson	f	8316
794	1995	t	8317
794	1992	f	8318
794	1996	f	8319
794	1991	f	8320
795	Bobby Shmurda	t	8321
795	DJ Snake	f	8322
795	Swae Lee	f	8323
795	Young Thug	f	8324
796	74	t	8325
796	61	f	8326
796	He&#039;s still alive	f	8327
796	56	f	8328
797	Big Brother	t	8329
797	Jeopardy	f	8330
797	Survivor	f	8331
797	The Bachelor	f	8332
798	Bo Jackson	t	8333
798	Tito Jackson	f	8334
798	Jermaine Jackson	f	8335
798	Marlon Jackson	f	8336
799	Bullying	t	8337
799	Criminal Record	f	8338
799	Nomination for Worst Actor	f	8339
799	Racism	f	8340
800	American Gun	t	8341
800	Monsters Inc	f	8342
800	Texas Rangers	f	8343
800	Snow Dogs	f	8344
801	True	t	8345
801	False	f	8346
802	Simien Jackel	t	8347
802	Ethiopian Coyote	f	8348
802	Amharic Fox	f	8349
802	Canis Simiensis	f	8350
803	River Horse (Greek)	t	8351
803	River Horse (Latin)	f	8352
803	Fat Pig (Greek)	f	8353
803	Fat Pig (Latin)	f	8354
804	Nuts	t	8355
804	Nothing	f	8356
804	Fruit	f	8357
804	Seaweed	f	8358
805	Toad	t	8359
805	Bird	f	8360
805	Fish	f	8361
805	Insect	f	8362
806	True	t	8363
806	False	f	8364
807	Homo Sapiens	t	8365
807	Homo Ergaster	f	8366
807	Homo Erectus	f	8367
807	Homo Neanderthalensis	f	8368
808	New Zealand	t	8369
808	South Africa	f	8370
808	Australia	f	8371
808	Madagascar	f	8372
809	Syrian Brown Bear	t	8373
809	California Grizzly Bear	f	8374
809	Atlas Bear	f	8375
809	Mexican Grizzly Bear	f	8376
810	Black	t	8377
810	White	f	8378
810	Pink	f	8379
810	Green	f	8380
811	Seahorse	t	8381
811	Dolphin	f	8382
811	Whale	f	8383
811	Octopus	f	8384
812	False	t	8385
812	True	f	8386
813	True	t	8387
813	False	f	8388
814	Ursus Maritimus	t	8389
814	Polar Bear	f	8390
814	Ursus Spelaeus	f	8391
814	Ursus Arctos	f	8392
815	True	t	8393
815	False	f	8394
816	Keratin	t	8395
816	Bone	f	8396
816	Ivory	f	8397
816	Skin	f	8398
817	6	t	8399
817	2	f	8400
817	4	f	8401
817	0	f	8402
818	4	t	8403
818	8	f	8404
818	2	f	8405
818	6	f	8406
819	Hyaenidae	t	8407
819	Canidae	f	8408
819	Felidae	f	8409
819	Eupleridae	f	8410
820	Nervousness	t	8411
820	Excitement	f	8412
820	Aggression	f	8413
820	Exhaustion	f	8414
821	Pup	t	8415
821	Cub	f	8416
821	Chick	f	8417
821	Kid	f	8418
822	Acinonyx jubatus	t	8419
822	Panthera onca	f	8420
822	Lynx rufus	f	8421
822	Felis catus	f	8422
823	Foxes	t	8423
823	Pigeons	f	8424
823	Bears	f	8425
823	Alligators	f	8426
824	Tasmania, Australia	t	8427
824	Baluchistan, Pakistan	f	8428
824	Wallachia, Romania	f	8429
824	Oregon, United States	f	8430
825	False	t	8431
825	True	f	8432
826	Canis Lupus	t	8433
826	Canis Aureus	f	8434
826	Canis Latrans	f	8435
826	Canis Lupus Lycaon	f	8436
827	Tuatara	t	8437
827	Komodo Dragon	f	8438
827	Gila Monster	f	8439
827	Green Iguana	f	8440
828	Tardar Sauce	t	8441
828	Sauce	f	8442
828	Minnie	f	8443
828	Broccoli	f	8444
829	Ape	t	8445
829	Lion	f	8446
829	Parrot	f	8447
829	Wildcat	f	8448
830	Tail	t	8449
830	Head	f	8450
830	Teeth	f	8451
830	Feet	f	8452
831	Felidae	t	8453
831	Felinae	f	8454
831	Felis	f	8455
831	Cat	f	8456
832	True	t	8457
832	False	f	8458
833	Pugs	t	8459
833	Bulldogs	f	8460
833	Boxers	f	8461
833	Chihuahua	f	8462
834	True	t	8463
834	False	f	8464
835	Murder	t	8465
835	Pack	f	8466
835	Gaggle	f	8467
835	Herd	f	8468
836	Gooty	t	8469
836	Hopper	f	8470
836	Silver Stripe	f	8471
836	Woebegone	f	8472
837	Pan troglodytes	t	8473
837	Gorilla gorilla	f	8474
837	Pan paniscus	f	8475
837	Panthera leo	f	8476
838	Portuguese Man-of-War	t	8477
838	Sea Wasp	f	8478
838	Irukandji	f	8479
838	Sea Nettle	f	8480
839	False	t	8481
839	True	f	8482
840	True	t	8483
840	False	f	8484
841	Brown	t	8485
841	Black	f	8486
841	White	f	8487
841	Yellow	f	8488
842	False	t	8489
842	True	f	8490
843	28	t	8491
843	30	f	8492
843	26	f	8493
843	24	f	8494
844	Sloth	t	8495
844	Drove	f	8496
844	Tribe	f	8497
844	Husk	f	8498
845	Mischief	t	8499
845	Pack	f	8500
845	Race	f	8501
845	Drift	f	8502
846	Wake	t	8503
846	Ambush	f	8504
846	Building	f	8505
846	Gaze	f	8506
847	False	t	8507
847	True	f	8508
848	True	t	8509
848	False	f	8510
849	Chordata	t	8511
849	Echinodermata	f	8512
849	Annelida	f	8513
849	Placazoa	f	8514
850	True	t	8515
850	False	f	8516
851	True	t	8517
851	False	f	8518
852	Scorpion	t	8519
852	Snake	f	8520
852	Bull	f	8521
852	Horse	f	8522
853	Bull	t	8523
853	Bat	f	8524
853	Horse	f	8525
853	Snake	f	8526
854	Camshaft	t	8527
854	Piston	f	8528
854	Drive shaft	f	8529
854	Crankshaft	f	8530
855	Turin	t	8531
855	Maranello	f	8532
855	Modena	f	8533
855	Rome	f	8534
856	Austria	t	8535
856	Afghanistan	f	8536
856	Australia	f	8537
856	Armenia	f	8538
857	Poland	t	8539
857	China	f	8540
857	Sweden	f	8541
857	Italy	f	8542
858	BYD	t	8543
858	Silant	f	8544
858	Dragon	f	8545
858	GAZ	f	8546
859	Toyota	t	8547
859	Honda	f	8548
859	Ford	f	8549
859	Volkswagen	f	8550
860	False	t	8551
860	True	f	8552
861	0.1m	t	8553
861	1m	f	8554
861	10m 	f	8555
861	100m	f	8556
862	Alfa Romeo	t	8557
862	Auto Union	f	8558
862	Mercedes Benz	f	8559
862	Bentley	f	8560
863	Nissan	t	8561
863	Honda	f	8562
863	Hyundai	f	8563
863	Subaru	f	8564
864	Renault Avantime	t	8565
864	Chevy Volt	f	8566
864	Mercedes-Benz A-Class	f	8567
864	Honda Odyssey	f	8568
865	False	t	8569
865	True	f	8570
866	2003	t	8571
866	2008	f	8572
866	2005	f	8573
866	2007	f	8574
867	Sprinter	t	8575
867	Class 43	f	8576
867	Javelin	f	8577
867	Pendolino	f	8578
868	TCAS	t	8579
868	GPWS	f	8580
868	OCAS	f	8581
868	TAWS	f	8582
869	Kelisa	t	8583
869	Saga	f	8584
869	Perdana	f	8585
869	Inspira	f	8586
870	Toyota	t	8587
870	Honda	f	8588
870	Kawasaki	f	8589
870	Yamaha	f	8590
871	True	t	8591
871	False	f	8592
872	E46	t	8593
872	E39	f	8594
872	E85	f	8595
872	F10	f	8596
873	Koenigsegg	t	8597
873	Bugatti	f	8598
873	Lamborghini	f	8599
873	McLaren	f	8600
874	Ford	t	8601
874	Buick	f	8602
874	Cadillac	f	8603
874	Chevrolet	f	8604
875	Aventador	t	8605
875	Huayra	f	8606
875	918	f	8607
875	Chiron	f	8608
876	VANOS	t	8609
876	VVT-iw	f	8610
876	VVEL	f	8611
876	MultiAir	f	8612
877	False	t	8613
877	True	f	8614
878	3,000	t	8615
878	3,200	f	8616
878	2,578	f	8617
878	2,190	f	8618
879	1UZ-FE	t	8619
879	2JZ-GTE	f	8620
879	7M-GTE	f	8621
879	5M-GE	f	8622
880	15 Degree	t	8623
880	30 Degree	f	8624
880	45 Degree	f	8625
880	90 Degree	f	8626
881	True	t	8627
881	False	f	8628
882	Opel	t	8629
882	Porsche	f	8630
882	Bugatti	f	8631
882	Bentley	f	8632
883	False	t	8633
883	True	f	8634
884	Pirelli	t	8635
884	Goodyear	f	8636
884	Bridgestone	f	8637
884	Michelin	f	8638
885	1902	t	8639
885	1964	f	8640
885	1898	f	8641
885	1985	f	8642
886	Pistons	t	8643
886	Leaf Springs	f	8644
886	Radiators	f	8645
886	ABS	f	8646
887	Matra Djet	t	8647
887	Porsche 911	f	8648
887	Alpine A110	f	8649
887	AC Cobra	f	8650
888	Camry	t	8651
888	Fusion	f	8652
888	Model A	f	8653
888	F-150	f	8654
889	Gimli Glider	t	8655
889	Gimli Microlight	f	8656
889	Gimli Chaser	f	8657
889	Gimli Superb	f	8658
890	346	t	8659
890	350	f	8660
890	355	f	8661
890	360	f	8662
891	364	t	8663
891	346	f	8664
891	376	f	8665
891	402	f	8666
892	376	t	8667
892	346	f	8668
892	364	f	8669
892	427	f	8670
893	Leaf	t	8671
893	Tree	f	8672
893	Deer	f	8673
893	Roots	f	8674
894	Lamborghini	t	8675
894	Ferrari	f	8676
894	Pagani	f	8677
894	Bugatti	f	8678
895	Audi A8	t	8679
895	Audi TT	f	8680
895	Audi S3	f	8681
895	Audi A3	f	8682
896	1972	t	8683
896	1982	f	8684
896	1975	f	8685
896	1973	f	8686
897	LB&amp;SCR A1X	t	8687
897	LB&amp;SCR E2	f	8688
897	LB&amp;SCR J1	f	8689
897	LB&amp;SCR D1	f	8690
898	False	t	8691
898	True	f	8692
899	East Germany	t	8693
899	Soviet Union	f	8694
899	Hungary	f	8695
899	France	f	8696
900	Koenigsegg Agera RS	t	8697
900	Hennessy Venom GT	f	8698
900	Bugatti Veyron Super Sport	f	8699
900	Pagani Huayra BC	f	8700
901	Bruce Wayne	t	8701
901	Clark Kent	f	8702
901	Barry Allen	f	8703
901	Tony Stark	f	8704
902	Zodiac	t	8705
902	Scorpio	f	8706
902	Tiger Mafia	f	8707
902	The Union	f	8708
903	Scarecrow	t	8709
903	Bane	f	8710
903	Calendar Man	f	8711
903	Clayface	f	8712
904	Robert Kirkman	t	8713
904	Stan Lee	f	8714
904	Malcolm Wheeler-Nicholson	f	8715
904	Robert Crumb	f	8716
905	Dick Grayson	t	8717
905	Bruce Wayne	f	8718
905	Jason Todd	f	8719
905	Tim Drake	f	8720
906	Calvin and Hobbes	t	8721
906	Winnie the Pooh	f	8722
906	Albert and Pogo	f	8723
906	Peanuts	f	8724
907	False	t	8725
907	True	f	8726
908	October 25th, 2014	t	8727
908	April 13th, 2009	f	8728
908	April 8th, 2012	f	8729
908	August 28th, 2003	f	8730
909	Prospit	t	8731
909	No Name	f	8732
909	Golden City	f	8733
909	Yellow Moon	f	8734
910	False	t	8735
910	True	f	8736
911	Green Arrow	t	8737
911	Superman	f	8738
911	Batman	f	8739
911	Steve Trevor	f	8740
912	True	t	8741
912	False	f	8742
913	Daredevil	t	8743
913	Thor	f	8744
913	Wolverine	f	8745
913	Hulk	f	8746
914	Elias Acorn	t	8747
914	Maximillian Acorn	f	8748
914	Alexis Acorn	f	8749
914	Frederick Acorn	f	8750
915	Sonic the Hedgehog #11	t	8751
915	Sonic Universe #32	f	8752
915	Sonic the Hedgehog #161	f	8753
915	Sonic the Hedgehog #47	f	8754
916	Professor Charles the Hedgehog	t	8755
916	Julian Robotnik	f	8756
916	Ivo Robotnik	f	8757
916	Snively Robotnik	f	8758
917	Mega Man	t	8759
917	Super Mario Brothers	f	8760
917	Alex Kidd	f	8761
917	Super Monkey Ball	f	8762
918	Alan Moore	t	8763
918	Bill Finger	f	8764
918	Frank Miller	f	8765
918	Jerry Siegel	f	8766
919	1970	t	8767
919	2000	f	8768
919	1990	f	8769
919	1985	f	8770
920	1978	t	8771
920	1982	f	8772
920	1973	f	8773
920	1988	f	8774
921	Earth-199999	t	8775
921	Earth-616	f	8776
921	Earth-10005	f	8777
921	Earth-2008	f	8778
922	Blonde	t	8779
922	Auburn	f	8780
922	Brown	f	8781
922	Black	f	8782
923	2003	t	8783
923	2001	f	8784
923	2006	f	8785
923	1999	f	8786
924	Lien-Da	t	8787
924	Kragok	f	8788
924	Dimitri	f	8789
924	Remington	f	8790
925	Joani	t	8791
925	Ethel	f	8792
925	Debbi	f	8793
925	Margret	f	8794
926	Envy 	t	8795
926	Sloth	f	8796
926	Wrath 	f	8797
926	Lust	f	8798
927	Roy Harper	t	8799
927	Black Canary	f	8800
927	Emiko Queen	f	8801
927	Dick Grayson	f	8802
928	Wally West	t	8803
928	Johnny Quick	f	8804
928	Jay Garrick	f	8805
928	Eobard Thawne	f	8806
929	Rosalyn	t	8807
929	Rose	f	8808
929	Ruby	f	8809
929	Rachel	f	8810
930	Charlie	t	8811
930	Dave	f	8812
930	Charles	f	8813
930	Nathaniel	f	8814
931	John Calvin	t	8815
931	Calvin Klein	f	8816
931	Calvin Coolidge	f	8817
931	Phillip Calvin McGraw	f	8818
932	Thomas Hobbes	t	8819
932	David Hobbes	f	8820
932	John Hobbes	f	8821
932	Nathaniel Hobbes	f	8822
933	Mr. Bun	t	8823
933	Mr. Bunbun	f	8824
933	Mr. Rabbit	f	8825
933	Mr. Hoppy	f	8826
934	Mr. Spittle	t	8827
934	Mr. Boreman	f	8828
934	Mr. Spitling	f	8829
934	Mr. Moe	f	8830
935	JonDoe297	t	8831
935	iAmBatman	f	8832
935	BWayne13	f	8833
935	BW1129	f	8834
936	Muhammad Ali	t	8835
936	Mike Tyson	f	8836
936	Sylvester Stallone	f	8837
936	Arnold Schwarzenegger	f	8838
937	Max Eisenhardt	t	8839
937	Charles Xavier	f	8840
937	Pietro Maximoff	f	8841
937	Johann Schmidt	f	8842
938	Mierfa Durgas and Nektan Whelan	t	8843
938	The Wrycrown and Voksea Olkido	f	8844
938	Aikter Frekik and Xagrai Ollomu	f	8845
938	Grekei Ceknux and Riya Camacho	f	8846
939	Bro	t	8847
939	Becquerel	f	8848
939	Doc Scratch	f	8849
939	Halley	f	8850
940	Derse	t	8851
940	Skaia	f	8852
940	Prospit	f	8853
940	The Medium	f	8854
941	Takua	t	8855
941	Jaller	f	8856
941	Vakama	f	8857
941	Tahu	f	8858
942	Daniel Dreiberg	t	8859
942	Nelson Gardner	f	8860
942	Hollis Mason	f	8861
942	Adrian Veidt	f	8862
943	Makara	t	8863
943	Makera	f	8864
943	Makare	f	8865
943	Makrea	f	8866
944	James Howlett	t	8867
944	Logan Wolf	f	8868
944	Thomas Wilde	f	8869
944	John Savage	f	8870
945	Anung Un Rama	t	8871
945	Right Hand of Doom	f	8872
945	Ogdru Jahad	f	8873
945	Azzael	f	8874
946	Lobster Johnson	t	8875
946	Roger the Homunculus	f	8876
946	The Spider	f	8877
946	The Wendigo	f	8878
947	Viltrumite	t	8879
947	Kryptonian	f	8880
947	Kree	f	8881
947	Irken	f	8882
948	Guardians of the Globe	t	8883
948	Avengers	f	8884
948	Justice League	f	8885
948	Teenage Mutant Ninja Turtles	f	8886
949	Skinner Sweet	t	8887
949	Hattie Hargrove	f	8888
949	Pearl Jones	f	8889
949	James &quot;Jim&quot; Book	f	8890
950	Dark Elves	t	8891
950	Frost Giants	f	8892
950	Kronans	f	8893
950	Skrulls	f	8894
951	Gohan	t	8895
951	Goku	f	8896
951	Vegeta	f	8897
951	Trunks	f	8898
952	Edward Elric	t	8899
952	Alphonse Elric	f	8900
952	Van Hohenheim	f	8901
952	Izumi Curtis	f	8902
953	Human Transmutation 	t	8903
953	Transmuting Lead Into Gold	f	8904
953	Using Alchemy For Crime 	f	8905
953	Preforming Without A Permit	f	8906
954	True	t	8907
954	False	f	8908
955	Sailor Moon	t	8909
955	Sailor Venus	f	8910
955	Sailor Mars	f	8911
955	Sailor Jupiter	f	8912
956	Macroons	t	8913
956	Ice Cream	f	8914
956	Pizza	f	8915
956	Chips	f	8916
957	1987	t	8917
957	2013	f	8918
957	1983	f	8919
957	1995	f	8920
958	&quot;How disgusting.&quot;	t	8921
958	&quot;Idiot, I won&#039;t let you kill me!&quot;	f	8922
958	&quot;Nothing.&quot;	f	8923
958	&quot;Goddammit, Shinji.&quot;	f	8924
959	Mukuro Ikusaba	t	8925
959	Ryota Mitarai	f	8926
959	Ultimate Imposter	f	8927
959	Komaru Naegi	f	8928
960	Over the Rainbow	t	8929
960	What a Wonderful World	f	8930
960	When You Wish Upon A Star	f	8931
960	Singing In The Rain	f	8932
961	Class 3-E	t	8933
961	Class 3-A	f	8934
961	Class 3-B	f	8935
961	Class 3-D	f	8936
962	2015	t	8937
962	2014	f	8938
962	2012	f	8939
962	2013	f	8940
963	Dispell any esper or magical powers	t	8941
963	Teleport	f	8942
963	Make telepathic communications	f	8943
963	Create electricity from his own body	f	8944
964	20,000	t	8945
964	128	f	8946
964	10,000	f	8947
964	5,000	f	8948
965	Osamu Tezuka	t	8949
965	Mitsuteri Yokoyama	f	8950
965	Takao Saito	f	8951
965	Yoshihiro Tatsumi	f	8952
966	The Super Dimension Fortress Macross	t	8953
966	Mobile Suit Gundam	f	8954
966	Armored Trooper VOTOMS	f	8955
966	Neon Genesis Evangelion	f	8956
967	Ultimate	t	8957
967	Mega	f	8958
967	Adult	f	8959
967	Champion	f	8960
968	Ame &amp; Yuki	t	8961
968	Hana &amp; Yuki	f	8962
968	Ame &amp; Hana	f	8963
968	Chuck &amp; Anna	f	8964
969	The Third Aerial Girls Squad	t	8965
969	Exodus!	f	8966
969	Andes Chucky	f	8967
969	Angel Beats!	f	8968
970	False	t	8969
970	True	f	8970
971	Blank	t	8971
971	Immanity	f	8972
971	Disboard	f	8973
971	Warbeasts	f	8974
972	The End	t	8975
972	Perfection	f	8976
972	Sandbox	f	8977
972	Fairness	f	8978
973	Worst One	t	8979
973	Another One	f	8980
973	Blazer	f	8981
973	Princess	f	8982
974	Envy	t	8983
974	Pride	f	8984
974	Sloth	f	8985
974	Wrath	f	8986
975	Koala	t	8987
975	Boa Hancock	f	8988
975	Nico Robin	f	8989
975	Emporio Ivankov 	f	8990
976	True	t	8991
976	False	f	8992
977	Giorno Giovanna	t	8993
977	Josuke Higashikata	f	8994
977	Jolyne Cujoh	f	8995
977	Johnny Joestar	f	8996
978	Pearl Jam	t	8997
978	Red Hot Chili Pepper	f	8998
978	Cream Starter	f	8999
978	Nut King Call	f	9000
979	Vectors	t	9001
979	Velocity	f	9002
979	Quantums	f	9003
979	Wormholes	f	9004
980	2013	t	9005
980	2014	f	9006
980	2012	f	9007
980	2015	f	9008
981	Naruto: Shippūden	t	9009
981	One Piece	f	9010
981	Naruto	f	9011
981	Gurren Lagann	f	9012
982	Memorze	t	9013
982	Deviluke	f	9014
982	Mistletoe	f	9015
982	Okiwana	f	9016
983	Momo Deviluke	t	9017
983	Yami (Golden Darkness)	f	9018
983	Haruna Sairenji	f	9019
983	Mea Kurosaki	f	9020
984	Reiner Braun	t	9021
984	Armin Arlelt	f	9022
984	Mikasa Ackermann	f	9023
984	Eren Jaeger	f	9024
985	2006	t	9025
985	2007	f	9026
985	2004	f	9027
985	2005	f	9028
986	Rito	t	9029
986	Mikan	f	9030
986	Lala	f	9031
986	Haruna	f	9032
987	Sacred Gear	t	9033
987	Imperial Arm	f	9034
987	Hallowed Relic	f	9035
987	Blessed Artifact	f	9036
988	Shigeru Yahaba	t	9037
988	Tadashi Yamaguchi	f	9038
988	Hisashi Kinoshita	f	9039
988	Kazuhito Narita	f	9040
989	I Don&#039;t Want to Miss a Thing	t	9041
989	Eye Of The Tiger	f	9042
989	Born to be Wild	f	9043
989	Ruby Ring	f	9044
990	Ley Batenkaitos	t	9045
990	Roy Alphard	f	9046
990	Petelgeuse Romanee-Conti	f	9047
990	Louis Arneb	f	9048
991	St. Marguerite	t	9049
991	St. Augustine	f	9050
991	St. Mary	f	9051
991	St. Bernadette	f	9052
992	A-1 Pictures	t	9053
992	Production I.G	f	9054
992	Silver Link	f	9055
992	Kyoto Animation	f	9056
993	False	t	9057
993	True	f	9058
994	Different Gender	t	9059
994	Different Body Proportions	f	9060
994	Different Backstory	f	9061
994	Different Appearance	f	9062
995	True	t	9063
995	False	f	9064
996	Junji Ito	t	9065
996	\tNoboru Takahashi	f	9066
996	Akira Toriyama	f	9067
996	Masashi Kishimoto	f	9068
997	Sen (Thousand)	t	9069
997	Hyaku (Hundred)	f	9070
997	Ichiman (Ten thousand)	f	9071
997	Juu (Ten)	f	9072
998	Junji Ito	t	9073
998	Kazuo Umezu	f	9074
998	Shintaro Kago	f	9075
998	Sui Ishida	f	9076
999	Jotaro Kujo	t	9077
999	Giorno Giovanna	f	9078
999	Joseph Joestar	f	9079
999	Josuke Higashikata	f	9080
1000	Jean Pierre Polnareff	t	9081
1000	Noriaki Kakyoin	f	9082
1000	Hol Horse	f	9083
1000	Hermes Costello	f	9084
1001	The Dragon Wagon	t	9085
1001	The Bouldermobile	f	9086
1001	The Crimson Haybailer	f	9087
1001	The Compact Pussycat	f	9088
1002	True	t	9089
1002	False	f	9090
1003	Marsh	t	9091
1003	Stotch	f	9092
1003	Broflovski	f	9093
1003	Tweak	f	9094
1004	Bambi	t	9095
1004	Cinderella	f	9096
1004	Pinocchio	f	9097
1004	The Jungle Book	f	9098
1005	Ursula	t	9099
1005	Madam Mim	f	9100
1005	Maleficent	f	9101
1005	Lady Tremaine	f	9102
1006	Springfield, Oregon	t	9103
1006	Springfield, Missouri	f	9104
1006	Springfield, Illinois	f	9105
1006	Springfield, Massachusetts	f	9106
1007	Slam dunk, nothing but net!	t	9107
1007	Hit the sack, Jack!	f	9108
1007	Rikki-Tikki-Tavi, biatch!	f	9109
1007	Wubba-lubba-dub-dub!	f	9110
1008	South Park	t	9111
1008	The Simpsons	f	9112
1008	Family Guy	f	9113
1008	Bob&#039;s Burgers	f	9114
1009	John Ratzenberger	t	9115
1009	Tom Hanks	f	9116
1009	Dave Foley	f	9117
1009	Geoffrey Rush	f	9118
1010	Grandfather and Grandson	t	9119
1010	Father and Son	f	9120
1010	Best Friends	f	9121
1010	Crimefighting Partners	f	9122
1011	September 4, 2013	t	9123
1011	December 25, 2010	f	9124
1011	March 28, 1999	f	9125
1011	On Going	f	9126
1012	1995	t	9127
1012	1999	f	9128
1012	2001	f	9129
1012	1997	f	9130
1013	The Black Cauldron	t	9131
1013	Tron	f	9132
1013	Toy Story	f	9133
1013	Fantasia	f	9134
1014	All Dogs Go To Heaven	t	9135
1014	Titan A.E.	f	9136
1014	Anastasia	f	9137
1014	The Land Before Time	f	9138
1015	Water	t	9139
1015	Air	f	9140
1015	Earth	f	9141
1015	Fire	f	9142
1016	Jay Baruchel	t	9143
1016	Jack Brauchel	f	9144
1016	John Powell	f	9145
1016	Gerard Butler	f	9146
1017	Steven Universe	t	9147
1017	Regular Show	f	9148
1017	Adventure Time	f	9149
1017	The Amazing World of Gumball	f	9150
1018	Miranda Wright	t	9151
1018	Dick Tracy	f	9152
1018	Eddie Valiant	f	9153
1018	Dr. Ludwig von Drake	f	9154
1019	Pendleton Ward	t	9155
1019	J. G. Quintel	f	9156
1019	Ben Bocquelet	f	9157
1019	Rebecca Sugar	f	9158
1020	The Shell	t	9159
1020	The Limit	f	9160
1020	The Kids	f	9161
1020	The Gripes	f	9162
1021	Willi Wakker	t	9163
1021	Dick Tingeler	f	9164
1021	Helmut Schmacker	f	9165
1021	Rod Tapper	f	9166
1022	Myrtenaster	t	9167
1022	Gambol Shroud	f	9168
1022	Crescent Rose	f	9169
1022	Ember Celica	f	9170
1023	Lilo	t	9171
1023	Lolo	f	9172
1023	Lucy	f	9173
1023	Lulu	f	9174
1024	Principal Brown	t	9175
1024	Principal Small	f	9176
1024	Principal Brawn	f	9177
1024	Principal Simeon	f	9178
1025	J. G. Quintel	t	9179
1025	Ben Bocquelet	f	9180
1025	Pendleton Ward	f	9181
1025	Rebecca Sugar	f	9182
1026	Monty Oum	t	9183
1026	Miles Luna	f	9184
1026	Kerry Shawcross	f	9185
1026	Shane Newville	f	9186
1027	Gary	t	9187
1027	Orvillie	f	9188
1027	Squidward	f	9189
1027	Squidette	f	9190
1028	Quahog	t	9191
1028	Springfield	f	9192
1028	South Park	f	9193
1028	Langley Falls	f	9194
1029	True	t	9195
1029	False	f	9196
1030	C-137	t	9197
1030	J1977	f	9198
1030	C-136	f	9199
1030	C500-a	f	9200
1031	Applejack	t	9201
1031	Twilight Sparkle	f	9202
1031	Pinkie Pie	f	9203
1031	Rarity	f	9204
1032	Eat a salamander and jump out the window.	t	9205
1032	Leave in peace.	f	9206
1032	Jump out the window.	f	9207
1032	Release 1,000 captive salamanders into the white house.	f	9208
1033	Pompompurin	t	9209
1033	My Melody	f	9210
1033	Badtz-Maru	f	9211
1033	Kerropi	f	9212
1034	Captain Jack	t	9213
1034	Captain Jake	f	9214
1034	Captain Hector	f	9215
1034	Captain Flynn	f	9216
1035	The Slag Brothers	t	9217
1035	The Slate Brothers	f	9218
1035	The Rock Brothers	f	9219
1035	The Stone Brothers	f	9220
1036	Stab him	t	9221
1036	Nab him	f	9222
1036	Jab him	f	9223
1036	Tab him	f	9224
1037	Bandit	t	9225
1037	Lucky	f	9226
1037	Rocky	f	9227
1037	Max	f	9228
1038	True	t	9229
1038	False	f	9230
1039	True	t	9231
1039	False	f	9232
1040	Jeremy Shada	t	9233
1040	Nolan North	f	9234
1040	John DiMaggio	f	9235
1040	Tom Kenny	f	9236
1041	Viacom	t	9237
1041	CBS	f	9238
1041	FOX	f	9239
1041	ABC	f	9240
1042	Michelangelo	t	9241
1042	Leonardo	f	9242
1042	Donatello	f	9243
1042	Raphael	f	9244
1043	The Junkyard Gang	t	9245
1043	The Trash Troupe	f	9246
1043	The Scrapyard Seven	f	9247
1043	The Rotten Posse	f	9248
1044	Mermaid Transformation	t	9249
1044	Artificial Gills	f	9250
1044	Bubble Head	f	9251
1044	Bubble Shield	f	9252
1045	False	t	9253
1045	True	f	9254
1046	Vietnam War	t	9255
1046	World War 2	f	9256
1046	World War 1	f	9257
1046	Cold War	f	9258
1047	Daddy.	t	9259
1047	Sequel?	f	9260
1047	Ja!	f	9261
1047	Rusty!	f	9262
1048	Strong Bad	t	9263
1048	Strong Sad	f	9264
1048	Strong Mad	f	9265
1048	Strong Glad	f	9266
1049	Kootie Pie	t	9267
1049	Sweetie Pie	f	9268
1049	Wendy Pie	f	9269
1049	Honey Pie	f	9270
1050	Crescent Rose	t	9271
1050	Thorned Rosebud	f	9272
1050	Magnhild	f	9273
1050	Crooked Scythe	f	9274
2009	a	t	10034
2009	b	f	10035
2009	c	f	10036
2009	d	f	10037
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questions (id, question, type, category_id, difficulty) FROM stdin;
51	Who wrote &quot;Harry Potter&quot;?	multiple	7	1
52	Who wrote the &quot;A Song of Ice And Fire&quot; fantasy novel series?	multiple	7	2
53	Which famous book is sub-titled &#039;The Modern Prometheus&#039;?	multiple	7	1
54	Who wrote the novel &quot;Moby-Dick&quot;?	multiple	7	3
55	How many books are in the Chronicles of Narnia series?	multiple	7	2
56	What was the name of Captain Nemo&#039;s submarine in &quot;20,000 Leagues Under the Sea&quot;?	multiple	7	1
57	Which of the following is the world&#039;s best-selling book?	multiple	7	1
58	Who wrote the 1967 horror novel &quot;Rosemary&#039;s Baby&quot;?	multiple	7	2
59	In the Harry Potter universe, who does Draco Malfoy end up marrying?	multiple	7	3
60	What is Ron Weasley&#039;s middle name?	multiple	7	3
61	In the Lord of the Rings, who is the father of the dwarf Gimli?	multiple	7	2
62	Who wrote the novel &#039;Fear And Loathing In Las Vegas&#039;?	multiple	7	1
63	Abel Magwitch is a character from which Charles Dickens novel?	multiple	7	3
64	&quot;Green Eggs And Ham&quot; is a book by which author?	multiple	7	1
65	Which famous spy novelist wrote the childrens&#039; story &quot;Chitty-Chitty-Bang-Bang&quot;?	multiple	7	1
66	What was the name of the Mysterious Island, in Jules Verne&#039;s &quot;The Mysterious Island&quot;?	multiple	7	2
67	By what name was the author Eric Blair better known?	multiple	7	2
68	In the &quot;Harry Potter&quot; series, what is Headmaster Dumbledore&#039;s full name?	multiple	7	3
69	In the &quot;The Hobbit&quot;, who kills Smaug?	multiple	7	2
70	The book 1984 was published in 1949.	boolean	7	1
71	The novel &quot;Of Mice And Men&quot; was written by what author? 	multiple	7	2
72	Stephen Chbosky wrote the book &#039;The Perks of Being A Wallflower&#039;.	boolean	7	1
73	J.K. Rowling completed &quot;Harry Potter and the Deathly Hallows&quot; in which hotel in Edinburgh, Scotland?	multiple	7	2
74	&quot;Elementary, my dear Watson&quot; is a phrase that is never truly said within the Conan Doyle books of Sherlock Holmes.	boolean	7	1
75	The title of Adolf Hitler&#039;s autobiography &quot;Mein Kampf&quot; is what when translated to English?	multiple	7	2
76	Which American author was also a budding travel writer and wrote of his adventures with his dog Charley?	multiple	7	2
77	According to The Hitchhiker&#039;s Guide to the Galaxy book, the answer to life, the universe and everything else is...	multiple	7	2
78	The book &quot;The Little Prince&quot; was written by...	multiple	7	2
79	Harry Potter was born on July 31st, 1980.	boolean	7	3
80	Which of these book series is by James Patterson?	multiple	7	2
81	In the novel &quot;Lord of the Rings&quot;, how many rings of power were given to the race of man?	multiple	7	2
82	In Michael Crichton&#039;s novel &quot;Jurassic Park&quot;, John Hammond meets his demise at the claws of which dinosaur?	multiple	7	2
83	In the &quot;Harry Potter&quot; novels, what must a Hogwarts student do to enter the Ravenclaw Common Room?	multiple	7	2
84	What is the name of Sherlock Holmes&#039;s brother?	multiple	7	1
85	What was the last message of the Dolphins in &quot;The Hitchhiker&#039;s Guide to the Galaxy&quot;?	multiple	7	2
86	What is the make and model of the tour vehicles in &quot;Jurassic Park&quot; (1990)?	multiple	7	2
87	In Margaret Atwood&#039;s &quot;The Handmaid&#039;s Tale&quot;, what is Offred&#039;s real name is implied to be?	multiple	7	3
88	Which of the following was the author of &quot;Username Evie&quot;?	multiple	7	2
89	In &quot;Little Women&quot;, which of the March sisters married Laurie?	multiple	7	2
90	In the Magic: The Gathering universe, which plane does the Homelands expansion take place in?	multiple	7	3
91	What&#039;s the second book in George R. R. Martin&#039;s &#039;A Song of Ice and Fire&#039; series?	multiple	7	1
92	In which classic novel is there a character named Homer Simpson?	multiple	7	3
93	&quot;Green Eggs and Ham&quot; consists of only 50 different words.	boolean	7	1
94	Which fictional English county was the setting for Thomas Hardy&#039;s novels?	multiple	7	3
95	In which classic novel by Mark Twain did a beggar and Prince of Wales switch clothes, and learn about social class inequality?	multiple	7	3
96	Which of the following is not a work authored by Fyodor Dostoevsky?	multiple	7	2
97	What was Sir Handel&#039;s original name in &quot;The Railway Series&quot; and it&#039;s animated counterpart &quot;Thomas and Friends?&quot;	multiple	7	1
98	Shub-Niggurath is a creature that was created by \tJ. R. R. Tolkien in his novel &quot;The Lord of The Rings&quot;.	boolean	7	1
99	What is the name of the town in which Lily and James Potter are buried?	multiple	7	3
100	In Romance of the Three Kingdoms, who was not a member of the Peach Garden Oath?	multiple	7	2
101	Which was the first of Alfred Hitchcock&#039;s movies to be filmed in colour?	multiple	10	3
102	Who played Deputy Marshal Samuel Gerard in the 1993 film &quot;The Fugitive&quot;?	multiple	10	1
103	Which actor played the main character in the 1990 film &quot;Edward Scissorhands&quot;?	multiple	10	2
104	Which of the following James Bond villains is not affiliated with the SPECTRE organization?	multiple	10	2
105	This movie contains the quote, &quot;I feel the need ... the need for speed!&quot;	multiple	10	1
106	The word &quot;Inception&quot; came from the 2010 blockbuster hit &quot;Inception&quot;.	boolean	10	1
107	What did the first moving picture depict?	multiple	10	3
108	Which of these movies did Jeff Bridges not star in?	multiple	10	1
109	Who plays Alice in the Resident Evil movies?	multiple	10	1
110	What is the oldest Disney film?	multiple	10	1
111	In the 1979 British film &quot;Quadrophenia&quot; what is the name of the main protagonist?	multiple	10	2
112	Which one of these action movies are shot entirely in one take?	multiple	10	2
113	Samuel L. Jackson had the words, &#039;Bad Motherf*cker&#039; in-scripted on his lightsaber during the filming of Star Wars.	boolean	10	1
114	In the movie &quot;Cast Away&quot; the main protagonist&#039;s best friend while on the island is named	multiple	10	1
115	In the 1964 film &quot;Zulu&quot;, what song does the British Army company sing before the final battle?	multiple	10	3
116	Who in Pulp Fiction says &quot;No, they got the metric system there, they wouldn&#039;t know what the fuck a Quarter Pounder is.&quot;	multiple	10	1
117	In the movie &quot;Spaceballs&quot;, what are the Spaceballs attempting to steal from Planet Druidia?	multiple	10	1
118	Sean Connery wasn&#039;t in &quot;Indiana Jones and the Kingdom of the Crystal Skull&quot; because he found retirement too enjoyable.	boolean	10	2
119	In the 1999 movie Fight Club, which of these is not a rule of the &quot;fight club&quot;?	multiple	10	2
120	What was the first monster to appear alongside Godzilla?	multiple	10	1
121	What was the name of the actor who played Leatherface in the 1974 horror film, The Texas Chainsaw Massacre?	multiple	10	3
122	Brandon Routh plays the titular character in the movie &quot;John Wick&quot;.	boolean	10	1
123	George Lucas directed the entire original Star Wars trilogy.	boolean	10	1
124	What was the name of the protagonist in the movie Commando (1985)?	multiple	10	2
125	&quot;The first rule is: you don&#039;t talk about it&quot; is a reference to which movie?	multiple	10	1
126	In the 2012 film, &quot;The Lorax&quot;, who is the antagonist?	multiple	10	1
127	Who plays the character of Po in the Kung Fu Panda movies?	multiple	10	1
128	In which movie does Robin Williams&#039; character have to disguise themselves into a woman?	multiple	10	2
129	Which documentary film maker wrote and starred in the film &quot;My Scientology Movie&quot; which first debuted in 2015?	multiple	10	2
130	What is the name of the island that &quot;Jurassic Park&quot; is built on?	multiple	10	1
131	In the &quot;Jurassic Park&quot; universe, when did &quot;Jurassic Park: San Diego&quot; begin construction?	multiple	10	3
132	What three movies, in order from release date, make up the &quot;Dollars Trilogy&quot;?	multiple	10	3
133	Which former Star Trek actor directed Three Men and a Baby (1987)?	multiple	10	2
134	Which of the following films was directed by Ivan Reitman, written by Gary Ross, featured Kevin Kline, and was released in 1993?	multiple	10	3
135	Which town is the setting for the Disney movie The Love Bug (1968)?	multiple	10	2
136	What is Lilo&#039;s last name from Lilo and Stitch?	multiple	10	2
137	In Big Hero 6, what were Baymax&#039;s motions modeled after?	multiple	10	3
138	Where does the original Friday The 13th movie take place?	multiple	10	1
139	The movie &quot;Tron&quot; received an Oscar nomination for Best Visual Effects.	boolean	10	2
140	Which stand-up comedian voiced the talking parrot &quot;Iago&quot; in Disney&#039;s 1992 adaptation of Aladdin?	multiple	10	2
141	Which sci-fi cult films plot concerns aliens attempting to prevent humans from creating a doomsday weapon?	multiple	10	3
142	Ed Koch, the Mayor of New York in 1984, played himself in which Muppets movie?	multiple	10	2
143	Who performed the opening theme song for the James Bond 007 movie &quot;Goldfinger&quot;?	multiple	10	2
144	In the film &quot;Harry Potter and the Order of The Phoenix&quot;, why was Harry Potter&#039;s scream, after Sirius Black died, muted?	multiple	10	3
145	After India, which country produces the second most movies per year?	multiple	10	2
146	Which actor plays the role of the main antagonist in the 2011 movie &quot;Tower Heist?&quot;	multiple	10	2
147	What is the name of the foley artist who designed the famous sounds of Star Wars, including Chewbacca&#039;s roar and R2-D2&#039;s beeps and whistles?	multiple	10	2
148	The 1996 film &#039;Fargo&#039; is primarily set in which US state?	multiple	10	1
149	The killer in the 1981 film &#039;My Bloody Valentine&#039; wears what sort of outfit?	multiple	10	2
150	Which of these films is NOT set in Los Angeles?	multiple	10	1
155	What was the last Aphex Twin album released before his decade-long hiatus?	multiple	3	3
156	Which rap group released the album &quot;Straight Outta Compton&quot;?	multiple	3	1
157	Soulja Boy&#039;s &#039;Crank That&#039; won a Grammy for Best Rap Song in 2007.	boolean	3	2
158	The cover of The Beatles album &quot;Abbey Road&quot; featured a Volkswagen Beetle in the background.	boolean	3	2
159	Saul Hudson (Slash) of the band Guns N&#039; Roses is known for playing what type of guitar?	multiple	3	2
160	American rapper Dr. Dre actually has a Ph.D. doctorate.	boolean	3	1
161	Which song is not by TheFatRat?	multiple	3	2
162	EDM producer Marshmello performs live wearing clothes and a marshmallow mask of what colour?	multiple	3	2
163	Which of these languages was NOT included in the 2016 song &quot;Don&#039;t Mind&quot; by Kent Jones?	multiple	3	2
164	Ashley Frangipane performs under the stage name Halsey.	boolean	3	2
165	EDM record label Monstercat is based in which country?	multiple	3	2
166	The 1952 musical composition 4&#039;33&quot;, composed by prolific American composer John Cage, is mainly comprised of what sound?	multiple	3	2
167	Which of these is NOT a song featured on the Lockjaw EP released in 2013 by Flume &amp; Chet Faker?	multiple	3	3
168	What is the English title of the vaporwave track &quot;リサフランク420 / 現代のコンピュー&quot; by Macintosh Plus (Vektroid)?	multiple	3	3
169	In Mean Girls, who has breasts that tell when it&#039;s raining?	multiple	3	1
170	Which Beatles album does NOT feature any of the band members on it&#039;s cover?	multiple	3	1
171	What is the name of French electronic music producer Madeon&#039;s 2015 debut studio album?	multiple	3	2
172	Which of these is NOT a name of an album released by American rapper Pitbull?	multiple	3	2
173	Which band released songs suchs as &quot;Rio&quot;, &quot;Girls on Film&quot;, and &quot;The Reflex&quot;?	multiple	3	1
174	What was the title of Sakamoto Kyu&#039;s song &quot;Ue o Muite Arukou&quot; (I Look Up As I Walk) changed to in the United States?	multiple	3	2
175	Sting, the lead vocalist of The Police, primarily plays what instrument?	multiple	3	1
176	Which famous 90&#039;s rap album is commonly referred to as &quot;The Bible of Hip Hop&quot;?	multiple	3	2
177	In Kendrick Lamar&#039;s 2012 album, &quot;Good Kid, M.A.A.D City&quot;, the album&#039;s story takes place in which city?	multiple	3	3
178	This album, now considered to be one of the greatest of all time, was a commercial failure when it was released.	multiple	3	3
179	The song &quot;Stronger Than You&quot; is a single by Estelle, who played Garnet in Steven Universe.	boolean	3	1
180	Which country does the electronic music duo &quot;The Knife&quot; originate from?	multiple	3	2
181	Kanye West&#039;s &quot;Gold Digger&quot; featured which Oscar-winning actor?	multiple	3	1
182	Cryoshell, known for &quot;Creeping in My Soul&quot; did the advertising music for what Lego Theme?	multiple	3	2
183	Who is the lead singer of Green Day?	multiple	3	1
184	Which song on Daft Punk&#039;s &quot;Random Access Memories&quot; features Pharrell Williams?	multiple	3	1
185	How many members are in the Japanese rock band SCANDAL?	multiple	3	2
186	When did Tame Impala release their second album?	multiple	3	2
187	Which member of &quot;The Beatles&quot; narrated episodes of &quot;Thomas the Tank Engine&quot;?	multiple	3	2
188	Electronic artists Boys Noize and Skrillex have collaborated and released tracks under what name?	multiple	3	3
189	Which of the following guitarists recorded an album as a member of the Red Hot Chili Peppers?	multiple	3	2
190	What was the name of the cold-war singer who has a song in Grand Theft Auto IV, and a wall landmark in Moscow for his memorial?	multiple	3	3
191	The &#039;In the Flesh&#039; tour was used in support of what Pink Floyd album?	multiple	3	2
192	Who is the lead singer of the Smashing Pumpkins?	multiple	3	2
193	Chino Moreno is the lead singer of which alternative metal band?	multiple	3	3
194	Which punk rock band released hit songs such as &quot;Californication&quot;, &quot;Can&#039;t Stop&quot; and &quot;Under the Bridge&quot;?	multiple	3	1
195	Which song previously recorded by Elvis Presley was covered by UB40 with a reggae beat?	multiple	3	2
196	How many strings are there on a cello?	multiple	3	1
197	Which music publication is often abbreviated to NME?	multiple	3	1
198	Which song made by MAN WITH A MISSION was used as the opening for the anime &quot;Log Horizon&quot;?	multiple	3	2
199	What was Raekwon the Chefs debut solo album?	multiple	3	2
200	Who is the lead singer of Arctic Monkeys?	multiple	3	1
201	AMC&#039;s &quot;The Walking Dead&quot;, Rick, Carl, Daryl, Morgan, Carol and Maggie were introduced to us in Season 1.	boolean	15	2
202	From what show is the character &quot;James Doakes&quot;? 	multiple	15	2
203	In the TV series &quot;Person of Interest&quot;, who plays the character &quot;Harold Finch&quot;?	multiple	15	2
204	Which track by &quot;Massive Attack&quot; is used for the theme of &quot;House&quot;? 	multiple	15	2
205	Who sang the theme song for the TV show &#039;Rawhide&#039;?	multiple	15	2
206	In what year did &quot;The Big Bang Theory&quot; debut on CBS?	multiple	15	2
207	Who is the star of the AMC series Breaking Bad?	multiple	15	1
208	Which of these Bojack Horseman characters is a human?	multiple	15	1
209	Who was the star of the TV series &quot;24&quot;?	multiple	15	2
210	Which character does voice actress Tara Strong NOT voice?	multiple	15	2
211	In the episode of SpongeBob SquarePants, &quot;Survival of the Idiots&quot;, Spongebob called Patrick which nickname?	multiple	15	2
212	The television show Doctor Who first aired in 1963.	boolean	15	2
213	The &quot;Psycho&quot; series of videos on YouTube was created by which of the following?	multiple	15	1
214	Who co-founded the YouTube Let&#039;s Play channel &quot;Game Grumps&quot; alongside Newgrounds animator Egoraptor?	multiple	15	2
215	In the TV series Red Dwarf, Kryten&#039;s full name is Kryten 2X4B-523P.	boolean	15	2
216	In the Star Trek universe, what color is Vulcan blood?	multiple	15	1
217	In Game of Thrones, what continent lies across the Narrow Sea from Westeros?	multiple	15	1
218	In Game of Thrones, what is Littlefinger&#039;s real name?	multiple	15	1
219	When did the TV show Rick and Morty first air on Adult Swim?	multiple	15	1
220	In the Netflix show, Stranger Things, what song would Will sing to himself as he was missing?	multiple	15	2
221	Which country does the YouTuber &quot;SinowBeats&quot; originate from?	multiple	15	3
222	Which of these television shows makes everyone look under their chair?	multiple	15	2
223	What is the real name of the famous spanish humorist, El Risitas?	multiple	15	1
224	In &quot;The Big Bang Theory&quot;, what is Howard Wolowitz&#039;s nickname in World of Warcraft?	multiple	15	2
225	What is the surname of the character Daryl in AMC&#039;s show The Walking Dead?	multiple	15	2
226	In Battlestar Galactica (2004), Cylons were created by man as cybernetic workers and soldiers.	boolean	15	1
227	Which British writer wrote for both Doctor Who and Sherlock?	multiple	15	2
228	Who was the winner of the 2016 WWE Royal Rumble?	multiple	15	2
229	What is Meg&#039;s full name in &quot;Family Guy&quot;?	multiple	15	2
230	In the television show &quot;Lazy Town&quot;, who is the actor of Robbie Rotten?	multiple	15	2
231	Which of these in the Star Trek series is NOT Klingon food?	multiple	15	3
232	The Klingon home planet is Qo&#039;noS.	boolean	15	3
233	Klingons once had a period of Democracy in their history, they referred to it as the &quot;Dark Times&quot;.	boolean	15	2
234	In &quot;Star Trek&quot;, who was the founder of the Klingon Empire and its philosophy?	multiple	15	3
235	Which race enjoys a glass of warm baghol in &quot;Star Trek&quot;?	multiple	15	3
236	In &quot;Star Trek&quot;, what sauce is commonly used by Klingons on bregit lung?	multiple	15	3
237	How many seasons did the Sci-Fi television show &quot;Stargate Atlantis&quot; have?	multiple	15	1
238	How many seasons did the Sci-Fi television show &quot;Stargate Universe&quot; have?	multiple	15	1
239	What breed of dog is &quot;Scooby Doo&quot;?	multiple	15	2
240	Prior to working at Wizards of the Coast, &quot;Mark Rosewater&quot; was a writer for which show?	multiple	15	3
241	Which of the following won the first season of American Idol in 2002?	multiple	15	1
242	Which WWF wrestler had the nickname &quot;The Ayatollah of Rock &#039;N&#039; Rolla&quot;?	multiple	15	2
243	In AMC&#039;s TV Series &quot;The Walking Dead&quot; what are &quot;Zombies&quot; referred to as?	multiple	15	1
244	In &quot;Rick And Morty&quot;, who shot &quot;Mr. Poopybutthole&quot; in the episode &quot;Total Rickall&quot;?	multiple	15	1
245	&quot;The A Team&quot; first aired in the USA and in the UK in what year?	multiple	15	2
246	Which former Coronation Street actress was once a hostess on the British Game Show &quot;Double Your Money&quot;?	multiple	15	3
247	In Game of Thrones what is the name of Jon Snow&#039;s sword?	multiple	15	2
248	What was the UK &quot;Who Wants to be a Millionaire?&quot; cheating scandal known as?	multiple	15	3
249	What actor portrays Hogan &quot;Wash&quot; Washburne in the TV Show Firefly?	multiple	15	2
250	In the show &#039;Doctor Who&#039;, what is the name of the time-capsule model stolen by &#039;the Doctor&#039;?	multiple	15	3
254	DragonForce&#039;s &#039;Through the Fire and Flames&#039; is widely considered to be the hardest song in the Guitar Hero series.	boolean	2	2
255	Which franchise does the creature &quot;Slowpoke&quot; originate from?	multiple	2	1
256	Which was the first video game to be produced by development company Rare?	multiple	2	2
257	In the original &quot;Super Mario Bros.&quot;, what is the acceleration of Mario if he was in free fall?	multiple	2	3
258	How much does the &#039;AWP&#039; cost in Counter-Strike: Global Offensive?	multiple	2	2
259	In Grand Theft Auto V, what was Michael De Santa&#039;s former surname?	multiple	2	1
260	How many classes are there in Team Fortress 2?	multiple	2	2
261	When was the first &quot;Half-Life&quot; released?	multiple	2	3
262	Pac-Man was invented by the designer Toru Iwatani while he was eating pizza.	boolean	2	1
263	Which of the following Pok&eacute;mon games released first?	multiple	2	2
264	Which of these Starbound races has a Wild West culture?	multiple	2	1
265	Which Mario spin-off game did Waluigi make his debut?	multiple	2	1
266	In the game &quot;Overwatch,&quot; which quote does the hero &quot;McCree&quot; NOT say upon using his flashbang ability?	multiple	2	3
267	In the game &quot;Overwatch,&quot; what are the names of the two Australian criminals from the Junkers faction?	multiple	2	1
268	By how many minutes are you late to work in &quot;Half-Life&quot;?	multiple	2	2
269	The Touhou Project series of games is often associated with which genre?	multiple	2	1
270	In Dota 2, Wraith King was previously known as...	multiple	2	1
271	In PROTOTYPE 2. who is referred to as &quot;Tango Primary&quot;?	multiple	2	1
272	In the National Pokedex what number is Porygon-Z?	multiple	2	3
273	Which character, in the game &quot;Morenatsu&quot;, has the most possible endings to their route, at a total of four different endings?	multiple	2	3
274	Which of the following is not a faction in Tom Clancy&#039;s The Division?	multiple	2	1
275	In the title of the game &quot;Luigi&#039;s Mansion&quot;, what is the only letter to not appear with a pair of eyes in it?	multiple	2	3
276	In The Elder Scrolls V: Skyrim, who is the jester in the dark brotherhood?	multiple	2	2
277	In Super Smash Bros. for Nintendo 3DS and Nintendo Wii U, who was the sixth fighter to be added to the game post-launch?	multiple	2	3
278	In Rocket League, you can play Basketball.	boolean	2	2
279	The creeper in Minecraft was the result of a bug while implementing which creature?	multiple	2	3
280	What minimum level in the Defence skill is needed to equip Dragon Armour in the MMO RuneScape?	multiple	2	1
281	In &quot;The Binding of Isaac&quot;, what is the name of the final boss that you fight in The Void?	multiple	2	2
282	What was the #1 selling game on Steam by revenue in 2016?	multiple	2	2
283	Who is the English voice actor for Sora from the Kingdom Hearts series?	multiple	2	2
284	In the game &quot;Hearthstone&quot;, what is the best rank possible?	multiple	2	1
285	When was Club Penguin launched?	multiple	2	2
286	In the &quot;Call Of Duty: Zombies&quot; map &quot;Origins&quot;, where is &quot;Stamin-Up&quot; located?	multiple	2	3
287	In &quot;PAYDAY 2&quot;, what weapon has the highest base weapon damage on a per-shot basis?	multiple	2	2
288	Which one of these games came out first?	multiple	2	2
289	Who is the main character in the video game &quot;Just Cause 3&quot;?	multiple	2	2
290	Which character in the &quot;Animal Crossing&quot; series uses the phrase &quot;zip zoom&quot; when talking to the player?	multiple	2	1
291	Who created the &quot;Metal Gear&quot; Series?	multiple	2	1
292	What are the names of the Ice Climbers in the video game Ice Climber?	multiple	2	2
293	What is the subtitle for Gran Turismo 3?	multiple	2	2
294	Which of these characters is NOT a boss in Crash Bash?	multiple	2	2
295	What is the name of the main protagonist in &quot;Xenoblade Chronicles&quot;?	multiple	2	1
296	In &quot;PUBATTLEGROUNDS&quot; what is the name of the Military Base island?	multiple	2	2
297	In the MMO RPG &quot;Realm of the Mad God&quot;, what class is known for having the highest possible defense?	multiple	2	2
298	In Until Dawn, both characters Sam and Mike cannot be killed under any means until the final chapter of the game.	boolean	2	1
299	What is the name of the adventurer you meet at the mines in Stardew Valley?	multiple	2	1
300	From where does the Nintendo video game character Mario derive his name?	multiple	2	2
301	Carcassonne is based on which French town?	multiple	12	1
302	Snakes and Ladders was originally created in India?	boolean	12	1
303	In a standard game of Monopoly, what colour are the two cheapest properties?	multiple	12	1
304	How many spaces are there on a standard Monopoly board?	multiple	12	1
305	How many dice are used in the game of Yahtzee?	multiple	12	1
306	On a standard Monopoly board, which square is diagonally opposite &#039;Go&#039;? 	multiple	12	1
307	How many dots are on a single die?	multiple	12	1
308	At the start of a standard game of the Monopoly, if you throw a double six, which square would you land on?	multiple	12	2
309	What is the world&#039;s oldest board game?	multiple	12	3
310	In the game &quot;Racko&quot; you may pick up ANY card from the discard pile.	boolean	12	2
311	The board game, Nightmare was released in what year?	multiple	12	2
312	Who is the main character in the VHS tape included in the board game Nightmare?	multiple	12	2
313	How many points is the Z tile worth in Scrabble?	multiple	12	2
314	Which of these games includes the phrase &quot;Do not pass Go, do not collect $200&quot;?	multiple	12	1
315	The card game &quot;Munchkin&quot; won the 2001 Origins Award for Best Traditional Card Game.	boolean	12	1
316	The Angry Video Game Nerd&#039;s alter ego is &quot;Board James&quot;.	boolean	12	1
317	On a standard Monopoly board, how much do you have to pay for Tennessee Ave?	multiple	12	3
318	In standard Monopoly, what&#039;s the rent if you land on Park Place with no houses?	multiple	12	3
319	Which one of these is not a real game in the Dungeons &amp; Dragons series?	multiple	12	1
320	The board game Monopoly takes its street names from which real American city?	multiple	12	1
321	What do you declare in Rīchi Mahjong when you&#039;ve drawn your winning tile?	multiple	12	3
322	In Chess, the Queen has the combined movement of which two pieces?	multiple	12	2
323	&quot;PAYDAY: The Heist&quot; is a sequel to the board game &quot;Payday&quot;.	boolean	12	1
324	In Yu-Gi-Oh, how does a player perform an Xyz Summon?	multiple	12	2
325	Which of the following tabletop games is the oldest?	multiple	12	2
326	The board game Go has more possible legal positions than the number of atoms in the visible universe.	boolean	12	3
327	In which year was the pen and paper RPG &quot;Deadlands&quot; released?	multiple	12	1
328	The board game &quot;Ra&quot; was designed by which designer? 	multiple	12	3
329	What is the most challenging monster in the Dungeons &amp; Dragons 5th Edition Monster Manual?	multiple	12	3
330	The Dice Tower network of board game podcasts and videos is run by which individual?	multiple	12	3
331	In &quot;Magic: The Gathering&quot;, what instant card has the highest converted mana cost?	multiple	12	2
332	What was the development code name for the &quot;Urza&#039;s Destiny&quot; expansion for &quot;Magic: The Gathering&quot;, released in 1999?	multiple	12	3
333	What was the development code name for the &quot;Weatherlight&quot; expansion for &quot;Magic: The Gathering&quot;, released in 1997?	multiple	12	3
334	Which ability from the &quot;Magic: The Gathering&quot; Scars of Mirrodin expansion involves having at least three artifacts in play?	multiple	12	3
335	Some of the &quot;Fallen Empires&quot; cards from &quot;Magic: The Gathering&quot; were misprinted on the backs of which other card game?	multiple	12	3
336	Which of these cards from &quot;Magic: The Gathering&quot; has a flavor text that begins with &quot;Oi oi oi&quot;?	multiple	12	3
337	Which card is on the cover of the Beta rulebook of &quot;Magic: The Gathering&quot;?	multiple	12	3
338	When Magic: The Gathering was first solicited, which of the following was it originally titled?	multiple	12	3
339	In Magic: The Gathering, which of the following was the first publicly released foil card?	multiple	12	3
340	In Magic: The Gathering, what term for blocking was established in the Portal set?	multiple	12	3
341	Europa Universalis is a strategy video game based on which French board game?	multiple	12	2
342	What Magic: The Gathering card&#039;s flavor text is just &#039;Ribbit.&#039;?	multiple	12	3
343	In Magic: The Gathering, what card&#039;s flavor text is &quot;Catch!&quot;?	multiple	12	3
344	When was the board game Twister, released to the public?	multiple	12	1
345	Which character class in Dungeons and Dragons 5th edition gains it&#039;s powers from making a pact with a being of higher power?	multiple	12	3
346	In what year was the card game Magic: the Gathering first introduced?	multiple	12	2
347	What is the sum of all the tiles in a standard box of Scrabble?	multiple	12	3
348	In board games, an additional or ammended rule that applies to a certain group or place is informally known as a &quot;what&quot; rule?	multiple	12	1
349	What is the maximum level you can have in a single class in Dungeons and Dragons (5e)?	multiple	12	1
350	In the Board Game, Settlers of Catan, a die roll of what number causes the Robber to attack? 	multiple	12	2
351	Which of the following bones is not in the leg?	multiple	9	1
352	Igneous rocks are formed by excessive heat and pressure.	boolean	9	1
353	What is considered the rarist form of color blindness?	multiple	9	3
354	Which of the following liquids is least viscous? Assume temperature is 25&deg;C.	multiple	9	3
355	Which is the chemical name of H2O?	multiple	9	3
356	What is the &quot;powerhouse&quot; of the Eukaryotic animal cell?	multiple	9	1
357	What is the hottest planet in the Solar System?	multiple	9	1
358	How many legs is it biologically impossible for a centipede to have?	multiple	9	3
359	What was the first living creature in space?	multiple	9	2
360	What common name is given to the medial condition, tibial stress syndrome (MTSS)?	multiple	9	3
361	How many degrees Fahrenheit is 100 degrees Celsius? 	multiple	9	2
362	What is the molecular formula of Glucose?	multiple	9	3
363	Which element has the atomic number of 7?	multiple	9	2
364	All the following metal elements are liquids at or near room temperature EXCEPT:	multiple	9	2
365	Alzheimer&#039;s disease primarily affects which part of the human body?	multiple	9	1
366	What was the name of the first artificial Earth satellite, launched by the Soviet Union in 1957?	multiple	9	1
367	What is the scientific name of the red fox?	multiple	9	3
368	An atom contains a nucleus.	boolean	9	1
369	&quot;The Big Bang Theory&quot; was first theorized by a priest of what religious ideology?	multiple	9	3
370	Which of these is a type of stretch/deep tendon reflex?	multiple	9	2
371	The human right lung has how many lobes?	multiple	9	2
372	Which is the most abundant element in the universe?	multiple	9	1
373	The core of the Sun can reach which temperature?	multiple	9	3
374	In Chemistry, how many isomers does Butanol (C4H9OH) have?	multiple	9	2
375	An exothermic reaction is a chemical reaction that releases energy by radiating electricity.	boolean	9	1
376	What element on the periodic table has 92 electrons?	multiple	9	3
377	About how old is Earth?	multiple	9	2
378	What nucleotide pairs with guanine?	multiple	9	3
379	Sugar contains fat.	boolean	9	2
380	Muscle fiber is constructed of bundles small long organelles called what?	multiple	9	3
381	What animal takes part in Schr&ouml;dinger&#039;s most famous thought experiment?	multiple	9	1
382	Celiac Disease is a disease that effects the heart, causing those effected to be unable to eat meat.	boolean	9	1
383	The Sun consists of mostly which two elements?	multiple	9	2
384	On which mission did the Space Shuttle Columbia break up upon re-entry?	multiple	9	2
385	Which planet did the &quot;Viking 1&quot; spacecraft send surface images of, starting in 1976?	multiple	9	2
386	Which of the following is the term for &quot;surgical complications resulting from surgical sponges left inside the patient&#039;s body?	multiple	9	3
387	Which of the following men does not have a chemical element named after him?	multiple	9	2
388	Water always boils at 100&deg;C, 212&deg;F, 373.15K, no matter where you are.	boolean	9	1
389	What is the speed of light in a vacuum?	multiple	9	1
390	What is &quot;Stenoma&quot;?	multiple	9	3
391	Which of these choices is not one of the phases of mitosis?	multiple	9	2
392	Dry ice is the solid form of what substance?	multiple	9	1
393	Which of the following elements is typically used in the doping of the semiconductor silicon?	multiple	9	3
394	What is the study of the cells and tissues of plants and animals?	multiple	9	2
395	Which of the following is a major muscle of the back?	multiple	9	3
396	What are the smallest blood vessels in the human body?	multiple	9	2
397	Which of the following are cells of the adaptive immune system?	multiple	9	3
398	What is an alternative name for multiple personality disorder?	multiple	9	2
399	Which of these Elements is a metalloid?	multiple	9	1
400	When was the first mammal successfully cloned?	multiple	9	2
451	In the hexadecimal system, what number comes after 9?	multiple	8	2
452	What is the derivative of Acceleration with respect to time?	multiple	8	3
453	What is the approximate value of mathematical constant e?	multiple	8	3
454	How many zeros are there in a googol?	multiple	8	2
455	What is the area of a circle with a diameter of 20 inches if &pi;= 3.1415?	multiple	8	2
456	The Pythagorean theorem states that the square of the hypotenuse is equal to the product of the squares of the other two sides.	boolean	8	2
457	What are the first 6 digits of the number &quot;Pi&quot;?	multiple	8	2
458	In Roman Numerals, what does XL equate to?	multiple	8	1
459	What is the Roman numeral for 500?	multiple	8	2
460	What&#039;s the square root of 49?	multiple	8	1
461	How many zeptometres are inside one femtometre?	multiple	8	3
462	What is the first Mersenne prime exponent over 1000?	multiple	8	2
463	The proof for the Chinese Remainder Theorem used in Number Theory was NOT developed by its first publisher, Sun Tzu.	boolean	8	2
464	A universal set, or a set that contains all sets, exists.	boolean	8	1
465	111,111,111 x 111,111,111 = 12,345,678,987,654,321	boolean	8	2
466	The &#039;Squaring the Circle&#039; problem is solvable.	boolean	8	1
467	The binary number &quot;101001101&quot; is equivalent to the Decimal number &quot;334&quot;	boolean	8	3
468	What prime number comes next after 19?	multiple	8	1
469	If you could fold a piece of paper in half 50 times, its&#039; thickness will be 3/4th the distance from the Earth to the Sun.	boolean	8	3
470	What is the alphanumeric representation of the imaginary number?	multiple	8	2
471	To the nearest whole number, how many radians are in a whole circle?	multiple	8	2
472	What Greek letter is used to signify summation?	multiple	8	2
473	The decimal number 31 in hexadecimal would be what?	multiple	8	3
474	E = MC3	boolean	8	2
475	Zero factorial is equal to zero. 	boolean	8	2
476	What is the symbol for Displacement?	multiple	8	1
477	The metric prefix &quot;atto-&quot; makes a measurement how much smaller than the base unit?	multiple	8	1
478	A &#039;Millinillion&#039; is a real number.	boolean	8	2
479	How many sides does a heptagon have?	multiple	8	1
480	What is the plane curve proposed by Descartes to challenge Fermat&#039;s extremum-finding techniques called?	multiple	8	3
481	In Topology, the complement of an open set is a closed set.	boolean	8	3
482	The set of all algebraic numbers is countable.	boolean	8	2
483	L&#039;H&ocirc;pital was the mathematician who created the homonymous rule that uses derivatives to evaluate limits with indeterminations.	boolean	8	3
484	The sum of any two odd integers is odd.	boolean	8	1
485	What is the correct order of operations for solving equations?	multiple	8	1
486	You can square root a negative number with an imaginary number &quot;i&quot;.	boolean	8	2
487	An isosceles triangle has two sides of equal length as opposed to three.	boolean	8	1
488	A scalene triangle has two sides of equal length.	boolean	8	1
489	An equilateral triangle always has every angle measuring 60&deg;.	boolean	8	1
490	How many sides does a trapezium have?	multiple	8	1
491	Which of these numbers is closest to the total number of possible states for an army standard Enigma Machine?	multiple	8	3
492	Which greek mathematician ran through the streets of Syracuse naked while shouting &quot;Eureka&quot; after discovering the principle of displacement?	multiple	8	2
493	Which of the following famous mathematicians died in a duel at the age of 20?	multiple	8	3
494	How many books are in Euclid&#039;s Elements of Geometry?	multiple	8	2
495	Which of the following dice is not a platonic solid?	multiple	8	2
496	Which mathematician refused the Fields Medal?	multiple	8	2
497	What is the smallest number that can be expressed as the sum of two positive cubes in two different ways?	multiple	8	3
498	What is the fourth digit of &pi;?	multiple	8	3
499	In the complex plane, multiplying a given function by i rotates it anti-clockwise by how many degrees?	multiple	8	2
500	What type of function is x&sup2;+2x+1?	multiple	8	2
501	Talos, the mythical giant bronze man, was the protector of which island?	multiple	20	3
502	What was the punishment for Sysiphus&#039;s craftiness?	multiple	20	3
503	According to Algonquian folklore, how does one transform into a Wendigo?	multiple	20	3
504	Who was the only god from Greece who did not get a name change in Rome?	multiple	20	1
505	The ancient Roman god of war was commonly known as which of the following?	multiple	20	1
506	This Greek mythological figure is the god/goddess of battle strategy (among other things).	multiple	20	2
507	In Norse mythology, Thor once dressed as a woman.	boolean	20	1
508	The Hippogriff, not to be confused with the Griffon, is a magical creature with the front half of an eagle, and the back half of what?	multiple	20	2
509	Who in Greek mythology, who led the Argonauts in search of the Golden Fleece?	multiple	20	1
510	Who was the Roman god of fire?	multiple	20	2
511	Neptune&#039;s greek name was...	multiple	20	2
512	Hera is god of...	multiple	20	2
513	Which of the following Mesopotamian mythological figures was NOT a deity?	multiple	20	2
514	This Greek goddess&#039;s name was chosen for the dwarf planet responsible for discord on Pluto&#039;s classification amongst astronomers.	multiple	20	1
515	Who was the King of Gods in Ancient Greek mythology?	multiple	20	1
516	In Greek Mythology, who was the daughter of King Minos?	multiple	20	3
517	According to Norse mythology, Loki is a mother.	boolean	20	2
518	The Japanese god Izanagi successfully returned his wife Izanami from the Underworld.	boolean	20	2
519	In Norse mythology, what is the name of the serpent which eats the roots of the ash tree Yggdrasil?	multiple	20	3
520	Which of these Roman gods doesn&#039;t have a counterpart in Greek mythology?	multiple	20	2
521	Which Greek &amp; Roman god was known as the god of music, truth and prophecy, healing, the sun and light, plague, poetry, and more?	multiple	20	1
522	Rannamaari was a sea demon that haunted the people of the Maldives and had to be appeased monthly with the sacrifice of a virgin girl.	boolean	20	3
523	In Greek Mythology, who killed Achilles?	multiple	20	2
524	The greek god Poseidon was the god of what?	multiple	20	1
525	Which figure from Greek mythology traveled to the underworld to return his wife Eurydice to the land of the living?	multiple	20	1
526	Nidhogg is a mythical creature from what mythology?	multiple	20	3
527	In Greek mythology, Hera is the goddess of harvest.	boolean	20	2
528	In Greek mythology, who is the god of wine?	multiple	20	1
529	Who is the Egyptian god of reproduction and lettuce?	multiple	20	3
530	In most traditions, who was the wife of Zeus?	multiple	20	1
531	According to Greek Mythology, Atlas was an Olympian God.	boolean	20	1
532	What is the name of the Greek god of blacksmiths?	multiple	20	2
533	According to the Egyptian Myth of Osiris, who murdered Osiris?	multiple	20	2
534	The Roman god &quot;Jupiter&quot; was first known as &quot;Zeus&quot; to the Greeks.	boolean	20	2
535	Which of these mythological creatures is said to be half-man and half-horse?	multiple	20	1
536	Which of the following is not one of the Greek Fates?	multiple	20	2
537	What mythology did the god &quot;Apollo&quot; come from?	multiple	20	1
538	The Maori hold that which island nation was founded by Kupe, who discovered it under a long white cloud?	multiple	20	2
539	A wyvern is the same as a dragon.	boolean	20	1
540	What mytological creatures have women&#039;s faces and vultures&#039; bodies?	multiple	20	1
541	Janus was the Roman god of doorways and passageways.	boolean	20	3
542	Who is the god of war in Polynesian mythology?	multiple	20	2
543	What immense structure is referred to in Norse Mythology as the Yggdrasil.	multiple	20	3
544	According to Japanese folklore, what is the favorite food of the Kappa.	multiple	20	2
545	The Norse god Odin has two pet crows named &quot;Huginn&quot; and &quot;Muninn&quot;.  What do their names mean?	multiple	20	2
546	What is the name of the first human being in Norse mythology?	multiple	20	2
547	What is the name of the Greek god of peaceful deaths?	multiple	20	2
548	Hel was the daughter of which Norse Mythological figure?	multiple	20	2
549	What animal did Queen Pasipahe sleep with before she gave birth to the Minotaur in Greek Mythology?	multiple	20	2
550	Who is a minor god that is protector and creator of various arts, such as cheese making and bee keeping.	multiple	20	3
551	At which bridge does the annual Oxford and Cambridge boat race start?	multiple	4	2
552	With which team did Michael Schumacher make his Formula One debut at the 1991 Belgian Grand Prix?	multiple	4	2
553	What tool lends it&#039;s name to a last-stone advantage in an end in Curling?	multiple	4	3
554	How many soccer players should be on the field at the same time?	multiple	4	1
555	In what sport is a &quot;shuttlecock&quot; used?	multiple	4	1
556	Which team won the 2015-16 English Premier League?	multiple	4	1
2009	new	multiple	4	1
557	A stimpmeter measures the speed of a ball over what surface?	multiple	4	2
558	With which doubles partner did John McEnroe have most success?	multiple	4	3
559	Soccer player Cristiano Ronaldo opened a museum dedicated to himself.	boolean	4	2
560	The F1 season of 1994 is remembered for what tragic event?	multiple	4	2
561	The Rio 2016 Summer Olympics held it&#039;s closing ceremony on what date?	multiple	4	1
562	Skateboarding will be included in the 2020 Summer Olympics in Tokyo.	boolean	4	2
563	Tennis was once known as Racquetball.	boolean	4	2
564	What was the final score of the Germany vs. Brazil 2014 FIFA World Cup match?	multiple	4	1
565	Where was the Games of the XXII Olympiad held?	multiple	4	3
566	Josh Mansour is part of what NRL team?	multiple	4	2
567	Which male player won the gold medal of table tennis singles in 2016 Olympics Games?	multiple	4	3
568	Roger Federer is a famous soccer player.	boolean	4	1
569	Which team won 2014 FIFA World Cup in Brazil?	multiple	4	1
570	What national team won the 2016 edition of UEFA European Championship?	multiple	4	2
571	Formula E is an auto racing series that uses hybrid electric race cars.	boolean	4	2
572	In Baseball, how many times does the ball have to be pitched outside of the strike zone before the batter is walked?	multiple	4	1
573	In 2016, who won the Formula 1 World Constructor&#039;s Championship for the third time in a row?	multiple	4	2
574	Which city did the former NHL team &quot;The Nordiques&quot; originiate from?	multiple	4	1
575	In association football, or soccer, a corner kick is when the game restarts after someone scores a goal.	boolean	4	1
576	What year did the New Orleans Saints win the Super Bowl?	multiple	4	1
577	What is the exact length of one non-curved part in Lane 1 of an Olympic Track?	multiple	4	2
578	Which portuguese island is soccer player Cristiano Ronaldo from?	multiple	4	2
579	What is the full name of the footballer &quot;Cristiano Ronaldo&quot;?	multiple	4	3
580	Who won the 2015 College Football Playoff (CFP) National Championship? 	multiple	4	2
581	Which year was the third Super Bowl held?	multiple	4	3
582	Why was The Green Monster at Fenway Park was originally built?	multiple	4	2
583	Which NBA player won Most Valuable Player for the 1999-2000 season?	multiple	4	2
584	Which boxer was banned for taking a bite out of Evander Holyfield&#039;s ear in 1997?	multiple	4	1
585	What team did England beat in the semi-final stage to win in the 1966 World Cup final?	multiple	4	3
586	In bowling, what is the term used for getting three consecutive strikes?	multiple	4	1
587	Which city features all of their professional sports teams&#039; jersey&#039;s with the same color scheme?	multiple	4	3
588	Who is Manchester United&#039;s leading appearance maker?	multiple	4	3
589	Who won the premier league title in the 2015-2016 season following a fairy tale run?	multiple	4	1
590	Which of the following player scored a hat-trick during their Manchester United debut?	multiple	4	2
591	The Los Angeles Dodgers were originally from what U.S. city?	multiple	4	1
592	Which professional wrestler fell from the rafters to his death during a live Pay-Per-View event in 1999?	multiple	4	2
593	Who won the UEFA Champions League in 2016?	multiple	4	1
594	What is the name of the AHL affiliate of the Toronto Maple Leafs?	multiple	4	2
595	The Mazda 787B won the 24 Hours of Le Mans in what year?	multiple	4	3
596	What country hosted the 2014 Winter Olympics?	multiple	4	2
597	Which basketball team has attended the most NBA grand finals?	multiple	4	2
598	Who won the 2018 Monaco Grand Prix?	multiple	4	2
599	The AHL affiliate team of the Boston Bruins is named what?	multiple	4	3
600	Which English football team is nicknamed &#039;The Tigers&#039;?	multiple	4	3
604	The Principality of Sealand is an unrecognized micronation off the coast of what country?	multiple	6	2
605	How many countries are inside the United Kingdom?	multiple	6	2
606	Which of these countries is &quot;doubly landlocked&quot; (surrounded entirely by one or more landlocked countries)?	multiple	6	2
607	A group of islands is called an &#039;archipelago&#039;.	boolean	6	1
608	Which of these is NOT a city in Saudi Arabia?	multiple	6	2
609	How many counties in the Republic of Ireland.	multiple	6	2
610	The Republic of Malta is the smallest microstate worldwide.	boolean	6	1
611	Which country is completely landlocked by South Africa?	multiple	6	3
612	Which of the following countries is within the Eurozone but outside of the Schengen Area?	multiple	6	2
613	The derisive acronym &quot;PIIGS&quot; refers to which of the following European countries and their economic statuses?	multiple	6	1
614	The land of Gotland is located in which European country?	multiple	6	2
615	There is a city called Rome in every continent on Earth.	boolean	6	1
616	Which of the following former Yugoslavian states is landlocked?	multiple	6	1
617	Alaska is the largest state in the United States.	boolean	6	1
618	What African country has Portuguese as its official language?	multiple	6	2
619	In 2012 the German-speaking microstate &quot;Liechtenstein&quot; in Central Europe had a population of how many inhabitants?	multiple	6	3
620	The Japanese district Akihabara is also known by what nickname?	multiple	6	2
621	What name was historically used for the Turkish city currently known as Istanbul?	multiple	6	1
622	Ottawa is the capital of Canada.	boolean	6	1
623	How many countries does Spain have a land border with?	multiple	6	2
624	How many countries border Kyrgyzstan?	multiple	6	3
625	What is the capital of Senegal?	multiple	6	2
626	Where is the fast food chain &quot;Panda Express&quot; headquartered?	multiple	6	3
627	Fucking is a village in which country?	multiple	6	3
628	Which country was NOT formerly part of Yugoslavia?	multiple	6	3
629	What tiny principality lies between Spain and France?	multiple	6	2
630	Liechtenstein does not have an airport.	boolean	6	2
631	Which country is the home of the largest Japanese population outside of Japan?	multiple	6	1
632	What North American tourist attraction is served by the &quot;Maid of the Mist&quot; tour company?	multiple	6	3
633	What is Canada&#039;s largest island?	multiple	6	3
634	What is the Polish city known to Germans as Danzig?	multiple	6	1
635	The land mass of modern day Turkey is called what?	multiple	6	2
636	What city  has the busiest airport in the world?	multiple	6	2
637	What was the most populous city in the Americas in 2015?	multiple	6	2
638	Where is the &quot;Sonoran Desert&quot; located?	multiple	6	2
639	Which of the following countries has a flag featuring a yellow lion wielding a sword on a dark red background?	multiple	6	1
640	Colchester Overpass, otherwise known as &quot;Bunny Man Bridge&quot;, is located where?	multiple	6	2
641	The two largest ethnic groups of Belgium are Flemish and Walloon. 	boolean	6	3
642	Which of the following is NOT a capital city?	multiple	6	2
643	The title of the 1969 film &quot;Krakatoa, East_of Java&quot; is incorrect, as Krakatoa is in fact west of Java.	boolean	6	2
644	What national museum will you find in Cooperstown, New York?	multiple	6	3
645	How many time zones are in Russia?	multiple	6	2
646	Which of these is NOT a real tectonic plate?	multiple	6	3
647	What city is the Terracotta Army located in?	multiple	6	2
648	Which of these countries is not a United Nations member state?	multiple	6	2
649	Which of the following is not a megadiverse country - one that harbors a high number of the earth&#039;s endemic species?	multiple	6	2
650	What is Laos?	multiple	6	1
651	Which one of these was not a beach landing site in the Invasion of Normandy?	multiple	13	1
652	When did the French Revolution begin?	multiple	13	3
653	What was William Frederick Cody better known as?	multiple	13	1
654	Japan was part of the Allied Powers during World War I.	boolean	13	3
655	Who discovered Penicillin?	multiple	13	1
656	The Cold War ended with Joseph Stalin&#039;s death.	boolean	13	1
657	America&#039;s Strategic Defense System during the Cold War was nicknamed after this famous movie.	multiple	13	2
658	Which country had an &quot;Orange Revolution&quot; between 2004 and 2005?	multiple	13	2
659	The collapse of the Soviet Union took place in which year?	multiple	13	1
660	When was the United States National Security Agency established?	multiple	13	2
661	The United States was a member of the League of Nations.	boolean	13	1
662	How old was Lyndon B. Johnson when he assumed the role of President of the United States?	multiple	13	2
663	Which Apollo mission was the last one in NASA&#039;s Apollo program?	multiple	13	2
664	What did the first vending machines in the early 1880&#039;s dispense?	multiple	13	3
665	When did the Battle of the Bulge end?	multiple	13	2
666	The fourth funnel of the RMS Titanic was fake designed to make the ship look more powerful and symmetrical.	boolean	13	3
667	Adolf Hitler was a german soldier in World War I.	boolean	13	1
668	In 1720, England was in massive debt, and became in involved in the South Sea Bubble. Who was the main mastermind behind it?	multiple	13	1
669	How many sonatas did Ludwig van Beethoven write?	multiple	13	3
670	The Second Boer War in 1899 was fought where?	multiple	13	3
671	Adolf Hitler was born on which date?	multiple	13	2
672	Joseph Stalin had a criminal past doing what?	multiple	13	2
673	When was Google founded?	multiple	13	1
674	What year did the Boxing Day earthquake &amp; tsunami occur in the Indian Ocean?	multiple	13	2
675	In which year did the Tokyo Subway Sarin Attack occur?	multiple	13	3
676	What is the oldest US state?	multiple	13	2
677	When did Lithuania declare independence from the Soviet Union?	multiple	13	3
678	United States President Ronald Reagan was the first president to appoint a woman to the Supreme Court. 	boolean	13	2
679	During the Spanish Civil War (1936), Francisco Franco fought for which political faction?	multiple	13	3
680	What is the mnemonic device for remembering the fates of the wives of Henry VIII?	multiple	13	2
681	In what dialogue did Socrates defend himself to the court of Athens? 	multiple	13	2
682	Which historical conflict killed the most people?	multiple	13	2
683	Who was the first president born in the independent United States?	multiple	13	2
684	In World War ll, Great Britian used inflatable tanks on the ports of Great Britain to divert Hitler away from Normandy/D-day landing.	boolean	13	1
685	Adolf Hitler was accepted into the Vienna Academy of Fine Arts.	boolean	13	2
686	Which Las Vegas casino was originally constructed and operated by mobster Bugsy Siegel?	multiple	13	2
687	Who was among those killed in the 2010 Smolensk, Russia plane crash tragedy?	multiple	13	1
688	In World War I, what was the name of the alliance of Germany, Austria-Hungary, the Ottoman Empire, and Bulgaria?	multiple	13	2
689	How long did the Warsaw Uprising during World War II last?	multiple	13	3
690	What was the name of the German offensive operation in October 1941 to take Moscow before winter?	multiple	13	3
691	In 1961, an American B-52 aircraft crashed and nearly detonated two 4mt nuclear bombs over which US city?	multiple	13	2
692	How many years did the Hundred Years&#039; War last?	multiple	13	2
693	How old was Adolf Hitler when he died?	multiple	13	1
694	On which aircraft carrier did the Doolitte Raid launch from on April 18, 1942 during World War II?	multiple	13	2
695	What is the historical name of Sri Lanka?	multiple	13	1
696	In 1453, which important city fell?	multiple	13	1
697	The coat of arms of the King of Spain contains the arms from the monarchs of Castille, Leon, Aragon and which other former Iberian kingdom?	multiple	13	3
698	The Thirty Years War ended with which treaty?	multiple	13	2
699	Which Nazi General was known as the &quot;Desert Fox&quot;?	multiple	13	2
700	What is the name of the Boeing B-29 that dropped the &#039;Little Boy&#039; atomic bomb on Hiroshima?	multiple	13	3
701	Whose 2016 presidential campaign slogan was &quot;Make America Great Again&quot;?	multiple	16	1
702	Which president erased the national debt of the United States?	multiple	16	2
703	Who was the only president to not be in office in Washington D.C?	multiple	16	2
704	Who was the 40th President of the USA?	multiple	16	2
705	Before 2011, &quot;True Capitalist Radio&quot; was known by a different name. What was that name?	multiple	16	2
706	The S in Harry S. Truman stands for &quot;Samuel&quot;.	boolean	16	1
707	There was a satirical candidate named &quot;Deez Nuts&quot; running in the 2016 US presidential elections.	boolean	16	1
708	Which of the following Pacific Islander countries is ruled by a constitutional monarchy?	multiple	16	1
709	Which Native American tribe/nation requires at least one half blood quantum (equivalent to one parent) to be eligible for membership?	multiple	16	3
710	The largest consumer market in 2015 was...	multiple	16	1
711	In 2016, the United Kingdom voted to stay in the EU.	boolean	16	1
712	The 2014 movie &quot;The Raid 2: Berandal&quot; was mainly filmed in which Asian country?	multiple	16	2
713	Due to the Nagoya Resolution, China agreed to allow Taiwan to compete separately in international sporting events under what name?	multiple	16	2
714	How many people are in the U.S. House of Representatives?	multiple	16	1
715	Denmark has a monarch.	boolean	16	1
716	Despite being seperated into multiple countries, The Scandinavian countries are unified by all having the same monarch.	boolean	16	1
717	Russia passed a law in 2013 which outlaws telling children that homosexuals exist.	boolean	16	1
718	Which letter do you need to have on a European driver license in order to ride any motorbikes?	multiple	16	3
719	Joko Widodo has appeared in the cover of a TIME magazine.	boolean	16	3
720	George W. Bush lost the popular vote in the 2004 United States presidential election.	boolean	16	2
721	According to the United States Constitution, how old must a person be to be elected President of the United States?	multiple	16	1
722	&quot;Yes, America Can!&quot; was this United States politician&#039;s de facto campaign slogan in 2004.	multiple	16	3
723	Which of the following United States Presidents served the shortest term in office?	multiple	16	3
724	One of Barack Obama&#039;s United States presidential campaign slogan&#039;s was &quot;Yes We Can&quot;.	boolean	16	1
725	Who was the 45th President of the United States?	multiple	16	1
726	The State of Queensland, Australia voted NO to a referendum for daylight savings in 1992.	boolean	16	2
727	Donald Trump won the popular vote in the 2016 United States presidential election.	boolean	16	1
728	Nazi Germany surrendered on Harry Truman&#039;s birthday while he was president.	boolean	16	3
729	What is the name of Niccol&ograve; Machiavelli&#039;s work that argued effective leaders needed to crush their opponents at all costs?	multiple	16	3
730	What is centralism?	multiple	16	3
731	Which of the following United States senators is known for performing a 24-hour long filibuster?	multiple	16	3
732	Who was elected leader of the UK Labour Party in September 2015?	multiple	16	2
733	What is former United States President Bill Clinton&#039;s full name?	multiple	16	2
734	Before 2016, in which other year did Donald Trump run for President?	multiple	16	2
735	In United States history, how many vice presidents did Franklin D. Roosevelt have during his time in office as president?	multiple	16	2
736	Helen Clark was the 37th Prime Minister of Australia.	boolean	16	2
737	Former United States President Bill Clinton famously played which instrument?	multiple	16	1
738	Who succeeded Joseph Stalin as General Secretary of the Communist Party of the Soviet Union?	multiple	16	2
739	What was the personal nickname of the 40th Governor of the US State Louisiana, Huey Long?	multiple	16	2
740	In June 2017, Saudi Arabia and Egypt broke off ties with which country over its supposed support for terrorism?	multiple	16	3
741	Former president Theodore Roosevelt (1900-1908)  ran for another term under the Progressive Party in 1912.	boolean	16	1
742	Who was the longest-serving senator in US history, serving from 1959 to 2010?	multiple	16	3
743	Which former US president used &quot;Let&#039;s Make America Great Again&quot; as his campaign slogan before Donald Trump&#039;s campaign?	multiple	16	2
744	Which former US president was nicknamed &quot;Teddy&quot; after he refused to shoot a defenseless black bear?	multiple	16	1
745	Jeb Bush was elected as Governor of Florida in 2002, starting his political career.	boolean	16	2
746	What year did Gerald Ford Become President?	multiple	16	2
747	What year did the effort to deploy the Common Core State Standards (CCSS) in the US begin?	multiple	16	3
817	How many legs do butterflies have?	multiple	17	1
748	What are the first names of the first father and son pair that were both Prime Ministers of Canada?	multiple	16	2
749	The Watergate Scandal occured in what year?	multiple	16	2
750	Between 1973 to 1990, what country was ruled by dictator Augusto Pinochet?	multiple	16	2
751	Named after a character he played in a 1969 film, what is the name of the ski resort in Utah that Robert Redford bought in 1968?	multiple	14	1
752	Which actress&#039;s real name was Frances Ethel Gumm?	multiple	14	2
753	Michael Jackson had a pet python named &lsquo;Crusher&rsquo;.	boolean	14	2
754	What is the real name of &quot;moot&quot;, founder of the imageboard 4chan?	multiple	14	2
755	What is Doug Walker&#039;s YouTube name?	multiple	14	2
756	Paul McCartney has always used his middle name. What is his real first name? 	multiple	14	2
757	By what name is Carlos Estevez better known? 	multiple	14	1
758	Which actress married Michael Douglas in 2000?	multiple	14	1
759	Donald J. Trump&#039;s Middle Name is...	multiple	14	2
760	What year did radio icon Howard Stern start a job at radio station WNBC?	multiple	14	2
761	Which of these people is NOT a part of the Internet comedy group Mega64?	multiple	14	2
762	What was the cause of death for Freddie Mercury?	multiple	14	2
763	When was Elvis Presley born?	multiple	14	2
764	What was the religion of famous singer &quot;Freddie Mercury&quot;?	multiple	14	3
765	What does film maker Dan Bell typically focus his films on?	multiple	14	1
766	What was the cause of Marilyn Monroes suicide?	multiple	14	1
767	How tall is Tom Cruise?	multiple	14	3
768	What is generally considered to be William Shakespeare&#039;s birth date?	multiple	14	2
769	If he was still alive, in what year would Elvis Presley celebrate his 100th birthday?	multiple	14	2
770	Before voicing Pearl in Steven Universe, Deedee Magno Hall was part of which American band?	multiple	14	2
771	Which celebrity announced his presidency in 2015?	multiple	14	1
772	Aubrey Graham is better known as	multiple	14	1
773	Where was Kanye West born?	multiple	14	2
774	Which famous New York Yankees outfielder did Marilyn Monroe marry?	multiple	14	2
775	What was the name of Marilyn Monroe&#039;s first husband?	multiple	14	2
776	Marilyn Monroe was born on July 1, 1926.	boolean	14	1
777	Which radio personality calls himself &quot;The King of All Media&quot;?	multiple	14	2
778	How much weight did Chris Pratt lose for his role as Star-Lord in &quot;Guardians of the Galaxy&quot;?	multiple	14	2
779	Nikki Diamond portrayed which Gladiator in the 1992 TV show &quot;Gladiators&quot;?	multiple	14	2
780	Who out of these actresses is the youngest?	multiple	14	2
781	Lady Gaga&#039;s real name is Stefani Joanne Angelina Germanotta.	boolean	14	3
782	In what year did &quot;Bob Ross&quot; die?	multiple	14	2
783	Tupac Shakur died due to complications from being stabbed in 1996.	boolean	14	1
784	In which of these TV shows did the chef Gordon Ramsay not appear?	multiple	14	2
785	Which school in Surrey, England did Steve Backshall attend?	multiple	14	3
786	Neil Hamburger is played by which comedian?	multiple	14	1
787	The eccentric natural philosopher Tycho Brahe kept what as a pet?	multiple	14	3
788	Who is &quot;James Rolfe&quot; better known as?	multiple	14	2
789	By which name is Ramon Estevez better known as?	multiple	14	1
790	Who was Donald Trump&#039;s first wife?	multiple	14	3
791	Gabe Newell was born in which year?	multiple	14	3
792	Billy Herrington is from which US state?	multiple	14	3
793	Which TV chef wrote an autobiography titled &quot;Humble Pie&quot;?	multiple	14	2
794	What year was O.J. Simpson aquitted of his murder charges?	multiple	14	2
795	In 2014, this new top 100 rapper who featured in &quot;Computers&quot; and &quot;Body Dance&quot; was arrested in a NYPD sting for murder.	multiple	14	2
796	How old was Muhammad Ali when he died?	multiple	14	2
797	Which television show has Dan Gheesling been on?	multiple	14	2
798	Which of these celebrities was not a member of the Jackson 5?	multiple	14	2
799	What caused Jake Lloyd who played Anakin Skywalker in The Phantom Menace to quit acting?	multiple	14	2
800	What was James Coburn&#039;s last film role before his death?	multiple	14	1
801	The Axolotl is an amphibian that can spend its whole life in a larval state.	boolean	17	1
802	What was the name of the Ethiopian Wolf before they knew it was related to wolves?	multiple	17	3
803	What does &quot;hippopotamus&quot; mean and in what langauge?	multiple	17	2
804	A carnivorous animal eats flesh, what does a nucivorous animal eat?	multiple	17	2
805	What type of animal is a natterjack?	multiple	17	2
806	A slug&rsquo;s blood is green.	boolean	17	1
807	What is the scientific name for modern day humans?	multiple	17	1
808	The Kākāpō is a large, flightless, nocturnal parrot native to which country?	multiple	17	1
809	Which species of Brown Bear is not extinct?	multiple	17	3
810	What color/colour is a polar bear&#039;s skin?	multiple	17	2
811	Hippocampus is the Latin name for which marine creature?	multiple	17	1
812	Kangaroos keep food in their pouches next to their children.	boolean	17	1
813	&quot;Kamea,&quot; the Gilbertese Islander word for dog, is derived from the English phrase &quot;Come here!&quot;	boolean	17	2
814	What is the scientific name for the &quot;Polar Bear&quot;?	multiple	17	2
815	A bear does NOT defecate during hibernation. 	boolean	17	1
816	What are rhino&#039;s horn made of?	multiple	17	2
818	How many known living species of hyenas are there?	multiple	17	3
819	What scientific family does the Aardwolf belong to?	multiple	17	3
820	For what reason would a spotted hyena &quot;laugh&quot;?	multiple	17	2
821	What do you call a baby bat?	multiple	17	1
822	What is the scientific name of the cheetah?	multiple	17	3
823	Which animal was part of an Russian domestication experiment in 1959?	multiple	17	2
824	The now extinct species &quot;Thylacine&quot; was native to where?	multiple	17	2
825	The average lifespan of a wildcat is only around 5-6 years. 	boolean	17	2
826	What is the Gray Wolf&#039;s scientific name?	multiple	17	3
827	Which of these animals is NOT a lizard?	multiple	17	3
828	What is Grumpy Cat&#039;s real name?	multiple	17	1
829	What type of creature is a Bonobo?	multiple	17	3
830	Unlike on most salamanders, this part of a newt is flat?	multiple	17	3
831	What is the name of the family that the domestic cat is a member of?	multiple	17	2
832	A caterpillar has more muscles than humans do.	boolean	17	1
833	What dog bread is one of the oldest breeds of dog and has flourished since before 400 BCE.	multiple	17	2
834	Finnish Lapphund dogs were used for herding reindeer.	boolean	17	2
835	What is the collective noun for a group of crows?	multiple	17	1
836	Which of the following is another name for the &quot;Poecilotheria Metallica Tarantula&quot;?	multiple	17	3
837	What is the scientific name of the Common Chimpanzee?	multiple	17	2
838	Which of these is a colony of polyps and not a jellyfish?	multiple	17	3
839	Tigers have one colour of skin despite the stripey fur.	boolean	17	2
840	Rabbits can see what&#039;s behind themselves without turning their heads.	boolean	17	1
841	What colour is the female blackbird?	multiple	17	1
842	You can tell the age of a ladybird by counting the spots on his back.	boolean	17	2
843	How many teeth does an adult rabbit have?	multiple	17	1
844	What is the collective noun for bears?	multiple	17	2
845	What is the collective noun for rats?	multiple	17	2
846	What is the collective noun for vultures?	multiple	17	3
847	Rabbits are carnivores.	boolean	17	1
848	The internet browser Firefox is named after the Red Panda.	boolean	17	1
849	To which biological phylum do all mammals, birds and reptiles belong?	multiple	17	3
850	The freshwater amphibian, the Axolotl, can regrow it&#039;s limbs.	boolean	17	1
851	In 1993 Swedish car manufacturer Saab experimented with replacing the steering wheel with a joystick in a Saab 9000.	boolean	21	3
852	Which animal features on the logo for Abarth, the motorsport division of Fiat?	multiple	21	2
853	The Italian automaker Lamborghini uses what animal as its logo?	multiple	21	1
854	What part of an automobile engine uses lobes to open and close intake and exhaust valves, and allows an air/fuel mixture into the engine?	multiple	21	2
855	Which Italian city is home of the car manufacturer &#039;Fiat&#039;?	multiple	21	1
856	Which country has the international vehicle registration letter &#039;A&#039;?	multiple	21	2
857	What country is the Hussarya supercar, made by the car manufacturer &quot;Arrinera&quot;, assembled in?	multiple	21	2
858	Which of the following is NOT a Russian car manufacturer?	multiple	21	2
859	Which of the following car manufacturers had a war named after it?	multiple	21	1
860	The Japanese Shinkansen beat the French TGV&#039;s speed record for fastest electric rail train.	boolean	21	2
861	The difference between the lengths of a Boeing 777-300ER and an Airbus A350-1000 is closest to:	multiple	21	3
862	Enzo Ferrari was originally an auto racer for what manufacturer before founding his own car company?	multiple	21	2
863	Complete the following analogy: Audi is to Volkswagen as Infiniti is to ?	multiple	21	2
864	Which of the following vehicles featured a full glass roof at base model?	multiple	21	2
865	The Chevrolet Corvette has always been made exclusively with V8 engines only.	boolean	21	2
866	When was Tesla founded?	multiple	21	2
867	What UK Train does NOT go over 125MPH?	multiple	21	1
868	Which of the following collision avoidance systems helps airplanes avoid colliding with each other?	multiple	21	1
869	Which of these is NOT a car model produced by Malaysian car manufacturer Proton?	multiple	21	3
870	Which of these companies does NOT manufacture motorcycles?	multiple	21	1
871	The full English name of the car manufacturer BMW is Bavarian Motor Works	boolean	21	1
872	Which one of these chassis codes are used by BMW 3-series?	multiple	21	3
873	Which supercar company is from Sweden?	multiple	21	2
874	Which car brand does NOT belong to General Motors?	multiple	21	2
875	Which of these car models are produced by Lamborghini?	multiple	21	2
876	Which Variable Valve Timing technology is used by BMW?	multiple	21	3
877	When BMW was established in 1916, it was producing automobiles.	boolean	21	2
878	How much horsepower is produced by the SD40-2 Locomotive?	multiple	21	3
879	What engine is in the Lexus SC400?	multiple	21	3
880	Volkswagen&#039;s legendary VR6 engine has cylinders positioned at what degree angle?	multiple	21	3
881	Arriva is owned by the Deutsche Bahn.	boolean	21	2
882	Which one of the following is NOT a sub-company of the Volkswagen Group?	multiple	21	3
883	Bugatti was an Italian car manufacturer.	boolean	21	2
884	Which car tire manufacturer is famous for its &quot;P Zero&quot; line?	multiple	21	1
885	When was Cadillac founded?	multiple	21	2
886	What are the cylinder-like parts that pump up and down within the engine?	multiple	21	1
887	What model was the sports car gifted to Yuri Gagarin by the French government in 1965?	multiple	21	3
888	Which one of the following is not made by Ford?	multiple	21	2
889	What nickname was given to Air Canada Flight 143 after it ran out of fuel and glided to safety in 1983?	multiple	21	2
890	The LS1 engine is how many cubic inches?	multiple	21	1
891	The LS2 engine is how many cubic inches?	multiple	21	1
892	The LS3 engine is how many cubic inches?	multiple	21	1
893	What is the name of Nissan&#039;s most popular electric car?	multiple	21	1
894	Which car manufacturer created the &quot;Aventador&quot;?	multiple	21	2
895	Which Audi does not use Haldex based all wheel drive system?	multiple	21	3
896	What year did the Chevrolet LUV mini truck make its debut?	multiple	21	3
897	What kind of train was Stepney, a train on the Bluebell Railway notable for his appearance in &quot;The Railway Series&quot;?	multiple	21	3
898	The majority of Subaru vehicles are made in China.	boolean	21	2
899	What country was the Trabant 601 manufactured in?	multiple	21	1
900	What is the fastest road legal car in the world?	multiple	21	1
901	Who is Batman?	multiple	22	1
902	In Marvel Comics, Taurus is the founder and leader of which criminal organization?	multiple	22	2
903	In the Batman comics, by what other name is the villain Dr. Jonathan Crane known?	multiple	22	3
904	Who is the creator of the comic series &quot;The Walking Dead&quot;?	multiple	22	1
905	What was the name of the first Robin in the Batman comics?	multiple	22	2
906	What is the name of the comic about a young boy, and a tiger who is actually a stuffed animal?	multiple	22	2
907	Deadpool&#039;s identity is Slade Wilson.	boolean	22	1
908	In what Homestuck Update was [S] Game Over released?	multiple	22	3
909	In the Homestuck Series, what is the alternate name for the Kingdom of Lights?	multiple	22	3
910	In the webcomic Homestuck, the first character introduced is Dave Strider.	boolean	22	2
911	Which of the following superheros did Wonder Woman NOT have a love interest in?	multiple	22	2
912	The &quot;Pepe&quot; meme originated from a comic drawn by Matt Furie called &quot;Boy&#039;s Club&quot;?	boolean	22	1
913	This Marvel superhero is often called &quot;The man without fear&quot;.	multiple	22	1
914	In Pre-Super Genesis universe of &quot;Sonic the Hedgehog&quot; comic, what was the name of  Sally Acorn&#039;s brother?	multiple	22	2
915	Which issue of the &quot;Sonic the Hedgehog&quot; comic did Scourge the Hedgehog make his first appearance?	multiple	22	2
916	In &quot;Sonic the Hedgehog&quot; comic, who was the creator of Roboticizer? 	multiple	22	2
917	Which universe crossover was introduced in the &quot;Sonic the Hedgehog&quot; comic issue #247?	multiple	22	1
918	Who wrote the Batman comic series &quot;The Killing Joke&quot;?	multiple	22	2
919	What year was the first San Diego Comic-Con?	multiple	22	3
920	When was the Garfield comic first published?	multiple	22	3
921	What is the designation given to the Marvel Cinematic Universe?	multiple	22	2
922	What is the real hair colour of the mainstream comic book version (Earth-616) of Daredevil?	multiple	22	3
923	In what year did the first &quot;The Walking Dead&quot; comic come out?	multiple	22	3
924	In the comics, which Sonic character took command of the Dark Legion after Luger&#039;s assassination?	multiple	22	2
925	In the &quot;Archie&quot; comics, who was Jughead&#039;s first girlfriend?	multiple	22	3
926	In the webcomic &quot;Ava&#039;s Demon&quot;, what sin is &quot;Nevy Nervine&quot; based off of? 	multiple	22	3
927	Which &quot;Green Arrow&quot; sidekick commonly wears a baseball cap?	multiple	22	2
928	In the DC Comics 2016 reboot, Rebirth, which speedster escaped from the Speed Force after he had been erased from existance?	multiple	22	2
929	What is the full first name of the babysitter in Calvin and Hobbes?	multiple	22	1
930	In Calvin and Hobbes, what is the name of the babysitter&#039;s boyfriend?	multiple	22	2
931	The main six year old protagonist in Calvin and Hobbes is named after what theologian?	multiple	22	1
932	The stuffed tiger in Calvin and Hobbes is named after what philosopher?	multiple	22	2
933	In Calvin and Hobbes, what is the name of Susie&#039;s stuffed rabbit?	multiple	22	2
934	In Calvin and Hobbes, what is the name of the principal at Calvin&#039;s school?	multiple	22	2
935	When Batman trolls the online chat rooms, what alias does he use?	multiple	22	3
936	In 1978, Superman teamed up with what celebrity, to defeat an alien invasion?	multiple	22	3
937	What is the real name of the &quot;Master Of Magnetism&quot; Magneto?	multiple	22	2
938	What are the names of the two &quot;Canon fan trolls&quot; in &quot;Homestuck&quot;?	multiple	22	3
939	In &quot;Homestuck&quot; what is Dave Strider&#039;s guardian?	multiple	22	1
940	In &quot;Homestuck&quot; the &quot;Kingdom of Darkness&quot; is also known as?	multiple	22	1
941	In Bionicle, who was formerly a Av-Matoran and is now the Toa of Light?	multiple	22	2
942	Who is the second person to take up the mantle of Night Owl in the Watchmen graphic novel?	multiple	22	2
943	What is Homestuck character Gamzee&#039;s last name?	multiple	22	2
944	Better known by his nickname Logan, what is Wolverine&#039;s birth name?	multiple	22	3
945	What is Hellboy&#039;s true name?	multiple	22	2
946	Which pulp hero made appearances in Hellboy and BPRD comics before getting his own spin-off?	multiple	22	3
947	What&#039;s the race of Invincible&#039;s father?	multiple	22	1
948	Which one of these superhero teams appears in the Invincible comics?	multiple	22	1
949	Who was the first American Vampire (Scott Snyder&#039;s American Vampire)?	multiple	22	2
950	In the Marvel Universe, the planet of Svartalfheim is home to what race?	multiple	22	3
951	In Dragon Ball Z, who was the first character to go Super Saiyan 2?	multiple	18	2
952	Who was given the title &quot;Full Metal&quot; in the anime series &quot;Full Metal Alchemist&quot;?	multiple	18	1
953	In the anime series &quot;Full Metal Alchemist&quot;, what do Alchemists consider the greatest taboo?	multiple	18	2
954	The animated film &quot;Spirited Away&quot; won the Academy Award for Best Animated Feature at the 75th Academy Awards in 2003.	boolean	18	2
955	Who is the true moon princess in Sailor Moon?	multiple	18	1
956	In the anime, &quot;Super Sonico&quot;, what is Super Sonico&#039;s favorite food?	multiple	18	2
957	What year was &quot;JoJo&#039;s Bizarre Adventure: Phantom Blood&quot; first released?	multiple	18	3
958	What is the last line muttered in the anime film &quot;The End of Evangelion&quot;?	multiple	18	3
959	The name of Junko Enoshima&#039;s imposter at the beginning of Danganronpa: Trigger Happy Havoc is?	multiple	18	1
960	Which song was the callsign for Stefan Verdemann&#039;s KWFM radio station in Urasawa Naoki&#039;s &quot;Monster&quot;?	multiple	18	3
961	In the anime Assassination Classroom what is the class that Korosensei teaches?	multiple	18	2
962	What year did the anime &quot;Himouto! Umaru-chan&quot; air?	multiple	18	2
963	In the &quot;Toaru Majutsu no Index&quot; anime, Touma Kamijou is a level 0 esper that has the ability to do what?	multiple	18	2
964	In &quot;A Certain Scientific Railgun&quot;, how many &quot;sisters&quot; did Accelerator have to kill to achieve the rumored level 6?	multiple	18	1
965	Who is the author of the manga series &quot;Astro Boy&quot;?	multiple	18	1
966	Which of the following anime of the mecha genre began airing in 1982?	multiple	18	2
967	In Digimon, what is the Japanese name for the final evolutionary stage?	multiple	18	1
968	In the 2012 animated film &quot;Wolf Children&quot;, what are the names of the wolf children?	multiple	18	1
969	Aoi Miyamori is the production manager of what anime in &quot;Shirobako&quot;?	multiple	18	2
970	Kiznaiver is an adaptation of a manga.	boolean	18	1
971	The two main characters of &quot;No Game No Life&quot;, Sora and Shiro, together go by what name?	multiple	18	1
972	Medaka Kurokami from &quot;Medaka Box&quot; has what abnormality?	multiple	18	3
973	Ikki Kurogane is known by what nickname at the beginning of &quot;Chivalry of a Failed Knight&quot;?	multiple	18	2
974	Satella in &quot;Re:Zero&quot; is the witch of what?	multiple	18	1
975	In &quot;One Piece&quot;, who is the girl who overcame her enslaved past and became an agent of an army to fight the corrupt government?	multiple	18	3
976	In &quot;JoJo&#039;s Bizarre Adventure&quot;, Father Enrico Pucchi uses a total of 3 stands in Part 6: Stone Ocean.	boolean	18	2
977	Which person from &quot;JoJo&#039;s Bizarre Adventure&quot; does NOT house a reference to a band, artist, or song earlier than 1980?	multiple	18	3
978	Which of the stands from &quot;JoJo&#039;s Bizarre Adventure&quot; mimics the likeness of a tomato?	multiple	18	2
979	In &quot;A Certain Magical Index,&quot; what is Accelerator able to control?	multiple	18	2
980	What year did &quot;Attack on Titan&quot; first air?	multiple	18	1
981	&quot;Silhouette&quot;, a song performed by the group &#039;KANA-BOON&#039; is featured as the sixteenth opening of which anime?	multiple	18	2
982	In &quot;To Love-Ru&quot;, Ren and Run are from what planet?	multiple	18	1
983	In &quot;To Love-Ru: Darkness&quot;, which of the girls attempt making a harem for Rito Yuuki?	multiple	18	2
984	Who is the armored titan in &quot;Attack On Titan&quot;?	multiple	18	1
985	The &quot;To Love-Ru&quot; Manga was started in what year?	multiple	18	3
986	In &quot;To Love-Ru&quot;, who is the first to hear of Yami&#039;s past from her?	multiple	18	2
987	In &quot;Highschool DxD&quot;, what is the name of the item some humans are born with?	multiple	18	2
988	In Haikyuu!!, who is not a member of Karasuno VBC?	multiple	18	2
989	In &quot;Jewelpet Sunshine&quot;, what is the song that plays when Kanon and her friends bust out of prison?	multiple	18	3
990	In the &quot;Re:Zero&quot; manga series, which of the following Sin Archbishops eats Rem&#039;s existence?	multiple	18	2
991	What is the name of the school in the anime and manga &quot;Gosick&quot;?	multiple	18	3
992	Which animation studio produced &quot;Sword Art Online&quot;?	multiple	18	3
993	The character Plum from &quot;No Game No Life&quot; is a girl.	boolean	18	3
994	How does the character Dragowizard, Qinus Axia&#039;s from the anime &quot;Buddyfight&quot; differ between the Japanese and English dubs?	multiple	18	2
995	In Full Metal Panic!, Whispered are those who are capable of creating Black Technology.	boolean	18	2
996	Who was the Author of the manga Uzumaki?	multiple	18	3
997	What name is the main character Chihiro given in the 2001 movie &quot;Spirited Away&quot;?	multiple	18	1
998	Who is the horror manga artist who made Uzumaki?	multiple	18	3
999	In the series JoJo&#039;s Bizarre Adventure, which main character makes the greatest number of recurring appearances?	multiple	18	2
1000	Which JoJo&#039;s Bizarre Adventure character possesses the Stand named Silver Chariot?	multiple	18	2
1001	Which of the following did not feature in the cartoon &#039;Wacky Races&#039;?	multiple	19	1
1002	In the &quot;Shrek&quot; film franchise, Donkey is played by Eddie Murphy.	boolean	19	1
1003	In South Park, what is Stan&#039;s surname?	multiple	19	1
1004	The song &#039;Little April Shower&#039; features in which Disney cartoon film?	multiple	19	1
1005	What was the name of the sea witch in the 1989 Disney film &quot;The Little Mermaid&quot;?	multiple	19	1
1006	What town was &quot;Springfield&quot; from &quot;The Simpsons&quot; originally named after?	multiple	19	3
1007	Which of these is NOT a catchphrase used by Rick Sanchez in the TV show &quot;Rick and Morty&quot;?	multiple	19	1
1008	Butters Stotch, Pip Pirrup, and Wendy Testaburger are all characters in which long running animated TV series?	multiple	19	1
1009	Who is the only voice actor to have a speaking part in all of the Disney Pixar feature films? 	multiple	19	1
1010	What is the relationship between Rick and Morty in the show &quot;Rick and Morty&quot;?	multiple	19	1
1011	When did the last episode of &quot;Futurama&quot; air?	multiple	19	1
1012	What year was the Disney film &quot;A Goofy Movie&quot; released?	multiple	19	2
1013	What was the first Disney movie to use CGI?	multiple	19	1
1014	Which of the following films was Don Bluth both the writer, director, and producer for?	multiple	19	3
1015	In &quot;Avatar: The Last Airbender&quot;, which element does Aang begin to learn after being defrosted?	multiple	19	1
1016	Who voice acted the character Hiccup in the movie &quot;How to Train Your Dragon&quot;?	multiple	19	3
1017	What Cartoon Network show aired its first episode on November 4th, 2013?	multiple	19	2
1018	In the 1993 Disney animated series &quot;Bonkers&quot;, what is the name of Bonker&#039;s second partner?	multiple	19	1
1019	Who created the Cartoon Network series &quot;Adventure Time&quot;?	multiple	19	1
1020	Which episode from The Amazing World Of Gumball won the Childrens Choice Award at the British Animation Awards in 2016?	multiple	19	2
1021	What is the cartoon character, Andy Capp, known as in Germany?	multiple	19	2
1022	In the animated series RWBY, what is the name of the weapon used by Weiss Schnee?	multiple	19	2
1023	What is lost in Hawaiian and is also the name of a little girl in a 2002 film which features a alien named &quot;Stitch&quot;?	multiple	19	1
1024	In &quot;The Amazing World of Gumball&quot;, who is the principal of Elmore Junior High?	multiple	19	2
1025	Who created the Cartoon Network series &quot;Regular Show&quot;?	multiple	19	1
1026	Who created &quot;RWBY&quot;?	multiple	19	2
1027	Which of these characters from &quot;SpongeBob SquarePants&quot; is not a squid?	multiple	19	1
1028	Adam West was the mayor of which cartoon town?	multiple	19	2
1029	Waylon Smithers from &quot;The Simpsons&quot; was originally black when he first appeared in the series.	boolean	19	1
1030	In &quot;Rick and Morty&quot;, from which dimension do Rick and Morty originate from?	multiple	19	3
1031	In &quot;My Little Pony: Friendship is Magic&quot;, which of these ponies represents the quality of honesty?	multiple	19	2
1032	In &quot;Gravity Falls&quot;, what does Quentin Trembley do when he is driven out from the White House?	multiple	19	3
1033	Which Sanrio character was introduced in 1996?	multiple	19	2
1034	What is the name of the Alligator that The Simpsons &quot;killed&quot; in the episode &quot;Kill The Alligator and Run&quot;?	multiple	19	2
1035	In the 1968 Cartoon Show &quot;Wacky Races&quot; what was the name of cavemen duo who rode in The Boulder Mobile?	multiple	19	3
1036	In the 1969 Cartoon show &quot;Dastardly and Muttley in Their Flying Machines&quot;, which were NOT one of the lyrics in the opening theme?	multiple	19	3
1037	What was the name of Jonny&#039;s pet dog in The Adventures of Jonny Quest?	multiple	19	3
1038	Night on Bald Mountain was one of the musical pieces featured in Disney&#039;s 1940&#039;s film Fantasia.	boolean	19	2
1039	Nutcracker Suite was one of the musical pieces featured in Disney&#039;s 1940&#039;s film Fantasia.	boolean	19	2
1040	Who voiced Finn in Adventure Time?	multiple	19	2
1041	Nickelodeon is owned by what parent company?	multiple	19	2
1042	Townsend Coleman provided the voice for which turtle in the original 1987 series of &quot;Teenage Mutant Ninja Turtles&quot;?	multiple	19	3
1043	In the show &quot;Fat Albert and the Cosby Kids&quot;, what is the name of the characters&#039; fictional gang?	multiple	19	2
1044	What ability does Princess Sofia the First have from her amulet that allows her to breathe underwater?	multiple	19	2
1045	In &quot;Avatar: The Last Airbender&quot; and &quot;The Legend of Korra&quot;, Lavabending is a specialized bending technique of Firebending.	boolean	19	2
1046	In The Simpsons, which war did Seymour Skinner serve in the USA Army as a Green Beret?	multiple	19	1
1047	What was Maggie Simpson&#039;s first canonical word, not including the Tracey Ullman shorts?	multiple	19	3
1048	What animated internet character is known to answer emails with his boxing gloves?	multiple	19	2
1049	Wendy O. Koopa appeared in the Super Mario DIC Cartoons, but what was she known as?	multiple	19	1
1050	What is the name of Ruby Rose&#039;s weapon from RWBY?	multiple	19	2
\.


--
-- Data for Name: quizes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quizes (id, category_id, day, score, user_name) FROM stdin;
3	2	2023-01-31 22:52:38.308608	0	yashshah
4	2	2023-01-31 22:53:38.277278	0	yashshah
5	2	2023-01-31 22:54:36.047345	1	yashshah
6	2	2023-01-31 22:54:52.522076	0	yashshah
7	2	2023-01-31 22:55:02.816955	0	yashshah
8	2	2023-01-31 22:56:09.75954	0	yashshah
9	2	2023-01-31 23:01:07.785573	0	yashshah
10	10	2023-01-31 23:25:02.919029	0	yashshah
11	0	2023-01-31 23:27:27.985682	0	admin
12	3	2023-01-31 23:29:18.936017	0	admin
13	10	2023-01-31 23:40:32.789569	0	yash
14	3	2023-02-01 00:04:04.239676	0	yash
15	2	2023-02-01 00:05:43.710517	7	yashshah
16	8	2023-02-01 00:12:40.819195	15	admin
17	0	2023-02-01 00:28:47.840949	0	yash
18	0	2023-02-01 10:17:46.921612	0	yash
19	0	2023-02-01 10:45:22.293606	1	yash
20	2	2023-02-01 10:52:54.839438	1	admin
21	2	2023-02-01 11:00:33.414162	0	yash
22	2	2023-02-01 11:03:02.366912	1	yash
23	0	2023-02-28 17:24:25.149073	0	yash
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, name, password, role) FROM stdin;
6	yash	$2b$10$iPV9ZvF/SSPyqNVOXuBA9OSvatMCezNkTrS..wciFkkTwsTlW8Y4C	2
9	admin	$2b$10$7SAwxpoieTbTBPc/NDcTHu9XDPRtCLtL7aBl91cLBScfYHGiGAQJK	3
12	yash shah	$2b$10$dkX9P4XY/5FkrTV0HYDruuoeOysQX.Qg/TNG8m4dbb5lOXRsi1zwe	2
13	yashshah	$2b$10$Rd9DygrphWiU0qMCyKZ6ae8tBuylgneAgf55AmFHJhux9NKaCO.ku	2
\.


--
-- Name: category_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_seq', 27, true);


--
-- Name: options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.options_id_seq', 10093, true);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questions_id_seq', 2023, true);


--
-- Name: quizes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quizes_id_seq', 23, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 13, true);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- Name: quizes pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizes
    ADD CONSTRAINT pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: users unique-users; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "unique-users" UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: quizes fkey_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizes
    ADD CONSTRAINT fkey_category FOREIGN KEY (category_id) REFERENCES public.category(category_id);


--
-- Name: questions fkey_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT fkey_category FOREIGN KEY (category_id) REFERENCES public.category(category_id) NOT VALID;


--
-- Name: options fkey_questions; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options
    ADD CONSTRAINT fkey_questions FOREIGN KEY (question_id) REFERENCES public.questions(id) ON DELETE CASCADE;


--
-- Name: quizes fkey_uname; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizes
    ADD CONSTRAINT fkey_uname FOREIGN KEY (user_name) REFERENCES public.users(name) NOT VALID;


--
-- PostgreSQL database dump complete
--

