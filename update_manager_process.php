<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Indian Super League Database</title>
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
    $managerID = $_POST["managerID"];

    // Update manager details
    $query = "UPDATE managers SET FirstName = ?, LastName = ?, DateOfBirth = ?, Nationality = ? WHERE ManagerID = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ssssi", $_POST["FirstName"], $_POST["LastName"], $_POST["DateOfBirth"], $_POST["Nationality"], $managerID);

    if ($stmt->execute()) {
        echo "Manager details updated successfully!";
    } else {
        echo "Error updating manager details: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>
