<?php 
function getClassData($major){
    $query = "SELECT CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC, CLASS_CREDITS, CORE_CLASS_FLG FROM class 
                WHERE CLASS_ID IN 
                    (SELECT cLASS_ID FROM BRIDGE WHERE MJR_ID IN ($major))
                 ORDER BY CORE_CLASS_FLG, CLASS_ID;";
    $data = runQuery($query);
    return $data;
}

function getAdminData($major){
    $query = "SELECT ADMIN_REQ, MJR_DESC FROM MAJOR WHERE MJR_ID IN ($major);";
    $data = runQuery($query);
    $row = mysqli_fetch_row($data);
    return $row;
}

function runQuery($query){
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