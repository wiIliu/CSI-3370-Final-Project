<?php
    // if(isset($_GET['filter'])){
    

    if(isset($_GET['advisorSelected']) && isset($_GET['class']) && $_GET['class'] != '0') {
        $advisorSelected = $_GET['advisorSelected'];
        $classSelected = $_GET['class'];
        $query = "SELECT MJR_ID, MJR_NAME, MJR_PIC FROM major WHERE ADVISOR_ID IN ($advisorSelected) AND MJR_ID IN (SELECT MJR_ID FROM BRIDGE WHERE CLASS_ID IN ($classSelected));;";
        $filterResult = filterTable($query);
        $filterSentence = "Currently showing all majors with class $classSelected and advisor $advisorSelected";
    }
    elseif(isset($_GET['advisorSelected'])){
        $advisorSelected = $_GET['advisorSelected'];
        $query = "SELECT MJR_ID, MJR_NAME, MJR_PIC FROM major WHERE ADVISOR_ID IN ($advisorSelected);";
        $filterResult = filterTable($query);
        $filterSentence = "Currently showing all majors with advisor $advisorSelected";
    }
    elseif(isset($_GET['class']) &&  $_GET['class'] != '0'){
        $classSelected = $_GET['class'];
        $query = "SELECT MJR_ID, MJR_NAME, MJR_PIC FROM major WHERE MJR_ID IN (SELECT MJR_ID FROM BRIDGE WHERE CLASS_ID IN ($classSelected));";
        $filterResult = filterTable($query);
        $filterSentence = "Currently showing all majors with class $classSelected";
    }
    else{
        $class = '0';
        // $advisorSelected = 0;
        $query = "SELECT MJR_ID, MJR_NAME, MJR_PIC FROM major;";
        $filterResult = filterTable($query);
        $filterSentence = "Currently showing all majors";
    }

    function filterTable($query){
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