<?php

include 'conn.php';
$Email=$_POST['Email'];
$Password=$_POST['Password'];
$query = "SELECT * FROM users WHERE Email='".$Email."' and Password='".$Password."'";

$queryResult=$connect->query($query);

$result=array();

while($fetchData=$queryResult->fetch_assoc()){
    $result[]=$fetchData;
}
echo json_encode($result);

?>