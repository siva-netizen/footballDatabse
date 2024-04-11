<style>
    /* Update Form */
    .update-form {
        margin-top: 20px;
    }

    .update-form label {
        display: block;
        margin-bottom: 8px;
    }

    .update-form input[type="text"],
    .update-form input[type="number"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        box-sizing: border-box;
    }

    .update-form button {
        background-color: #2196f3;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .update-form button:hover {
        background-color: #0d47a1;
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

$query = "SELECT Players.*, Teams.TeamName
          FROM Players
          JOIN Teams ON Players.TeamID = Teams.TeamID";

$result = $conn->query($query);

if ($result->num_rows > 0) {
    echo "<h2>Player Details</h2>";
    echo "<table>
            <tr>
                <th>Player ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Date of Birth</th>
                <th>Nationality</th>
                <th>Position</th>
                <th>Team Name</th>
            </tr>";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>{$row['PlayerID']}</td>
                <td>{$row['FirstName']}</td>
                <td>{$row['LastName']}</td>
                <td>{$row['DateOfBirth']}</td>
                <td>{$row['Nationality']}</td>
                <td>{$row['Position']}</td>
                <td>{$row['TeamName']}</td>
            </tr>";
    }

    echo "</table>";
} else {
    echo "No players found.";
}

$conn->close();
?>
