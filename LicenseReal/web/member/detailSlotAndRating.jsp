<%-- 
    Document   : detailSlotAndRating
    Created on : Oct 7, 2023, 9:09:59 AM
    Author     : Admin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .rating-member {
                display: inline-block;
                font-size: 24px;
                cursor: pointer;
            }

            .star {
                color: gray;
            }

            .star:hover {
                color: gold;
            }
            .rating-mentor {
                display: flex;
                align-items: center;
                font-size: 24px;
            }

            .stars-mentor {
                display: inline-block;
                color: gold;
            }

            #rating-value-mentor {
                margin-left: 10px;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div>
            <p>Số buổi còn lại là: ${requestScope.remaining}</p>
        </div>
        <div>
            <c:set var="times" value="${['7h - 9h', '9h - 11h', '13h - 15h', '15h - 17h']}" />
            <h1>Chi tiết lớp học</h1>
            <p>${requestScope.Schedule.getDay()}</p>
            <p>Giờ học: ${times[requestScope.Schedule.getTime()-1]}</p>
            <p>Giáo viên: ${requestScope.mentorAndUser.getUser().getName()}</p>
            <p>Email: ${requestScope.mentorAndUser.getUser().getEmail()}</p>
            <p>Avatar:</p> <img src="data:image;base64,${requestScope.mentorAndUser.getUser().getAvatar()}">
            <p>Phone: ${requestScope.mentorAndUser.getUser().getPhone()}</p>
        </div>

        <div>
            <h1>Rating</h1>
            <c:choose>
                <c:when test="${requestScope.ratingCheck == null}">
                    <form action="MainController" method="post">
                        <div class="rating-member">
                            <span class="star" data-rating="1">&#9733;</span>
                            <span class="star" data-rating="2">&#9733;</span>
                            <span class="star" data-rating="3">&#9733;</span>
                            <span class="star" data-rating="4">&#9733;</span>
                            <span class="star" data-rating="5">&#9733;</span>
                        </div>
                        <p>Rating: <span id="rating-value">0</span>/5</p
                        <p>${requestScope.test}</p>
                        <input type="hidden" name="ratingMember" id="rating-input" value="0">
                        <input type="hidden" name="scheduleId" value="${requestScope.scheduleID}">
                        <input type="text" name="description" >
                        <button type="submit" name="action" value="ratingOfMember">Rating</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <p>Giáo viên này bạn đã đánh giá</p>
                </c:otherwise>
            </c:choose>
            <div class="rating-mentor">
                <p> Đánh giá của giáo viên: </p>
                <div class="stars-mentor" id="rating-stars-mentor"></div>

                <p id="rating-value-mentor">0</p>
            </div>

        </div>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const stars = document.querySelectorAll(".star");
                const ratingValue = document.getElementById("rating-value");

                stars.forEach(function (star) {
                    star.addEventListener("click", function () {
                        const rating = parseInt(star.getAttribute("data-rating"));
                        ratingValue.textContent = rating;
                        document.getElementById("rating-input").value = rating;
                        resetStars();
                        highlightStars(rating);
                    });
                });

                function resetStars() {
                    stars.forEach(function (star) {
                        star.style.color = "gray";
                    });
                }

                function highlightStars(rating) {
                    for (let i = 0; i < rating; i++) {
                        stars[i].style.color = "gold";
                    }
                }
            });

        </script>
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

