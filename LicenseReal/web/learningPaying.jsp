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
        <script>
            function select3Sessions() {
                // Thay đổi tiêu đề
                document.getElementById('package-title').innerText = 'Gói thực hành với 3 buổi tập';

                // Thay đổi giá trị trong input hidden
                document.getElementById('type').value = '3regisLearn';

                // Thay đổi giá trị trong label
                document.getElementById('price-label').innerText = 'Gíá: 900,000 VNĐ';
                document.getElementById('price').value = 900000;
                document.getElementById('hidden-div').style.display = 'block';
            }

            function select5Sessions() {
                // Thay đổi tiêu đề
                document.getElementById('package-title').innerText = 'Gói thực hành với 5 buổi tập';

                // Thay đổi giá trị trong input hidden
                document.getElementById('type').value = '5regisLearn';

                // Thay đổi giá trị trong label
                document.getElementById('price-label').innerText = 'Gíá: 1,500,000 VNĐ';
                document.getElementById('price').value = 1500000;
                document.getElementById('hidden-div').style.display = 'block';
            }
        </script>



        <h1 id="package-title">Chọn gói thực hành</h1>
        <button type="button" onclick="select5Sessions()">Chọn gói học 5 buổi</button>
        <button type="button" onclick="select3Sessions()">Chọn gói học 3 buổi</button>
        <form action="MainController" method="post">
            <div id="hidden-div" style="display : none"> 
                <label id="price-label" for="price">Gíá: 900,000 VNĐ</label>
                <input hidden type="number" id="price" name="price" value="900000">
                <br></br>
                <label for="type">Loại hình: Học thực hành</label>
                <input hidden type="text" id="type" name="type" value="${type}">
                <br></br>
                <label for="cash_type">Hình thức thanh toán:</label>
                <select name="cash_type">
                    <option value="cash">Tiền mặt</option>
                    <option value="vnpay">VNPay</option>
                </select>
                <button name="action" value="payCash" type="submit">Tạo giao dịch</button>
            </div>


        </form>
        ${message}
    </body>

</html>
