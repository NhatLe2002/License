<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bài thi</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="./assets/css/test_exam.css"/>
        <link
            rel="icon"
            type="image/x-icon"
            href="https://cdn-icons-png.flaticon.com/512/6556/6556219.png"
            />
    </head>
    <style>
        .popup-overlay-result {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6); /* Màu nền tối */
            display: none;
            justify-content: center;
            align-items: center;
        }

        .popup-content-result {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
        }

    </style>
    <body>
        <c:import url="userHeader.jsp"/>
        <!-- màn hình thi thử -->

        <div class="test-exam-screen">
            <div class="main-container">
                <c:forEach var="Q" items="${listQ}" varStatus="counter">
                    <c:set var="A" value="${listA[counter.index]}"></c:set>
                        <div class="form-container">
                            <div class="question-number" id="${counter.index + 1}">
                            <span class="no-select">Câu hỏi ${counter.index + 1}</span>
                        </div>
                        <div class="question-content d-flex justify-content-between">
                            <div class="no-select">
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
                                                <input class="question-input" type="radio" name="question${counter.index + 1}" value="${fn:substring('ABCDEF', status.index, status.index + 1)}"> ${option}
                                                <input class="correct-answer" value="${A.isCorrect}" hidden=""/>
                                                <c:if test="${A.isCorrect eq fn:substring('ABCDEF', status.index, status.index + 1)}">
                                                    <span class="selectAnswer answer-result" style="color: green; font-weight: bold; display: none" ><i class="fa-regular fa-circle-check"></i> Đúng</span>
                                                </c:if>
                                                <c:if test="${A.isCorrect != fn:substring('ABCDEF', status.index, status.index + 1)}">
                                                    <span class="selectWrongAnswer answer-result" style="color: red; font-weight: bold; display: none" ><i class="fa-regular fa-circle-xmark"></i> Sai</span>
                                                </c:if>
                                            </label>
                                        </li>
                                    </c:forEach>
                                </ol>
                            </div>
                            <c:if test="${Q.questionType eq '1'}">
                                <div class="paralysis-question no-select">
                                    <i class="fa-regular fa-star"></i>
                                    <p>Câu hỏi liệt</p>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="selected-answer no-select">
                <div class="selected-answer-container">
                    <c:forEach var="Q" items="${listQ}" varStatus="counter">
                        <div class="selected-answer-tab" data-question-number="${counter.index + 1}">${counter.index + 1}   </div>
                    </c:forEach>
                </div>
                <div class="submit-button col-md-4 d-flex justify-content-center flex-column">
                    <div class="countdown-timer" id="timer">00:00</div>
                    <button class="btn btn-primary" name="end">Nộp bài</button>
                </div>
            </div>
        </div>


        <!-- màn hình infor -->
        <div class="extra-container no-select">
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

        <!-- Màn hình xử lý kết quả -->
        <div class="popup-overlay no-select">
            <div class="popup-content">
                <h2>Bạn có muốn kết thúc bài thi?</h2>
                <button class="btn cancle-button">Xem lại</button>
                <button class="btn close-button">Kết thúc</button>
            </div>
        </div>

        <!-- Màn hình hiển thị kết quả -->
        <div id="popup" class="result-screen popup-overlay-result d-none" style="height: auto; border-radius: 2rem; border-color: #fba265">
            <div class="popup-content-result">
                <h1 class="fw-bold" style="color: #fba265; font-size: 2rem">Kết quả</h1>
                <p>Trả lời sai câu hỏi điểm liệt: <span id="paralysisAnswers">0</span></p>
                <p>Số câu trả lời đúng: <span id="correctAnswers">0</span></p>
                <p>Số câu trả lời sai: <span id="incorrectAnswers">0</span></p>
                <p>Số câu chưa trả lời: <span id="unanswered">0</span></p>
                <p id="resultMessageFail" class="fw-bold">Kết quả: <span class="text-danger">Không đạt</span></p>
                <p id="resultMessageSuccess" class="fw-bold">Kết quả: <span class="text-success">Đạt</span> </p><br>
                <button onclick="hidePopup()">Xem kết quả</button>
                <a href="MainController"><button onclick="hidePopup()">Đóng</button></a>
            </div>
        </div>
        <!-- code js -->
        <script>
            const radioInputs = document.querySelectorAll('input[type="radio"]');
            radioInputs.forEach(input => {
                input.addEventListener('change', function () {
                    radioInputs.forEach(radio => {
                        radio.removeAttribute('selected');
                    });
                    input.setAttribute('selected', 'selected');
                });
            });

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
                var selectWrongAnswer = document.getElementsByClassName("selectWrongAnswer");
                var popupOverlay = document.querySelector('.popup-overlay');



                submitButton.addEventListener("click", function () {
                    popupOverlay.style.display = "flex";
                    var cancleButton = document.querySelector('.cancle-button');
                    cancleButton.addEventListener("click", function () {
                        popupOverlay.style.display = "none";
                    });

                    var closeButton = document.querySelector('.close-button');
                    closeButton.addEventListener("click", function () {
                        // Vô hiệu hóa các thẻ input
                        var questionInputs = document.querySelectorAll('input[class="question-input"]');
                        questionInputs.forEach(function (input) {
                            input.disabled = true;
                        });

                        //new
                        var selectedOptions = document.querySelectorAll('.selected-answer-question');
                        selectedOptions.forEach(function (selectedOption) {
                            const questionContainer = selectedOption.closest('.form-container');
                            const selectedAnswerResult = questionContainer.querySelector('.selected-answer-question .answer-result');

                            if (selectedAnswerResult) {
                                selectedAnswerResult.style.display = 'inline';
                            }
                        });

                        popupOverlay.style.display = "none";
//                        for (var i = 0; i < selectAnswerDivs.length; i++) {
//                            selectAnswerDivs[i].style.display = "inline";
//                        }
//                        for (var i = 0; i < selectWrongAnswer.length; i++) {
//                            selectWrongAnswer[i].style.display = "inline";
//                        }

                        // Cập nhật trạng thái thành "Đã kết thúc"
                        var statusSpan = document.getElementById("statusSpan");
                        statusSpan.textContent = "Đã kết thúc";

                        //Xử lý sự kiện hiển thị kết quả
                        displayResult()

                        // Dừng đồng hồ đếm ngược
                        clearInterval(countdownTimer);

                        window.scrollTo({
                            top: 0,
                            behavior: 'smooth'
                        });

                        submitButton.disabled = true;

                        submitButton.style.backgroundColor = 'gray';
                        submitButton.style.color = 'white';
                        submitButton.style.cursor = 'not-allowed';
                        const resultScreen = document.querySelector('.popup-overlay-result');
                        resultScreen.classList.remove('d-none');
                        showPopup();

                    });
                });

            });
            function showPopup() {
                document.getElementById('popup').style.display = 'flex';
            }

            function hidePopup() {
                document.getElementById('popup').style.display = 'none';
            }

            //function xử lý hiển thị kết quả
            function displayResult() {

                var unansweredCount = 0;
                var countCorrectAnswer = 0;
                var countIncorrectAnswer = 0;
                var countParalysisAnswers = 0;

                var formContainers = document.querySelectorAll('.form-container');

                formContainers.forEach(function (container) {
                    var selectedAnswerQuestions = container.querySelectorAll('.selected-answer-question');
                    var isAnyCorrect = false;
                    var isParalysisQuestion = container.querySelector('.paralysis-question');

                    selectedAnswerQuestions.forEach(function (selectedAnswer) {
                        var questionInputValue = selectedAnswer.querySelector('.question-input').value;
                        var correctAnswerValue = selectedAnswer.querySelector('.correct-answer').value;

                        if (questionInputValue === correctAnswerValue) {
                            countCorrectAnswer++;
                            isAnyCorrect = true;
                        }
                    });

                    if (!isAnyCorrect && selectedAnswerQuestions.length > 0) {
                        countIncorrectAnswer++;

                        if (isParalysisQuestion) {
                            countParalysisAnswers++;
                        }
                    }

                    if (!container.querySelector('.selected-answer-question')) {
                        unansweredCount++;
                    }
                });

                var unansweredElement = document.getElementById("unanswered");
                unansweredElement.textContent = unansweredCount;

                var correctAnswersElement = document.getElementById("correctAnswers");
                correctAnswersElement.textContent = countCorrectAnswer;

                var incorrectAnswersElement = document.getElementById("incorrectAnswers");
                incorrectAnswersElement.textContent = countIncorrectAnswer;

                var paralysisAnswersElement = document.getElementById("paralysisAnswers");
                paralysisAnswersElement.textContent = countParalysisAnswers;

                var resultMessageFail = document.getElementById("resultMessageFail");
                var resultMessageSuccess = document.getElementById("resultMessageSuccess");


                if (parseInt(paralysisAnswersElement.textContent) === 0 && parseInt(correctAnswersElement.textContent) >= 32) {
                    resultMessageFail.style.display = "none";
                    resultMessageSuccess.style.display = "inline";
                } else {
                    resultMessageFail.style.display = "inline";
                    resultMessageSuccess.style.display = "none";
                }

            }


            //xử lý sự kiện khi chọn đáp án 

            function handleRadioSelection(event) {
                const selectedOption = event.target;
                const questionNumber = event.target.getAttribute('name').replace('question', '');
                const questionOptions = document.querySelectorAll('input[name="question' + questionNumber + '"]');

                questionOptions.forEach((option) => {
                    option.parentElement.classList.remove('selected-answer-question');
                });
                selectedOption.parentElement.classList.add('selected-answer-question');

                const selectedAnswerTab = document.querySelector(".selected-answer-tab:nth-child(" + questionNumber + ")");
                selectedAnswerTab.classList.toggle('active', event.target.checked);
            }

            const questionInputs = document.querySelectorAll('input[class="question-input"]');
            questionInputs.forEach((input) => {
                input.addEventListener('change', handleRadioSelection);
            });

            //xử lý sự kiện để scroll đến câu đã chọn
            document.addEventListener('DOMContentLoaded', function () {
                const selectedAnswerTabs = document.querySelectorAll('.selected-answer-tab');

                selectedAnswerTabs.forEach(tab => {
                    tab.addEventListener('click', () => {
                        const questionNumber = tab.getAttribute('data-question-number');

                        const questionElement = document.getElementById(questionNumber);
                        if (questionElement) {
                            questionElement.scrollIntoView({behavior: 'smooth'});
                        }
                    });
                });
            });

        </script>

    </body>

</html>