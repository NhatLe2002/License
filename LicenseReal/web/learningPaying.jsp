<%-- 
    Document   : learningPaying
    Created on : Oct 22, 2023, 4:29:27 PM
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
        <h1>Gói thực hành với 4 buổi tập</h1>
        <form action="MainController" method="post">
          
            <label for="price">Gíá: 500,000 VNĐ</label>
            <input hidden type="number" id="price" name="price" value="500000">
            <br></br>
            <label   for="type">Loại hình: Học thực hành</label>
            <input hidden type="text" id="type" name="type" value="${type}">
            <br></br>
            <label for="cash_type">Hình thức thanh toán:</label>
            <select name="cash_type">
                <option value="cash">Tiền mặt</option>
                <option value="vnpay">VNPay</option>
            </select>

            <button name="action" value="payCash" type="submit">Tạo giao dịch</button>
        </form>
          
            
    </body>
</html>
