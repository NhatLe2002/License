<%-- 
    Document   : Home
    Created on : Sep 29, 2023, 8:57:26 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            a {
                text-decoration: none;
                cursor: pointer;
            }

            .header {
                background: #fefae0;
                transition: all 0.5s ease-out;
            }

            .header .main__navbar .container {
                margin: 0 auto;
            }

            .header .main__navbar .container .logo {
                width: 80px;
                height: auto;
            }

            .header .main__navbar .container .logo img {
                width: 80px;
                height: auto;
            }

            .header .main__navbar .container .logo h3 {
                color: #000;
                margin: 0px;
                font-size: 25px;
            }

            .header .main__navbar .container .menu {
                display: flex;
                align-items: center;
                column-gap: 2.7rem;
            }

            .header .main__navbar .container .menu .menu_items {
                color: black;
            }

            .header .main__navbar .container .menu .btn_login {
                background-color: #d4a373;
                border: 1px solid #d4a373;
                padding: 5px 15px;
                color: white;
                border-radius: 10px;
                transition: all 0.5s ease-out;
            }

            .header .main__navbar .container .menu .menu_items:hover {
                border-bottom: 2px solid #d4a373;
            }

            .header .main__navbar .container .menu .menu_items_active {
                border-bottom: 2px solid #d4a373;
            }

            .header .main__navbar .container .menu .btn_login:hover {
                background-color: #457b9d;
                border: 1px solid #457b9d;
                color: white;
                transition: all 0.5s ease-out;
            }

            /* hero slides */
            #slideshow {
                margin: 0 auto;
                overflow: hidden;
                position: relative;
                height: 500px;
            }

            .slide {
                display: none;
                width: 100%;
                height: 100%;
                object-fit: cover;
                transition: all 0.5s ease-in-out;
            }

            .slide.active {
                display: block;
                opacity: 1;
                transition: all 0.5s ease-in-out;
            }

            .overlay {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.6);
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                color: white;
                text-align: center;
            }

            .overlay-text {
                font-size: 24px;
                margin-bottom: 20px;
            }

            .overlay-button {
                background-color: #d4a373;
                border: 1px solid #d4a373;
                padding: 10px 20px;
                color: white;
                border-radius: 10px;
                transition: all 0.5s ease-out;
                cursor: pointer;
            }

            .overlay-button:hover {
                background-color: #457b9d;
                border: 1px solid #457b9d;
            }

            /*  */

            .info-section {
                margin-bottom: 20px;
            }

            .info-section h2 {
                font-size: 24px;
                margin-bottom: 10px;
            }

            .info-section p {
                font-size: 16px;
                line-height: 1.5;
                margin-bottom: 10px;
            }

            .bullet-points {
                list-style-type: disc;
                margin-left: 20px;
            }

            .bullet-points li {
                margin-bottom: 5px;
            }
        </style>
    </head>

    <body>
        <header class="header">
            <div class="main__navbar">
                <div class="container mx-auto d-flex align-items-center gap-1 justify-content-between">
                    <div class="logo">
                        <a to="/#" class="d-flex align-items-center gap-2">
                            <img src="https://cdn-icons-png.flaticon.com/512/6556/6556219.png" alt="Logo" class="w-8 h-8" />
                            <h3 class="text-xl font-bold uppercase">DaoTaoLaiXe</h3>
                        </a>
                    </div>

                    <div class="menu">
                        <a class="menu_items " to="/#">Home</a>
                        <a class="menu_items" to="/#">Hỗ trợ</a>
                        <a class="menu_items" to="/#">Thông tin lý thuyết</a>
                        <a class="menu_items" to="/#">Lịch thi</a>
                        <a class="menu_items" href="test-exam.jsp">Thi thử trắc nghiệm</a>
                        <c:choose>
                            <c:when test="${account != null}">
                                ${account.getId()}
                            </c:when>
                            <c:otherwise>
                                <a class="btn_login"  href="login.jsp">Log in</a>
                            </c:otherwise>
                        </c:choose>
                        
                    </div>
                </div>
            </div>
        </header>

        <div class="hero-slides">
            <div id="slideshow">
                <img class="slide" src="https://daotaolaixehcm.vn/wp-content/uploads/2019/04/dyh1539090792.jpg"
                     alt="Hình ảnh 1">
                <img class="slide"
                     src="https://giaypheplaixe.edu.vn/wp-content/uploads/2019/09/hoc-lai-xe-o-to-o-dau-tot.jpg"
                     alt="Hình ảnh 2">
                <img class="slide" src="https://daotaolaixehd.com.vn/wp-content/uploads/2018/04/lich-sat-hach.jpg"
                     alt="Hình ảnh 3">
                <img class="slide"
                     src="https://daotaolaixehd.com.vn/wp-content/uploads/2017/02/1000000000000000000-1024x768.jpg"
                     alt="Hình ảnh 4">
                <div class="overlay">
                    <div class="overlay-text">
                        <h3>Chào mừng bạn đến với hệ thống thi thử trắc nghiệm bằng lái xe</h3>
                    </div>
                    <button class="overlay-button">Thi thử ngay</button>
                </div>
            </div>
        </div>

        <!-- nội dung web -->
        <div id="content" class="container mt-4">
            <h2>Thông Tin Lý Thuyết</h2>
            <p>
                Nhờ việc áp dụng quy trình đào tạo lái xe mới mẻ, tân tiến và có sự cải tiến theo tiêu chí cấp tốc. Qua các
                khóa học được tổ chức, đa phần học viên của chúng tôi luôn nắm vững được kiến thức và kỹ năng cũng như hài
                lòng với chất lượng đào tạo tại Trường.
            </p>
            <p>
                Khi đánh giá một khóa học lái xe ô tô chất lượng, mọi người đều tin tưởng vào những điều thực tế chứ không
                phải qua lời nói mời mọc hấp dẫn. Và tại đây, các hình ảnh và video thực hiện qua mỗi khóa học luôn được lưu
                trữ để học viên có thể tin tưởng.
            </p>
            <p>
                Đây là bằng chứng có sức thuyết phục nhằm giúp các bạn có thể tin tưởng vào chương trình dạy học lái xe bằng
                B2 của chúng tôi. Hiện tại Hoclaixemoto.com đang áp dụng theo 2 quy trình, mời các bạn hãy cùng tham khảo
                sau đây.
            </p>
            <ul class="bullet-points">
                <li>Đạo đức người lái xe: giáo trình bài giảng được quy định của Bộ GTVT ban hành, áp dụng dành cho người
                    học lái xe tất cả các hạng.</li>
                <li>Kinh doanh vận tải: mô hình kinh doanh thịnh hành áp dụng cho người học lái xe B2.</li>
                <li>Cấu tạo, kỹ thuật ô tô: nắm rõ kiến thức cấu tạo máy và cách xử lý kỹ thuật khi phương tiện gặp phải lỗi
                    cơ bản.</li>
                <li>Biển báo giao thông: liên quan đến các loại biển báo giao thông cơ bản nhưng đặc biệt quan trọng, người
                    lái xe phải nắm rõ để không phải vi phạm.</li>
                <li>Phương pháp giải sa hình: hướng dẫn mẹo học và các phương pháp giải sa hình thực tế xuyên suốt trong quá
                    trình học lái xe. Áp dụng vào cả thực tiễn liên quan đến kiến thức Luật và cách tham gia giao thông đúng
                    quy định.</li>
                <li>Kinh nghiệm đường trường: Truyền đạt kiến thức tham gia giao thông theo hướng văn hóa và nghiêm chỉnh.
                    Kinh nghiệm thực tế và cách xử lý khi điều khiển phương tiện tham gia giao thông ở Việt Nam.</li>
            </ul>

            <h2>Thông Tin Thực Hành</h2>
            <p>
                Phần thực hành bài thi bằng lái xe loại B2 là một phần quan trọng của kỳ thi. Dưới đây là một số thông tin
                cần bạn biết về phần thực hành:
            </p>
            <ul class="bullet-points">
                <li>Thời gian thực hành: Phần thực hành thường kéo dài trong khoảng 30-45 phút.</li>
                <li>Yêu cầu thi: Bạn sẽ được yêu cầu thực hiện các kỹ năng lái xe cơ bản, bao gồm lùi xe, đỗ xe, quay đầu,
                    thay đổi làn đường, và tuân thủ luật giao thông.</li>
                <li>Điểm đánh giá: Phần thực hành sẽ được đánh giá dựa trên sự thực hiện chính xác và an toàn của các kỹ
                    năng lái xe.</li>
                <li>Đỗ bài thi: Để đỗ kỳ thi thực hành, bạn cần đạt điểm đủ theo quy định của cơ quan quản lý giao thông.
                </li>
            </ul>
        </div>

        <script>
            const menuItems = document.querySelectorAll(".menu_items");

            menuItems.forEach(item => {
                item.addEventListener("click", function () {
                    menuItems.forEach(item => item.classList.remove("menu_items_active"));
                    this.classList.add("menu_items_active");
                });
            });

            //hero-slides 
            const slides = document.querySelectorAll('.slide');
            let currentSlide = 0;

            function showSlide(index) {
                slides.forEach((slide, i) => {
                    if (i === index) {
                        slide.classList.add('active');
                    } else {
                        slide.classList.remove('active');
                    }
                });
            }

            function nextSlide() {
                currentSlide = (currentSlide + 1) % slides.length;
                showSlide(currentSlide);
            }

            setInterval(nextSlide, 3000);

            showSlide(currentSlide);
        </script>
    </body>

</html>
