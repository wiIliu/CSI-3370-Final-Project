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
(1200, 'EGR', 'Engineering Graphics and CAD', 1, "An introduction to the techniques for creating solid models of engineering designs. Topics include three-dimensional modeling of parts and assemblies, visualization, orthographic project views and layouts, auxiliary, sectional, and cutout views, exploded views, dimensioning and tolerancing, bill of materials and computer-generated design documentation", "https://ptgmedia.pearsoncmg.com/images/9780138065720/samplepages/9780138065720_Sample.pdf", 'N', NULL),
(1210, 'CSI', 'Problem Solving Using VBA and Excel', 4, "Introduction to problem solving and programming using Excel and VBA. Students will be able to demonstrate knowledge of common Excel functions, and tools like charts and tables, in addition to writing VBA for Excel and one other MS Office application. Automation of tasks will be accomplished through the use of Excel macros, VBA code, and an understanding of programming structures such as loops and decisions, variables and event driven procedures", "https://zlib.pub/book/microsoft-excel-2019-vba-and-macros-236am4s67ld0", 'N', NULL),
(1320, 'CSI', 'Introduction to Python Programming and Unix', 4, "Algorithmic programming using Python. Topics include data storage and manipulation, binary numbers, bitwise operations, control structures, and functions. Introduction to fundamental data structures and script programming. Basic Unix commands and Unix utilities will be covered. With laboratory", "http://tdc-www.harvard.edu/Python.pdf", 'N', NULL),
(1400, 'EGR', 'Computer Problem Solving in Engineering and Computer Science', 4, "General methods of problem solving and principles of algorithmic design using a high-level language such as Visual C#. Introduction to MATLAB. Applications will be drawn from problems in mechanical, electrical and computer engineering and computer science. Offered fall and winter.", "https://ptgmedia.pearsoncmg.com/images/9780138065720/samplepages/9780138065720_Sample.pdf", 'N', NULL),
(1420, 'CSI', 'Introduction to C Programming and Unix', 4, "Topics include binary numbers and C programming concepts such as data types, bitwise operations, control flow, arrays, pointers, structures, and input/output. Basic Unix commands and shell programming are covered, as well as Unix utilities for developing and debugging C programs. With laboratory.", "https://www-personal.acfr.usyd.edu.au/tbailey/ctext/ctext.pdf", 'N', NULL),
(1440, 'CHM', 'General Chemistry I', 4, "States of matter, atomic structure, bonding and molecular structure, chemical reactions. Recommended preparation is three years high school mathematics and one year of high school chemistry.", "https://www.academia.edu/41741225/Chemistry_11th_Edition", 'N', NULL),
(1554, 'MTH', 'Calculus I', 4, "A detailed study of limits, continuity, derivatives of algebraic and transcendental functions, applications of derivatives, numerical techniques, integrals and the Fundamental Theorem of Calculus.", "https://openstax.org/books/calculus-volume-1/pages/1-introduction", 'N', NULL),
(1555, 'MTH', 'Calculus II', 4, "A detailed study of methods of integration, applications of the integrals, improper integrals, sequences, series and power series, polar coordinates and parametric curves.General Education Requirement(s): Satisfies the university general education requirement for the knowledge applications integration area. Prerequisites for knowledge applications: completion of the university general education requirement in the formal reasoning knowledge foundation area.
", "https://www.sfu.ca/~vjungic/Calculus%202/Calculus2.pdf", 'N', NULL),
(1610, 'PHY', 'Fundamentals of Physics I', 4, "Classical mechanics and thermodynamics. For science, mathematics and engineering students. This course has common lectures with PHY 1510. PHY 1610 does not satisfy the university general education requirement in the natural science and technology knowledge exploration area.", "https://zlib.pub/book/fundamentals-of-physics-ii-electromagnetism-optics-and-quantum-mechanics-2704o3ngljm0", 'N', NULL),
(1620, 'PHY', 'Fundamentals of Physics II', 4, "Sound, light, electricity and magnetism. This course has common lectures with PHY 1520. General Education Requirement(s): Satisfies the university general education requirement in the knowledge applications integration area. Prerequisite for knowledge applications integration: completion of the general education requirement in the natural science and technology knowledge exploration area.", "https://zlib.pub/book/fundamentals-of-physics-ii-electromagnetism-optics-and-quantum-mechanics-2704o3ngljm0", 'N', NULL),
(1663, 'APM', 'Mathematics for Information Technology', 4, 'Systems of linear equations, matrix algebra and linear transformations. Elementary combinatorics, recursion and induction, sets and relations. Enrollment is limited to students in the Bachelor of Science in Information Technology program or with permission of the department', "https://archive.org/details/mathematicsforin0000bast", 'N', NULL),
(2005, 'ECE', 'Electric Circuits', 4, "Modeling and analysis of circuits with dependent sources; non-ideal operational amplifiers. Transient and forced responses in RC, RL and RLC circuits. Series and parallel resonant circuits. AC power, three-phase circuits, magnetically coupled circuits. Wye-delta transforms. Introduction to frequency response. Use of PSPICE. With laboratory.","https://www.ibiblio.org/kuphaldt/electricCircuits//DC/DC.pdf", 'N', NULL),
(2221, 'STA', 'Introduction to Statistical Methods ', 4, 'Introduction to statistical thinking and applications to industrial and similar processes. Descriptive statistics, distributions, and probability models useful in process control and systems reliability; confidence intervals, hypothesis testing, regression, and basic experimental design. Statistical concepts to be reinforced with case studies promoting problem solving skills and statistical thinking', "https://www.oreilly.com/library/view/applied-statistics-and/9781118539712/", 'N', NULL),
(2226, 'STA', 'Applied Probability and Statistics', 4, "Introduction to probability and statistics as applied to the physical, biological and social sciences and to engineering. Applications of special distributions and nonparametric techniques. Regression analysis and analysis of variance.
 General Education Requirement(s): Satisfies the university general education requirement in the formal reasoning knowledge foundation area.", "https://www.oreilly.com/library/view/applied-statistics-and/9781118539712/", 'N', NULL),
(2290, 'CSI', 'Introduction to Data Structures in C', 4, "C programming including arrays, structures, and pointers. Basic data structures such as stacks, queues, and lists. Implementation and analysis of fundamental sorting and searching algorithms.", "https://www.cs.bham.ac.uk/~jxb/DSA/dsa.pdf", 'N', NULL),
(2300, 'CSI', 'Object-Oriented Computing', 4, "Introduction to object-oriented computer programming using a high-level programming language such as Java. Classes, member functions, inheritance, polymorphism and operator overloading. Design methodologies and introduction to software engineering principles and practices. Basic data structures, algorithms and event driven programming concepts are introduced. With laboratory.", "https://indico.cern.ch/event/747653/contributions/3092123/attachments/1717042/2770489/cpp_2018_short.pdf", 'N', NULL),
(2310, 'CSI', 'Data Structures', 4, "This course covers data structures using object oriented programming. The fundamental data structures in computer science, including stacks, queues, lists and trees are covered in detail. Concepts of design, analysis and verification are discussed in the context of abstract data types. Examples of applications taken from numeric and symbolic domains are used. With laboratory.", "https://www.cs.bham.ac.uk/~jxb/DSA/dsa.pdf", 'N', NULL),
(2320, 'CSI', 'C++ for Programmers', 2, "A course in C++ programming for programmers with basic knowledge of data types and control structures in programming languages. Topics include pointers, memory management, classes, polymorphism, overloading, templates, input/output, parameter passing, multiple inheritance, standard template library, and philosophical differences in major object-oriented programming languages", "https://ece.engr.uvic.ca/~frodo/cppbook/downloads/exercises_for_programming_in_cpp-2021-04-01.pdf", 'N', NULL),
(2330, 'CSI', 'Immersive Python', 2, "This course introduces the fundamentals and applications of Python. The language fundamentals covered are statements, variables, comments, control structures, functions, modules, packages, and objects. The course also includes advanced concepts such as collections (Lists, Tuples and Dictionaries) with their practical use for Data Processing, Systems administration, and Web development applications.", "https://ptgmedia.pearsoncmg.com/images/9780137619832/samplepages/9780137619832_Sample.pdf", 'N', NULL),
(2340, 'CSI', 'Ruby for Web Developers', 2, "This course introduces the dynamic programming language Ruby – focusing on language fundamentals, debugging and external language binding techniques, and extremely popular web development framework Ruby on the Rail (ROR). The basic ROR topics include discussion of convention over configuration as used by ROR and RESTful web development with practical exercises.", "https://ece.engr.uvic.ca/~frodo/cppbook/downloads/exercises_for_programming_in_cpp-2021-04-01.pdf", 'N', NULL),
(2350, 'CSI', 'Programming in Visual C# for .NET Technology', 2, "This course covers C#.NET for programmers who already have the basic knowledge for object-oriented programming techniques. Topics include: Windows forms, Common Language Run Time (CLR), assemblies, ADO.NET, XML, Web Services, Mobile and Embedded Development.", "https://ptgmedia.pearsoncmg.com/images/9780137619832/samplepages/9780137619832_Sample.pdf", 'N', NULL),
(2400, 'EGR', 'Introduction to Electrical and Computer Engineering', 4, "An introduction to the fundamentals of electrical and computer engineering, DC and AC circuits, digital logic circuits, combinational logic design, sequential circuits, introduction to electronics, operational amplifiers and DC electromechanical machines. With laboratory. Offered fall and winter.", "https://www.csl.cornell.edu/~cbatten/misc/batten-ece-engrg1060-2012.pdf", 'N', NULL),
(2440, 'CSI', 'Computer Systems', 4, "Introduction to computer hardware and operating systems. Hardware topics include processors, GPU’s, memory, secondary storage devices, and other I/O devices and interfaces. Operating systems topics include file systems, memory management, and process management.", "https://ocw.mit.edu/courses/res-6-004-principles-of-computer-system-design-an-introduction-spring-2009/pages/online-textbook/", 'N', NULL),
(2460, 'CSI', 'Fundamentals of Cybersecurity', 4, "This course covers topics relevant to cybersecurity across many disciplines. Discussions include the CIA triad, cryptography and privacy basics, hardware, and software security risks, guiding principles and cybersecurity ethics. In all, eight knowledge areas are explored: Data Security, Software Security, Component Security, Connection Security, Systems Security, Human Security, Organizational Security, and Societal Security.", "https://heimdalsecurity.com/pdf/cyber_security_for_beginners_ebook.pdf", 'N', NULL),
(2470, 'CSI', 'Introduction to Computer Networks', 4, "An introduction to fundamental concepts for design and analyses of computer networks. Topics covered include the physical layer, network protocols, Local Area Networks, Internet, wireless and mobile networks, network security, and socket programming. With laboratory.", "https://intronetworks.cs.luc.edu/current/ComputerNetworks.pdf", 'N', NULL),
(2490, 'CSI', 'Introduction to Artificial Intelligence: Representation, Concepts, and Problem Solving', 4,"This is an introductory course to artificial intelligence that covers fundamental topics in AI, including search, reasoning, knowledge representation, and planning. The goal of this course is to provide an overview of the artificial intelligence field. Through lectures, discussions, and homework assignments, students will learn basic AI concepts and principles.", "https://aima.cs.berkeley.edu", 'N', NULL),
(2500, 'EGR', 'Introduction to Thermal Engineering', 4, "Introduction to the fundamentals of classical thermodynamics and heat transfer, first and second laws of thermodynamics, thermodynamic property relationships;, application to engineering systems and processes, introduction to conduction, convection and radiation, steady 1-D conduction and extended surfaces and lumped capacitance method. Offered fall and winter.", "https://www.academia.edu/10330785/Introduction_to_Thermal_Systems_Engineering", 'N', NULL),
(2555, 'APM', 'Introduction to Differential Equations with Matrix Algebra', 4, "Concepts and methods of discrete mathematics with an emphasis on their application to computer science. Logic and proofs, sets and relations, algorithms, induction and recursion, combinatorics, graphs and trees.", "https://www.academia.edu/10330785/Introduction_to_Thermal_Systems_Engineering", 'N', NULL),
(2600, 'EGR', 'Introduction to Industrial and Systems Engineering', 4, "Overview of industrial and systems engineering: perspectives, tools and models. Indepth coverage of probability and statistics in engineering: density and distribution functions, population and sampling distributions, confidence intervals, hypothesis testing and introduction to discrete-event simulation. Offered fall and winter.", "https://open.umn.edu/opentextbooks/textbooks/892", 'N', NULL),
(2663, 'APM', 'Discrete Mathematics', 4, "Concepts and methods of discrete mathematics with an emphasis on their application to computer science. Logic and proofs, sets and relations, algorithms, induction and recursion, combinatorics, graphs and trees.", "https://open.umn.edu/opentextbooks/textbooks/394", 'N', NULL),
(2700, 'ECE', 'Digital Logic Design', 4, "Boolean algebra; number systems and arithmetic, combinational logic circuits; synchronous sequential circuits; asynchronous sequential circuits; introduction to a hardware description language (HDL). With laboratory", "https://open.umn.edu/opentextbooks/textbooks/892", 'N', NULL),
(2775, 'MTH', 'Linear Algebra', 4, "Study of general vector spaces, linear systems of equations, linear transformations and compositions, Eigenvalues, eigenvectors, diagonalization, modeling and orthogonality. Provides a transition to formal mathematics.", "https://www.math.columbia.edu/department/pinkham/HCP_LinearAlgebra.pdf", 'N', NULL),
(2800, 'EGR', 'Design and Analysis of Electromechanical Systems', 4, "Design, analysis, and testing of electromechanical systems; static equilibrium of particles and rigid bodies; introduction to microprocessors; team design project dealing with technical, economic, safety, environmental, and social aspects of a real-world engineering problem; written, oral and visual communication. With laboratory. Offered fall and winter.", "https://onlinelibrary.wiley.com/doi/pdf/10.1002/9780470411377.fmatter", 'N', NULL),
(2990, 'CSI', 'Introduction to Data Structure C', 4, "C programming including arrays, structures, and pointers. Basic data structures such as stacks, queues, and lists. Implementation and analysis of fundamental sorting and searching algorithms.", "https://www.cs.bham.ac.uk/~jxb/DSA/dsa.pdf", 'N', NULL),
(2999, 'CSI', 'Sophomore Project', 2, "A team-oriented project work consisting of a small project to build skills in needs assessment, group problem solving, and written and oral technical presentations.", NULL, 'N', NULL),
(3100, 'ECE', 'Electronic Circuits and Devices I', 4, "Characteristics and models of nonlinear circuit elements, such as diodes, BJTs and MOSFETs. Analysis and design of circuits employing these devices, including power supplies, voltage regulators, and amplifiers; Biasing and circuit stability issues. Use of Operational amplifiers, discrete circuit elements; and PSPICE software for circuit design is emphasized in the lab. With Laboratory.", "https://logicwork.in/pdf-download-electronic-devices-and-circuits-by-david-a-bell-book-pdf/", 'N', NULL),
(3105, 'ECE', 'Electronic Circuits and Devices II', 4, "Computer-aided engineering, modeling, analysis, design, evaluation and visualization of dynamical and control systems including algorithms for digital logic, filters, controllers and estimators. Microcomputer-based hardware/software implementation of algorithms including data acquisition, signal conditioning and power processing circuits, computer interface and data communications, input and output devices, graphics displays. Model-based rapid prototyping of embedded microcontrollers and PIC processors. Experiments and projects emphasize real-time applications, programming and hardware integration. With laboratory", "https://onlinelibrary.wiley.com/doi/pdf/10.1002/9780470411377.fmatter", 'N', NULL),
(3150, 'CSI', 'Web and Mobile Systems', 4, 'An introduction to web and mobile systems. Development of interactive web systems using front-end technologies such as HTML, CSS and JavaScript during the first half of the semester. A cross platform JavaScript framework, such as React Native along with React Library, for mobile apps development during the second half. Formerly CSI 2520. With laboratory.', "https://www.researchgate.net/publication/268389759_Mobile_systems_Introduction_Chapter", 'N', NULL),
(3204, 'ECE', 'Signals and Systems', 4, "Basic signals, average value, average power and energy. Laplace transform and inverse Laplace transform, and transfer function concept and approach in the analysis of electrical and mechanical lumped-parameter linear systems. Systems modeling and analysis in Laplace and differential equation domains. Natural and forced responses of linear time-invariant systems and concept of convolution. Fourier analysis of signals and systems: Fourier series and Fourier transform, power spectral density, energy spectral density, band width and filters.", "https://logicwork.in/pdf-download-signals-and-systems-by-barry-van-veen-and-simon-haykin-book-pdf/", 'N', NULL),
(3341, 'CRJ', 'Cybercrime', 4, "Overview of cybercrime from a criminal justice perspective. Examines types of computer and cybercrimes, the hacker subculture, cybercrime prevention, information security and investigative methodologies, and the legal and social issues (e.g., jurisdiction, privacy) inherent in detection and control.", "https://www.icsi.edu/media/webmodules/publications/Cyber_Crime_Law_and_Practice.pdf", 'N', NULL),
(3370, 'CSI', 'Software Engineering and Practice', 4, 'Introduction to software engineering and practice. Topics include software process models, project and software management, requirements analysis, architecture modeling, implementation and system integration, quality assurance, and testing.', 'https://moodle.oakland.edu/pluginfile.php/8885924/mod_resource/content/0/book.pdf', 'N', NULL),
(3380, 'CSI', 'Game Design', 4, 'This course teaches modern methods for designing and assessing the design of digital games. The course distinguishes game design from game development. Students learn theory, concepts, and industry best-practices for designing and critically analyzing games. Students apply this understanding to iteratively design their own games with popular game prototyping software.', "https://www.amazon.com/Game-Programming-Computers-Internet-Books/b?node=15375251", 'N', NULL),
(3400, 'BIO', 'Genetics', 4, 'Fundamentals of classical and molecular genetics. Selected topics in human genetics, microbial genetics, biochemical genetics, molecular biology, cytogenetics and genomics. Offered fall and winter semesters.', "https://drive.google.com/file/d/1JEkRrsTlwoyI9aXURx4c8TAeTXoKPsgC/view", 'N', NULL),
(3430, 'APM', 'Theory of Computation', 4, 'Formal models of computation, ranging from finite state automata to Turing machines. Computational models are used to discuss the languages recognized by these machines and address issues of computability.', 'https://drive.uqu.edu.sa/_/mskhayat/files/MySubjects/20189FS%20ComputationTheory/Introduction%20to%20the%20theory%20of%20computation_third%20edition%20-%20Michael%20Sipser.pdf', 'N', NULL),
(3450, 'CSI', 'Database Design and Implementation', 4, 'Introduction to the design, implementation and management of database systems. Topics include planning, designing, and implementing a practical database using a relational database server for an application utilizing entity relationship diagrams, normal forms, and understanding relational database schemas. Advanced topics include concurrency control, query optimization, and introduction to database systems administration', 'https://www.cengage.com/c/database-systems-13e-coronel-morris/9781337627900/', 'N', NULL),
(3480, 'CSI', 'Security and Privacy in Computing', 4, "An introduction to principles and practices of security and privacy. Topics include an introduction to cryptography, host/network exploits and countermeasures, information risk assessment, access control, threat and incident management, information privacy concepts, privacy requirements, privacy-enhancing technologies, information privacy management, and legal and regulatory requirements. With laboratory.", "https://ptgmedia.pearsoncmg.com/images/9780134085043/samplepages/9780134085043.pdf", 'N', NULL),
(3500, 'CSI', 'Human Computer Interaction', 4, 'Surveys various components, techniques of Human Computer Interaction (HCI). Topics include the basic perceptual, cognitive and performance capabilities of people and external factors that affect these capabilities, tools, techniques for understanding, predicting, evaluating the interactions of people with technology. Systematic processes for designing, evaluating and revising interactive systems are studied.',"https://www.interaction-design.org/literature/book/the-encyclopedia-of-human-computer-interaction-2nd-ed", 'N', NULL),
(3610, 'CSI', 'Design and Analysis of Algorithms', 4, 'Computer algorithms, their design and analysis. Strategies constructing algorithmic solutions, including divide-and-conquer, dynamic programming and greedy algorithms. Computational complexity as it pertains to time and space is used to evaluate the algorithms. A general overview of complexity classes is given.', 'https://dahlan.unimal.ac.id/files/ebooks/2009%20Introduction%20to%20Algorithms%20Third%20Ed.pdf', 'N', NULL),
(3620, 'CSI', 'Data Structures and Alogithms', 4, 'Introduction to data abstraction and computer algorithms. The basic data structures in computer science, including stacks, queues, lists, and trees are covered. Core algorithmic concepts including divide-and-conquer, dynamic programming, and greedy and graph algorithms are discussed.', "https://www.cs.princeton.edu/courses/archive/spr11/cos217/lectures/08DsAlg.pdf", 'N', NULL),
(3640, 'CSI', 'Computer Organization', 4, "Introduction to digital logic. Assembly language, addressing modes, RISC and CISC architectures, assemblers, loaders, linkers, arithmetic and logic unit, hardware functional units, input/output organization, memory organization, cache memory, virtual memory, control unit.", "https://csc-knu.github.io/sys-prog/books/Andrew%20S.%20Tanenbaum%20-%20Structured%20Computer%20Organization.pdf", 'N', NULL),
(3660, 'CSI', 'System Administration', 4, "This course teaches the skills necessary to analyze, deploy, manage and troubleshoot Linux servers. Topics include user authentication management, system configuration and management, periodic tasks automation, data backup techniques, server deployments, system maintenance and performance analysis, and security aspects of Linux systems", "https://assets.digitalocean.com/books/making-servers-work-a-practical-guide-to-system-administration.pdf", 'N', NULL),
(3680, 'CSI', 'Script Programming', 4, 'This course provides an in-depth coverage of Python and Unix shell programming to quickly automate various repetitive and complex tasks including those that are used in system administration. The course builds on a good grasp of Unix systems and a solid foundation in high-level programming. ', "https://ptgmedia.pearsoncmg.com/images/9780321832740/samplepages/0321832744.pdf", 'N', NULL),
(3720, 'ECE', 'Microprocessors', 4, "Application of microprocessors and microcomputers to the solution of typical problems, interfacing microprocessors with external systems such as sensors, displays and keyboards; programming considerations, microcomputer system and memory system design.  A laboratory, design course; several short design projects and one large design project. Written report and oral presentation required.", "https://userpages.umbc.edu/~squire/intel_book.pdf", 'N', NULL),
(4100, 'CSI', 'Ethics and Bias in AI', 4, "Real-time embedded system programming, analysis, and optimization using advanced processors such as the Intel Atom. Topics covered include real-time programming, multi-threaded systems, multi-core software development, as well as optimization of processor utilization, speed, and memory requirements.", "https://userpages.umbc.edu/~squire/intel_book.pdf", 'N', NULL),
(4110, 'CSI', 'Foundations of Edge AI', 4, "In this course students will acquire the tools to critically think, read, and write about AI in sociotechnical contexts. They will master the vocabulary and concepts necessary to identify, interrogate, and plan for the ethical implications of AI as a technological, social, and cultural phenomenon", "https://aiindex.stanford.edu/wp-content/uploads/2021/03/2021-AI-Index-Report-_Chapter-5.pdf", 'N', NULL),
(4130, 'CSI', 'Artificial Intelligence', 4, "This course provides an introduction to the fundamental techniques of artificial intelligence for problem solving and inference. Topics include uninformed and informed search, adversarial search, reasoning under uncertainty, knowledge representation, planning, and machine learning models. Individual or group projects on current applications in AI.","https://www.uc.edu/content/dam/uc/ce/docs/OLLI/Page%20Content/ARTIFICIAL%20INTELLIGENCEr.pdf", 'N', NULL),
(4131, 'ECE', 'Electronic Materials and Devices', 4, "Semiconductor materials and device physics; charge carriers and conduction mechanisms, Energy Band Diagrams (EBDs). Theory of metal-semiconductor contacts and junction diodes. Unipolar and bipolar devices: MOSFETs threshold voltage, characteristics, circuit models and regions of operations, bipolar junction transistors and introduction to CMOS with integrated circuit technology, layout and simulation.", "https://electronicmaterials.usask.ca/files/Preface.pdf", 'N', NULL),
(4132, 'ECE', 'VLSIC Design of Digital Chips', 4, "CMOS Very Large Scale Integrated Circuits design methodology for rapid implementation and evaluation. From digital systems level to circuit, device, and processing layout. Combinational and sequential circuit characterization and performance estimation. Inverters, logic, and transmission gates switching characteristics. Reliability and yield. Application Specific ICs design projects using professional CAD tool-suites", "https://users.ece.utexas.edu/~mcdermot/vlsi1/main/lectures/lecture_1.pdf", 'N', NULL),
(4134, 'ECE', 'Fundamentals of MEMS', 4, "Micro-electro-mechanical Systems (MEMS) specifications, MEMS materials, materials mechanics, MEMS fabrication technologies, lumped-element method and MEMS device modeling and dynamics, energy transductions for sensing and actuations, case study on sensors and actuators. Finite element analysis (FEA) for MEMS structural design, with projects", "https://courses.cs.washington.edu/courses/cse466/15au/pdfs/lectures/MEMS%20Sensors.pdf", 'N', NULL),
(4140, 'CSI', 'Deep Learning and Applications', 4, "Introduction to learning, background knowledge for computer vision and natural language processing, linear models for regression and classification, perceptron learning, backpropagation and shallow neural networks, deep learning basics and software frameworks, convolutional neural networks, applications in object detection and semantic segmentation, autoencoders, visualization of learned convolution masks, recurrent neural networks, applications to sequences, generative adversarial networks, reinforcement learning.
","https://www.researchgate.net/publication/320703571_Ian_Goodfellow_Yoshua_Bengio_and_Aaron_Courville_Deep_learning_The_MIT_Press_2016_800_pp_ISBN_0262035618", 'N', NULL),
(4150, 'CSI', 'AI for IT Operations', 4, "This course introduces participants to MLOps tools and best practices for deploying, evaluating, monitoring and operating production ML systems on the Cloud. MLOps is a discipline focused on the deployment, testing, monitoring, and automation of ML systems in production", "https://www.amazon.com/Artificial-Intelligence-Operations-AIOps-Platforms/dp/0655415165", 'N', NULL),
(4160, 'CSI', 'Integrated Computing Systems', 4, "The course integrates various system components such as databases, web servers, user APIs, and cloud technologies and services. Topics include integration of various devices with web servers and cloud services. Students will gain hands-on experience in developing and integrating each of these system components with exposure to appropriate hardware, software, and simulation platforms.", "https://link.springer.com/book/10.1007/978-3-030-81682-7", 'N', NULL),
(4170, 'CSI', 'Machine Learing', 4, "Introduction to recognition and learning; Bayes decision theory; parametric and nonparametric methods including Hidden Markov models; Discriminant functions including support vector machines; Multilayer neural networks; Decision and regression trees for learning; Performance estimation; Unsupervised learning and clustering; Subspace methods; Application.", "https://ai.stanford.edu/~nilsson/MLBOOK.pdf", 'N', NULL),
(4180, 'CSI', 'Natural Language Processing', 4, "This course introduces the linguistic, mathematical, and computational fundamentals of natural language processing: the creation of computer programs that model human languages (e.g., English), enabling applications like automatic text categorization, machine translation, and chatbots. Topics include text preprocessing, language modeling, classification, tagging, parsing, semantics, discourse and dialog analysis, text generation, and the use of modern NLP toolkits. Non-CS majors should have some programming background. ", "https://cseweb.ucsd.edu/~nnakashole/teaching/eisenstein-nov18.pdf", 'N', NULL),
(4181, 'MIS', 'IS Risk Analysis and Security Controls Development', 3, "This course introduces the fundamental concepts and techniques for conducting risk analysis of an information system and, then, developing security controls for the system. The major topics include information assets classification, risk identification, risk assessment, security controls design, security control implementation and maintenance and monitoring. Involves projects.", "https://owasp.org/www-pdf-archive/Jim_Manico_(Hamburg)_-_Securiing_the_SDLC.pdf", 'N', NULL),
(4230, 'CSI', 'Mobile and Smart Phone Application Development', 4, 'This course focuses on mobile application development using underlying frameworks, architecture, design, and implementation. Both classroom theory and hands-on labs enable students to gain in-depth experience in developing real-world mobile applications. Topics include mobile user interface development, mobile application framework components, sensors integration, networking and persistent storage.', "https://www.amazon.com/Mobile-Application-Development-Books/s?k=Mobile+Application+Development+Books", 'N', NULL),
(4240, 'CSI', 'Cloud Computing', 4, "The course explores latest advances in hardware and software, system architecture, and new programming paradigms that are used to develop high-throughput distributed computer systems. Topics covered include computer clusters, virtual machines, automated data centers, cloud platform architectures, service-oriented architectures, cloud programming and software environments, grid computing, and peer-to-peer computing. The course will be supplemented by selected topics from recent technical literature", "https://www.infobooks.org/free-pdf-books/computers/cloud-computing/", 'N', NULL),
(4347, 'APM', 'Mathematics of Cryptology', 4, "Classic cryptosystems (Hill, Vigene’re, one-time-pad), divisibility, modular arithmetic and efficient operations on large integers; practical cryptosystems (AES, RSA, DES), algebra of prime fields, prime factorization, discrete log problem, complexity theory, hash functions, birthday attacks. Modern and future cryptosystems, zero-knowledge proofs, quantum key exchange.", "https://www.cs.umd.edu/~waa/414-F11/IntroToCrypto.pdf", 'N', NULL),
(4350, 'CSI', 'Programming language', 4, "Fundamental concepts in programming languages. Several high-level languages are studied in depth and their approaches to the fundamental issues in language design are compared. Issues include: scanning and parsing, type checking and type inference, control structures, operational semantics, binding times, run-time storage organization, compilation vs interpretation, block structure and scope of names.", "https://vulms.vu.edu.pk/Courses/CS508/Downloads/Concepts%20of%20Programming%20Languages%2011th%20Ed.pdf", 'N', NULL),
(4380, 'CSI', 'Game Programming', 4, 'Introduction to creating games using high-level programming. Materials include 2-D animation with simple graphics, game design patterns such as state machines, and game concepts such as scoring, leveling up, timing and sequencing. Students work in teams to produce a fully functional game by the end of the semester.', "https://www.amazon.com/Game-Programming-Computers-Internet-Books/b?node=15375251", 'N', NULL),
(4430, 'CSI', 'IT Project Management', 4, 'Principles, practices, and tools used in planning and implementing IT projects involving hardware, software, and networks to create a product, service, or result. Using the framework of IT project life cycle, the course covers various aspects of project initiation, planning, scheduling, monitoring, and quality control. Selecting and procuring IT systems, project team management, cost and effort estimation, risk management, and mini-case studies leading to a complex class project', "https://www.academia.edu/1259974/Project_management_a_systems_approach_to_planning_scheduling_and_controlling", 'N', NULL),
(4460, 'CSI', 'Information Security', 4, "Introduction to cryptography and its application to networking and operating system security. Topics covered include secret key and public key cryptographic algorithms, hash functions, authentication, digital signature, digital certificate, key management, email security, web security, SSL/TLS, IP security and wireless security, firewalls, intrusion detection and traceback techniques, security threats and countermeasures, and legal and ethical issues. Independent research on network security is required as student projects. Cross-listed with CSI 5460.", "https://ptgmedia.pearsoncmg.com/images/9780789753250/samplepages/0789753251.pdf", 'N', NULL),
(4480, 'CSI', 'Information Security Pratice', 4, "Introduction to both theoretical and hands-on aspects of vulnerability assessment, penetration testing, and system hardening. Topics include basics of confidentiality, integrity and authentication; footprinting, scanning, assessment and validations of systems and application vulnerabilities; system remediation, implementation of security policies using host and network level firewalls and intrusion detection and prevention system. Cross-listed with CSI 5480. With laboratory.", "https://csrc.nist.gov/csrc/media/publications/sp/800-12/rev-1/draft/documents/sp800_12_r1_draft.pdf", 'N', NULL),
(4500, 'CSI', 'Operating System', 4, "Introduction to the concepts and design of operating systems. Typical topics include: sequential processes, concurrent processes, processor management, memory management, scheduling, file management, and resource protection", "https://codex.cs.yale.edu/avi/os-book/OS10/index.html", 'N', NULL),
(4510, 'CSI', 'Advanced Web Design Application', 4, 'Advanced concepts in web design including protocols for integrating databases and effective information exchange necessary for developing enterprise resource management systems are covered. Evolving technologies and web application development architectures, including multi- tier processing, session management, security, and availability are discussed. The students complete a web application as a part of the course', "https://oceanofpdf.com/authors/matthias-noback/pdf-epub-advanced-web-application-architecture-download/?id=000596748361", 'N', NULL),
(4520, 'CSI', 'Industrial Control Security', 4, 'The course explores latest advances in hardware and software, system architecture, and new programming paradigms that are used to develop high-throughput distributed computer systems. Topics covered include computer clusters, virtual machines, automated data centers, cloud platform architectures, service-oriented architectures, cloud programming and software environments, grid computing, and peer-to-peer computing. The course will be supplemented by selected topics from recent technical literature', "https://gca.isa.org/hubfs/ISAGCA%20Quick%20Start%20Guide%20FINAL.pdf", 'N', NULL),
(4521, 'ECE', 'Automotive Mechatronics I', 4, 'This course focuses on vulnerabilities in digital system design, physical attack detection and prevention, and wireless security for IOT and automotive applications. FPGA based secure systems, cryptographic hardware/chips, Trust Zone, Root Trust, hardware security module, edge lock, crypto service manager, physically unclonable function and secure-core based design are covered.', "https://learnengineering.in/mechatronics-books/", 'N', NULL),
(4550, 'CSI', 'Visual Computing', 4, "This course is a comprehensive introduction to image processing and computer vision in the spatial domain. Topics include digital image fundamentals, intensity transformations, spatial filtering, morphological image processing, and image registration and image segmentation", "https://eprints.bournemouth.ac.uk/35751/1/1-s2.0-S2666629421000115-main.pdf", 'N', NULL),
(4551, 'ECE', 'Human Robot Interaction', 4, "HRI covers design and evaluation of robots interacting with humans. The topics include sensing, autonomy, AI, interaction design, experimental design, and human factors applied to robotics. Students will create effective HRI for all levels of autonomy. HRI applications covered include industrial, service, defense, space, therapy, education, and entertainment, etc", "https://www.cambridge.org/core/books/humanrobot-interaction/2C042DEB4D0ECFFA5485857314E885BC", 'N', NULL),
(4560, 'CSI', 'Mobile Security', 4, "This course provides a general overview of the security and privacy aspects of mobile computing. Topics include, mobile vulnerabilities, mobile malware, smartphone security, secure mobile app development, data privacy, biometrics-, multi-factor-, and codependency-based authentication and vulnerabilities, mobile location privacy, authentication in mobile devices, and secure apps communication.", "https://owasp.org/www-pdf-archive/ASDC12-Mobile_Application_Security_Who_how_and_why.pdf", 'N', NULL),
(4580, 'CSI', 'AI for Cybersecurity and Privacy', 4, 'Study of AI and machine learning algorithms customized for cybersecurity problems such as intrusion detection, malware classification, or network analysis. Topics include fundamentals of machine learning and deep learning, intelligent threat detection, user behavior analytics, machine learning in hacking, privacy-preserving machine learning, adversarial machine learning and countermeasures.', "https://www.researchgate.net/publication/353419449_Artificial_Intelligence_in_Cyber_Security", 'N', NULL),
(4590, 'CSI', 'Multimedia Forensics', 4, 'Introduction to current state-of-the-art digital multimedia (audio, video, images) forgery creation and digital multimedia tamper detection techniques using statistical and AI methodology. Biometric measures and countermeasures, Steganography and covert channel detection. Various aspects of multimedia tampering and analysis and detection will be explored through assignments, labs, and projects.', "w.researchgate.net/publication/353419449_Artificial_Intelligence_in_Cyber_Security", 'N', NULL),
(4600, 'CSI', 'Network Security', 4, "Network Security will provide students a good understanding of different security aspects related to computer networks. Methods of network attacks and ways to defend against them will be discussed. Topics include attacks to different layers, security technologies, link layer security, network layer security, transport layer security and application layer security", "https://crypto.stanford.edu/cs155old/cs155-spring11/lectures/01-intro-thompson.pdf", 'N', NULL),
(4650, 'CSI', 'Paralllel and Distributed Computing', 4, "This course provides an integrated view of the architecture, principles, and programming of parallel and distributed systems. Topics include instruction-level parallelism and its limitations, classification of parallel systems, shared-memory and distributed-memory architectures, distributed storage systems, foundation of parallel algorithms, distributed systems architecture, and programming interfaces for parallel and distributed computing.", "https://gacbe.ac.in/pdf/ematerial/18MCS35E-U1.pdf", 'N', NULL),
(4660, 'CSI', 'Advanced System Administration', 4, "This course provides an integrated view of the architecture, principles, and programming of parallel and distributed systems. Topics include instruction-level parallelism and its limitations, classification of parallel systems, shared-memory and distributed-memory architectures, distributed storage systems, foundation of parallel algorithms, distributed systems architecture, and programming interfaces for parallel and distributed computing.", "https://gacbe.ac.in/pdf/ematerial/18MCS35E-U1.pdf", 'N', NULL),
(4700, 'CSI', 'Software Security', 4, "Introduction to research in foundations of software security. This course surveys common software vulnerabilities, including buffer overflows, format string attacks, cross-site scripting and botnets. The course also discusses common defense mechanisms, including static code analysis, reference monitors, language-based security, secure information flow and others.", "https://www.pearsonhighered.com/assets/samplechapter/0/2/0/1/020172152X.pdf", 'N', NULL),
(4710, 'ECE', 'Computer Hardware Design', 4, "Development of components and techniques needed to design digital circuits and systems for controllers, computers, communication and related applications. Design and analysis of combinational and sequential logic circuits using a hardware description language such as VHDL, timing simulations, test benches and embedded cores. Design of special-purpose processors and their implementation in an FPGA. With laboratory", "https://de.nttdata.com/files/2021-en-wp-automotive-cybersecurity-web1.pdf", 'N', NULL),
(4721, 'ECE', 'Embedded Systems Design', 4, "This course deals with advanced concepts in the programming and the interfacing of modern microprocessors/microcontrollers to the outside world as demonstrated by a variety of application examples. It covers the advanced architecture of modern processors and the many I/O peripherals now commonly found on-board. Laboratory activities provide the student with experience in developing the hardware and software required to incorporate microprocessors into systems that solve real-world interfacing problems.", "https://de.nttdata.com/files/2021-en-wp-automotive-cybersecurity-web1.pdf", 'N', NULL),
(4731, 'ECE', 'Fundamentals of Embedded System Design', 4, 'Introduction to embedded systems. Topics include microcontroller architecture, operating systems and kernels, instructions, firmware, and common embedded applications using analog inputs/outputs, sensor/actuator interfaces, digital signal processing/filtering, communication standards, PID feedback control, and brushless/stepper motor sizing and control. Includes final project involving system specification, trade-off analysis, component design, and performance evaluation', "https://booksite.elsevier.com/samplechapters/9780750677929/9780750677929.PDF", 'N', NULL),
(4740, 'CSI', 'Cyber Laws and Digital Forensics', 4, "This course provides a general overview of the fundamentals of computer forensics, the role of a cyber forensics specialist, computer forensic evidence and introduction of real world problems in collecting and processing digital evidence", "https://crypto.stanford.edu/cs155old/cs155-spring11/lectures/01-intro-thompson.pdf", 'N', NULL),
(4772, 'ECE', 'High Performance Embedded Programming', 4, "Real-time embedded system programming, analysis, and optimization using advanced processors such as the Intel Atom. Topics covered include real-time programming, multi-threaded systems, multi-core software development, as well as optimization of processor utilization, speed, and memory requirements. Crosslisted with ECE 5772.", "https://webpages.charlotte.edu/~jmconrad/ECGR4101Common/Wolf/High%20Perf%20Embed%20Syst.pdf", 'N', NULL),
(4780, 'ECE', 'Embedded Security', 4, 'This course focuses on vulnerabilities in digital system design, physical attack detection and prevention, and wireless security for IOT and automotive applications. FPGA based secure systems, cryptographic hardware/chips, Trust Zone, Root Trust, hardware security module, edge lock, crypto service manager, physically unclonable function and secure-core based design are covered.', "https://webpages.charlotte.edu/~jmconrad/ECGR4101Common/Wolf/High%20Perf%20Embed%20Syst.pdf", 'N', NULL),
(4781, 'CSI', 'Bioinformatics', 4, 'This course covers the fundamental algorithms and computational methods for study of biological sequence data for comparative biology and evolution with the focus on discovery of genome content, function and organization. Specific methodologies covered include the algorithms for searching sequence databases, pair-wise and multiple sequence alignment, phylogenetic methods, and methods for pattern recognition and functional inference from sequence data.', "https://www.ncbi.nlm.nih.gov/books/NBK569562/", 'N', NULL),
(4790, 'CSI', 'Automotive Security', 4, 'Study of key theoretical concepts that emphasize automotive cyber security, assessment of security flaws and threats in vehicles, quality, and risk management of vehicles. Explore different types of cyber-attacks on vehicles from physical to remote, and measures needed to protect vehicles from cyber threats. Real-world case studies will be given as a term project.', "https://de.nttdata.com/files/2021-en-wp-automotive-cybersecurity-web1.pdf", 'N', NULL),
(4810, 'CSI', 'Information Retrieval and Knowledge Discovery', 4, "This course covers the models for information retrieval from text and multimedia databases. Methodologies for database indexing and visualization are discussed. Statistical and deterministic algorithms for discovering knowledge from databases, including, decision trees, clustering, regression, and neural models are covered", "https://assets.cambridge.org/97805218/65715/frontmatter/9780521865715_frontmatter.pdf", 'N', NULL),
(4880, 'CSI', 'Reverse Engineering and Malware Analysis', 4, "Study of software and hardware reverse engineering and malware analysis. Topics include principles of reverse engineering, reverse engineering tools and techniques, sandboxing, simulation methods and instrumentation, anti-reverse engineering techniques, static malware analysis, dynamic analysis, threat analysis, and automated analysis.", "https://ccdcoe.org/uploads/2020/07/Malware_Reverse_Engineering_Handbook.pdf", 'N', NULL),
(4900, 'ECE', 'ST: Embedded Artificial Intelligence', 4, "This course will cover foundations of artificial intelligence (AI) algorithms and methods for implementing them in embedded systems using a microcontroller or custom hardware.  AI topics include neural networks, fuzzy logic, decision trees, clustering, and self-organizing methods in signal and image processing, adaptive controls, and other applications for low-cost mobile applications with limited processing power and battery life.  The theory behind these algorithms, common implementations using computers, and techniques for simplifying calculations for embedded systems will be presented.", "https://booksite.elsevier.com/samplechapters/9780750677929/9780750677929.PDF", 'N', NULL),
(4999, 'CSI', 'Senior Capstone Project', 4, "A team-oriented senior project to synthesize the knowledge and skills gained in the CS/IT curricula. Written and oral reports are required in addition to a working demo.
General Education Requirement(s): Satisfies the university general education requirement for the capstone experience. Satisfies the university general education requirement for a writing intensive course in the major. Prerequisite for writing intensive: completion of the university writing foundation requirement.", NULL, 'N', NULL),
(5760, 'ECE', 'Embedded System Design with FPGAs', 4, "Real-time embedded system programming, analysis, and optimization using advanced processors such as the Intel Atom. Topics covered include real-time programming, multi-threaded systems, multi-core software development, as well as optimization of processor utilization, speed, and memory requirements", "https://www2.deloitte.com/content/dam/Deloitte/us/Documents/alliances/us-nvidia_gpu-accelerated_computing.pdf", 'N', NULL),
(5770, 'ECE', 'GPU Accelerated Computing', 4, "CMOS Very Large Scale Integrated Circuits design methodology for rapid implementation and evaluation. From digital systems level to circuit, device, and processing layout. Combinational and sequential circuit characterization and performance estimation. Inverters, logic, and transmission gates switching characteristics. Reliability and yield. Application Specific ICs design projects using professional CAD tool-suites. With laboratory.", "https://www2.deloitte.com/content/dam/Deloitte/us/Documents/alliances/us-nvidia_gpu-accelerated_computing.pdf", 'N', NULL);




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
(2, 4740, 'N', 'N', 'Y',2),
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


-- INSERT INTO `bridge` (`MJR_ID`, `CLASS_ID`, `CORE_CLASS_FLG`, `ELECTIVE_FLG`, `TRACK_CLASS_FLG`, `TRACK_CLASS_NUM`) VALUES
-- (1, 1554, 'N', 'N', 'N',NULL),
-- (1, 1555, 'N', 'N', 'N',NULL),
-- (1, 2226, 'N', 'N', 'N',NULL),
-- (1, 2663, 'N', 'N', 'N',NULL),
-- (1, 2775, 'N', 'N', 'N',NULL),
-- (1, 1420, 'Y', 'N', 'N',NULL),
-- (1, 2300, 'Y', 'N', 'N',NULL),
-- (1, 2310, 'Y', 'N', 'N',NULL),
-- (1, 2470, 'Y', 'N', 'N',NULL),
-- (1, 2999, 'Y', 'N', 'N',NULL),
-- (1, 3150, 'N', 'N', 'Y',4),
-- (1, 3370, 'Y', 'N', 'N',NULL),
-- (1, 3430, 'Y', 'N', 'N',NULL),
-- (1, 3450, 'Y', 'N', 'N',NULL),
-- (1, 3480, 'Y', 'N', 'N',NULL),
-- (1, 3610, 'Y', 'N', 'N',NULL),
-- (1, 3640, 'Y', 'N', 'N',NULL),
-- (1, 3660, 'N', 'N', 'Y',2),
-- (1, 4130, 'N', 'N', 'Y',1),
-- (1, 4140, 'N', 'N', 'Y',1),
-- (1, 4160, 'N', 'N', 'Y',4),
-- (1, 4170, 'N', 'N', 'Y',1),
-- (1, 4180, 'N', 'N', 'Y',1),
-- (1, 4347, 'N', 'N', 'Y',3),
-- (1, 4350, 'Y', 'N', 'N',NULL),
-- (1, 4460, 'N', 'N', 'Y',3),
-- (1, 4480, 'N', 'N', 'Y',3),
-- (1, 4500, 'Y', 'N', 'N',NULL),
-- (1, 4510, 'N', 'N', 'Y',4),
-- (1, 4550, 'N', 'N', 'Y',1),
-- (1, 4650, 'Y', 'N', 'N',NULL),
-- (1, 4660, 'N', 'N', 'Y',2),
-- (1, 4700, 'N', 'N', 'Y',3),
-- (1, 4810, 'N', 'N', 'Y',1),
-- (1, 4999, 'Y', 'N', 'N',NULL),    -- CE --
-- (2, 1200, 'Y', 'N', 'N',NULL),
-- (2, 1400, 'Y', 'N', 'N',NULL),
-- (2, 1440, 'N', 'N', 'N',NULL),
-- (2, 1554, 'N', 'N', 'N',NULL),
-- (2, 1555, 'N', 'N', 'N',NULL),
-- (2, 1610, 'N', 'N', 'N',NULL),
-- (2, 1620, 'N', 'N', 'N',NULL),
-- (2, 2005, 'Y', 'N', 'N',NULL),
-- (2, 2400, 'Y', 'N', 'N',NULL),
-- (2, 2500, 'Y', 'N', 'N',NULL),
-- (2, 2555, 'N', 'N', 'N',NULL),
-- (2, 2600, 'Y', 'N', 'N',NULL),
-- (2, 2290, 'Y', 'N', 'N',NULL),
-- (2, 2663, 'N', 'N', 'N',NULL),
-- (2, 2700, 'Y', 'N', 'N',NULL),
-- (2, 2800, 'Y', 'N', 'N',NULL),
-- (2, 3100, 'Y', 'N', 'N',NULL),
-- (2, 3105, 'N', 'N', 'Y',3),
-- (2, 3204, 'Y', 'N', 'N',NULL),
-- (2, 3720, 'Y', 'N', 'N',NULL),
-- (2, 4110, 'N', 'N', 'Y',2),
-- (2, 4130, 'N', 'N', 'Y',2),
-- (2, 4131, 'N', 'N', 'Y',3),
-- (2, 4132, 'N', 'N', 'Y',3),
-- (2, 4134, 'N', 'N', 'Y',3),
-- (2, 4160, 'N', 'N', 'Y',2),
-- (2, 4551, 'N', 'N', 'Y',2),
-- (2, 4710, 'Y', 'N', 'N',NULL),
-- (2, 4721, 'Y', 'N', 'N',NULL),
-- (2, 4740, 'N', 'N', 'Y',2),
-- (2, 4772, 'N', 'N', 'Y',1),
-- (2, 4999, 'Y', 'N', 'N',NULL),
-- (2, 5760, 'N', 'N', 'Y',1),
-- (2, 5770, 'N', 'N', 'Y',1),
-- (3, 1420, 'Y', 'N', 'N',NULL),
-- (3, 1554, 'N', 'N', 'N',NULL),
-- (3, 1555, 'N', 'N', 'N',NULL),
-- (3, 2226, 'N', 'N', 'N',NULL),
-- (3, 2300, 'Y', 'N', 'N',NULL),
-- (3, 2440, 'Y', 'N', 'N',NULL),
-- (3, 2460, 'Y', 'N', 'N',NULL),
-- (3, 2470, 'Y', 'N', 'N',NULL),
-- (3, 2663, 'N', 'N', 'N',NULL),
-- (3, 2999, 'Y', 'N', 'N',NULL),
-- (3, 3341, 'Y', 'N', 'N',NULL),
-- (3, 3370, 'Y', 'N', 'N',NULL),
-- (3, 3450, 'Y', 'N', 'N',NULL),
-- (3, 3660, 'Y', 'N', 'N',NULL),
-- (3, 4130, 'N', 'N', 'Y',2),
-- (3, 4181, 'Y', 'N', 'N',NULL),
-- (3, 4240, 'Y', 'N', 'N',NULL),
-- (3, 4480, 'Y', 'N', 'N',NULL),
-- (3, 4520, 'N', 'N', 'Y',3),
-- (3, 4560, 'N', 'N', 'Y',1),
-- (3, 4580, 'N', 'N', 'Y',2),
-- (3, 4590, 'N', 'N', 'Y',2),
-- (3, 4600, 'Y', 'N', 'N',NULL),
-- (3, 4700, 'Y', 'N', 'N',NULL),
-- (3, 4731, 'N', 'N', 'Y',3),
-- (3, 4740, 'Y', 'N', 'N',NULL),
-- (3, 4780, 'N', 'N', 'Y',3),
-- (3, 4790, 'N', 'N', 'Y ',3),
-- (3, 4880, 'N', 'N', 'Y',1),
-- (3, 4999, 'Y', 'N', 'N',NULL),-- AI ---------------------- (4, 1320, 'Y', 'N', 'N',NULL), --ADD NOTE INSTEAD
-- (4, 1420, 'Y', 'N', 'N',NULL),
-- (4, 1554, 'N', 'N', 'N',NULL),
-- (4, 1555, 'N', 'N', 'N',NULL),
-- (4, 2226, 'N', 'N', 'N',NULL),
-- (4, 2300, 'Y', 'N', 'N',NULL),
-- (4, 2310, 'Y', 'N', 'N',NULL),
-- (4, 2490, 'Y', 'N', 'N',NULL),
-- (4, 2663, 'N', 'N', 'N',NULL),
-- (4, 2775, 'N', 'N', 'N',NULL),
-- (4, 2999, 'Y', 'N', 'N',NULL),
-- (4, 3370, 'Y', 'N', 'N',NULL),
-- (4, 3430, 'Y', 'N', 'N',NULL),
-- (4, 3610, 'Y', 'N', 'N',NULL),
-- (4, 4100, 'Y', 'N', 'N',NULL),
-- (4, 4110, 'N', 'N', 'Y', 1),-- (4, 4110, 'N', 'N', 'Y', 2), -- ADD NOTE INSTEAD
-- (4, 4130, 'Y', 'N', 'N',NULL),
-- (4, 4140, 'Y', 'N', 'N',NULL),
-- (4, 4150, 'Y', 'N', 'N',NULL),
-- (4, 4170, 'Y', 'N', 'N',NULL),
-- (4, 4180, 'Y', 'N', 'N',NULL),
-- (4, 4230, 'N', 'N', 'Y', 1),
-- (4, 4240, 'N', 'N', 'Y', 1),
-- (4, 4521, 'N', 'N', 'Y', 2),
-- (4, 4731, 'N', 'N', 'Y', 2),
-- (4, 4900, 'N', 'N', 'Y', 2),
-- (4, 2320, 'N', 'Y', 'N',NULL),
-- (4, 2330, 'N', 'Y', 'N',NULL),
-- (4, 2340, 'N', 'Y', 'N',NULL),
-- (4, 2350, 'N', 'Y', 'N',NULL),
-- (5, 1210, 'Y', 'N', 'N',NULL),
-- (5, 1320, 'Y', 'N', 'N',NULL),
-- (5, 1554, 'N', 'N', 'N',NULL),
-- (5, 1663, 'N', 'N', 'N',NULL),
-- (5, 2221, 'N', 'N', 'N',NULL),
-- (5, 2300, 'Y', 'N', 'N',NULL),
-- (5, 2440, 'Y', 'N', 'N',NULL),
-- (5, 2470, 'Y', 'N', 'N',NULL),
-- (5, 2999, 'Y', 'N', 'N',NULL),
-- (5, 3150, 'Y', 'N', 'N',NULL),
-- (5, 3370, 'Y', 'N', 'N',NULL),
-- (5, 3380, 'N', 'N', 'Y',3),
-- (5, 3400, 'N', 'N', 'Y',2),
-- (5, 3450, 'Y', 'N', 'N',NULL),
-- (5, 3480, 'Y', 'N', 'N',NULL),
-- (5, 3500, 'Y', 'N', 'N',NULL),
-- (5, 3620, 'Y', 'N', 'N',NULL),
-- (5, 3660, 'Y', 'N', 'N',NULL),
-- (5, 3680, 'N', 'N', 'Y',1),
-- (5, 4160, 'Y', 'N', 'N',NULL),
-- (5, 4380, 'N', 'N', 'Y',3),
-- (5, 4430, 'Y', 'N', 'N',NULL),
-- (5, 4460, 'N', 'N', 'Y',4),
-- (5, 4480, 'N', 'N', 'Y',4),
-- (5, 4660, 'N', 'N', 'Y',1),
-- (5, 4700, 'N', 'N', 'Y',4),
-- (5, 4781, 'N', 'N', 'Y',2),
-- (5, 4999, 'Y', 'N', 'N',NULL);

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
INSERT INTO SECTION VALUES(43213,1555,14,'2023-09-07 03:00:00','W24');
-- Professor Xuemei Li
INSERT INTO SECTION VALUES(45093,1200,38, '2024-01-06 10:00:00', 'W24');
INSERT INTO SECTION VALUES(45123,1210,38, '2024-01-06 8:00:00', 'W24');
INSERT INTO SECTION VALUES(45122,1320,38, '2024-01-06 10:00:00', 'W24');
INSERT INTO SECTION VALUES(45111,1400,38, '2024-01-06 2:00:00', 'W24');
INSERT INTO SECTION VALUES(45132,1420,38, '2024-01-06 10:00:00', 'W24');

-- Professor Tony Shaska
INSERT INTO SECTION VALUES(45461,1440,71,'2024-01-08 10:00:00','W24');
INSERT INTO SECTION VALUES(45462,1554,71,'2024-01-08 05:00:00','W24');
INSERT INTO SECTION VALUES(45463,1610,71,'2024-01-08 06:00:00','W24');
INSERT INTO SECTION VALUES(45464,1620,71,'2024-01-08 08:00:00','W24');
INSERT INTO SECTION VALUES(45465,1663,71,'2024-01-08 03:00:00','W24');
INSERT INTO SECTION VALUES(45466,2005,71,'2024-01-06 1:00:00','W24');
INSERT INTO SECTION VALUES(45467,2226,71,'2024-01-06 09:00:00','W24');
INSERT INTO SECTION VALUES(45468,2221,71,'2024-01-06 07:00:00','W24');
INSERT INTO SECTION VALUES(45469,2290,71,'2024-01-06 04:00:00','W24');

-- Professor Nghia Tran
INSERT INTO SECTION VALUES(46221,2300,80,'2024-01-06 1:00:00','W24');
INSERT INTO SECTION VALUES(46222,2310,80,'2024-01-06 2:00:00','W24');
INSERT INTO SECTION VALUES(46223,2320,80,'2024-01-06 3:00:00','W24');
INSERT INTO SECTION VALUES(46224,2330,80,'2024-01-06 4:00:00','W24');
INSERT INTO SECTION VALUES(46225,2340,80,'2024-01-06 5:00:00','W24');
INSERT INTO SECTION VALUES(46226,2350,80,'2024-01-06 6:00:00','W24');
INSERT INTO SECTION VALUES(46227,2400,80,'2024-01-06 7:00:00','W24');
INSERT INTO SECTION VALUES(46228,2440,80,'2024-01-06 8:00:00','W24');
INSERT INTO SECTION VALUES(46229,2460,80,'2024-01-06 9:00:00','W24');
INSERT INTO SECTION VALUES(46210,2470,80,'2024-01-06 10:00:00','W24');

-- Professor Julian Rrushi
INSERT INTO SECTION VALUES(43211,2490,14,'2024-01-06 01:00:00','W24');
INSERT INTO SECTION VALUES(43212,2500,14,'2024-01-06 02:00:00','W24');
INSERT INTO SECTION VALUES(43298,2663,14,'2024-01-06 03:00:00','W24');
INSERT INTO SECTION VALUES(43214,2700,14,'2024-01-06 04:00:00','W24');
INSERT INTO SECTION VALUES(43215,2775,14,'2024-01-06 05:00:00','W24');
INSERT INTO SECTION VALUES(43216,2800,14,'2024-01-06 06:00:00','W24');
INSERT INTO SECTION VALUES(43217,2990,14,'2024-01-06 07:00:00','W24');
INSERT INTO SECTION VALUES(43218,2999,14,'2024-01-06 08:00:00','W24');
INSERT INTO SECTION VALUES(43219,3100,14,'2024-01-06 09:00:00','W24');
INSERT INTO SECTION VALUES(43210,3105,14,'2024-01-06 10:00:00','W24');
-- Professor Eddie Cheng
INSERT INTO SECTION VALUES(43401,3150,15,'2024-01-07 01:00:00','W24');
INSERT INTO SECTION VALUES(43402,3204,15,'2024-01-07 02:00:00','W24');
INSERT INTO SECTION VALUES(43403,3341,15,'2024-01-07 03:00:00','W24');
INSERT INTO SECTION VALUES(43404,3370,15,'2024-01-07 04:00:00','W24');
INSERT INTO SECTION VALUES(43405,3380,15,'2024-01-07 05:00:00','W24');
INSERT INTO SECTION VALUES(43406,3400,15,'2024-01-07 06:00:00','W24');
INSERT INTO SECTION VALUES(43407,3430,15,'2024-01-07 07:00:00','W24');
INSERT INTO SECTION VALUES(43408,3610,15,'2024-01-07 08:00:00','W24');
INSERT INTO SECTION VALUES(43409,3480,15,'2024-01-07 09:00:00','W24');
INSERT INTO SECTION VALUES(43410,3500,15,'2024-01-07 10:00:00','W24');
INSERT INTO SECTION VALUES(43411,3620,15,'2024-01-07 12:00:00','W24');

-- Professor Anyi Liu
INSERT INTO SECTION VALUES(43581,3640,17,'2024-01-07 01:00:00','W24');
INSERT INTO SECTION VALUES(43582,3660,17,'2024-01-07 02:00:00','W24');
INSERT INTO SECTION VALUES(43583,3680,17,'2024-01-07 03:00:00','W24');
INSERT INTO SECTION VALUES(43584,3720,17,'2024-01-07 04:00:00','W24');
INSERT INTO SECTION VALUES(43585,4100,17,'2024-01-07 05:00:00','W24');
INSERT INTO SECTION VALUES(43586,4110,17,'2024-01-07 06:00:00','W24');
INSERT INTO SECTION VALUES(43587,4130,17,'2024-01-07 07:00:00','W24');
INSERT INTO SECTION VALUES(43588,4131,17,'2024-01-07 08:00:00','W24');
INSERT INTO SECTION VALUES(43589,4132,17,'2024-01-07 09:00:00','W24');
INSERT INTO SECTION VALUES(43510,4134,17,'2024-01-07 10:00:00','W24');
INSERT INTO SECTION VALUES(43511,4140,17,'2024-01-07 12:00:00','W24');
-- Professor Hua Ming
INSERT INTO SECTION VALUES(43771,4150,18,'2024-01-06 01:00:00','W24');
INSERT INTO SECTION VALUES(43772,4160,18,'2024-01-06 02:00:00','W24');
INSERT INTO SECTION VALUES(43773,4170,18,'2024-01-06 03:00:00','W24');
INSERT INTO SECTION VALUES(43774,4180,18,'2024-01-06 04:00:00','W24');
INSERT INTO SECTION VALUES(43775,4181,18,'2024-01-06 05:00:00','W24');
INSERT INTO SECTION VALUES(43776,4230,18,'2024-01-06 06:00:00','W24');
INSERT INTO SECTION VALUES(43777,4240,18,'2024-01-06 07:00:00','W24');
INSERT INTO SECTION VALUES(43778,4347,18,'2024-01-06 08:00:00','W24');
INSERT INTO SECTION VALUES(43779,4350,18,'2024-01-06 10:00:00','W24');
-- Professor Tianle Ma
INSERT INTO SECTION VALUES(43965,4380,21,'2024-01-07 1:00:00','W24');
INSERT INTO SECTION VALUES(43961,4430,21,'2024-01-07 2:00:00','W24');
INSERT INTO SECTION VALUES(43962,4460,21,'2024-01-07 3:00:00','W24');
INSERT INTO SECTION VALUES(43963,4480,21,'2024-01-07 4:00:00','W24');
INSERT INTO SECTION VALUES(43964,4500,21,'2024-01-07 5:00:00','W24');

-- Professor Matthew Toeniskoetter
INSERT INTO SECTION VALUES(44153,4510,22,'2024-01-07 3:00:00','W24');
INSERT INTO SECTION VALUES(44151,4520,22,'2024-01-07 3:00:00','W24');
INSERT INTO SECTION VALUES(44152,4521,22,'2024-01-07 3:00:00','W24');
INSERT INTO SECTION VALUES(44155,4550,22,'2024-01-07 3:00:00','W24');
INSERT INTO SECTION VALUES(44154,4551,22,'2024-01-07 3:00:00','W24');

-- Professor Guangzhi Qu
INSERT INTO SECTION VALUES(44341, 4560, 27, '2024-01-07 1:00:00', 'W24');
INSERT INTO SECTION VALUES(44343, 4780, 27, '2024-01-07 3:00:00', 'W24');
INSERT INTO SECTION VALUES(44344, 4781, 27, '2024-01-07 4:00:00', 'W24');
INSERT INTO SECTION VALUES(44347, 4790, 27, '2024-01-07 6:00:00', 'W24');
-- Professor Ishwar Sethi
INSERT INTO SECTION VALUES(44529, 4580, 29, '2024-01-07 1:00:00', 'W24');
INSERT INTO SECTION VALUES(44521, 4810, 29, '2024-01-07 3:00:00', 'W24');
INSERT INTO SECTION VALUES(44522, 4880, 29, '2024-01-07 4:00:00', 'W24');
INSERT INTO SECTION VALUES(44549, 4900, 29, '2024-01-07 5:00:00', 'W24');
-- Professor Mohammad-Reza Siadat
INSERT INTO SECTION VALUES(44717, 4590, 34, '2024-09-07 2:00:00', 'W24');
INSERT INTO SECTION VALUES(44711, 4999, 34, '2024-09-07 8:00:00', 'W24');
INSERT INTO SECTION VALUES(44712, 5760, 34, '2024-09-07 1:00:00', 'W24');
INSERT INTO SECTION VALUES(44713, 5770, 34, '2024-09-07 9:00:00', 'W24');
-- Professor Hadeel Mohammed Jawad
INSERT INTO SECTION VALUES(44905, 4660, 36, '2024-09-07 21:00:00', 'W24');
-- Professor Wajdi Aljedaani
INSERT INTO SECTION VALUES(45281, 4700, 41, '2024-09-08 01:00:00', 'W24');
-- Professor Jorge Mello
INSERT INTO SECTION VALUES(45657, 4710, 72, '2024-09-08 05:00:00', 'W24');
-- Professor Harvey Qu
INSERT INTO SECTION VALUES(45845, 4721, 77, '2024-09-08 07:00:00', 'W24');
-- Professor JD Nir
INSERT INTO SECTION VALUES(46033, 4731, 79, '2024-09-08 09:00:00', 'W24');
INSERT INTO SECTION VALUES(46031, 4740, 79, '2024-09-08 08:00:00', 'W24');
INSERT INTO SECTION VALUES(46032, 4772, 79, '2024-09-08 05:00:00', 'W24');




