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

        <style>
            select {
                border: none;
                /* Add any other styling you want for the select element */
            }

            .highlight {
                border: 2px solid #ffcc00; /* Yellow border */
            }
            #overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent gray background */
                z-index: 1; /* Ensure the overlay is above other elements */
            }

            #popup {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
                z-index: 2; /* Ensure the popup is above the overlay */
            }
        </style>

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
                        <a href="MainController?action=home" class="d-flex align-items-center gap-2">
                            <img src="https://cdn-icons-png.flaticon.com/512/6556/6556219.png" alt="Logo" class="w-8 h-8" />
                            <h3 class="text-xl font-bold uppercase">DaoTaoLaiXe</h3>
                        </a>
                    </div>

                    <div class="menu">

                        <!--Guest-->
                        <c:if test="${empty sessionScope.ROLE}">
                            <a class="menu_items " href="MainController?action=home">Home</a>
                            <a class="menu_items " href="MainController?action=loginPage">Đăng ký học thực hành</a>
                            <a class="menu_items" href="MainController?action=PracticeTest">Thi thử trắc nghiệm</a>
                        </c:if>

                        <!--Member-->
                        <c:if test="${sessionScope.ROLE == 'US'}">
                            <a class="menu_items " href="MainController?action=home">Home</a>
                            <a class="menu_items " href="MainController?action=regisScheduleByMember" >Đăng ký học thực hành</a>

                            <a class="menu_items " href="MainController?action=viewScheduleMember" >Lịch Học Thực Hành</a>
                            <a class="menu_items " href="MainController?action=PracticeTest">Thi thử trắc nghiệm</a>
                            <!--<a onclick="openPopup()">Thanh toán</a>-->
                            <a class="menu_items " href="MainController?action=paymentPage">Thanh toán</a>
                            <!--                            <div class="modal fade" id="modalRegisterType" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                                                             aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered">
                                                                <div class="modal-content p-4">
                                                                  
                                                                        <h2>Bạn muốn :</h2>
                                                                        <select name="type" class="form-select mb-3">
                                                                            <option  value="regisLearn">Đăng ký gói học thực hành</option>
                                                                            <option  value="regisTest">Đăng ký nộp hồ sơ thi</option>
                                                                        </select>
                            
                                                                        <div class="flex gap-3 flex-row">
                                                                            <button class="btn btn-primary" name="action" value="payment" type="submit">Đồng ý</button>
                                                                            <button class="btn btn-secondary" name="action" value="home" onclick="closePopup()">Đóng</button>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>-->

                        </c:if>

                        <!--Mentor-->
                        <c:if test="${sessionScope.ROLE == 'MT'}">
                            <a class="menu_items " href="MainController?action=home">Home</a>
                            <a class="menu_items" href="MainController?action=regisSchedule" >Đăng kí lịch dạy</a>
                            <a class="menu_items" href="MainController?action=viewSchedule" >Lịch dạy</a>
                        </c:if>

                        <div class="login_name">
                            <c:choose>
                                <c:when test="${user != null}">
                                    <div class="dropdown">
                                        <button class="btn btn-warning dropdown-toggle" type="button" 
                                                data-bs-toggle="dropdown" aria-expanded="false">
                                            Hello, ${user.getName()}
                                        </button>
                                        <ul class="dropdown-menu ">
                                            <li><a class="dropdown-item" href="MainController?action=home">Home</a></li>
                                            <c:if test="${sessionScope.ROLE == 'US'}">
                                                    <li><a class="dropdown-item" href="MainController?action=updateP&id=${sessionScope.user.getId()}">Thông tin cá nhân</a></li>
                                                    </c:if>
                                                    <c:if test="${sessionScope.ROLE == 'MT'}">
                                                    <li><a class="dropdown-item" href="MainController?action=updateMentor&id=${sessionScope.user.getId()}">Thông tin giảng viên</a></li>
                                                    </c:if>
                                                <c:if test="${sessionScope.ROLE == 'AD'}">
                                                <li><a class="dropdown-item" href="MainController?action=admin">Thống kê</a></li>
                                                </c:if>
                                            <li><a class="dropdown-item" href="MainController?action=logout">Đăng xuất</a></li>
                                        </ul>
                                    </div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
       
        <script>
            
            function openPopup() {
                var popup = document.getElementById("popup");
                popup.style.display = "block";
                popup.classList.add("highlight");
            }
            function catchEvent(event) {
               console.log(event);
            }
            function closePopup() {
                var popup = document.getElementById("popup");
                popup.style.display = "none";
                popup.classList.remove("highlight");
            }
        </script>
    </body>
</html>
