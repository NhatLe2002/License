<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html
    lang="en"
    class="light-style layout-menu-fixed layout-compact"
    dir="ltr"
    data-theme="theme-default"
    data-assets-path="./assets/"
    data-template="vertical-menu-template-free"
    >
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
            />

        <title>
            Update Question
        </title>

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
    </head>

    <body>
        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <c:import url="../menu.jsp"/>

                <!-- Layout container -->
                <div class="layout-page">
                    <!-- Content wrapper -->
                    <div class="content-wrapper">
                        <!-- Content -->

                        <div class="container-xxl flex-grow-1 container-p-y">
                            <h4 class="py-3 mb-4">
                                <span class="text-muted fw-light">Forms/</span> Cập nhật câu hỏi 
                            </h4>

                            <!-- Basic Layout -->
                            <div class="row">
                                <div class="col-xl">
                                    <div class="card mb-4">
                                        <div
                                            class="card-header d-flex justify-content-between align-items-center"
                                            >
                                            <h5 class="mb-0">Nhập các thông tin sau</h5>
                                        </div>
                                        <div class="card-body">
                                            <c:forEach var="A" items="${answers}">
                                                <form enctype="multipart/form-data" action="UpdateQuestionController?id=${A.questionID}" method="POST">
                                                    <div class="mb-3">
                                                        <label for="nameBasic" class="form-label"
                                                               >Nội dung câu hỏi</label
                                                        >
                                                        <input
                                                            type="text"
                                                            id="nameBasic"
                                                            class="form-control"
                                                            placeholder="Nội dung câu hỏi"
                                                            name="question" required=""
                                                            value="${question.question}"
                                                            />
                                                    </div>
                                                    <div class="mb-3" name="answer_div">
                                                        <label for="emailBasic" class="form-label"
                                                               >Đáp án A</label
                                                        >
                                                        <input
                                                            type="text"
                                                            id="emailBasic"
                                                            class="form-control"
                                                            name="answerA" 
                                                            value="${answerA}"
                                                            />
                                                    </div>
                                                    <div class="mb-3" name="answer_div">
                                                        <label for="emailBasic" class="form-label"
                                                               >Đáp án B</label
                                                        >
                                                        <input
                                                            type="text"
                                                            id="emailBasic"
                                                            class="form-control"
                                                            name="answerB" 
                                                            value="${answerB}"
                                                            />
                                                    </div>
                                                    <div class="mb-3" name="answer_div">
                                                        <label for="emailBasic" class="form-label"
                                                               >Đáp án C</label
                                                        >
                                                        <input
                                                            type="text"
                                                            id="emailBasic"
                                                            class="form-control"
                                                            name="answerC" 
                                                            value="${answerC}"
                                                            />
                                                    </div>
                                                    <div class="mb-3" name="answer_div">
                                                        <label for="emailBasic" class="form-label"
                                                               >Đáp án D</label
                                                        >
                                                        <input
                                                            type="text"
                                                            id="emailBasic"
                                                            class="form-control"
                                                            name="answerD" 
                                                            value="${answerD}"
                                                            />
                                                    </div>

                                                    <div class="mb-3"
                                                         style="display: flex;
                                                         flex-wrap: nowrap;
                                                         flex-direction: row;
                                                         align-items: center;
                                                         margin: 0">
                                                        <div class="btn-group">
                                                            <label  style="
                                                                    padding: 0.5rem;
                                                                    padding-left: 0;
                                                                    margin: 0;
                                                                    width: 12rem">
                                                                Chọn số đáp án
                                                            </label>
                                                            <select class="form-control" name="answer_options" 
                                                                    style="cursor: pointer;
                                                                    text-align: center;
                                                                    padding: 0"  required="">
                                                                <option value="0" disabled="">Chọn 1 lựa chọn!</option>
                                                                <option value="2" <c:if test="${A.options eq '2'}">selected=""</c:if>>Có 2 đáp án</option>
                                                                <option value="3" <c:if test="${A.options eq '3'}">selected=""</c:if>>Có 3 đáp án</option>
                                                                <option value="4" <c:if test="${A.options eq '4'}">selected=""</c:if>>Có 4 đáp án</option>
                                                                </select>
                                                            </div>
                                                            <div class="btn-group">
                                                                <label style="
                                                                       padding: 0.5rem;
                                                                       margin: 0;
                                                                       width: 17rem">
                                                                    Chọn đáp án đúng
                                                                </label>
                                                                <select class="form-control" name="correct_answer" 
                                                                        style="cursor: pointer;
                                                                        text-align: center;
                                                                        padding: 0" required="">
                                                                    <option value="A" <c:if test="${A.isCorrect eq 'A'}">selected</c:if>>A</option>
                                                                <option value="B" <c:if test="${A.isCorrect eq 'B'}">selected</c:if>>B</option>
                                                                <option value="C" <c:if test="${A.isCorrect eq 'C'}">selected</c:if>>C</option>
                                                                <option value="D" <c:if test="${A.isCorrect eq 'D'}">selected</c:if>>D</option>
                                                                </select>
                                                            </div>
                                                            <div class="btn-group">
                                                                <label style="
                                                                       padding: 0.5rem;
                                                                       margin: 0;
                                                                       width: 15rem">
                                                                    Chọn loại câu hỏi
                                                                </label>
                                                                <select class="form-control" name="question_type" 
                                                                        style="cursor: pointer;
                                                                        text-align: center;
                                                                        padding: 0">
                                                                    <option value="0" <c:if test="${question.questionType eq '0'}">selected=""</c:if>>Bình thường</option>
                                                                <option value="1" <c:if test="${question.questionType eq '1'}">selected=""</c:if>>Câu hỏi liệt</option>
                                                                </select>
                                                            </div>

                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="formFile" class="form-label"
                                                                   >Chọn đường dẫn hình ảnh</label
                                                            >
                                                            <input
                                                                class="form-control"
                                                                type="file"
                                                                name="image" id="fileInput" onchange="previewImage(event)" accept="image/*""
                                                                />
                                                        <c:if test="${not empty question.image}">
                                                            <div class="file-img" id="image" style="padding-top: 1rem">
                                                                <img id="preview" src="data:image;base64,${question.image}" alt="Preview" style="max-height: 10rem; max-width: 20rem;"/>
                                                            </div> 
                                                        </c:if>
                                                        <c:if test="${not empty image}">
                                                            <div class="file-img" id="image" style="padding-top: 1rem">
                                                                <img id="preview" src="data:image;base64,${image}" alt="Preview" style="max-height: 10rem; max-width: 20rem;"/>
                                                            </div> 
                                                        </c:if>
                                                        <c:if test="${empty image && empty question.image}">
                                                            <div class="file-img" id="image" style="padding-top: 1rem; display: none">
                                                                <img id="preview" src="#" alt="Preview" style="max-height: 10rem; max-width: 20rem; "/>
                                                                <button type="button" onclick="resetImage()" class="btn btn-primary">Xóa ảnh</button>
                                                            </div> 
                                                        </c:if>

                                                    </div>

                                                    <button type="submit" class="btn btn-primary">
                                                        Cập nhật
                                                    </button>
                                                    <a style="text-decoration: none;
                                                        color: inherit;" href="MainController?action=QuestionController"><button type="button" class="btn btn-primary">Hủy</button>
                                                    </a>
                                                </form>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <c:if test="${not empty message}">
                            <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
                                <div id="toast-notification" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
                                    <div class="toast-header">
                                        <c:if test="${message eq 'success'}">
                                            <strong id="toast-message" class="me-auto text-success"></strong>
                                        </c:if>
                                        <c:if test="${message eq 'fail'}">
                                            <strong id="toast-message" class="me-auto text-danger"></strong>
                                        </c:if>
                                        <c:if test="${message eq 'exist'}">
                                            <strong id="toast-message" class="me-auto text-danger"></strong>
                                        </c:if>
                                        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <!-- Content wrapper -->
                </div>
                <!-- / Layout page -->
            </div>
        </div>
        <script>
            window.addEventListener('DOMContentLoaded', (event) => {
                const message = '${message}'; // Lấy giá trị thông báo từ servlet
                if (message) {
                    showToast(message); // Gọi hàm hiển thị thông báo
                }
            });

            function showToast(message) {
                const toast = document.getElementById('toast-notification');
                const toastMessage = document.getElementById('toast-message');
                if (message === 'success') {
                    var success = 'Cập nhật câu hỏi thành công!';
                    toastMessage.textContent = success;
                } else if (message === 'fail') {
                    var fail = 'Không thể cập nhật câu hỏi!';
                    toastMessage.textContent = fail;
                } else {
                    var exist = 'Câu hỏi đã tồn tại!';
                    toastMessage.textContent = exist;
                }
                toast.classList.remove('hide');
                toast.classList.add('show');
                setTimeout(() => {
                    toast.classList.remove('show');
                }, 3000);
            }
        </script>
        <script>
            // Lấy tất cả các input trong các div chứa câu trả lời
            var answerInputsA = document.querySelectorAll('div[name="answer_div"] input[name="answerA"]');
            var answerInputsB = document.querySelectorAll('div[name="answer_div"] input[name="answerB"');
            var answerInputsC = document.querySelectorAll('div[name="answer_div"] input[name="answerC"');
            var answerInputsD = document.querySelectorAll('div[name="answer_div"] input[name="answerD"');

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

            window.addEventListener('DOMContentLoaded', (event) => {
                const number_option = '${number_option}';
                answerDivs.forEach(function (div) {
                    div.style.display = 'none';
                });
                // Hiển thị các div chứa câu trả lời tương ứng
                for (var i = 0; i < number_option; i++) {
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
        <!-- / Layout wrapper -->

        <!-- Core JS -->
        <!-- build:js assets/vendor/js/core.js -->

        <script src="./assets/vendor/libs/jquery/jquery.js"></script>
        <script src="./assets/vendor/libs/popper/popper.js"></script>
        <script src="./assets/vendor/js/bootstrap.js"></script>
        <script src="./assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
        <script src="./assets/vendor/js/menu.js"></script>

        <!-- endbuild -->

        <!-- Vendors JS -->

        <!-- Main JS -->
        <script src="./assets/js/main.js"></script>

        <!-- Page JS -->

        <!-- Place this tag in your head or just before your close body tag. -->
        <script async defer src="https://buttons.github.io/buttons.js"></script>
    </body>
</html>

