<%-- 
    Document   : addQuestion
    Created on : 02-10-2023, 09:56:36
    Author     : HP Pro
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Questions Page</title>
    </head>
    <body>
        <h1>Insert Questions Page</h1>
        <form action="MainController?action=QuestionController" method="POST">
            <div>
                <label>Question: </label>
                <input type="text" placeholder="Enter question..." name="question">
            </div>
            <div class="update-img">
                <label for="cate">Image</label>
                <input type="file" name="image" required = "required" id="fileInput" onchange="previewImage(event)" accept="image/*" />
                <div class="file-img">
                    <img id="preview" src="#" alt="Preview"/>
                </div>
            </div>
            <div>
                <label>Question Type: </label>
                <input type="text" value="B2" name="question_type" readonly="">
            </div>
            <div>
                <label>Choose number of answer: </label>
                <select name="answer_options" style="cursor: pointer">
                    <option value="0" disabled="">Choose one option!</option>
                    <option value="2">Have 2 answer</option>
                    <option value="3">Have 3 answer</option>
                    <option value="4">Have 4 answer</option>
                    <option value="5">Have 5 answer</option>
                    <option value="6" selected="">Have 6 answer</option>
                </select>
            </div>
            <div name="answer_div">
                <label>Answer A: </label>
                <input type="text" placeholder="Enter answer..." name="answerA" value="A. ">
            </div>
            <div name="answer_div">
                <label>Answer B: </label>
                <input type="text" placeholder="Enter answer..." name="answerB" value="B. ">
            </div>
            <div name="answer_div">
                <label>Answer C: </label>
                <input type="text" placeholder="Enter answer..." name="answerC" value="C. ">
            </div>
            <div name="answer_div">
                <label>Answer D: </label>
                <input type="text" placeholder="Enter answer..." name="answerD" value="D. ">
            </div>
            <div name="answer_div">
                <label>Answer E: </label>
                <input type="text" placeholder="Enter answer..." name="answerE" value="E. ">
            </div>
            <div name="answer_div">
                <label>Answer F: </label>
                <input type="text" placeholder="Enter answer..." name="answerF" value="F. ">
            </div>
            <div>
                <label>Choose the correct answer: </label>
                <select name="correct_answer" style="cursor: pointer">
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="D">D</option>
                    <option value="E">E</option>
                    <option value="F">F</option>
                </select>
            </div>
            <button type="submit">Insert Question</button>
            <button type="reset">Reset Data</button>
        </form>
        <div>
            <c:if test="${not empty message}">
                <label>${message}</label>
            </c:if>
        </div>

    </body>
    <script>
        // Lấy tất cả các input trong các div chứa câu trả lời
        var answerInputsA = document.querySelectorAll('div[name="answer_div"] input[name="answerA"]');
        var answerInputsB = document.querySelectorAll('div[name="answer_div"] input[name="answerB"');
        var answerInputsC = document.querySelectorAll('div[name="answer_div"] input[name="answerC"');
        var answerInputsD = document.querySelectorAll('div[name="answer_div"] input[name="answerD"');
        var answerInputsE = document.querySelectorAll('div[name="answer_div"] input[name="answerE"');
        var answerInputsF = document.querySelectorAll('div[name="answer_div"] input[name="answerF"');

        // Lắng nghe sự kiện input của các input
        answerInputsA.forEach(function (input) {
            input.addEventListener('input', function () {
                // Kiểm tra giá trị của input và chỉ cho phép người dùng thêm nội dung sau giá trị ban đầu
                if (!input.value.startsWith("A. ")) {
                    input.value = "A. " + input.value.slice(3);
                }
            });
        });
        answerInputsB.forEach(function (input) {
            input.addEventListener('input', function () {
                // Kiểm tra giá trị của input và chỉ cho phép người dùng thêm nội dung sau giá trị ban đầu
                if (!input.value.startsWith("B. ")) {
                    input.value = "B. " + input.value.slice(3);
                }
            });
        });
        answerInputsC.forEach(function (input) {
            input.addEventListener('input', function () {
                // Kiểm tra giá trị của input và chỉ cho phép người dùng thêm nội dung sau giá trị ban đầu
                if (!input.value.startsWith("C. ")) {
                    input.value = "C. " + input.value.slice(3);
                }
            });
        });
        answerInputsD.forEach(function (input) {
            input.addEventListener('input', function () {
                // Kiểm tra giá trị của input và chỉ cho phép người dùng thêm nội dung sau giá trị ban đầu
                if (!input.value.startsWith("D. ")) {
                    input.value = "D. " + input.value.slice(3);
                }
            });
        });
        answerInputsE.forEach(function (input) {
            input.addEventListener('input', function () {
                // Kiểm tra giá trị của input và chỉ cho phép người dùng thêm nội dung sau giá trị ban đầu
                if (!input.value.startsWith("E. ")) {
                    input.value = "E. " + input.value.slice(3);
                }
            });
        });
        answerInputsF.forEach(function (input) {
            input.addEventListener('input', function () {
                // Kiểm tra giá trị của input và chỉ cho phép người dùng thêm nội dung sau giá trị ban đầu
                if (!input.value.startsWith("F. ")) {
                    input.value = "F. " + input.value.slice(3);
                }
            });
        });
    </script>
    <script>
        // Lấy phần tử select và các phần tử div chứa câu trả lời
        var answerOptionsSelect = document.querySelector('select[name="answer_options"]');
        var answerDivs = document.querySelectorAll('div[name="answer_div"]');

        // Lắng nghe sự kiện thay đổi của select
        answerOptionsSelect.addEventListener('change', function () {
            // Xóa tất cả các div chứa câu trả lời
            answerDivs.forEach(function (div) {
                div.style.display = 'none';
            });

            // Lấy giá trị được chọn trong select
            var selectedOption = answerOptionsSelect.value;

            // Hiển thị các div chứa câu trả lời tương ứng
            for (var i = 0; i < selectedOption; i++) {
                answerDivs[i].style.display = 'block';
            }
        });

        // Lấy phần tử select chứa câu trả lời đúng và tất cả các option trong nó
        var correctAnswerSelect = document.querySelector('select[name="correct_answer"]');
        var correctAnswerOptions = correctAnswerSelect.querySelectorAll('option');

        answerOptionsSelect.addEventListener('change', function () {
            // Lấy giá trị được chọn trong select "answer_options"
            var selectedOption = parseInt(answerOptionsSelect.value);

            // Hiển thị các option tương ứng trong select "correct_answer"
            correctAnswerOptions.forEach(function (option, index) {
                if (index < selectedOption) {
                    option.style.display = 'block';
                } else {
                    option.style.display = 'none';
                }
            });
        });
    </script>
    <script>
        function previewImage(event) {
            var reader = new FileReader();
            reader.onload = function () {
                var output = document.getElementById("preview");
                output.src = reader.result;
            };

            var fileInput = event.target;
            var files = fileInput.files;

            if (files.length > 0) {
                reader.readAsDataURL(files[0]);
            } else {
                // Nếu không có file được chọn, đặt lại ảnh về trạng thái ban đầu
                var output = document.getElementById("preview");
                output.src = "#";
            }
        }
    </script>
</html>
