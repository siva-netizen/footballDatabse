<?php
session_start();

// Check if the user is already logged in, redirect to index.html
if (isset($_SESSION['user_id'])) {
    header("Location: index.html");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login or Register</title>
    <link rel="stylesheet" href="styles.css">
</head>
<style>
    body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 600px;
    margin: 50px auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    color: #333;
}

.auth-form {
    margin-top: 20px;
}

h2 {
    color: #333;
}

form {
    display: flex;
    flex-direction: column;
}

input {
    margin-bottom: 15px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="submit"] {
    background-color: #4caf50;
    color: #fff;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

/* Add more styles as needed */

    </style>
<body>
    <div class="container">
        <h1>Login or Register</h1>

        <div class="auth-form" id="loginForm">
            <h2>Login</h2>
            <form action="login.php" method="post">
                Username: <input type="text" name="username" required><br>
                Password: <input type="password" name="password" required><br>
                <input type="submit" value="Login">
            </form>
        </div>

        <div class="auth-form" id="registerForm">
            <h2>Register</h2>
            <form action="register.php" method="post">
                Username: <input type="text" name="username" required><br>
                Password: <input type="password" name="password" required><br>
                Email: <input type="email" name="email" required><br>
                <!-- Add other registration fields as needed -->
                <input type="submit" value="Register">
            </form>
        </div>

    </div>
</body>
</html>
