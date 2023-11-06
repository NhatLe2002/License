<%-- 
    Document   : createStaff
    Created on : Nov 3, 2023, 12:56:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tạo Nhân Viên Mới</title>
        <style>
            .error {
                color: red;
            }
        </style>
    </head>
    <body>
        <div class="container-xxl flex-grow-1 container-p-y">
            <h4 class="py-3 mb-4">
                <span class="text-muted fw-light">Forms/</span> Tạo Nhân Viên Mới
            </h4>
            <div class="row">
                <div class="col-xl">
                    <div class="card mb-4">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="mb-0">Nhập các thông tin sau</h5>
                        </div>
                        <div class="card-body">
                            <form action="CreateStaffServlet?actionManage=read" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">
                                <!-- Tên đăng nhập -->
                                <label for="username">Tên đăng nhập:</label>
                                <input type="text" id="username" name="username" >
                                <span id="username_error" class="error"></span><br><br>

                                <!-- Mật khẩu -->
                                <label for="password">Mật khẩu:</label>
                                <input type="password" id="password" name="password" required>
                                <span id="password_error" class="error"></span><br><br>

                                <!-- Nhập lại mật khẩu -->
                                <label for="confirm_password">Nhập lại mật khẩu:</label>
                                <input type="password" id="confirm_password" name="confirm_password" required>
                                <span id="confirm_password_error" class="error"></span><br><br>

                                <!-- Tên -->
                                <label for="name">Tên:</label>
                                <input type="text" id="name" name="name" required>
                                <span id="name_error" class="error"></span><br><br>

                                <!-- Số Điện Thoại -->
                                <label for="phone">Số Điện Thoại:</label>
                                <input type="tel" id="phone" name="phone"><br><br>

                                <!-- Email -->
                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email" required>
                                <span id="email_error" class="error"></span><br><br>

                                <!-- Ngày Sinh -->
                                <label for="dob">Ngày Sinh:</label>
                                <input type="date" id="dob" name="dob">
                                <span id="dob_error" class="error"></span><br><br>

                                <!-- Căn Cước Công Dân -->
                                <label for="cccd">Căn Cước Công Dân:</label>
                                <input type="text" id="cccd" name="cccd"><br><br>

                                <!-- Địa chỉ -->
                                <label for="address">Địa chỉ:</label>
                                <textarea id="address" name="address" rows="4"></textarea><br><br>

                                <!-- Hình ảnh -->
                                <label for="avatar">Hình ảnh:</label>
                                <input type="file" id="avatar" name="avatar" accept="image/*"><br><br>
                                
                                
                                
                                <button type="submit" class="btn btn-primary">
                                    Tạo Nhân Viên
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function validateForm() {
                var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;
                var confirm_password = document.getElementById("confirm_password").value;
                var name = document.getElementById("name").value;
                var email = document.getElementById("email").value;
                var dob = document.getElementById("dob").value;

                // Xóa tất cả thông báo lỗi trước khi kiểm tra lại
                clearErrors();

                var isValid = true;

                if (username === "") {
                    displayError("username", "Vui lòng nhập Tên đăng nhập");
                    isValid = false;
                }
                if (password === "") {
                    displayError("password", "Vui lòng nhập Mật khẩu");
                    isValid = false;
                }
                if (password !== confirm_password) {
                    displayError("confirm_password", "Mật khẩu và Nhập lại mật khẩu không khớp");
                    isValid = false;
                }
                if (name === "") {
                    displayError("name", "Vui lòng nhập Tên");
                    isValid = false;
                }
                if (email === "") {
                    displayError("email", "Vui lòng nhập Email");
                    isValid = false;
                }
                if (dob === "") {
                    displayError("dob", "Vui lòng nhập Ngày Sinh");
                    isValid = false;
                }

                // Nếu tất cả thông tin hợp lệ, cho phép submit form
                return isValid;
            }

            function displayError(fieldId, errorMessage) {
                var errorElement = document.getElementById(fieldId + "_error");
                errorElement.innerHTML = errorMessage;
            }

            function clearErrors() {
                var errorElements = document.getElementsByClassName("error");
                for (var i = 0; i < errorElements.length; i++) {
                    errorElements[i].innerHTML = "";
                }
            }
    </script>
</body>
</html>
