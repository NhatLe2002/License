<%@page import="dto.MemberDTO"%>
<%@page import="dao.MemberDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
            />

        <title>Duyệt hóa đơn</title>

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
                                    <div>Xét duyệt hóa đơn</div>
                                    <!-- Button trigger modal -->
                                    <div>
                                        <button onclick="showPaidBills()" style="background-color: green; color: white; padding: 5px 10px;  cursor: pointer; border-radius: 5px;">
                                            Đã thanh toán
                                        </button>
                                        <button onclick="showUnpaidBills()" style="background-color: red; color: white; padding: 5px 10px;  cursor: pointer; border-radius: 5px;">
                                            Chưa thanh toán
                                        </button>
                                    </div>
                                </h5>

                                <div class="table-responsive text-nowrap">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Tên</th>
                                                <th>Giá</th>
                                                <th>Loại hình</th>
                                                <th>Tình trạng</th>
                                                <th>Hình thức thanh toán</th>
                                                <th>Ngày tạo</th>
                                                <th>Tính năng</th>
                                            </tr>
                                        </thead>
                                        <tbody class="table-border-bottom-0" >
                                            <c:forEach items="${listP}" var="p" varStatus="loop">


                                                <c:choose>
                                                    <c:when test="${p.isStatus() == false}">
                                                        <tr class="unpaid-bill" >
                                                            <td>
                                                                ${loop.index + 1}
                                                            </td>
                                                            <td >
                                                                ${memberNames[loop.index]}

                                                            </td>
                                                            <td>${Integer (p.getPrice())/1000000}tr</td>
                                                            <c:if test="${p.getType().contains('regisTest')}">
                                                                <td>Đăng ký nộp hồ sơ</td>
                                                            </c:if>
                                                            <c:if test="${p.getType().contains('regisLearn')}">
                                                                <td>Đăng ký học thực hành</td>
                                                            </c:if>

                                                            <c:if test="${p.isStatus() == false}">
                                                                <td style="color: red;">Chưa thanh toán</td>
                                                            </c:if>
                                                            <c:if test="${p.isCash_type() == true}">
                                                                <td>VN Pay</td>
                                                            </c:if>
                                                            <c:if test="${p.isCash_type() == false}">
                                                                <td>Tiền mặt</td>
                                                            </c:if>                                 
                                                            <td>${p.getCreate_date()}</td>                                                           
                                                            <c:if test="${p.isStatus() == false}">
                                                                <td>
                                                                    <div class="dropdown">
                                                                        <button title="Tính năng"
                                                                                type="button"
                                                                                class="btn p-0 dropdown-toggle hide-arrow"
                                                                                data-bs-toggle="dropdown"
                                                                                >
                                                                            <i class="bx bx-dots-vertical-rounded"></i>
                                                                        </button>
                                                                        <div class="dropdown-menu">
                                                                            <a class="dropdown-item"
                                                                               href="MainController?action=acceptedPayment&id=${p.id}"
                                                                               ><i class="fa-solid fa-check me-1"></i>Duyệt hóa đơn
                                                                            </a>                                                                   
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </c:if>
                                                        </tr>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <tr class="paid-bill" style="display: none;">
                                                            <td>
                                                                ${loop.index + 1}
                                                            </td>
                                                            <td >
                                                                ${memberNames[loop.index]}

                                                            </td>
                                                            <td>${Integer (p.getPrice())/1000000}tr</td>
                                                            <c:if test="${p.getType().contains('regisTest')}">
                                                                <td>Đăng ký nộp hồ sơ</td>
                                                            </c:if>
                                                            <c:if test="${p.getType().contains('regisLearn')}">
                                                                <td>Đăng ký học thực hành</td>
                                                            </c:if>

                                                            <c:if test="${p.isStatus() == true}">
                                                                <td style="color: green;">Đã thanh toán</td>
                                                            </c:if>
                                                            <c:if test="${p.isCash_type() == true}">
                                                                <td>VN Pay</td>
                                                            </c:if>
                                                            <c:if test="${p.isCash_type() == false}">
                                                                <td>Tiền mặt</td>
                                                            </c:if>                                 
                                                            <td>${p.getCreate_date()}</td>                                                           
                                                            <c:if test="${p.isStatus() == true}">
                                                                <td> </td>
                                                            </c:if>
                                                        </tr>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>



                            </div>
                            <nav aria-label="Page navigation" style="position: fixed; bottom: 0.25rem; right: 1.5rem;">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <li class="page-item active">
                                        <a class="page-link" href="#">1</a>
                                    </li>
                                    <c:set var="page" value="${totalSize / 150}" />
                                    <c:if test="${totalSize % 150 > 0}">
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
            function showPaidBills() {
                const unpaidBills = document.querySelectorAll('.unpaid-bill');
                const paidBills = document.querySelectorAll('.paid-bill');

                unpaidBills.forEach((bill) => {
                    bill.style.display = 'none';
                });

                paidBills.forEach((bill) => {
                    bill.style.display = 'table-row';
                });
            }

            function showUnpaidBills() {
                const unpaidBills = document.querySelectorAll('.unpaid-bill');
                const paidBills = document.querySelectorAll('.paid-bill');

                unpaidBills.forEach((bill) => {
                    bill.style.display = 'table-row';
                });

                paidBills.forEach((bill) => {
                    bill.style.display = 'none';
                });
            }
        </script>
       <script>
            $(document).ready(function () {
                var resultsPerPage = 150; // Số lượng kết quả trên mỗi trang

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
                    var success = 'Xóa câu hỏi thành công!';
                    toastMessage.textContent = success;
                } else {
                    var fail = 'Không thể xóa câu hỏi!';
                    toastMessage.textContent = fail;
                }
                toast.classList.remove('hide');
                toast.classList.add('show');
                setTimeout(() => {
                    toast.classList.remove('show');
                }, 3000);
            }
            //            document.querySelector('#btn-toast-delete').addEventListener('click', function () {
            //                window.location.href = 'DeleteQuestionController?id=' + id;
            ////                showToast('Xóa bộ đề thành công');
            //            });
            //            document.querySelector('#btn-toast-add').addEventListener('click', function () {
            //                showToast('Thêm bộ đề thành công');
            //            });

            //            document.querySelector('#btn-toast-edit').addEventListener('click', function () {
            //                showToast('Cập nhập bộ đề thành công');
            //            });
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

