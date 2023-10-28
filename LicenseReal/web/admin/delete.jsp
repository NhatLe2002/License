<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Account</title>
</head>
<body>
    <h1>Delete Account</h1>
    <p>Are you sure you want to delete this account?</p>
    <form action="delete" method="post">
        <input type="hidden" name="id" value="${account.id}">
        <input type="submit" value="Delete">
    </form>
    <a href="list.jsp">Cancel</a>
</body>
</html>
