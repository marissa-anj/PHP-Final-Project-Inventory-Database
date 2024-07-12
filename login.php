<?php
// login.php
session_start();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    //Get username and password
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Check to see if credentials are correct (hardcoded)
    if ($username == 'admin' && $password == 'password') {
        $_SESSION['loggedin'] = true;
        header('Location: dashboard.php');
    } else {
        $error = 'Invalid credentials. Please check your username and password.';
    }
}
?>

<img src="TechHaven.png" alt="logo">
<style>
        /* CSS styles to resize the image */
        img {
            width: 100px; /* Adjust width as needed */
            height: 100px; /* Maintain aspect ratio */        
        }
</style>
<br>
TechHaven Inventory Dashboard Login
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <form method="post" action="">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Login</button>
    </form>
    <?php if (isset($error)) { echo $error; } ?>
</body>
</html>
