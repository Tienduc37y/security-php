<?php
session_start();
if($_SESSION['isLogged'] === false){
    header("Location: index.php");
    exit;
}
?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        h2 > a {
            text-decoration:none;
            color:red;
            padding: 10px;
            background-color:#777;
            border-radius:75%;
        }
    </style>
</head>
<body>
    <h1>Đây là trang private chỉ có cho nhân viên được cấp tài khoản</h1>
    <h2>
        <a href="logout.php">Đăng xuất</a>
    </h2>
</body>
</html>