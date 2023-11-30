DROP DATABASE IF EXISTS MYDEGREE;
CREATE DATABASE MYDEGREE;
USE MYDEGREE;

CREATE TABLE ADVISOR(
    ADVISOR_ID INTEGER PRIMARY KEY,
    ADVISOR_LNAME VARCHAR(20) NOT NULL,
    ADVISOR_FNAME VARCHAR(20) NOT NULL,
    ADVISOR_OFFICE_NUM INTEGER,
    ADVISOR_PHONE CHAR(12) NOT NULL,
    ADVISOR_EMAIL VARCHAR(50) NOT NULL,
    ADVISOR_BACKGROUND VARCHAR(255)
);

CREATE TABLE MAJOR(
    MJR_ID  INTEGER PRIMARY KEY,
    MJR_NAME VARCHAR(50) NOT NULL,
    MJR_DESC    VARCHAR(700),
    ADMIN_REQ   VARCHAR(500) NOT NULL,
    MJR_PIC varchar(255),
    ADVISOR_ID  INTEGER NOT NULL,
    CONSTRAINT MAJOR_ADVISOR_ID_FK FOREIGN KEY (ADVISOR_ID) REFERENCES ADVISOR(ADVISOR_ID)
);

CREATE TABLE APPOINTMENT(
    APPT_ID INTEGER AUTO_INCREMENT,
    ADVISOR_ID INTEGER NOT NULL,
    APPT_START_DATE_TIME DATETIME NOT NULL,
    APPT_END_DATE_TIME DATETIME AS (TIMESTAMPADD(HOUR,1, APPT_START_DATE_TIME)),
    APPT_CONFIRMATION_FLG CHAR(1) DEFAULT 'N' NOT NULL,
    APPT_RESCHEDULE_FLG CHAR(1) DEFAULT 'N' NOT NULL,
    APPT_REASON VARCHAR(255) NOT NULL,
    STUDENT_GID VARCHAR(9) NOT NULL,
    STUDENT_FNAME VARCHAR(20) NOT NULL,
    STUDENT_LNAME VARCHAR(20) NOT NULL,
    STUDENT_PHONE CHAR(12) NOT NULL,
    STUDENT_EMAIL VARCHAR(50) NOT NULL,
    PRIMARY KEY(APPT_ID),
    CONSTRAINT APPOINTMENT_ADVISOR_ID_FK FOREIGN KEY (ADVISOR_ID) REFERENCES ADVISOR(ADVISOR_ID)
);


CREATE TABLE CLASS(
    CLASS_ID INTEGER PRIMARY KEY,
    CLASS_GROUP CHAR(3) NOT NULL,
    CLASS_NAME VARCHAR(255) NOT NULL,
    CLASS_CREDITS INTEGER DEFAULT 4,
    CLASS_DESC VARCHAR(700),
    TEXTBK_LINK VARCHAR(255),
    -- ELECTIVE_FLG CHAR(1) DEFAULT 'N',
    -- CORE_CLASS_FLG CHAR(1) DEFAULT 'N',
    CLASS_PREREQ_FLG CHAR(1) DEFAULT 'N',
    CLASS_PREREQ VARCHAR(25)
);


CREATE TABLE BRIDGE(
    MJR_ID INTEGER NOT NULL,
    CLASS_ID INTEGER NOT NULL,
    CORE_CLASS_FLG CHAR(1) DEFAULT 'N',
    ELECTIVE_FLG CHAR(1) DEFAULT 'N',
    TRACK_CLASS_FLG CHAR(1) DEFAULT 'N',
    TRACK_CLASS_NUM INTEGER,
    PRIMARY KEY(MJR_ID, CLASS_ID),
    FOREIGN KEY (MJR_ID) REFERENCES MAJOR(MJR_ID),
    FOREIGN KEY (CLASS_ID) REFERENCES CLASS(CLASS_ID)
);


CREATE TABLE PROFESSOR(
    PROF_ID INTEGER PRIMARY KEY,
    PROF_FNAME VARCHAR(20) NOT NULL,
    PROF_LNAME VARCHAR(30) NOT NULL,
    PROF_OFFICE_NUM INTEGER UNIQUE,
    PROF_PHONE CHAR(12) NOT NULL,
    PROF_EMAIL VARCHAR(50) NOT NULL,
    PROF_BACKGROUND VARCHAR(1000),
    PROF_RATING DECIMAL(2,1), 
    PROF_RATING_LINK VARCHAR(255)
);

CREATE TABLE SECTION(
    CRN INTEGER PRIMARY KEY,
    CLASS_ID INTEGER NOT NULL,
    PROF_ID INTEGER NOT NULL,
    SECTION_TIME DATETIME NOT NULL,
    SECTION_SEMESTER char(3) NOT NULL,
    FOREIGN KEY (CLASS_ID) REFERENCES CLASS(CLASS_ID),
    FOREIGN KEY (PROF_ID) REFERENCES PROFESSOR(PROF_ID)
);


