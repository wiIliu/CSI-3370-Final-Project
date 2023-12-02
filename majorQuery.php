<?php

// RESET
if (isset($_GET['reset'])) {
    session_unset();
    $query = "SELECT MJR_ID, MJR_NAME, MJR_PIC, MJR_DESC FROM major
        ORDER BY MJR_NAME;";
    $filterResult = runQuery($query);
// IF BOTH
} else if (isset($_GET['advisor']) && isset($_GET['class']) && $_GET['class'] != '0' && $_GET['advisor'] != '0') {
    $advisorSelected = $_GET['advisor'];
    $_SESSION['advisor']=$advisorSelected;
    $classSelected = $_GET['class'];
    $query = "SELECT MJR_ID, MJR_NAME, MJR_PIC, MJR_DESC FROM major 
        WHERE ADVISOR_ID IN ($advisorSelected) AND MJR_ID IN (
            SELECT MJR_ID FROM BRIDGE WHERE CLASS_ID IN ($classSelected));";
    $filterResult = runQuery($query);
// JUST ADVISOR
} elseif (isset($_GET['advisor']) && $_GET['advisor'] != '0') {
    $advisorSelected = $_GET['advisor'];
    $_SESSION['advisor'] = $advisorSelected;
    $query = "SELECT MJR_ID, MJR_NAME, MJR_PIC, MJR_DESC FROM major 
        WHERE ADVISOR_ID IN ($advisorSelected) ORDER BY MJR_NAME;";
    $filterResult = runQuery($query);
// JUST CLASS
} elseif (isset($_GET['class']) &&  $_GET['class'] != '0') {
    $classSelected = $_GET['class'];
    $_SESSION['class'] = $classSelected;
    $query = "SELECT MJR_ID, MJR_NAME, MJR_PIC, MJR_DESC FROM major WHERE MJR_ID IN (
        SELECT MJR_ID FROM BRIDGE WHERE CLASS_ID IN ($classSelected))
        ORDER BY MJR_NAME;";
    $filterResult = runQuery($query);

} else {
    session_unset();
    $query = "SELECT MJR_ID, MJR_NAME, MJR_PIC, MJR_DESC FROM major
        ORDER BY MJR_NAME;";
    $filterResult = runQuery($query);
}


// ADVISOR SESSION VARIABLE
if (isset($_SESSION['advisor'])){
    $a = $_SESSION['advisor'];
} else {
    $a = 'defaultA';
}

//  GENERATE CLASS DROPDOWN LIST
$majorsForSearch = $filterResult;
$majorsForSearch = mysqli_fetch_all($majorsForSearch, MYSQLI_ASSOC);
$mjrs = "";
foreach ($majorsForSearch as $row) {
    $val = $row['MJR_ID'];
    if (strlen($mjrs) == 0) {$mjrs .= "$val";} 
    else {$mjrs .= ",$val";}
}
mysqli_data_seek($filterResult, 0);
$query = "SELECT CLASS_GROUP, CLASS_ID, CLASS_NAME FROM CLASS
    WHERE CLASS_ID IN (
        SELECT CLASS_ID FROM BRIDGE WHERE MJR_ID IN($mjrs))
    ORDER BY CLASS_GROUP, CLASS_ID;";
$listResult = runQuery($query);


// RUN QUERIES
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
