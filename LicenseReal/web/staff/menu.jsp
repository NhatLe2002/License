<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    </head>
    <body>
        <!-- Menu -->
        <aside
            id="layout-menu"
            class="layout-menu menu-vertical menu bg-menu-theme"
            >
            <div class="app-brand demo">
                <a href="index.html" class="app-brand-link">
                    <span class="app-brand-logo demo"> </span>
                    <img src="https://cdn-icons-png.flaticon.com/512/6556/6556219.png" alt="Logo" class="w-8 h-8" style="width: 80px;
                         height: auto">
                    <span class=" demo menu-text fw-bold ms-2"
                          >DaoTaoLaiXe</span
                    >
                </a>

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
                <li class="menu-item active">
                    <a href="MainController?action=QuestionController" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-layout"></i>
                        <div data-i18n="Layouts">Quản lí câu hỏi</div>
                    </a>
                </li>

                <li class="menu-item">
                    <a href="#" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-list-ul"></i>
                        <div data-i18n="Layouts">Danh sách đề thi</div>
                    </a>
                </li>

                <li class="menu-item">
                    <a href="#" class="menu-link">
                        <i class="menu-icon tf-icons fa-regular fa-address-card"></i>
                        <div data-i18n="Layouts">Duyệt hồ sơ đăng ký</div>
                    </a>
                </li>

                <li class="menu-item">
                    <a href="#" class="menu-link">
                        <i class="menu-icon tf-icons fa-regular fa-comment"></i>
                        <div data-i18n="Layouts">Duyệt phản hồi</div>
                    </a>
                </li>


                <li class="menu-header small text-uppercase">
                    <span class="menu-header-text">Tài khoản &amp; Người dùng</span>
                </li>

                <li class="menu-item" 
                    data-toggle="tooltip" title="Xóa"
                    data-bs-toggle="modal" 
                    data-bs-target="#modalConfirmDelete" 
                    onclick="logout()">
                    <a href="#" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-log-out"></i>
                        <div data-i18n="Layouts">Đăng xuất</div>
                    </a>
                </li>
            </ul>
        </aside>
        <!-- / Menu -->
        <div class="modal fade" id="modalConfirmDelete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
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
                        <button type="button" class="btn btn-primary" id="btn-toast-delete" class="btn-close"
                                data-bs-dismiss="modal" aria-label="Close">Đăng xuất</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        function logout() {
            var btnToastDelete = document.querySelector('#btn-toast-delete');
            btnToastDelete.addEventListener('click', function () {
                var deleteUrl = 'LogoutServlet';
                window.location.href = deleteUrl;
                // Nếu bạn muốn ẩn modal sau khi xác nhận, bạn có thể sử dụng đoạn mã sau:
                document.getElementById('modalConfirmDelete').style.display = 'none';
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
    </script>
</html>