-- ADVISOR values --
INSERT INTO ADVISOR VALUES(1, "Smith", "Kate", 203, "248-543-2354", "katesmith@school.edu", NULL);
INSERT INTO ADVISOR VALUES(2, "Woodz", "Will", 143, "248-543-9008", "willwoodz@school.edu", NULL);
INSERT INTO ADVISOR VALUES(4, "Kim", "Michael", 654, "248-655-9876", "kimmichael@school.edu",NUll);
INSERT INTO ADVISOR VALUES(3, "Harry", "Charles", 980, "586-112-2467", "charlesharry@school.edu", NULL);
INSERT INTO ADVISOR VALUES(5, "Farmer", "Jasmine", 434, "313-676-2282", "jasminefarmer@school.edu", NULL);

-- MAJOR values --
INSERT INTO MAJOR VALUES(1,"Computer Science", "A Computer Science major equips students with a comprehensive understanding of foundational principles in computing. Focused on algorithmic problem-solving, software development, and system design, the curriculum covers programming languages, data structures, and computer architecture. Students delve into areas such as artificial intelligence, machine learning, and cybersecurity, gaining versatile skills applicable across industries", "major standing", "pictures\\csMajor.png", 3);
INSERT INTO MAJOR VALUES(2,"Computer Engineering", "A major in Computer Engineering is designed to provide students with a comprehensive understanding of the principles and practices underlying the design and development of computer systems and networks. It combines elements of both electrical engineering and computer science to prepare students for careers at the intersection of hardware and software.", "Each candidate for an Oakland University baccalaureate will need to satisfactorily complete approved courses in each of the following areas: Foundation, Exploration, Integration, Writing, U.S. Diversity, and Capstone. GPA requirements vary, often considering overall GPA of 2.5, core course GPA, and prerequisites. For details, refer to the General Education section of the catalog", "pictures\\ceMajor.png", 5);
INSERT INTO MAJOR VALUES(3,"Cybersecurity", "A cybersecurity major equips students with vital skills to defend digital systems against evolving cyber threats. Covering network security, threat analysis, and attack prevention, the program delves into crafting and implementing information security policies. Students learn cryptography, incident response, and ethical hacking techniques. The curriculum emphasizes risk management, compliance, and security awareness. Culminating in capstone projects and often incorporating internships, the major readies graduates for roles such as cybersecurity analysts and ethical hackers in our dynamic digital landscape.", "Each candidate for an Oakland University baccalaureate will need to satisfactorily complete approved courses in each of the following areas: Foundation, Exploration, Integration, Writing, U.S. Diversity, and Capstone. GPA requirements vary, often considering overall GPA of 2.5, core course GPA, and prerequisites. For details, refer to the General Education section of the catalog", "pictures\\cybersecurityMajor.png", 4);
INSERT INTO MAJOR VALUES(4,"Artificial Intelligence", "Artificial Intelligence (AI) typically focuses on providing students with a deep understanding of the theories, methodologies, and practical applications of AI technologies. This interdisciplinary field integrates principles from computer science, mathematics, cognitive science, and engineering to create intelligent systems that can analyze data, learn from it, and make informed decisions.", "General Education requirements for an artificial intelligence major usually include courses in mathematics, computer science fundamentals, communication skills, natural sciences, social sciences, humanities, cultural diversity, arts, and statistics. GPA requirements vary, often considering overall GPA of 2.5, core course GPA, and prerequisites. Check university guidelines, and if necessary, consult advisors to enhance your application.", "pictures\\aiMajor.png", 1);
INSERT INTO MAJOR VALUES(5,"Information Technology", "An Information Technology (IT) major provides students with a versatile skill set for navigating the rapidly evolving tech landscape. Focused on the practical application of technology in various domains, the curriculum covers areas such as computer systems, networks, databases, and programming. Students learn to analyze and solve complex problems, manage IT projects, and implement innovative solutions. Emphasis is placed on acquiring proficiency in programming languages, understanding system architectures, and developing skills in network administration.", "Each candidate for an Oakland University baccalaureate will need to satisfactorily complete approved courses in each of the following areas: Foundation, Exploration, Integration, Writing, U.S. Diversity, and Capstone. GPA requirements vary, often considering overall GPA of 2.5, core course GPA, and prerequisites. For details, refer to the General Education section of the catalog.", "pictures\\itMajor.png", 2);

-- CLASS values --


