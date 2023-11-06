<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thi thử trắc nghiệm</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="./assets/css/chooseTryTest.css"/>
        <link
            rel="icon"
            type="image/x-icon"
            href="https://cdn-icons-png.flaticon.com/512/6556/6556219.png"
            />
    </head>

    <body>
        <c:import url="userHeader.jsp"/>

        <!-- màn hình chọn thông tin thi thử -->
        <div class="choose-exam-screen no-select">
            <div class="container">
                <h1>Thi thử trắc nghiệm B2</h1>
                <form action="UserQuestionController" method="POST">
                    <div class="form-group">
                        <label for="fullname">Họ và tên:</label>
                        <input type="text" id="fullname" class="form-control" name="fullname" value="
                               <c:if test="${user != null}">
                                   ${user.getName().trim()}
                               </c:if>" required>
                    </div>
                    <div class="form-group">
                        <label for="license">Hạng xe thi:</label>
                        <input id="license" type="text" class="input-group-text" name="type" value="Ô tô hạng B2 - số sàn" disabled>
                    </div>
                    <div class="form-group">
                        <label for="exam">Chọn đề thi:</label>
                        <select id="exam" class="form-select" name="topic" required>
                            <option value="0">Chọn đề ngẫu nhiên</option>
                            <c:forEach var="T" items="${listTopic}">
                                <option value="${T.topicID}">${T.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary btn-start">Bắt đầu thi</button>
                </form>

            </div>
        </div>
    </body>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var fullnameInput = document.getElementById("fullname");
            var fullnameValue = "<c:if test='${user != null}'>${user.getName()}</c:if>";
            fullnameInput.value = fullnameValue.trim();
        });
    </script>

</html>