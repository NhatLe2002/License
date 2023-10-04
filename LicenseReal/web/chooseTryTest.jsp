<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />

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

            /* style chọn thông tin thi */
            .choose-exam-screen {
                background-color: #edede9;
                padding: 20px;
                box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
                border-radius: 5px;
                margin: 20px auto;
                max-width: 600px;
            }

            .choose-exam-screen h1 {
                text-align: center;
                color: #333;
            }

            .choose-exam-screen .form-group {
                margin-bottom: 20px;
            }

            .choose-exam-screen label {
                font-weight: bold;
            }

            .choose-exam-screen .input-group-text {
                width: 100%;
            }

            .choose-exam-screen .btn {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .choose-exam-screen .btn-start {
                display: block;
                margin: 0 auto;
                text-align: center;
                background-color: #007bff;
                color: #fff;
                padding: 10px 20px;
            }

            .choose-exam-screen .btn-primary:hover {
                background-color: #0056b3;
            }

            /* style màn hình thi */
            .test-exam-screen {
                position: relative;
                background-color: #f5f5f5;
                border-radius: 5px;
                margin: 20px auto;
                max-width: 1024px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
                transform: translateX(-13.5%);
            }

            .selected-answer {
                position: absolute;
                display: flex;
                flex-wrap: wrap;
                width: 23%;
                min-height: 20vh;
                padding: 1%;
                border-radius: 5px;
                background-color: #f5f5f5;
                box-shadow: 0 0 10px -5px;
                right: -280px;
                top: 0;
                flex-direction: column;
                justify-content: space-between;
                align-items: center;
            }

            .selected-answer-container {
                display: flex;
                flex-direction: row;
                flex-wrap: wrap;
            }

            .selected-answer-tab {
                width: 30px;
                height: 40px;
                background-color: #ffffff;
                border: 1px solid rgb(87, 87, 87);
                border-radius: 5px;
                margin: 5px 11px;
                box-shadow: 0 0 10px -5px;
                text-align: center;
                cursor: pointer;
            }

            .selected-answer-tab.active {
                background-color: #ffcc00;
            }

            .selected-answer .submit-button {
                width: auto;
            }

            /* style info container */
            .extra-container {
                border-top: 1px solid black;
            }

            .extra-container .row {
                padding-top: 20px;
            }

            .extra-container .info-user {
                padding: 0px 30px;
            }

            .extra-container .info-user .avatar {
                width: 150px;
                height: 100%;
            }

            .extra-container .info-user .avatar img {
                width: 100%;
                object-fit: cover;
            }

            /* style kết quả */
            .result-screen {
                background-color: #fff;
                border: 2px solid #007bff;
                padding: 20px;
                border-radius: 10px;
                text-align: center;
                max-width: 400px;
                margin: 0 auto;
                margin-top: 20px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            }

            .result-screen h1 {
                font-size: 24px;
                color: #333;
                margin-bottom: 20px;
            }

            .result-screen p {
                font-size: 18px;
                color: #555;
                margin-bottom: 10px;
            }

            .result-screen #resultMessage {
                font-weight: bold;
                color: #007bff;
            }

            .result-screen button {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                margin-top: 20px;
            }

            .result-screen button:hover {
                background-color: #d4a373;
            }

            /* lms form */
            .test-exam-screen .form-container {
                display: flex;
                align-items: center;
                padding: 20px 0;
                border-bottom: 1px solid black;
            }

            .question-number {
                flex: 20%;
                text-align: center;
                height: 200px;
                border-right: 1px solid black;
            }

            .question-list {
                margin: 20px 0 0 0;
                list-style-type: none;
            }

            .question-list label {
                cursor: pointer;
            }

            .question-list input {
                cursor: pointer;
            }

            .question-input {
                margin: 10px 0;
            }

            .question-number span {
                font-weight: bold;
            }

            .question-content {
                flex: 80%;
                padding-left: 20px;
            }

            .question-content .paralysis-question {
                color: red;
                font-size: 25px;
                margin-right: 50px;
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 2px;
            }

            .question-content .paralysis-question p {
                margin-bottom: 0px;
            }

            .question-img img {
                max-width: 90%;
                object-fit: contain;
            }

            .countdown-timer {
                color: red;
                font-size: 30px;
                text-align: center;
            }

            label {
                display: block;
                margin-bottom: 5px;
            }
        </style>
    </head>

    <body>
        <header class="header">
            <div class="main__navbar">
                <div class="container mx-auto d-flex align-items-center gap-1 justify-content-between">
                    <div class="logo">
                        <a href="./index.html" class="d-flex align-items-center gap-2">
                            <img src="https://cdn-icons-png.flaticon.com/512/6556/6556219.png" alt="Logo" class="w-8 h-8" />
                            <h3 class="text-xl font-bold uppercase">DaoTaoLaiXe</h3>
                        </a>
                    </div>

                    <div class="menu">
                        <a class="menu_items menu_items_active" href="./index.html">Home</a>
                        <a class="menu_items" href="/#">Hỗ trợ</a>
                        <a class="menu_items" href="/#">Thông tin lý thuyết</a>
                        <a class="menu_items" href="/#">Lịch thi</a>
                        <a class="menu_items" href="./test-exam.html">Thi thử trắc nghiệm</a>
                        <a class="btn_login" href="./login.html">Đăng nhập</a>
                    </div>
                </div>
            </div>
        </header>

        <!-- màn hình chọn thông tin thi thử -->
        <div class="choose-exam-screen">
            <div class="container">
                <h1>Bắt đầu thi thử trắc nghiệm</h1>
                <form action="UserQuestionController" method="POST">
                    <div class="form-group">
                        <label for="fullname">Họ và tên:</label>
                        <input type="text" id="fullname" class="form-control" name="fullname" required>
                    </div>
                    <div class="form-group">
                        <label for="license">Hạng xe thi:</label>
                        <input id="license" type="text" class="input-group-text" name="type" value="Ô tô hạng B2 - số sàn" disabled>
                    </div>
                    <div class="form-group">
                        <label for="exam">Chọn đề thi:</label>
                        <select id="exam" class="form-select" name="topic" required>
                            <option selected disabled hidden>Mở lựa chọn</option>
                            <option value="0">Chọn đề ngẫu nhiên</option>
                            <option value="1">Đề thi số 1</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary btn-start">Bắt đầu thi</button>
                </form>

            </div>
        </div>
    </body>

</html>