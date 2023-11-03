<%-- 
    Document   : confirmOTP
    Created on : Oct 7, 2023, 4:11:57 PM
    Author     : emcua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xác nhận OTP</title>
    </head>
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

        /* content */
        .forgot-password .form-container {
            width: 40%;
            min-height: 50vh;
            margin: 120px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .forgot-password .form-container .email{
            width: 80%;
        }

        .forgot-password .notification {
            text-align: center;
            font-size: 13px;
            color: red;
            /* margin: px 0; */
        }

        /* OTP */

        .otp-Form {
            width: 400px;
            height: 550px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px 30px;
            margin: 0 auto;
            gap: 20px;
            position: relative;
        }

        .mainHeading {
            font-size: 2em;
            color: rgb(15, 15, 15);
            font-weight: 700;
        }

        .otpSubheading {
            font-size: 1em;
            color: black;
            line-height: 17px;
            text-align: center;
        }

        .inputContainer {
            width: 100%;
            display: flex;
            flex-direction: row;
            margin: 20px 0;
            gap: 15px;
            align-items: center;
            justify-content: center;
        }

        .otp-input {
            background-color: rgb(228, 228, 228);
            width: 50px;
            height: 50px;
            text-align: center;
            border: none;
            border-radius: 7px;
            caret-color: rgb(127, 129, 255);
            color: rgb(44, 44, 44);
            outline: none;
            font-weight: 600;
        }

        .otp-input:focus,
        .otp-input:valid {
            background-color: rgba(127, 129, 255, 0.199);
            transition-duration: .3s;
        }

        .verifyButton {
            width: 100%;
            height: 60px;
            border: none;
            background-color: rgb(127, 129, 255);
            color: white;
            font-weight: 600;
            cursor: pointer;
            border-radius: 10px;
            transition-duration: .2s;
        }

        .verifyButton:hover {
            background-color: rgb(144, 145, 255);
            transition-duration: .2s;
        }

        .resendNote {
            font-size: 0.7em;
            color: black;
            width: 100%;
            margin-top: 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 5px;
        }

        .resendBtn {
            background-color: transparent;
            border: none;
            color: rgb(127, 129, 255);
            cursor: pointer;
            font-size: 1.1em;
            font-weight: 700;
        }

        /* footer */
        .footer {
            width: 100%;
        }
    </style>
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

        /* content */
        .forgot-password .form-container {
            width: 40%;
            min-height: 50vh;
            margin: 120px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .forgot-password .form-container .email{
            width: 80%;
        }

        .forgot-password .notification {
            text-align: center;
            font-size: 13px;
            color: red;
            /* margin: px 0; */
        }

        /* OTP */

        .otp-Form {
            width: 400px;
            height: 550px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px 30px;
            margin: 0 auto;
            gap: 20px;
            position: relative;
        }

        .mainHeading {
            font-size: 2em;
            color: rgb(15, 15, 15);
            font-weight: 700;
        }

        .otpSubheading {
            font-size: 1em;
            color: black;
            line-height: 17px;
            text-align: center;
        }

        .inputContainer {
            width: 100%;
            display: flex;
            flex-direction: row;
            margin: 20px 0;
            gap: 15px;
            align-items: center;
            justify-content: center;
        }

        .otp-input {
            background-color: rgb(228, 228, 228);
            width: 50px;
            height: 50px;
            text-align: center;
            border: none;
            border-radius: 7px;
            caret-color: rgb(127, 129, 255);
            color: rgb(44, 44, 44);
            outline: none;
            font-weight: 600;
        }

        .otp-input:focus,
        .otp-input:valid {
            background-color: rgba(127, 129, 255, 0.199);
            transition-duration: .3s;
        }

        .verifyButton {
            width: 100%;
            height: 60px;
            border: none;
            background-color: rgb(127, 129, 255);
            color: white;
            font-weight: 600;
            cursor: pointer;
            border-radius: 10px;
            transition-duration: .2s;
        }

        .verifyButton:hover {
            background-color: rgb(144, 145, 255);
            transition-duration: .2s;
        }

        .resendNote {
            font-size: 0.7em;
            color: black;
            width: 100%;
            margin-top: 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 5px;
        }

        .resendBtn {
            background-color: transparent;
            border: none;
            color: rgb(127, 129, 255);
            cursor: pointer;
            font-size: 1.1em;
            font-weight: 700;
        }

        /* footer */
        .footer {
            width: 100%;
        }
    </style>
    <body>
        <c:import url="userHeader.jsp"/>

        <form method="POST" action="MainController" class="otp-Form " >

            <span class="mainHeading">Nhập OTP</span>
            <p class="otpSubheading">Mã OTP đã được gửi qua email của bạn</p>
            <p class="otpSubheading otp-email">${email}</p>
            <p hidden class="OTP" name="OTP" value="${sessionScope.OTP}"></p>
            <div class="inputContainer" name="confirmOTP">
                <input  maxlength="1" type="text" class="otp-input" id="otp-input1">
                <input  maxlength="1" type="text" class="otp-input" id="otp-input2">
                <input maxlength="1" type="text" class="otp-input" id="otp-input3">
                <input  maxlength="1" type="text" class="otp-input" id="otp-input4">
                <input maxlength="1" type="text" class="otp-input" id="otp-input5">
                <input  maxlength="1" type="text" class="otp-input" id="otp-input6">
                <!--<input  hidden name="confirmOTP" value="123"></input>-->
            </div>
            <div class="notification otp-notification"></div>
            <button name="action" value="confirmOTP" type="submit" class="verifyButton" >Xác nhận</button>


        </form>
        <p class="resendNote">Không nhận được mã? <button class="resendBtn" name="action" value="resendOTP" type="submit">Gửi lại</button></p>
        <c:import url="userFooter.jsp"/> 
        <script>

            const notifi = document.querySelectorAll(".notification")
            const form = document.querySelector('.otp-Form');
            const confirmOTPInput = document.querySelector('input[name="confirmOTP"]');
            const resendBtn = document.querySelector('.resendBtn');
            const otpElement = document.querySelector('.OTP');
            const otpValue = otpElement.getAttribute('value');
            const otp1 = document.getElementById("otp-input1");
            const otp2 = document.getElementById("otp-input2");
            const otp3 = document.getElementById("otp-input3");
            const otp4 = document.getElementById("otp-input4");
            const otp5 = document.getElementById("otp-input5");
            const otp6 = document.getElementById("otp-input6");
            const otpEmailElement = document.querySelector('.otpSubheading.otp-email');
            const email = otpEmailElement.textContent;
            const hiddenEmail = email.substring(5).padStart(email.length, '*');
            otpEmailElement.textContent = hiddenEmail;
            // xử lý sự kiện xác nhận OTP
            function addNotifi(text) {
                notifi.forEach((item) => {
                    item.innerText = text
                })
            }
            resendBtn.addEventListener('click', function () {
                location.reload();
            });
            form.addEventListener('submit', function (event) {
                event.preventDefault(); // Prevent the form from submitting

                // Get the concatenated value of OTP inputs
                const otpValueConfirm = otp1.value + otp2.value + otp3.value + otp4.value + otp5.value + otp6.value;
                // Set the value of the confirmOTP input
                if (otpValue === otpValueConfirm) {
                    window.location.href = "http://localhost:8080/LicenseReal/MainController?action=confirmOTP"
                } else {
                    addNotifi("OTP không đúng.")
                }
//            console.log(confirmOTPInput.value);
                // Submit the form
//                
            })
                    ;

        </script>
    </body>
</html>
