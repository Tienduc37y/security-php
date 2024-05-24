# SECURITY CHO BÀI TÂP CUỐI KÌ
## 1. SQL INJECTION
* **Là một lỗ hổng bảo mật web cho phép kẻ tấn công can thiệp vào các truy vấn mà ứng dụng thực hiện đối với cơ sở dữ liệu của nó.**
* **Cho phép kẻ tấn công xem dữ liệu mà thông thường chúng không thể truy xuất được. Điều này có thể bao gồm dữ liệu thuộc về người dùng khác hoặc bất kỳ dữ liệu nào khác mà ứng dụng có thể truy cập.**
* **Trong nhiều trường hợp, kẻ tấn công có thể sửa đổi hoặc xóa dữ liệu này, gây ra những thay đổi liên tục đối với nội dung hoặc hành vi của ứng dụng.**
### Demo Tấn Công
**1. Đoạn code đăng nhập như file (index.php)**
```php
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
```
**2. 1 file xử lí login (login.php)**
```php
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
?>
```

**3. Ta sẽ nhập 1 đoạn text vào biểu mẫu username và password như sau:**
```
username: ' OR '1'='1
password: ' OR '1'='1
```

**4. Kết quả là bạn vẫn có thể đăng nhập mà không cần dùng tài khoản**
![img login](https://laitienduc37.000webhostapp.com/%E1%BA%A3nh%20php/Screenshot%20(12).png)

![img login](https://laitienduc37.000webhostapp.com/%E1%BA%A3nh%20php/Screenshot%20(13).png)

### Cách hạn chế bị tấn công SQL Injection
**1. Sử dụng hàm addslashes():**
```php
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
// Dùng hàm addslashes()
$user = addslashes($_POST['username']);
$pass = addslashes($_POST['password']);

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
```
**2. Dùng prepared statements của MySQLi**
```php
// Prepared Statements MySQLi

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

$sql = "SELECT * FROM users WHERE username = ? AND password = ?";
$stmt = $conn->prepare($sql);

$username = $_POST['username'];
$password = $_POST['password'];

$stmt->bind_param("ss", $username, $password);

$stmt->execute();

$result = $stmt->get_result();

if ($result->num_rows > 0) {
    echo "Đăng nhập thành công!";
    $_SESSION['isLogged'] = true;
    header("Location: private.php");
} else {
    echo "Tên người dùng hoặc mật khẩu không hợp lệ!";
}

$stmt->close();
$conn->close();
?>
```
**3. Sử dụng extension PDO**
```php
// PDO PHP Data Object extension
<?php
session_start();
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "user";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $sql = "SELECT * FROM users WHERE username = :user AND password = :pass";
    $stmt = $conn->prepare($sql);

    $user = $_POST['username'];
    $pass = $_POST['password'];

    $stmt->bindParam(':user', $user);
    $stmt->bindParam(':pass', $pass);

    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        echo "Đăng nhập thành công!";
        $_SESSION['isLogged'] = true;
        header("Location: private.php");
    } else {
        echo "Tên người dùng hoặc mật khẩu không hợp lệ!";
    }
} catch(PDOException $e) {
    echo "Kết nối không thành công: " . $e->getMessage();
}
$conn = null;
?>
```

## 2. XSS (Cross-site Scripting)
* **Cross-Site Scripting (XSS) là một lỗ hổng bảo mật phổ biến trong các ứng dụng web. Lỗ hổng này cho phép kẻ tấn công chèn mã JavaScript độc hại vào trang web mà người dùng khác sẽ truy cập. Khi người dùng truy cập trang web bị chèn mã độc, mã JavaScript này sẽ được thực thi trong trình duyệt của họ**
### Demo Tấn Công
**1. Đoạn code nhập comment**
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Comment Form</title>
</head>
<body>
    <form action="save_comment.php" method="post">
        <label for="comment">Comment:</label><br>
        <textarea id="comment" name="comment" rows="4" cols="50"></textarea><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
```
**2. Đoạn code xử lí thêm comment vào database**
```php
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
```
**3. Thực hiện tấn công nhập 1 đoạn mã script vào input comment**
```js
<script>
    setInterval(()=>{alert("XSS")},100)
</script>
```
**4. Khi nhấn Submit lập tức sẽ thêm đoạn mã vừa rồi vào databse và chuyển sang trang display**
```php
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
    }
} else {
    echo "No Comment";
}
$conn->close();
?>
```
**5. Trang display sẽ thực hiện lấy toàn bộ comment trong databse ra và sẽ lấy ra đoạn mã script và brower sẽ thực hiện chạy lệnh script này. Kết quả là cứ mỗi 1/10s sau khi bấm ok sẽ tiếp tục alert tiếp làm cho người dùng không thể sử dụng trang web này được**

![img alert](https://laitienduc37.000webhostapp.com/%E1%BA%A3nh%20php/image.png)

### Cách hạn chế bị tấn công XSS
**1. Ta sẽ lọc đầu vào input bằng hàm filter_input()**
```php
$comment = filter_input(INPUT_POST, 'comment', FILTER_SANITIZE_STRING);
```

**2. Ta sẽ dùng hàm htmlspecialchars() khi in dữ liệu ra màn hình.Hàm này có tác dụng mã hóa các ký tự `<`,`>`,`&`, `"`**
```php
echo "<li>" . htmlspecialchars($row["comment"]) . "</li>" . "<br>";
```

**3. Ta sẽ dùng hàm htmlentities() khi in dữ liệu ra màn hình. Dùng hàm này sẽ tốt hơn htmlspecialchars() vì có thể mã hóa được nhiều kí tự khác nữa.**
```php
echo "<li>" . htmlentities($row["comment"], ENT_QUOTES, 'UTF-8') . "</li>" . "<br>";
```

## About Me
**Tiến Đức**
**http://facebook.com/ChanDuc0307**

