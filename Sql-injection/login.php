<?php
session_start();
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "user";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// $user = addslashes($_POST['username']);
// $pass = addslashes($_POST['password']);

$user = $_POST['username'];
$pass = $_POST['password'];

$sql = "SELECT * FROM users WHERE username = '$user' AND password = '$pass'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  echo "Login successful!";
  $_SESSION['isLogged'] = true;
  header("Location: private.php");
} else {
  echo "Invalid username or password.";
  echo "<br>";
  echo $sql;
}

// // Prepared Statements MySQLi

// $sql = "SELECT * FROM users WHERE username = ? AND password = ?";
// $stmt = $conn->prepare($sql);

// $username = $_POST['username'];
// $password = $_POST['password'];

// $stmt->bind_param("ss", $username, $password);

// $stmt->execute();

// $result = $stmt->get_result();

// if ($result->num_rows > 0) {
//     echo "Đăng nhập thành công!";
//     $_SESSION['isLogged'] = true;
//     header("Location: private.php");
// } else {
//     echo "Tên người dùng hoặc mật khẩu không hợp lệ!";
// }

// $stmt->close();
// $conn->close();


// // PDO PHP Data Object extension

// try {
//     $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
//     $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

//     $sql = "SELECT * FROM users WHERE username = :user AND password = :pass";
//     $stmt = $conn->prepare($sql);

//     $user = $_POST['username'];
//     $pass = $_POST['password'];

//     $stmt->bindParam(':user', $user);
//     $stmt->bindParam(':pass', $pass);

//     $stmt->execute();

//     if ($stmt->rowCount() > 0) {
//         echo "Đăng nhập thành công!";
//         $_SESSION['isLogged'] = true;
//         header("Location: private.php");
//     } else {
//         echo "Tên người dùng hoặc mật khẩu không hợp lệ!";
//     }
// } catch(PDOException $e) {
//     echo "Kết nối không thành công: " . $e->getMessage();
// }
// $conn = null;
?>