INSERT INTO `class` (`CLASS_ID`, `CLASS_GROUP`, `CLASS_NAME`, `CLASS_CREDITS`, `CLASS_DESC`, `TEXTBK_LINK`, `CLASS_PREREQ_FLG`, `CLASS_PREREQ`) VALUES
(1200, 'EGR', 'Engineering Graphics and CAD', 1, NULL, NULL, 'N', NULL),
(1210, 'CSI', 'Problem Solving Using VBA and Excel', 4, 'NULL', NULL, 'N', NULL),
(1320, 'CSI', 'Introduction to Python Programming and Unix', 4, NULL, NULL, 'N', NULL),
(1400, 'EGR', 'Computer Problem Solving in Engineering and Computer Science', 4, NULL, NULL, 'N', NULL),
(1420, 'CSI', 'Introduction to C Programming and Unix', 4, NULL, NULL, 'N', NULL),
(1440, 'CHM', 'General Chemistry I', 4, NULL, NULL, 'N', NULL),
(1554, 'MTH', 'Calculus I', 4, NULL, NULL, 'N', NULL),
(1555, 'MTH', 'Calculus II', 4, NULL, NULL, 'N', NULL),
(1610, 'PHY', 'Fundamentals of Physics I', 4, NULL, NULL, 'N', NULL),
(1620, 'PHY', 'Fundamentals of Physics II', 4, NULL, NULL, 'N', NULL),
(1663, 'APM', 'Mathematics for Information Technology', 4, 'NULL', NULL, 'N', NULL),
(2005, 'ECE', 'Electric Circuits', 4, NULL, NULL, 'N', NULL),
(2221, 'STA', 'Introduction to Statistical Methods ', 4, 'NULL', NULL, 'N', NULL),
(2226, 'STA', 'Applied Probability and Statistics', 4, NULL, NULL, 'N', NULL),
(2290, 'CSI', 'Introduction to Data Structures in C', 4, NULL, NULL, 'N', NULL),
(2300, 'CSI', 'Object-Oriented Computing', 4, NULL, NULL, 'N', NULL),
(2310, 'CSI', 'Data Structures', 4, NULL, NULL, 'N', NULL),
(2320, 'CSI', 'C++ for Programmers', 2, NULL, NULL, 'N', NULL),
(2330, 'CSI', 'Immersive Python', 2, NULL, NULL, 'N', NULL),
(2340, 'CSI', 'Ruby for Web Developers', 2, NULL, NULL, 'N', NULL),
(2350, 'CSI', 'Programming in Visual C# for .NET Technology', 2, NULL, NULL, 'N', NULL),
(2400, 'EGR', 'Introduction to Electrical and Computer Engineering', 4, NULL, NULL, 'N', NULL),
(2440, 'CSI', 'Computer Systems', 4, NULL, NULL, 'N', NULL),
(2460, 'CSI', 'Fundamentals of Cybersecurity', 4, NULL, NULL, 'N', NULL),
(2470, 'CSI', 'Introduction to Computer Networks', 4, NULL, NULL, 'N', NULL),
(2490, 'CSI', 'Introduction to Artificial Intelligence: Representation, Concepts, and Problem Solving', 4, NULL, NULL, 'N', NULL),
(2500, 'EGR', 'Introduction to Thermal Engineering', 4, NULL, NULL, 'N', NULL),
(2555, 'APM', 'Introduction to Differential Equations with Matrix Algebra', 4, NULL, NULL, 'N', NULL),
(2600, 'EGR', 'Introduction to Industrial and Systems Engineering', 4, NULL, NULL, 'N', NULL),
(2663, 'APM', 'Discrete Mathematics', 4, NULL, NULL, 'N', NULL),
(2700, 'ECE', 'Digital Logic Design', 4, NULL, NULL, 'N', NULL),
(2775, 'MTH', 'Linear Algebra', 4, NULL, NULL, 'N', NULL),
(2800, 'EGR', 'Design and Analysis of Electromechanical Systems', 4, NULL, NULL, 'N', NULL),
(2990, 'CSI', 'Introduction to Data Structure C', 4, NULL, NULL, 'N', NULL),
(2999, 'CSI', 'Sophomore Project', 2, NULL, NULL, 'N', NULL),
(3100, 'ECE', 'Electronic Circuits and Devices I', 4, NULL, NULL, 'N', NULL),
(3105, 'ECE', 'Electronic Circuits and Devices II', 4, NULL, NULL, 'N', NULL),
(3150, 'CSI', 'Web and Mobile Systems', 4, 'NULL', NULL, 'N', NULL),
(3204, 'ECE', 'Signals and Systems', 4, NULL, NULL, 'N', NULL),
(3341, 'CRJ', 'Cybercrime', 4, NULL, NULL, 'N', NULL),
(3370, 'CSI', 'Software Engineering and Practice', 4, 'Introduction to software engineering and practice. Topics include software process models, project and software management, requirements analysis, architecture modeling, implementation and system integration, quality assurance, and testing.', 'https://moodle.oakland.edu/pluginfile.php/8885924/mod_resource/content/0/book.pdf', 'N', NULL),
(3380, 'CSI', 'Game Design', 4, 'NULL', NULL, 'N', NULL),
(3400, 'BIO', 'Genetics', 4, 'NULL', NULL, 'N', NULL),
(3430, 'APM', 'Theory of Computation', 4, 'Formal models of computation, ranging from finite state automata to Turing machines. Computational models are used to discuss the languages recognized by these machines and address issues of computability.', 'https://drive.uqu.edu.sa/_/mskhayat/files/MySubjects/20189FS%20ComputationTheory/Introduction%20to%20the%20theory%20of%20computation_third%20edition%20-%20Michael%20Sipser.pdf', 'N', NULL),
(3450, 'CSI', 'Database Design and Implementation', 4, 'Introduction to the design, implementation and management of database systems. Topics include planning, designing, and implementing a practical database using a relational database server for an application utilizing entity relationship diagrams, normal forms, and understanding relational database schemas. Advanced topics include concurrency control, query optimization, and introduction to database systems administration', 'https://www.cengage.com/c/database-systems-13e-coronel-morris/9781337627900/', 'N', NULL),
(3480, 'CSI', 'Security and Privacy in Computing', 4, NULL, NULL, 'N', NULL),
(3500, 'CSI', 'Human Computer Interaction', 4, 'NULL', NULL, 'N', NULL),
(3610, 'CSI', 'Design and Analysis of Algorithms', 4, 'Computer algorithms, their design and analysis. Strategies constructing algorithmic solutions, including divide-and-conquer, dynamic programming and greedy algorithms. Computational complexity as it pertains to time and space is used to evaluate the algorithms. A general overview of complexity classes is given.', 'https://dahlan.unimal.ac.id/files/ebooks/2009%20Introduction%20to%20Algorithms%20Third%20Ed.pdf', 'N', NULL),
(3620, 'CSI', 'Data Structures and Alogithms', 4, 'NULL', NULL, 'N', NULL),
(3640, 'CSI', 'Computer Organization', 4, NULL, NULL, 'N', NULL),
(3660, 'CSI', 'System Administration', 4, NULL, NULL, 'N', NULL),
(3680, 'CSI', 'Script Programming', 4, 'NULL', NULL, 'N', NULL),
(3720, 'ECE', 'Microprocessors', 4, NULL, NULL, 'N', NULL),
(4100, 'CSI', 'Ethics and Bias in AI', 4, NULL, NULL, 'N', NULL),
(4110, 'CSI', 'Foundations of Edge AI', 4, NULL, NULL, 'N', NULL),
(4130, 'CSI', 'Artificial Intelligence', 4, NULL, NULL, 'N', NULL),
(4131, 'ECE', 'Electronic Materials and Devices', 4, NULL, NULL, 'N', NULL),
(4132, 'ECE', 'VLSIC Design of Digital Chips', 4, NULL, NULL, 'N', NULL),
(4134, 'ECE', 'Fundamentals of MEMS', 4, NULL, NULL, 'N', NULL),
(4140, 'CSI', 'Deep Learning and Applications', 4, NULL, NULL, 'N', NULL),
(4150, 'CSI', 'AI for IT Operations', 4, NULL, NULL, 'N', NULL),
(4160, 'CSI', 'Integrated Computing Systems', 4, NULL, NULL, 'N', NULL),
(4170, 'CSI', 'Machine Learing', 4, NULL, NULL, 'N', NULL),
(4180, 'CSI', 'Natural Language Processing', 4, NULL, NULL, 'N', NULL),
(4181, 'MIS', 'IS Risk Analysis and Security Controls Development', 3, NULL, NULL, 'N', NULL),
(4230, 'CSI', 'Mobile and Smart Phone Application Development', 4, 'NULL', NULL, 'N', NULL),
(4240, 'CSI', 'Cloud Computing', 4, NULL, NULL, 'N', NULL),
(4347, 'APM', 'Mathematics of Cryptology', 4, 'NULL', NULL, 'N', NULL),
(4350, 'CSI', 'Programming language', 4, NULL, NULL, 'N', NULL),
(4380, 'CSI', 'Game Programming', 4, 'NULL', NULL, 'N', NULL),
(4430, 'CSI', 'IT Project Management', 4, 'NULL', NULL, 'N', NULL),
(4460, 'CSI', 'Information Security', 4, 'NULL', NULL, 'N', NULL),
(4480, 'CSI', 'Information Security Pratice', 4, NULL, NULL, 'N', NULL),
(4500, 'CSI', 'Operating System', 4, NULL, NULL, 'N', NULL),
(4510, 'CSI', 'Advanced Web Design Application', 4, 'NULL', NULL, 'N', NULL),
(4520, 'CSI', 'Industrial Control Security', 4, 'NULL', NULL, 'N', NULL),
(4521, 'ECE', 'Automotive Mechatronics I', 4, 'NULL', NULL, 'N', NULL),
(4550, 'CSI', 'Visual Computing', 4, 'NULL', NULL, 'N', NULL),
(4551, 'ECE', 'Human Robot Interaction', 4, NULL, NULL, 'N', NULL),
(4560, 'CSI', 'Mobile Security', 4, NULL, NULL, 'N', NULL),
(4580, 'CSI', 'AI for Cybersecurity and Privacy', 4, 'NULL', NULL, 'N', NULL),
(4590, 'CSI', 'Multimedia Forensics', 4, 'NULL', NULL, 'N', NULL),
(4600, 'CSI', 'Network Security', 4, NULL, NULL, 'N', NULL),
(4650, 'CSI', 'Paralllel and Distributed Computing', 4, NULL, NULL, 'N', NULL),
(4660, 'CSI', 'Advanced System Administration', 4, 'NULL', NULL, 'N', NULL),
(4700, 'CSI', 'Software Security', 4, NULL, NULL, 'N', NULL),
(4710, 'ECE', 'Computer Hardware Design', 4, NULL, NULL, 'N', NULL),
(4721, 'ECE', 'Embedded Systems Design', 4, NULL, NULL, 'N', NULL),
(4731, 'ECE', 'Fundamentals of Embedded System Design', 4, 'NULL', NULL, 'N', NULL),
(4740, 'CSI', 'Cyber Laws and Digital Forensics', 4, NULL, NULL, 'N', NULL),
(4741, 'ECE', 'Embedded Artificial Intelligence', 4, NULL, NULL, 'N', NULL),
(4772, 'ECE', 'High Performance Embedded Programming', 4, NULL, NULL, 'N', NULL),
(4780, 'ECE', 'Embedded Security', 4, 'NULL', NULL, 'N', NULL),
(4781, 'CSI', 'Bioinformatics', 4, 'NULL', NULL, 'N', NULL),
(4790, 'CSI', 'Automotive Security', 4, 'NULL', NULL, 'N', NULL),
(4810, 'CSI', 'Information Retrieval and Knowledge Discovery', 4, NULL, NULL, 'N', NULL),
(4880, 'CSI', 'Reverse Engineering and Malware Analysis', 4, NULL, NULL, 'N', NULL),
(4900, 'ECE', 'ST: Embedded Artificial Intelligence', 4, NULL, NULL, 'N', NULL),
(4999, 'CSI', 'Senior Capstone Project', 4, NULL, NULL, 'N', NULL),
(5760, 'ECE', 'Embedded System Design with FPGAs', 4, NULL, NULL, 'N', NULL),
(5770, 'ECE', 'GPU Accelerated Computing', 4, NULL, NULL, 'N', NULL);




