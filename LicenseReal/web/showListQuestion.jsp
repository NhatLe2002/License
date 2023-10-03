<%-- 
    Document   : showListQuestion
    Created on : 02-10-2023, 19:09:34
    Author     : HP Pro
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show List Question Page</title>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              />
    </head>
    <body>
        <h1>Show List Question Page</h1>
        <a href="addQuestion.jsp">Back to Insert Question Page</a>
        <table id="myTable"> 
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Question</th>
                    <th>Image</th>
                    <th>Question Type</th>
                    <th>Answer Option</th>
                    <th>Answer</th>
                    <th>Correct</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="Q" items="${listQ}" varStatus="counter">
                    <c:set var="A" value="${listA[counter.index]}"></c:set>
                        <tr>
                            <td>${counter.count}</td>
                        <td>${Q.question}</td>
                        <td>
                            <c:if test="${not empty Q.image}">
                                <img src="data:image;base64,${Q.image}" style="max-height: 5rem; max-width: 10rem"/>
                            </c:if>
                        </td>
                        <td>${Q.questionType}</td>
                        <td>${A.options}</td>
                        <td>${A.answer}</td>
                        <td>${A.isCorrect}</td>
                        <td>
                            <a href="UpdateQuestionController?id=${Q.id}"><i class="fa-solid fa-pen fa-bounce" style="color: #197307;"></i></a>
                            |
                            <a href="#"><i class="fa-solid fa-trash fa-bounce" style="color: #fa0000;"></i></i></a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#myTable').DataTable();
        });
    </script>
</html>
