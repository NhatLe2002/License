<%-- 
    Document   : regisScheduleOfMentor
    Created on : Oct 1, 2023, 6:39:27 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <style>
        table {

            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 10px;
            text-align: center;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <h1 style="text-align: center">
                Đăng kí lịch dạy
            </h1>
        </div>

        <div>
            <c:set var="days" value="${['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']}" />
            <c:set var="times" value="${[1, 2, 3, 4]}" />
            <table border="1">
                <thead>
                    <tr>
                        <th>
                            <div>
                                <h6 >Week</h6>
                                <form action="RegistScheduleServlet" method="post">
                                    <select name="selectMondayOfWeek">
                                        <c:forEach items="${mondays}" var="monday">
                                            <c:set var="sunday" value="${monday.plusDays(6)}" />
                                            <option ${(monday eq requestScope.currentMonday)?"selected":""} value="${monday}">${monday} to ${sunday}</option>
                                        </c:forEach>
                                    </select>
                                    <button type="submit">Search</button>
                                </form>

                            </div>
                        </th>
                        <c:set var="i" value="0"/>
                        <c:forEach var="day" items="${days}" varStatus="step">
                            <th>
                                ${day}</br>
                                <c:if test="${step.index == i}">
                                    ${requestScope.week[i]}
                                </c:if>
                            </th>
                            <c:set var="i" value="${i + 1}"/>
                        </c:forEach>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${times}" var="time">
                        <tr>
                            <td>
                                <c:if test="${time == 1}">
                                    7h-9h
                                </c:if>
                                <c:if test="${time == 2}">
                                    9h-11h
                                </c:if>
                                <c:if test="${time == 3}">
                                    13h-15h
                                </c:if>
                                <c:if test="${time == 4}">
                                    15h-17h
                                </c:if>
                            </td>
                            <c:set var="i" value="0"/>

                            <c:forEach var="day" items="${days}" varStatus="step">
                                <c:forEach items="${requestScope.scheduleOfMentor}" var="c">
                                    <c:choose>
                                        <c:when test="${requestScope.week[i] == c.getDay()}">
                                            <c:choose>
                                                <c:when test="${ c.getTime() == time}">
                                                    <td>Chỗ này là lịch dạy đã được đăng kí nên không được đăng kí nữa</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td></td>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:otherwise>
                                            <td>
                                            </td>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:set var="i" value="${i + 1}"/>
                            </c:forEach>


                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <p></p>
        </div>

    </form>

</body>
</html>
