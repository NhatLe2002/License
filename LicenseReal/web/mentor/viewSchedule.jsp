<%-- 
    Document   : viewSchedule
    Created on : Oct 3, 2023, 9:19:27 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lịch dạy thực hành</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
              crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
              rel="stylesheet" />

        <style>
            .schedule-container .table th,
            .schedule-container .table td {
                text-align: center;
                vertical-align: middle;
            }

        </style>
    </head>
    <body>

        <c:import url="../userHeader.jsp"/>

        <div class="container mt-4">
            <div class="text-center">
                <h1 style="text-align: center"> Lịch dạy </h1>

                <form action="ViewScheduleServlet" method="post">
                    <div  class="d-flex justify-content-center gap-3 flex-row align-items-center">
                        <label for="selectMondayOfWeek">Chọn ngày:</label>

                        <select name="selectMondayOfWeek" class="form-select" id="selectMondayOfWeek" style="width: 30%">
                            <c:forEach items="${requestScope.mondays}" var="monday">
                                <c:set var="sunday" value="${monday.plusDays(6)}" />
                                <option ${(monday eq requestScope.currentMonday)?"selected":""} value="${monday}">${monday} to ${sunday}</option>
                            </c:forEach>
                        </select>
                        <button type="submit" class="btn btn-primary">Search</button>
                    </div>
                </form>
            </div>
        </div>

        <div  class="container my-5 schedule-container">
            <c:set var="days" value="${['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']}" />
            <c:set var="times" value="${[1, 2, 3, 4]}" />
            <table border="1" class="table table-bordered border-primary">
                <thead class="thead-light table-primary">
                    <tr>
                        <th>
                        </th>
                        <c:set var="i" value="0"/>
                        <c:forEach var="day" items="${days}" >
                            <th>
                                ${day}</br>
                                ${requestScope.week[i]}
                            </th>
                            <c:set var="i" value="${i + 1}"/>
                        </c:forEach>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${times}" var="time">
                        <tr class="table-warning">
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
                            <c:set var="check" value="false"></c:set>
                            <c:forEach var="day" items="${requestScope.week}">
                                <c:forEach items="${requestScope.scheduleOfMentor}" var="c">
                                    <c:if test="${requestScope.week[i] == c.getDay() && c.getTime() == time}">
                                        <c:set var="check" value="true"></c:set>
                                    </c:if>
                                </c:forEach>
                                <c:choose>
                                    <c:when test="${check == true}">
                                        <td>${requestScope.week[i]}</br>
                                            Chỗ này hiện lịch học giáo viên.
                                            Muốn hiện gì thì ghi ở đây vd: time,...
                                        </td>
                                    </c:when>
                                    <c:otherwise>
                                        <td></td>
                                    </c:otherwise>
                                </c:choose>
                                <c:set var="check" value="false"></c:set>
                                <c:set var="i" value="${i + 1}"/>
                            </c:forEach>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>

        </div>

        <c:import url="../userFooter.jsp"/>

    </body>
</html>
