<%-- 
    Document   : bookingDetail
    Created on : Oct 24, 2023, 4:48:14 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking</title>
        <style>
            
            .rating-mentor {
                display: flex;
                align-items: center;
                font-size: 24px;
            }

            .stars-mentor {
                display: inline-block;
                color: gold;
            }
        </style>
    </head>
    <body>
        <div>
            <c:set var="times" value="${['7h - 9h', '9h - 11h', '13h - 15h', '15h - 17h']}" />
            <h1>Chi tiết lớp học</h1>
            <p>${requestScope.Schedule.getDay()}</p>
            <p>Giờ học: ${times[requestScope.Schedule.getTime()-1]}</p>
            <p>Giáo viên: ${requestScope.mentorAndUser.getUser().getName()}</p>
            <p>Email: ${requestScope.mentorAndUser.getUser().getEmail()}</p>
            <p>Avatar: ${requestScope.mentorAndUser.getUser().getAvatar()}</p>
            <p>Phone: ${requestScope.mentorAndUser.getUser().getPhone()}</p>
        </div>
         <div class="rating-mentor">
                <p> Đánh giá của giáo viên: </p>
                <div class="stars-mentor" id="rating-stars-mentor"></div>

                <p id="rating-value-mentor">0</p>
         </div>
        
        <div>
            <form action="MainController" method="post">
                <input type="hidden" name="checkBoxName" value="${requestScope.Schedule.getId()}">
                <input type="submit" name="action" value="bookingSlot">
            </form>
        </div>
        
        
        
         <script>
            document.addEventListener("DOMContentLoaded", function () {
                const ratingStars = document.getElementById("rating-stars-mentor");
                const ratingValue = document.getElementById("rating-value-mentor");

                // Điểm số rating được truyền vào (thay thế số 3 bằng điểm số thực tế)
                const rating = ${requestScope.ratingMentor};

                // Hiển thị số rating
                ratingValue.textContent = rating.toFixed(2);
                ;

                // Hiển thị số sao tương ứng
                displayRatingStars(rating);

                function displayRatingStars(rating) {
                    for (let i = 1; i <= 5; i++) {
                        const star = document.createElement("span");
                        star.textContent = i <= rating ? "★" : "☆";
                        ratingStars.appendChild(star);
                    }
                }
            });

        </script>
    </body>
</html>
