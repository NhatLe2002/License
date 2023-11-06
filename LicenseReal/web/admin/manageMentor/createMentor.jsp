<%-- 
    Document   : createMentor
    Created on : Nov 3, 2023, 10:23:27 PM
    Author     : HOANG ANH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
            />

        <title>Quản lý nhân viên</title>

        <meta name="description" content="" />

        <!-- Favicon -->
        <link
            rel="icon"
            type="image/x-icon"
            href="https://cdn-icons-png.flaticon.com/512/6556/6556219.png"
            />

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
            />

        <link rel="stylesheet" href="./assets/vendor/fonts/boxicons.css" />

        <!-- Core CSS -->
        <link
            rel="stylesheet"
            href="./assets/vendor/css/core.css"
            class="template-customizer-core-css"
            />
        <link
            rel="stylesheet"
            href="./assets/vendor/css/theme-default.css"
            class="template-customizer-theme-css"
            />
        <link rel="stylesheet" href="./assets/css/demo.css" />

        <!-- Vendors CSS -->
        <link
            rel="stylesheet"
            href="./assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"
            />

        <!-- Page CSS -->

        <!-- Helpers -->
        <script src="./assets/vendor/js/helpers.js"></script>
        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="./assets/js/config.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    </head>
    <body>
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <c:if test="${empty sessionScope.ROLE}">
                    <c:redirect url="login.jsp"></c:redirect>
                </c:if>
                <c:import url="../../menu.jsp"/>
                <div class="layout-page">
                    <div class="content-wrapper">
                        <div class="container-xxl flex-grow-1 container-p-y">
                            <h4 class="py-3 mb-4">
                                <span class="text-muted fw-light">Forms/</span> Tạo Người Hướng Dẫn Mới
                            </h4>
                            <div class="row">
                                <div class="col-xl">
                                    <div class="card mb-4">
                                        <div class="card-header d-flex justify-content-between align-items-center">
                                            <h5 class="mb-0">Nhập các thông tin sau</h5>
                                        </div>
                                        <div class="card-body">
                                            <form action="creatementor" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">
                                                <!-- Tên đăng nhập -->
                                                <div class="mb-3">
                                                    <label for="username" class="form-label"
                                                           >Tên đăng nhập:</label
                                                    >
                                                    <input
                                                        type="text"
                                                        id="username"
                                                        class="form-control"
                                                        placeholder="Tên đăng nhập"
                                                        name="username" required=""
                                                        />
                                                </div>
                                                <span id="username_error" class="error"></span><br>
                                                <!-- Mật khẩu -->
                                                <div class="mb-3">
                                                    <label for="password" class="form-label"
                                                           >Mật khẩu:</label
                                                    >
                                                    <input
                                                        type="password"
                                                        id="password"
                                                        class="form-control"
                                                        placeholder="Mật khẩu"
                                                        name="password" required=""
                                                        />
                                                </div>
                                                <span id="password_error" class="error"></span><br>

                                                <!-- Nhập lại mật khẩu -->
                                                <div class="mb-3">
                                                    <label for="confirm_password" class="form-label"
                                                           >Nhập lại mật khẩu:</label
                                                    >
                                                    <input
                                                        type="password"
                                                        id="confirm_password"
                                                        class="form-control"
                                                        placeholder="Nhập lại mật khẩu"
                                                        name="confirm_password" required=""
                                                        />
                                                </div>
                                                <span id="confirm_password_error" class="error"></span><br>

                                                <!-- Tên -->
                                                <div class="mb-3">
                                                    <label for="name" class="form-label"
                                                           >Tên:</label
                                                    >
                                                    <input
                                                        type="text"
                                                        id="name"
                                                        class="form-control"
                                                        placeholder="Tên"
                                                        name="name" required=""
                                                        />
                                                </div>
                                                <span id="name_error" class="error"></span><br>
                                                <!-- Số Điện Thoại -->
                                                <div class="mb-3">
                                                    <label for="phone" class="form-label"
                                                           >Số Điện Thoại:</label
                                                    >
                                                    <input
                                                        type="tel"
                                                        id="phone"
                                                        class="form-control"
                                                        placeholder="Số Điện Thoại"
                                                        name="phone" required=""
                                                        />
                                                </div>
                                                <span id="phone_error" class="error"></span><br>
                                                <!-- Email -->
                                                <div class="mb-3">
                                                    <label for="email" class="form-label"
                                                           >Email:</label
                                                    >
                                                    <input
                                                        type="email"
                                                        id="email"
                                                        class="form-control"
                                                        placeholder="Email"
                                                        name="email" required=""
                                                        />
                                                </div>
                                                <span id="email_error" class="error"></span><br>

                                                <!-- Ngày Sinh -->
                                                <div class="mb-3">
                                                    <label for="dob" class="form-label"
                                                           >Ngày Sinh:</label
                                                    >
                                                    <input
                                                        type="date"
                                                        id="dob"
                                                        class="form-control"
                                                        placeholder="Ngày Sinh"
                                                        name="dob" required=""
                                                        />
                                                </div>
                                                <span id="dob_error" class="error"></span><br>
                                                <!-- Căn Cước Công Dân -->
                                                <div class="mb-3">
                                                    <label for="cccd" class="form-label"
                                                           >Căn Cước Công Dân:</label
                                                    >
                                                    <input
                                                        type="text"
                                                        id="cccd"
                                                        class="form-control"
                                                        placeholder="Căn Cước Công Dân"
                                                        name="cccd" required=""
                                                        />
                                                </div>
                                                <span id="cccd_error" class="error"></span><br>
                                                <!-- Địa chỉ -->
                                                <div class="mb-3">
                                                    <label for="address" class="form-label"
                                                           >Địa chỉ:</label
                                                    >
                                                    <input
                                                        type="text"
                                                        id="address"
                                                        class="form-control"
                                                        placeholder="Địa chỉ"
                                                        name="address" required=""
                                                        />
                                                </div>
                                                <span id="address_error" class="error"></span><br>
                                                <!-- Hình ảnh -->
                                                <div class="mb-3" >
                                                    <label for="formFile" class="form-label"
                                                           >Chọn đường dẫn hình ảnh</label
                                                    >
                                                    <input
                                                        class="form-control"
                                                        type="file"
                                                        name="avatar" id="fileInput" onchange="previewImage(event)" accept="image/*""
                                                        />
                                                    <div class="file-img" id="image" style="padding-top: 1rem; display: none">
                                                        <img id="preview" src="#" alt="Preview" style="max-height: 10rem; max-width: 20rem;"/>
                                                        <button type="button" onclick="resetImage()" class="btn btn-primary">Xóa ảnh</button>
                                                    </div>
                                                </div>
                                                <button type="submit" class="btn btn-primary">
                                                    Tạo Nhân Viên
                                                </button>
                                                <a style="text-decoration: none;
                                                   color: inherit;" href="MainController?action=mentorStaff"><button type="button" class="btn btn-primary">Hủy</button>
                                                </a>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        function validateForm() {
            var username = document.getElementById('username').value;
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirm_password').value;
            var name = document.getElementById('name').value;
            var phone = document.getElementById('phone').value;
            var email = document.getElementById('email').value;
            var dob = document.getElementById('dob').value;
            var cccd = document.getElementById('cccd').value;

            var valid = true;

            // Kiểm tra Tên đăng nhập
            var usernameRegex = /^[a-zA-Z0-9]{8,}$/;
            if (!usernameRegex.test(username)) {
                document.getElementById('username_error').textContent =
                        'Tên đăng nhập phải có ít nhất 8 kí tự và chỉ chứa chữ và số.';
                valid = false;
            } else {
                document.getElementById('username_error').textContent = '';
            }

            // Kiểm tra Mật khẩu
            if (password.length < 8) {
                document.getElementById('password_error').textContent =
                        'Mật khẩu phải có ít nhất 8 kí tự.';
                valid = false;
            } else {
                document.getElementById('password_error').textContent = '';
            }

            // Kiểm tra Nhập lại mật khẩu
            if (password !== confirmPassword) {
                document.getElementById('confirm_password_error').textContent =
                        'Mật khẩu không khớp.';
                valid = false;
            } else {
                document.getElementById('confirm_password_error').textContent = '';
            }

            // Kiểm tra Tên
            // Kiểm tra Số điện thoại
            var phoneRegex = /^0\d{9}$/;
            if (!phoneRegex.test(phone)) {
                document.getElementById('phone_error').textContent =
                        'Số điện thoại không hợp lệ. Vui lòng nhập số điện thoại gồm 10 số và bắt đầu bằng số 0.';
                valid = false;
            } else {
                document.getElementById('phone_error').textContent = '';
            }

            // Kiểm tra Email
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                document.getElementById('email_error').textContent =
                        'Email không hợp lệ.';
                valid = false;
            } else {
                document.getElementById('email_error').textContent = '';
            }

            // Kiểm tra Ngày sinh
            var currentDate = new Date();
            var minDate = new Date();
            minDate.setFullYear(currentDate.getFullYear() - 25);
            if (new Date(dob) > minDate) {
                document.getElementById('dob_error').textContent =
                        'Bạn phải trên 25 tuổi để đăng ký.';
                valid = false;
            } else {
                document.getElementById('dob_error').textContent = '';
            }

            // Kiểm tra Căn cước công dân
            var cccdRegex = /^\d{12}$/;
            if (!cccdRegex.test(cccd)) {
                document.getElementById('cccd_error').textContent =
                        'Căn cước công dân không hợp lệ. Vui lòng nhập đúng 12 số.';
                valid = false;
            } else {
                document.getElementById('cccd_error').textContent = '';
            }

            return valid;
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
                var img = document.getElementById("image");
                reader.readAsDataURL(files[0]);
                img.style.display = 'inline-grid';
            } else {
                // Nếu không có file được chọn, đặt lại ảnh về trạng thái ban đầu
                var output = document.getElementById("preview");
                output.src = "#";
            }
        }
        function resetImage() {
            // Lấy thẻ <input> theo id
            var inputElement = document.getElementById("fileInput");

            // Đặt lại giá trị của thẻ <input> thành rỗng
            inputElement.value = "";

            // Lấy thẻ <img> theo id
            var imgElement = document.getElementById("preview");

            // Đặt lại giá trị src của thẻ <img> thành giá trị mặc định
            imgElement.src = "#";

            // Ẩn thẻ <img>
            var imageContainer = document.getElementById("image");
            imageContainer.style.display = "none";
        }

    </script>
</html>
