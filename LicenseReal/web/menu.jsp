<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link
            rel="icon"
            type="image/x-icon"
            href="https://cdn-icons-png.flaticon.com/512/6556/6556219.png"
            />
    </head>
    <style>
        /* Tùy chỉnh thanh cuộn */
        ::-webkit-scrollbar {
            width: 6px; /* Đặt chiều rộng của thanh cuộn */
        }

        ::-webkit-scrollbar-track {
            background-color: #f1f1f1; /* Màu nền của thanh cuộn */
        }

        ::-webkit-scrollbar-thumb {
            background-color: #888; /* Màu của thanh cuộn */
            border-radius: 3px; /* Bo cong viền của thanh cuộn */
        }

        ::-webkit-scrollbar-thumb:hover {
            background-color: #555; /* Màu của thanh cuộn khi di chuột qua */
        }
    </style>
    <body>
        <c:if test="${empty sessionScope.ROLE}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <c:if test="${sessionScope.ROLE == 'US'}">
            <c:redirect url="MainController?action=member"/>
            Bạn không được cấp phép để truy cập vào trang này!
        </c:if>
        <c:if test="${sessionScope.ROLE == 'MT'}">
            <c:redirect url="MainController?action=mentor"/>
        </c:if>
        <!-- Menu -->
        <aside 
            id="layout-menu"
            class="layout-menu menu-vertical menu bg-menu-theme"
            >
            <div class="app-brand demo">
               
                    <span class="app-brand-logo demo"> </span>
                    <img src="https://cdn-icons-png.flaticon.com/512/6556/6556219.png" alt="Logo" class="w-8 h-8" style="width: 80px;
                         height: auto">
                    <span class=" demo menu-text fw-bold ms-2"
                          >DaoTaoLaiXe</span
                    >
            

                <a
                    href="javascript:void(0);"
                    class="layout menu-link text-large ms-auto d-block d-xl-none"
                    >
                    <i class="bx bx-chevron-left bx-sm align-middle"></i>
                </a>
            </div>

            <div class="menu-inner-shadow"></div>

            <ul class="menu-inner py-1">
                <li class="menu-header small text-uppercase">
                    <span class="menu-header-text">Công cụ &amp; trang</span>
                </li>
                <!-- Layouts -->
                <c:if test="${sessionScope.ROLE == 'AD'}">
                    <li class="menu-item">
                        <a href="MainController?action=admin" class="menu-link">
                            <i class="menu-icon fa-solid fa-chart-pie"></i>
                            <div data-i18n="Layouts">Thống kê</div>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="MainController?action=QuestionController" class="menu-link">
                            <i class="menu-icon fa-regular fa-circle-question"></i>
                            <div data-i18n="Layouts">Quản lí câu hỏi</div>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="MainController?action=TopicController" class="menu-link">
                            <i class="menu-icon fa-solid fa-list-ul"></i>
                            <div data-i18n="Layouts">Danh sách đề thi</div>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="MainController?action=DrivingProfileStaffController" class="menu-link">
                            <i class="menu-icon tf-icons fa-regular fa-address-card"></i>
                            <div data-i18n="Layouts">Duyệt hồ sơ đăng ký</div>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="MainController?action=FeedbackController" class="menu-link">
                            <i class="menu-icon tf-icons fa-regular fa-comment"></i>
                            <div data-i18n="Layouts">Duyệt phản hồi</div>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="MainController?action=ViewAllTransactions" class="menu-link">
                            <i class="menu-icon tf-icons fa-solid fa-wallet"></i>
                            <div data-i18n="Layouts">Duyệt hóa đơn</div>
                        </a>
                    </li>
                    <li class="menu-header small text-uppercase">
                        <span class="menu-header-text">Quản lý tài khoản</span>
                    </li>

                    <li class="menu-item">
                        <a href="MainController?action=memberStaff" class="menu-link">
                            <i class="menu-icon tf-icons fa-solid fa-users"></i>
                            <div data-i18n="Layouts">Thành viên</div>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="MainController?action=mentorStaff" class="menu-link">
                            <i class="menu-icon tf-icons fa-solid fa-people-pulling"></i>
                            <div data-i18n="Layouts">Người hướng dẫn</div>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="MainController?action=manageStaff&actionManage=read" class="menu-link">
                            <i class="menu-icon tf-icons fa-solid fa-people-group"></i>
                            <div data-i18n="Layouts">Nhân viên</div>
                        </a>
                    </li>
                </c:if>

                <c:if test="${sessionScope.ROLE == 'ST'}">
                    <li class="menu-item">
                        <a href="MainController?action=QuestionController" class="menu-link">
                            <i class="menu-icon fa-regular fa-circle-question"></i>
                            <div data-i18n="Layouts">Quản lí câu hỏi</div>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="MainController?action=TopicController" class="menu-link">
                            <i class="menu-icon fa-solid fa-list-ul"></i>
                            <div data-i18n="Layouts">Danh sách đề thi</div>
                        </a>
                    </li>

                    <li class="menu-item">
                        <a href="MainController?action=DrivingProfileStaffController" class="menu-link">
                            <i class="menu-icon tf-icons fa-regular fa-address-card"></i>
                            <div data-i18n="Layouts">Duyệt hồ sơ đăng ký</div>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="MainController?action=FeedbackController" class="menu-link">
                            <i class="menu-icon tf-icons fa-regular fa-comment"></i>
                            <div data-i18n="Layouts">Duyệt phản hồi</div>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="MainController?action=ViewAllTransactions" class="menu-link">
                            <i class="menu-icon tf-icons fa-solid fa-wallet"></i>
                            <div data-i18n="Layouts">Duyệt hóa đơn</div>
                        </a>
                    </li>
                </c:if>
                <li class="menu-header small text-uppercase">
                    <span class="menu-header-text">Tài khoản &amp; Người dùng</span>
                </li>

                <li class="menu-item" 
                    data-toggle="tooltip"
                    data-bs-toggle="modal" 
                    data-bs-target="#modalConfirmLogout" 
                    onclick="logout()">
                    <a href="#" class="menu-link">
                        <i class="menu-icon fa-solid fa-arrow-right-from-bracket"></i>
                        <div data-i18n="Layouts">Đăng xuất</div>
                    </a>
                </li>
            </ul>
        </aside>
        <!-- / Menu -->
        <div class="modal fade" id="modalConfirmLogout" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
             aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">XÁC NHẬN ĐĂNG XUẤT</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Bạn có chắc chắn muốn đăng xuất không?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <button type="button" class="btn btn-primary" id="btn-toast-logout" class="btn-close"
                                data-bs-dismiss="modal" aria-label="Close">Đăng xuất</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        function logout() {
            var btnToastDelete = document.querySelector('#btn-toast-logout');
            btnToastDelete.addEventListener('click', function () {
                var deleteUrl = 'LogoutServlet';
                window.location.href = deleteUrl;
                // Nếu bạn muốn ẩn modal sau khi xác nhận, bạn có thể sử dụng đoạn mã sau:
                document.getElementById('modalConfirmLogout').style.display = 'none';
            });
        }

        // Lắng nghe sự kiện click trên các thẻ li
        var liItems = document.querySelectorAll('.menu-item');
        liItems.forEach(function (li) {
            li.addEventListener('click', function () {
                // Xóa class "active" trên tất cả các thẻ li
                liItems.forEach(function (item) {
                    item.classList.remove('active');
                });
                // Thêm class "active" vào thẻ li được nhấp vào
                li.classList.add('active');
            });
        });

        // Kiểm tra nếu có class "active" trong URL, thêm class "active" vào thẻ li tương ứng
        var url = window.location.href;
        liItems.forEach(function (li) {
            if (url.includes(li.querySelector('a').getAttribute('href'))) {
                li.classList.add('active');
            }
        });
    </script>
</html>
