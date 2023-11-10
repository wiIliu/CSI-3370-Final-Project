<?php 
  include("../classQuery.php");
  $classes = getMajorData(1);
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>MyDegree.com</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="../css/style.css" />
  <link rel="stylesheet" href="../css/Navbar.css">

  <link rel="shortcut icon" href="../pictures/mydegreeFavicon.png" type="image/x-icon" />
</head>

<body class="">
  <div class="container-fluid banner">
    <div class="row">
      <div class="col-md-12">
        <nav class="navbar navbar-md">
          <!-- SITE LOGO -->
          <div id="logoContainer my-auto py-auto position-absolute top-0 start-0">
            <a class="navbar-brand" href="../index.html">
              <img src="../pictures/mydegreeLogo.png" width="200" height="80" alt="mydegree logo" class="d-inline-block">
            </a>
          </div>
          <!-- NAVBAR LINKS -->
          <ul class="nav">
            <li class="nav-item">
              <a class="nav-link" href="../index.html">HOME</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../major.php">MAJOR</a>
              <ul class="dropdown">
                <li><a href="AI.html">Artificial Intelligence</a></li>
                <li><a href="#">Computer Science</a></li>
                <li><a href="ComputerEngineering.html">Computer Engineering</a></li>
                <li><a href="IT.html">Information Technology</a></li>
                <li><a href="Cybersecurity.html">Cybersecurity</a></li>
              </ul>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="career.html">CAREER</a>

            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">CONTACT</a>
            </li>
          </ul>
        </nav>
      </div>
    </div> <!--end of row div-->


    <div class="row justify-content-left mt-5 ms-5 ps-4">
      <?php while($row = mysqli_fetch_array($classes)):?>
        <div class="mb-3">
          <input class="form-check-input" type="checkbox" id="class_<?php echo $row[0];?>" value="">
          <span class="text-dark"></span>
            <a class="fs-6 text-dark" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample<?php echo $row[0];?>" aria-expanded="false" aria-controls="collapseExample">
              &nbsp;&nbsp;&nbsp;<?php echo $row[1]." ".$row[0];?>&nbsp;&nbsp;<code>&#8212;</code>&nbsp;&nbsp;<span class="text-decoration-underline"><strong><?php echo $row[2]; ?></strong></span><br>
            </a>
          </span>
          <div class="ms-4 collapse" id="collapseExample<?php echo $row[0];?>">
            <div class="mt-3 card card-body bg-secondary text-light" style="width: 600px">
              <?php echo $row[3] ?>
            </div>
            <br>
          </div>

        </div>
      <?php endwhile; ?>
    </div>
    <br>
    <br>
    <br>
    <br>


  </div>


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
    crossorigin="anonymous"></script>
</body>

</html>