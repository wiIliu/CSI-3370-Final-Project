<?php
include("../majorQuery.php");
$filePaths = array("CompSci.php", "ComputerEngineering.php", "Cybersecurity.php", "AI.php", "IT.php");
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


<body>

  <div class="banner">

    <nav class="navbar navbar-expand-md sticky-top" style="background-color: #584a4a;">
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
          <li class="nav-item"><a class="nav-link fw-medium" href="#">MAJOR</a>
            <ul class="dropdown">
              <li><a class="mx-0" href="AI.php">Artificial Intelligence</a></li>
              <li><a class="mx-0" href="CompSci.php">Computer Science</a></li>
              <li><a class="mx-0" href="ComputerEngineering.php">Computer Engineering</a></li>
              <li><a class="mx-0" href="IT.php">Information Technology</a></li>
              <li><a class="mx-0" href="Cybersecurity.php">Cybersecurity</a></li>
            </ul>
          </li>
          <li class="nav-item"><a class="nav-link" href="appointment.php">ADVISOR</a></li>
          <li class="nav-item"><a class="nav-link" href="career.html">CAREER</a></li>
        </ul>
      </div>

    </nav>

    <div class="container-fluid">

      <div class="row jumbotron text-center">
        <h1>Mydegree</h1>
        <p>Oakland University Engineering Program</p>
      </div>

      <!--description of each major-->
      <div class="row justify-content-center mt-3">

        <?php
        $n = 0;
        while ($row = mysqli_fetch_array($filterResult)) :
        ?>
          <div class="col-11 col-lg-4 col-md-6 my-1">

            <div class="card text-evenly bg-light h-100">
              <img src="<?php echo "../" . $row[2]; ?>" class="card-img-top img-fluid" alt="...">
              <div class="card-body d-flex text-center align-items-bottom flex-column mb-3">
                <h4 class="card-title fw-medium"><?php echo $row[1]; ?></h4>
                <p class="card-text my-auto"><?php echo $row[3]; ?></p>
                <a href="<?php echo $filePaths[$n]; ?>" class="btn btn-md btn-outline-light mt-auto fw-semibold">Program Overview</a>
              </div>
            </div>

          </div>
          <?php $n++; ?>
        <?php endwhile; ?>

      </div> <!-- row -->

    </div> <!-- container-fluid banner -->

</body>

</html>