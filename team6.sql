DROP TABLE ILLNESSES CASCADE;
DROP TABLE DRUGS CASCADE;
DROP TABLE CITIES CASCADE;
DROP TABLE ZIPS CASCADE;
DROP TABLE HOSPITALS CASCADE;
DROP TABLE SPECIALITIES CASCADE;
DROP TABLE DOCTORS CASCADE;
DROP TABLE DOCTORS_HOSPITALS CASCADE;
DROP TABLE PATIENTS CASCADE;
DROP TABLE RECORDS CASCADE;
DROP TABLE RECORDS_DRUGS CASCADE;
DROP TABLE RECORDS_ILLNESSES CASCADE;

--DDL

CREATE TABLE IF NOT EXISTS ILLNESSES(
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    DESCRIPTION VARCHAR(100)
);


CREATE TABLE IF NOT EXISTS DRUGS(
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    DESCRIPTION VARCHAR(100)
);


CREATE TABLE IF NOT EXISTS CITIES(
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL
);


CREATE TABLE IF NOT EXISTS ZIPS(
    CODE SERIAL PRIMARY KEY,
    CITY_ID INTEGER
        REFERENCES CITIES
);


CREATE TABLE IF NOT EXISTS HOSPITALS(
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    ZIP_CODE INTEGER
        REFERENCES ZIPS,
    EMAIL VARCHAR(100) NOT NULL,
    PHONE VARCHAR(25) NOT NULL
);


CREATE TABLE IF NOT EXISTS SPECIALITIES(
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    DESCRIPTION VARCHAR(500)
);


CREATE TABLE IF NOT EXISTS DOCTORS(
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    SURNAME VARCHAR(100) NOT NULL,
    DOB DATE NOT NULL,
    ABOUT VARCHAR(500),
    SPECIALITY_ID INTEGER NOT NULL
        REFERENCES SPECIALITIES,
    EMAIL VARCHAR(100) NOT NULL,
    PHONE1 VARCHAR(25) NOT NULL,
    PHONE2 VARCHAR(25) NOT NULL
);


CREATE TABLE IF NOT EXISTS DOCTORS_HOSPITALS(
    DOCTOR_ID   INTEGER NOT NULL
        REFERENCES DOCTORS,
    HOSPITAL_ID INTEGER NOT NULL
        REFERENCES HOSPITALS,
    JOIN_DATE   DATE    NOT NULL,
    PRIMARY KEY (DOCTOR_ID, HOSPITAL_ID)
);


CREATE TABLE IF NOT EXISTS PATIENTS(
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    SURNAME VARCHAR(100) NOT NULL,
    DOB     DATE        NOT NULL,
    EMAIL   VARCHAR(100) NOT NULL,
    PHONE1  VARCHAR(25) NOT NULL,
    PHONE2  VARCHAR(25) NOT NULL
);


CREATE TABLE IF NOT EXISTS RECORDS(
    ID SERIAL PRIMARY KEY,
    PATIENT_ID  INTEGER NOT NULL
        REFERENCES PATIENTS,
    DOCTOR_ID   INTEGER NOT NULL
        REFERENCES DOCTORS,
    HOSPITAL_ID INTEGER NOT NULL
        REFERENCES HOSPITALS,
    DATE        DATE    NOT NULL
);


CREATE TABLE IF NOT EXISTS RECORDS_ILLNESSES(
    RECORD_ID  INTEGER NOT NULL
        REFERENCES RECORDS,
    ILLNESS_ID INTEGER NOT NULL
        REFERENCES ILLNESSES,
    PRIMARY KEY (RECORD_ID, ILLNESS_ID)
);


CREATE TABLE IF NOT EXISTS RECORDS_DRUGS(
    RECORD_ID INTEGER NOT NULL
        REFERENCES RECORDS,
    DRUG_ID   INTEGER NOT NULL
        REFERENCES DRUGS,
    PRIMARY KEY (RECORD_ID, DRUG_ID)
);

-- DML

-- Cities

INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (2, 'Yerevan');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (3, 'Gyumri');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (4, 'Vanadzor');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (5, 'Artashat');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (6, 'Abovyan');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (7, 'Noratus');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (8, 'Dzoragyugh');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (9, 'Aghavnadzor');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (10, 'Vardenut');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (11, 'Kapan');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (12, 'Hrazdan');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (13, 'Armavir');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (14, 'Gavar');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (15, 'Artashat');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (16, 'Goris');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (17, 'Sevan');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (18, 'Vagharshapat');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (19, 'Ashtarak');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (20, 'Dilijan');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (21, 'Sisian');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (22, 'Spitak');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (23, 'Ijevan');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (24, 'Alaverdi');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (25, 'Martuni');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (26, 'Metsamor');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (27, 'Masis');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (28, 'Ararat');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (29, 'Vardenis');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (30, 'Byureghavan');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (31, 'Akhuryan');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (32, 'Tashir');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (33, 'Nor Hachn');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (34, 'Chambarak');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (35, 'Berd');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (36, 'Vedi');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (37, 'Meghri');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (38, 'Noratus');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (39, 'Yeghegnadzor');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (40, 'Aparan');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (41, 'Vayk');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (42, 'Tumanyan');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (43, 'Ayrum');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (44, 'Jermuk');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (45, 'Yeghvard');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (46, 'Nor Geghi');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (47, 'Maralik');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (48, 'Yeghegnut');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (49, 'Sarukhan');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (50, 'Aghavnatun');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (51, 'Aramus');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (52, 'Yeranos');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (53, 'Aygavan');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (54, 'Arzni');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (55, 'Urtsadzor');
INSERT INTO PUBLIC.CITIES (ID, NAME) VALUES (56, 'Hatsavan');



-- Zips

INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (1, 2);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (2, 3);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (3, 4);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (4, 5);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (5, 6);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (6, 7);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (7, 8);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (8, 9);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (9, 10);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (10, 11);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (11, 12);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (12, 13);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (13, 14);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (14, 15);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (15, 16);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (16, 17);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (17, 18);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (18, 19);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (19, 20);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (20, 21);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (21, 22);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (22, 23);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (23, 24);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (24, 25);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (25, 26);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (26, 27);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (27, 28);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (28, 29);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (29, 30);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (30, 31);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (31, 32);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (32, 33);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (33, 34);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (34, 35);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (35, 36);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (36, 37);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (37, 38);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (38, 39);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (39, 40);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (40, 41);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (41, 42);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (42, 43);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (43, 44);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (44, 45);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (45, 46);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (46, 47);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (47, 48);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (48, 49);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (49, 50);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (50, 4);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (51, 2);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (52, 3);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (53, 4);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (54, 5);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (55, 6);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (56, 7);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (57, 8);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (58, 9);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (59, 10);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (60, 11);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (61, 12);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (62, 13);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (63, 14);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (64, 15);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (65, 16);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (66, 17);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (67, 18);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (68, 19);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (69, 20);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (70, 21);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (71, 22);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (72, 23);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (73, 24);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (74, 25);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (75, 26);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (76, 27);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (77, 28);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (78, 29);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (79, 30);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (80, 31);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (81, 32);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (82, 33);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (83, 34);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (84, 35);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (85, 36);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (86, 37);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (87, 38);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (88, 39);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (89, 40);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (90, 41);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (91, 42);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (92, 43);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (93, 44);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (94, 45);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (95, 46);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (96, 47);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (97, 48);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (98, 49);
INSERT INTO PUBLIC.ZIPS (CODE, CITY_ID) VALUES (99, 50);





--Hospitals

INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (2, 'Yerevan Medical Center', 12, 'yerevanmedical@example.com', '555-1234');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (3, 'Abovyan General Hospital', 35, 'abovyangeneral@example.com', '555-5678');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (4, 'Vanadzor City Hospital', 47, 'vanadzorcity@example.com', '555-2468');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (5, 'Gyumri Medical Center', 23, 'gyumrimedical@example.com', '555-1357');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (6, 'Dilijan Regional Hospital', 50, 'dilijanregional@example.com', '555-7890');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (7, 'Spitak Maternity Hospital', 18, 'spitakmaternity@example.com', '555-3698');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (8, 'Kapan Central Hospital', 99, 'kapancentral@example.com', '555-0246');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (9, 'Artashat Medical Center', 67, 'artashatmedical@example.com', '555-4578');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (10, 'Sevan Rehabilitation Hospital', 8, 'sevanrehab@example.com', '555-1236');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (11, 'Stepanavan Municipal Hospital', 77, 'stepanavanmunicipal@example.com', '555-3456');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (12, 'Armavir Regional Medical Center', 81, 'armavirregional@example.com', '555-7891');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (13, 'Hrazdan Medical Complex', 92, 'hrazdanmedical@example.com', '555-1593');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (14, 'Goris City Hospital', 16, 'goriscity@example.com', '555-4680');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (15, 'Vardenis Surgical Hospital', 42, 'vardenissurgical@example.com', '555-2671');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (16, 'Sisian Emergency Hospital', 74, 'sisianemergency@example.com', '555-0138');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (17, 'Meghri Community Medical Center', 29, 'meghricommunity@example.com', '555-5689');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (18, 'Martuni Polyclinic', 52, 'martunipolyclinic@example.com', '555-0135');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (19, 'Ashtarak Family Hospital', 31, 'ashtarakfamily@example.com', '555-3690');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (20, 'Ijevan Surgical Center', 40, 'ijevansurgical@example.com', '555-2469');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (21, 'Gavar Medical Clinic', 60, 'gavarmedical@example.com', '555-1235');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (22, 'Ararat Cardiology Center', 88, 'araratcardiology@example.com', '555-7893');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (23, 'Jermuk Health Center', 15, 'jermukhealth@example.com', '555-4681');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (24, 'Tashir Medical Complex', 53, 'tashirmedical@example.com', '555-0137');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (25, 'Berd Hospital', 45, 'berdhospital@example.com', '555-2670');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (26, 'Nor Hachn Medical Center', 30, 'norhachnmedical@example.com', '555-7894');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (27, 'Alaverdi General Hospital', 62, 'alaverdigeneral@example.com', '555-4682');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (28, 'Masis Maternity Hospital', 25, 'masismaternity@example.com', '555-3578');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (29, 'Gyumri Childrens Hospital', 40, 'gyumrichildrens@example.com', '555-0136');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (30, 'Vanadzor Psychiatric Center', 65, 'vanadzorpsychiatric@example.com', '555-6780');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (31, 'Artik Community Clinic', 26, 'artikcommunity@example.com', '555-2467');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (32, 'Ararat Maternity Hospital', 37, 'aratmaternity@example.com', '555-135');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (33, 'Sevan Medical Center', 61, 'sevanmedicalcenter@example.com', '555-5674');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (34, 'Gyumri Surgical Hospital', 42, 'gyumrisurgical@example.com', '555-2463');
INSERT INTO PUBLIC.HOSPITALS (ID, NAME, ZIP_CODE, EMAIL, PHONE) VALUES (35, 'Kapan Maternity Hospital', 33, 'kapanmaternity@example.com', '555-1354');



-- Illnesses


INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (1, 'Common Cold', 'Viral infection of the upper respiratory tract.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (2, 'Influenza', 'Viral infection that affects the respiratory system.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (3, 'Migraine', 'Type of headache characterized by severe pain, nausea, and sensitivity to light.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (4, 'Asthma', 'Chronic respiratory condition that causes difficulty in breathing.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (5, 'Diabetes', 'Metabolic disorder characterized by high blood sugar levels.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (6, 'Hypertension', 'Medical condition where blood pressure is consistently elevated.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (7, 'Arthritis', 'Inflammation of one or more joints.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (8, 'Osteoporosis', 'Condition where bones become weak and brittle.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (9, 'Cancer', 'Abnormal growth of cells that can invade and destroy healthy tissues.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (10, 'Heart Attack', 'Medical emergency where blood flow to the heart muscle is blocked.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (11, 'Stroke', 'Medical emergency where blood flow to the brain is interrupted.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (12, 'Pneumonia', 'Infection that inflames air sacs in one or both lungs.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (13, 'Bronchitis', 'Inflammation of the lining of the bronchial tubes.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (14, 'Kidney Stones', 'Hard deposits of mineral and acid salts that form inside the kidneys.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (15, 'Gastritis', 'Inflammation of the stomach lining.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (16, 'Ulcerative Colitis', 'Inflammatory bowel disease that causes inflammation and ulcers in the colon.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (17, 'Crohn''s Disease', 'Chronic inflammatory bowel disease that affects the lining of the digestive tract.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (18, 'Gout', 'Type of arthritis caused by the buildup of uric acid crystals in joints.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (19, 'Rheumatoid Arthritis', 'Autoimmune disease that causes chronic inflammation in joints.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (20, 'Hepatitis', 'Inflammation of the liver caused by viral infection or other factors.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (21, 'Lung Cancer', 'Type of cancer that starts in the lungs.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (22, 'Breast Cancer', 'Cancer that forms in the cells of the breasts.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (23, 'Prostate Cancer', 'Cancer that develops in the prostate gland in males.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (24, 'Colon Cancer', 'Cancer that forms in the colon or rectum.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (25, 'Leukemia', 'Cancer of the body''s blood-forming tissues.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (26, 'Melanoma', 'Type of skin cancer that develops from pigment-producing cells.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (27, 'Alzheimer''s Disease', 'Progressive neurological disease that affects memory, thinking, and behavior.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (28, 'Parkinson''s Disease', 'Neurodegenerative disorder that affects movement and coordination.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (29, 'Multiple Sclerosis', 'Autoimmune disease that affects the central nervous system.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (30, 'HIV/AIDS', 'Viral infection that attacks the immune system.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (31, 'Ovarian Cancer', 'Cancer that starts in the ovaries.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (32, 'Endometriosis', 'Condition where tissue similar to the lining of the uterus grows outside the uterus.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (33, 'Polycystic Ovary Syndrome (PCOS)', 'Hormonal disorder that affects women of reproductive age.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (34, 'Eczema', 'Chronic skin condition that causes itching, redness, and rash.');
INSERT INTO PUBLIC.ILLNESSES (ID, NAME, DESCRIPTION) VALUES (35, 'Psoriasis', 'Chronic skin condition that causes cells to build up rapidly on the surface of the skin.');


-- Drugs

INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (1, 'Aspirin', 'A common pain reliever and anti-inflammatory drug');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (2, 'Ibuprofen', 'A nonsteroidal anti-inflammatory drug');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (3, 'Paracetamol', 'Used for the treatment of mild-to-moderate pain and fever');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (4, 'Lisinopril', 'Used to treat high blood pressure and heart failure');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (5, 'Metformin', 'Used to treat type 2 diabetes');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (6, 'Loratadine', 'An antihistamine used to treat allergies');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (7, 'Atorvastatin', 'A medication used to lower cholesterol levels');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (8, 'Fluoxetine', 'An antidepressant used to treat major depressive disorder');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (9, 'Levothyroxine', 'Used to treat an underactive thyroid');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (10, 'Simvastatin', 'Used to lower cholesterol and triglycerides');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (11, 'Amoxicillin', 'An antibiotic used to treat a variety of bacterial infections');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (12, 'Azithromycin', 'An antibiotic used to treat a variety of bacterial infections');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (13, 'Cephalexin', 'An antibiotic used to treat bacterial infections');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (14, 'Ciprofloxacin', 'An antibiotic used to treat a variety of bacterial infections');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (15, 'Clarithromycin', 'An antibiotic used to treat a variety of bacterial infections');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (16, 'Doxycycline', 'An antibiotic used to treat a variety of bacterial infections');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (17, 'Levofloxacin', 'An antibiotic used to treat a variety of bacterial infections');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (18, 'Methotrexate', 'Used to treat certain types of cancer, rheumatoid arthritis, and psoriasis');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (19, 'Prednisone', 'Used to treat a variety of conditions, including arthritis and asthma');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (20, 'Gabapentin', 'Used to treat epilepsy, neuropathic pain, and hot flashes');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (21, 'Pregabalin', 'Used to treat epilepsy, neuropathic pain, and generalized anxiety disorder');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (22, 'Diazepam', 'Used to treat anxiety, alcohol withdrawal, and seizures');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (23, 'Lorazepam', 'Used to treat anxiety, insomnia, and seizures');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (24, 'Alprazolam', 'Used to treat anxiety and panic disorders');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (25, 'Fluconazole', 'An antifungal medication used to treat a variety of fungal infections');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (26, 'Terbinafine', 'An antifungal medication used to treat fungal infections of the skin and nails');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (27, 'Amphotericin B', 'An antifungal medication used to treat serious fungal infections');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (28, 'Acyclovir', 'An antiviral medication used to treat herpes and chickenpox');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (29, 'Valacyclovir', 'An antiviral medication used to treat herpes and shingles');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (30, 'Oseltamivir', 'An antiviral medication used to treat influenza');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (31, 'Ritonavir', 'An antiviral medication used to treat HIV');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (32, 'Zidovudine', 'An antiviral medication used to treat HIV');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (33, 'Bupropion', 'An antidepressant used to treat depression and smoking cessation');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (34, 'Venlafaxine', 'An antidepressant used to treat depression and anxiety');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (35, 'Escitalopram', 'An antidepressant used to treat depression and anxiety');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (36, 'Mirtazapine', 'An antidepressant used to treat depression');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (37, 'Quetiapine', 'An atypical antipsychotic used to treat schizophrenia and bipolar disorder');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (38, 'Olanzapine', 'An atypical antipsychotic used to treat schizophrenia and bipolar disorder');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (39, 'Risperidone', 'An atypical antipsychotic used to treat schizophrenia and bipolar disorder');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (40, 'Lithium', 'Used to treat bipolar disorder');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (41, 'Carbamazepine', 'Used to treat epilepsy and bipolar disorder');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (42, 'Phenobarbital', 'Used to treat epilepsy and as a sedative');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (43, 'Haloperidol', 'A typical antipsychotic used to treat schizophrenia and other psychoses');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (44, 'Tramadol', 'A pain medication used to treat moderate to moderately severe pain');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (45, 'Morphine', 'A potent pain medication used to treat severe pain');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (46, 'Codeine', 'A pain medication used to treat mild to moderate pain and cough');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (47, 'Hydrocodone', 'A pain medication used to treat moderate to severe pain');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (48, 'Oxycodone', 'A pain medication used to treat moderate to severe pain');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (49, 'Fentanyl', 'A potent pain medication used to treat severe pain');
INSERT INTO PUBLIC.DRUGS (ID, NAME, DESCRIPTION) VALUES (50, 'Methadone', 'Used to treat severe pain and opioid addiction');



-- Specialities

INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (1, 'Cardiology', 'Deals with heart disorders and circulatory system');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (2, 'Dermatology', 'Deals with skin and hair disorders');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (3, 'Endocrinology', 'Deals with disorders of the endocrine system and hormones');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (4, 'Gastroenterology', 'Deals with digestive system and its disorders');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (5, 'Hematology', 'Deals with blood disorders and their treatment');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (6, 'Infectious Disease', 'Deals with infections caused by bacteria, viruses, fungi, and parasites');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (7, 'Internal Medicine', 'Deals with the prevention, diagnosis, and treatment of adult diseases');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (8, 'Nephrology', 'Deals with the kidneys and their functions');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (9, 'Neurology', 'Deals with the brain and nervous system and their disorders');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (10, 'Obstetrics and Gynecology', 'Deals with the female reproductive system and childbirth');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (11, 'Oncology', 'Deals with the diagnosis and treatment of cancer');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (12, 'Ophthalmology', 'Deals with eye and vision care');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (13, 'Orthopedics', 'Deals with the musculoskeletal system and its disorders');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (14, 'Otolaryngology', 'Deals with the ears, nose, and throat');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (15, 'Pediatrics', 'Deals with the medical care of infants, children, and adolescents');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (16, 'Physical Medicine and Rehabilitation', 'Deals with the treatment of disabilities and injuries');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (17, 'Psychiatry', 'Deals with the diagnosis, treatment, and prevention of mental illness');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (18, 'Pulmonology', 'Deals with the respiratory system and its disorders');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (19, 'Radiology', 'Deals with the use of medical imaging to diagnose and treat diseases');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (20, 'Rheumatology', 'Deals with the diagnosis and treatment of rheumatic diseases');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (21, 'Sports Medicine', 'Deals with physical fitness and the treatment of sports-related injuries');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (22, 'Allergy and Immunology', 'Deals with the diagnosis and treatment of allergies and immune system disorders');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (23, 'Anesthesiology', 'Deals with the administration of anesthesia and pain relief during surgery');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (24, 'Emergency Medicine', 'Deals with medical emergencies and acute care');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (25, 'Family Medicine', 'Deals with the comprehensive medical care of individuals and families');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (26, 'Geriatrics', 'Deals with the medical care of elderly individuals');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (27, 'Infectious Disease', 'Deals with infections caused by bacteria, viruses, fungi, and parasites');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (28, 'Medical Genetics', 'Deals with the diagnosis and management of genetic disorders');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (29, 'Neonatology', 'Deals with the medical care of newborn infants');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (30, 'Pain Management', 'Deals with the management of chronic pain');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (31, 'Pathology', 'Deals with the diagnosis and study of diseases');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (32, 'Physical Therapy', 'Deals with the rehabilitation and management of physical disabilities');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (33, 'Preventive Medicine', 'Deals with the prevention of diseases and promotion of health');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (34, 'Psychology', 'Deals with the scientific study of behavior and mental processes');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (35, 'Sleep Medicine', 'Deals with sleep disorders and their treatment');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (36, 'Surgery', 'Deals with the use of operative techniques to treat injuries, diseases, and deformities');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (37, 'Urology', 'Deals with the urinary tract and male reproductive system');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (38, 'Vascular Medicine', 'Deals with the treatment of disorders of the vascular system');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (39, 'Addiction Medicine', 'Deals with the treatment of addiction and substance abuse disorders');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (40, 'Critical Care Medicine', 'Deals with the treatment of critically ill patients');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (41, 'Dental Medicine', 'Deals with the prevention, diagnosis, and treatment of oral diseases');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (42, 'Diagnostic Radiology', 'Deals with the use of medical imaging to diagnose diseases');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (43, 'Forensic Medicine', 'Deals with the application of medical knowledge to legal cases');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (44, 'Hospital Medicine', 'Deals with the medical care of hospitalized patients');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (45, 'Interventional Radiology', 'Deals with the use of imaging techniques to guide minimally invasive procedures');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (46, 'Medical Oncology', 'Deals with the diagnosis and treatment of cancer using medication and other therapies');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (47, 'Nuclear Medicine', 'Deals with the use of radioactive substances to diagnose and treat diseases');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (48, 'Occupational Medicine', 'Deals with the prevention and management of workplace injuries and illnesses');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (49, 'Palliative Medicine', 'Deals with the relief of pain and other symptoms of serious illnesses');
INSERT INTO PUBLIC.SPECIALITIES (ID, NAME, DESCRIPTION) VALUES (50, 'Reproductive Endocrinology and Infertility', 'Deals with the diagnosis and treatment of fertility disorders');



-- Doctors


INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (1, 'John', 'Doe', '1980-01-01', 'Dr. John Doe has been practicing medicine for over 10 years.', 5, 'johndoe@example.com', '555-1234', '555-5678');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (2, 'Jane', 'Smith', '1975-03-15', 'Dr. Jane Smith specializes in pediatric care and has won several awards for her work.', 10, 'janesmith@example.com', '555-2345', '555-6789');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (3, 'Michael', 'Johnson', '1988-12-31', 'Dr. Michael Johnson is a board-certified surgeon who has performed over 500 successful surgeries.', 20, 'michaeljohnson@example.com', '555-3456', '555-7890');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (4, 'Sarah', 'Lee', '1995-07-12', 'Dr. Sarah Lee is a respected cardiologist who has published several articles in medical journals.', 30, 'sarahlee@example.com', '555-4567', '555-8901');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (5, 'David', 'Kim', '1990-05-28', 'Dr. David Kim is a skilled dermatologist who has treated patients with a wide range of skin conditions.', 40, 'davidkim@example.com', '555-5678', '555-9012');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (6, 'John', 'Doe', '1980-01-01', 'Dr. John Doe has been practicing medicine for over 10 years.', 5, 'johndoe@example.com', '555-1234', '555-5678');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (7, 'Jane', 'Smith', '1975-03-15', 'Dr. Jane Smith specializes in pediatric care and has won several awards for her work.', 10, 'janesmith@example.com', '555-2345', '555-6789');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (8, 'Michael', 'Johnson', '1988-12-31', 'Dr. Michael Johnson is a board-certified surgeon who has performed over 500 successful surgeries.', 20, 'michaeljohnson@example.com', '555-3456', '555-7890');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (9, 'Sarah', 'Lee', '1995-07-12', 'Dr. Sarah Lee is a respected cardiologist who has published several articles in medical journals.', 30, 'sarahlee@example.com', '555-4567', '555-8901');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (10, 'David', 'Kim', '1990-05-28', 'Dr. David Kim is a skilled dermatologist who has treated patients with a wide range of skin conditions.', 40, 'davidkim@example.com', '555-5678', '555-9012');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (11, 'Emily', 'Nguyen', '1985-09-17', 'Dr. Emily Nguyen is a skilled pediatrician with a passion for providing comprehensive care to children of all ages.', 50, 'emilynguyen@example.com', '555-6789', '555-0123');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (12, 'Jason', 'Chen', '1982-03-05', 'Dr. Jason Chen is an experienced orthopedic surgeon specializing in sports injuries and joint replacements.', 10, 'jasonchen@example.com', '555-7890', '555-2345');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (13, 'Rachel', 'Wang', '1989-11-22', 'Dr. Rachel Wang is a dedicated obstetrician-gynecologist who has helped countless women with their reproductive health needs.', 34, 'rachelwang@example.com', '555-8901', '555-3456');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (14, 'Steven', 'Liu', '1996-04-03', 'Dr. Steven Liu is a knowledgeable neurologist who specializes in diagnosing and treating disorders of the nervous system.', 23, 'stevenliu@example.com', '555-9012', '555-4567');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (15, 'Jennifer', 'Garcia', '1993-08-10', 'Dr. Jennifer Garcia is a compassionate psychiatrist who provides comprehensive mental health care to her patients.', 45, 'jennifergarcia@example.com', '555-0123', '555-5678');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (16, 'Michael', 'Lopez', '1987-12-14', 'Dr. Michael Lopez is a skilled cardiologist with a focus on preventive cardiology and heart disease management.', 15, 'michaellopez@example.com', '555-2345', '555-6789');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (17, 'Emily', 'Johnson', '1984-05-18', 'Dr. Emily Johnson is a compassionate family physician who believes in building long-term relationships with her patients.', 24, 'emilyjohnson@example.com', '555-3456', '555-7890');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (18, 'Daniel', 'Lee', '1990-09-25', 'Dr. Daniel Lee is a dedicated oncologist who specializes in the diagnosis and treatment of various forms of cancer.', 43, 'daniellee@example.com', '555-4567', '555-8901');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (19, 'Sophia', 'Harris', '1988-02-11', 'Dr. Sophia Harris is an experienced dermatologist who provides comprehensive skincare services and specializes in skin cancer detection.', 13, 'sophiaharris@example.com', '555-5678', '555-9012');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (20, 'David', 'Martin', '1995-07-07', 'Dr. David Martin is a knowledgeable gastroenterologist who specializes in the diagnosis and treatment of digestive system disorders.', 15, 'davidmartin@example.com', '555-6789', '555-0123');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (21, 'Olivia', 'Lewis', '1973-03-02', 'Dr. Olivia Lewis is a reproductive endocrinologist who has helped numerous couples conceive through in vitro fertilization.', 11, 'olivialewis@example.com', '555-6789', '555-3456');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (22, 'Anthony', 'Harris', '1980-09-15', 'Dr. Anthony Harris is an orthopedic surgeon who has developed new surgical techniques for joint replacement.', 12, 'anthonyharris@example.com', '555-7890', '555-456');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (23, 'Natalie', 'Chen', '1992-02-28', 'Dr. Natalie Chen is a skilled ophthalmologist who has performed numerous successful eye surgeries.', 13, 'nataliechen@example.com', '555-5678', '555-9012');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (24, 'Kevin', 'Ng', '1981-11-05', 'Dr. Kevin Ng is a respected cardiologist who has developed new treatments for heart disease.', 14, 'kevinng@example.com', '555-6789', '555-0123');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (25, 'Michelle', 'Wong', '1988-08-18', 'Dr. Michelle Wong is an infectious disease specialist who has conducted groundbreaking research on the prevention of HIV transmission.', 15, 'michellewong@example.com', '555-7890', '555-2345');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (26, 'Christopher', 'Liu', '1976-05-11', 'Dr. Christopher Liu is a gastroenterologist who has developed new treatments for inflammatory bowel disease.', 16, 'christopherliu@example.com', '555-9012', '555-3456');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (27, 'Erica', 'Chang', '1994-12-30', 'Dr. Erica Chang is a skilled surgeon who has performed numerous successful operations on patients with complex medical conditions.', 17, 'ericachang@example.com', '555-0123', '555-4567');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (28, 'David', 'Gupta', '1979-09-02', 'Dr. David Gupta is a psychiatrist who specializes in the treatment of mood disorders such as depression and bipolar disorder.', 18, 'davidgupta@example.com', '555-1234', '555-6756');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (29, 'Karen', 'Singh', '1983-06-22', 'Dr. Karen Singh is an obstetrician-gynecologist who has delivered over 1000 babies throughout her career.', 19, 'karensingh@example.com', '555-2345', '555-6789');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (30, 'Jason', 'Shah', '1990-03-14', 'Dr. Jason Shah is a neurologist who has developed new treatments for epilepsy.', 20, 'jasonshah@example.com', '555-3456', '555-7890');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (31, 'Linda', 'Tran', '1975-10-17', 'Dr. Linda Tran is an experienced family medicine practitioner who has worked in community health clinics throughout her career.', 21, 'lindatran@example.com', '555-4567', '555-9012');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (32, 'Michael', 'Gomez', '1986-07-07', 'Dr. Michael Gomez is a pulmonologist who has conducted research on the relationship between air pollution and asthma.', 22, 'michaelgomez@example.com', '555-5678', '555-0123');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (33, 'Samantha', 'Park', '1981-04-29', 'Dr. Samantha Park is an emergency medicine physician who has worked in several major trauma centers.', 23, 'samanthapark@example.com', '555-6789', '555-2345');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (34, 'Matthew', 'Hernandez', '1989-01-15', 'Dr. Matthew Hernandez is a rheumatologist who has developed new treatments for autoimmune diseases.', 24, 'matthewhernandez@example.com', '555-7890', '555-3456');
INSERT INTO PUBLIC.DOCTORS (ID, NAME, SURNAME, DOB, ABOUT, SPECIALITY_ID, EMAIL, PHONE1, PHONE2) VALUES (35, 'John', 'Snow', '1992-02-28', 'Dr. Snow is a great doctor who has performed more than 100 surgeries.', 13, 'johnsnow@gmail.com', '555-1213', '444-1214');



-- Patients
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (1, 'Anna', 'Avetisyan', '1990-06-15', 'anna.avetisyan@example.com', '+374987654321', '+374955555555');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (2, 'Karen', 'Harutyunyan', '1985-02-10', 'karen.harutyunyan@example.com', '+374912345678', '+374944444444');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (3, 'Lilit', 'Mkrtchyan', '1978-11-25', 'lilit.mkrtchyan@example.com', '+374931234567', '+374933333333');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (4, 'Armen', 'Sargsyan', '1995-09-05', 'armen.sargsyan@example.com', '+374977777777', '+374988888888');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (5, 'Naira', 'Hakobyan', '1982-04-30', 'naira.hakobyan@example.com', '+374943210987', '+374911111111');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (6, 'Vardan', 'Grigoryan', '1976-07-20', 'vardan.grigoryan@example.com', '+374944567890', '+374922222222');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (7, 'Mariam', 'Mikayelyan', '2000-01-12', 'mariam.mikayelyan@example.com', '+374950987654', '+374933333333');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (8, 'Hovhannes', 'Martirosyan', '1965-03-08', 'hovhannes.martirosyan@example.com', '+374988765432', '+374944444444');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (9, 'Sona', 'Vardanyan', '1988-12-18', 'sona.vardanyan@example.com', '+374990987654', '+374911111111');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (10, 'Gevorg', 'Petrosyan', '1993-06-25', 'gevorg.petrosyan@example.com', '+374996543210', '+374922222222');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (11, 'Ani', 'Ghazaryan', '1970-09-02', 'ani.ghazaryan@example.com', '+374991234567', '+374933333333');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (12, 'Levon', 'Simonyan', '1981-11-15', 'levon.simonyan@example.com', '+374992345678', '+374944444444');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (13, 'Varduhi', 'Hovhannisyan', '1998-05-20', 'varduhi.hovhannisyan@example.com', '+374997654321', '+374955555555');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (14, 'Tigran', 'Asatryan', '1974-03-10', 'tigran.asatryan@example.com', '+374998765432', '+374966666666');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (15, 'Hayk', 'Gasparyan', '1987-07-12', 'hayk.gasparyan@example.com', '+374997654321', '+374966666666');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (16, 'Marine', 'Sargsyan', '1992-04-05', 'marine.sargsyan@example.com', '+374992345678', '+374933333333');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (17, 'Artur', 'Avagyan', '2005-02-18', 'artur.avagyan@example.com', '+374995432109', '+374922222222');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (18, 'Narek', 'Arakelyan', '1973-12-30', 'narek.arakelyan@example.com', '+374998765432', '+374955555555');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (19, 'Anahit', 'Gevorgyan', '1980-09-28', 'anahit.gevorgyan@example.com', '+374999876543', '+374944444444');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (20, 'Gohar', 'Harutyunyan', '1968-06-15', 'gohar.harutyunyan@example.com', '+374990987654', '+374911111111');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (21, 'Ruben', 'Asryan', '1996-11-20', 'ruben.asryan@example.com', '+374997654321', '+374966666666');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (22, 'Arevik', 'Vardanyan', '1983-03-05', 'arevik.vardanyan@example.com', '+374998765432', '+374922222222');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (23, 'Vahe', 'Hovhannisyan', '1977-08-10', 'vahe.hovhannisyan@example.com', '+374999876543', '+374933333333');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (24, 'Rita', 'Simonyan', '2002-06-25', 'rita.simonyan@example.com', '+374995432109', '+374944444444');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (25, 'Gor', 'Ghazaryan', '1988-04-12', 'gor.ghazaryan@example.com', '+374997654321', '+374955555555');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (26, 'Anush', 'Melkonyan', '1975-01-15', 'anush.melkonyan@example.com', '+374998765432', '+374966666666');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (27, 'Lusine', 'Petrosyan', '1999-09-20', 'lusine.petrosyan@example.com', '+374999876543', '+374911111111');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (28, 'Vigen', 'Mkrtchyan', '1991-07-08', 'vigen.mkrtchyan@example.com', '+374995432109', '+374922222222');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (29, 'Rafik', 'Vardazaryan', '1986-03-05', 'rafik.vardazaryan@example.com', '+374997654321', '+374933333333');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (30, 'Emma', 'Harutyunyan', '1979-11-18', 'emma.harutyunyan@example.com', '+374998765432', '+374944444444');
INSERT INTO PUBLIC.PATIENTS (ID, NAME, SURNAME, DOB, EMAIL, PHONE1, PHONE2) VALUES (31, 'Samvel', 'Asatryan', '2001-05-20', 'samvel.asatryan@example.com', '+374999876543', '+374955555555');



-- Records

INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (1, 1, 1, 2, '2023-04-24');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (2, 2, 2, 3, '2023-04-23');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (3, 3, 3, 4, '2023-04-22');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (4, 4, 4, 5, '2023-04-21');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (5, 5, 5, 6, '2023-04-20');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (6, 6, 6, 7, '2023-04-19');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (7, 7, 7, 8, '2023-04-18');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (8, 8, 8, 9, '2023-04-17');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (9, 9, 9, 10, '2023-04-16');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (10, 10, 10, 11, '2023-04-15');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (11, 11, 11, 12, '2023-04-14');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (12, 12, 12, 13, '2023-04-13');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (13, 13, 13, 14, '2023-04-12');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (14, 14, 14, 15, '2023-04-11');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (15, 15, 15, 16, '2023-04-10');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (16, 16, 16, 17, '2023-04-09');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (17, 17, 17, 18, '2023-04-08');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (18, 18, 18, 19, '2023-04-07');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (19, 19, 19, 20, '2023-04-06');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (20, 20, 20, 21, '2023-04-05');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (21, 21, 21, 22, '2023-04-04');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (22, 22, 22, 23, '2023-04-03');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (23, 23, 23, 24, '2023-04-02');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (24, 24, 24, 25, '2023-04-01');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (25, 25, 25, 26, '2023-03-31');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (26, 26, 26, 27, '2023-03-30');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (27, 27, 27, 28, '2023-03-29');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (28, 28, 28, 29, '2023-03-28');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (29, 29, 29, 30, '2023-03-27');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (30, 30, 30, 31, '2023-03-26');
INSERT INTO PUBLIC.RECORDS (ID, PATIENT_ID, DOCTOR_ID, HOSPITAL_ID, DATE) VALUES (31, 31, 31, 32, '2023-03-25');


-- Records_Drugs

INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (1, 7);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (1, 9);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (1, 14);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (1, 16);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (1, 20);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (2, 3);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (2, 6);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (2, 11);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (2, 12);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (2, 17);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (3, 2);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (3, 8);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (3, 13);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (3, 18);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (3, 25);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (4, 1);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (4, 5);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (4, 9);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (4, 14);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (4, 19);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (5, 4);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (5, 10);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (5, 15);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (5, 21);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (5, 30);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (6, 3);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (6, 7);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (6, 12);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (6, 18);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (6, 27);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (7, 2);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (7, 5);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (7, 8);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (7, 14);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (7, 23);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (8, 1);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (8, 11);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (8, 13);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (8, 16);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (8, 28);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (9, 6);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (9, 10);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (9, 17);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (9, 22);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (9, 34);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (10, 2);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (10, 9);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (10, 12);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (10, 19);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (10, 29);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (11, 1);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (11, 7);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (11, 15);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (11, 21);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (11, 38);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (12, 3);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (12, 8);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (12, 13);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (12, 17);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (12, 33);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (13, 2);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (13, 6);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (13, 11);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (13, 16);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (13, 24);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (14, 1);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (14, 4);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (14, 14);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (14, 18);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (14, 31);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (15, 3);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (15, 7);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (15, 12);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (15, 19);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (15, 32);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (16, 2);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (16, 5);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (16, 8);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (16, 14);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (16, 26);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (17, 1);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (17, 6);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (17, 15);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (17, 21);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (17, 39);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (18, 4);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (18, 9);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (18, 16);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (18, 18);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (18, 36);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (19, 2);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (19, 7);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (19, 11);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (19, 14);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (19, 35);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (20, 1);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (20, 8);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (20, 13);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (20, 19);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (20, 37);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (21, 3);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (21, 6);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (21, 12);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (21, 16);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (21, 30);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (22, 2);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (22, 5);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (22, 9);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (22, 14);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (22, 22);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (23, 1);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (23, 7);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (23, 15);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (23, 21);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (23, 40);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (24, 3);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (24, 8);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (24, 13);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (24, 17);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (24, 29);
INSERT INTO PUBLIC.RECORDS_DRUGS (RECORD_ID, DRUG_ID) VALUES (25, 2);


-- Records_Illnesses

INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (1, 1);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (2, 2);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (3, 3);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (4, 4);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (5, 5);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (6, 6);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (7, 7);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (8, 8);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (9, 9);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (10, 10);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (11, 11);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (12, 12);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (13, 13);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (14, 14);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (15, 15);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (16, 16);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (17, 17);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (18, 18);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (19, 19);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (20, 20);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (21, 21);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (22, 22);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (23, 23);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (24, 24);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (25, 25);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (26, 26);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (27, 27);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (28, 28);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (29, 29);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (30, 30);
INSERT INTO PUBLIC.RECORDS_ILLNESSES (RECORD_ID, ILLNESS_ID) VALUES (31, 31);



-- Doctors_Hospitals

INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (7, 9, '2022-02-11');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (29, 30, '2022-01-29');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (1, 3, '2022-02-05');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (16, 17, '2022-01-16');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (35, 2, '2022-02-04');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (31, 32, '2022-01-31');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (3, 5, '2022-02-07');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (27, 28, '2022-01-27');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (13, 14, '2022-01-13');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (24, 25, '2022-01-24');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (20, 21, '2022-01-20');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (15, 16, '2022-01-15');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (28, 29, '2022-01-28');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (21, 22, '2022-01-21');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (22, 23, '2022-01-22');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (9, 10, '2022-01-09');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (17, 18, '2022-01-17');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (11, 13, '2022-02-15');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (5, 7, '2022-02-09');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (9, 11, '2022-02-13');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (18, 19, '2022-01-18');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (32, 33, '2022-02-01');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (34, 35, '2022-02-03');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (11, 12, '2022-01-11');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (33, 34, '2022-02-02');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (26, 27, '2022-01-26');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (12, 14, '2022-02-16');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (30, 31, '2022-01-30');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (23, 24, '2022-01-23');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (12, 13, '2022-01-12');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (5, 6, '2022-01-05');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (19, 20, '2022-01-19');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (14, 15, '2022-01-14');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (25, 26, '2022-01-25');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (6, 7, '2022-01-06');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (8, 9, '2022-01-08');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (3, 4, '2022-01-03');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (4, 6, '2022-02-08');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (7, 8, '2022-01-07');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (8, 10, '2022-02-12');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (2, 4, '2022-02-06');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (10, 12, '2022-02-14');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (2, 3, '2022-01-02');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (13, 15, '2022-02-17');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (14, 16, '2022-02-18');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (6, 8, '2022-02-10');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (20, 22, '2022-02-01');
INSERT INTO PUBLIC.DOCTORS_HOSPITALS (DOCTOR_ID, HOSPITAL_ID, JOIN_DATE) VALUES (4, 5, '2022-01-04');



-- general info about a hospital

SELECT H.ID, H.NAME, Z.CODE AS ZIP_CODE, C.NAME, PHONE, EMAIL FROM HOSPITALS H
INNER JOIN ZIPS Z ON H.ZIP_CODE = Z.CODE
INNER JOIN CITIES C ON Z.CITY_ID = C.ID
WHERE H.ID = ?;


-- general info about a doctor

SELECT D.ID, D.NAME, D.SURNAME, D.DOB, S.NAME, D.EMAIL, D.PHONE1, D.PHONE2, D.ABOUT FROM DOCTORS D
INNER JOIN SPECIALITIES S ON D.SPECIALITY_ID = S.ID
WHERE D.ID = ?;


-- general info about a patient

SELECT * FROM PATIENTS
WHERE ID = ?;


-- which hospitals does a doctor work at

WITH DoctorInfo AS (
    SELECT H.NAME, H.EMAIL, H.PHONE, D.ID, D.NAME, D.SURNAME, D.DOB, D.ABOUT, S.NAME AS SPECIALITY_NAME, D.EMAIL AS DOCTOR_EMAIL, D.PHONE1, D.PHONE2
    FROM DOCTORS D
    INNER JOIN DOCTORS_HOSPITALS DH ON D.ID = DH.DOCTOR_ID
    INNER JOIN HOSPITALS H ON DH.HOSPITAL_ID = H.ID
    INNER JOIN SPECIALITIES S ON D.SPECIALITY_ID = S.ID
    WHERE D.ID = ?
)

SELECT *
FROM DoctorInfo
ORDER BY SURNAME ASC;


-- records by a patient

SELECT R.ID, R.DATE, P.ID, P.NAME, P.SURNAME, D.NAME, D.SURNAME, H.NAME, I.NAME, D2.NAME FROM PATIENTS P
INNER JOIN RECORDS R ON P.ID = R.PATIENT_ID
INNER JOIN DOCTORS D ON R.DOCTOR_ID = D.ID
INNER JOIN SPECIALITIES S ON D.SPECIALITY_ID = S.ID
INNER JOIN HOSPITALS H ON R.HOSPITAL_ID = H.ID
INNER JOIN RECORDS_DRUGS RD ON R.ID = RD.RECORD_ID
INNER JOIN DRUGS D2 ON RD.DRUG_ID = D2.ID
INNER JOIN RECORDS_ILLNESSES RI ON R.ID = RI.RECORD_ID
INNER JOIN ILLNESSES I ON RI.ILLNESS_ID = I.ID
WHERE P.ID = ?;


-- records by a hospital

SELECT R.ID, R.DATE, P.ID, P.NAME, P.SURNAME, D.NAME, D.SURNAME, H.NAME, I.NAME, D2.NAME FROM PATIENTS P
INNER JOIN RECORDS R ON P.ID = R.PATIENT_ID
INNER JOIN DOCTORS D ON R.DOCTOR_ID = D.ID
INNER JOIN SPECIALITIES S ON D.SPECIALITY_ID = S.ID
INNER JOIN HOSPITALS H ON R.HOSPITAL_ID = H.ID
INNER JOIN RECORDS_DRUGS RD ON R.ID = RD.RECORD_ID
INNER JOIN DRUGS D2 ON RD.DRUG_ID = D2.ID
INNER JOIN RECORDS_ILLNESSES RI ON R.ID = RI.RECORD_ID
INNER JOIN ILLNESSES I ON RI.ILLNESS_ID = I.ID
WHERE H.ID = ?;


-- record number by hospitals

SELECT H.ID, COUNT(R.ID) FROM HOSPITALS H
INNER JOIN RECORDS R ON H.ID = R.HOSPITAL_ID
GROUP BY H.ID;


-- number of hospitals in each city

SELECT C.NAME, COUNT(H.ID) FROM HOSPITALS H
INNER JOIN ZIPS Z ON H.ZIP_CODE = Z.CODE
INNER JOIN CITIES C ON Z.CITY_ID = C.ID
GROUP BY C.ID;


-- illnesses of a patient and when have they been discovered

SELECT P.NAME, P.SURNAME, I.NAME, R.DATE FROM PATIENTS P
INNER JOIN RECORDS R ON P.ID = R.PATIENT_ID
INNER JOIN RECORDS_ILLNESSES RI ON R.ID = RI.RECORD_ID
INNER JOIN ILLNESSES I ON RI.ILLNESS_ID = I.ID
WHERE P.ID = ?;


-- drugs prescribed to a patient by the patient id

SELECT P.NAME, P.SURNAME, D.NAME, R.DATE FROM PATIENTS P
INNER JOIN RECORDS R ON P.ID = R.PATIENT_ID
INNER JOIN RECORDS_DRUGS RD ON R.ID = RD.RECORD_ID
INNER JOIN DRUGS D ON RD.DRUG_ID = D.ID
WHERE P.ID = ?;


-- number of prescribed drugs by a doctor(regardless of whether they have associated records)

SELECT D.NAME, D.SURNAME, COUNT(D2.ID)
FROM DOCTORS D
LEFT OUTER JOIN RECORDS R ON D.ID = R.DOCTOR_ID
INNER JOIN RECORDS_DRUGS RD ON R.ID = RD.RECORD_ID
INNER JOIN DRUGS D2 ON RD.DRUG_ID = D2.ID
WHERE D.ID = ?
GROUP BY D.ID, D.NAME, D.SURNAME;


-- see the specialities that no doctor has

SELECT S.NAME FROM SPECIALITIES S
LEFT OUTER JOIN DOCTORS D ON S.ID = D.SPECIALITY_ID
WHERE D.ID IS NULL;


-- find 5 most common illness among patients

SELECT I.NAME, COUNT(*) AS COUNT
FROM ILLNESSES I
INNER JOIN RECORDS_ILLNESSES RI ON I.ID = RI.ILLNESS_ID
GROUP BY I.ID
ORDER BY COUNT DESC
LIMIT 5;


-- retrieve the top 5 hospitals with the highest number of records

SELECT H.NAME, COUNT(*) AS RECORD_COUNT
FROM HOSPITALS H
INNER JOIN RECORDS R ON H.ID = R.HOSPITAL_ID
GROUP BY H.ID
ORDER BY RECORD_COUNT DESC
LIMIT 5;


-- retrieve records related to a specific patient, including illnesses, medications, doctors, and hospitals.

CREATE MATERIALIZED VIEW IF NOT EXISTS records_by_patient_info AS
SELECT R.ID AS RECORD_ID, R.DATE, P.ID AS PATIENT_ID, P.NAME AS PATIENT_NAME, P.SURNAME AS PATIENT_SURNAME,
       D.NAME AS DOCTOR_NAME, D.SURNAME AS DOCTOR_SURNAME, H.NAME AS HOSPITAL_NAME,
       I.NAME AS ILLNESS_NAME, D2.NAME AS DRUG_NAME
FROM PATIENTS P
INNER JOIN RECORDS R ON P.ID = R.PATIENT_ID
INNER JOIN DOCTORS D ON R.DOCTOR_ID = D.ID
INNER JOIN SPECIALITIES S ON D.SPECIALITY_ID = S.ID
INNER JOIN HOSPITALS H ON R.HOSPITAL_ID = H.ID
INNER JOIN RECORDS_DRUGS RD ON R.ID = RD.RECORD_ID
INNER JOIN DRUGS D2 ON RD.DRUG_ID = D2.ID
INNER JOIN RECORDS_ILLNESSES RI ON R.ID = RI.RECORD_ID
INNER JOIN ILLNESSES I ON RI.ILLNESS_ID = I.ID;

SELECT *
FROM records_by_patient_info
WHERE PATIENT_ID = ?;


-- This query retrieves the number of records associated with each hospital.

WITH hospital_record_count AS (
    SELECT H.ID, COUNT(R.ID) AS record_count
    FROM HOSPITALS H
    INNER JOIN RECORDS R ON H.ID = R.HOSPITAL_ID
    GROUP BY H.ID
)
SELECT H.ID, H.NAME, hospital_record_count.record_count
FROM HOSPITALS H
INNER JOIN hospital_record_count ON H.ID = hospital_record_count.ID;


