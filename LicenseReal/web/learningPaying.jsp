<%-- 
    Document   : learningPaying
    Created on : Oct 22, 2023, 4:29:27 PM
    Author     : emcua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />

        <style>
            /* màn hình chọn đăng kí buổi thực hành */
            .register-mentor-page .container {
                margin: 0 auto;
                max-width: 1024px;
            }

            .register-mentor-page .card {
                background: #f5f5f5;
                position: relative;
                border: 2px solid #c3c6ce;
                transition: 0.5s ease-out;
                overflow: visible;
                cursor: pointer;
            }

            .register-mentor-page .card p {
                margin-bottom: 0px;
            }

            .register-mentor-page .card .card-img-top {
                border-radius: 4px;
            }

            .register-mentor-page .card .card-button {
                transform: translate(-50%, 125%);
                width: 60%;
                border-radius: 1rem;
                border: none;
                background-color: #008bf8;
                color: #fff;
                font-size: 10px;
                padding: .5rem 1rem;
                position: absolute;
                left: 50%;
                bottom: 0;
                opacity: 0;
                transition: 0.3s ease-out;
            }

            .register-mentor-page .card:hover {
                border-color: #008bf8;
                box-shadow: 0 4px 18px 0 rgba(0, 0, 0, 0.25);
                border-width: 2px;
            }

            .register-mentor-page .card:hover .card-button {
                transform: translate(-50%, 50%);
                opacity: 1;
            }

            .register-mentor-page .card-text {
                font-size: 13px;
            }

            .register-mentor-page .price {
                font-weight: bold;
                margin-top: 10px;
            }

            .register-mentor-page .small-ratings i {
                color: #cecece;
            }

            .register-mentor-page .rating-color {
                color: #fbc634 !important;
            }


            /* màn hình payment  */
            .payment {
                width: 100%;
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
                flex-direction: row;
                position: relative
            }

            .payment .payment_left {
                position: relative;
                width: 467px;
                height: 100vh;
                padding: 50px 0;
                padding-right: 20px;
            }

            .payment .payment_left .back_button {
                position: absolute;
                display: flex;
                align-items: center;
                transform: translateX(-20px);
            }

            .payment .payment_left .back_button img {
                width: 25px;
                height: 25px;
                margin: 0 5px;
                border-radius: 15px;
                opacity: 1;
                transition: 0.3s;
            }

            .payment .payment_left .back_button .text {
                opacity: 0;
                transition: 0.3s;
                transform: translateX(-25px);
                background-color: white;
                padding: 5px 0;
            }

            .payment .payment_left .back_button svg {
                transition: 0.3s;
            }

            .payment .payment_left .back_button:hover {
                cursor: pointer;
            }

            .payment .payment_left .back_button:hover img {
                opacity: 0;
                transition: 0.3s;
            }

            .payment .payment_left .back_button:hover .text {
                opacity: 1;
                transition: 0.3s;
                transform: translateX(-30px);
            }

            .payment .payment_left .back_button:hover svg {
                transition: 0.3s;
                transform: translateX(-2px);
                fill: black;
            }

            .payment .payment_left .information {
                width: 100%;
            }

            .payment .payment_left .information .name {
                color: rgba(26, 26, 26, 0.6);
                font-weight: bold;
                margin-top: 56px;
                font-size: 25px;
            }

            .payment .payment_left .information .price {
                display: flex;
                align-items: center;
                font-size: 30px;
                font-weight: 600;
            }

            .payment .payment_left .information .price .type {
                width: 30px;
                color: rgba(26, 26, 26, 0.6);
                font-size: 15px;
                font-weight: 600;
                margin: 0 10px;
            }

            .payment .payment_left .apprentice {
                width: 90%;
                margin: 20px 0;
            }

            .payment .payment_left .apprentice .billed {
                font-size: 12px;
                color: rgba(0, 0, 0, 0.4);
            }

            .payment .payment_left .tax {
                color: rgba(0, 0, 0, 0.3);
                font-size: 14px;
            }

            .payment .payment_left .flex {
                display: flex;
                width: 100%;
                justify-content: space-between;
                align-items: center;
                font-weight: 500;
            }

            .payment .payment_left .line {
                width: 90%;
                border: 1px solid rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                margin-bottom: 20px;
            }

            .payment .payment_right {
                width: 467px;
                padding: 106px 0;
                padding-left: 60px;
                box-shadow: -2px -5px 3px 0 rgba(0, 0, 0, 0.1);
                position: relative;
            }

            .payment .payment_right .title {
                font-size: 20px;
                font-weight: 500;
            }

            .payment .payment_right .email {
                display: flex;
                padding: 10px 20px;
                border: 1px solid rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                margin: 20px 0;
                background-color: #f7f7f7;
                justify-content: space-between;
                box-shadow: 0 0 3px 0 rgba(0, 0, 0, 0.1);
                color: rgba(0, 0, 0, 0.5);
            }

            .payment .payment_right .email .left {
                font-weight: 500;
            }

            .payment .payment_right .email .right {
                margin-right: 20px;
            }

            .payment .payment_right .input .input_title {
                color: rgba(0, 0, 0, 0.5);
                font-weight: 500;
                margin: 10px 0;
            }

            .payment .payment_right .input .input_feild {
                width: 100%;
                padding: 5px 20px;
                border-radius: 10px;
                border: 1px solid rgba(0, 0, 0, 0.1);
                box-shadow: 0 0 3px 0 rgba(0, 0, 0, 0.1);
            }

            .payment .payment_right .info-vnpay {
                width: 100%;
                border: 1px solid rgba(0, 0, 0, 0.1);
                box-shadow: 0 0 3px 0 rgba(0, 0, 0, 0.1);
                border-radius: 15px;
                margin-top: 20px;
                overflow: hidden;
                padding: 7px 20px;
            }

            .payment .payment_right .info-vnpay .radio-buttons-container {
                display: flex;
                align-items: center;
                gap: 24px;
            }

            .payment .payment_right .info-vnpay .radio-button {
                display: inline-block;
                position: relative;
                cursor: pointer;
            }

            .payment .payment_right .info-vnpay .radio-button__input {
                position: absolute;
                opacity: 0;
                width: 0;
                height: 0;
            }

            .payment .payment_right .info-vnpay .radio-button__label {
                display: inline-block;
                padding-left: 30px;
                margin-bottom: 10px;
                position: relative;
                font-size: 16px;
                color: black;
                cursor: pointer;
                transition: all 0.3s cubic-bezier(0.23, 1, 0.320, 1);
            }

            .payment .payment_right .info-vnpay .radio-button__custom {
                position: absolute;
                top: 50%;
                left: 0;
                transform: translateY(-50%);
                width: 20px;
                height: 20px;
                border-radius: 50%;
                border: 2px solid #555;
                transition: all 0.3s cubic-bezier(0.23, 1, 0.320, 1);
            }

            .payment .payment_right .info-vnpay .radio-button__input:checked+.radio-button__label .radio-button__custom {
                transform: translateY(-50%) scale(0.9);
                border: 5px solid #4c8bf5;
                color: #4c8bf5;
            }

            .payment .payment_right .info-vnpay .radio-button__input:checked+.radio-button__label {
                color: #4c8bf5;
            }

            .payment .payment_right .info-vnpay .radio-button__label:hover .radio-button__custom {
                transform: translateY(-50%) scale(1.2);
                border-color: #4c8bf5;
                box-shadow: 0 0 10px #4c8bf580;
            }

            .payment .payment_right .form-select,
            .payment .payment_right .form-select option,
            .payment .payment_right .info-vnpay .form-check-input {
                cursor: pointer;
            }

            .payment .payment_right .btn-checkout {
                position: absolute;
                right: 0;
            }

            .btn-close-payment {
                position: absolute;
                top: 2px;
                right: 2px;
            }
        </style>
        <style>
            /* CSS for the toast */
            #toast {
                visibility: hidden;
                max-width: 200px;
                background-color: #333;
                color: #fff;
                text-align: center;
                border-radius: 5px;
                padding: 16px;
                position: fixed;
                z-index: 1;
                bottom: 30px;
                left: 50%;
                transform: translateX(-50%);
            }

            #toast.show {
                visibility: visible;
                -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
                animation: fadein 0.5s, fadeout 0.5s 2.5s;
            }

            @-webkit-keyframes fadein {
                from {bottom: 0; opacity: 0;}
                to {bottom: 30px; opacity: 1;}
            }

            @keyframes fadein {
                from {bottom: 0; opacity: 0;}
                to {bottom: 30px; opacity: 1;}
            }

            @-webkit-keyframes fadeout {
                from {bottom: 30px; opacity: 1;}
                to {bottom: 0; opacity: 0;}
            }

            @keyframes fadeout {
                from {bottom: 30px; opacity: 1;}
                to {bottom: 0; opacity: 0;}
            }
        </style>
    </head>
    <body>
        <c:import url="userHeader.jsp"/>

        <div class="register-mentor-page my-5">
            <div class="container mx-auto d-flex align-items-center gap-5 justify-content-around flex-wrap">
                <h1 >Chọn gói thanh toán</h1>
                <a href="MainController?action=adddriver&id=${sessionScope.memberID}" style="color: red; text-decoration: underline">  
                        ${message}
                </a> 

                <div class="card" style="width: 900px;">
                    <div class="card-detail d-flex flex-row">
                        <div class="d-flex justify-content-between align-items-center ">
                            <img class="card-img-top"
                                 src="https://bizweb.dktcdn.net/100/415/690/files/nguyen-tac-lai-xe-o-to-1.jpg?v=1676950679832"
                                 alt="Card image cap">
                        </div>
                        <div class="card-body">
                            <h4>
                                Khóa học 3 buổi tập

                            </h4>

                            <p class="card-text">
                                Chúng tôi cung cấp sự hướng dẫn chuyên nghiệp, cả phần lý thuyết và thực
                                hành, trên các loại xe thực tế. Với giảng viên kinh nghiệm và sân trường lái hiện đại,
                                khóa
                                học giúp bạn xây dựng kỹ năng lái xe và tuân thủ luật lệ giao thông.
                            </p>

                            <div class="small-ratings">
                                <i class="fa fa-star rating-color"></i>
                                <i class="fa fa-star rating-color"></i>
                                <i class="fa fa-star rating-color"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                        </div>

                        <div class="price p-2">
                            <h5>900.000VNĐ</h5>
                        </div>
                    </div>

                    <button class="card-button" data-bs-toggle="modal" data-bs-target="#modalRegisterSubject" type="button" onclick="select3Sessions()">Đăng ký
                        ngay</button>
                </div>

                <div class="card" style="width: 900px;">
                    <div class="card-detail d-flex flex-row">
                        <div class="d-flex justify-content-between align-items-center ">
                            <img class="card-img-top"
                                 src="https://bizweb.dktcdn.net/100/415/690/files/nguyen-tac-lai-xe-o-to-1.jpg?v=1676950679832"
                                 alt="Card image cap">
                        </div>
                        <div class="card-body">
                            <h4>
                                Khóa học 5 buổi tập
                            </h4>

                            <p class="card-text">
                                Chúng tôi cung cấp sự hướng dẫn chuyên nghiệp, cả phần lý thuyết và thực
                                hành, trên các loại xe thực tế. Với giảng viên kinh nghiệm và sân trường lái hiện đại,
                                khóa
                                học giúp bạn xây dựng kỹ năng lái xe và tuân thủ luật lệ giao thông.
                            </p>

                            <div class="small-ratings">
                                <i class="fa fa-star rating-color"></i>
                                <i class="fa fa-star rating-color"></i>
                                <i class="fa fa-star rating-color"></i>
                                <i class="fa fa-star rating-color"></i>
                                <i class="fa fa-star"></i>
                            </div>
                        </div>

                        <div class="price p-2">
                            <h5>1.500.000VNĐ</h5>
                        </div>
                    </div>

                    <button class="card-button" data-bs-toggle="modal" data-bs-target="#modalRegisterSubject" type="button" onclick="select5Sessions()">Đăng ký
                        ngay</button>
                </div>
                <div class="card" style="width: 900px;">
                    <div class="card-detail d-flex flex-row">
                        <div class="d-flex justify-content-between align-items-center ">
                            <img class="card-img-top"
                                 src="https://bizweb.dktcdn.net/100/415/690/files/nguyen-tac-lai-xe-o-to-1.jpg?v=1676950679832"
                                 alt="Card image cap">
                        </div>
                        <div class="card-body">
                            <h4>
                                Đăng ký nộp hồ sơ thi
                            </h4>

                            <p class="card-text">
                                Chúng tôi cung cấp sự hướng dẫn chuyên nghiệp, cả phần lý thuyết và thực
                                hành, trên các loại xe thực tế. Với giảng viên kinh nghiệm và sân trường lái hiện đại,
                                khóa
                                học giúp bạn xây dựng kỹ năng lái xe và tuân thủ luật lệ giao thông.
                            </p>

                            <div class="small-ratings">
                                <i class="fa fa-star rating-color"></i>
                                <i class="fa fa-star rating-color"></i>
                                <i class="fa fa-star rating-color"></i>
                                <i class="fa fa-star rating-color"></i>
                                <i class="fa fa-star"></i>
                            </div>
                        </div>

                        <div class="price p-2">
                            <h5>10.000.000VNĐ</h5>
                        </div>
                    </div>

                    <button class="card-button" data-bs-toggle="modal" data-bs-target="#modalRegisterSubject" type="button" onclick="selectTesting()">Đăng ký
                        ngay</button>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modalRegisterSubject" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
             aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <form action="MainController" method="post">
                <div class="modal-dialog modal-dialog-centered modal-xl">
                    <div class="modal-content">
                        <div class='payment '>
                            <div class="payment_left">
                                <div class="information">
                                    <div class="name" id="package-title">
                                        Gói thực hành với 3 buổi tập
                                    </div>
                                    <div id="price-show" class="price">
                                        900,000 VNĐ
                                    </div>
                                </div>

                                <div class="apprentice">
                                    <div class="flex">
                                        <div class="flex_name">Hình thức: Học thực hành</div>
                                    </div>
                                </div>

                                <div class="line"></div>

                                <div class="apprentice">
                                    <div class="flex">
                                        <div class="flex_name">Giá gốc</div>
                                        <label id="price-label-1" for="price">900,000 VNĐ</label>
                                    </div>
                                </div>

                                <div class="apprentice tax">
                                    <div class="flex">
                                        <div class="flex_name">Thuế</div>
                                        <div class="flex_price">0.00 VNĐ</div>
                                    </div>
                                </div>

                                <div class="line"></div>

                                <div class="apprentice">
                                    <div class="flex">
                                        <div class="flex_name">Tổng cộng</div>
                                        <label id="price-label" for="price">900,000 VNĐ</label>
                                        <input hidden type="text" id="type" name="type" value="${type}">
                                        <input hidden type="number" id="price" name="price" value="900000">
                                    </div>
                                </div>

                            </div>

                            <div class="payment_right">

                                <div class="title">
                                    <div class="form-group d-flex align-items-center gap-2">
                                        <label for="cash_type">Hình thức thanh toán:</label>
                                        <select name="cash_type" class="form-select" id="paymentMethod" style="width: auto;">
                                            <option value="cash">Tiền mặt</option>
                                            <option value="vnpay">VNPAY</option>
                                        </select>

                                    </div>
                                </div>

                                <div class="email">
                                    <div class="left">Email</div>
                                    <div class="right">${sessionScope.user.getEmail()}</div>

                                </div>

                                <div class="info-user">
                                    <div class="input">
                                        <label for="name" class="input_title">Full name</label>
                                        <input id="name" name="name" type="text" class="input_feild" value="${sessionScope.user.getName()}"
                                               placeholder='Full name' disabled />
                                    </div>

                                    <div class="input">
                                        <label for="phone" class="input_title">Phone number</label>
                                        <input id="phone" name="phone" type="text" class="input_feild" value="${sessionScope.user.getPhone()}"
                                               placeholder='Phone number' disabled />
                                    </div>
                                </div>

                                <div class="info-vnpay d-none">
                                    <h5>Phương thức thanh toán</h5>
                                    <div class="px-3">
                                        <div class="radio-buttons-container">
                                            <div class="radio-button">
                                                <input name="option-payment" id="option-payment" class="radio-button__input"
                                                       type="radio" checked>
                                                <label for="option-payment" class="radio-button__label">
                                                    <span class="radio-button__custom"></span>
                                                    Cổng thanh toán
                                                    <span class="text-danger fw-bold">VN</span><span class="fw-bold"
                                                                                                     style="color: #00008B">PAY</span>
                                                    <span class="text-danger fw-bold"
                                                          style="font-size: 0.6em; vertical-align: text-top;">QR</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <h5 class="mt-3">Chọn ngôn ngữ thanh toán</h5>
                                    <div class="px-3">
                                        <div class="radio-buttons-container">
                                            <div class="radio-button">
                                                <input  class="radio-button__input"
                                                        type="radio" id="vietnamese-option" Checked="True" name="language" value="vn">
                                                <label for="vietnamese-option" class="radio-button__label">
                                                    <span class="radio-button__custom"></span>
                                                    Tiếng Việt
                                                </label>


                                                <input class="radio-button__input"
                                                       type="radio" id="english-option" name="language" value="en">
                                                <label for="english-option" class="radio-button__label">
                                                    <span class="radio-button__custom"></span>
                                                    Tiếng Anh
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="btn-checkout" style="display:flex;">

                                    <button class='btn btn-primary mt-5 ml-5' name="action" value="payCash" type="submit" >
                                        Tạo giao dịch
                                    </button>



                                </div>

                            </div>

                            <button type="button" class="btn-close btn-close-payment" data-bs-dismiss="modal"
                                    aria-label="Close">
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <!--        <form action="MainController" method="post">
                    <div id="hidden-div" style="display : none"> 
                        <label id="price-label" for="price">Gíá: 900,000 VNĐ</label>
                        <input hidden type="number" id="price" name="price" value="900000">
                        <br></br>
                        <label for="type">Loại hình: Học thực hành</label>
                        <input hidden type="text" id="type" name="type" value="${type}">
                        <br></br>
                        <label for="cash_type">Hình thức thanh toán:</label>
                        <select name="cash_type">
                            <option value="cash">Tiền mặt</option>
                            <option value="vnpay">VNPay</option>
                        </select>
                        <button name="action" value="payCash" type="submit">Tạo giao dịch</button>
                    </div>
                </form>-->

        <!--        <form action="/LicenseReal/PaymentController" id="frmCreateOrder" method="post">        
                    <div class="form-group">
                        <label for="amount">Số tiền : ${amount}</label>
                        <input hidden class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" max="100000000" min="1" name="amount" type="number" value="${amount}" />
                    </div>
                    <h4>Chọn phương thức thanh toán</h4>
                    <div class="form-group">
                        <h5>Chuyển hướng sang Cổng VNPAY chọn phương thức thanh toán</h5>
                        <input type="radio" Checked="True" id="bankCode" name="bankCode" value="">
                        <label for="bankCode">Cổng thanh toán VNPAYQR</label><br>
                    </div>
                    <div class="form-group">
                        <h5>Chọn ngôn ngữ giao diện thanh toán:</h5>
                        <input type="radio" id="language" Checked="True" name="language" value="vn">
                        <label for="language">Tiếng việt</label><br>
                        <input type="radio" id="language" name="language" value="en">
                        <label for="language">Tiếng anh</label><br>
        
                    </div>
                    <button name="action" value ="pay" type="submit" class="btn btn-default" href>Thanh toán</button>
                </form>-->

        <c:import url="userFooter.jsp"/>


        <script>
            function showToast(message) {
                var toast = document.getElementById("toast");
                toast.innerText = message; // Set the message text
                toast.className = "show";
                setTimeout(function () {
                    toast.className = toast.className.replace("show", "");
                }, 3000);
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>


        <script>
            function select3Sessions() {
                // Thay đổi tiêu đề
                document.getElementById('package-title').innerText = 'Gói thực hành với 3 buổi tập';

                // Thay đổi giá trị trong input hidden
                document.getElementById('type').value = '3regisLearn';

                // Thay đổi giá trị trong label
                document.getElementById('price-show').innerText = '900,000 VNĐ';
                document.getElementById('price-label-1').innerText = '900,000 VNĐ';
                document.getElementById('price-label').innerText = '900,000 VNĐ';
                document.getElementById('price').value = 900000;
                document.getElementById('hidden-div').style.display = 'block';
            }

            function select5Sessions() {
                // Thay đổi tiêu đề
                document.getElementById('package-title').innerText = 'Gói thực hành với 5 buổi tập';

                // Thay đổi giá trị trong input hidden
                document.getElementById('type').value = '5regisLearn';

                // Thay đổi giá trị trong label
                document.getElementById('price-show').innerText = '1,500,000 VNĐ';
                document.getElementById('price-label-1').innerText = '1,500,000 VNĐ';
                document.getElementById('price-label').innerText = '1,500,000 VNĐ';
                document.getElementById('price').value = 1500000;
                document.getElementById('hidden-div').style.display = 'block';
            }
            function selectTesting() {
                // Thay đổi tiêu đề
                document.getElementById('package-title').innerText = 'Gói đăng ký nộp hồ sơ thi';

                // Thay đổi giá trị trong input hidden
                document.getElementById('type').value = 'regisTest';

                // Thay đổi giá trị trong label
                document.getElementById('price-show').innerText = '10,000,000 VNĐ';
                document.getElementById('price-label-1').innerText = '10,000,000 VNĐ';
                document.getElementById('price-label').innerText = '10,000,000 VNĐ';
                document.getElementById('price').value = 10000000;
                document.getElementById('hidden-div').style.display = 'block';
            }
            //xử lý sự kiện thay đổi option tiền mặt và vnpay
            const paymentMethodSelect = document.getElementById("paymentMethod");
            const infoUser = document.querySelector(".info-user");
            const infoVnPay = document.querySelector(".info-vnpay");

            paymentMethodSelect.addEventListener("change", function () {
                if (paymentMethodSelect.value === "cash") {
                    infoUser.classList.remove("d-none");
                    infoVnPay.classList.add("d-none");
                } else if (paymentMethodSelect.value === "vnpay") {
                    infoUser.classList.add("d-none");
                    infoVnPay.classList.remove("d-none");
                }
            });


        </script>
    </body>

</html>
