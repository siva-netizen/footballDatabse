<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Manager</title>
    <link rel="stylesheet" href="styles.css">
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
            $managerID = $_POST["managerID"];

            $stmt = $conn->prepare("DELETE FROM Managers WHERE ManagerID = ?");
            $stmt->bind_param("i", $managerID);

            if ($stmt->execute()) {
                echo "Manager deleted successfully!";
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
