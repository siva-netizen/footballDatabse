<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ISL";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET["managerID"])) {
    $managerID = $_GET["managerID"];

    // Debugging statement
    echo "Manager ID: " . $managerID;

    // Retrieve the history track for a manager along with team names using ManagerID
    $sql = "SELECT TeamManagers.*, Teams.TeamName
            FROM TeamManagers
            JOIN Teams ON TeamManagers.TeamID = Teams.TeamID
            WHERE TeamManagers.ManagerID = ? 
            ORDER BY TeamManagers.StartDate";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $managerID);

    if ($stmt->execute()) {
        $result = $stmt->get_result();

        // Debugging statement
        var_dump($result);

        // Display the results
        echo "<h2>Manager History Track</h2>";
        echo "<table border='1'>
                <tr>
                    <th>Team Name</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <!-- Add other relevant columns -->
                </tr>";

        while ($row = $result->fetch_assoc()) {
            echo "<tr>
                    <td>{$row['TeamName']}</td>
                    <td>{$row['StartDate']}</td>
                    <td>{$row['EndDate']}</td>
                    <!-- Add other relevant columns -->
                </tr>";
        }

        echo "</table>";
    } else {
        // Debugging statement
        echo "Error in query: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>
