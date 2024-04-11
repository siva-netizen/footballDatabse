<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ISL";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM `managers` WHERE 1;";
$stmt = $conn->prepare($sql);
$stmt->execute();

$result = $stmt->get_result();
if ($result->num_rows > 0) {
    echo "<table> 
            <tr>
                <th>ManagerID</th>
                <th>FirstName</th>
                <th>LastName</th>
                <th>DateOfBirth</th>
                <th>Nationality</th>
            </tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>" . $row["ManagerID"] ."</td>
                <td>" . $row["FirstName"] . "</td>
                <td>" . $row["LastName"] . "</td>
                <td>" . $row["DateOfBirth"] . "</td>
                <td>" . $row["Nationality"] . "</td>
            </tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}

$stmt->close();
$conn->close();
?>
