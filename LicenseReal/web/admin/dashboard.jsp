<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en" class="light-style layout-menu-fixed layout-compact" dir="ltr" data-theme="theme-default" data-assets-path="./assets/" data-template="vertical-menu-template-free"><head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">

        <title>
            Quản trị viên | Thống kê
        </title>

        <meta name="description" content="">

        <!-- Favicon -->
        <link
            rel="icon"
            type="image/x-icon"
            href="https://cdn-icons-png.flaticon.com/512/6556/6556219.png"
            />

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
        <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&amp;display=swap" rel="stylesheet">

        <link rel="stylesheet" href="./assets/vendor/fonts/boxicons.css">

        <!-- Core CSS -->
        <link rel="stylesheet" href="./assets/vendor/css/core.css" class="template-customizer-core-css">
        <link rel="stylesheet" href="./assets/vendor/css/theme-default.css" class="template-customizer-theme-css">
        <link rel="stylesheet" href="./assets/css/dashboard.css">

        <!-- Vendors CSS -->
        <link rel="stylesheet" href="./assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="./assets/vendor/libs/apex-charts/apex-charts.css">

        <!-- Page CSS -->

        <!-- Helpers -->
        <script src="./assets/vendor/js/helpers.js"></script>
        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="./assets/js/config.js"></script>
    </head>

    <body>
        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <!-- Menu -->
                <c:import url="../menu.jsp"/>
                <!-- / Menu -->
                <!-- Layout container -->
                <div class="layout-page">
                    <!-- Navbar -->
                    <nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme" id="layout-navbar">
                        <div class="layout navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                            <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                                <i class="bx bx-menu bx-sm"></i>
                            </a>
                        </div>

                        <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                            <!-- Search -->
                            <div class="navbar-nav align-items-center">
                                <div class="nav-item d-flex align-items-center">
                                    <i class="bx bx-search fs-4 lh-0"></i>
                                    <input type="text" class="form-control border-0 shadow-none ps-1 ps-sm-2" placeholder="Tìm kiếm.." aria-label="Tìm kiếm..">
                                </div>
                            </div>
                            <!-- /Search -->
                        </div>
                    </nav>
                    <!-- / Navbar -->

                    <!-- Content wrapper -->
                    <div class="content-wrapper">
                        <!-- Content -->

                        <div class="container-xxl flex-grow-1 container-p-y">
                            <div class="row">
                                <div class="col-lg-8 mb-4 order-0">
                                    <div class="card">
                                        <div class="d-flex align-items-end row">
                                            <div class="col-sm-7">
                                                <div class="card-body">
                                                    <h5 class="card-title text-primary">
                                                        Xin chào ${sessionScope.user.getName()}! 🎉
                                                    </h5>
                                                    <p class="mb-4">
                                                        Đây là trang
                                                        <span class="fw-bold">thống kê</span> nơi mà bạn có thể xem tổng quát các số liệu và tình hình của trung tâm.
                                                    </p>

                                                    <a href="javascript:;" class="btn btn-sm btn-outline-primary">Chúc bạn có một ngày tốt lành !</a>
                                                </div>
                                            </div>
                                            <div class="col-sm-5 text-center text-sm-left">
                                                <div class="card-body pb-0 px-0 px-md-4">
                                                    <img src="./assets/img/illustrations/man-with-laptop-light.png" height="140" alt="View Badge User" data-app-dark-img="illustrations/man-with-laptop-dark.png" data-app-light-img="illustrations/man-with-laptop-light.png">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 order-1">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-12 col-6 mb-4">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="card-title d-flex align-items-start justify-content-between">
                                                        <div class="avatar flex-shrink-0">
                                                            <span class="avatar-initial bg-label-success rounded"><i class="fa-solid fa-users"></i></span>
                                                        </div>
                                                    </div>
                                                    <span class="fw-medium d-block mb-1">Thành viên</span>
                                                    <h3 class="card-title mb-2">${member}</h3>
                                                    <small class="text-center fw-medium">Người</small>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-12 col-6 mb-4">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="card-title d-flex align-items-start justify-content-between">
                                                        <div class="avatar flex-shrink-0">
                                                            <span class="avatar-initial bg-label-info rounded"><i class="fa-solid fa-people-pulling"></i></span>
                                                        </div>
                                                    </div>
                                                    <span class="fw-medium d-block mb-1">Người hướng dẫn</span>
                                                    <h3 class="card-title mb-2">${mentor}</h3>
                                                    <small class="text-center fw-medium">Người</small>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Total Revenue -->
                                <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
                                    <div class="card">
                                        <div class="row row-bordered g-0">
                                            <div class="col-md-8">
                                                <h5 class="card-header m-0 me-2 pb-3">Tổng doanh thu</h5>
                                                <div id="totalRevenueChart" class="px-2"></div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="card-body">
                                                    <div class="text-center">
                                                        <div class="dropdown">
                                                            <button class="btn btn-sm btn-outline-primary dropdown-toggle" type="button" id="growthReportId" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                ${yearNow}
                                                            </button>
                                                            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="growthReportId">
                                                                <c:forEach var="Y" items="${years}">
                                                                    <a class="dropdown-item" href="DashboardController?action=change&year=${Y}">${Y}</a>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="growthChart"></div>
                                                <div class="text-center fw-medium pt-3 mb-2">
                                                    ${compareRevenue}% so với năm trước
                                                </div>

                                                <div class="d-flex px-xxl-4 px-lg-2 p-4 gap-xxl-3 gap-lg-1 gap-3 justify-content-between">
                                                    <div class="d-flex">
                                                        <div class="me-2">
                                                            <span class="badge bg-label-primary p-2"><i class="bx bx-dollar text-primary"></i></span>
                                                        </div>
                                                        <div class="d-flex flex-column">
                                                            <small>${yearNow}</small>
                                                            <h6 class="mb-0">${totalRevenueYearNow}M</h6>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex">
                                                        <div class="me-2">
                                                            <span class="badge bg-label-info p-2"><i class="bx bx-wallet text-info"></i></span>
                                                        </div>
                                                        <div class="d-flex flex-column">
                                                            <small>${lastYear}</small>
                                                            <h6 class="mb-0">${totalRevenueLastYear}M</h6>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--/ Total Revenue -->
                                <div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
                                    <div class="row">
                                        <div class="col-6 mb-4">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="card-title d-flex align-items-start justify-content-between">
                                                        <div class="avatar flex-shrink-0">
                                                            <span class="avatar-initial bg-label-danger rounded"><i class="fa-solid fa-people-group"></i></span>
                                                        </div>
                                                    </div>
                                                    <span class="d-block mb-1">Nhân viên</span>
                                                    <h3 class="card-title text-nowrap mb-2">${staff}</h3>
                                                    <small class="text-center fw-medium">Người</small>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6 mb-4">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="card-title d-flex align-items-start justify-content-between">
                                                        <div class="avatar flex-shrink-0">
                                                            <span class="avatar-initial bg-label-primary rounded"><i class="fa-regular fa-circle-question"></i></span>
                                                        </div>
                                                    </div>
                                                    <span class="fw-medium d-block mb-1">Câu hỏi</span>
                                                    <h3 class="card-title mb-2">${question}</h3>
                                                    <small class="text-center fw-medium">Câu</small>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- </div>
                        <div class="row"> -->
                                        <div class="col-12 mb-4">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="d-flex justify-content-between flex-sm-row flex-column gap-3">
                                                        <div class="d-flex flex-sm-column flex-row align-items-start justify-content-between">
                                                            <div class="card-title">
                                                                <h5 class="text-nowrap mb-2">Hồ sơ lái xe</h5>
                                                                <span class="badge bg-label-warning rounded-pill">Năm ${yearNow}</span>
                                                            </div>
                                                            <div class="mt-sm-auto">
                                                                <small class="text-muted text-nowrap fw-medium">Tổng doanh số</small>
                                                                <h3 class="mb-0">${totaPaymentProfilel}M</h3>
                                                            </div>
                                                        </div>
                                                        <div id="profileReportChart"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <!-- Order Statistics -->
                                <div class="col-md-6 col-lg-4 col-xl-4 order-0 mb-4">
                                    <div class="card h-100">
                                        <div class="card-header d-flex align-items-center justify-content-between pb-0">
                                            <div class="card-title mb-0">
                                                <h5 class="m-0 me-2">Thống kê giao dịch</h5>
                                                <small class="text-muted">${totalRevenueYearNow}M đã thanh toán</small>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <div class="d-flex flex-column align-items-center gap-1">
                                                    <h2 class="mb-2">${totalPayment}</h2>
                                                    <span>Tổng giao dịch</span>
                                                </div>
                                                <div id="orderStatisticsChart"></div>
                                            </div>
                                            <ul class="p-0 m-0">
                                                <li class="d-flex mb-4 pb-1">
                                                    <div class="avatar flex-shrink-0 me-3">
                                                        <span class="avatar-initial rounded bg-label-primary">
                                                            <img style="max-height: 1.5rem; max-width: 1.5rem" src="https://cdn.haitrieu.com/wp-content/uploads/2022/10/Icon-VNPAY-QR.png"/>
                                                        </span>
                                                    </div>
                                                    <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                        <div class="me-2">
                                                            <h6 class="mb-0">VNPay</h6>
                                                            <small class="text-muted">Thanh toán online</small>
                                                        </div>
                                                        <div class="user-progress">
                                                            <small class="fw-medium">${totalVNPay}M</small>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="d-flex mb-4 pb-1">
                                                    <div class="avatar flex-shrink-0 me-3">
                                                        <span class="avatar-initial rounded bg-label-success"><i class="fa-solid fa-dong-sign"></i></span>
                                                    </div>
                                                    <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                        <div class="me-2">
                                                            <h6 class="mb-0">Tiền mặt</h6>
                                                            <small class="text-muted">Thanh toán tại trung tâm</small>
                                                        </div>
                                                        <div class="user-progress">
                                                            <small class="fw-medium">${totalMoney}M</small>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!--/ Order Statistics -->

                                <!-- Expense Overview -->
                                <div class="col-md-6 col-lg-4 order-1 mb-4">
                                    <div class="card h-100">
                                        <div class="card-header">
                                            <ul class="nav nav-pills" role="tablist">
                                                <li class="nav-item">
                                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-tabs-line-vnpay" aria-controls="navs-tabs-line-card-income" aria-selected="true">
                                                        VNPay
                                                    </button>
                                                </li>
                                                <li class="nav-item">
                                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-tabs-line-money" aria-controls="navs-tabs-line-card-income" aria-selected="true">
                                                        Tiền mặt
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="card-body px-0">
                                            <div class="tab-content p-0">
                                                <div class="tab-pane fade show active" id="navs-tabs-line-vnpay" role="tabpanel">
                                                    <div class="d-flex p-4 pt-3">
                                                        <div class="avatar flex-shrink-0 me-3">
                                                            <span class="avatar-initial rounded bg-label-primary">
                                                                <img style="max-height: 1.5rem; max-width: 1.5rem" src="https://cdn.haitrieu.com/wp-content/uploads/2022/10/Icon-VNPAY-QR.png"/>
                                                            </span>
                                                        </div>
                                                        <div>
                                                            <small class="text-muted d-block">Thanh toán online</small>
                                                            <div class="d-flex align-items-center">
                                                                <h6 class="mb-0 me-1">${totalVNPay}M</h6>
                                                                <small class="text-success fw-medium">
                                                                    <i class="bx bx-chevron-up"></i>
                                                                    ${compareVNPay}%
                                                                </small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="incomeChartVNPay"></div>

                                                </div>
                                                <div class="tab-pane fade show " id="navs-tabs-line-money" role="tabpanel">
                                                    <div class="d-flex p-4 pt-3">
                                                        <div class="avatar flex-shrink-0 me-3">
                                                            <span class="avatar-initial rounded bg-label-success"><i class="fa-solid fa-dong-sign"></i></span>
                                                        </div>
                                                        <div>
                                                            <small class="text-muted d-block">Thanh toán tại trung tâm</small>
                                                            <div class="d-flex align-items-center">
                                                                <h6 class="mb-0 me-1">${totalMoney}M</h6>
                                                                <small class="text-success fw-medium">
                                                                    <i class="bx bx-chevron-up"></i>
                                                                    ${compareMoney}%
                                                                </small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="incomeChartMoney"></div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--/ Expense Overview -->

                                <!-- Transactions -->
                                <div class="col-md-6 col-lg-4 order-2 mb-4">
                                    <div class="card h-100">
                                        <div class="card-header d-flex align-items-center justify-content-between">
                                            <div class="card-title mb-0">
                                                <h5 class="card-title m-0 me-2">Doanh số học thực hành</h5>
                                                <small class="text-muted">Danh sách doanh số từng người hướng dẫn theo năm</small>
                                            </div>
                                        </div>

                                        <div class="card-body">
                                            <ul class="p-0 m-0">
                                                <c:forEach var="R" items="${mentorRevenue}">
                                                    <c:if test="${R.revenue > 100}">
                                                        <li class="d-flex mb-4 pb-1">
                                                            <div class="avatar flex-shrink-0 me-3">
                                                                <span class="avatar-initial rounded bg-label-success"><i class="fa-regular fa-circle-check"></i></span>
                                                            </div>
                                                            <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                                <div class="me-2">
                                                                    <small class="text-muted d-block mb-1">Người hướng dẫn</small>
                                                                    <h6 class="mb-0">${R.mentorName}</h6>
                                                                </div>
                                                                <div class="user-progress d-flex align-items-center gap-1">
                                                                    <h6 class="mb-0">${R.revenue}</h6>
                                                                    <span class="text-muted">M</span>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </c:if>
                                                    <c:if test="${R.revenue < 100 && R.revenue > 30}">
                                                        <li class="d-flex mb-4 pb-1">
                                                            <div class="avatar flex-shrink-0 me-3">
                                                                <span class="avatar-initial rounded bg-label-primary"><i class="fa-regular fa-thumbs-up"></i></span>
                                                            </div>
                                                            <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                                <div class="me-2">
                                                                    <small class="text-muted d-block mb-1">Người hướng dẫn</small>
                                                                    <h6 class="mb-0">${R.mentorName}</h6>
                                                                </div>
                                                                <div class="user-progress d-flex align-items-center gap-1">
                                                                    <h6 class="mb-0">${R.revenue}</h6>
                                                                    <span class="text-muted">M</span>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </c:if>
                                                    <c:if test="${R.revenue < 30}">
                                                        <li class="d-flex mb-4 pb-1">
                                                            <div class="avatar flex-shrink-0 me-3">
                                                                <span class="avatar-initial rounded bg-label-danger"><i class="fa-solid fa-xmark"></i></span>
                                                            </div>
                                                            <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                                                <div class="me-2">
                                                                    <small class="text-muted d-block mb-1">Người hướng dẫn</small>
                                                                    <h6 class="mb-0">${R.mentorName}</h6>
                                                                </div>
                                                                <div class="user-progress d-flex align-items-center gap-1">
                                                                    <h6 class="mb-0">${R.revenue}</h6>
                                                                    <span class="text-muted">M</span>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!--/ Transactions -->
                            </div>
                        </div>
                        <!-- / Content -->
                    </div>
                    <!-- Content wrapper -->
                </div>
                <!-- / Layout page -->
            </div>

            <!-- Overlay -->
        </div>
        <!-- / Layout wrapper -->

        <!-- Core JS -->
        <!-- build:js assets/vendor/js/core.js -->

        <script src="./assets/vendor/libs/jquery/jquery.js"></script>
        <script src="./assets/vendor/libs/popper/popper.js"></script>
        <script src="./assets/vendor/js/bootstrap.js"></script>
        <script src="./assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
        <script src="./assets/vendor/js/menu.js"></script>

        <!-- endbuild -->

        <!-- Vendors JS -->
        <script src="./assets/vendor/libs/apex-charts/apexcharts.js"></script>

        <!-- Main JS -->
        <script src="./assets/js/main.js"></script>

        <!-- Page JS -->
        <!--<script src="./assets/js/dashboards-analytics.js"></script>-->

        <!-- Place this tag in your head or just before your close body tag. -->
        <script async="" defer="" src="https://buttons.github.io/buttons.js"></script>


    </body>
    <script>
        /**
         * Dashboard Analytics
         */


        'use strict';

        (function () {
            let cardColor, headingColor, axisColor, shadeColor, borderColor;

            cardColor = config.colors.cardColor;
            headingColor = config.colors.headingColor;
            axisColor = config.colors.axisColor;
            borderColor = config.colors.borderColor;

            // Total Revenue Report Chart - Bar Chart
            // --------------------------------------------------------------------
            const totalRevenueChartEl = document.querySelector('#totalRevenueChart'),
                    totalRevenueChartOptions = {
                        series: [
                            {
                                name: ${yearNow},
                                data: ${dataYearNow}
                            },
                            {
                                name: ${lastYear},
                                data: ${dataLastYear}
                            }
                        ],
                        chart: {
                            height: 300,
                            stacked: true,
                            type: 'bar',
                            toolbar: {show: false}
                        },
                        plotOptions: {
                            bar: {
                                horizontal: false,
                                columnWidth: '33%',
                                borderRadius: 12,
                                startingShape: 'rounded',
                                endingShape: 'rounded'
                            }
                        },
                        colors: [config.colors.primary, config.colors.info],
                        dataLabels: {
                            enabled: false
                        },
                        stroke: {
                            curve: 'smooth',
                            width: 6,
                            lineCap: 'round',
                            colors: [cardColor]
                        },
                        legend: {
                            show: true,
                            horizontalAlign: 'left',
                            position: 'top',
                            markers: {
                                height: 8,
                                width: 8,
                                radius: 12,
                                offsetX: -3
                            },
                            labels: {
                                colors: axisColor
                            },
                            itemMargin: {
                                horizontal: 10
                            }
                        },
                        grid: {
                            borderColor: borderColor,
                            padding: {
                                top: 0,
                                bottom: -8,
                                left: 20,
                                right: 20
                            }
                        },
                        xaxis: {
                            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                            labels: {
                                style: {
                                    fontSize: '13px',
                                    colors: axisColor
                                }
                            },
                            axisTicks: {
                                show: false
                            },
                            axisBorder: {
                                show: false
                            }
                        },
                        yaxis: {
                            labels: {
                                style: {
                                    fontSize: '13px',
                                    colors: axisColor
                                }
                            }
                        },
                        responsive: [
                            {
                                breakpoint: 1700,
                                options: {
                                    plotOptions: {
                                        bar: {
                                            borderRadius: 10,
                                            columnWidth: '32%'
                                        }
                                    }
                                }
                            },
                            {
                                breakpoint: 1580,
                                options: {
                                    plotOptions: {
                                        bar: {
                                            borderRadius: 10,
                                            columnWidth: '45%'
                                        }
                                    }
                                }
                            },
                            {
                                breakpoint: 1440,
                                options: {
                                    plotOptions: {
                                        bar: {
                                            borderRadius: 10,
                                            columnWidth: '42%'
                                        }
                                    }
                                }
                            },
                            {
                                breakpoint: 1300,
                                options: {
                                    plotOptions: {
                                        bar: {
                                            borderRadius: 10,
                                            columnWidth: '48%'
                                        }
                                    }
                                }
                            },
                            {
                                breakpoint: 1200,
                                options: {
                                    plotOptions: {
                                        bar: {
                                            borderRadius: 10,
                                            columnWidth: '40%'
                                        }
                                    }
                                }
                            },
                            {
                                breakpoint: 1040,
                                options: {
                                    plotOptions: {
                                        bar: {
                                            borderRadius: 11,
                                            columnWidth: '48%'
                                        }
                                    }
                                }
                            },
                            {
                                breakpoint: 991,
                                options: {
                                    plotOptions: {
                                        bar: {
                                            borderRadius: 10,
                                            columnWidth: '30%'
                                        }
                                    }
                                }
                            },
                            {
                                breakpoint: 840,
                                options: {
                                    plotOptions: {
                                        bar: {
                                            borderRadius: 10,
                                            columnWidth: '35%'
                                        }
                                    }
                                }
                            },
                            {
                                breakpoint: 768,
                                options: {
                                    plotOptions: {
                                        bar: {
                                            borderRadius: 10,
                                            columnWidth: '28%'
                                        }
                                    }
                                }
                            },
                            {
                                breakpoint: 640,
                                options: {
                                    plotOptions: {
                                        bar: {
                                            borderRadius: 10,
                                            columnWidth: '32%'
                                        }
                                    }
                                }
                            },
                            {
                                breakpoint: 576,
                                options: {
                                    plotOptions: {
                                        bar: {
                                            borderRadius: 10,
                                            columnWidth: '37%'
                                        }
                                    }
                                }
                            },
                            {
                                breakpoint: 480,
                                options: {
                                    plotOptions: {
                                        bar: {
                                            borderRadius: 10,
                                            columnWidth: '45%'
                                        }
                                    }
                                }
                            },
                            {
                                breakpoint: 420,
                                options: {
                                    plotOptions: {
                                        bar: {
                                            borderRadius: 10,
                                            columnWidth: '52%'
                                        }
                                    }
                                }
                            },
                            {
                                breakpoint: 380,
                                options: {
                                    plotOptions: {
                                        bar: {
                                            borderRadius: 10,
                                            columnWidth: '60%'
                                        }
                                    }
                                }
                            }
                        ],
                        states: {
                            hover: {
                                filter: {
                                    type: 'none'
                                }
                            },
                            active: {
                                filter: {
                                    type: 'none'
                                }
                            }
                        }
                    };
            if (typeof totalRevenueChartEl !== undefined && totalRevenueChartEl !== null) {
                const totalRevenueChart = new ApexCharts(totalRevenueChartEl, totalRevenueChartOptions);
                totalRevenueChart.render();
            }

            // Growth Chart - Radial Bar Chart
            // --------------------------------------------------------------------
            const growthChartEl = document.querySelector('#growthChart'),
                    growthChartOptions = {
                        series: [${compareRevenue}],
                        labels: ['Phát triển'],
                        chart: {
                            height: 240,
                            type: 'radialBar'
                        },
                        plotOptions: {
                            radialBar: {
                                size: 150,
                                offsetY: 10,
                                startAngle: -150,
                                endAngle: 150,
                                hollow: {
                                    size: '55%'
                                },
                                track: {
                                    background: cardColor,
                                    strokeWidth: '100%'
                                },
                                dataLabels: {
                                    name: {
                                        offsetY: 15,
                                        color: headingColor,
                                        fontSize: '15px',
                                        fontWeight: '500',
                                        fontFamily: 'Public Sans'
                                    },
                                    value: {
                                        offsetY: -25,
                                        color: headingColor,
                                        fontSize: '22px',
                                        fontWeight: '500',
                                        fontFamily: 'Public Sans'
                                    }
                                }
                            }
                        },
                        colors: [config.colors.primary],
                        fill: {
                            type: 'gradient',
                            gradient: {
                                shade: 'dark',
                                shadeIntensity: 0.5,
                                gradientToColors: [config.colors.primary],
                                inverseColors: true,
                                opacityFrom: 1,
                                opacityTo: 0.6,
                                stops: [30, 70, 100]
                            }
                        },
                        stroke: {
                            dashArray: 5
                        },
                        grid: {
                            padding: {
                                top: -35,
                                bottom: -10
                            }
                        },
                        states: {
                            hover: {
                                filter: {
                                    type: 'none'
                                }
                            },
                            active: {
                                filter: {
                                    type: 'none'
                                }
                            }
                        }
                    };
            if (typeof growthChartEl !== undefined && growthChartEl !== null) {
                const growthChart = new ApexCharts(growthChartEl, growthChartOptions);
                growthChart.render();
            }

            // Profit Report Line Chart
            // --------------------------------------------------------------------
            const profileReportChartEl = document.querySelector('#profileReportChart'),
                    profileReportChartConfig = {
                        chart: {
                            height: 80,
                            type: 'line',
                            toolbar: {
                                show: false
                            },
                            dropShadow: {
                                enabled: true,
                                top: 10,
                                left: 5,
                                blur: 3,
                                color: config.colors.warning,
                                opacity: 0.15
                            },
                            sparkline: {
                                enabled: true
                            }
                        },
                        grid: {
                            show: false,
                            padding: {
                                right: 8
                            }
                        },
                        colors: [config.colors.warning],
                        dataLabels: {
                            enabled: false
                        },
                        stroke: {
                            width: 5,
                            curve: 'smooth'
                        },
                        series: [
                            {
                                data: ${dataPaymentProfileYearNow}
                            }
                        ],
                        xaxis: {
                            show: false,
                            lines: {
                                show: false
                            },
                            labels: {
                                show: false
                            },
                            axisBorder: {
                                show: false
                            }
                        },
                        yaxis: {
                            show: false
                        }
                    };
            if (typeof profileReportChartEl !== undefined && profileReportChartEl !== null) {
                const profileReportChart = new ApexCharts(profileReportChartEl, profileReportChartConfig);
                profileReportChart.render();
            }

            // Order Statistics Chart
            // --------------------------------------------------------------------
            const chartOrderStatistics = document.querySelector('#orderStatisticsChart'),
                    orderChartConfig = {
                        chart: {
                            height: 165,
                            width: 130,
                            type: 'donut'
                        },
                        labels: ['VNPay', 'Tiền mặt'],
                        series: [${percentVNPay}, ${percentMoney}],
                        colors: [config.colors.primary, config.colors.success],
                        stroke: {
                            width: 5,
                            colors: [cardColor]
                        },
                        dataLabels: {
                            enabled: false,
                            formatter: function (val, opt) {
                                return parseInt(val) + '%';
                            }
                        },
                        legend: {
                            show: false
                        },
                        grid: {
                            padding: {
                                top: 0,
                                bottom: 0,
                                right: 15
                            }
                        },
                        states: {
                            hover: {
                                filter: {type: 'none'}
                            },
                            active: {
                                filter: {type: 'none'}
                            }
                        },
                        plotOptions: {
                            pie: {
                                donut: {
                                    size: '75%',
                                    labels: {
                                        show: true,
                                        value: {
                                            fontSize: '1.5rem',
                                            fontFamily: 'Public Sans',
                                            color: headingColor,
                                            offsetY: -15,
                                            formatter: function (val) {
                                                return parseInt(val) + '%';
                                            }
                                        },
                                        name: {
                                            offsetY: 20,
                                            fontFamily: 'Public Sans'
                                        },
                                        total: {
                                            show: true,
                                            fontSize: '0.8125rem',
                                            color: config.colors.primary,
                                            label: 'VNPay',
                                            formatter: function (w) {
                                                return '${percentVNPay}%';
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    };
            if (typeof chartOrderStatistics !== undefined && chartOrderStatistics !== null) {
                const statisticsChart = new ApexCharts(chartOrderStatistics, orderChartConfig);
                statisticsChart.render();
            }

            // Income Chart - Area chart
            // --------------------------------------------------------------------
            const currentDate = new Date();
            const currentMonth = currentDate.getMonth() + 1;
            const incomeChartEl = document.querySelector('#incomeChartVNPay'),
                    incomeChartConfig = {
                        series: [
                            {
                                data: ${dataVNPayYearNow}
                            }
                        ],
                        chart: {
                            height: 215,
                            parentHeightOffset: 0,
                            parentWidthOffset: 0,
                            toolbar: {
                                show: false
                            },
                            type: 'area'
                        },
                        dataLabels: {
                            enabled: false
                        },
                        stroke: {
                            width: 2,
                            curve: 'smooth'
                        },
                        legend: {
                            show: false
                        },
                        markers: {
                            size: 6,
                            colors: 'transparent',
                            strokeColors: 'transparent',
                            strokeWidth: 4,
                            discrete: [
                                {
                                    fillColor: config.colors.white,
                                    seriesIndex: 0,
                                    dataPointIndex: ${currentMonth},
                                    strokeColor: config.colors.primary,
                                    strokeWidth: 2,
                                    size: 6,
                                    radius: 8
                                }
                            ],
                            hover: {
                                size: 7
                            }
                        },
                        colors: [config.colors.primary],
                        fill: {
                            type: 'gradient',
                            gradient: {
                                shade: shadeColor,
                                shadeIntensity: 0.6,
                                opacityFrom: 0.5,
                                opacityTo: 0.25,
                                stops: [0, 950, 1000]
                            }
                        },
                        grid: {
                            borderColor: borderColor,
                            strokeDashArray: 3,
                            padding: {
                                top: -20,
                                bottom: -8,
                                left: -10,
                                right: 8
                            }
                        },
                        xaxis: {
                            categories: ['', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                            axisBorder: {
                                show: false
                            },
                            axisTicks: {
                                show: false
                            },
                            labels: {
                                show: true,
                                style: {
                                    fontSize: '13px',
                                    colors: axisColor
                                }
                            }
                        },
                        yaxis: {
                            labels: {
                                show: false
                            },
                            min: 0,
                            max: 200,
                            tickAmount: 4
                        }
                    };
            if (typeof incomeChartEl !== undefined && incomeChartEl !== null) {
                const incomeChart = new ApexCharts(incomeChartEl, incomeChartConfig);
                incomeChart.render();
            }

            // Income Chart - Area chart
            // --------------------------------------------------------------------
            const incomeChartE2 = document.querySelector('#incomeChartMoney'),
                    incomeChartConfig2 = {
                        series: [
                            {
                                data: ${dataMoneyYearNow}
                            }
                        ],
                        chart: {
                            height: 215,
                            parentHeightOffset: 0,
                            parentWidthOffset: 0,
                            toolbar: {
                                show: false
                            },
                            type: 'area'
                        },
                        dataLabels: {
                            enabled: false
                        },
                        stroke: {
                            width: 2,
                            curve: 'smooth'
                        },
                        legend: {
                            show: false
                        },
                        markers: {
                            size: 6,
                            colors: 'transparent',
                            strokeColors: 'transparent',
                            strokeWidth: 4,
                            discrete: [
                                {
                                    fillColor: config.colors.white,
                                    seriesIndex: 0,
                                    dataPointIndex: ${currentMonth},
                                    strokeColor: config.colors.primary,
                                    strokeWidth: 2,
                                    size: 6,
                                    radius: 8
                                }
                            ],
                            hover: {
                                size: 7
                            }
                        },
                        colors: [config.colors.primary],
                        fill: {
                            type: 'gradient',
                            gradient: {
                                shade: shadeColor,
                                shadeIntensity: 0.6,
                                opacityFrom: 0.5,
                                opacityTo: 0.25,
                                stops: [0, 95, 100]
                            }
                        },
                        grid: {
                            borderColor: borderColor,
                            strokeDashArray: 3,
                            padding: {
                                top: -20,
                                bottom: -8,
                                left: -10,
                                right: 8
                            }
                        },
                        xaxis: {
                            categories: ['', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                            axisBorder: {
                                show: false
                            },
                            axisTicks: {
                                show: false
                            },
                            labels: {
                                show: true,
                                style: {
                                    fontSize: '13px',
                                    colors: axisColor
                                }
                            }
                        },
                        yaxis: {
                            labels: {
                                show: false
                            },
                            min: 0,
                            max: 200,
                            tickAmount: 4
                        }
                    };
            if (typeof incomeChartE2 !== undefined && incomeChartE2 !== null) {
                const incomeChart = new ApexCharts(incomeChartE2, incomeChartConfig2);
                incomeChart.render();
            }

            // Expenses Mini Chart - Radial Chart
            // --------------------------------------------------------------------
            const weeklyExpensesEl = document.querySelector('#expensesOfWeek'),
                    weeklyExpensesConfig = {
                        series: [65],
                        chart: {
                            width: 60,
                            height: 60,
                            type: 'radialBar'
                        },
                        plotOptions: {
                            radialBar: {
                                startAngle: 0,
                                endAngle: 360,
                                strokeWidth: '8',
                                hollow: {
                                    margin: 2,
                                    size: '45%'
                                },
                                track: {
                                    strokeWidth: '50%',
                                    background: borderColor
                                },
                                dataLabels: {
                                    show: true,
                                    name: {
                                        show: false
                                    },
                                    value: {
                                        formatter: function (val) {
                                            return '$' + parseInt(val);
                                        },
                                        offsetY: 5,
                                        color: '#697a8d',
                                        fontSize: '13px',
                                        show: true
                                    }
                                }
                            }
                        },
                        fill: {
                            type: 'solid',
                            colors: config.colors.primary
                        },
                        stroke: {
                            lineCap: 'round'
                        },
                        grid: {
                            padding: {
                                top: -10,
                                bottom: -15,
                                left: -10,
                                right: -10
                            }
                        },
                        states: {
                            hover: {
                                filter: {
                                    type: 'none'
                                }
                            },
                            active: {
                                filter: {
                                    type: 'none'
                                }
                            }
                        }
                    };
            if (typeof weeklyExpensesEl !== undefined && weeklyExpensesEl !== null) {
                const weeklyExpenses = new ApexCharts(weeklyExpensesEl, weeklyExpensesConfig);
                weeklyExpenses.render();
            }
        })();
    </script>
</html>