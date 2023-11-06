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
        <title>Đăng ký học thực hành</title>

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


        <div  class="container mt-4">
            <div class="text-center">
                <h1 style="text-align: center">Đăng kí lịch học</h1>

                <form action="RegisScheduleByMemberServlet" method="post">
                    <div class="d-flex justify-content-center gap-3 flex-row align-items-center">
                        <label for="selectMondayOfWeek">Chọn ngày:</label>

                        <select  class="form-select" name="selectMondayOfWeek" id="selectMondayOfWeek" style="width: 30%">
                            <c:forEach items="${mondays}" var="monday">
                                <c:set var="sunday" value="${monday.plusDays(6)}" />
                                <option ${(monday eq requestScope.currentMonday)?"selected":""} value="${monday}">${monday} to ${sunday}</option>
                            </c:forEach>
                        </select>
                        <button type="submit"  class="btn btn-primary">Search</button>
                    </div>
                </form>
            </div>
        </div>


        <div class="container my-5 schedule-container">
            <c:set var="days" value="${['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']}" />
            <c:set var="times" value="${[1, 2, 3, 4]}" />

            <div id="div-KhoaHoc">
                <p  class="fw-bold">Số buổi còn lại của bạn là:  
                    <span id="remainingValue" class="fw-bold">${requestScope.remaining}</span>
                </p></br>
                <c:if test="${requestScope.remaining == '0'}">
                    <p>Bạn cần mua thêm khóa học để booking người hướng dẫn</p>
                    <a id="muaKhoaHoc" href="MainController?action=payment&type=regisLearn" class="mb-3"></a>
                </c:if>
            </div>

            <form action="MainController" method="post">
                <table border="1" class="table table-bordered border-primary">
                    <thead class="thead-light table-primary">
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
                                    <td>
                                        <c:forEach items="${requestScope.mentorScheduleNotTeache}" var="c">
                                            <c:if test="${requestScope.week[i] == c.getDay() && c.getTime() == time}">
                                                <c:if test="${requestScope.week[i] >= requestScope.currentDay}">
                                                    <div id="${c.getId()}" name="room">
                                                        <c:if test="${requestScope.remaining != '0'}">
                                                            <input type="checkbox" name="checkBoxName" value="${c.getId()}"  onclick="hideOtherCheckboxes(event, this)"></br>
                                                        </c:if>
                                                        <a href="MainController?action=detailBookingSlot&scheduleId=${c.getId()}">Chi tiết Booking</a
                                                    </div>
                                                </c:if>
                                            </c:if>
                                        </c:forEach>
                                        <c:set var="i" value="${i + 1}"/>
                                    </td>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <c:if test="${requestScope.remaining != '0'}">
                    <div class="d-flex justify-content-end">
                        <button type="submit" name="action" value="regisScheduleMemberBtn" class="btn btn-info">Đăng ký lịch học</button>
                    </div>
                </c:if>
            </form>
            <p></p>
        </div>

        <c:import url="../userFooter.jsp"/>


        <script>

            function hideOtherCheckboxes(event, checkbox) {
                var linkElement = document.getElementById('muaKhoaHoc')
                if (linkElement == null) {
                    var linkElement = document.createElement('a');
                    linkElement.setAttribute('id', 'linkElement');
                    linkElement.setAttribute('href', 'MainController?action=payment&type=regisLearn');
                    linkElement.innerHTML = 'Mua thêm khóa học';
                    var parentElement = document.getElementById('div-KhoaHoc');
                }
//                console.log(parentElement);
                // Lấy phần tử cha (td) của checkbox hiện tại
                var parentDiv = checkbox.parentNode;
                var parentTd = parentDiv.parentNode;
                // Lấy tất cả các checkbox trong cùng td
                var divInTd = parentTd.getElementsByTagName('div');
                // Duyệt qua tất cả các checkbox trong cùng td và ẩn chúng nếu chúng không phải là checkbox hiện tại
                //Tru so buoi con lai
                var remainingValueElement = document.getElementById('remainingValue');
                if (remainingValueElement) {
                    var currentRemainingValue = parseInt(remainingValueElement.textContent) || 0;

//                    if (currentRemainingValue === 0) {
//                        // Nếu remainingValue đã đạt 0, ẩn tất cả các checkbox chưa được click
//                        hideUncheckedCheckboxes();
//                    } else {
                    // Lấy giá trị hiện tại của checkbox (được lưu trữ trong thuộc tính data-clicked-count)
                    var clickedCount = parseInt(checkbox.getAttribute('data-clicked-count')) || 0;

                    // Cập nhật giá trị và hiển thị nó
                    if (clickedCount === 0) {
                        clickedCount = 1;
                    } else {
                        clickedCount = 0;
                    }

                    // Lưu giá trị mới vào thuộc tính data-clicked-count
                    checkbox.setAttribute('data-clicked-count', clickedCount);

                    // Tính toán giá trị mới dựa trên giá trị hiện tại và cập nhật giá trị hiển thị
                    if (remainingValueElement) {
                        var currentRemainingValue = parseInt(remainingValueElement.textContent) || 0;

                        if (clickedCount === 1) {
                            currentRemainingValue -= 1;
                            for (var i = 0; i < divInTd.length; i++) {
                                //ẩn các div còn lại nếu đã tích trong cùng td
                                if (divInTd[i].id !== event.target.value) {
//                                    console.log(event.target);
//                                    console.log(divInTd[i]);
                                    divInTd[i].setAttribute('check', false);
                                    divInTd[i].style.display = 'none'; // Ẩn checkbox khác
                                } else {
                                    divInTd[i].setAttribute('check', true);
//                        console.log(divInTd[i]);
                                }
                            }
                        } else {

                            currentRemainingValue += 1;
                            for (var i = 0; i < divInTd.length; i++) {
                                //ẩn các div còn lại nếu đã tích trong cùng td
                                if (divInTd[i].id !== event.target.value) {
//                                    console.log(event.target);
//                                    console.log(divInTd[i]);
                                    divInTd[i].setAttribute('check', true);
                                    divInTd[i].style.display = 'inline'; // Ẩn checkbox khác
                                } else {
                                    divInTd[i].setAttribute('check', true);
//                        console.log(divInTd[i]);
                                }
                            }
                        }
                        remainingValueElement.textContent = currentRemainingValue;


                    }
                    if (currentRemainingValue === 0) {
                        // Nếu remainingValue đã đạt 0, ẩn tất cả các checkbox chưa được click
                        hideUncheckedCheckboxes();
                        parentElement.appendChild(linkElement);
                    } else {
                        presentlyCheckboxes();
                        var existingLinkElement = document.getElementById('linkElement');
                        if (existingLinkElement) {
                            // Nếu thẻ <a> đã tồn tại, loại bỏ nó khỏi phần tử cha
                            parentElement.removeChild(existingLinkElement);
                        }
                    }

                }


            }
            function presentlyCheckboxes() {
                var checkFalse = document.querySelectorAll('div[name="room"][check="false"]');
                var divTags = document.querySelectorAll('div[name="room"]');
//                console.log(checkFalse);

                // Lặp qua danh sách divTags
                for (var i = 0; i < divTags.length; i++) {
                    var shouldHide = true;

                    // Lặp qua danh sách checkFalse để kiểm tra xem divTags[i] có trong danh sách này hay không
                    for (var j = 0; j < checkFalse.length; j++) {
                        if (divTags[i] === checkFalse[j]) {
                            shouldHide = false;
                            break; // Không cần kiểm tra tiếp, đã tìm thấy phần tử tương ứng
                        }
                    }

                    if (!shouldHide) {
                        divTags[i].style.display = 'none';
                    } else {
                        divTags[i].style.display = ''; // Hiển thị nếu không cần ẩn
                    }
                }
            }
            function hideUncheckedCheckboxes() {
                var divTags = document.querySelectorAll('div[name="room"]');

                for (var i = 0; i < divTags.length; i++) {
                    var div = divTags[i];
                    var checkbox = div.querySelector('input[type="checkbox"]');

                    if (checkbox && !checkbox.checked) {
                        // Ẩn div nếu checkbox không được tích hoặc nếu không có checkbox
                        div.style.display = 'none';
                    }
                }



//                // Lấy tất cả các checkbox chưa được click
//                var checkfalse = document.querySelectorAll('div[name="room"][check = false]');
//                var checkTrue = document.querySelectorAll('div[name="room"][check = true]');
//                var divTags = document.querySelectorAll('div[name="room"]');
////                // Ẩn tất cả các checkbox chưa được click
//                // Lặp qua danh sách divTags
//                for (var i = 0; i < divTags.length; i++) {
//                    var shouldHide = true;
//
//                    // Lặp qua danh sách checkTrue để kiểm tra xem divTags[i] có trong danh sách này hay không
//                    for (var j = 0; j < checkTrue.length; j++) {
//                        if (divTags[i] === checkTrue[j]) {
//                            shouldHide = false;
//                            break; // Không cần kiểm tra tiếp, đã tìm thấy phần tử tương ứng
//                        }
//                    }
//
//                    if (shouldHide) {
//                        divTags[i].style.display = 'none';
//                    }
//                }
            }
        </script>
    </body>
</html>
