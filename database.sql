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
INSERT INTO MAJOR VALUES(2,"Computer Engineering", "A major in Computer Engineering is designed to provide students with a comprehensive understanding of the principles and practices underlying the design and development of computer systems and networks. It combines elements of both electrical engineering and computer science to prepare students for careers at the intersection of hardware and software.", "major standing", "pictures\\ceMajor.png", 5);
INSERT INTO MAJOR VALUES(3,"Cybersecurity", "A cybersecurity major equips students with vital skills to defend digital systems against evolving cyber threats. Covering network security, threat analysis, and attack prevention, the program delves into crafting and implementing information security policies. Students learn cryptography, incident response, and ethical hacking techniques. The curriculum emphasizes risk management, compliance, and security awareness. Culminating in capstone projects and often incorporating internships, the major readies graduates for roles such as cybersecurity analysts and ethical hackers in our dynamic digital landscape.", "major standing", "pictures\\cybersecurityMajor.png", 4);
INSERT INTO MAJOR VALUES(4,"Artificial Intelligence", "Artificial Intelligence (AI) typically focuses on providing students with a deep understanding of the theories, methodologies, and practical applications of AI technologies. This interdisciplinary field integrates principles from computer science, mathematics, cognitive science, and engineering to create intelligent systems that can analyze data, learn from it, and make informed decisions.", "General Education requirements for an artificial intelligence major usually include courses in mathematics, computer science fundamentals, communication skills, natural sciences, social sciences, humanities, cultural diversity, arts, and statistics. GPA requirements vary, often considering overall GPA of 2.5, core course GPA, and prerequisites. Check university guidelines, and if necessary, consult advisors to enhance your application.", "pictures\\aiMajor.png", 1);
INSERT INTO MAJOR VALUES(5,"Information Technology", "An Information Technology (IT) major provides students with a versatile skill set for navigating the rapidly evolving tech landscape. Focused on the practical application of technology in various domains, the curriculum covers areas such as computer systems, networks, databases, and programming. Students learn to analyze and solve complex problems, manage IT projects, and implement innovative solutions. Emphasis is placed on acquiring proficiency in programming languages, understanding system architectures, and developing skills in network administration.", "major standing", "pictures\\itMajor.png", 2);

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

INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC,CORE_CLASS_FLG) VALUES (1420,"CSI", "Introduction to C Programming and Unix", NULL,'Y');
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC,CORE_CLASS_FLG) VALUES (1320,"CSI", "Introduction to Python Programming and Unix", NULL,'Y');

INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC,CORE_CLASS_FLG) VALUES (2300,"CSI", "Object-Oriented Computing", NULL,'Y');
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC,CORE_CLASS_FLG) VALUES (2310,"CSI", "Data Structures", NULL,'Y');
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC,CORE_CLASS_FLG) VALUES (2490,"CSI", "Introduction to Artificial Intelligence: Representation, Concepts, and Problem Solving", NULL,'Y');
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC,CLASS_CREDITS,CORE_CLASS_FLG) VALUES (2999,"CSI", "Sophomore Project", NULL,2,'Y');
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC,CORE_CLASS_FLG) VALUES (4100,"CSI", "Ethics and Bias in AI", NULL,'Y');
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC,CORE_CLASS_FLG) VALUES (4130,"CSI", "Artificial Intelligence", NULL,'Y');
INSERT INTO CLASS (CLASS_ID,CLASS_GROUP,CLASS_NAME,CLASS_DESC,CORE_CLASS_FLG) VALUES (4140,"CSI", "Deep Learning and Applications", NULL,'Y');


-- BRIDGE --
INSERT INTO BRIDGE VALUES(1,3450);
INSERT INTO BRIDGE VALUES(1,3610);
INSERT INTO BRIDGE VALUES(1,3370);
INSERT INTO BRIDGE VALUES(2,3370);
INSERT INTO BRIDGE VALUES(1,3430);
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


-- PROFESSOR values --
INSERT INTO PROFESSOR VALUES(11,"Angel","Bravo",129,"248-654-4321","angelbravo@school.edu",NULL,NULL,NULL);


-- SECTION values --
INSERT INTO SECTION VALUES(43025,3450,11,'2023-09-07 01:00:00');



