<%-- 
    Document   : forgotPassword
    Created on : Oct 7, 2023, 4:11:20 PM
    Author     : emcua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="POST" action="MainController">
            <input name="username" placeholder="Nhập tài khoản"></input>
            <button name="action" value="getOTP" type="submit">Xác nhận</button>
            ${message}
        </form>
    </body>
</html>
