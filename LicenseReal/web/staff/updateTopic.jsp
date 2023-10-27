<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
            />

        <title>Cập nhật bộ đề</title>

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

        <!-- Thư viện jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Thư viện Bootstrap JS -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </head>
    <style>
        .check {
            margin-right: 6px;
        }
        .check:checked {
            accent-color: #6a6cff;
        }
        .check:checked ~ label{
            color: #6a6cff;
        }
        /* CSS cho thanh hiển thị */
        .status-bar {
            position: fixed;
            bottom: 0.25rem;
            left: 1.5rem;
            max-width: 50rem;
            text-align: left;
            font-weight: bold;
            box-shadow: 0 -2px 2px rgba(0, 0, 0, 0.1);
            z-index: 20;
            border-radius: 0.5rem;
        }

    </style>
    <body>
        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <c:import url="../menu.jsp"/>

                <!-- Layout container -->
                <div class="layout-page">
                    <!-- Navbar -->
                    <nav
                        class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                        id="layout-navbar"
                        >
                        <div
                            class="layout navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none"
                            >
                            <a
                                class="nav-item nav-link px-0 me-xl-4"
                                href="javascript:void(0)"
                                >
                                <i class="bx bx-menu bx-sm"></i>
                            </a>
                        </div>

                        <div
                            class="navbar-nav-right d-flex align-items-center"
                            id="navbar-collapse"
                            >
                            <!-- Search -->
                            <div class="navbar-nav align-items-center">
                                <div class="nav-item d-flex align-items-center">
                                    <i class="bx bx-search fs-4 lh-0"></i>
                                    <input
                                        type="text"
                                        class="form-control border-0 shadow-none ps-1 ps-sm-2"
                                        placeholder="Tìm kiếm.."
                                        aria-label="Tìm kiếm.."
                                        />
                                </div>
                            </div>
                            <!-- /Search -->
                        </div>
                    </nav>
                    <!-- / Navbar -->

                    <!-- Content -->
                    <div class="content-wrapper">
                        <div class="container-xxl flex-grow-1 container-p-y ">
                            <!-- Basic Bootstrap Table -->
                            <div class="card">
                                <h5
                                    class="card-header"
                                    style="display: flex; justify-content: space-between"
                                    >
                                    <div>Thêm câu hỏi vào bộ đề <span class="fw-bold text-primary">${sessionScope.topicName}</span></div>
                                </h5>
                                <form action="UpdateTopicServlet?id=${topicID}" method="POST"> 
                                    <div class="table-responsive text-nowrap">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>STT</th>
                                                    <th>Câu hỏi</th>
                                                    <th>Hình ảnh</th>
                                                    <th>Dạng câu hỏi</th>
                                                    <th>Đáp án</th>
                                                    <th>Đáp án đúng</th>
                                                    <th>Lựa chọn</th>
                                                </tr>
                                            </thead>
                                            <tbody class="table-border-bottom-0" >

                                                <c:forEach var="Q" items="${listQ}" varStatus="counter">
                                                    <c:set var="A" value="${listA[counter.index]}"></c:set>
                                                        <tr>
                                                            <td>
                                                                <span class="fw-medium">${counter.count}</span>
                                                        </td>
                                                        <td>
                                                            <span style="display: inline-block; 
                                                                  max-width: 10rem; 
                                                                  word-break: break-all; 
                                                                  overflow: hidden;">
                                                                <%-- Áp dụng cắt chuỗi ở đây --%>
                                                                <c:set var="truncatedQuestion" value="${fn:substring(Q.question, 0, 18)}" />
                                                                <c:choose>
                                                                    <c:when test="${fn:length(Q.question) > 18}">
                                                                        ${truncatedQuestion}...
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        ${truncatedQuestion}
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </span>
                                                        </td>
                                                        <td>
                                                            <c:if test="${not empty Q.image}">
                                                                <img src="data:image;base64,${Q.image}" style="max-height: 5rem; max-width: 10rem"/>
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <c:if test="${Q.questionType eq '1'}">
                                                                <span class="fw-medium" style="color:#fba265">Câu hỏi liệt</span>
                                                            </c:if>
                                                            <c:if test="${Q.questionType eq '0'}">
                                                                <span class="fw-medium">Bình thường</span>
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <c:set var="answer" value="${fn:replace(A.answer, '/', '<br>')}" />
                                                            <div style="display: inline-block; 
                                                                 max-width: 15rem; 
                                                                 word-break: break-all; 
                                                                 overflow: hidden;">
                                                                ${answer}
                                                            </div>
                                                        </td>
                                                        <td style="align-content: center">
                                                            <span class="badge bg-label-primary me-1">${A.isCorrect}</span>
                                                        </td>
                                                        <td>
                                                            <c:set var="isChecked" value="false" />

                                                            <c:forEach var="L" items="${listQuestionID}">
                                                                <c:if test="${L.questionID == Q.id}">
                                                                    <c:set var="isChecked" value="true" />
                                                                </c:if>
                                                            </c:forEach>

                                                            <input style="cursor: pointer;" id="check${Q.id}" type="checkbox" name="checkbox" value="${Q.id}" class="check question${Q.questionType} me-1" 
                                                                   <c:if test="${isChecked}">checked</c:if> 
                                                                   <c:if test="${!isChecked}">disabled</c:if>
                                                                   />
                                                            <label style="cursor: pointer;" for="check${Q.id}">Chọn</label>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- Thanh hiển thị -->
                                    <div class="status-bar bg-light p-3">
                                        <span id="normalCount" class="me-3">Số câu bình thường: 30</span>
                                        <span id="paralyzedCount" class="me-3">Số câu liệt: 5</span>
                                        <span id="totalCounter" class="me-3">Tổng số câu: 35</span>
                                        <button type="submit" onclick="checkTotalQuestion(event)" class="create-button btn btn-primary">Cập nhật</button>
                                        <a href="MainController?action=details&id=${topicID}"><button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button></a>
                                    </div>
                                </form>


                                <div class="modal fade" id="modalConfirmDelete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                                     aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="staticBackdropLabel">XÁC NHẬN LOẠI BỎ</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                Bạn có chắc muốn xóa câu hỏi này?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                                <button type="button" class="btn btn-primary" id="btn-toast-delete" class="btn-close"
                                                        data-bs-dismiss="modal" aria-label="Close">Xác nhận</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- toast thông báo thành công-->
                                <c:if test="${not empty message}">
                                    <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11" >
                                        <div id="toast-notification" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
                                            <div class="toast-header">
                                                <c:if test="${message eq 'success'}">
                                                    <strong id="toast-message" class="me-auto text-success"></strong>
                                                </c:if>
                                                <c:if test="${message eq 'fail'}">
                                                    <strong id="toast-message" class="me-auto text-danger"></strong>
                                                </c:if>
                                                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${empty message}">
                                    <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11" >
                                        <div id="toast-notification" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
                                            <div class="toast-header">
                                                <strong id="toast-message" class="me-auto text-primary"></strong>
                                                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                            <nav aria-label="Page navigation" 
                                 style="position: fixed;
                                 bottom: 0.25rem;
                                 right: 1.5rem;">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                        <c:set var="page" value="${totalSize / 50}" />
                                        <c:if test="${totalSize % 50 > 0}">
                                            <c:set var="totalPages" value="${page + 1}" />
                                        </c:if>
                                        <c:forEach var="i" begin="2" end="${totalPages}">
                                        <li class="page-item"><a class="page-link" href="#"><c:out value="${i}" /></a></li>
                                        </c:forEach>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <script>
            function showMess(id) {
                var btnToastDelete = document.querySelector('#btn-toast-delete');
                btnToastDelete.addEventListener('click', function () {
                    var deleteUrl = 'DeleteQuestionController?id=' + id;
                    window.location.href = deleteUrl;
                    // Nếu bạn muốn ẩn modal sau khi xác nhận, bạn có thể sử dụng đoạn mã sau:
                    document.getElementById('modalConfirmDelete').style.display = 'none';
                });
            }

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
                    var success = `Thêm bộ đề thành công!`;
                    toastMessage.textContent = success;
                } else if (message === 'fail') {
                    var fail = 'Không thể thêm bộ đề!';
                    toastMessage.textContent = fail;
                } else if (message === 'normal_full') {
                    var normal_full = 'Đã đạt giới hạn câu hỏi bình thường!';
                    toastMessage.textContent = normal_full;
                } else if (message === 'paralyze_full') {
                    var paralyze_full = 'Đã đạt giới hạn câu hỏi liệt!';
                    toastMessage.textContent = paralyze_full;
                } else if (message === 'total_question') {
                    var total_question = 'Không thể cập nhật bộ đề nếu không chọn đủ 35 câu hỏi!';
                    toastMessage.textContent = total_question;
                }
                toast.classList.remove('hide');
                toast.classList.add('show');
                setTimeout(() => {
                    toast.classList.remove('show');
                }, 3000);
            }

            var checkboxes = document.querySelectorAll('input[type="checkbox"].check'); // Lấy tất cả các thẻ input checkbox
            var paralyzedQuestion = document.querySelectorAll('input[type="checkbox"].question1.check');
            var normalQuestion = document.querySelectorAll('input[type="checkbox"].question0.check');

            var totalCounter = 35; // Biến đếm tổng số lần chọn cho tất cả các checkbox
            var paralyzedCount = 5;
            var normalCount = 30;

            checkboxes.forEach(function (checkbox) {
                checkbox.addEventListener('change', function (event) {
                    if (this.checked) {
                        totalCounter++; // Tăng biến đếm tổng số lần chọn
                    } else {
                        totalCounter--; // Giảm biến đếm tổng số lần chọn
                    }
                    document.getElementById('totalCounter').textContent = 'Tổng số câu: ' + totalCounter; // Hiển thị tổng số lần chọn ra màn hình
                });
            });

            function checkTotalQuestion(event) {
                // Kiểm tra giới hạn và hiển thị thông báo
                if (totalCounter < 35) {
                    event.preventDefault(); // Ngăn chặn sự kiện submit mặc định của form
                    showToast('total_question');
                }
            }

            paralyzedQuestion.forEach(function (checkbox) {
                checkbox.addEventListener('change', function (event) {
                    if (this.checked) {
                        paralyzedCount++;
                    } else {
                        paralyzedCount--;
                    }
                    document.getElementById('paralyzedCount').textContent = 'Số câu liệt: ' + paralyzedCount;

                    // Kiểm tra giới hạn và hiển thị thông báo
                    if (paralyzedCount === 5) {
                        checkboxes.forEach(function (checkbox) {
                            if (checkbox.classList.contains('question1') && !checkbox.checked) {
                                checkbox.disabled = true; // Ngăn chặn người dùng chọn checkbox
                            }
                        });
                        showToast('paralyze_full');
                    } else {
                        checkboxes.forEach(function (checkbox) {
                            if (checkbox.classList.contains('question1') && checkbox.disabled) {
                                checkbox.disabled = false; // Cho phép người dùng chọn checkbox trở lại
                            }
                        });
                    }
                });
            });

            normalQuestion.forEach(function (checkbox) {
                checkbox.addEventListener('change', function (event) {
                    if (this.checked) {
                        normalCount++;
                    } else {
                        normalCount--;
                    }
                    document.getElementById('normalCount').textContent = 'Số câu bình thường: ' + normalCount;

                    // Kiểm tra giới hạn và hiển thịthông báo
                    if (normalCount === 30) {
                        checkboxes.forEach(function (checkbox) {
                            if (checkbox.classList.contains('question0') && !checkbox.checked) {
                                checkbox.disabled = true; // Ngăn chặn người dùng chọn checkbox
                            }
                        });
                        showToast('normal_full');
                    } else {
                        checkboxes.forEach(function (checkbox) {
                            if (checkbox.classList.contains('question0') && checkbox.disabled) {
                                checkbox.disabled = false; // Cho phép người dùng chọn checkbox trở lại
                            }
                        });
                    }
                });
            });

            $(document).ready(function () {
                var resultsPerPage = 50; // Số lượng kết quả trên mỗi trang

                // Xác định số lượng trang dựa trên số lượng kết quả
                var totalResults = ${totalSize};
                var totalPages = Math.ceil(totalResults / resultsPerPage);

                // Hiển thị trang hiện tại
                var currentPage = 1;
                showPage(currentPage);

                // Xử lý sự kiện khi người dùng chuyển trang
                // Xử lý sự kiện khi người dùng nhấp vào nút "Previous"
                $(".pagination").on("click", ".page-link", function (event) {
                    event.preventDefault();
                    if ($(this).attr("aria-label") === "Previous") {
                        currentPage = currentPage - 1;
                        showPage(currentPage);
                    } else if ($(this).attr("aria-label") === "Next") {
                        currentPage = currentPage + 1;
                        showPage(currentPage);
                    } else {
                        var targetPage = parseInt($(this).text());
                        if (!isNaN(targetPage)) {
                            currentPage = targetPage;
                            showPage(currentPage);
                        }
                    }
                });

                // Hiển thị các kết quả tương ứng với trang hiện tại
                function showPage(page) {
                    // Tính toán chỉ số bắt đầu và kết thúc của kết quả trên trang này
                    var startIndex = (page - 1) * resultsPerPage;
                    var endIndex = startIndex + resultsPerPage;

                    // Hiển thị các kết quả tương ứng
                    $(".table tbody tr").hide();
                    $(".table tbody tr").slice(startIndex, endIndex).show();

                    // Cập nhật trạng thái của phân trang
                    updatePagination(page);
                }

                // Cập nhật trạng thái của phân trang
                function updatePagination(page) {
                    $(".pagination .page-item").removeClass("active");
                    $(".pagination .page-item").eq(page).addClass("active");
                }

            });

            window.addEventListener('scroll', function () {
                var nav = document.querySelector('.pagination-container');
                var windowHeight = window.innerHeight;
                var documentHeight = Math.max(document.documentElement.clientHeight, document.body.clientHeight);
                var scrollPosition = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;

                if (scrollPosition + windowHeight >= documentHeight) {
                    nav.style.bottom = '20px';
                } else {
                    nav.style.bottom = (windowHeight - nav.offsetHeight + 20) + 'px';
                }
            });
        </script>
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

