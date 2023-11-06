<%-- 
    Document   : testingPaying
    Created on : Oct 22, 2023, 4:29:37 PM
    Author     : emcua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh toán nộp học phí</title>
    </head>
    <body>
        <h1>Gói đăng ký nộp hồ sơ thi lái xe</h1>
        <form action="MainController" method="post">

            <label for="price">Gíá: 10,000,000 VNĐ</label>
            <input hidden type="number" id="price" name="price" value="10000000">
            <br></br>
            <label   for="type">Loại hình: Phí nộp hồ sơ</label>
            <input hidden type="text" id="type" name="type" value="${type}">
            <c:choose>
                <c:when test="${sessionScope.profile != null}">
                    <p>Bạn hãy chọn phương thức thanh toán</p>
                </c:when>
                <c:otherwise>
                    <div>
                        <a href="MainController?action=adddriver&id=${load_profile.getId()}">Nộp hồ sơ thi</a> 
                    </div>
                </c:otherwise>
            </c:choose>
            <br></br>
            <label for="cash_type">Hình thức thanh toán:</label>
            <select name="cash_type">
                <option value="cash">Tiền mặt</option>
                <option value="vnpay">VNPay</option>
            </select>
            <h5 class="mt-3">Chọn ngôn ngữ thanh toán</h5>
            <div class="px-3">
                <div class="radio-buttons-container">
                    <div class="radio-button">
                        <input  class="radio-button__input"
                                type="radio" id="vietnamese-option" Checked="True" name="language" value="vn">
                        <label for="vietnamese-option" class="radio-button__label">
                            <span class="radio-button__custom"></span>
                            Tiếng Việt
                        </label>


                        <input class="radio-button__input"
                               type="radio" id="english-option" name="language" value="en">
                        <label for="english-option" class="radio-button__label">
                            <span class="radio-button__custom"></span>
                            Tiếng Anh
                        </label>
                    </div>
                </div>
            </div>
            <button name="action" value="payCash" type="submit">Tạo giao dịch</button>
        </form>
        ${message}
    </body>
</html>
