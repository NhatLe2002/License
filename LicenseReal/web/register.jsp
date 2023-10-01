<%-- 
    Document   : register
    Created on : Sep 30, 2023, 12:16:12 PM
    Author     : emcua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng ký</title>
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
            }

            .container-register {
                max-width: 700px;
                width: 100%;
                background-color: #fff;
                padding: 25px 30px;
                border-radius: 5px;
                box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
            }

            .container-register .title {
                font-size: 25px;
                font-weight: 500;
                position: relative;
            }

            .container-register .title::before {
                content: '';
                position: absolute;
                height: 3px;
                width: 30px;
                left: 0;
                bottom: 0;
                background-color: #d4a373;
            }

            .container-register form .user-details {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                margin: 20px 0 12px 0;
            }

            .container-register form .user-details .input-box {
                margin-bottom: 15px;
                width: calc(100% / 2 - 20px);
            }

            .container-register .user-details .input-box .details {
                display: block;
                font-weight: 500;
                margin-bottom: 5px;
            }

            .container-register .user-details .input-box input {
                height: 45px;
                width: 100%;
                outline: none;
                border-radius: 5px;
                border: 1px solid #ccc;
                padding-left: 15px;
                font-size: 16px;
                border-bottom-width: 2px;
                transition: all 0.3s ease;
            }

            .user-details .input-box input:focus,
            .user-details .input-box input:valid {
                border-color: #d4a373
            }

            form .gender-details .gender-title {
                font-size: 20px;
                font-weight: 500;
            }

            form .gender-details .category {
                display: flex;
                width: 80%;
                margin: 14px 0;
                justify-content: space-between;
                gap: 3rem;
            }

            .gender-details .category label {
                display: flex;
                align-items: center;
            }

            .gender-details .category .dot {
                height: 18px;
                width: 18px;
                background: #d9d9d9;
                border-radius: 50%;
                margin-right: 10px;
                border: 5px solid transparent;
                transition: all 0.3s ease
            }

            #dot-1:checked~.category .one,
            #dot-2:checked~.category .two,
            #dot-3:checked~.category .three {
                border-color: #d9d9d9;
                background: #d4a373;
            }

            .container-register form input[type="radio"] {
                display: none;
            }

            .container-register form .button-register {
                height: 45px;
                cursor: pointer;
            }

            .container-register form .button-register input {
                height: 100%;
                width: 100%;
                outline: none;
                color: #fff;
                border: none;
                font-size: 18px;
                font-weight: 500;
                border-radius: 5px;
                letter-spacing: 1px;
                cursor: pointer;
                background-color: #ccd5ae;
            }
            .container-register form .button-register button {
                height: 100%;
                width: 100%;
                outline: none;
                color: #fff;
                border: none;
                font-size: 18px;
                font-weight: 500;
                border-radius: 5px;
                letter-spacing: 1px;
                cursor: pointer;
                background-color: #ccd5ae;
            }

            .container-register form .button-register input:hover {
                background-color: #d4a373;
            }
        </style>

    </head>

    <body
        style="padding: 10px; display: flex; height: 100vh; justify-content: center; align-items: center; background-color: #fefae0;">
        <div class="container-register">
            <a href="./index.html" style="color: #000;">
                <div class="d-flex align-items-center gap-2">
                    <img src="https://cdn-icons-png.flaticon.com/512/6556/6556219.png" alt="logo"
                         style="width: 100px; height: auto; opacity: 0.8;" />
                    <span class="h1 fw-bold mb-0">DaoTaoLaiXe</span>
                </div>
            </a>

            <div class="title">Đăng kí</div>
            <form action="MainController" method ="POST">
                <div class="user-details">
                    <div class="input-box">
                        <span class="details">Tên tài khoản</span>
                        <input name="username" type="text" placeholder="Vui lòng nhập tài khoản" required>
                    </div>

                    <div class="input-box">
                        <span class="details">Mật khẩu</span>
                        <input name="password" type="password" placeholder="Vui lòng nhập mật khẩu" required>
                    </div>

                    <div class="input-box">
                        <span class="details">Xác nhận mật khẩu</span>
                        <input name="confirmPassword" type="password" placeholder="Xác nhận lại mật khẩu" required>
                    </div>

                    <!-- Cái này là bonus nếu có nhu cầu -->
                    <!-- <div class="gender-details">
                        <input type="radio" name="gender" id="dot-1">
                        <input type="radio" name="gender" id="dot-2">
                        <input type="radio" name="gender" id="dot-3">
                       
                        <span class="gender-title">Gender</span>
                        <div class="category">
                            <label for="dot-1">
                                <span class="dot one"></span>
                                <span class="gender">Male</span>
                            </label>
    
                            <label for="dot-2">
                                <span class="dot two"></span>
                                <span class="gender">Female</span>
                            </label>
    
                            <label for="dot-3">
                                <span class="dot three"></span>
                                <span class="gender">Other</span>
                            </label>
                        </div>
                    </div> -->
                </div>

                <div class="button-register">
                    <button name="action" type="submit" value="register">Đăng ký</button>

                </div>

            </form>
            ${message}
        </div>
    </body>

</html>
