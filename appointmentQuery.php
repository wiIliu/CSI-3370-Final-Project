<?php

if (isset($_POST['makeAppt'])) {
    $fname = $_POST['student_fname'];
    $lname = $_POST['student_lname'];
    $gid = "G" . $_POST['student_gid'];
    $phone = $_POST['student_phone'];
    $email = $_POST['student_email'];
    $startTime = $_POST['appt_start_date_time'];
    $advisor = $_POST['advisor'];
    $reason = $_POST['student_reason'];
    $query = "INSERT INTO appointment (STUDENT_GID, STUDENT_FNAME, STUDENT_LNAME, STUDENT_PHONE, STUDENT_EMAIL, APPT_REASON, APPT_START_DATE_TIME, ADVISOR_ID) VALUES ('$gid','$fname','$lname','$phone','$email','$reason','$startTime',$advisor)";
    $data = runQuery($query);
}
function runQuery($query)
{
    $server = "localhost";
    $server = "127.0.0.1";
    $user   = "root";
    $pass   = "";
    $db     = "mydegree";
    $conn = mysqli_connect($server, $user, $pass, $db);
    $result = mysqli_query($conn, $query);
    mysqli_close($conn);
    return $result;
}

?>