-- BRIDGE --

INSERT INTO `bridge` (`MJR_ID`, `CLASS_ID`, `CORE_CLASS_FLG`, `ELECTIVE_FLG`, `TRACK_CLASS_FLG`, `TRACK_CLASS_NUM`) VALUES
(1, 1554, 'N', 'N', 'N',NULL),
(1, 1555, 'N', 'N', 'N',NULL),
(1, 2226, 'N', 'N', 'N',NULL),
(1, 2663, 'N', 'N', 'N',NULL),
(1, 2775, 'N', 'N', 'N',NULL),
(1, 1420, 'Y', 'N', 'N',NULL),
(1, 2300, 'Y', 'N', 'N',NULL),
(1, 2310, 'Y', 'N', 'N',NULL),
(1, 2470, 'Y', 'N', 'N',NULL),
(1, 2999, 'Y', 'N', 'N',NULL),
(1, 3150, 'N', 'N', 'Y',4),
(1, 3370, 'Y', 'N', 'N',NULL),
(1, 3430, 'Y', 'N', 'N',NULL),
(1, 3450, 'Y', 'N', 'N',NULL),
(1, 3480, 'Y', 'N', 'N',NULL),
(1, 3610, 'Y', 'N', 'N',NULL),
(1, 3640, 'Y', 'N', 'N',NULL),
(1, 3660, 'N', 'N', 'Y',2),
(1, 4130, 'N', 'N', 'Y',1),
(1, 4140, 'N', 'N', 'Y',1),
(1, 4160, 'N', 'N', 'Y',4),
(1, 4170, 'N', 'N', 'Y',1),
(1, 4180, 'N', 'N', 'Y',1),
(1, 4347, 'N', 'N', 'Y',3),
(1, 4350, 'Y', 'N', 'N',NULL),
(1, 4460, 'N', 'N', 'Y',3),
(1, 4480, 'N', 'N', 'Y',3),
(1, 4500, 'Y', 'N', 'N',NULL),
(1, 4510, 'N', 'N', 'Y',4),
(1, 4550, 'N', 'N', 'Y',1),
(1, 4650, 'Y', 'N', 'N',NULL),
(1, 4660, 'N', 'N', 'Y',2),
(1, 4700, 'N', 'N', 'Y',3),
(1, 4810, 'N', 'N', 'Y',1),
(1, 4999, 'Y', 'N', 'N',NULL),
(2, 1200, 'Y', 'N', 'N',NULL),
(2, 1400, 'Y', 'N', 'N',NULL),
(2, 1440, 'N', 'N', 'N',NULL),
(2, 1554, 'N', 'N', 'N',NULL),
(2, 1555, 'N', 'N', 'N',NULL),
(2, 1610, 'N', 'N', 'N',NULL),
(2, 1620, 'N', 'N', 'N',NULL),
(2, 2005, 'Y', 'N', 'N',NULL),
(2, 2400, 'Y', 'N', 'N',NULL),
(2, 2500, 'Y', 'N', 'N',NULL),
(2, 2555, 'N', 'N', 'N',NULL),
(2, 2600, 'Y', 'N', 'N',NULL),
(2, 2290, 'Y', 'N', 'N',NULL),
(2, 2663, 'N', 'N', 'N',NULL),
(2, 2700, 'Y', 'N', 'N',NULL),
(2, 2800, 'Y', 'N', 'N',NULL),
(2, 3100, 'Y', 'N', 'N',NULL),
(2, 3105, 'N', 'N', 'Y',3),
(2, 3204, 'Y', 'N', 'N',NULL),
(2, 3720, 'Y', 'N', 'N',NULL),
(2, 4110, 'N', 'N', 'Y',2),
(2, 4130, 'N', 'N', 'Y',2),
(2, 4131, 'N', 'N', 'Y',3),
(2, 4132, 'N', 'N', 'Y',3),
(2, 4134, 'N', 'N', 'Y',3),
(2, 4160, 'N', 'N', 'Y',2),
(2, 4551, 'N', 'N', 'Y',2),
(2, 4710, 'Y', 'N', 'N',NULL),
(2, 4721, 'Y', 'N', 'N',NULL),
(2, 4741, 'N', 'N', 'Y',2),
(2, 4772, 'N', 'N', 'Y',1),
(2, 4999, 'Y', 'N', 'N',NULL),
(2, 5760, 'N', 'N', 'Y',1),
(2, 5770, 'N', 'N', 'Y',1),
(3, 1420, 'Y', 'N', 'N',NULL),
(3, 1554, 'N', 'N', 'N',NULL),
(3, 1555, 'N', 'N', 'N',NULL),
(3, 2226, 'N', 'N', 'N',NULL),
(3, 2300, 'Y', 'N', 'N',NULL),
(3, 2440, 'Y', 'N', 'N',NULL),
(3, 2460, 'Y', 'N', 'N',NULL),
(3, 2470, 'Y', 'N', 'N',NULL),
(3, 2663, 'N', 'N', 'N',NULL),
(3, 2999, 'Y', 'N', 'N',NULL),
(3, 3341, 'Y', 'N', 'N',NULL),
(3, 3370, 'Y', 'N', 'N',NULL),
(3, 3450, 'Y', 'N', 'N',NULL),
(3, 3660, 'Y', 'N', 'N',NULL),
(3, 4130, 'N', 'N', 'Y',2),
(3, 4181, 'Y', 'N', 'N',NULL),
(3, 4240, 'Y', 'N', 'N',NULL),
(3, 4480, 'Y', 'N', 'N',NULL),
(3, 4520, 'N', 'N', 'Y',3),
(3, 4560, 'N', 'N', 'Y',1),
(3, 4580, 'N', 'N', 'Y',2),
(3, 4590, 'N', 'N', 'Y',2),
(3, 4600, 'Y', 'N', 'N',NULL),
(3, 4700, 'Y', 'N', 'N',NULL),
(3, 4731, 'N', 'N', 'Y',3),
(3, 4740, 'Y', 'N', 'N',NULL),
(3, 4780, 'N', 'N', 'Y',3),
(3, 4790, 'N', 'N', 'Y ',3),
(3, 4880, 'N', 'N', 'Y',1),
(3, 4999, 'Y', 'N', 'N',NULL),
(4, 1420, 'Y', 'N', 'N',NULL),
(4, 1554, 'N', 'N', 'N',NULL),
(4, 1555, 'N', 'N', 'N',NULL),
(4, 2226, 'N', 'N', 'N',NULL),
(4, 2300, 'Y', 'N', 'N',NULL),
(4, 2310, 'Y', 'N', 'N',NULL),
(4, 2490, 'Y', 'N', 'N',NULL),
(4, 2663, 'N', 'N', 'N',NULL),
(4, 2775, 'N', 'N', 'N',NULL),
(4, 2999, 'Y', 'N', 'N',NULL),
(4, 3370, 'Y', 'N', 'N',NULL),
(4, 3430, 'Y', 'N', 'N',NULL),
(4, 3610, 'Y', 'N', 'N',NULL),
(4, 4100, 'Y', 'N', 'N',NULL),
(4, 4110, 'N', 'N', 'Y', 1),
(4, 4130, 'Y', 'N', 'N',NULL),
(4, 4140, 'Y', 'N', 'N',NULL),
(4, 4150, 'Y', 'N', 'N',NULL),
(4, 4170, 'Y', 'N', 'N',NULL),
(4, 4180, 'Y', 'N', 'N',NULL),
(4, 4230, 'N', 'N', 'Y', 1),
(4, 4240, 'N', 'N', 'Y', 1),
(4, 4521, 'N', 'N', 'Y', 2),
(4, 4731, 'N', 'N', 'Y', 2),
(4, 4900, 'N', 'N', 'Y', 2),
(4, 4810, 'Y', 'N', 'N',NULL),
(4, 4999, 'Y', 'N', 'N', NULL),
(4, 2320, 'N', 'Y', 'N',NULL),
(4, 2330, 'N', 'Y', 'N',NULL),
(4, 2340, 'N', 'Y', 'N',NULL),
(4, 2350, 'N', 'Y', 'N',NULL),
(5, 1210, 'Y', 'N', 'N',NULL),
(5, 1320, 'Y', 'N', 'N',NULL),
(5, 1554, 'N', 'N', 'N',NULL),
(5, 1663, 'N', 'N', 'N',NULL),
(5, 2221, 'N', 'N', 'N',NULL),
(5, 2300, 'Y', 'N', 'N',NULL),
(5, 2440, 'Y', 'N', 'N',NULL),
(5, 2470, 'Y', 'N', 'N',NULL),
(5, 2999, 'Y', 'N', 'N',NULL),
(5, 3150, 'Y', 'N', 'N',NULL),
(5, 3370, 'Y', 'N', 'N',NULL),
(5, 3380, 'N', 'N', 'Y',3),
(5, 3400, 'N', 'N', 'Y',2),
(5, 3450, 'Y', 'N', 'N',NULL),
(5, 3480, 'Y', 'N', 'N',NULL),
(5, 3500, 'Y', 'N', 'N',NULL),
(5, 3620, 'Y', 'N', 'N',NULL),
(5, 3660, 'Y', 'N', 'N',NULL),
(5, 3680, 'N', 'N', 'Y',1),
(5, 4160, 'Y', 'N', 'N',NULL),
(5, 4380, 'N', 'N', 'Y',3),
(5, 4430, 'Y', 'N', 'N',NULL),
(5, 4460, 'N', 'N', 'Y',4),
(5, 4480, 'N', 'N', 'Y',4),
(5, 4660, 'N', 'N', 'Y',1),
(5, 4700, 'N', 'N', 'Y',4),
(5, 4781, 'N', 'N', 'Y',2),
(5, 4999, 'Y', 'N', 'N',NULL);



