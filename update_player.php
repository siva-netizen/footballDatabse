<style>
    body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
}

h2 {
    color: #333;
}

form {
    max-width: 400px;
    margin: 20px auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
    display: block;
    font-size: 16px;
    margin-bottom: 8px;
}

input {
    width: 100%;
    padding: 10px;
    margin-bottom: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
}

input[type="submit"] {
    background-color: #4caf50;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

    </style>

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

    // Fetch existing player details
    $query = "SELECT * FROM players WHERE PlayerID = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $playerID);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();

        // Display a form with existing player details
        echo "<h2>Update Player Details</h2>";
        echo "<form method='post' action='update_player_process.php'>";
        echo "<input type='hidden' name='playerID' value='$playerID'>";

        foreach ($row as $field => $value) {
            echo "<label for='$field'>$field:</label>";
            echo "<input type='text' name='$field' value='$value'><br>";
        }

        echo "<input type='submit' value='Update'>";
        echo "</form>";
    } else {
        echo "Player not found.";
    }

    $stmt->close();
}

$conn->close();
?>
