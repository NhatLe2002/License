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
    </head>
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
                            <a class="menu_items " href="login.jsp">Đăng ký học thực hành</a>
                            <a class="menu_items" href="MainController?action=PracticeTest">Thi thử trắc nghiệm</a>
                        </c:if>

                        <!--Member-->
                        <c:if test="${sessionScope.ROLE == 'US'}">
                            <a class="menu_items " href="MainController?action=home">Home</a>
                            <a class="menu_items " href="#">Đăng ký học thực hành</a>
                            <a class="menu_items " href="#">Nộp hồ sơ thi</a>
                            <a class="menu_items" href="MainController?action=viewScheduleMember" >Lịch Học</a>
                            <a class="menu_items" to="/#">Lịch thi</a>
                            <a class="menu_items" href="MainController?action=PracticeTest">Thi thử trắc nghiệm</a>
                            <a onclick="openPopup()">Thanh toán</a>
                            <div id="popup" style="display: none;">
                                <form method="POST" action="MainController">
                                    <h2>Bạn muốn :</h2>
                                    <select name="type">
                                        <option  value="regisLearn">Đăng ký gói học thực hành</option>
                                        <option  value="regisTest">Đăng ký nộp hồ sơ thi</option>
                                    </select>
                                    <button  name="action" value="payment" type="submit">Đồng ý</button>
                                    <button  name="action" value="home" onclick="closePopup()">Đóng</button>

                                </form>
                            </div>
                        </c:if>

                        <!--Mentor-->
                        <c:if test="${sessionScope.ROLE == 'MT'}">
                            <a class="menu_items " href="MainController?action=home">Home</a>
                            <a class="menu_items" href="#" >Đăng ký lịch dạy</a>
                            <a class="menu_items" href="MainController?action=viewSchedule" >Lịch dạy</a>
                        </c:if>

                        <div class="login_name">
                            <c:choose>
                                <c:when test="${user != null}">
                                    <a  class="fullname">Hello, ${user.getName()}</a>
                                    <select id="dropdown">
                                        <c:if test="${action == 'updatePage' }">
                                            <option value="MainController?action=home">Home</option>
                                            <option selected value="MainController?action=updatePage"> <a href="updateProfile?id=${sessionScope.user.getId()}" class="fullname">Profile</a></option>
                                            <option value="MainController?action=logout">Logout</option>
                                        </c:if>
                                        <c:if test="${action == 'member'|| action == 'home' || action == 'update' || action == 'PracticeTest'}">
                                            <option selected value="MainController?action=home">Home</option>
                                            <option value="updateProfile?action=updatePage&id=${sessionScope.user.getId()}">Profile</option>
                                            <option value="MainController?action=logout">Logout</option>
                                        </c:if>

                                    </select>

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
        <script>
            var dropdown = document.getElementById("dropdown");
            dropdown.addEventListener("change", function () {
                var selectedOption = dropdown.options[dropdown.selectedIndex];
//                console.log("Selected option: " + selectedOption);
//                dropdown.options[1].selected = true;
//                console.log(dropdown.options[1]);
//                for (var i = 0; i < dropdown.options.length; i++) {
//                    if (dropdown.options[i].value === selectedOption) {
//                        dropdown.options[i].setAttribute("selected", "selected");
//                    } else {
//                        dropdown.options[i].removeAttribute("selected");
//                    }
//                }

//                if (selectedOption.value === dropdown.options[1].value)) {
//                   console.log("hah")
//                } 
                window.location.href = "http://localhost:8080/LicenseReal/" + selectedOption.value;
            }
            );
        </script>
        <script>
            function openPopup() {
                var popup = document.getElementById("popup");
                popup.style.display = "block";
                popup.classList.add("highlight");
            }

            function closePopup() {
                var popup = document.getElementById("popup");
                popup.style.display = "none";
                popup.classList.remove("highlight");
            }
        </script>
    </body>
</html>
