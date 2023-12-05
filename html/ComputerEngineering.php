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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="../css/style.css" />

  <link rel="shortcut icon" href="../pictures/mydegreeFavicon.png" type="image/x-icon" />
</head>

<body class="bg-light" onload="updateProgress()">

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
                  <li><a class="dropdown-item pb-1 mx-0" href="#">Computer Engineering</a></li>
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
            <div id="progressBar" class="progress-bar" role="progressbar" style="background:#073352;" aria-label="progress bar fill" aria-valuenow="" aria-valuemin="0" aria-valuemax="100"></div>
          </div>
        </div>
      </div>
      <!-- RESET PROGRESS BAR BUTTON -->
      <div class="row justify-content-center mt-3">
        <div class="col-1">
          <button class="btn btn-sm text-light" style="background-color:#073352;" type="button" onclick="reset()">RESET</button>
        </div>
      </div>
      <!-- COURSES LIST -->
      <div class="row justify-content-left mt-2 ms-5 ps-4">
        <h3 class="text-decoration-underline">Course List (100 Credits):</h3>
        <?php
        $count = 0;
        while ($row = mysqli_fetch_array($classes)) :
          // TITLE SENTENCES
          if ($count == 0) {
            echo "<h5 class='mb-3 mt-4 fw-semibold'>Mathematics and Statistics (28 credits)&nbsp;
            <span><button class='btn btn-sm text-light' style='background-color:#073352;' type='button' onclick='selectAllMath()'>Select All</button></span></h5><br>";
          } else if ($count == 7) {
            echo "<h5 class='mb-3 mt-4 fw-semibold'>Computer Engineering Core (36 credits)&nbsp;
            <span><button class='btn btn-sm text-light' style='background-color:#073352;' type='button' onclick='selectAllCore()'>Select All</button></span></h5><br>";
          } else if ($count == 16) {
            echo "<h5 class='mb-3 mt-4 fw-semibold'>Required Professional Subjects (24 credits)&nbsp;
            <span><button class='btn btn-sm text-light' style='background-color:#073352;' type='button' onclick='selectAllProfessional()'>Select All</button></span></h5><br>";
          } else if ($count == 22) {
            echo "<h5 class='mb-3 mt-4 fw-semibold'>Professional Track - Choose 1 Track (12 credits)<br></h5>
            <span class='fw-semibold pb-2 mb-1' style='font-size: 1.08em;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;High Performance Computing Area Track:</span>";
          } else if ($count == 25) {
            echo "<span class='fw-semibold pb-2 my-1' style='font-size: 1.08em;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Embedded AI Area Track:</span>";
          } else if ($count == 30) {
            echo "<span class='fw-semibold pb-2 my-1' style='font-size: 1.08em;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Microelectronics Track:</span>";
          }
        ?>
          <div class="mb-3">
            <!-- CHECK BOXES -->
            <?php if ($count < 7) { ?>
              <span><input onclick="updateProgress(); addToStorage('class_<?php echo $row[0]; ?>')" class="math" type="checkbox" id="class_<?php echo $row[0]; ?>" value="1"></span>

            <?php } else if ($count < 16) { ?>
              <span><input onclick="updateProgress(); addToStorage('class_<?php echo $row[0]; ?>')" class="core" type="checkbox" id="class_<?php echo $row[0]; ?>" value="1"></span>

            <?php } else if ($count < 22) { ?>
              <span><input onclick="updateProgress(); addToStorage('class_<?php echo $row[0]; ?>')" class="professional" type="checkbox" id="class_<?php echo $row[0]; ?>" value="1"></span>

            <?php } else { ?>
              <span><input onclick="updateProgress(); addToStorage('class_<?php echo $row[0]; ?>')" class="track" type="checkbox" id="class_<?php echo $row[0]; ?>" value="1"></span>
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
            <div class="mt-3 card card-body text-dark border border-light" style="width: 600px; background-color: #d6d8de;">
                <!-- CLASS DESC -->
                <span class="fw-semibold">Class Description: <br></span>
                <?php echo $row[3] ?><br><br>
                <!-- TEXTBOOK -->
                <?php if($row[5] != null){
                  echo "<a href='$row[5]' class='text-decoration-underline link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover' style='color:#073352;' target='_blank'>Textbook Link</a>";
                } ?>
                
                <!-- SECTION LIST -->
                <?php
                $sections = getSections($row[0]);
                if (mysqli_num_rows($sections)) {
                  while ($section = mysqli_fetch_array($sections)) : ?>
                    <p><span class="fw-semibold"><br>Class Sections: <br></span>
                      <?php echo $section[0] . "&nbsp;&nbsp;&nbsp; —— " . "&nbsp;&nbsp;&nbsp;Start Date:&nbsp;&nbsp;" . $section[4]."&nbsp;&nbsp;&nbsp;Professor:";
                      $prof = getProfData($section[1]);
                      ?>
                      <!-- PROFESSORS -->
                      <span >&nbsp;<a style="color:#073352" href="" class="text-decoration-underline"
                          data-bs-target="#profPopup" 
                          data-bs-toggle="modal" 
                          data-bs-pID="<?php echo $prof[0]; ?>" 
                          data-bs-pFname="<?php echo $prof[1]; ?>" 
                          data-bs-pLname="<?php echo $prof[2]; ?>" 
                          data-bs-pOffice="<?php echo $prof[3]; ?>" 
                          data-bs-pEmail="<?php echo $prof[4]; ?>" 
                          data-bs-pBackground="<?php echo $prof[5]; ?>" 
                          data-bs-pRating="<?php echo $prof[6]; ?>" 
                          data-bs-pRLink="<?php echo $prof[7]; ?>"><?php echo $section[2] . "&nbsp;" . $section[3]; ?></a>
                      </span>
                    </p>
                <?php endwhile;
                } else {
                  echo "NO OFFERED SECTIONS";
                } ?>

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
        <h5 class="pb-1 pt-2"><strong>Computer Engineering Jobs and Careers:</strong></h5>
        <p>Computer engineering is a broad and dynamic field that offers a wide range of jobs and careers across various industries.<br>Here are some common computer engineering job and career paths:</p>
        <ul class="list-group">
          <ol>
            <li>Hardware Engineer</li>
            <li>Firmware Programmer</li>
            <li>Embedded Systems Design</li>
            <li>Computer Circuit Design</li>
            <li>Computer Programmer</li>
            <li>Energy-Efficient Computing</li>
            <li>Embedded Controls Engineer</li>
            <li>Autonomous Vehicles Engineer</li>
            <li>Medical Devices Engineer</li>
          </ol>
      </div>

       <!-- PROF POPUP -->
       <div class="modal fade text-dark" id="profPopup" tabindex="-1" data-bs-theme="dark" 
          aria-labelledby="professorPopup" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
          <div class="modal-content bg-light">
            <div class="modal-header justify-content-center">
              <h1 class="modal-title fs-5" id="">About</h1>
            </div>

            <div class="modal-body">
              <p class="text-dark">Email:&nbsp;&nbsp;<span id="mainSpace-email"></span>
                <br>Office Number:&nbsp;&nbsp;<span id="mainSpace-office"></span>
              </p>
              <p class="text-dark" id="mainSpace-background" style="text-indent: 7%;"></p>
              <p class="text-dark">Overall Rating:&nbsp;&nbsp;<span id="mainSpace-rating"></span><br>
                <a href="" id="modalLink" class="text-decoration-underline" target="_blank" style="color:#073352;"></a>
              </p>
            </div>

            <div class="modal-footer">
              <button type="button" class="btn btn-outline-dark text-light" style="background-color:#073352;" data-bs-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div> <!-- End prof popup -->

    </div> <!-- End of container-fluid div -->

  </div>

  
  <script>
    window.onload = function() {
      var keys = allStorage();
      for (var key of keys) {
        box = document.getElementById(key)
        if (box != null) {
          box.checked = true;
        }
      }
      updateProgress()
    }

    function allStorage() {
      var values = [],
        keys = Object.keys(localStorage),
        i = keys.length;
      while (i--) {
        values.push(localStorage.getItem(keys[i]));
      }
      return values;
    }
  </script>
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
        const email = link.getAttribute('data-bs-pEmail');
        const background = link.getAttribute('data-bs-pBackground');
        const rating = link.getAttribute('data-bs-pRating');
        const ratingLink = link.getAttribute('data-bs-pRLink');
        // Update the modal's content.
        const modalTitle = profPopup.querySelector('.modal-title');
        const modalBody_email = profPopup.querySelector("#mainSpace-email");
        const modalBody_office = profPopup.querySelector("#mainSpace-office");
        const modalBody_background = profPopup.querySelector("#mainSpace-background");
        const modalBody_rating = profPopup.querySelector("#mainSpace-rating");
        const modalLink = profPopup.querySelector('#modalLink');

        modalTitle.textContent = `About Professor ${fName} ${lName}`;
        modalBody_email.textContent = `${email}`;
        modalBody_office.textContent = `${office}`;
        modalBody_background.textContent = `${background}`;
        modalBody_rating.textContent = `${rating} / 5`;
        modalLink.href = ratingLink;
        modalLink.textContent = `See more about ${fName} ${lName}'s rating`;
      });
    }
  </script>
  <!-- PROGRESS BAR SCRIPT -->
  <script>
    function updateProgress() {
      var numAll = $('input[type="checkbox"]').length;
      var numChecked = $('input[type="checkbox"]:checked').length;
      var trackBoxes = $('.track:input[type="checkbox"]').length;
      var trackChecked = $('.track:input[type="checkbox"]:checked').length - 3;

      numAll = numAll - (trackBoxes) + 3;
      if (trackChecked > 0) {
        numChecked -= trackChecked;
      }

      if (numAll > 0) {
        var perc = (numChecked / numAll) * 100;
        $('.progress-bar').css('width', perc + '%').attr('aria-valuenow', perc);
        document.getElementById("progressBar").innerHTML = perc.toFixed(1) + '%';
      }
    }

    function addToStorage(id) {
      if (document.getElementById(id).checked) {
        localStorage.setItem(id, id);
      } else {
        localStorage.removeItem(id);
      }
    }

    function selectAllMath() {
      $('.math:input[type=checkbox]').prop('checked', true);
      vals = document.getElementsByClassName('math');
      for (var val of vals) {
        id = val.getAttribute('id');
        if (localStorage.getItem(id) === null) {
          localStorage.setItem(id, id);
        }
      }
      updateProgress();
    }

    function selectAllCore() {
      $('.core:input[type=checkbox]').prop('checked', true);
      vals = document.getElementsByClassName('core');
      for (var val of vals) {
        id = val.getAttribute('id');
        if (localStorage.getItem(id) === null) {
          localStorage.setItem(id, id);
        }
      }
      updateProgress();
    }

    function selectAllProfessional() {
      $('.professional:input[type=checkbox]').prop('checked', true);
      vals = document.getElementsByClassName('professional');
      for (var val of vals) {
        id = val.getAttribute('id');
        if (localStorage.getItem(id) === null) {
          localStorage.setItem(id, id);
        }
      }
      updateProgress();
    }

    function reset() {
      $('input[type=checkbox]').prop('checked', false);
      localStorage.clear();
      updateProgress();

    }
  </script>


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>

</html>