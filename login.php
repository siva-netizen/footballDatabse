<?php
session_start();

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ISL";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];

    // Check if the user exists in the users table
    $query = "SELECT * FROM users WHERE username='$username'";
    

    // Execute the query
    $result = $conn->query($query);

    if ($result && $result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $stored_hashed_password = $row["password_hash"];
        $user_role = $row["user_role"];

        if ($user_role === 'admin' && $username === 'admin' && password_verify($password, $stored_hashed_password)) {
            // Password is correct, set session variable or perform other actions for admin
            $_SESSION['user_id'] = $row['user_id'];
            $_SESSION['user_role'] = $user_role;

            // Redirect to the admin page
            header("Location: admin_page.php");
            exit();
        } elseif ($user_role !== 'admin' && password_verify($password, $stored_hashed_password)) {
            // Password is correct, set session variable or perform other actions for normal user
            $_SESSION['user_id'] = $row['user_id'];
            $_SESSION['user_role'] = $user_role;

            // Redirect to the normal user page
            header("Location: normal_user_page.php");
            exit();
        } else {
            // Incorrect password
            echo "Incorrect password";
        }
    } else {
        // User not found
        echo "User not found";
    }
}

// Close the connection
$conn->close();
?>
