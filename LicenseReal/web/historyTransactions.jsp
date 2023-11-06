<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.2/mdb.min.css" rel="stylesheet" />
        <style>
            .button-wrapper {
                display: inline-block;
                border: 2px solid red;
                padding: 5px;
            }

            .dropdown-item {
                text-decoration: none;
                color: black;
            }
        </style>
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                text-align: left;
                padding: 8px;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
            }
        </style>

        <style>
            /* header */
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

            /* main profile */
            .container-driving-profile {}

            /* sidebar profile */
            .option-account-container {
                width: 25%
            }

            .option-account-container .title {
                font-weight: 550;
                font-size: 30px;
            }

            .option-account-container .sidebar-account {
                display: flex;
                justify-content: center;
                flex-direction: column;
            }

            .option-account-container .sidebar-account .active {
                font-weight: 550;
                border-left: 4px solid blue;
                border-right: 4px solid blue;
                color: #000d6b !important;
            }

            .option-account-container .sidebar-account .active i {
                font-weight: 700;
                color: #000d6b;
            }

            .option-account-container .sidebar-account .link-option-account {
                display: flex;
                align-items: center;
                gap: 5px;
                padding: 16px;
                color: black;
                border-top: 1px solid gray;
            }

            .option-account-container .sidebar-account .link-option-account:hover {
                font-weight: 550;
                color: #000d6b;
            }

            .option-account-container .sidebar-account div {
                cursor: pointer;
            }

            .link-option-account:hover .bold-icon {
                font-weight: 700;
                color: #000d6b;
            }

            .separate-line-layout-account {
                border-left: 1px solid;
                height: calc(100vh - 110px);
            }

            .content-option-container {
                width: 75%;
            }

            @media only screen and (max-width: 1400px) {
                .content-option-container {
                    width: 80%;
                }

                .option-account-container {
                    width: 20%;
                }

                .profile-container .gap-5 {
                    gap: 1rem !important
                }
            }


            /* main content*/
            .profile-container {}

            .user-profile p {
                margin-bottom: 0px;
            }

            .profile-container .title {
                font-weight: 550;
                font-size: 30px;
            }

            .profile-container .user-profile {}

            .profile-container .user-profile .left {
                width: 25%;
            }

            .profile-container .user-profile .left .avatar-user {
                position: relative;
                width: 100%;
                height: auto;
            }

            .profile-container .user-profile .left .avatar-user img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .profile-container .avatar-user .camera-wrapper {
                position: absolute;
                bottom: -7px;
                right: -7px;
                width: 20px;
                height: 20px;
                background-color: gray;
                cursor: pointer;
                transition: opacity 0.3s;
                padding: 20px;
                border-radius: 50px;
            }

            .profile-container .avatar-user .camera-wrapper i {
                color: white;
                transition: opacity 0.3s;
                font-size: 25px;
            }

            .profile-container .avatar-user .camera-wrapper:hover {
                opacity: 0.7;
            }

            .profile-container .avatar-user .camera-wrapper:hover i {
                opacity: 0.7;
            }

            /* -- */

            .profile-container .user-profile .left .another-info {}


            .profile-container .user-profile .right {
                width: 75%;
            }

            .profile-container .user-profile .right p {
                margin-bottom: 0px;
            }

            .profile-container .user-profile .right .header-profile {}

            .profile-container .user-profile .right .header-profile .top-header-profile {
                width: 100%;
            }

            .profile-container .user-profile .right .header-profile .top-header-profile .edit-profile {
                color: rgb(161, 159, 159);
                cursor: pointer;
            }

            .profile-container .user-profile .right .header-profile .top-header-profile .left-top-header-profile .user-name {
                font-size: 35px;
                color: #000d6b;
            }

            .profile-container .user-profile .right .header-profile .top-header-profile .left-top-header-profile .user-location {
                color: gray;
            }

            .profile-container .user-profile .right .header-profile .role-name {
                color: #2437c5;
                font-weight: bold;
            }

            .profile-container .user-profile .right .header-profile .rate-section {
                margin-top: 20px;
                margin-bottom: 20px;
            }

            .profile-container .user-profile .right .header-profile .rate-section .title-rate {
                color: gray;
            }

            .profile-container .user-profile .right .header-profile .rate-section .rate-data {
                font-size: 25px;
            }

            .profile-container .user-profile .right .header-profile .rate-section .rate-data .score {
                font-weight: bold;
            }

            .profile-container .user-profile .right .header-profile .separation-vertical-line {
                border-left: 1px solid gray;
                width: 1px;
                height: 70%;
            }

            .profile-container .user-profile .right .main .main-top {
                border-bottom: 3px solid #d9d0d0;
                position: relative;
            }

            .profile-container .user-profile .right .main .main-top a {
                text-decoration: none;
                color: gray;
            }

            .profile-container .user-profile .right .main .main-top a:hover {
                color: black;
            }

            .profile-container .user-profile .right .main .main-top .active {
                color: black;
                border-bottom: 3px solid #3498db;
            }

            .profile-container .user-profile .right .main .main-top .about {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
            }

            .profile-container .user-profile .right .main .main-top .timeline {
                position: relative;
                z-index: 1;
                left: 115px;
            }

            .profile-container .user-profile .right .main .main-info .contact-info,
            .profile-container .user-profile .right .main .main-info .basic-info {
                margin-top: 25px;
            }

            .profile-container .user-profile .right .main .main-info .contact-info .text-header-profile,
            .profile-container .user-profile .right .main .main-info .basic-info .text-header-profile {
                margin-bottom: 15px;
                color: gray;
                text-transform: uppercase;
                font-size: 15px;
            }

            .profile-container .user-profile .right .main .main-info .contact-info .content,
            .profile-container .user-profile .right .main .main-info .basic-info .content {
                width: 100%;
            }

            .profile-container .user-profile .right .main .main-info .contact-info .content .label-info,
            .profile-container .user-profile .right .main .main-info .basic-info .content .label-info {
                width: 30%;
            }

            .profile-container .user-profile .right .main .main-info .contact-info .content .label-info label,
            .profile-container .user-profile .right .main .main-info .basic-info .content .label-info label {
                margin-top: 20px;
            }

            .profile-container .user-profile .right .main .main-info .contact-info .content .input-info input,
            .profile-container .user-profile .right .main .main-info .basic-info .content .input-info input {
                margin-top: 15px;
            }

            .profile-container .input-info :not(.health-certificate) {
                width: 350px;
            }

            .health-certificate {
                margin: 0px !important;
            }

            .profile-container .user-profile .right .main .main-info .contact-info .content .input-info input,
            .profile-container .user-profile .right .main .main-info .basic-info .content .input-info input {
                margin-top: 15px;
            }

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
    </head>

    <body>
        <c:import url="userHeader.jsp"/>

        <div class='mt-5 mb-5 d-flex gap-3 container container-driving-profile no-select'>
            <div class="d-flex flex-column option-account-container gap-3">
                <div class='title' id='title'></div>
                <div class='sidebar-account'>
                    <a href="MainController?action=updateP&id=${sessionScope.user.getId()}" class="link-option-account">
                        <span class="bold-icon">
                            <i class="fa-regular fa-user"></i>
                        </span>
                        <div class="text-option-account">Thông tin cá nhân</div>
                    </a>

                    <a href="MainController?action=ViewTransactions" class="link-option-account">
                        <span class="bold-icon">
                            <i class="fa-solid fa-shekel-sign"></i>
                        </span>
                        <div class="text-option-account">Lịch sử giao dịch</div>
                    </a>

                    <a href="MainController?action=passwordProfile" class="link-option-account">
                        <span class="bold-icon">
                            <i class="fa-solid fa-lock"></i>
                        </span>
                        <div class="text-option-account">Đổi mật khẩu</div>
                    </a>
                    <a class="link-option-account" href="LogoutServlet">
                        <span class="bold-icon">
                            <i class="fa-solid fa-arrow-right-from-bracket"></i>
                        </span>
                        <div class="text-option-account">Đăng xuất</div>
                    </a>
                </div>
            </div>

            <div class='separate-line-layout-account'></div>
            <div class='content-option-container'>
                <div class="d-flex justify-content-center flex-column profile-container gap-3">
                    <div class='title'>Lịch sử giao dịch</div>
                    <div class="table">
                        <table>
                            <tr>
                                <th>Tên</th>
                                <th>Giá</th>
                                <th>Loại hình</th>
                                <th>Tình trạng</th>
                                <th>Hình thức thanh toán</th>
                                <th>Ngày tạo</th>
                                <th>Chỉnh sửa</th>
                            </tr>
                            <c:forEach items="${listP}" var="p">
                                <tr>
                                    <td>${user.getName()}</td>

                                    <td>${Integer (p.getPrice())/1000000}tr</td>
                                    <c:if test="${p.getType().contains('regisTest')}">
                                        <td>Đăng ký nộp hồ sơ</td>
                                    </c:if>
                                    <c:if test="${p.getType().contains('regisLearn')}">
                                        <td>Đăng ký học thực hành</td>
                                    </c:if>
                                    <c:if test="${p.isStatus() == true}">
                                        <td style="color: green;">Đã thanh toán</td>
                                    </c:if>
                                    <c:if test="${p.isStatus() == false}">
                                        <td style="color: red;">Chưa thanh toán</td>
                                    </c:if>
                                    <c:if test="${p.isCash_type() == true}">
                                        <td>VN Pay</td>
                                    </c:if>
                                    <c:if test="${p.isCash_type() == false}">
                                        <td>Tiền mặt</td>
                                    </c:if>                                 
                                    <td>${p.getCreate_date()}</td>
                                    <c:if test="${p.isStatus() == false}">
                                        <td>
                                            <div class="button-wrapper">
                                                <a class="dropdown-item" href="MainController?action=deletePayment&id=${p.id}">
                                                    <i class="fa fa-trash" aria-hidden="true"></i> Hủy thanh toán
                                                </a>
                                            </div>

                                        </td>
                                    </c:if>

                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- footer -->
        <c:import url="userFooter.jsp"/>

        <script>
            function formatPrice(price) {
                price = parseInt(price);
                if (price === 500000) {
                    return '500,000';
                } else if (price === 15000000) {
                    return '15tr';
                } else {
                    return price.toString(); // Default case: return the price as is
                }
            }
            var price1 = 500000;
            var formattedPrice1 = formatPrice(price1);
            console.log(formattedPrice1);
            function logout() {
                var btnToastDelete = document.querySelector('#btn-toast-delete');
                btnToastDelete.addEventListener('click', function () {
                    var deleteUrl = 'LogoutServlet';
                    window.location.href = deleteUrl;
                    // Nếu bạn muốn ẩn modal sau khi xác nhận, bạn có thể sử dụng đoạn mã sau:
                    document.getElementById('modalConfirmDelete').style.display = 'none';
                });
            }
            function previewImage(event) {
                var reader = new FileReader();
                reader.onload = function () {
                    var output = document.getElementById("preview");
                    output.src = reader.result;
                };

                var fileInput = event.target;
                var files = fileInput.files;

                if (files.length > 0) {
                    reader.readAsDataURL(files[0]);
                } else {
                    // Nếu không có file được chọn, đặt lại ảnh về trạng thái ban đầu
                    var output = document.getElementById("preview");
                    output.src = "#";
                }
            }
            function setTimeGreeting() {
                const currentHour = new Date().getHours();
                const titleElement = document.getElementById('title');

                if (currentHour >= 5 && currentHour < 11) {
                    titleElement.textContent = 'Chào buổi sáng!';
                } else if (currentHour >= 11 && currentHour < 13) {
                    titleElement.textContent = 'Chào buổi trưa!';
                } else if (currentHour >= 13 && currentHour < 18) {
                    titleElement.textContent = 'Chào buổi chiều!';
                } else if (currentHour >= 18 || currentHour < 5) {
                    titleElement.textContent = 'Chào buổi tối!';
                } else {
                    titleElement.textContent = 'Chào sáng sớm!';
                }
            }

            setTimeGreeting();


            //Xử lý sự kiện upload avatar
            var cameraIcon = document.getElementById('camera-icon');
            var fileInput = document.getElementById('file-input');
            const img = document.getElementById('avatar-img');

            cameraIcon.addEventListener('click', function () {
                fileInput.click();
            });

            fileInput.addEventListener('change', function () {
                var selectedFile = fileInput.files[0];
                if (selectedFile) {
                    var reader = new FileReader();
                    reader.onload = function (event) {
                        var fileData = event.target.result;
                        //lấy link ảnh này lưu vào database
                        console.log(fileData);

                        img.src = fileData;
                    };
                    reader.readAsDataURL(selectedFile);
                }
            });
            // Assume `load_profile` is an object containing the loaded profile data
            const healthCertificateValue = '${load_profile.health}';

            // Check if the health certificate value is "yes" or "no" and set the corresponding radio button as checked
            if (healthCertificateValue === 'yes') {
                document.getElementById('health-certificate-yes').checked = true;
            } else if (healthCertificateValue === 'no') {
                document.getElementById('health-certificate-no').checked = true;
            }
        </script>
    </body>

</html>