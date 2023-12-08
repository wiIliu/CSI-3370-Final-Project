<?php
session_start();
include("../majorQuery.php");
$filePaths = array("1"=>"CompSci.php", "2"=>"ComputerEngineering.php", "3"=>"Cybersecurity.php", "4"=>"AI.php", "5"=>"IT.php");
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
  <link rel="stylesheet" type="text/css" href="../css/main.css" />

  <link rel="shortcut icon" href="../pictures/mydegreeFavicon.png" type="image/x-icon" />

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

</head>

<body data-bs-theme="light">

  <div class="backgroundPic">
    <div class="blur">
      <div class="banner">

        <!-- NAVBAR -->
        <nav class="navbar navbar-expand-md" data-bs-theme="dark">
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
            <div class="collapse navbar-collapse justify-content-end pt-0 me-5 pe-5" id="navbarNav">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link fw-semibold fs-5 pe-2" href="../index.html">HOME</a></li>
                <!-- DROPDOWN MAJOR -->
                <li class="nav-item dropdown pe-2">
                  <div class="btn-group">
                    <a class="nav-link fw-semibold fs-5 pe-0 me-0" href="#" id="dropdownMenuLink">MAJOR</a>
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
                <li class="nav-item"><a class="nav-link fw-semibold fs-5 pe-2" href="appointment.php">ADVISOR</a></li>
                <li class="nav-item"><a class="nav-link fw-semibold fs-5 pe-3" href="career.html">CAREER</a></li>
              </ul>
            </div>
          </div>
        </nav>


        <div class="container-fluid">
          <!-- TITLE -->
          <div class="row jumbotron text-center mt-3">
            <h1>Mydegree</h1>
            <p class="my-2">Oakland University Engineering Program</p>
          </div>

          <!-- FILTERS -->
          <div class="row justify-content-center m-5 gb-3">
            <div class="col-9">
              <form action="" method="GET" class="row justify-content-center align-items-center mb-3">
                <!-- ADVISOR FILTER -->
                <div class="col-3">
                  <label for="advisor" class="form-label text-light">Advisor</label>
                  <select class="form-select" aria-label="Advisor select" title="Select an adivosr" name="advisor">
                    <option value="" id="defaultA" disabled hidden>Filter for an Advisor</option>
                    <option id='1' value="1">Kate Smith</option>
                    <option id='2' value="2">Will Woodz</option>
                    <option id='3' value="3">Charles Harry</option>
                    <option id='4' value="4">Michael Kim</option>
                    <option id='5' value="5">Jasmine Farmer</option>
                  </select>
                </div>
                <!-- CLASS FILTER -->
                <div class="col-4">
                    <label for="class" class="form-label text-light">Class</label>
                    <select class="form-select" name="class" data-placeholder="Choose one thing" id="diffSelect">
                      <option value="" id='defaultC' disabled hidden selected></option>
                      <option></option>
                      <?php while ($class = mysqli_fetch_array($listResult)) : ?>
                        <option id="<?php echo $class[1]; ?>" value='<?php echo $class[1]; ?>'><?php echo $class[0]; ?>&nbsp;<?php echo $class[1]; ?>&nbsp;<?php echo $class[2]; ?></option>";
                      <?php endwhile; ?>
                    </select>
                </div>
                <!-- SUBMIT --> <!-- RESET -->
                <div class="col-3 mt-2">
                  <button class="btn text-light me-2 mt-4 btn-outline-light" style="background-color: #073352;" type="submit" name="submit" value="submit">Submit</button>
                  <button class="btn text-light ms-2 mt-4 btn-outline-light" style="background-color: #073352;" type="submit" name="reset" value="reset">Reset</button>
                </div>

              </form>
            </div>
          </div> <!-- end of filters div -->

          <!-- CLASS CARDS -->
          <div class="row justify-content-center mt-3 blur2">
            <?php
            while ($row = mysqli_fetch_array($filterResult)) :
              $n = $row[0];
            ?>
              <div class="col-11 col-lg-4 col-md-6 my-1">
                <!-- INDIVIDUAL CARD -->
                <div class="card text-evenly bg-light h-100">
                  <!-- MAJOR PIC -->
                  <img src="<?php echo "../" . $row[2]; ?>" class="card-img-top img-fluid" alt="...">
                  <!-- MAJOR TEXT -->
                  <div class="card-body d-flex text-center align-items-bottom flex-column mb-3">
                    <h4 class="card-title fw-medium me-5"><?php echo $row[1]; ?></h4>
                    <p class="card-text my-auto"><?php echo $row[3]; ?></p>
                    <!-- PROGRAM BUTTON -->
                    <a href="<?php echo $filePaths[$n]; ?>" 
                      class="btn btn-md btn-outline-light align-self-center mt-2 fw-semibold">Program Overview</a>
                  </div>
                </div>

              </div>
            <?php endwhile; ?>
          </div> <!-- row -->

        </div> <!-- end of container-fluid div -->
      </div> <!-- end of banner div -->
    </div> <!-- end of blur div -->
  </div> <!-- end of backgroundPic div -->


  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
  <script>
    $(document).ready(function() {
      $('.dropdown').hover(function() {
        $(this).addClass('show');
        $(this).find('.dropdown-menu').addClass('show');
      }, function() {
        $(this).removeClass('show');
        $(this).find('.dropdown-menu').removeClass('show');
      });
        $('#diffSelect').select2({
        theme: "bootstrap-5",
        width: $(this).data('width') ? $(this).data('width') : $(this).hasClass('w-100') ? '100%' : 'style',
        placeholder: $(this).data('placeholder'),
      });
      var advis = "<?php echo $a; ?>";
      $("#" + advis).attr({
        "selected": true
      });
    });
  </script>
</body>

</html>