<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "user";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$comment = $_POST['comment'];
// $comment = filter_input(INPUT_POST, 'comment', FILTER_SANITIZE_STRING);


$stmt = $conn->prepare("INSERT INTO comments (comment) VALUES (?)");
$stmt->bind_param("s", $comment);

if ($stmt->execute()) {
    echo "New comment saved successfully";
    header("Location: display.php");
} else {
    echo "Error: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
