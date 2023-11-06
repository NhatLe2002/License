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
            <title>Chi tiết buổi học</title>
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

                .booking-detail {
                    margin: 80px auto;
                    max-width: 1024px;
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    gap: 2rem;
                }

                .booking-detail p {
                    margin-bottom: 0px;
                }

                .booking-detail .profile-mentor {
                    width: 50%;
                }

                .booking-detail .detail_class {
                    width: 40%
                }

                .booking-detail .box-container {
                    padding: 30px;
                    border-radius: 15px;
                    box-shadow: rgba(3, 102, 214, 0.3) 0px 0px 0px 3px;
                    display: flex;
                    flex-direction: column;
                    gap: 2rem;
                }

                .booking-detail .box-container .box-section {
                    padding: 15px;
                    border-radius: 10px;
                    box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
                }

                .booking-detail .profile-mentor .img-avatar {
                    display: flex;
                    justify-content: center;
                }

                .booking-detail .profile-mentor .img-avatar img {
                    width: 150px;
                    height: 150px;
                    border-radius: 50%;
                }

                .booking-detail .profile-mentor .info-mentor,
                .date-learn
                {
                    display: flex;
                    flex-direction: row;
                    justify-content: space-around;
                }

                .booking-detail .detail_class .quantity-lesson {
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                }

                .booking-detail .detail_class h5 {
                    margin-bottom: 0px;
                }

                .booking-detail .detail_class .quantity-lesson .quantity {
                    margin-right: 10px;
                    font-size: 30px;
                    color: red;
                }

                /*button*/
                .buy-now {
                    position: relative;
                    transition: all 0.3s ease-in-out;
                    box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
                    padding-block: 0.5rem;
                    padding-inline: 1.25rem;
                    background-color: rgb(0 107 179);
                    border-radius: 9999px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    color: #ffff;
                    gap: 10px;
                    font-weight: bold;
                    border: 3px solid #ffffff4d;
                    outline: none;
                    overflow: hidden;
                    font-size: 15px;
                }

                .buy-now .icon {
                    width: 24px;
                    height: 24px;
                    transition: all 0.3s ease-in-out;
                }

                .buy-now:hover {
                    transform: scale(1.05);
                    border-color: #fff9;
                }

                .buy-now:hover .icon {
                    transform: translate(4px);
                }

                .buy-now:hover::before {
                    animation: shine 1.5s ease-out infinite;
                }

                .buy-now::before {
                    content: "";
                    position: absolute;
                    width: 100px;
                    height: 100%;
                    background-image: linear-gradient(120deg,
                        rgba(255, 255, 255, 0) 30%,
                        rgba(255, 255, 255, 0.8),
                        rgba(255, 255, 255, 0) 70%);
                    top: 0;
                    left: -100px;
                    opacity: 0.6;
                }

                @keyframes shine {
                    0% {
                        left: -100px;
                    }

                    60% {
                        left: 100%;
                    }

                    to {
                        left: 100%;
                    }
                }


                .rating-form {
                    text-align: center;
                    margin: 20px;
                }

                .rating-button {
                    background-color: #007bff;
                    color: #fff;
                    border: none;
                    border-radius: 5px;
                    padding: 10px 20px;
                    cursor: pointer;
                }

                .description-input {
                    width: 100%;
                    padding: 10px;
                    margin: 10px 0;
                    border: 1px solid #ccc;
                    border-radius: 5px;
                }
            </style>
    </head>
    <body>
        <c:import url="../userHeader.jsp"/>


        <div class="booking-detail">

            <a href="/LicenseReal/MainController?action=regisScheduleByMember" style="text-decoration: none">
                <button class="btn btn-secondary">
                    <svg style="width: 10px; height: 10px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"><path d="M8.83 6a30.23 30.23 0 0 0-5.62 5.406A.949.949 0 0 0 3 12m5.83 6a30.233 30.233 0 0 1-5.62-5.406A.949.949 0 0 1 3 12m0 0h18"></path></svg> 
                    Quay về trang trước
                </button>
            </a>

            <h2 class="text-center">Chi tiết lớp học</h2>

            <c:set var="times" value="${['7h - 9h', '9h - 11h', '13h - 15h', '15h - 17h']}" />

            <div class="d-flex flex-row gap-2 justify-content-between">
                <div class="box-container profile-mentor">
                    <div class="img-avatar">
                        <img src="data:image;base64,${requestScope.mentorAndUser.getUser().getAvatar()}" alt="avatar">
                    </div>

                    <div class="box-section info-mentor">
                        <div class="label">
                            <p class="title fw-bold mb-3">Giáo viên: </p>
                            <p class="title fw-bold mb-3">Email: </p>
                            <p class="title fw-bold">Số điện thoại: </p>
                        </div>

                        <div class="label">
                            <p class="value mb-3">${requestScope.mentorAndUser.getUser().getName()}</p>
                            <p class="value mb-3">${requestScope.mentorAndUser.getUser().getEmail()}</p>
                            <p class="value">${requestScope.mentorAndUser.getUser().getPhone()}</p>
                        </div>

                    </div>

                    <div class="box-section about-mentor">
                        <h4 class="title">Về giáo viên: </h4>
                        <p class="about px-3">Tôi là một người có kinh nghiệm dạy lái xe, luôn cam kết hướng dẫn học viên cách
                            lái xe an toàn và tự tin trên đường.
                        </p>
                    </div>
                </div>

                <div class="box-container detail_class d-flex justify-content-center">
                    <c:if test="${requestScope.remaining == '0'}">
                        <div class="box-section">   

                            <p class="text-danger fst-italic">Bạn cần mua thêm khóa học để booking người hướng dẫn</p>
                            <div class="d-flex justify-content-center">
                                <button class="button buy-now">
                                    <a id="muaKhoaHoc" href="MainController?action=paymentPage" style="color:white">Mua khóa học!</a> 
                                    <svg class="icon" viewBox="0 0 24 24" fill="currentColor">
                                        <path fill-rule="evenodd"
                                              d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25zm4.28 10.28a.75.75 0 000-1.06l-3-3a.75.75 0 10-1.06 1.06l1.72 1.72H8.25a.75.75 0 000 1.5h5.69l-1.72 1.72a.75.75 0 101.06 1.06l3-3z"
                                              clip-rule="evenodd"></path>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </c:if>

                    <div class="box-section date-learn">
                        <div class="label">
                            <p class="title fw-bold mb-3">Ngày: </p>
                            <p class="title fw-bold">Giờ học </p>
                        </div>

                        <div class="label">
                            <p class="value mb-3">${requestScope.Schedule.getDay()}</p>
                            <p class="value">${times[requestScope.Schedule.getTime()-1]}</p>
                        </div>
                    </div>

                    <div class="box-section feedback-mentor d-flex justify-content-center flex-column">
                        <h4>Rating</h4>
                        <c:choose>
                            <c:when test="${requestScope.ratingCheck == null}">
                                <form action="MainController" method="post" class="rating-form">
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
                                            <input type="text" name="description" placeholder="Nhập feedback ở đây" class="description-input">
                                                <button type="submit" name="action" value="ratingOfMember" class="rating-button">Rating</button>
                                                </form>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach items="ratingList" var="c">
                                                    <div class="box-section feedback-mentor d-flex flex-column justify-content-center">
                                                        <div class="rating-mentor">
                                                            <h5 class="title mb-2">Đánh giá của giáo viên: </h5>
                                                            <div class="stars-mentor" id="rating-stars-mentor"></div>

                                                            <p id="rating-value-mentor">0</p>
                                                        </div>

                                                        <p class="messages px-3 mt-2 text-center">Có tiến triển, cần được phát huy</p>

                                                    </div>


                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>

                                        </div>

                                        <div class="d-flex justify-content-end">
                                            <c:if test="${requestScope.remaining != '0'}">
                                                <form action="MainController" method="post">
                                                    <input type="hidden" name="checkBoxName" value="${requestScope.Schedule.getId()}">
                                                        <button class="btn btn-outline-success" type="submit" name="action" value="bookingSlot">Đặt slot</button>
                                                </form>
                                            </c:if>
                                        </div>
                                        </div>
                                        </div>

                                        </div>



                                        <c:import url="../userFooter.jsp"/>   
                                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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

                                        <%--

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

                                        --%>

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

