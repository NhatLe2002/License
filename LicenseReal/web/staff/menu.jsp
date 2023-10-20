<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                <!-- Dashboards -->
                <li class="menu-item">
                    <a href="./index.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-home-circle"></i>
                        <div data-i18n="Dashboards">Thống kê</div>
                    </a>
                </li>

                <!-- Layouts -->
                <li class="menu-item active">
                    <a href="MainController?action=QuestionController" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-layout"></i>
                        <div data-i18n="Layouts">Quản lí câu hỏi</div>
                    </a>
                </li>

                <li class="menu-item">
                    <a href="./user-management.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-layout"></i>
                        <div data-i18n="Layouts">Quản lí người dùng</div>
                    </a>
                </li>

                <li class="menu-header small text-uppercase">
                    <span class="menu-header-text">Công cụ &amp; trang</span>
                </li>

                <li class="menu-item">
                    <a href="./calendar-management.html" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-calendar"></i>
                        <div data-i18n="Layouts">Lịch học</div>
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
                        <i class="menu-icon tf-icons bx bx-history"></i>
                        <div data-i18n="Layouts">Lịch sử giao dịch</div>
                    </a>
                </li>

                <li class="menu-header small text-uppercase">
                    <span class="menu-header-text">Tài khoản &amp; Người dùng</span>
                </li>

                <li class="menu-item">
                    <a href="#" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-log-out"></i>
                        <div data-i18n="Layouts">Đăng xuất</div>
                    </a>
                </li>
            </ul>
        </aside>
        <!-- / Menu -->
    </body>
</html>
