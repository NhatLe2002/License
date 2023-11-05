<%-- 
    Document   : Login
    Created on : Sep 29, 2023, 9:27:07 PM
    Author     : emcua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng nhập</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link
            rel="icon"
            type="image/x-icon"
            href="https://cdn-icons-png.flaticon.com/512/6556/6556219.png"
            />
        <style>
            body {
                background-color: #fefae0;
            }

            a {
                text-decoration: none;
            }

            .container-wrapper {
                width: 1024px;
                margin: 0 auto;
                padding: 20px;
                box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
            }

            .login-image {
                object-fit: cover;
                object-position: left;
                width: 100%;
            }

        </style>
    </head>

    <body style="height: 100vh; display: flex; justify-content: center; align-items: center">
        <div class="container-wrapper bg-light">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6 text-black">
                        <!-- điều hướng cái này về trang home khi bấm vào -->
                        <a href="/#" style="color: #000;">
                            <div class="d-flex align-items-center gap-2">
                                <img src="https://cdn-icons-png.flaticon.com/512/6556/6556219.png" alt="logo"
                                     style="width: 100px; height: auto; opacity: 0.8;" />
                                <span class="h1 fw-bold mb-0">DaoTaoLaiXe</span>
                            </div>
                        </a>
                        <!-- login form -->
                        <div class="d-flex align-items-center h-custom-2 pt-5 pt-xl-0 mt-xl-n5">
                            <form action="MainController" method="POST" style="width: 23rem;">
                                <h3 class="fw-normal mb-3 pb-3" style="font-size: 25px;">Chào mừng bạn đã quay trở lại!
                                </h3>
                                <div class="form-outline mb-4">
                                    <label class="form-label" for="form2Example18">Tên tài khoản</label>
                                    <input name="username" type="text" id="form2Example18" class="form-control form-control-lg required" />
                                </div>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="form2Example28">Mật khẩu</label>
                                    <input name="password" type="password" id="form2Example28" class="form-control form-control-lg required" />
                                </div>

                                <div class="pt-1 mb-4">
                                    <button type="submit" name="action" value="login"class="btn btn-info btn-lg btn-block" type="button">Đăng nhập</button>
                                    <a href="MainController">
                                        <button type="button" class="btn btn-info btn-lg btn-block" >Trở về</button>
                                    </a>
                                </div>
                                <p>Chưa có tài khoản? <a href="MainController?action=registerPage" class="link-info">Đăng ký ngay</a></p>
                                <p>Quên mật khẩu? <a href="MainController?action=forgotPasswordPage" class="link-info">Lấy lại mật khẩu</a></p>
                                ${message}
                            </form>
                        </div>
                    </div>
                    <div class="col-sm-6 px-0 d-flex justify-content-center">
                        <img src="https://daotaolaixehd.com.vn/wp-content/uploads/2020/06/600-cau-h%E1%BB%8Fi.png"
                             alt="Login image" class="login-image" />
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>
