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

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["playerID"])) {
    $playerID = $_POST["playerID"];

    // Update player details
    $updateQuery = "UPDATE players SET ";

    foreach ($_POST as $field => $value) {
        if ($field != "playerID") {
            $updateQuery .= "$field = '$value', ";
        }
    }

    // Remove the trailing comma and space
    $updateQuery = rtrim($updateQuery, ", ");

    $updateQuery .= " WHERE PlayerID = $playerID";

    if ($conn->query($updateQuery) === TRUE) {
        echo "Player details updated successfully!";
    } else {
        echo "Error updating player details: " . $conn->error;
    }
}

$conn->close();
?>
