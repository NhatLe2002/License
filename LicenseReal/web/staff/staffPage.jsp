<%-- 
    Document   : staffPage
    Created on : 06-10-2023, 08:56:09
    Author     : HP Pro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en"><head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" /> -->
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.2/mdb.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./css/staffPage.css">
    </head>

    <body>
        <div class="container-fluid admin">
            <div class="row admin-content">
                <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
                    <div class="logo">
                        <img src="https://cdn-icons-png.flaticon.com/512/6556/6556219.png" style="max-height: 4rem; max-width: 4rem"/>
                        <h4 class="text-xl font-bold uppercase">DaoTaoLaiXe</h4>
                    </div>
                    <div class="position-sticky pt-3">
                        <ul class="nav flex-column">
                            <li class="nav-item dashboard-btn admin-active">

                                <p class="nav-link">
                                    <i class="fa-solid fa-chart-line"></i> Thống Kê
                                </p>
                            </li>
                            <li class="nav-item list-user-btn">
                                <p class="nav-link">
                                    <i class="fa-regular fa-user"></i> Danh Sách Người Dùng
                                </p>
                            </li>
                            <li class="nav-item list-topic-btn">
                                <p class="nav-link">
                                    <i class="fa-regular fa-file-lines"></i> Danh Sách Đề Thi
                                </p>
                            </li>
                            <li class="nav-item transaction-btn">
                                <p class="nav-link">
                                    <i class="fa-regular fa-money-bill-1"></i> Lịch Sử Giao Dịch
                                </p>
                            </li>
                            <li class="nav-item schedule-btn">
                                <p class="nav-link">
                                    <i class="fa-regular fa-calendar"></i> Lịch Học
                                </p>
                            </li>
                        </ul>
                    </div>
                    <h5 class="logout-btn">
                        <i class="fa-solid fa-right-from-bracket"></i> Đăng xuất
                    </h5>
                </nav>

                <!-- Content -->
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="dashboard">dashboard</div>

                    <div class="list-user d-none">
                        <div class="list-user-filter filter">
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                    Filter
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </div>
                            <input type="text" name="list-user-filter" class="form-control filter-input" placeholder="Tìm Kiếm...">
                            <button type="button" class="btn btn-primary filter-button">Tìm Kiếm</button>
                        </div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">list-user</th>
                                    <th scope="col">First</th>
                                    <th scope="col">Last</th>
                                    <th scope="col">Handle</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                    <td>@fat</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td colspan="2">Larry the Bird</td>
                                    <td>@twitter</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="list-topic d-none">
                        <div class="list-user-filter filter">
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                    Filter
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </div>
                            <input type="text" name="list-user-filter" class="form-control filter-input" placeholder="Tìm Kiếm...">
                            <button type="button" class="btn btn-primary filter-button">Tìm Kiếm</button>
                        </div><table class="table">

                            <thead>
                                <tr>
                                    <th scope="col">list-topic</th>
                                    <th scope="col">First</th>
                                    <th scope="col">Last</th>
                                    <th scope="col">Handle</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                    <td>@fat</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td colspan="2">Larry the Bird</td>
                                    <td>@twitter</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="transaction d-none">
                        <div class="list-user-filter filter">
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                    Filter
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </div>
                            <input type="text" name="list-user-filter" class="form-control filter-input" placeholder="Tìm Kiếm...">
                            <button type="button" class="btn btn-primary filter-button">Tìm Kiếm</button>
                        </div><table class="table">

                            <thead>
                                <tr>
                                    <th scope="col">transaction</th>
                                    <th scope="col">First</th>
                                    <th scope="col">Last</th>
                                    <th scope="col">Handle</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                    <td>@fat</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td colspan="2">Larry the Bird</td>
                                    <td>@twitter</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="calendar schedule d-none">
                        <div class="header">
                            <div class="month">Tháng 10, 2023</div>
                            <div class="btns">
                                <div class="btn today-btn" style="display: none;">
                                    <i class="fas fa-calendar-day"></i>
                                </div>
                                <div class="btn prev-btn">
                                    <i class="fas fa-chevron-left"></i>
                                </div>
                                <div class="btn next-btn">
                                    <i class="fas fa-chevron-right"></i>
                                </div>
                            </div>
                        </div>
                        <div class="weekdays">
                            <div class="day">CN</div>
                            <div class="day">Hai</div>
                            <div class="day">Ba</div>
                            <div class="day">Tư</div>
                            <div class="day">Năm</div>
                            <div class="day">Sáu</div>
                            <div class="day">Bảy</div>
                        </div>
                        <div class="days"><div class="day ">1</div><div class="day ">2</div><div class="day ">3</div><div class="day ">4</div><div class="day ">5</div><div class="day today">6</div><div class="day ">7</div><div class="day ">8</div><div class="day ">9</div><div class="day ">10</div><div class="day ">11</div><div class="day ">12</div><div class="day ">13</div><div class="day ">14</div><div class="day ">15</div><div class="day ">16</div><div class="day ">17</div><div class="day ">18</div><div class="day ">19</div><div class="day ">20</div><div class="day ">21</div><div class="day ">22</div><div class="day ">23</div><div class="day ">24</div><div class="day ">25</div><div class="day ">26</div><div class="day ">27</div><div class="day ">28</div><div class="day ">29</div><div class="day ">30</div><div class="day ">31</div><div class="day next">1</div><div class="day next">2</div><div class="day next">3</div><div class="day next">4</div></div>
                        <button type="button" class="btn btn-danger float-end add-calendar">Nhập Lịch Học +</button>
                    </div>
                </main>
            </div>
        </div>

        <script>

            const dashboard = document.querySelector(".dashboard");
            const listUser = document.querySelector(".list-user");
            const listTopic = document.querySelector(".list-topic");
            const transaction = document.querySelector(".transaction");
            const schedule = document.querySelector(".schedule");

            const dashboardBtn = document.querySelector(".dashboard-btn");
            const listUserBtn = document.querySelector(".list-user-btn");
            const listTopicBtn = document.querySelector(".list-topic-btn");
            const transactionBtn = document.querySelector(".transaction-btn");
            const scheduleBtn = document.querySelector(".schedule-btn");

            // xử lý sự kiện chuyển đổi các nội dung theo side bar

            // dashboard

            dashboardBtn.addEventListener("click", (e) => {
                e.preventDefault();
                listUser.classList.add('d-none');
                listTopic.classList.add('d-none');
                transaction.classList.add('d-none');
                schedule.classList.add('d-none');
                dashboard.classList.remove('d-none');

                listUserBtn.classList.remove('admin-active');
                listTopicBtn.classList.remove('admin-active');
                transactionBtn.classList.remove('admin-active');
                scheduleBtn.classList.remove('admin-active');
                dashboardBtn.classList.add('admin-active');
            });

            // listUser

            listUserBtn.addEventListener("click", (e) => {
                e.preventDefault();
                dashboard.classList.add('d-none');
                listTopic.classList.add('d-none');
                transaction.classList.add('d-none');
                schedule.classList.add('d-none');
                listUser.classList.remove('d-none');

                dashboardBtn.classList.remove('admin-active');
                listTopicBtn.classList.remove('admin-active');
                transactionBtn.classList.remove('admin-active');
                scheduleBtn.classList.remove('admin-active');
                listUserBtn.classList.add('admin-active');
            });

            // list đề thi

            listTopicBtn.addEventListener("click", (e) => {
                e.preventDefault();
                dashboard.classList.add('d-none');
                listUser.classList.add('d-none');
                transaction.classList.add('d-none');
                schedule.classList.add('d-none');
                listTopic.classList.remove('d-none');

                dashboardBtn.classList.remove('admin-active');
                listUserBtn.classList.remove('admin-active');
                transactionBtn.classList.remove('admin-active');
                scheduleBtn.classList.remove('admin-active');
                listTopicBtn.classList.add('admin-active');
            });

            // lịch sử thanh toán

            transactionBtn.addEventListener("click", (e) => {
                e.preventDefault();
                listUser.classList.add('d-none');
                listTopic.classList.add('d-none');
                dashboard.classList.add('d-none');
                schedule.classList.add('d-none');
                transaction.classList.remove('d-none');

                listUserBtn.classList.remove('admin-active');
                listTopicBtn.classList.remove('admin-active');
                dashboardBtn.classList.remove('admin-active');
                scheduleBtn.classList.remove('admin-active');
                transactionBtn.classList.add('admin-active');
            });

            // Lịch học

            scheduleBtn.addEventListener("click", (e) => {
                e.preventDefault();
                listUser.classList.add('d-none');
                listTopic.classList.add('d-none');
                transaction.classList.add('d-none');
                dashboard.classList.add('d-none');
                schedule.classList.remove('d-none');

                listUserBtn.classList.remove('admin-active');
                listTopicBtn.classList.remove('admin-active');
                transactionBtn.classList.remove('admin-active');
                dashboardBtn.classList.remove('admin-active');
                scheduleBtn.classList.add('admin-active');
            });

            // xử lý bảng lịch học

            const daysContainer = document.querySelector(".days"),
                    nextBtn = document.querySelector(".next-btn"),
                    prevBtn = document.querySelector(".prev-btn"),
                    month = document.querySelector(".month"),
                    todayBtn = document.querySelector(".today-btn");

            const months = [
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9",
                "10",
                "11",
                "12";
            ];

            const days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

            // get current date
            const date = new Date();

            // get current month
            let currentMonth = date.getMonth();

            // get current year
            let currentYear = date.getFullYear();

            // function to render days
            function renderCalendar() {
                date.setDate(1);
                const firstDay = new Date(currentYear, currentMonth, 1);
                const lastDay = new Date(currentYear, currentMonth + 1, 0);
                const lastDayIndex = lastDay.getDay();
                const lastDayDate = lastDay.getDate();
                const prevLastDay = new Date(currentYear, currentMonth, 0);
                const prevLastDayDate = prevLastDay.getDate();
                const nextDays = 7 - lastDayIndex - 1;

                month.innerHTML = `Tháng ${months[currentMonth]}, ${currentYear}`;

                let days = "";

                for (let x = firstDay.getDay(); x > 0; x--) {
                    days += `<div class="day prev">${prevLastDayDate - x + 1}</div>`;
                }

                // current month days
                for (let i = 1; i <= lastDayDate; i++) {
                    if (
                            i === new Date().getDate() &&
                            currentMonth === new Date().getMonth() &&
                            currentYear === new Date().getFullYear()
                            ) {
                        days += `<div class="day today">${i}</div>`;
                    } else {
                        days += `<div class="day ">${i}</div>`;
                    }
                }

                for (let j = 1; j <= nextDays; j++) {
                    days += `<div class="day next">${j}</div>`;
                }

                hideTodayBtn();
                daysContainer.innerHTML = days;
            }

            renderCalendar();

            nextBtn.addEventListener("click", () => {
                currentMonth++;
                if (currentMonth > 11) {
                    currentMonth = 0;
                    currentYear++;
                }
                renderCalendar();
            });

            // prev month btn
            prevBtn.addEventListener("click", () => {
                currentMonth--;
                if (currentMonth < 0) {
                    currentMonth = 11;
                    currentYear--;
                }
                renderCalendar();
            });

            // go to today
            todayBtn.addEventListener("click", () => {
                currentMonth = date.getMonth();
                currentYear = date.getFullYear();
                renderCalendar();
            });

            function hideTodayBtn() {
                if (
                        currentMonth === new Date().getMonth() &&
                        currentYear === new Date().getFullYear()
                        ) {
                    todayBtn.style.display = "none";
                } else {
                    todayBtn.style.display = "flex";
                }
            }

        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>



    </body></html>