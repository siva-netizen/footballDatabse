<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="messagestyle.css">
</head>
<body>
    <div class="container">
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
    $teamName = $_POST["teamName"];
    $establishedYear = $_POST["establishedYear"];
    $city = $_POST["city"];

    $stmt = $conn->prepare("INSERT INTO teams (TeamName, EstablishedYear, City) VALUES (?, ?, ?)");
    $stmt->bind_param("sis", $teamName, $establishedYear, $city);

    if ($stmt->execute()) {
        echo "Team inserted successfully!";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>
    </div>
</body>
</html>


