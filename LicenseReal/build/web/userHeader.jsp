<%-- 
    Document   : userHeader
    Created on : 05-10-2023, 12:39:35
    Author     : HP Pro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/css/userHome.css"/>
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
        <header class="header no-select">
            <div class="main__navbar">
                <div class="container mx-auto d-flex align-items-center gap-1 justify-content-between">
                    <div class="logo">
                        <a href="MainController" class="d-flex align-items-center gap-2">
                            <img src="https://cdn-icons-png.flaticon.com/512/6556/6556219.png" alt="Logo" class="w-8 h-8" />
                            <h3 class="text-xl font-bold uppercase">DaoTaoLaiXe</h3>
                        </a>
                    </div>

                    <div class="menu">
                        <!--Guest-->
                        <c:if test="${empty sessionScope.ROLE}">
                            <a class="menu_items " href="MainController">Home</a>
                            <a class="menu_items " href="login.jsp">Đăng ký học thực hành</a>
                            <a class="menu_items" href="MainController?action=PracticeTest">Thi thử trắc nghiệm</a>
                        </c:if>

                        <!--Member-->
                        <c:if test="${sessionScope.ROLE == 'US'}">
                            <a class="menu_items " href="MainController">Home</a>
                            <a class="menu_items " href="#">Đăng ký học thực hành</a>
                            <a class="menu_items " href="#">Nộp hồ sơ thi</a>
                            <a class="menu_items" href="MainController?action=viewScheduleMember" >Lịch Học</a>
                            <a class="menu_items" to="/#">Lịch thi</a>
                            <a class="menu_items" href="MainController?action=PracticeTest">Thi thử trắc nghiệm</a>
                        </c:if>

                        <!--Mentor-->
                        <c:if test="${sessionScope.ROLE == 'MT'}">
                            <a class="menu_items " href="MainController">Home</a>
                            <a class="menu_items" href="#" >Đăng ký lịch dạy</a>
                            <a class="menu_items" href="MainController?action=viewSchedule" >Lịch dạy</a>
                        </c:if>

                        <div class="login_name">
                            <c:choose>
                                <c:when test="${user != null}">

                                    <a  class="fullname">Hello, ${user.getName()}</a>
                                    <select id="dropdown">
                                        <c:if test="${action == 'updatePage' || action == 'ViewTransactions'  || action == 'passwordProfile' || action =='changePasswordProfile'}">
                                            <option value="MainController?action=home">Home</option>
                                            <option selected value="MainController?action=updatePage&id=${sessionScope.user.getId()}">Thông tin cá nhân</option>
                                            <c:if test="${sessionScope.ROLE == 'AD'}">
                                                <option value="MainController?action=admin">Thống kê<</option>
                                            </c:if>
                                            <option value="MainController?action=logout">Đăng xuất</option>
                                        </c:if>
                                        <c:if test="${action == 'member'|| action == 'home' || action == 'update' || action == 'PracticeTest'}">
                                            <option selected value="MainController?action=home">Home</option>
                                            <option value="MainController?action=updatePage&id=${sessionScope.user.getId()}">Thông tin cá nhân</option>
                                            <c:if test="${sessionScope.ROLE == 'AD'}">
                                                <option value="MainController?action=admin">Thống kê</option>
                                            </c:if>
                                            <option value="MainController?action=logout">Đăng xuất</option>
                                        </c:if>

                                    </select>
                                    <a href="MainController?action=updateP&id=${sessionScope.user.getId()}" class="fullname">Hello, ${user.getName()}</a>
                                </c:when>
                                <c:otherwise>
                                    <a class="btn_login"  href="MainController?action=loginPage">Đăng nhập</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </body>
</html>
