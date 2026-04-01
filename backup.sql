--
-- PostgreSQL database dump
--

\restrict e641HK3PPZB8IjfZPPPwJRnwrcKFmH2KgTd01bwrmaf5ThjNaBHzv7p51to3d3C

-- Dumped from database version 17.9 (Debian 17.9-1.pgdg12+1)
-- Dumped by pg_dump version 17.9 (Debian 17.9-1.pgdg12+1)

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
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: pesquisadores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pesquisadores (
    pesquisadores_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    lattes_id character varying(16) NOT NULL,
    nome character varying(200) NOT NULL
);


ALTER TABLE public.pesquisadores OWNER TO postgres;

--
-- Name: producoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producoes (
    producoes_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    pesquisadores_id uuid NOT NULL,
    issn character varying(16) NOT NULL,
    nomeartigo text NOT NULL,
    anoartigo integer NOT NULL
);


ALTER TABLE public.producoes OWNER TO postgres;

--
-- Data for Name: pesquisadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pesquisadores (pesquisadores_id, lattes_id, nome) FROM stdin;
15bc7ac9-a38c-42a7-939c-32801da5d0d5	1966167015825708	Hugo Saba Pereira Cardoso
94011496-88e6-4526-b3cd-cda29d1d791f	6716225567627323	Eduardo Manuel de Freitas Jorge
\.


