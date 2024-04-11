

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="messagestyle.css">
    <link rel="stylesheet" href="setassignment.css">
</head>
<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ISL";

// Create a connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["playerSubmit"])) {
    // Retrieve user input for player assignment
    $newTeamIDPlayer = $_POST["newTeamIDPlayer"];
    $playerID = $_POST["playerID"];

    // SQL query for player assignment using prepared statement
    $sqlPlayer = "UPDATE Players SET TeamID = ? WHERE PlayerID = ? AND (TeamID IS NULL OR TeamID = 0)";

    // Prepare the statement
    $stmtPlayer = $conn->prepare($sqlPlayer);

    // Bind parameters
    $stmtPlayer->bind_param("ii", $newTeamIDPlayer, $playerID);

    // Execute the query
    if ($stmtPlayer->execute()) {
        echo "Player assigned to the new club successfully!";
    } else {
        echo "Error: " . $stmtPlayer->error;
    }

    // Close the statement
    $stmtPlayer->close();
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["managerSubmit"])) {
    // Retrieve user input for manager assignment
    $newTeamIDManager = $_POST["newTeamIDManager"];
    $managerID = $_POST["managerID"];
    $startDateManager = $_POST["startDateManager"];
    $endDateManager = $_POST["endDateManager"];

    // SQL query for manager assignment using prepared statement
    $sqlManager = "INSERT INTO TeamManagers (TeamID, ManagerID, StartDate, EndDate)
            VALUES (?, ?, ?, ?)
            ON DUPLICATE KEY UPDATE
                TeamID = VALUES(TeamID),
                StartDate = VALUES(StartDate),
                EndDate = VALUES(EndDate)";

    // Prepare the statement
    $stmtManager = $conn->prepare($sqlManager);

    // Bind parameters
    $stmtManager->bind_param("iiss", $newTeamIDManager, $managerID, $startDateManager, $endDateManager);

    // Execute the query
    if ($stmtManager->execute()) {
        echo "Manager assigned to the new club successfully!";
    } else {
        echo "Error: " . $stmtManager->error;
    }

    // Close the statement
    $stmtManager->close();
}

// Close the connection
$conn->close();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Indian Super League Database</title>
</head>
<body>

<!-- HTML form for player assignment -->
<div class="glowing-red-box">
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
    Player Assignment<br>
    New Team ID: <input type="text" name="newTeamIDPlayer"><br>
    Player ID: <input type="text" name="playerID"><br>
    <input type="submit" name="playerSubmit" value="Assign Player">
</form>
</div>

<!-- HTML form for manager assignment -->
<div class="glowing-red-box">
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
    Manager Assignment<br>
    New Team ID: <input type="text" name="newTeamIDManager"><br>
    Manager ID: <input type="text" name="managerID"><br>
    Start Date: <input type="text" name="startDateManager"><br>
    End Date: <input type="text" name="endDateManager"><br>
    <input type="submit" name="managerSubmit" value="Assign Manager">
</form>
</div>
</body>
</html>
