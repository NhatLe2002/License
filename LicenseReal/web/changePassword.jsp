<%-- 
    Document   : changePassword
    Created on : Oct 7, 2023, 4:12:09 PM
    Author     : emcua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="MainController" method ="POST">
            <div class="user-details">           
                <div class="input-box">
                    <span class="details">Mật khẩu</span>
                    <input name="password" type="password" placeholder="Vui lòng nhập mật khẩu" required>
                </div>

                <div class="input-box">
                    <span class="details">Xác nhận mật khẩu</span>
                    <input name="confirmPassword" type="password" placeholder="Xác nhận lại mật khẩu" required>
                </div>
                <button name="action" value="changePassword" type="submit">Xác nhận</button>
                ${message}
            </div>
            <form/>
    </body>
</html>
