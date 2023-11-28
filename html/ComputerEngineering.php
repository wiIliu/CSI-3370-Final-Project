<?php
include("../classQuery.php");
$classes = getClassData(2);
$admissionsData = getAdmissionsData(2);
$admissions = $admissionsData[0];
$desc = $admissionsData[1];
$advisor = getAdvisor(2);
?>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>MyDegree.com</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" 
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="../css/style.css" />
  <link rel="stylesheet" href="../css/Navbar.css">
  <link rel="stylesheet" type="text/css" href="../css/main.css" />

  <link rel="shortcut icon" href="../pictures/mydegreeFavicon.png" type="image/x-icon" />

</head>


<body class="bg-light" onload="updateProgress()">

  <div class="banner">
    <!-- NAVBAR -->
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
              <li><a class="mx-0" href="#">Computer Engineering</a></li>
              <li><a class="mx-0" href="IT.php">Information Technology</a></li>
              <li><a class="mx-0" href="Cybersecurity.php">Cybersecurity</a></li>
            </ul>
          </li>
          <li class="nav-item"><a class="nav-link" href="appointment.php">ADVISOR</a></li>
          <li class="nav-item"><a class="nav-link" href="#">CONTACT</a></li>
        </ul>
      </div>

    </nav>

    <div class="container-fluid">
    <!-- MAJOR TITLE AND DESC -->
    <div class="row m-5 mb-3 p-2">
        <h1 class="mb-3 pb-1 fw-semibold text-center">Computer Engineering, B.S.</h1>
        <h5 class="py-1"><strong>Program Description:</strong><br></h5>
        <p style="font-size: 1.15em;"><?php echo $desc; ?>
        <span class=><br><br>Advisor for Computer Engineering —— <?php echo $advisor; ?></span>
        </p>
      </div>
      <!-- MAJOR REQUIREMNETS -->
      <div class="row mx-5 my-3 p-2">
        <h3 class="mb-1 pb-1 text-decoration-underline">Major Requirements</h3>
        <h5 class="pb-1 pt-2"><strong>General Education Requirements:</strong></h5>
        <p class="" style="font-size: 1.15em;"><?php echo $admissions; ?><br></p>
      </div>
      <!-- PROGRESS BAR -->
      <div class="row justify-content-center">
        <div class="col-6">
          <p class='text-center mb-2 fw-semibold'>Degree Completion</p>
          <div class="progress" style="height:20px;">
            <div id="progressBar" class="progress-bar" role="progressbar" style="background:#010161;" aria-label="progress bar fill" aria-valuenow="" aria-valuemin="0" aria-valuemax="100"></div>
          </div>
        </div>
      </div>
      <!-- RESET PROGRESS BAR BUTTON -->
      <div class="row justify-content-center mt-3">
        <div class="col-1">
          <button class="btn btn-sm text-light" style="background-color:#010161;" type="button" onclick="reset()">RESET</button>
        </div>
      </div>
      <!-- COURSES LIST -->
      <div class="row justify-content-left mt-2 ms-5 ps-4">
        <h3 class="text-decoration-underline">Course List:</h3>
        <?php
        $count = 0;
        while ($row = mysqli_fetch_array($classes)) :
          // TITLE SENTENCES
          if ($count == 0) {
            echo "<h5 class='mb-3 mt-4 fw-semibold'>Mathematics and Statistics (20 credits)&nbsp;
            <span><button class='btn btn-sm text-light' style='background-color:#010161;' type='button' onclick='selectAllMath()'>Select All</button></span></h5><br>";
          } else if ($count == 5 and $row[5] == 'Y') {
            echo "<h5 class='mb-3 mt-4 fw-semibold'>Artificial Intelligence Core (18 credits)&nbsp;
            <span><button class='btn btn-sm text-light' style='background-color:#010161;' type='button' onclick='selectAllCore()'>Select All</button></span></h5><br>";
          } else if ($count == 11 and $row[5] == 'Y') {
            echo "<h5 class='mb-3 mt-4 fw-semibold'>Required professional subjects (24 credits)<br></h5>";
          }
        ?>
          <div class="mb-3">
            <!-- CHECK BOXES -->
            <?php if($count < 5){ ?>
              <span><input onclick="updateProgress()" class="math" type="checkbox" id="class_<?php echo $row[0]; ?>" value="1"></span>
            <?php } else if ($count < 11){ ?>
              <span><input onclick="updateProgress()" class="core" type="checkbox" id="class_<?php echo $row[0]; ?>" value="1"></span>
            <?php } else if ($count >= 11) { ?>
            <span><input onclick="updateProgress()" class="last" type="checkbox" id="class_<?php echo $row[0]; ?>" value="1"></span>
            <?php } else { ?>
              <span>
              <input onclick="updateProgress()" type="checkbox" id="class_<?php echo $row[0]; ?>" value="1">
            </span>
            <?php } ?>
            <!-- COURSE GROUP-NUMBER-NAME -->
            <span class="text-dark">
              <a class="fs-6 text-dark" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample<?php echo $row[0]; ?>" aria-expanded="false" aria-controls="collapseExample">
                &nbsp;&nbsp;&nbsp;<?php echo $row[1] . "&nbsp;" . $row[0]; ?>&nbsp;&nbsp;<code>&#8212;</code>&nbsp;&nbsp;
                <span class="text-decoration-underline"><strong><?php echo $row[2]; ?></strong></span>
                &nbsp;(<?php echo $row[4] ?>)<br>
              </a>
            </span>
            <!-- CLASS INFO -->
            <div class="ms-4 collapse" id="collapseExample<?php echo $row[0]; ?>">
              <div class="mt-3 card card-body bg-secondary text-light" style="width: 600px">
                <!-- CLASS DESC -->
                <?php echo $row[3] ?><br><br>
                <!-- SECTION LIST -->
                <?php
                $sections = getSections($row[0]);
                if (mysqli_num_rows($sections)) {
                  while ($section = mysqli_fetch_array($sections)) : ?>
                    <p>
                      <?php echo $section[0] . " —— " . $section[5] . " " . $section[4]; 
                      $prof = getProfData($section[1]);
                      ?>
                      <!-- PROFESSORS -->
                      <span><a href="" data-bs-target="#profPopup" data-bs-toggle="modal" data-bs-pID="<?php echo $prof[0]; ?>" data-bs-pFname="<?php echo $prof[1]; ?>" data-bs-pLname="<?php echo $prof[2]; ?>" data-bs-pOffice="<?php echo $prof[3]; ?>" data-bs-pPhone="<?php echo $prof[4]; ?>" data-bs-pEmail="<?php echo $prof[5]; ?>" data-bs-pBackground="<?php echo $prof[6]; ?>" data-bs-pRating="<?php echo $prof[7]; ?>" data-bs-pRLink="<?php echo $prof[8]; ?>">&nbsp;<?php echo $section[2] . "&nbsp;" . $section[3]; ?></a></span>
                    </p>
                <?php endwhile;
                } else {
                  echo "NO OFFERED SECTIONS";
                } ?>
                <!-- TEXTBOOK -->
                <a href="<?php echo $row[6]; ?>" class="link-light text-decoration-underline link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover" target="_blank">Textbook link here.</a>
              </div>
              <br>
            </div>
          </div>

          <?php $count++; ?>
        <?php endwhile; ?>
        <div class="go"></div>
      </div> <!-- End course row div -->

      <!-- CAREER -->
      <div class="row m-5 p-2">
        <h5 class="pb-1 pt-2"><strong>Career Paths:</strong></h5>
        <!-- <p class="" style="font-size: 1.15em;"><//?php echo $careers; ?><br></p> -->
      </div>

      <!-- PROF POPUP -->
      <div class="modal fade text-light" id="profPopup" tabindex="-1" data-bs-theme="dark" aria-labelledby="professorPopup" aria-hidden="true" style="white-space: pre-line;">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="">About</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body">
              <p class="text-light" id="mainSpace"></p>
            </div>

            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div> <!-- End prof popup -->

    </div> <!-- End of container-fluid div -->

  </div>



  <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
  <!-- PROF POPUP SCRIPT -->
  <script>
    const profPopup = document.getElementById('profPopup');
    if (profPopup) {
      profPopup.addEventListener('show.bs.modal', event => {
        // link that triggered the modal
        const link = event.relatedTarget;
        // Extract info from data-bs-* attributes
        const profId = link.getAttribute('data-bs-pID');
        const fName = link.getAttribute('data-bs-pFname');
        const lName = link.getAttribute('data-bs-pLname');
        const office = link.getAttribute('data-bs-pOffice');
        const phone = link.getAttribute('data-bs-pPhone');
        const email = link.getAttribute('data-bs-pEmail');
        const background = link.getAttribute('data-bs-pBackground');
        const rating = link.getAttribute('data-bs-pRating');
        const ratingLink = link.getAttribute('data-bs-pRLink');
        // Update the modal's content.
        const modalTitle = profPopup.querySelector('.modal-title');
        const modalBody = profPopup.querySelector("#mainSpace");

        modalTitle.textContent = `About Professor ${fName} ${lName}`;
        modalBody.textContent = `Phone: ${phone}\tEmail: ${email}\tOffice Number:${office}
           ${background}
           ${rating} \t ${ratingLink}`;
      });
    }
  </script>
  <!-- PROGRESS BAR SCRIPT -->
  <script>
    function updateProgress() {
      var numAll = $('input[type="checkbox"]').length;
      var numChecked = $('input[type="checkbox"]:checked').length;
      var lastBoxes = $('.last:input[type="checkbox"]').length;
      var lastChecked = $('.last:input[type="checkbox"]:checked').length;
      numAll -= lastBoxes;
      numChecked-=lastChecked
      if (numAll > 0) {
        var perc = (numChecked / numAll) * 100;
        $('.progress-bar').css('width', perc + '%').attr('aria-valuenow', perc);
        document.getElementById("progressBar").innerHTML = perc.toFixed(1) + '%';
      }
    }

    function selectAllMath() {
      $('.math:input[type=checkbox]').prop('checked', true);
      updateProgress();
    }

    function selectAllCore() {
      $('.core:input[type=checkbox]').prop('checked', true);
      updateProgress();
    }

    function reset() {
      $('input[type=checkbox]').prop('checked', false);
      updateProgress();
    }
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" 
  integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>

</html>