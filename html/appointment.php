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

    <link rel="shortcut icon" href="../pictures/mydegreeFavicon.png" type="image/x-icon" />

</head>

<!-- ^\d{3}?[-]\d{3}[-]\d{4}$ -->

<body class="bg-light">

    <div class="banner">
        <!-- NAVBAR -->
        <nav class="navbar navbar-expand-md sticky-top bg-light">
            <div class="container-fluid position-relative">
                <!-- SITE LOGO -->
                <div id="logoContainer my-auto py-auto position-absolute top-0 start-0">
                    <a class="ms-3 navbar-brand" href="../index.html">
                        <img src="../pictures/mydegreeLogo.png" width="150" height="55" alt="mydegree logo" class="d-inline-block">
                    </a>
                </div>
                <!-- COLLAPSED NAVBAR TOGGLER BUTTON -->
                <button class="navbar-toggler mt-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!-- NAVBAR LINKS -->
                <div class="collapse navbar-collapse justify-content-end pt-2 me-5 pe-5" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link fw-semibold fs-5 pe-2" href="../index.html">HOME</a></li>
                        <!-- DROPDOWN MAJOR -->
                        <li class="nav-item dropdown pe-2">
                            <div class="btn-group">
                                <a class="nav-link fw-semibold fs-5 pe-0 me-0" href="majorPage.php" id="dropdownMenuLink">MAJOR</a>
                                <button type="button" class="px-1 mx-0 btn dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false"></button>
                                <!-- DROPDOWN LINKS -->
                                <ul class="dropdown-menu" data-bs-theme="dark" style="background-color: #073352;   border-radius: 8px; top: 35px; padding: 1em 0;" aria-labelledby="dropdownMenuLink">
                                    <li><a class="dropdown-item py-1 mx-0" href="AI.php">Artificial Intelligence</a></li>
                                    <li><a class="dropdown-item pb-1 mx-0" href="CompSci.php">Computer Science</a></li>
                                    <li><a class="dropdown-item pb-1 mx-0" href="ComputerEngineering.php">Computer Engineering</a></li>
                                    <li><a class="dropdown-item pb-1 mx-0" href="IT.php">Information Technology</a></li>
                                    <li><a class="dropdown-item pb-1 mx-0" href="Cybersecurity.php">Cybersecurity</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item"><a class="nav-link fw-semibold fs-5 pe-2" href="#">ADVISOR</a></li>
                        <li class="nav-item"><a class="nav-link fw-semibold fs-5 pe-3" href="career.html">CAREER</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="mx-5">
                <div class="mt-5">

                    <!-- <p class="fw-bolder">How can I contact my Academic Adviser?</p> -->
                    <h4>How can I contact my Academic Adviser?</h4>
                    <p class="text-start lh-lg">Connect with us during an appointment, chat, or email:
                        Schedule an in-person appointment : https://oakland.trac.cloud
                        Connect with us through SECS Chat! Our academic advisers will be available to answer your questions
                        on the Google Chat from 11 a.m. - 12:00 p.m. and 2:30 p.m. - 3:30 p.m. You might be wondering when
                        classes begin for the next semester, or the last day to withdraw from a class, or how to find a tutor.
                        Any question is a good question.</p>

                </div>



            </div>


            <div class="row justify-content-center mt-3 pt-5">
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
                            </div>
                        </div>
                        <br>
                        <!-- PHONE -->
                        <div class="col-md-3 position-relative">
                            <label for="student_phone" class="form-label">Phone Number</label>
                            <input type="tel" class="form-control" title="Enter 10-digit phone number in the form of xxx-xxx-xxxx" id="student_phone" name="student_phone" pattern="[0-9]{3}[-][0-9]{3}[-][0-9]{4}" placeholder="xxx-xxx-xxxx" required>
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
                            <button class="btn text-light" style="background-color: #073352;" type="submit" name="makeAppt" value="submit">Submit form</button>
                        </div>
                    </form>
                </div>


            </div>
        </div>

    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function() {
            $('.dropdown').hover(function() {
                $(this).addClass('show');
                $(this).find('.dropdown-menu').addClass('show');
            }, function() {
                $(this).removeClass('show');
                $(this).find('.dropdown-menu').removeClass('show');
            });
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>

</html>