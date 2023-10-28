<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Accounts</title>
</head>
<body>
    <h1>List of Accounts</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Action</th>
        </tr>
        <!-- Loop through the list of accounts and display them -->
        <c:forEach var="account" items="${accountList}">
            <tr>
                <td>${account.id}</td>
                <td>${account.username}</td>
                <td>
                    <a href="edit.jsp?id=${account.id}">Edit</a>
                    <a href="delete.jsp?id=${account.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="create.jsp">Create Account</a>
</body>
</html>