-- PROFESSOR values --
INSERT INTO `professor` VALUES(11, 'Angel', 'Bravo', 129, '248-654-4321', 'angelbravo@school.edu', NULL, 2.3, 'https://www.ratemyprofessors.com/professor/612864');
INSERT INTO `professor` VALUES(14, 'Julian', 'Rrushi', 609, '111-111-1111', 'rrushi@oakland.edu', 'Dr. Julian Rrushi teaches computer science and engineering courses at both undergraduate and graduate levels at Oakland University. His research focus is foundational data science, with an application domain of cyber security exploring cyber-physical systems, computer hardware, operating systems, defensive cyber deception engineering, human cognition and serious games. Dr. Rrushi was awarded the DARPA Young Faculty Award, class of 2020.', 5.0, 'https://www.ratemyprofessors.com/professor/2418364');
INSERT INTO `professor` VALUES(15, 'Eddie', 'Cheng', 543, '248-900-3950', 'eddiecheng@school.edu', 'Taught an amazing discrete math class', 4.2, 'https://www.ratemyprofessors.com/professor/12963');
INSERT INTO `professor` VALUES(17, 'Anyi', 'Liu', 190, '111-111-1111', 'anyiliu@oakland.edu', 'Anyi Liu received the Ph.D. degree in information technology from George Mason University, Virginia. He is currently an Assistant Professor with the Department of Computer Science and Engineering, Oakland University, MI, USA. His research interests primarily focus at the intersection of system security, software security, intrusion detection and prevention, and digital forensics. His research is supported by the National Science Foundation and Michigan Space Grant Consortium.', 3.9, 'https://www.ratemyprofessors.com/professor/2209599');
INSERT INTO `professor` VALUES(18, 'Hua', 'Ming', 366, '111-111-1111', 'ming@oakland.edu', 'Hua Ming received his Ph.D degree in Computer Science and a Postdoctoral Fellowship both from Iowa State University, under the supervision of Prof.Carl K. Chang. In Aug 2014 he joined Oakland University where he is now an Associate Professor in Computer Science and Engineering and Director of the Laboratory of Big Data-oriented Programming Systems and Software Engineering.', 4.5, 'https://www.ratemyprofessors.com/professor/1966070');
INSERT INTO `professor` VALUES(21, 'Tianle', 'Ma', 178, '111-111-1111', 'tianlema@oakland.edu', 'Tianle Ma, MSc, PhD, is an Assistant Professor at Oakland University, Missouri, USA. He received his Doctor of Philosophy from the University at Buffalo. His research interests include Bioinformatics, Computational Biology, Machine Learning, Advanced Machine Learning, Neural Networks, Artificial Intelligence, Data Mining, and Computer Science.', 3.3, 'https://www.ratemyprofessors.com/professor/2795293');
INSERT INTO `professor` VALUES(22, 'Matthew', 'Toeniskoetter', 646, '111-111-1111', 'toeniskoetter@oakland.edu', 'Earned dual Bachelor of Science degrees majoring in Mathematics and Computer Science from Oakland University in 2010 and a PhD in Mathematics from Purdue University in August 2017.', 4.6, 'https://www.ratemyprofessors.com/professor/2648708');
INSERT INTO `professor` VALUES(27, 'Guangzhi', 'Qu', 300, '111-111-1111', 'gqu@oakland.edu', 'Guangzhi Qu (Senior Member, IEEE) received the B.E. and M.E. degrees from the Department of Computer Science and Engineering, Beihang University, and the Ph.D. degree in computer engineering from The University of Arizona, in 2005. He joined the Computer Science and Engineering Department, Oakland University, in 2007, where he is currently an Associate Professor. His research interests include data mining, machine learning, operating systems, and program analysis. He was the Conference Co-Chair of the 2014 International Conference on Machine Learning and Applications (ICMLA)', 3.2, 'https://www.ratemyprofessors.com/professor/1228295');
INSERT INTO `professor` VALUES(29, 'Ishwar', 'Sethi', 244, '111-111-1111', 'sethi@oakland.edu', 'Ishwar K. Sethi received the PhD degree from Indian Institute of Technology, Kharagpur, India, in 1978. In 1982, he joined Wayne State University where he was involved in teaching and research in artificial neural networks, pattern recognition, computer vision, and multimedia information retrieval. Since August 1999, he has been with Oakland University where he is the chair of the Computer Science and Engineering Department. Professor Sethi has served on numerous program committees of national and international conferences as well as on editorial boards of many academic journals including IEEE Transactions Pattern Analysis and Machine Intelligence, IEEE Multimedia, Pattern Recognition, Pattern Recognition Letters, and Machine Vision and Applications. He was elected an IEEE fellow in 2001.', 1.9, 'https://www.ratemyprofessors.com/professor/612864');
INSERT INTO `professor` VALUES(34, 'Mohammad-Reza', 'Siadat', 123, '111-111-1111', 'siadat@oakland.edu', 'Mohammed-Reza Siadat received PHD from Wayne State. Researched Medical Signal and Image Processing Computational Anatomy,  Physiology and Medical Informatics.The goals of the research are utilization of the wealth of available medical data to the fullest for data-driven and patient-specific diagnosis, treatment planning and prognosis.', 1.0, 'https://www.ratemyprofessors.com/professor/1189681');
INSERT INTO `professor` VALUES(36, 'Hadeel', 'Mohammed Jawad', 121, '111-111-1111', 'hjawad@oakland.edu', 'I am an immigrant engineer who lives in the United State. I have a master and bachelor degrees in computer engineering and a PhD in Technology Management. I worked as a faculty in my home country for six years and taught and still teach in several institutions here in Michigan. Posting on this channel is one of my hobbies. Also, I want to motivate people like me to keep working as immigrants\' lives are not easy, complicated, and someone should really work hard to survive.', 2.7, 'https://www.ratemyprofessors.com/professor/2520035');
INSERT INTO `professor` VALUES(38, 'Xuemei', 'Li', 154, '111-111-1111', 'xuemeili@oakland.edu', 'Xuemei Li is a professor at  Imperial College London and at  Swiss Federal Institute of Technology Lausanne. She studied random evolutions, especially differential equations with noise and random perturbations. She is  interested in problems connected to geometry, actually the branch of geometry called differential geometry.', 3.3, 'https://www.ratemyprofessors.com/professor/1719247');
INSERT INTO `professor` VALUES(41, 'Wajdi', 'Aljedaani', 230, '111-111-1111', 'ramarti3@school.edu', ' Wajdi Aljedaani is a PhD student and Teaching Follow in the Computer science and Engineering Department at Oakland University. Anthony holds a Master’s in Software Engineering from Rochester Institute of Technology, a Bachelor’s in Software Engineering from Technological University of the Shannon, and Bachelor’s in Computer Engineering from Technological University of the Shannon from Ireland.', 5.0, 'https://www.ratemyprofessors.com/professor/2705059');
INSERT INTO `professor` VALUES(71, 'Tony', 'Shaska', 555, '111-111-1111', 'shaska@oakland.edu', 'Tony Shaska served as Rector of the University of Vlora (UV) in Albania from January 2008 until December 2010. During his tenure UV he was ranked the highest in Balkans and had over 15 000 students. He created The Faculty of Technical Sciences and new departments in Mathematics, Physics, Chemistry, Computer Science, Electrical and Mechanical Engineering, Finance, etc. In the Fall 2010 there were 160 students who enrolled as Math majors.', 2.8, 'https://www.ratemyprofessors.com/professor/274370');
INSERT INTO `professor` VALUES(72, 'Jorge', 'Mello', 324, '111-111-1111', 'jorgedemellojr@oakland.edu', 'Jorge de Mello Jr. is  a visiting assistant professor at Oakland University. ​Prior to that, He was a postdoc at the Max Planck Institute for Mathematics, Bonn, and a postdoc at York University, CA, supervised by Prof Patrick Ingram.Before, He was a post-doc at the University of New South Wales, AU, supervised by Prof Igor Shparlinski and Prof Alina Ostafe (2019-2020).', 3.5, 'https://www.ratemyprofessors.com/professor/132114');
INSERT INTO `professor` VALUES(77, 'Harvey', 'Qu', 654, '111-111-1111', 'qu@oakland.edu', 'Harvey Qu, based in Rochester, MI, US, is currently a Professor of Statistics at Oakland University, bringing experience from previous roles at Oakland University. Harvey Qu holds a 1998 - 2002 University of Michigan.', 3.6, 'https://www.ratemyprofessors.com/professor/537479.');
INSERT INTO `professor` VALUES(79, 'JD', 'Nir', 689, '111-111-1111', 'jdnir@oakland.edu', 'JD attended college at Carnegie Mellon University where he majored in mathematics and computer science before receiving his Ph.D. from the University of Nebraska-Lincoln under the supervision of Dr. Jamie Radcliffe. JD\'s Canadian life began in Winnipeg where he held a postdoc position working with Dr. Karen Gunderson at the University of Manitoba. He now works with the Graphs@TMU research group at Toronto Metropolitan University.', 5.0, 'https://www.ratemyprofessors.com/professor/2647745');
INSERT INTO `professor` VALUES(80, 'Nghia', 'Tran', 612, '111-111-1111', 'nttran@oakland.edu', 'Nghia Tran is  an associate professor at Department of Mathematics and Statistics, Oakland University. Before joining OU in 2014 as an assistant professor, He held a one year Postdoctoral Research Fellow of Pacific Institute for the Mathematical Sciences (PIMS) at University of British Columbia Okanagan located in the beautiful Okanagan Valley with mountains, lakes, and wines. He graduated with Ph.D. degree in Applied Math from Wayne State University, Motor City. His research interests lie in nonsmooth optimization, variational analysis, and their applications.', 3.9, 'https://www.ratemyprofessors.com/professor/2152543');

-- SECTION values --
INSERT INTO SECTION VALUES(43025,3450,11,'2023-09-07 01:00:00','W24');


