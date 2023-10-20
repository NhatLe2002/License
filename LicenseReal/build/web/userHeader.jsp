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
    </head>
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
                        <a class="menu_items " href="MainController">Home</a>
                        <a class="menu_items" to="/#">Hỗ trợ</a>
                        <a class="menu_items" to="/#">Thông tin lý thuyết</a>
                        <!--Cho nay la feature cua mentor, can cao navarbar rieng cho mentor nha-->
                        <a class="menu_items" href="MainController?action=viewSchedule" >Lịch dạy</a>
                        <a class="menu_items" href="MainController?action=viewScheduleMember" >Lịch Học</a>
                        <a class="menu_items" to="/#">Lịch thi</a>
                        <a class="menu_items" href="MainController?action=PracticeTest">Thi thử trắc nghiệm</a>
                        <div class="login_name">
                            <c:choose>
                                <c:when test="${user != null}">
                                    <a href="#" class="fullname">Hello, ${user.getName()}</a>
                                </c:when>
                                <c:when test="${account != null}">
                                    <a href="#" class="fullname">Hello, ${account.getUsername()}</a>
                                </c:when>
                                <c:otherwise>
                                    <a class="btn_login"  href="login.jsp">Log in</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </body>
</html>
