<?php 
function getClassData($major){
    $query = "SELECT class.CLASS_ID, CLASS_GROUP, CLASS_NAME, CLASS_DESC, CLASS_CREDITS, TEXTBK_LINK, CORE_CLASS_FLG, ELECTIVE_FLG, TRACK_CLASS_FLG, TRACK_CLASS_NUM 
    FROM class INNER JOIN bridge ON class.CLASS_ID = bridge.CLASS_ID
    WHERE bridge.MJR_ID = $major
    ORDER BY ELECTIVE_FLG, TRACK_CLASS_FLG, TRACK_CLASS_NUM, CORE_CLASS_FLG, CLASS_ID;";
    $data = runQuery($query);
    return $data;
}

function getAdmissionsData($major){
    $query = "SELECT ADMIN_REQ, MJR_DESC FROM MAJOR WHERE MJR_ID IN ($major);";
    $data = runQuery($query);
    $row = mysqli_fetch_row($data);
    return $row;
}
function getProfData($profId){
    $query = "SELECT * FROM PROFESSOR WHERE PROF_ID IN($profId);";
    $data = runQuery($query);
    $row = mysqli_fetch_row($data);
    return $row;
}

function getSections($classID){
    $query = "SELECT CRN, S.PROF_ID, PROF_FNAME, PROF_LNAME, DATE_FORMAT(SECTION_TIME, '%Y-%m-%d %H:%i') as SECTION_TIME, SECTION_SEMESTER  
     FROM SECTION S LEFT JOIN PROFESSOR P ON S.PROF_ID = P.PROF_ID
     WHERE CLASS_ID = $classID
     ORDER BY SECTION_SEMESTER,CRN;";
    $data = runQuery($query);
    return $data;
}

function getAdvisor($major){
    $query = "SELECT CONCAT(ADVISOR_FNAME, ' ', ADVISOR_LNAME) AS ADVISOR_NAME FROM ADVISOR 
        WHERE ADVISOR_ID IN (SELECT ADVISOR_ID FROM MAJOR WHERE MJR_ID = $major);";
    $data = runQuery($query);
    $row = mysqli_fetch_row($data);
    return $row[0];
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
