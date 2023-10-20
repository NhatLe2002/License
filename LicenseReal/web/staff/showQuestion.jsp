<%-- 
    Document   : showQuestion
    Created on : 06-10-2023, 20:24:50
    Author     : HP Pro
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Question Management</title>
        <link rel="stylesheet" href="./style/question-management-style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.2/mdb.min.css" rel="stylesheet" />

    </head>

    <body>
        <div class="container-fluid admin">
            <div class="row admin-content">
                <!-- Sidebar -->
                <c:import url="staffSlidebar.jsp"/>

                <!-- Content -->
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
                    <div class="list-topic">
                        <div class="list-user-filter d-flex justify-content-between align-items-center">
                            <div>
                                <button type="button" class="btn btn-primary btn-add-question" data-bs-toggle="modal"
                                        data-bs-target="#modalAddQuestion">Thêm bộ đề <i class="fa-solid fa-plus"></i>
                                </button>
                            </div>

                            <div class="d-flex align-items-center justify-content-center gap-2">
                                <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                        Filter
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                        <li><a class="dropdown-item" href="#">Show list of deleted questions</a></li>
                                    </ul>
                                </div>
                                <input type="text" name="list-user-filter" class="form-control filter-input"
                                       placeholder="Tìm Kiếm...">
                                <button type="button" class="btn btn-primary filter-button">Search</button>
                            </div>
                        </div>

                        <table class="table table-hover table-bordered mt-4">
                            <thead>
                                <tr>
                                    <th scope="col">No.</th>
                                    <th scope="col">Question</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Number Of Option</th>
                                    <th scope="col">Answer</th>
                                    <th scope="col">Correct</th>
                                    <th scope="col">Question Type</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>

                                <!--                            <i class="fa-solid fa-trash" data-toggle="tooltip" title="Xóa"
                                                               data-bs-toggle="modal" data-bs-target="#modalConfirmDelete"></i>
                                                            <i class="fa-solid fa-pen-to-square" data-toggle="tooltip" title="Edit"
                                                               data-bs-toggle="modal" data-bs-target="#modalEditQuestion"></i>-->
                                <c:forEach var="Q" items="${listQ}" varStatus="counter">
                                    <c:set var="A" value="${listA[counter.index]}"></c:set>
                                        <tr>
                                            <td>${counter.count}</td>
                                        <td>${Q.question}</td>
                                        <td>
                                            <c:if test="${not empty Q.image}">
                                                <img src="data:image;base64,${Q.image}" style="max-height: 5rem; max-width: 10rem"/>
                                            </c:if>
                                        </td>
                                        <td>${A.options}</td>
                                        <td>${A.answer}</td>
                                        <td>${A.isCorrect}</td>
                                        <c:if test="${Q.questionType eq '1'}">
                                            <td>Paralysis</td>
                                        </c:if>
                                        <c:if test="${Q.questionType eq '0'}">
                                            <td>Normal</td>
                                        </c:if>
                                        <td>
                                            <a href="UpdateQuestionController?id=${Q.id}"><i class="fa-solid fa-pen fa-bounce" style="color: #197307;"></i></a>
                                            |
                                            <a href="#" data-toggle="tooltip" title="Xóa"
                                               data-bs-toggle="modal" data-bs-target="#modalConfirmDelete">
                                                <i class="fa-solid fa-trash fa-bounce" style="color: #fa0000;"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <!-- DELETE -->
                                    <!-- modal confirm DELETE questions -->
                                
                                    <div class="modal fade" id="modalConfirmDelete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                                         aria-labelledby="staticBackdropLabel" aria-hidden="true">

                                        <div class="modal-dialog modal-dialog-centered">

                                            <div class="modal-content">

                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="staticBackdropLabel">Confirm removal</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    Are you sure to delete this question?
                                                </div>
                                                <form action="DeleteQuestionController?id=${Q.id}" method="POST">
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancle</button>
                                                    <button type="button" class="btn btn-primary" id="btn-toast-delete" class="btn-close"
                                                            data-bs-dismiss="modal" aria-label="Close">Delete</button>
                                                </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </main>
            </div>

            <!-- CREATE -->
            <!-- modal ADD questions -->
            <div class="modal fade" id="modalAddQuestion" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                 aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-xl modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Thêm bộ đề</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label>
                                    Thời gian thi: <input type="number" style="width: 100px;"> phút
                                </label>
                            </div>
                            <div id="question-container">

                            </div>
                            <button type="button" class="btn btn-outline-primary" id="add-question">Thêm câu hỏi</button>

                        </div>
                        <div class="modal-footer">
                            <button type="button" id="btn-cancel-add-question" class="btn btn-secondary"
                                    data-bs-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" data-bs-target="#modalConfirmAddQuestion"
                                    data-bs-toggle="modal" data-bs-dismiss="modal">Thêm bộ đề</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- modal confirm ADD questions -->
            <div class="modal fade" id="modalConfirmAddQuestion" data-bs-backdrop="static" aria-hidden="true"
                 aria-labelledby="staticBackdropLabel" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalToggleLabel2">Tạo bộ đề</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Bạn có chắc muốn thêm bộ đề này?
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" data-bs-target="#modalAddQuestion" data-bs-toggle="modal"
                                    data-bs-dismiss="modal">Quay lại</button>
                            <button class="btn btn-primary" id="btn-toast-add" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close">Xác nhận thêm</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- UPDATE -->
            <!-- modal EDIT questions -->
            <div class="modal fade" id="modalEditQuestion" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                 aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-xl modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Cập nhập bộ đề</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body p-5">
                            <div class="time-exam d-flex align-items-center gap-2">
                                <p style="margin-bottom: 0px;">Thời gian thi: <span id="exam-time" type="text">120</span>
                                    phút</p>
                                <i class="fa-solid fa-pen-to-square" id="edit-time-icon"></i>
                            </div>

                            <hr />

                            <div class="list-questions-container">
                                <div class="question-container-review" id="question-container-1">
                                    <div class="title-items d-flex gap-2 align-items-center">
                                        <p style="margin-bottom: 0px;">Câu hỏi 1: </p>
                                        <i class="fa-solid fa-trash"></i>
                                        <i class="fa-solid fa-pen-to-square edit-question-icon"></i>
                                    </div>

                                    <label>
                                        <p class="question-input" style="font-size: 20px;" type="text"
                                           name="question-review-1" id="question-review-1">
                                            Đèn ĐỎ thì làm gì?
                                        </p>
                                    </label>

                                    <div class="answer-items">
                                        <ol class="question-list" type="a">
                                            <li>
                                                <label>
                                                    <p class="question-input" type="text" name="answer-review-1" value="a">
                                                        Dừng lại
                                                    </p>
                                                </label>
                                            </li>
                                            <li>
                                                <label>
                                                    <p class="question-input" type="text" name="answer-review-1" value="b">
                                                        Lên ga Việt Nam
                                                    </p>
                                                </label>
                                            </li>
                                            <li>
                                                <label>
                                                    <p class="question-input" type="text" name="answer-review-1" value="c">
                                                        Quay đầu lại
                                                    </p>
                                                </label>
                                            </li>
                                            <li>
                                                <label>
                                                    <p class="question-input" type="text" name="answer-review-1" value="d">
                                                        Quẹo phải
                                                    </p>
                                                </label>
                                            </li>
                                        </ol>
                                    </div>

                                    <div class="correct-answer" data-correct-answer="question-review-1">
                                        <i class="fa-regular fa-circle-check"></i> Đáp án đúng: b
                                    </div>

                                    <div class="button-change-div d-none">
                                        <button class="btn btn-outline-primary btn-cancle-change">Hủy thay đổi</button>
                                        <button class="btn btn-primary btn-confirm-change">Thay đổi</button>
                                    </div>

                                    <hr />
                                </div>

                                <div class="question-container-review" id="question-container-2">
                                    <div class="question-items d-flex gap-2 align-items-center">
                                        <p style="margin-bottom: 0px;" id="question-review-2">Câu hỏi 2: </p>
                                        <i class="fa-solid fa-trash"></i>
                                        <i class="fa-solid fa-pen-to-square edit-question-icon"></i>
                                    </div>

                                    <label>
                                        <p class="question-input" style="font-size: 20px;" type="text"
                                           name="question-review-2" id="question-review-2">
                                            Đèn XANH thì làm gì?
                                        </p>
                                    </label>

                                    <div class="answer-items">
                                        <ol class="question-list" type="a">
                                            <li>
                                                <label>
                                                    <p class="question-input" type="text" name="answer-review-2" value="a">
                                                        Dừng lại
                                                    </p>
                                                </label>
                                            </li>
                                            <li>
                                                <label>
                                                    <p class="question-input" type="text" name="answer-review-2" value="b">
                                                        Lên ga Việt Nam
                                                    </p>
                                                </label>
                                            </li>
                                            <li>
                                                <label>
                                                    <p class="question-input" type="text" name="answer-review-2" value="c">
                                                        Quay đầu lại blah blah
                                                    </p>
                                                </label>
                                            </li>
                                            <li>
                                                <label>
                                                    <p class="question-input" type="text" name="answer-review-2" value="d">
                                                        Quẹo phải tùm lum
                                                    </p>
                                                </label>
                                            </li>
                                        </ol>
                                    </div>

                                    <div class="correct-answer" data-correct-answer="question-review-2">
                                        <i class="fa-regular fa-circle-check"></i> Đáp án đúng: c
                                    </div>

                                    <div class="button-change-div d-none">
                                        <button class="btn btn-outline-primary">Hủy thay đổi</button>
                                        <button class="btn btn-primary">Thay đổi</button>
                                    </div>

                                    <hr />
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" data-bs-target="#modalConfirmEditQuestion"
                                    data-bs-toggle="modal" data-bs-dismiss="modal">Sửa bộ đề</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- modal confirm EDIT questions -->
            <div class="modal fade" id="modalConfirmEditQuestion" data-bs-backdrop="static" aria-hidden="true"
                 aria-labelledby="staticBackdropLabel" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalToggleLabel2">Xác nhận</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Bạn có chắc muốn lưu thay đổi bộ đề này?
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" data-bs-target="#modalEditQuestion" data-bs-toggle="modal"
                                    data-bs-dismiss="modal">Quay lại</button>
                            <button class="btn btn-primary" id="btn-toast-edit" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close">Thay đổi</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- toast thông báo thành công-->
            <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
                <div id="toast-notification" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
                    <div class="toast-header">
                        <strong id="toast-message" class="me-auto text-success"> <!--Nội dung toast--></strong>
                        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                    </div>
                </div>
            </div>


        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <script>

            //xử lý sự kiện show toast
            function showToast(message) {
                const toastMessage = document.querySelector('#toast-message');
                const toast = document.querySelector('#toast-notification');

                toastMessage.textContent = message;
                toast.classList.add('show');

                setTimeout(() => {
                    toast.classList.remove('show');
                }, 3000);
            }

            document.querySelector('#btn-toast-add').addEventListener('click', function () {
                showToast('Thêm bộ đề thành công');
            });

            document.querySelector('#btn-toast-delete').addEventListener('click', function () {
                showToast('Xóa bộ đề thành công');
            });

            document.querySelector('#btn-toast-edit').addEventListener('click', function () {
                showToast('Cập nhập bộ đề thành công');
            });


            //XỰ KIỆN LIÊN QUAN ĐẾN THÊM BỘ CÂU HỎI
            let questionCount = 1;

            document.querySelector('#add-question').addEventListener('click', function () {
                const questionContainer = document.querySelector('#question-container');

                // Tạo một div mới cho câu hỏi
                const questionDiv = createQuestionDiv(questionContainer);

                // Tạo input cho câu hỏi
                const questionInput = document.createElement('input');
                questionInput.type = 'text';
                questionInput.className = 'form-control';
                questionInput.placeholder = 'Nội dung câu hỏi';

                // Tạo nút "Thêm câu trả lời"
                const addAnswerButton = document.createElement('button');
                addAnswerButton.type = 'button';
                addAnswerButton.className = 'btn btn-primary mt-3';
                addAnswerButton.textContent = 'Thêm câu trả lời';

                // Tạo một div cho câu trả lời
                const answerDiv = document.createElement('div');
                answerDiv.className = 'form-check ml-4 mt-3';

                // Sự kiện để thêm câu trả lời
                addAnswerButton.addEventListener('click', function () {
                    const answerInput = document.createElement('input');
                    answerInput.type = 'radio';
                    answerInput.name = 'question' + questionCount;
                    answerInput.className = 'form-check-input';
                    answerInput.id = 'question' + questionCount;

                    const answerLabel = document.createElement('label');
                    answerLabel.className = 'form-check-label mx-3';
                    answerLabel.textContent = 'Câu trả lời: ';

                    const answerText = document.createElement('input');
                    answerText.type = 'text';
                    answerText.className = 'form-control';
                    answerText.placeholder = 'Nội dung câu trả lời';

                    // Tạo biểu tượng cho việc xóa câu trả lời
                    const deleteAnswerIcon = document.createElement('i');
                    deleteAnswerIcon.className = 'fa-solid fa-trash text-danger';
                    deleteAnswerIcon.style.cursor = 'pointer';

                    // Sự kiện để xóa câu trả lời
                    deleteAnswerIcon.addEventListener('click', function () {
                        answerDiv.removeChild(answerLabel);
                        answerDiv.removeChild(deleteAnswerIcon);
                    });

                    answerLabel.appendChild(answerInput);
                    answerLabel.appendChild(deleteAnswerIcon);
                    answerLabel.appendChild(answerText);

                    answerDiv.appendChild(answerLabel);
                });

                questionDiv.appendChild(questionInput);
                questionDiv.appendChild(addAnswerButton);
                questionDiv.appendChild(answerDiv);

                // Tạo đường ngang (horizontal rule)
                const hr = document.createElement('hr');

                questionDiv.appendChild(hr);
                questionContainer.appendChild(questionDiv);
                questionCount++;
            });

            function createQuestionDiv(container) {
                const questionDiv = document.createElement('div');
                questionDiv.className = 'mb-3';

                // Tạo phần đoạn văn cho nhãn câu hỏi
                const questionLabel = document.createElement('p');
                questionLabel.className = 'd-inline';
                questionLabel.textContent = 'Câu hỏi ' + questionCount + ':';

                // Tạo biểu tượng để xóa câu hỏi
                const deleteQuestionIcon = document.createElement('i');
                deleteQuestionIcon.className = 'fa-solid fa-trash icon-image text-danger';
                deleteQuestionIcon.style.cursor = 'pointer';

                // Sự kiện để xóa câu hỏi và các câu trả lời liên quan
                deleteQuestionIcon.addEventListener('click', function () {
                    container.removeChild(questionDiv);
                    updateQuestionCount();
                });

                // Tạo biểu tượng cho việc thêm hình ảnh
                const addImageIcon = document.createElement('i');
                addImageIcon.className = 'fa-regular fa-image icon-image';
                addImageIcon.style.cursor = 'pointer';

                // Sự kiện để thêm hình ảnh
                addImageIcon.addEventListener('click', function () {
                    const imageInput = document.createElement('input');
                    imageInput.type = 'text';
                    imageInput.className = 'form-control my-2';
                    imageInput.placeholder = 'Gắn link hình ảnh';

                    // Thêm biểu tượng cho việc xóa hình ảnh
                    const deleteImageIcon = document.createElement('i');
                    deleteImageIcon.className = 'fa-solid fa-xmark text-danger remove-image-input';
                    deleteImageIcon.style.cursor = 'pointer';

                    // Sự kiện để xóa hình ảnh
                    deleteImageIcon.addEventListener('click', function () {
                        questionLabel.removeChild(imageInput);
                        questionLabel.removeChild(deleteImageIcon);
                    });

                    questionLabel.appendChild(imageInput);
                    questionLabel.appendChild(deleteImageIcon);
                });

                questionLabel.appendChild(deleteQuestionIcon);
                questionLabel.appendChild(addImageIcon);
                questionDiv.appendChild(questionLabel);

                return questionDiv;
            }

            function updateQuestionCount() {
                questionCount--;

                const questionLabels = document.querySelectorAll('.d-inline');
                questionLabels.forEach((label, index) => {
                    label.textContent = 'Câu hỏi ' + (index + 1);
                });
            }

            // xử lý sự kiện hủy trong thêm bộ đề
            function resetModalAddQuestion() {
                const modalAddQuestionContent = document.querySelector('#question-container');
                modalAddQuestionContent.innerHTML = '';
                questionCount = 1;
            }

            document.querySelector('#btn-cancel-add-question').addEventListener('click', resetModalAddQuestion);


            //XỰ KIỆN LIÊN QUAN ĐẾN EDIT
            //xử lý sự kiện đổi thời gian thi
            const editTimeIcon = document.getElementById("edit-time-icon");
            const examTimeSpan = document.getElementById("exam-time");

            let isEditing = false;

            editTimeIcon.addEventListener("click", () => {
                if (!isEditing) {
                    const inputElement = document.createElement("input");
                    inputElement.type = "text";
                    inputElement.value = examTimeSpan.textContent;
                    examTimeSpan.textContent = "";
                    examTimeSpan.appendChild(inputElement);
                    inputElement.focus();
                    isEditing = true;
                } else {
                    const inputElement = examTimeSpan.querySelector("input");
                    examTimeSpan.textContent = inputElement.value;
                    isEditing = false;
                }
            });

            // Xử lý sự kiện edit câu hỏi (đang bị bug)
            // const editQuestionIcons = document.querySelectorAll(".edit-question-icon");

            // editQuestionIcons.forEach((icon) => {
            //     icon.addEventListener("click", () => {
            //         const questionContainer = icon.closest(".question-container-review");

            //         //thay đổi đáp án
            //         const answerParagraphs = questionContainer.querySelectorAll(".answer-items p");
            //         answerParagraphs.forEach((paragraph) => {
            //             const inputValue = paragraph.textContent.trim();

            //             const inputElement = document.createElement("input");
            //             inputElement.type = "text";
            //             inputElement.value = inputValue;

            //             paragraph.parentNode.replaceChild(inputElement, paragraph);
            //         });

            //         //thay đổi câu hỏi
            //         const questionParagraph = questionContainer.querySelector(".question-input");

            //         const inputValueQuestion = questionParagraph.textContent.trim();
            //         const inputElementQuestion = document.createElement("input");
            //         inputElementQuestion.type = "text";
            //         inputElementQuestion.value = inputValueQuestion;

            //         questionParagraph.parentNode.replaceChild(inputElementQuestion, questionParagraph);

            //         const buttonChangeDiv = questionContainer.querySelector(".button-change-div");
            //         buttonChangeDiv.classList.remove("d-none");

            //         const cancelButton = questionContainer.querySelector(".btn-cancle-change");

            //         cancelButton.addEventListener("click", () => {
            //             // Thay thế các thẻ <input> bằng các thẻ <p>
            //             const inputElements = questionContainer.querySelectorAll("input");
            //             inputElements.forEach((input) => {
            //                 const paragraph = document.createElement("p");
            //                 paragraph.textContent = input.value;
            //                 input.parentNode.replaceChild(paragraph, input);
            //             });

            //             // Ẩn button-change-div
            //             const buttonChangeDiv = questionContainer.querySelector(".button-change-div");
            //             buttonChangeDiv.classList.add("d-none");
            //         });

            //         const confirmButton = questionContainer.querySelector(".btn-confirm-change");

            //         confirmButton.addEventListener("click", () => {
            //             const inputElements = questionContainer.querySelectorAll("input");
            //             const paragraphElements = questionContainer.querySelectorAll(".question-input");

            //             inputElements.forEach((input, index) => {
            //                 const paragraph = paragraphElements[index];
            //                 paragraph.textContent = input.value;
            //             });

            //             const buttonChangeDiv = questionContainer.querySelector(".button-change-div");
            //             buttonChangeDiv.classList.add("d-none");
            //         });
            //     });
            // });


        </script>
    </body>

</html>