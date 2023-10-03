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
            <c:set var="days" value="${['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']}" />
            <c:set var="times" value="${['7h-9h', '9h-11', '13h-15h', '15h-17']}" />
            <table border="1">
                <thead>
                    <tr>
                        <th>
                            <div>
                                <h6 >Week</h6>
                                <form action="ScheduleServlet" method="post">
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
                                    ${requestScope.week[0]}
                                </c:if>
                            </th>
                            <c:set var="i" value="${i + 1}"/>
                        </c:forEach>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${times}" var="time">
                        <tr>
                            <td>${time}</td>
                            
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>

            <p></p>


            <table>
                <tr>
                    <th></th>
                    <th>Thứ 2 </br>
                        Ngày 25/09
                    </th>
                    <th>Thứ 3 </br>
                        Ngày 26/09
                    </th>
                    <th>Thứ 4</br>
                        Ngày 27/09
                    </th>
                    <th>Thứ 5</br>
                        Ngày 28/09
                    </th>
                    <th>Thứ 6</br>
                        Ngày 29/09
                    </th>
                    <th>Thứ 7</br>
                        Ngày 30/09
                    </th>
                    <th>Chủ Nhật</br>
                        Ngày 01/10
                    </th>
                </tr>
                <tr>
                    <td>7h-9h</td>
                    <td>Dòng 1, Cột 2</td>
                    <td>Dòng 1, Cột 3</td>
                    <td>Dòng 1, Cột 4</td>
                    <td>Dòng 1, Cột 5</td>
                    <td>Dòng 1, Cột 6</td>
                    <td>Dòng 1, Cột 7</td>
                    <td>Dòng 1, Cột 8</td>
                </tr>
                <tr>
                    <td>9h-11h</td>
                    <td>Dòng 2, Cột 2</td>
                    <td>Dòng 2, Cột 3</td>
                    <td>Dòng 2, Cột 4</td>
                    <td>Dòng 2, Cột 5</td>
                    <td>Dòng 2, Cột 6</td>
                    <td>Dòng 2, Cột 7</td>
                    <td>Dòng 2, Cột 8</td>
                </tr>
                <tr>
                    <td>13h-15h</td>
                    <td>Dòng 3, Cột 2</td>
                    <td>Dòng 3, Cột 3</td>
                    <td>Dòng 3, Cột 4</td>
                    <td>Dòng 3, Cột 5</td>
                    <td>Dòng 3, Cột 6</td>
                    <td>Dòng 3, Cột 7</td>
                    <td>Dòng 3, Cột 8</td>
                </tr>
                <tr>
                    <td>15h-17h</td>
                    <td>Dòng 4, Cột 2</td>
                    <td>Dòng 4, Cột 3</td>
                    <td>Dòng 4, Cột 4</td>
                    <td>Dòng 4, Cột 5</td>
                    <td>Dòng 4, Cột 6</td>
                    <td>Dòng 4, Cột 7</td>
                    <td>Dòng 4, Cột 8</td>
                </tr>
            </table>
        </div>
    </body>
</html>
