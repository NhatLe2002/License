<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Account</title>
</head>
<body>
    <h1>Edit Account</h1>
    <form action="edit" method="post">
        <input type="hidden" name="id" value="${account.id}">
        Username: <input type="text" name="username" value="${account.username}"><br>
        Password: <input type="password" name="password" value="${account.password}"><br>
        <input type="submit" value="Save">
    </form>
    <a href="list.jsp">Back to List</a>
</body>
</html>
