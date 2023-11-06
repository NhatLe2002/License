<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hồ sơ lái xe</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.2/mdb.min.css" rel="stylesheet" />

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
            .validation-message {
                color: red;
                font-size: 12px;
                display: none;
            }
        </style>
    </head>

    <body>
        <c:if test="${empty sessionScope.user }">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <c:import url="userHeader.jsp"/>

        <div class='mt-5 mb-5 d-flex gap-3 container container-driving-profile'>
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
                    <div class='title'>Nộp hồ sơ đăng kí lái xe</div>
                    <div class='user-profile d-flex gap-5 '>
                        <div class='left d-flex flex-column gap-3'>
                            <div class='avatar-user'>
                                <img id="avatar-img-user" src="data:image;base64," alt="Preview">
                            </div>
                        </div>

                        <div class='right d-flex flex-column'>
                            <div class="header-profile d-flex flex-column">
                                <div class='top-header-profile d-flex justify-content-between align-items-center gap-3'>
                                    <div
                                        class="left-top-header-profile d-flex justify-content-center align-items-center gap-3">
                                        <p class='user-name'>${load_profile.name}</p>
                                    </div>
                                </div>

                                <div class='role-name my-2'>
                                    <p>Thí sinh </p>
                                </div>
                            </div>

                            <div class="main d-flex flex-column">
                                <div class="main-top d-flex gap-4">
                                    <div class='about d-flex gap-2 active align-items-center'>
                                        <i class="fa-regular fa-address-card"></i>
                                        Thông tin
                                    </div>
                                    <div class='timeline d-flex gap-2 align-items-center'>
                                        cá nhân
                                    </div>
                                </div>
                                <div class="main-info d-flex flex-column justify-content-around">
                                    <form action="addtodrivingpro?id=${load_profile.getId()}" method="POST" enctype="multipart/form-data">
                                        <div class="contact-info">
                                            <p class='text-header-profile'>Thông tin liên lạc</p>
                                            <div class="content d-flex">
                                                <div class="label-info">
                                                    <label for="phoneNumber">Số điện thoại:</label>
                                                </div>
                                                <div class="input-info">
                                                    <input type="text" id="phoneNumber" name="phone" oninput="validatePhone()" value="${load_profile.phone}" readonly="">
                                                </div>
                                            </div>

                                            <div class="content d-flex">
                                                <div class="label-info">
                                                    <label for="email">Email:</label>
                                                </div>
                                                <div class="input-info">
                                                    <input type="text" id="email" name="email" value="${load_profile.email}" readonly="">
                                                </div>
                                            </div>
                                            <div class="content d-flex">
                                                <div class="label-info">
                                                    <label for="img_user">Ảnh 3x4:</label>
                                                </div>
                                                <div class="input-info">
                                                    <input type="file" name="img_user" id="file-input-user" onchange="previewImage(event)" accept="image/*">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="basic-info">
                                            <p class='text-header-profile'>Thông tin cơ bản</p>
                                            <div class="content d-flex">
                                                <div class="label-info">
                                                    <label for="full-name">Họ và tên:</label>
                                                </div>
                                                <div class="input-info">
                                                    <input type="text" id="full-name" oninput="validateFullName()" id="input-fullname" name="name" value="${load_profile.name}" readonly=""/>
                                                </div>
                                            </div>

                                            <div class="content d-flex">
                                                <div class="label-info">
                                                    <label for="birthdate">Ngày sinh:</label>
                                                </div>
                                                <div class="input-info">
                                                    <input type="date" id="birthdate" name="dob" value="${load_profile.dob}" readonly="">
                                                </div>
                                                <span id="age-validation-message" class="validation-message"></span>
                                            </div>
                                            <div class="content d-flex">
                                                <div class="label-info">
                                                    <label for="gender">Giới tính:</label>
                                                </div>
                                                <div class="input-info" style="margin-top: 20px;">

                                                    <div class="radio-buttons d-flex gap-3 justify-content-center align-items-center">
                                                        <input class="gender" type="radio" id="gender-male" name="gender" value="true" checked>
                                                        <label for="gender-male">Nam</label>
                                                        <input class="gender" type="radio" id="gender-female" name="gender" value="false">
                                                        <label for="gender-female">Nữ</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="content d-flex">
                                                <div class="label-info">
                                                    <label for="hometown">Quốc tịch:</label>
                                                </div>
                                                <div class="input-info">
                                                    <input type="text" id="hometown" value="Việt Nam" readonly="">
                                                </div>
                                            </div>

                                            <div class="content d-flex">
                                                <div class="label-info">
                                                    <label for="cccd">CCCD:</label>
                                                </div>
                                                <div class="input-info">
                                                    <input type="text" id="cccd" oninput="validateCCCD()" name="cccd" value="${load_profile.cccd}" readonly="">
                                                </div>
                                            </div>
                                            <div class="content d-flex">
                                                <div class="label-info">
                                                    <label for="img_cccd">Ảnh CCCD:</label>
                                                </div>
                                                <div class="input-info">
                                                    <input type="file" name="img_cccd" id="file-input-cccd"  onchange="previewImage(event)" accept="image/*">
                                                </div>
                                            </div>
                                            <div class='left d-flex flex-column gap-3'>
                                                <div class='avatar-user'>
                                                    <img id="avatar-img-cccd" src="data:image;base64," alt="Preview"></img>
                                                </div>
                                            </div>
                                            <div class="content d-flex">
                                                <div class="label-info">
                                                    <label for="address">Địa chỉ thường trú:</label>
                                                </div>
                                                <div class="input-info">
                                                    <input type="text" id="address"
                                                           name="address" value="${load_profile.address}" readonly="">
                                                </div>
                                            </div>
                                            <div class="content d-flex">
                                                <div class="label-info">
                                                    <label for="health-certificate">Giấy khám sức khỏe:</label>
                                                </div>
                                                <div class="input-info" style="margin-top: 20px;">
                                                    <div class="radio-buttons d-flex gap-3 justify-content-center align-items-center">
                                                        <input class="health-certificate" type="radio" id="health-certificate-yes" name="health" value="yes">
                                                        <label for="health-certificate-yes">Đã có</label>
                                                        <input class="health-certificate" type="radio" id="health-certificate-no" name="health" value="no">
                                                        <label for="health-certificate-no">Chưa có</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <input value="regisTest" name="type" hidden="" />
                                        <div class="mt-5 d-flex gap-3" style="margin-left: 150px;">
                                            <a style="text-decoration: none;
                                               color: inherit;" href="MainController?action=adddriver&id=${sessionScope.load_profile.getId()}"><button type="button" class="btn btn-primary">Hủy</button>
                                            </a> 
                                            <button class="btn btn-primary" type="submit">Thay đổi</button>

                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                        <!--                                                                       <div class="modal fade" id="modalConfirmSend" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                                                                 aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-centered">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="staticBackdropLabel">XÁC NHẬN THÔNG TIN</h5>
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            Hãy kiểm tra đầy đủ thông tin trước khi gửi! 
                                                                            <br/>
                                                                            Xác nhận gửi?
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                                                            <button type="button" class="btn btn-primary" id="btn-toast-send" class="btn-close"
                                                                                    data-bs-dismiss="modal" aria-label="Close">Xác nhận</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>-->
                    </div>

                </div>
            </div>

            <!-- toast thông báo thành công-->
            <c:if test="${not empty message}">
                <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11" >
                    <div id="toast-notification" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
                        <div class="toast-header">
                            <c:if test="${message eq 'success'}">
                                <strong id="toast-message" class="me-auto text-success"></strong>
                            </c:if>
                            <c:if test="${message eq 'fail'}">
                                <strong id="toast-message" class="me-auto text-danger"></strong>
                            </c:if>
                            <c:if test="${message eq 'exist'}">
                                <strong id="toast-message" class="me-auto text-danger"></strong>
                            </c:if>
                            <c:if test="${message eq 'notenough'}">
                                <strong id="toast-message" class="me-auto text-danger"></strong>
                            </c:if>
                            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>

        <!-- footer -->
        <c:import url="userFooter.jsp"/>
        <script>
            function validateEmail() {
                const emailInput = document.getElementById('email');
                const email = emailInput.value.trim();

                // Define the regular expression pattern for email validation
                const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

                // Check if the email matches the pattern
                if (emailPattern.test(email)) {
                    emailInput.classList.remove('error');
                } else {
                    emailInput.classList.add('error');
                }
            }
            function validatePhone() {
                var input = document.getElementById('phoneNumber');
                var value = input.value;

                // Remove any non-numeric characters
                var numericValue = value.replace(/[^0-9]/g, '');

                // Truncate the value if it exceeds the maximum length
                if (numericValue.length > 10) {
                    numericValue = numericValue.substring(0, 10);
                }

                // Update the input value
                input.value = numericValue;
            }
            function validateCCCD() {
                var input = document.getElementById('cccd');
                var value = input.value;

                // Loại bỏ các kí tự không phải là số
                var numericValue = value.replace(/[^0-9]/g, '');

                // Giới hạn độ dài tối đa là 12 số
                if (numericValue.length > 12) {
                    numericValue = numericValue.substring(0, 12);
                }

                // Cập nhật giá trị của ô input
                input.value = numericValue;
            }
            // Lấy ngày sinh từ input
            var dobInput = document.getElementById('birthdate');
            var dob = new Date(dobInput.value);

            // Lấy ngày hiện tại
            var currentDate = new Date();

            // Tính toán số tuổi
            var age = currentDate.getFullYear() - dob.getFullYear();
            if (currentDate.getMonth() < dob.getMonth() || (currentDate.getMonth() === dob.getMonth() && currentDate.getDate() < dob.getDate())) {
                age--;
            }

            // Kiểm tra nếu tuổi không đủ 18 tuổi
            if (age < 18) {
                // Hiển thị thông báo yêu cầu cập nhật thông tin
                var validationMessage = document.getElementById('age-validation-message');
                validationMessage.style.display = 'block';
                validationMessage.textContent = 'Bạn cần đủ 18 tuổi để thực hiện submit thông tin.';
                // Vô hiệu hóa nút submit
                document.getElementById('submit-button').disabled = true;
            } else {
                // Cho phép submit thông tin
                document.getElementById('submit-button').disabled = false;
            }

            // Lắng nghe sự kiện thay đổi ngày sinh
            dobInput.addEventListener('change', function () {
                // Lấy lại giá trị ngày sinh
                dob = new Date(dobInput.value);

                // Tính lại tuổi
                age = currentDate.getFullYear() - dob.getFullYear();
                if (currentDate.getMonth() < dob.getMonth() || (currentDate.getMonth() === dob.getMonth() && currentDate.getDate() < dob.getDate())) {
                    age--;
                }

                // Kiểm tra tuổi và hiển thị thông báo nếu cần
                if (age < 18) {
                    validationMessage.style.display = 'block';
                    validationMessage.textContent = 'Bạn cần đủ 18 tuổi để thực hiện submit thông tin.';
                    document.getElementById('submit-button').disabled = true;
                } else {
                    validationMessage.style.display = 'none';
                    document.getElementById('submit-button').disabled = false;
                }
            });
        </script>
        <script>
            function previewImage(event) {
                var reader = new FileReader();
                reader.onload = function () {
                    var fileInput = event.target;
                    var output;

                    if (fileInput.id === "file-input-user") {
                        output = document.getElementById("avatar-img-user");
                    } else if (fileInput.id === "file-input-cccd") {
                        output = document.getElementById("avatar-img-cccd");
                    }

                    if (output) {
                        output.src = reader.result;
                    }
                };

                var fileInput = event.target;
                var files = fileInput.files;

                if (files.length > 0) {
                    reader.readAsDataURL(files[0]);
                } else {
                    // Nếu không có file được chọn, đặt lại ảnh về trạng thái ban đầu
                    var output;

                    if (fileInput.id === "file-input-user") {
                        output = document.getElementById("avatar-img-user");
                    } else if (fileInput.id === "file-input-cccd") {
                        output = document.getElementById("avatar-img-cccd");
                    }

                    if (output) {
                        output.src = "#";
                    }
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
            // Assume `load_profile` is an object containing the loaded profile data
            const healthCertificateValue = '${load_profile.health}';

            // Check if the health certificate value is "yes" or "no" and set the corresponding radio button as checked
            if (healthCertificateValue === 'Đã có') {
                document.getElementById('health-certificate-yes').checked = true;
            } else if (healthCertificateValue === 'Chưa có') {
                document.getElementById('health-certificate-no').checked = true;
            }
        </script>
        <script>
//                    function showMess(id) {
//                        var btnToastDelete = document.querySelector('#btn-toast-send');
//                        btnToastDelete.addEventListener('click', function () {
//                            var deleteUrl = 'addtodrivingpro?id=' + id;
//                            window.location.href = deleteUrl;
//                            // Nếu bạn muốn ẩn modal sau khi xác nhận, bạn có thể sử dụng đoạn mã sau:
//                            document.getElementById('modalConfirmSend').style.display = 'none';
//                        });
//                    }

            window.addEventListener('DOMContentLoaded', (event) => {
                const message = '${message}'; // Lấy giá trị thông báo từ servlet
                if (message) {
                    showToast(message); // Gọi hàm hiển thị thông báo
                }
            });

            function showToast(message) {
                const toast = document.getElementById('toast-notification');
                const toastMessage = document.getElementById('toast-message');
                if (message === 'success') {
                    var success = 'Gửi thông tin hồ sơ thành công!';
                    toastMessage.textContent = success;
                } else if (message === 'fail') {
                    var fail = 'Không thể gửi thông tin hồ sơ!';
                    toastMessage.textContent = fail;
                } else {
                    var exist = 'Bạn đã gửi hồ sơ rồi!';
                    toastMessage.textContent = exist;
                }
                toast.classList.remove('hide');
                toast.classList.add('show');
                setTimeout(() => {
                    toast.classList.remove('show');
                }, 3000);
            }
            //            function showConfirmationPopup(id) {
            //                var btnToastSend = document.getElementById('btn-toast-send');
            //                btnToastSend.addEventListener('click', function () {
            //                    var deleteUrl = 'addtodrivingpro?id=' + id;
            //                    window.location.href = deleteUrl;
            //                    document.getElementById('modalConfirmSend').style.display = 'none'; // Ẩn modal sau khi xác nhận
            //                });
            //            }
        </script>
    </body>

</html>