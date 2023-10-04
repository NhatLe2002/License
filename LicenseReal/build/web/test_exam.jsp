<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            .selected {
                background-color: orange;
            }
            .popup-overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                display: none;
                align-items: center;
                justify-content: center;
                z-index: 9999;
            }
            .popup-content {
                position: relative;
                background-color: #fff;
                padding: 20px;
                width: 20rem;
                height: 25rem;
                overflow: hidden;
                border-radius: 2rem;
                display: flex;
                flex-direction: column;
                align-items: flex;
                justify-content: center;
            }

            .popup-content h1 {
                color: #197307;
                font-weight: bold;
                text-align: center;
                border-bottom: 1px solid #000;
                padding-bottom: 1rem;
            }

            .popup-content p {
                text-align: left; 
                margin-left: 0;
            }

            .popup-content button {
                border: 1px solid red;
                border-radius: 2rem;
                text-align: center;
                margin-top: 1rem;
            }
            .popup-content button:hover {
                border: 1px solid green;
                background-color: green;
                color: white;
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

        <!-- màn hình thi thử -->

        <div class="test-exam-screen">
            <div class="main-container">
                <c:forEach var="Q" items="${listQ}" varStatus="counter">
                    <c:set var="A" value="${listA[counter.index]}"></c:set>
                    <input value="${Q.id}" name="questionID" hidden/>
                    <div class="form-container">
                        <div class="question-number" id="question${counter.index + 1}">
                            <span>Câu hỏi ${counter.count}</span>
                        </div>
                        <div class="question-content d-flex justify-content-between">
                            <div>
                                ${Q.question}
                                <c:if test="${not empty Q.image}">
                                    <div class="question-img">
                                        <img src="data:image;base64,${Q.image}" style="max-height: 10rem; max-width: 20rem"/>
                                    </div>
                                </c:if>
                                <ol class="question-list" type="a">
                                    <c:set var="options" value="${fn:split(A.answer, '/')}" />
                                    <c:forEach var="option" items="${options}" varStatus="status">
                                        <li>
                                            <label>
                                                <input class="question-input" type="radio" name="question${Q.id}" value="${fn:substring('ABCDEF', status.index, status.index + 1)}"> ${option}
                                                <c:if test="${A.isCorrect eq fn:substring('ABCDEF', status.index, status.index + 1)}">
                                                    <span class="selectAnswer" style="color: green; font-weight: bold; display: none" ><i class="fa-regular fa-circle-check"></i> Đúng</span>
                                                </c:if>
                                            </label>
                                        </li>
                                    </c:forEach>
                                </ol>
                            </div>
                            <c:if test="${Q.questionType eq '1'}">
                                <div class="paralysis-question">
                                    <i class="fa-regular fa-star"></i>
                                    <p>Câu hỏi liệt</p>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="selected-answer">
                <div class="selected-answer-container">
                    <c:forEach var="Q" items="${listQ}" varStatus="counter">
                        <div class="selected-answer-tab" data-question-number="${counter.index + 1}">${counter.count}</div>
                    </c:forEach>
                </div>
                <div class="submit-button col-md-4 d-flex justify-content-center flex-column">
                    <div class="countdown-timer" id="timer">00:00</div>
                    <button class="btn btn-primary" name="end">Kết thúc</button>
                </div>
            </div>
        </div>


        <!-- màn hình infor -->
        <div class="extra-container">
            <div class="row">
                <div class="info-user col-md-8 d-flex flex-row flex-wrap gap-3">
                    <div class="avatar">
                        <img src="https://www.cloud9salon.com/wp-content/uploads/2016/10/avatar.jpg">
                    </div>
                    <div class="detail-info">
                        <p>Họ và tên: ${fullname}</p>
                        <p>Hạng xe: Ô tô hạng B2 - số sàn</p>
                        <p>Ngày thi: ${date}</p>
                        <p>Trạng thái: <span id="statusSpan" style="color: green; font-weight: bold">${status}</span></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- màn hình xử lý kết quả -->
        <div class="popup-overlay">
            <div class="popup-content">
                <h1>Kết quả</h1>
                <p>Trả lời sai câu hỏi điểm Liệt: <span id="incorrectPoints"></span></p>
                <p>Số câu trả lời đúng: <span id="correctAnswers"></span></p>
                <p>Số câu trả lời sai: <span id="incorrectAnswers"></span></p>
                <p>Số câu chưa trả lời: <span id="unanswered"></span></p>
                <p id="resultMessage">Kết quả: </p>
                <button class="btn close-button">Xem lại bài thi</button>
            </div>
        </div>

        <!-- code js -->

        <script>
            window.addEventListener('DOMContentLoaded', function () {
                // Lấy thời điểm hiện tại
                var currentTime = new Date().getTime();
                // Đặt thời gian kết thúc là 30 phút sau thời điểm hiện tại
                var endTime = currentTime + 30 * 60 * 1000; // 30 phút = 30 * 60 * 1000 milliseconds

                // Cập nhật thời gian đếm ngược sau mỗi giây
                var countdownTimer = setInterval(function () {
                    // Lấy thời gian hiện tại
                    var now = new Date().getTime();
                    // Tính thời gian còn lại
                    var remainingTime = endTime - now;
                    // Chuyển đổi thời gian còn lại thành định dạng phút:giây
                    var minutes = Math.floor((remainingTime % (1000 * 60 * 60)) / (1000 * 60));
                    var seconds = Math.floor((remainingTime % (1000 * 60)) / 1000);
                    // Định dạng lại chuỗi thời gian đếm ngược
                    var formattedTime = ('0' + minutes).slice(-2) + ':' + ('0' + seconds).slice(-2);
                    // Hiển thị thời gian đếm ngược trong phần tử có id là "timer"
                    document.getElementById('timer').textContent = formattedTime;
                    // Kiểm tra nếu thời gian đếm ngược đã hết
                    if (remainingTime <= 0) {
                        clearInterval(countdownTimer);
                        document.getElementById('timer').textContent = '00:00';
                        // Thực hiện các hành động khi thời gian đếm ngược kết thúc
                        // Ví dụ: Gửi dữ liệu lên servlet, chuyển hướng trang, ...
                    }
                }, 1000); // Đếm ngược sau mỗi giây (1000 milliseconds)

                var submitButton = document.querySelector('button[name="end"]');
                var selectAnswerDivs = document.getElementsByClassName("selectAnswer");
                var popupOverlay = document.querySelector('.popup-overlay');

                submitButton.addEventListener("click", function () {
                    popupOverlay.style.display = "flex";
                    // Thực hiện các xử lý khác (nếu cần) khi nhấp vào nút "Kết thúc"

                    var closeButton = document.querySelector('.close-button');
                    closeButton.addEventListener("click", function () {
                        document.body.removeChild(popupOverlay);
                    });
                });
                submitButton.addEventListener("click", function () {
                    for (var i = 0; i < selectAnswerDivs.length; i++) {
                        selectAnswerDivs[i].style.display = "inline";
                    }
                    // Cập nhật trạng thái thành "Đã kết thúc"
                    var statusSpan = document.getElementById("statusSpan");
                    statusSpan.textContent = "Đã kết thúc";

                    // Dừng đồng hồ đếm ngược
                    clearInterval(countdownTimer);
                });
            });

            //xử lý sự kiện khi chọn đáp án 
            function handleRadioSelection(event) {
                const selectedOption = event.target.value;
                const questionNumber = event.target.getAttribute('name').replace('question', '');

                const selectedAnswerTab = document.querySelector(`.selected-answer-tab:nth-child(${questionNumber})`);
                selectedAnswerTab.classList.toggle('active', event.target.checked);
            }

            const questionInputs = document.querySelectorAll('input[class="question-input"]');
            questionInputs.forEach((input) => {
                input.addEventListener('change', handleRadioSelection);
            });

            //xử lý sự kiện để scroll đến câu đã chọn
            const selectedAnswerTabs = document.querySelectorAll('.selected-answer-tab');

            // Xử lý sự kiện khi click vào selected-answer-tab
            selectedAnswerTabs.forEach(tab => {
                tab.addEventListener('click', () => {
                    const questionNumber = tab.getAttribute('data-question-number');
                    const questionId = `question${questionNumber}`;

                    const questionElement = document.getElementById(questionId);

                    if (questionElement) {
                        questionElement.scrollIntoView({behavior: 'smooth'});
                    }
                });
            });


            //xử lý sự kiện xem lại
            const reviewButton = document.querySelector('.review-button');
            reviewButton.addEventListener('click', function (e) {
                resultScreen.classList.add('d-none');
                testExamScreen.classList.remove('d-none');
            });
        </script>

    </body>

</html>