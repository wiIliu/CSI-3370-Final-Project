<?php
include("../appointmentQuery.php");
date_default_timezone_set('America/Detroit');
$currentDate = date("Y-m-d");
$currentTime = date("H:i");
$current = date("H:i:s d.m.y");

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

    <style>
        input+span {
            padding-right: 30px;
            padding-top: 5px;
            padding-left: 5px;
        }

        input:invalid+span::after {
            position: absolute;
            content: "✖";
            padding-left: 5px;
            color: #8b0000;
        }

        input:valid+span::after {
            position: absolute;
            content: "✓";
            padding-left: 5px;
            color: #009000;
        }
    </style>

</head>

<!-- ^\d{3}?[-]\d{3}[-]\d{4}$ -->

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
                            <li><a class="mx-0" href="ComputerEngineering.php">Computer Engineering</a></li>
                            <li><a class="mx-0" href="IT.php">Information Technology</a></li>
                            <li><a class="mx-0" href="Cybersecurity.php">Cybersecurity</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="#">ADVISOR</a></li>
                    <li class="nav-item"><a class="nav-link" href="career.html">CAREER</a></li>
                </ul>
            </div>

        </nav>

        <div class="container-fluid">

            <div class="row justify-content-center mt-5 pt-5">
                <div class="col-9">

                    <form onsubmit="alert('Appointment Scheduled');" action="#" id="makeAppt" method="post" class="g-3 row needs-validation m-5 justify-content-center">

                        <!-- FIRST NAME -->
                        <div class="col-md-4">
                            <label for="student_fname" class="form-label">First name</label>
                            <input type="text" class="form-control" id="student_fname" name="student_fname" required>

                        </div>
                        <!-- LAST NAME -->
                        <div class="col-md-4">
                            <label for="student_lname" class="form-label">Last name</label>
                            <input type="text" class="form-control" id="student_lname" name="student_lname" required>
                        </div>
                        <!-- G-ID -->
                        <div class="col-auto">
                            <label for="student_gid" class="form-label">G-ID</label>
                            <div class="input-group">
                                <div class="input-group-text">G</div>
                                <input type="number" class="form-control" id="student_gid" title="Enter the 8 digits following the 'G' in your Grizz ID" name="student_gid" pattern="[0-9]{8}" maxlength="8" minlength="8" placeholder="xxxxxxxx" required>
                                <span class="validity"></span>
                            </div>
                        </div>
                        <br>
                        <!-- PHONE -->
                        <div class="col-md-3 position-relative">
                            <label for="student_phone" class="form-label">Phone Number</label>
                            <input type="tel" class="form-control" title="Enter 10-digit phone number in the form of xxx-xxx-xxxx" id="student_phone" name="student_phone" pattern="[0-9]{3}[-][0-9]{3}[-][0-9]{4}" placeholder="xxx-xxx-xxxx" required>
                            <!-- <span class="validity"></span> -->
                            <div class="valid-tooltip">
                                Looks good!
                            </div>
                            <div class="invalid-tooltip">
                                Enter a valid phone number of the form xxx-xxx-xxxx
                            </div>
                        </div>
                        <!-- EMAIL -->
                        <div class="col-md-4">
                            <label for="student_email" class="form-label">Email Address</label>
                            <input type="email" class="form-control" title="Enter a valid email address" id="student_email" name="student_email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required>
                        </div>
                        <!-- TIME -->
                        <div class="col-auto"> <!-- Could split this between 2 different inputs...date then time & time could be a dropdown of all times that day available. rendered by a sql statement from the db (how to get date data in time then?) -->
                            <label for="appt_start_date_time" class="form-label">Time of Appointment</label>
                            <input type="datetime-local" class="form-control" rows="3" id="appt_start_date_time" min="<?php echo date('Y-m-d', strtotime($currentDate . ' + 1 days')) . 'T' . $currentTime; ?>" max="2024-04-20T16:00" name="appt_start_date_time" required>
                        </div>
                        <!-- ADVISOR -->
                        <div class="col-md-4">
                            <select class="form-select" aria-label="Advisor select" title="Select an adivosr" name="advisor">
                                <option selected>Choose an advisor</option>
                                <option value="1">Kate - Artificial Intelligence</option>
                                <option value="2">Will - Information Technology</option>
                                <option value="3">Charles - Computer Science</option>
                                <option value="4">Michael - Cybersecurity</option>
                                <option value="5">Jasmine - Computer Engineering</option>
                            </select>
                        </div>
                        <!-- REASON -->
                        <div class="col-md-6">
                            <label for="student_reason" class="form-label">Reason for Appointment</label>
                            <textarea class="form-control" spellcheck="true" title="State reason for making appointment" placeholder="Limit 255 characters" id="student_reason" name="student_reason" maxlength="255" required></textarea>
                        </div>
                        <!-- SUBMIT -->
                        <div class="col-4">
                            <button class="btn btn-primary" type="submit" name="makeAppt" value="submit">Submit form</button>
                        </div>
                    </form>
                </div>


            </div>
        </div>

    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>

</html>