--
-- Data for Name: producoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producoes (producoes_id, pesquisadores_id, issn, nomeartigo, anoartigo) FROM stdin;
441e4a1e-1ff8-40d2-8608-b7f193a5b882	15bc7ac9-a38c-42a7-939c-32801da5d0d5	14712458	Spatio-temporal correlation networks of dengue in the state of Bahia	2014
086b339f-e202-4966-af5a-799cd5623dcf	15bc7ac9-a38c-42a7-939c-32801da5d0d5	01291831	Self-affinity in the dengue fever time series	2016
9c99563b-743b-47b8-8791-4ba2fd266b76	15bc7ac9-a38c-42a7-939c-32801da5d0d5	01000233	BIOSSEGURANÇA EM ONCOLOGIA E O PROFISSIONAL FARMACÊUTICO: ANÁLISE DE PRESCRIÇÃO E MANIPULAÇÃO DE MEDICAMENTOS ANTINEOPLÁSICOS	2017
effb9f66-f277-4f62-b95d-15b0faf9e9ce	15bc7ac9-a38c-42a7-939c-32801da5d0d5	17466148	Humoral and cellular immune responses in mice against secreted and somatic antigens from a Corynebacterium pseudotuberculosis attenuated strain: Immune response against a C. pseudotuberculosis strain	2016
23a2ad85-6b26-4ba5-8b7c-2965c85834b6	15bc7ac9-a38c-42a7-939c-32801da5d0d5	03784371	Self-affinity and self-organized criticality applied to the relationship between the economic arrangements and the dengue fever spread in Bahia	2018
bb4a09ff-644c-43d8-98aa-06e075278387	15bc7ac9-a38c-42a7-939c-32801da5d0d5	14131536	Indicação de Procedência: potencial do Recôncavo da Bahia no reconhecimento da  produção artesanal de licores de frutas	2017
75ef5567-6e4c-43c7-ad81-339af90ccf18	15bc7ac9-a38c-42a7-939c-32801da5d0d5	25254553	CENÁRIO DO GRUPO DE APOIO ÀS CRIANÇAS COM CÂNCER (GACCBA): PROPOSTA DE UM AMBIENTE VIRTUAL COLABORATIVO COMO INSTRUMENTO DE INTERAÇÃO, PARTICIPAÇÃO E CONTRIBUIÇÃO PARA A INSTITUIÇÃO	2020
5d65c2cb-6478-4b06-8ae6-7af9744b97c7	15bc7ac9-a38c-42a7-939c-32801da5d0d5	25258761	ROBÔS CIRÚRGICOS: PROSPECÇÃO DE PATENTES RELACIONADAS A APLICAÇÕES HUMANAS	2020
8e1a7358-db2f-4d4b-b250-6b928f1501a1	15bc7ac9-a38c-42a7-939c-32801da5d0d5	01672789	Scaling effect in COVID-19 spreading: The role of heterogeneity in a hybrid ODE-network model with restrictions on the inter-cities flow	2021
a00c802c-1c8e-4551-ad26-ff14704a356d	15bc7ac9-a38c-42a7-939c-32801da5d0d5	19326203	Correlation between hospitalized patients? demographics, symptoms, comorbidities, and COVID-19 pandemic in Bahia, Brazil	2020
665cfa7a-94d5-4ec4-aa80-17c80048d022	15bc7ac9-a38c-42a7-939c-32801da5d0d5	09277757	Preparation of hybrid nanocomposite particles for medical practices	2021
68cbfed7-540d-4357-9a52-42d9cb5aff20	15bc7ac9-a38c-42a7-939c-32801da5d0d5	20452322	A spatio-temporal analysis of dengue spread in a Brazilian dry climate region	2021
8b95ad31-26f4-4494-89b9-46290cc5e31d	15bc7ac9-a38c-42a7-939c-32801da5d0d5	2076393X	Retrospective Cohort Study of COVID-19 in Patients of the Brazilian Public Health System with SARS-CoV-2 Omicron Variant Infection	2022
581c5006-c66a-4b40-88ce-82be46bf7443	15bc7ac9-a38c-42a7-939c-32801da5d0d5	23496495	Business Incubators and Sustainability: A Literature Review	2022
81c071cb-7f5a-40f2-828e-6368d3595f22	15bc7ac9-a38c-42a7-939c-32801da5d0d5	25253514	Os jovens podem participar? Considerações acerca da participação e formação políticas juvenis	2022
082f5b1b-ff50-4971-8b52-05e5a4c4d120	15bc7ac9-a38c-42a7-939c-32801da5d0d5	09600779	Complex network analysis of arboviruses in the same geographic domain: Differences and similarities	2023
f4db16cc-5025-46ad-bf04-55c1324e34a6	15bc7ac9-a38c-42a7-939c-32801da5d0d5	2296424X	Network analysis of spreading of dengue, Zika and chikungunya in the state of Bahia based on notified, confirmed and discarded cases	2022
ae575cb8-83b7-46f8-aada-00b2b8c4eee6	15bc7ac9-a38c-42a7-939c-32801da5d0d5	21757275	Uma Revisão Sistemática dos Indicadores da Saúde e Bem-Estar no Brasil: Cenário Atual e Perspectivas Futuras da Agenda 2030	2023
74866d4c-65e2-4674-8cf8-7d409997b266	94011496-88e6-4526-b3cd-cda29d1d791f	19832192	A REVOLUÇÃO DA ROBÓTICA UTILIZANDO LIXO ELETRÔNICO NO ENSINO BÁSICO: FORMAÇÃO AMPLIADA E MENOR VULNERABILIDADE DE JOVENS À VIOLÊNCIA NAS ESCOLAS PÚBLICAS	2016
648cad76-4edb-449f-b8ca-8b99cfb63a55	15bc7ac9-a38c-42a7-939c-32801da5d0d5	23293284	The Importance of the Facility Location Techniques to Assist Companies in Decision-Making for the Installation of Logistics Hub	2024
3c1766f9-04b4-4d03-8539-11e90606e4c8	94011496-88e6-4526-b3cd-cda29d1d791f	00489697	Relevance of transportation to correlations among criticality, physical means of propagation, and distribution of dengue fever cases in the state of Bahia	2018
86ffa2a4-28c1-4337-919f-ce8371fe0be7	94011496-88e6-4526-b3cd-cda29d1d791f	19818920	Arquitetura da Informação Analítica para Integração de Dados da Pesquisa e Pós-Graduação: Um Estudo de Caso da Universidade do Estado da Bahia	2020
6154d81d-a1f7-450c-a574-b59033fd1e8c	94011496-88e6-4526-b3cd-cda29d1d791f	22309926	A METHOD FOR ONTOLOGY MODELING BASED ON INSTANCES CONCEPTUAL CLASSIFICATION AND FORMALIZATION	2020
a15ceb61-449a-474f-8af8-0f9f6ec50a45	94011496-88e6-4526-b3cd-cda29d1d791f	18093957	ROBÓTICA EDUCACIONAL: CONSTRUÇÃO DE UMA DINÂMICA A PARTIR DO ROBÔ ARDU	2020
d412e22d-63d9-49f7-a0dd-f036beae3cf2	94011496-88e6-4526-b3cd-cda29d1d791f	19805551	Estrutura Organizacional Alernativa Para Desenvolvimento de Software, em Fábrica de Software	2007
00ce5663-6491-4a82-973d-b1f1e9d41510	94011496-88e6-4526-b3cd-cda29d1d791f	03029743	A Framework for Context-Aware Systems in Mobile Devices	2012
56b7af5b-97c5-47a1-95e0-5ac2816a7b2f	94011496-88e6-4526-b3cd-cda29d1d791f	21792534	Perspectiva teórico epistemológica da modelagem conceitual relacionada com a análise cognitiva e semiótica no contexto da difusão do conhecimento em ambientes virtuais de aprendizagem	2012
c783ae5a-2082-46f5-9b87-2f6eba9babe3	94011496-88e6-4526-b3cd-cda29d1d791f	22360972	GERENCIAMENTO DE PROJETO OTIMISTA (GPO): UM MÉTODO QUE INTEGRA PERT/CPM À CCPM	2011
49b8c1b3-34f6-4e68-a884-73b0b30390c3	94011496-88e6-4526-b3cd-cda29d1d791f	00313203	A mobile, lightweight, poll-based food identification system	2014
1f88a8af-c926-441b-a4d1-91483dfd85d3	94011496-88e6-4526-b3cd-cda29d1d791f	25956825	Dinâmica de ensino baseada em fabricação digital e PBL para apoiar os professores de psicologia na apresentação do Teste de Pirâmide Colorida Pfister / Teaching dynamics based on digital fabrication and PBL to support psychology teachers in presenting the Pfister Color Pyramid Test	2021
d78ca01a-dc8e-4696-9fe6-fd2da44ab331	94011496-88e6-4526-b3cd-cda29d1d791f	25253409	A teoria fundamentada em dados aplicada ao campo da educação superior	2021
02f4c830-baad-4076-927b-eb8528a086d9	94011496-88e6-4526-b3cd-cda29d1d791f	20711050	Analysis of Hydrous Ethanol Price Competitiveness after the Implementation of the Fossil Fuel Import Price Parity Policy in Brazil	2021
92e80c41-d833-4f6a-aab4-44232f8da838	94011496-88e6-4526-b3cd-cda29d1d791f	23170026	Portal de Acesso às Informações das Ações das Universidades Federais em Resposta à Pandemia de Covid-19: uma análise do período pandêmico até a transição para uma pós-pandemia	2023
a522b343-5cf7-469e-94f0-9f837ca3ed9f	94011496-88e6-4526-b3cd-cda29d1d791f	23166517	SAÚDE PÚBLICA: PROSPECÇÃO TECNOLÓGICA DOS REGISTROS DE SOFTWARES PARA O COMBATE A DENGUE	2022
a85cc5c9-dcf7-402d-b6d3-d5bbc7b44e14	94011496-88e6-4526-b3cd-cda29d1d791f	22372903	Um Sistema de apoio a Gerência de Requisitos Aderente ao MPS.BR	2018
f87fc8e4-8cc2-43c4-b317-1b924eba290f	94011496-88e6-4526-b3cd-cda29d1d791f	16762592	Inteligência Artificial e Virtualização em Ambientes Virtuais de Ensino e Aprendizagem: Desafios e Perspectivas Tecnológicas	2021
995bedef-5e62-458a-b023-06f8fb7459a6	94011496-88e6-4526-b3cd-cda29d1d791f	23189584	CENÁRIO DO GRUPO DE APOIO ÀS CRIANÇAS COM CÂNCER (GACC-BA): PROPOSTA DE UM AMBIENTE VIRTUAL COLABORATIVO COMO INSTRUMENTO DE INTERAÇÃO, PARTICIPAÇÃO E CONTRIBUIÇÃO PARA A INSTITUIÇÃO	2020
93e607b1-672e-44ac-82db-9bb0daf8fe7d	94011496-88e6-4526-b3cd-cda29d1d791f	21757534	PROPOSTA DE (RE)DESIGN DO AMBIENTE EDUCATIVO FORMAL UNIVERSITÁRIO PARA ESTIMULAR UMA APRENDIZAGEM PROTAGONISTA, CRIATIVA E INOVADORA	2020
727a9e43-ec85-4292-bfe7-9823258455f5	15bc7ac9-a38c-42a7-939c-32801da5d0d5	19830882	Percepções juvenis sobre as fake news em seus processos de formação e participação políticas	2024
07a33fc4-baa4-48e1-b868-d174043ccdf7	94011496-88e6-4526-b3cd-cda29d1d791f	15487709	Correlation between Transport and Occurrence of Dengue Cases in Bahia	2014
01406421-2173-4dcf-ab47-de384afbb4ea	94011496-88e6-4526-b3cd-cda29d1d791f	00105236	Maker Culture: dissemination of knowledge and development of skills and competencies for the 21st century	2023
eed24791-f19e-4d99-af06-462e041785c5	94011496-88e6-4526-b3cd-cda29d1d791f	15411389	Difusão e utilização de informações acadêmicas: um modelo de gestão do conhecimento para subsidiar gestores universitários	2024
ed7358c5-23fd-45b1-896e-ccac85cc4dd0	94011496-88e6-4526-b3cd-cda29d1d791f	19887833	Diretrizes para o planejamento de um ambiente de aprendizagem neuroarqeducativo	2023
e04e6abe-94f3-4c36-87c1-5e1afb48e474	94011496-88e6-4526-b3cd-cda29d1d791f	1981223X	APLICAÇÃO DE CONCEITOS E CRITÉRIOS DE DESEMPENHO PARA UMA SALA DE AULA INOVADORA	2023
81d19be1-cb0e-4ceb-ad64-3bdf0d45516c	94011496-88e6-4526-b3cd-cda29d1d791f	19831358	Solução para Mapeamento e Consulta das Competências dos Pesquisadores: uma arquitetura para extração, integração e consultas de informações acadêmicas	2024
f788e221-a198-4888-95ec-00e970c7904e	94011496-88e6-4526-b3cd-cda29d1d791f	16604601	A Critical Analysis of the COVID-19 Hospitalization Network in Countries with Limited Resources	2022
301878e4-6f2e-48b1-a871-c4403d13caad	94011496-88e6-4526-b3cd-cda29d1d791f	17554365	Synchronized spread of COVID-19 in the cities of Bahia, Brazil	2022
f00d591b-9b4c-4bb4-9fb9-2499e084b1f4	94011496-88e6-4526-b3cd-cda29d1d791f	24112933	An evaluation model for accessibility conditions of salvador bus stops	2022
9d826991-afdc-47aa-8789-ead8e2afe1fa	94011496-88e6-4526-b3cd-cda29d1d791f	21788030	IMPRESSÃO 3D: DA PESQUISA AO SETOR PRODUTIVO Um estudo exploratório sobre sua evolução histórica, origem, tecnologias, aplicações e inovações	2022
3ec20c04-d571-4b19-bc92-a5326fc00be2	94011496-88e6-4526-b3cd-cda29d1d791f	21789010	Desenvolvimento sustentável: uma proposta para descarbonização de frotas de veículos	2023
\.


--
-- Name: pesquisadores pesquisadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pesquisadores
    ADD CONSTRAINT pesquisadores_pkey PRIMARY KEY (pesquisadores_id);


--
-- Name: producoes producoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producoes
    ADD CONSTRAINT producoes_pkey PRIMARY KEY (producoes_id);


--
-- Name: producoes fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producoes
    ADD CONSTRAINT fkey FOREIGN KEY (pesquisadores_id) REFERENCES public.pesquisadores(pesquisadores_id);


--
-- PostgreSQL database dump complete
--

\unrestrict e641HK3PPZB8IjfZPPPwJRnwrcKFmH2KgTd01bwrmaf5ThjNaBHzv7p51to3d3C

