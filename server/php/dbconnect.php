<?php
$servername = "infinitebe.com";
$username   = "infinmwk_anis";
$password   = "MH6yWvRS9KRsm5L";
$dbname     = "infinmwk_anis_bookbytes";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>