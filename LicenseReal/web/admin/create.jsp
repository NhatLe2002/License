<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Account</title>
</head>
<body>
    <h1>Create Account</h1>
    <form action="create" method="post">
        Username: <input type="text" name="username"><br>
        Password: <input type="password" name="password"><br>
        <input type="submit" value="Create">
    </form>
    <a href="list.jsp">Back to List</a>
</body>
</html>
