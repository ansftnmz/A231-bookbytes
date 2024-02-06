<?php
$servername = "localhost";
$username   = "iroot";
$password   = "";
$dbname     = "bookbytes";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>