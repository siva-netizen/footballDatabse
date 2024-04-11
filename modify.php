<html>
<link rel="stylesheet" href="modify.css">
</html>
<!-- Insert Team Form -->
<div class="glowing-box">
    <div class="insert-form" style="display : block;">
        <h2>Insert Team</h2>
        <form action="insert_team.php" method="post">
            <!-- Form fields for inserting a team -->
            <label for="teamName">Team Name:</label>
            <input type="text" name="teamName" required><br>

          <label for="establishedYear">Established Year:</label>
            <input type="number" name="establishedYear" required><br>

            <label for="city">City:</label>
         <input type="text" name="city" required><br>

            <input type="submit" value="Insert Team">
        </form>
    </div>
</div>

<!-- Delete Team Form -->
<div class="glowing-box">
<div class="delete-form" style="display: block;">
    <h2>Delete Team</h2>
    <form action="delete_team.php" method="get">
        <label for="teamID">Team ID to delete:</label>
        <input type="number" name="id" required><br>

        <input type="submit" value="Delete Team">
    </form>
</div>
</div>

    <?php
    // Check if form is submitted
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
    ?>
</div>
<div class="glowing-box">
<div class="modify-data">
    <h2>Data for Modification</h2>

    <!-- Player Modification Form -->
    <form method="post" action="update_player.php">
        <label for="playerID">Player ID to update:</label>
        <input type="number" name="playerID" required>
        <button type="submit">Fetch Player Details</button>
    </form>

    <!-- Manager Modification Form -->
    <form method="post" action="update_manager.php">
        <label for="managerID">Manager ID to update:</label>
        <input type="number" name="managerID" required>
        <button type="submit">Fetch Manager Details</button>
    </form>
</div>
</div>
<div class="glowing-box">
<div class="insert-form">
    <h2>Insert Player</h2>
    <form action="insert_player.php" method="post">
        <!-- Form fields for inserting a player -->
        <label for="firstName">First Name:</label>
        <input type="text" name="firstName" required><br>

        <label for="lastName">Last Name:</label>
        <input type="text" name="lastName" required><br>

        <label for="dob">Date of Birth:</label>
        <input type="date" name="dob" required><br>

        <label for="nationality">Nationality:</label>
        <input type="text" name="nationality" required><br>

        <label for="position">Position:</label>
        <input type="text" name="position" required><br>

        <input type="submit" value="Insert Player">
    </form>
</div>
</div>
<!-- Delete Player Form -->
<div class="glowing-box">
<div class="delete-form">
    <h2>Delete Player</h2>
    <form action="delete_player.php" method="post">
        <label for="playerID">Player ID to delete:</label>
        <input type="number" name="playerID" required><br>

        <input type="submit" value="Delete Player">
    </form>
</div>
</div>
<!-- Insert Manager Form -->
<div class="glowing-box">
<div class="insert-form">
    <h2>Insert Manager</h2>
    <form action="insert_manager.php" method="post">
        <!-- Form fields for inserting a manager -->
        <label for="firstName">First Name:</label>
        <input type="text" name="firstName" required><br>

        <label for="lastName">Last Name:</label>
        <input type="text" name="lastName" required><br>

        <label for="dob">Date of Birth:</label>
        <input type="date" name="dob" required><br>

        <label for="nationality">Nationality:</label>
        <input type="text" name="nationality" required><br>

        <input type="submit" value="Insert Manager">
    </form>
</div>
</div>
<!-- Delete Manager Form -->
<div class="glowing-box">
<div class="delete-form">
    <h2>Delete Manager</h2>
    <form action="delete_manager.php" method="post">
        <label for="managerID">Manager ID to delete:</label>
        <input type="number" name="managerID" required><br>

        <input type="submit" value="Delete Manager">
    </form>
</div>
</div>
</div>