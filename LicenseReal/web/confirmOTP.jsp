<%-- 
    Document   : confirmOTP
    Created on : Oct 7, 2023, 4:11:57 PM
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
        <h1>Enter the code we’ve emailed to</h1>
        <h2>${email}</h2>
        <form method="POST" action="MainController">
            <input name="confirmOTP" placeholder="Nhập OTP"></input>
            <button name="action" value="confirmOTP" type="submit">Xác nhận</button>
            ${message}
        </form>
    </body>
</html>
