-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 24, 2024 lúc 04:43 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `user`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `idcomment` int(11) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`idcomment`, `comment`) VALUES
(1, 'THỬ NGHIỆM KHẢ NĂNG CHỐNG BÁM BỤI TỐI ƯU CỦA JOTASHIELD BỀN MÀU TOÀN DIỆN \r\nVới công nghệ Chống Bám Bụi tối ưu, sơn ngoại thất siêu cao cấp Jotashield Bền Màu Toàn Diện có khả năng ngăn chặn bụi bẩn bám trên bề mặt tường, giữ cho ngôi nhà luôn sạch đẹp theo năm tháng. \r\nBằng chứng thử nghiệm thông qua các mẫu sơn được đặt dưới điều kiện thả bụi bẩn vào không khí, kết hợp với mưa và nắng nóng khắc nghiệt để kiểm tra độ bền và khả năng chống bám bụi trong một năm. Không còn nghi ngờ gì nữa, Jotashield Bền Màu Toàn Diện vẫn thể hiện khả năng bảo vệ tốt nhất.\r\nXem hết video bên dưới để cùng Jotun kiểm chứng chất lượng nhé!\r\nXem thêm thông tin sản phẩm tại https://bit.ly/JotashieldBenMauToanDien \r\n#Jotun #JotunVietNam #JotashieldBenMauToanDien #SonNgoaiThat'),
(2, 'LĐBĐ Anh (FA) đã chính thức cáo buộc tiền vệ của West Ham - Lucas Paqueta có hành vi vi phạm cá độ khi cố tình gây ảnh hưởng đến trận đấu ở mùa giải 2022/23 ‼️\r\nFA đã cáo buộc rằng tiền vệ Brazil đã cố tình nhận thẻ vàng ở các trận gặp Leicester, Aston Villa, Leeds và Bournemouth.'),
(13, '[Hà Nội] Tuyển dụng thực tập sinh quản trị Website\r\nKhông yêu cầu kinh nghiệm – được cầm tay chỉ việc\r\nCông việc hàng ngày:\r\n·Viết bài đăng, cập nhật thông tin mới cho website.\r\n·Tải lên và chỉnh sửa hình ảnh, video.\r\n·Duy trì tính nhất quán và chính xác của nội dung website.\r\n·Đảm bảo nội dung website phù hợp với mục tiêu và đối tượng mục tiêu của website.\r\n·Tối ưu hóa SEO\r\n·Bảo mật Website\r\n·Phân tích lưu lượng truy cập\r\n·Tương tác với người dùng\r\n·Chi tiết sẽ được trao đổi trong buổi phỏng vấn\r\nYêu cầu:\r\nSinh viên chuyên ngành công nghệ thông tin các trường Đại học , Cao Đẳng\r\nNhanh nhẹn, chịu khó, ham học hỏi\r\nCó thể làm tối thiểu 6 buổi/ tuần\r\nMọi người quan tâm vui lòng gửi CV qua mail mailto:hcns.dsc@daisan.vn hoặc liên hệ trực tiếp qua Ms Lâm – SĐT: 0372814166 để nhận được JD chi tiết. Cảm ơn cả nhà!'),
(14, '? SIÊU KHUYẾN MẠI LỚN NHẤT NĂM CỦA COCA-COLA VỚI SỐ LƯỢNG QUÀ CHƯA TỪNG CÓ! \r\n✅ Giải Đặc Biệt: 03 Cặp vé du lịch Hàn Quốc & trải nghiệm thử làm IDOL K-POP!\r\n✅ 30 Giải Tuần: Mỗi tuần 03 Voucher ưu tiên mua iPhone 16 Pro 256GB trong đợt mở bán chính thức đầu tiên tại Việt Nam!\r\n✅ Triệu Giải Ngày: Máy quay DJI Osmo Pocket 3, voucher ăn uống/giải trí và tiền trong ví điện tử!\r\n----​ ​\r\n? Chương trình diễn ra từ 01/05 - 10/07/2024. Thông tin chi tiết tại: cokeurl.com/SHHK-24\r\n#CocaColaVN #SieuMuaHeHungKhoi #XaHoiTrungQua'),
(21, '[Hà Nội] Agency TUYỂN DỤNG\r\n?VỊ TRÍ:TTS Part time booking\r\n- Thu nhập : upto 5M+ bonus\r\n*Yêu cầu:\r\n- Sinh viên năm 3,4 các ngành truyền thông,\r\nbáo chí, marketing\r\n- Đã có kinh nghiệm làm việc\r\n- Có khả năng đàm phán tốt\r\n- Thử việc 1 tháng\r\n?Địa điểm làm việc: Xuân La- Tây Hồ\r\n?Ứng tuyển gửi CV về mail:\r\ndongmyduyen1602@gmail.com\r\n☎️Liên hệ / zalo : 0376408906\r\nQuan tâm ib nhận JD'),
(26, 'A \'quote\' is <b>bold</b> & \\\"important\\\"'),
(32, 'This is a test comment with many special characters: bold, italic, &#39;single quotes&#39;, \\&#34;double quotes\\&#34;, alert(&#39;XSS&#39;);, &amp;, &lt;, &gt;, ©, ®, ™, 你好, Привет, ?'),
(36, 'This is a \'special\' quote.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(6, 'Tienduc37', '123456'),
(7, 'admin', '12345678');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`idcomment`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `idcomment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
