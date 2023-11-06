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
                                <span class="text-muted fw-light">Forms/</span> Tạo Nhân Viên Mới
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
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
