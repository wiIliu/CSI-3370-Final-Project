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
    ELECTIVE_FLG CHAR(1) DEFAULT 'N',
    CORE_CLASS_FLG CHAR(1) DEFAULT 'N',
    CLASS_PREREQ_FLG CHAR(1) DEFAULT 'N',
    CLASS_PREREQ VARCHAR(25)
);

CREATE TABLE BRIDGE(
    MJR_ID INTEGER NOT NULL,
    CLASS_ID INTEGER NOT NULL,
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
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC,CORE_CLASS_FLG,TEXTBK_LINK) VALUES(3450,"CSI", "Database Design and Implementation", "Introduction to the design, implementation and management of database systems. Topics include planning, designing, and implementing a practical database using a relational database server for an application utilizing entity relationship diagrams, normal forms, and understanding relational database schemas. Advanced topics include concurrency control, query optimization, and introduction to database systems administration", 'Y',"https://www.cengage.com/c/database-systems-13e-coronel-morris/9781337627900/");
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC,CORE_CLASS_FLG,TEXTBK_LINK) VALUES(3610, "CSI", "Design and Analysis of Algorithms", "Computer algorithms, their design and analysis. Strategies constructing algorithmic solutions, including divide-and-conquer, dynamic programming and greedy algorithms. Computational complexity as it pertains to time and space is used to evaluate the algorithms. A general overview of complexity classes is given.", 'Y',"https://dahlan.unimal.ac.id/files/ebooks/2009%20Introduction%20to%20Algorithms%20Third%20Ed.pdf");
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC,CORE_CLASS_FLG,TEXTBK_LINK) VALUES(3370, "CSI", "Software Engineering and Practice", "Introduction to software engineering and practice. Topics include software process models, project and software management, requirements analysis, architecture modeling, implementation and system integration, quality assurance, and testing.", 'Y',"https://moodle.oakland.edu/pluginfile.php/8885924/mod_resource/content/0/book.pdf");
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC,CORE_CLASS_FLG,TEXTBK_LINK) VALUES(3430, "APM", "Theory of Computation", "Formal models of computation, ranging from finite state automata to Turing machines. Computational models are used to discuss the languages recognized by these machines and address issues of computability.", 'Y', "https://drive.uqu.edu.sa/_/mskhayat/files/MySubjects/20189FS%20ComputationTheory/Introduction%20to%20the%20theory%20of%20computation_third%20edition%20-%20Michael%20Sipser.pdf");
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (2663,"APM","Discrete Mathematics",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (1554,"MTH", "Calculus I",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (1555,"MTH", "Calculus II", NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (2775,"MTH", "Linear Algebra",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (2226,"STA", "Applied Probability and Statistics",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (2440,"CSI", "Computer System",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (4150,"CSI", "AI for IT Operations",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (4170,"CSI", "Machine Learing",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (4180,"CSI", "Natural Language Processing",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (4810,"CSI", "Information Retrieval and Knowledge Discovery",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (4999,"CSI", "Senior Capstone Project",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (2320,"CSI", "C++ for Programmers",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (2330,"CSI", "Immersive Python",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (2340,"CSI", "Ruby for Web Developers",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (2350,"CSI", "Programming in Visual C# for .NET Technology",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC,CORE_CLASS_FLG) VALUES (1420,"CSI", "Introduction to C Programming and Unix", NULL,'Y');
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC,CORE_CLASS_FLG) VALUES (1320,"CSI", "Introduction to Python Programming and Unix", NULL,'Y');
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC,CORE_CLASS_FLG) VALUES (2300,"CSI", "Object-Oriented Computing", NULL,'Y');
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC,CORE_CLASS_FLG) VALUES (2310,"CSI", "Data Structures", NULL,'Y');
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC,CORE_CLASS_FLG) VALUES (2490,"CSI", "Introduction to Artificial Intelligence: Representation, Concepts, and Problem Solving", NULL,'Y');
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC,CLASS_CREDITS,CORE_CLASS_FLG) VALUES (2999,"CSI", "Sophomore Project", NULL,2,'Y');
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC,CORE_CLASS_FLG) VALUES (4100,"CSI", "Ethics and Bias in AI", NULL,'Y');
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC,CORE_CLASS_FLG) VALUES (4130,"CSI", "Artificial Intelligence", NULL,'Y');
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC,CORE_CLASS_FLG) VALUES (4140,"CSI", "Deep Learning and Applications", NULL,'Y');
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (2460,"CSI", "Foundamentals of Cybersecurity",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (2470,"CSI", "Introduction to Computer Network",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (2555,"APM", "Introduction to Differential Equations with Matrix Algebra",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (1440,"CHM", "General Chemistry I",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (1610,"PHY", "Fundamentals of Physics I",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (1620,"PHY", "Fundamentals of Physics II",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (1200,"EGR", "Engineering Graphics and CAD",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (1400,"EGR", "Computer Problem Solving in Engineering and Computer Science",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (2400,"EGR", "Introduction to Electrical and Computer Engineering",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (2500,"EGR", "Introduction to Thermal Engineering",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (2600,"EGR", "Introduction to Industrial and Systems Engineering",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (2800,"EGR", "Design and Analysis of Electromechanical Systems",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (4240,"CSI", "Cloud Computing",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (4480,"CSI", "Information Security Pratice",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (4600,"CSI", "Network Security",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (4700,"CSI", "Software Security",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (4740,"CSI","Cyber laws and Digital Forensics",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (3341,"CRJ","Cybercrime",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (3660,"CSI","System Administration",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (4560,"CSI", "Mobile Security",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (4880,"CSI", "Reverse Engineering and Malware Analysis",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (2990,"CSI", "Introduction to Data Structure C",NULL);
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC) VALUES (2005,"ECE", "Electronic Circuit",NULL);
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (2700, "ECE", "Digital Logic Design",NULL);
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (3100, "ECE", "Electronic Circuits and Devices I",NULL);
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (3204, "ECE", "Signals and Systems", NULL);
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (3720, "ECE", "Microprocessors", NULL);
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4710, "ECE", "Computer Hardware Design", NULL);
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4721, "ECE", "Embedded Systems Design", NULL);
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4772, "ECE", "High Performance Embedded Programming", NULL);
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (5760, "ECE", "Embedded System Design with FPGAs", NULL);
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (5770, "ECE", "GPU Accelerated Computing", NULL);
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4160, "CSI", "Integrated Computing Systems", NULL);
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4110, "CSI", "Foundations of Edge AI", NULL);
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4551, "ECE", "Human Robot Interaction", NULL);
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (3105, "ECE", "Electronic Circuits and Devices II", NULL);
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4132, "ECE", "VLSIC Design of Digital Chips", NULL);
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4134, "ECE", "Fundamentals of MEMS", NULL);
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (3480, "CSI", "Security and Privacy in Computing", NULL);
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (3640, "CSI", "Computer Organization", NULL);
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4350, "CSI", "Programming language", NULL);
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4500, "CSI", "Operating System", NULL);
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4650, "CSI", "Paralllel and Distributed Computing", NULL);
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (1210, 'CSI', 'Problem Solving Using VBA and Excel', 'NULL');
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (1663, 'APM', 'Mathematics for Information Technology', 'NULL');
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (3500, 'CSI', 'Human Computer Interaction', 'NULL');
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (3620, 'CSI', 'Human Computer Interaction', 'NULL');
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4430, 'CSI', 'IT Project Management', 'NULL');
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (3680, 'CSI', 'Script Programming', 'NULL');
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (3380, 'CSI', 'Game Design', 'NULL');
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4380, 'CSI', 'Game Programming', 'NULL');
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4230, 'CSI', 'Mobile and Smart Phone Application Development', 'NULL');
-- Computational Intelligence Track -- 
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4550, "CSI", "Visual Computing", "NULL");
-- System Administration Track
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4660, "CSI", "Advanced System Administration", "NULL");
-- Cybersecurity Track
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4460, "CSI", "Information Security", "NULL");
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4347, "APM", "Mathematics of Cryptology", "NULL");
-- Web Development Track --
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (3150, "CSI", "Web and Mobile Systems", "NULL");
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4510, "CSI", "Advanced Web Design Application", "NULL");
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (2221, "STA", "Introduction to Statistical Methods ", "NULL");
-- AI in Cybersecurity Track
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4580, 'CSI', 'AI for Cybersecurity and Privacy', 'NULL');
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4590, 'CSI', 'Multimedia Forensics', 'NULL');
-- Cyber Physical System (CPS) Security Track
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4731, 'ECE', 'Fundamentals of Embedded System Design', 'NULL');
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4520, 'CSI', 'Industrial Control Security', 'NULL');
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4790, 'CSI', 'Automotive Security', 'NULL');
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4780, 'ECE', 'Embedded Security', 'NULL');

-- BRIDGE --
INSERT INTO BRIDGE VALUES(1,3450);
INSERT INTO BRIDGE VALUES(1,3610);
INSERT INTO BRIDGE VALUES(1,3370);
INSERT INTO BRIDGE VALUES(1,3430);
INSERT INTO BRIDGE VALUES(1,1420);
INSERT INTO BRIDGE VALUES(1,2300);
INSERT INTO BRIDGE VALUES(1,2310);
INSERT INTO BRIDGE VALUES(1,2470);
INSERT INTO BRIDGE VALUES(1,2999);
INSERT INTO BRIDGE VALUES(1,3480);
INSERT INTO BRIDGE VALUES(1,3640);
INSERT INTO BRIDGE VALUES(1,4350);
INSERT INTO BRIDGE VALUES(1,4500);
INSERT INTO BRIDGE VALUES(1,4650);
INSERT INTO BRIDGE VALUES(1,4999);
INSERT INTO BRIDGE VALUES(1,4130);
INSERT INTO BRIDGE VALUES(1,4140);
INSERT INTO BRIDGE VALUES(1,4170);
INSERT INTO BRIDGE VALUES(1,4180);
INSERT INTO BRIDGE VALUES(1,4550);
INSERT INTO BRIDGE VALUES(1,4810);
INSERT INTO BRIDGE VALUES(1,3660);
INSERT INTO BRIDGE VALUES(1,4660);
INSERT INTO BRIDGE VALUES(1,4460);
INSERT INTO BRIDGE VALUES(1,4480);
INSERT INTO BRIDGE VALUES(1,4700);
INSERT INTO BRIDGE VALUES(1,4347);
INSERT INTO BRIDGE VALUES(1,3150);
INSERT INTO BRIDGE VALUES(1,4160);
INSERT INTO BRIDGE VALUES(1,4510);
INSERT INTO BRIDGE VALUES(4,2663);
INSERT INTO BRIDGE VALUES(4,1554);
INSERT INTO BRIDGE VALUES(4,1555);
INSERT INTO BRIDGE VALUES(4,2775);
INSERT INTO BRIDGE VALUES(4,2226);
INSERT INTO BRIDGE VALUES(4,1420);
INSERT INTO BRIDGE VALUES(4,1320);
INSERT INTO BRIDGE VALUES(4,2300);
INSERT INTO BRIDGE VALUES(4,2310);
INSERT INTO BRIDGE VALUES(4,2490);
INSERT INTO BRIDGE VALUES(4,2999);
INSERT INTO BRIDGE VALUES(4,3370);
INSERT INTO BRIDGE VALUES(4,3430);
INSERT INTO BRIDGE VALUES(4,3610);
INSERT INTO BRIDGE VALUES(4,4100);
INSERT INTO BRIDGE VALUES(4,4130);
INSERT INTO BRIDGE VALUES(4,4140);
INSERT INTO BRIDGE VALUES(4,4230);
INSERT INTO BRIDGE VALUES(4,4240);
INSERT INTO BRIDGE VALUES(4,4110);
INSERT INTO BRIDGE VALUES(4,4731);
INSERT INTO BRIDGE VALUES(4,4520);
INSERT INTO BRIDGE VALUES(3,1554);
INSERT INTO BRIDGE VALUES(3,1555);
INSERT INTO BRIDGE VALUES(3,2226);
INSERT INTO BRIDGE VALUES(3,2663);
INSERT INTO BRIDGE VALUES(3,2999);
INSERT INTO BRIDGE VALUES(3,1420);
INSERT INTO BRIDGE VALUES(3,2300);
INSERT INTO BRIDGE VALUES(3,2440);
INSERT INTO BRIDGE VALUES(3,2460);
INSERT INTO BRIDGE VALUES(3,2470);
INSERT INTO BRIDGE VALUES(3,3370);
INSERT INTO BRIDGE VALUES(3,3450);
INSERT INTO BRIDGE VALUES(3,3660);
INSERT INTO BRIDGE VALUES(3,4240);
INSERT INTO BRIDGE VALUES(3,4480);
INSERT INTO BRIDGE VALUES(3,4600);
INSERT INTO BRIDGE VALUES(3,4700);
INSERT INTO BRIDGE VALUES(3,4740);
INSERT INTO BRIDGE VALUES(3,4999);
INSERT INTO BRIDGE VALUES(3,3341);
INSERT INTO BRIDGE VALUES(3,4560);
INSERT INTO BRIDGE VALUES(3,4880);
INSERT INTO BRIDGE VALUES(3,4130);
INSERT INTO BRIDGE VALUES(3,4580);
INSERT INTO BRIDGE VALUES(3,4590);
INSERT INTO BRIDGE VALUES(3,4731);
INSERT INTO BRIDGE VALUES(3,4520);
INSERT INTO BRIDGE VALUES(3,4790);
INSERT INTO BRIDGE VALUES(3,4780);
INSERT INTO BRIDGE VALUES(2,2555);
INSERT INTO BRIDGE VALUES(2,2663);
INSERT INTO BRIDGE VALUES(2,1440);
INSERT INTO BRIDGE VALUES(2,1554);
INSERT INTO BRIDGE VALUES(2,1555);
INSERT INTO BRIDGE VALUES(2,1610);
INSERT INTO BRIDGE VALUES(2,1620);
INSERT INTO BRIDGE VALUES(2,1200);
INSERT INTO BRIDGE VALUES(2,1400);
INSERT INTO BRIDGE VALUES(2,2400);
INSERT INTO BRIDGE VALUES(2,2500);
INSERT INTO BRIDGE VALUES(2,2600);
INSERT INTO BRIDGE VALUES(2,2800);
INSERT INTO BRIDGE VALUES(2,2005);
INSERT INTO BRIDGE VALUES(2,2700);
INSERT INTO BRIDGE VALUES(2,3100);
INSERT INTO BRIDGE VALUES(2,3204);
INSERT INTO BRIDGE VALUES(2,3720);
INSERT INTO BRIDGE VALUES(2,4721);
INSERT INTO BRIDGE VALUES(2,4999);
INSERT INTO BRIDGE VALUES(2,4772);
INSERT INTO BRIDGE VALUES(2,5760);
INSERT INTO BRIDGE VALUES(2,5770);
INSERT INTO BRIDGE VALUES(2,4130);
INSERT INTO BRIDGE VALUES(2,4160);
INSERT INTO BRIDGE VALUES(2,4110);
INSERT INTO BRIDGE VALUES(2,4551);
INSERT INTO BRIDGE VALUES(2,4740);
INSERT INTO BRIDGE VALUES(2,3105);
INSERT INTO BRIDGE VALUES(2,4132);
INSERT INTO BRIDGE VALUES(2,4134);
INSERT INTO BRIDGE VALUES(5,1554);
INSERT INTO BRIDGE VALUES(5,2221);
INSERT INTO BRIDGE VALUES(5,1663);
INSERT INTO BRIDGE VALUES(5,1210);
INSERT INTO BRIDGE VALUES(5,1320);
INSERT INTO BRIDGE VALUES(5,2300);
INSERT INTO BRIDGE VALUES(5,2440);
INSERT INTO BRIDGE VALUES(5,2470);
INSERT INTO BRIDGE VALUES(5,2999);
INSERT INTO BRIDGE VALUES(5,3150);
INSERT INTO BRIDGE VALUES(5,3370);
INSERT INTO BRIDGE VALUES(5,3450);
INSERT INTO BRIDGE VALUES(5,3480);
INSERT INTO BRIDGE VALUES(5,3500);
INSERT INTO BRIDGE VALUES(5,3620);
INSERT INTO BRIDGE VALUES(5,3660);
INSERT INTO BRIDGE VALUES(5,4160);
INSERT INTO BRIDGE VALUES(5,4430);
INSERT INTO BRIDGE VALUES(5,4999);
INSERT INTO BRIDGE VALUES(5,4660);
INSERT INTO BRIDGE VALUES(5,3680);
INSERT INTO BRIDGE VALUES(5,3380);
INSERT INTO BRIDGE VALUES(5,4380);
INSERT INTO BRIDGE VALUES(5,4460);
INSERT INTO BRIDGE VALUES(5,4480);
INSERT INTO BRIDGE VALUES(5,4700);

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

