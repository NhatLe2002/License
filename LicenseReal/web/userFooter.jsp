<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    </head>
    <style>
        /* footer */
        .footer {
            background-color: #fefae0;
            padding: 70px 0;
        }

        .footer .row {
            display: flex;
            flex-wrap: wrap;
        }

        .footer .footer-col {
            width: 25%;
            padding: 0 40px;
            display: flex;
            align-items: flex-start;
            flex-direction: column;
        }

        .footer ul {
            list-style: none;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            flex-direction: column;
        }

        .footer h4 {
            font-size: 18px;
            color: #106940;
            text-transform: capitalize;
            margin-bottom: 35px;
            font-weight: 500;
            position: relative;
        }

        .footer h4::before {
            content: "";
            position: absolute;
            left: 0;
            bottom: -10px;
            background-color: #2f3e46;
            height: 2px;
            box-sizing: border-box;
            width: 100%;
        }

        .footer ul li:not(:last-child) {
            margin-bottom: 10px;
        }

        .footer p {
            color: black;
        }

        .footer ul li a {
            font-size: 16px;
            text-transform: capitalize;
            text-decoration: none;
            font-weight: 300;
            color: black;
            display: block;
            transition: all 0.3s ease;
        }

        .footer-col ul {
            padding: 0px !important;
        }

        .footer ul li a:hover {
            color: #84a98c;
            padding-left: 8px;
        }

        .footer .icon {
            display: inline-block;
            height: 40px;
            width: 40px;
            background-color: rgba(255, 255, 255, 0.2);
            text-align: center;
            line-height: 40px;
            border-radius: 50%;
            color: #ffffff;
            transition: all 0.5s ease;
        }

        p {
            margin-bottom: 0px;
        }

        /* Responsive */
        @media (max-width: 767px) {
            .footer .footer-col {
                width: 50%;
                margin-bottom: 30px;
            }
        }

        @media (max-width: 574px) {
            .footer .footer-col {
                width: 100%;
            }
        }
    </style>
    <body>
        <!-- footer -->
        <footer class="footer no-select">
            <div class="container">
                <div class="row">
                    <div class="footer-col">
                        <h4>Về chúng tôi</h4>
                        <p>Một công cụ học lái xe, mang lại cho bạn cơ hội rèn luyện và nâng cao kiến thức về quy
                            tắc giao thông và kỹ năng lái xe một cách an toàn và hiệu quả.</p>
                    </div>
                    <div class="footer-col">
                        <h4>Thông tin bên lề</h4>
                        <ul>
                            <li><a href="#">Quyền lợi</a></li>
                            <li><a href="#">Dịch vụ</a></li>
                            <li><a href="#">Đánh giá</a></li>
                            <li><a href="#">Liên lạc</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>Dịch vụ cung cấp</h4>
                        <ul>
                            <li><a href="#">Thi thử</a></li>
                            <li><a href="#">Học lý thuyết</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>Thông tin tương tác</h4>
                        <p>Nếu bạn có bất kì thắc mắc nào vui lòng liên hệ demo@example.com</p>
                        <ul>
                            <li class='d-flex justify-items-center align-items-center text-black'>
                                <i class="fa-solid fa-location-dot icon text-black"></i>
                                <a href="#" class='pl-2'>123 Address</a>
                            </li>
                            <li class='d-flex justify-items-center align-items-center text-black'>
                                <i class="fa-solid fa-phone icon text-black"></i>
                                <a href="#" class='pl-2'> 0923456789</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>
