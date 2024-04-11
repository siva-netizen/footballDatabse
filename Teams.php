<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ISL";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT teams.*, managers.FirstName AS ManagerFirstName, managers.LastName AS ManagerLastName
        FROM teams
        LEFT JOIN teammanagers ON teams.TeamID = teammanagers.TeamID
        LEFT JOIN managers ON teammanagers.ManagerID = managers.ManagerID";
$stmt = $conn->prepare($sql);
$stmt->execute();

$result = $stmt->get_result();
if ($result->num_rows > 0) {
    echo "<table> 
            <tr>
                <th>Team-Id</th>
                <th>Team Name</th>
                <th>Established year</th>
                <th>City</th>
                <th>Manager</th>
            </tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>" . $row["TeamID"] . "</td>
                <td>" . $row["TeamName"] . "</td>
                <td>" . $row["EstablishedYear"] . "</td>
                <td>" . $row["City"] . "</td>
                <td>" . $row["ManagerFirstName"] . " " . $row["ManagerLastName"] . "</td>
            </tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}

$stmt->close();
$conn->close();
?>
