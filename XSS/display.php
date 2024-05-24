<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "user";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT comment FROM comments";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<li>" . $row["comment"] . "</li>" . "<br>";
        // echo "<li>" . htmlspecialchars($row["comment"]) . "</li>" . "<br>";
        // echo "<li>" . htmlentities($row["comment"], ENT_QUOTES, 'UTF-8') . "</li>" . "<br>";
    }
} else {
    echo "No Comment";
}
$conn->close();
?>
