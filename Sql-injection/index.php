<?php
session_start();
$_SESSION['isLogged'] = false;
?>
<form method="POST" action="login.php">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username">
    <label for="password">Password:</label>
    <input type="password" id="password" name="password">
    <button type="submit">Login</button>
</form>

  