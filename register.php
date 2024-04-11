<?php
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
    $email = $_POST["email"];
    $user_role = isset($_POST["user_role"]) ? $_POST["user_role"] : 'user';

    // Hash the password before storing it
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // TODO: Perform input validation and other necessary checks

    // Insert user data into the users table
    $query = "INSERT INTO users (username, password_hash, email, user_role) 
              VALUES ('$username', '$hashed_password', '$email', '$user_role')";

    // Execute the query
    $result = $conn->query($query);

    if ($result) {
        echo "Registration successful!";
    } else {
        echo "Registration failed: " . $conn->error;
    }
}

// Close the connection
$conn->close();
?>
