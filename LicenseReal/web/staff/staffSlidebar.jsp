<%-- 
    Document   : staffSlidebar
    Created on : 06-10-2023, 20:25:34
    Author     : HP Pro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
            <div class="position-sticky pt-3">
                <ul class="nav flex-column">
                    <li class="nav-item dashboard-btn">
                        <a href="#" class="nav-link">
                            <i class="fa-solid fa-chart-line"></i> Dash Board
                        </a>
                    </li>
                    <li class="nav-item list-user-btn">
                        <a href="#" class="nav-link">
                            <i class="fa-regular fa-user"></i> User
                        </a>
                    </li>
                    <li class="nav-item list-user-btn">
                        <a href="#" class="nav-link">
                            <i class="fa-regular fa-user"></i> Question
                        </a>
                    </li>
                    <li class="nav-item list-topic-btn admin-active">
                        <a href="#" class="nav-link">
                            <i class="fa-regular fa-file-lines"></i> Topic
                        </a>
                    </li>
                    <li class="nav-item transaction-btn">
                        <a href="#" class="nav-link">
                            <i class="fa-regular fa-money-bill-1"></i> Payment
                        </a>
                    </li>
                    <li class="nav-item schedule-btn">
                        <a href="#" class="nav-link">
                            <i class="fa-regular fa-calendar"></i> Schedule
                        </a>
                    </li>
                </ul>
            </div>
            <h5 class="logout-btn">
                <i class="fa-solid fa-right-from-bracket"></i> Logout
            </h5>
        </nav>
    </body>
</html>
