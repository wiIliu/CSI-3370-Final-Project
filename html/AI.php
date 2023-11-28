<?php
include("../classQuery.php");
$classes = getClassData(4);
$adminData = getAdminData(4);

$admin = $adminData[0];
$desc = $adminData[1];
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
  <link rel="stylesheet" type="text/css" href="../css/main.css" />

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
              <li><a class="mx-0" href="#">Artificial Intelligence</a></li>
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

      <div class="row m-5 p-2">
        <h1 class="mb-3 pb-1 fw-semibold text-center">Artificial Intelligence, B.S.</h1>
        <h5 class="pb-1"><strong>Program description:</strong><br></h5>
        <p style="font-size: 1.15em;"><?php echo $desc; ?></p>
      </div>

      <div class="row m-5 p-2">
        <h3 class="mb-1 pb-1 text-decoration-underline">Major Requirements</h3>
        <h5 class="pb-1 pt-2"><strong>General Education requirements:</strong></h5>
        <p class="" style="font-size: 1.15em;"><?php echo $admin; ?><br></p>
      </div>
      <div class="row justify-content-left mt-5 ms-5 ps-4">
        <h3 class="text-decoration-underline">Course list:</h3>
        <?php
        $count = 0;
        while ($row = mysqli_fetch_array($classes)) :
          if ($count == 0) {
            echo "<h5 class='mb- mt-4 fw-semibold'>Mathematics and Statistics (20 credits)<br></h5>";
          } else if ($count == 5 and $row[5] == 'Y') {
            echo "<h5 class='mb-3 mt-4 fw-semibold'>Artificial Intelligence Core (18 credits)<br></h5>";
          } else if ($count == 11 and $row[5] == 'Y') {
            echo "<h5 class='mb-3 mt-4 fw-semibold'>Required professional subjects (24 credits)<br></h5>";
          }else if ($count == 11 and $row[5] == 'Y') {
            echo "<h5 class='mb-3 mt-4 fw-semibold'>professional Elective (24 credits)<br></h5>";
          }
        ?>
          <div class="mb-3">
            <input class="form-check-input" type="checkbox" id="class_<?php echo $row[0]; ?>" value="">
            <span class="text-dark">
              <a class="fs-6 text-dark" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample<?php echo $row[0]; ?>" aria-expanded="false" aria-controls="collapseExample">
                &nbsp;&nbsp;&nbsp;<?php echo $row[1] . " " . $row[0]; ?>&nbsp;&nbsp;<code>&#8212;</code>&nbsp;&nbsp;<span class="text-decoration-underline"><strong><?php echo $row[2]; ?></strong></span>&nbsp;(<?php echo $row[4] ?>)<br>
              </a>
            </span>
            <div class="ms-4 collapse" id="collapseExample<?php echo $row[0]; ?>">
              <div class="mt-3 card card-body bg-secondary text-light" style="width: 600px">
                <?php echo $row[3] ?>
              </div>
              <br>
            </div>
          </div>
          
    </div>

          <?php $count++; ?>
        <?php endwhile; ?>
      </div>
      <br>
      <br>
      <br>
      <br>

    </div>
    <div class="row justify-content-left mt-5 ms-5 ps-4">
              <h2>Artificial Intelligence Job and Careers <br></h2>
              <p>Artificial Intelligence is a broad and dynamic field that offers a wide range of jobs and careers across various industries.<br> Here are some common computer science jobs and career paths:</p>
              <ul class="list-group">
              <ol>
              <li>Machine learning Engineer</li>
              <li>Data Scientist</li>
              <li>Al research Scientist</li>
              <li>Information Security</li>
              <li>Computer vision engineer</li>
              <li>Robotics engineer</li>
            </ol>
    </ul>
  </div>


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>

</html>
