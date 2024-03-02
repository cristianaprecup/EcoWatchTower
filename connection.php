<?php

$db = "ecowatchtower";
$user = "root";
$host = "localhost";
$password = "";

$connection = mysqli_connect($host, $user, $password, $db);
if (!$connection) {
    die("Connection failed: " . mysqli_connect_error());
}