<%-- 
    Document   : regisScheduleOfMember
    Created on : Oct 3, 2023, 2:21:25 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <h1 style="text-align: center">
                Đăng kí lịch dạy
                <form action="RegisScheduleByMemberServlet" method="post">
                    <select name="selectMondayOfWeek">
                        <c:forEach items="${mondays}" var="monday">
                            <c:set var="sunday" value="${monday.plusDays(6)}" />
                            <option ${(monday eq requestScope.currentMonday)?"selected":""} value="${monday}">${monday} to ${sunday}</option>
                        </c:forEach>
                    </select>
                    <button type="submit">Search</button>
                </form>
            </h1>
        </div>
        <div>
            <c:set var="days" value="${['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']}" />
            <c:set var="times" value="${[1, 2, 3, 4]}" />
            <form action="MainController" method="post">


                <table border="1">
                    <thead>
                        <tr>
                            <th>
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
                                <c:set var="check" value="false"></c:set>
                                <c:forEach var="day" items="${requestScope.week}">
                                    <c:forEach items="${requestScope.mentorScheduleNotTeache}" var="c">
                                        <c:if test="${requestScope.week[i] == c.getDay() && c.getTime() == time}">
                                            <c:set var="check" value="true"></c:set>
                                                <td>
                                                    <input type="checkbox" name="checkBoxName" value="${time}/${requestScope.week[i]}/${c.getMentorID()}/${c.getId()}">--></br>
                                                Đây là lịch tất cả mentor đã đăng ký dạy</br>
                                                Và lịch mà member chưa dạy</br>
                                                Và member chưa học</br>
                                                Member sẽ được đăng kí lịch tại đây
                                              
                                            </td>
                                        </c:if>
                                    </c:forEach>
                                    <c:choose>
                                        <c:when test="${check == true}">

                                        </c:when>
                                        <c:otherwise>
                                            <td>
        <!--                                        <input type="checkbox" name="checkBoxName" value="${time}/${requestScope.week[i]}">-->
                                            </td>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:set var="check" value="false"></c:set>
                                    <c:set var="i" value="${i + 1}"/>


                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <input type="submit" name="action" value="regisScheduleMemberBtn">
            </form>
            <p></p>
        </div>
    </body>
</html>
