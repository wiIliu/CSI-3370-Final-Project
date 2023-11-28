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
    APPT_ID INTEGER PRIMARY KEY,
    ADVISOR_ID INTEGER NOT NULL,
    APPT_DATE_TIME DATETIME NOT NULL,
    APPT_CONFIRMATION_FLG CHAR(1) DEFAULT 'N' NOT NULL,
    APPT_RESCHEDULE_FLG CHAR(1) DEFAULT 'N' NOT NULL,
    APPT_REASON VARCHAR(255) NOT NULL,
    STUDENT_GID VARCHAR(9) NOT NULL,
    STUDENT_FNAME VARCHAR(20) NOT NULL,
    STUDENT_LNAME VARCHAR(20) NOT NULL,
    STUDENT_PHONE CHAR(12) NOT NULL,
    STUDENT_EMAIL VARCHAR(50) NOT NULL,
    CONSTRAINT APPOINTMENT_ADVISOR_ID_FK FOREIGN KEY (ADVISOR_ID) REFERENCES ADVISOR(ADVISOR_ID)
);


CREATE TABLE CLASS(
    CLASS_ID INTEGER PRIMARY KEY,
    CLASS_GROUP CHAR(3) NOT NULL,
    CLASS_NAME VARCHAR(255) NOT NULL,
    CLASS_CREDITS INTEGER DEFAULT 4,
    CLASS_DESC VARCHAR(255),
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
    PROF_LNAME VARCHAR(20) NOT NULL,
    PROF_OFFICE_NUM INTEGER,
    PROF_PHONE CHAR(12) NOT NULL,
    PROF_EMAIL VARCHAR(50) NOT NULL,
    PROF_BACKGROUND VARCHAR(255),
    PROF_RATING NUMERIC(1,1), 
    PROF_RATING_LINK VARCHAR(255)
);

CREATE TABLE SECTION(
    CRN INTEGER PRIMARY KEY,
    CLASS_ID INTEGER NOT NULL,
    PROF_ID INTEGER NOT NULL,
    SECTION_TIME DATETIME NOT NULL,
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
INSERT INTO MAJOR VALUES(5,"Information Technology", "An Information Technology (IT) major provides students with a versatile skill set for navigating the rapidly evolving tech landscape. Focused on the practical application of technology in various domains, the curriculum covers areas such as computer systems, networks, databases, and programming. Students learn to analyze and solve complex problems, manage IT projects, and implement innovative solutions. Emphasis is placed on acquiring proficiency in programming languages, understanding system architectures, and developing skills in network administration.", "General Education requirements
Each candidate for an Oakland University baccalaureate will need to satisfactorily complete approved courses in each of the following areas: Foundation, Exploration, Integration, Writing, U.S. Diversity, and Capstone. GPA requirements vary, often considering overall GPA of 2.5, core course GPA, and prerequisites. For details, refer to the General Education section of the catalog.", "pictures\\itMajor.png", 2);

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
-- CE class value--
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
-- Cyber class value --
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
-- IT CLASS VLUES --
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (1210, 'CSI', 'Problem Solving Using VBA and Excel', 'NULL');
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (1663, 'APM', 'Mathematics for Information Technology', 'NULL');
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (3500, 'CSI', 'Human Computer Interaction', 'NULL');
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (3620, 'CSI', 'Human Computer Interaction', 'NULL');
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4430, 'CSI', 'IT Project Management', 'NULL');
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (3680, 'CSI', 'Script Programming', 'NULL');
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (3380, 'CSI', 'Game Design', 'NULL');
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4380, 'CSI', 'Game Programming', 'NULL');

-- AI class values -- 
INSERT INTO CLASS (CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC) VALUES (4230, 'CSI', 'Mobile and Smart Phone Application Development', 'NULL');


-- BRIDGE --
-- CS -- 
INSERT INTO BRIDGE VALUES(1,1554);
INSERT INTO BRIDGE VALUES(1,1555);
INSERT INTO BRIDGE VALUES(1,2775);
INSERT INTO BRIDGE VALUES(1,2663);
INSERT INTO BRIDGE VALUES(1,2226);


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


-- cyber scruity--
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


-- CE --
INSERT INTO BRIDGE VALUES(2,2555);
INSERT INTO BRIDGE VALUES(2,2663);
INSERT INTO BRIDGE VALUES(2,1440);
INSERT INTO BRIDGE VALUES(2,1554);
INSERT INTO BRIDGE VALUES(2,1555);
INSERT INTO BRIDGE VALUES(2,1610);
INSERT INTO BRIDGE VALUES(2,1620);
-- ce valus --
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

-- IT--
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
INSERT INTO PROFESSOR VALUES(11,"Angel","Bravo",129,"248-654-4321","angelbravo@school.edu",NULL,NULL,NULL);


-- SECTION values --
INSERT INTO SECTION VALUES(43025,3450,11,'2023-09-07 01:00:00');



