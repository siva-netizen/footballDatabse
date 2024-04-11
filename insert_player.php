<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="messagestyle.css">
</head>
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ISL";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $firstName = $_POST["firstName"];
    $lastName = $_POST["lastName"];
    $dob = $_POST["dob"];
    $nationality = $_POST["nationality"];
    $position = $_POST["position"];

    $stmt = $conn->prepare("INSERT INTO Players (FirstName, LastName, DateOfBirth, Nationality, Position) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("sssss", $firstName, $lastName, $dob, $nationality, $position);

    if ($stmt->execute()) {
        echo "Player inserted successfully!";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>
