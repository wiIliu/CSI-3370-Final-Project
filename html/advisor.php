<?php
include("../advisorQuery.php");


?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>MyDegree.com</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <link rel="stylesheet" href="../css/Navbar.css">
    <!-- <link rel="stylesheet" type="text/css" href="../css/main.css" /> -->

    <link rel="shortcut icon" href="../pictures/mydegreeFavicon.png" type="image/x-icon" />

</head>


<body class="bg-light">

    <div class="banner">

        <nav class="navbar navbar-expand-md sticky-top bg-light">
            <!-- SITE LOGO -->
            <div id="logoContainer my-auto py-auto position-absolute top-0 start-0">
                <a class="ms-3 navbar-brand" href="../index.html">
                    <img src="../pictures/mydegreeLogo.png" width="150" height="55" alt="mydegree logo" class="d-inline-block">
                </a>
            </div>
            <!-- Collapsed navbar toggler button -->
            <!-- <button class="navbar-toggler ms-auto" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button> -->
            <!-- NAVBAR LINKS -->
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav nav">
                    <li class="nav-item"><a class="nav-link fw-medium" href="../index.html">HOME</a></li>
                    <li class="nav-item"><a class="nav-link fw-medium" href="majorPage.php">MAJOR</a>
                        <ul class="dropdown">
                            <li><a class="mx-0" href="AI.php">Artificial Intelligence</a></li>
                            <li><a class="mx-0" href="CompSci.php">Computer Science</a></li>
                            <li><a class="mx-0" href="ComputerEngineering.html">Computer Engineering</a></li>
                            <li><a class="mx-0" href="IT.html">Information Technology</a></li>
                            <li><a class="mx-0" href="Cybersecurity.html">Cybersecurity</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="career.html">CAREER</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">CONTACT</a></li>
                </ul>
            </div>

        </nav>

        <div class="container-fluid">
            <!-- confirmation notice page? with back button to home or smth -->
            <form action="" method="get" class="form-validate-input">


            </form>

        </div>

    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>

</html>