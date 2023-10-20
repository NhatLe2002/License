<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html
    lang="en"
    class="light-style layout-menu-fixed layout-compact"
    dir="ltr"
    data-theme="theme-default"
    data-assets-path="./assets/"
    data-template="vertical-menu-template-free"
    >
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
            />

        <title>
            Add Question
        </title>

        <meta name="description" content="" />

        <!-- Favicon -->
        <link
            rel="icon"
            type="image/x-icon"
            href="./assets/img/favicon/favicon.ico"
            />

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
            />

        <link rel="stylesheet" href="./assets/vendor/fonts/boxicons.css" />

        <!-- Core CSS -->
        <link
            rel="stylesheet"
            href="./assets/vendor/css/core.css"
            class="template-customizer-core-css"
            />
        <link
            rel="stylesheet"
            href="./assets/vendor/css/theme-default.css"
            class="template-customizer-theme-css"
            />
        <link rel="stylesheet" href="./assets/css/demo.css" />

        <!-- Vendors CSS -->
        <link
            rel="stylesheet"
            href="./assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"
            />

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
                <c:import url="menu.jsp"/>

                <!-- Layout container -->
                <div class="layout-page">
                    <!-- Content wrapper -->
                    <div class="content-wrapper">
                        <!-- Content -->

                        <div class="container-xxl flex-grow-1 container-p-y">
                            <h4 class="py-3 mb-4">
                                <span class="text-muted fw-light">Forms/</span> Thêm câu hỏi mới
                            </h4>

                            <!-- Basic Layout -->
                            <div class="row">
                                <div class="col-xl">
                                    <div class="card mb-4">
                                        <div
                                            class="card-header d-flex justify-content-between align-items-center"
                                            >
                                            <h5 class="mb-0">Nhập các thông tin sau</h5>
                                        </div>
                                        <div class="card-body">
                                            <form>
                                                <div class="mb-3">
                                                    <label for="nameBasic" class="form-label"
                                                           >Nội dung câu hỏi</label
                                                    >
                                                    <input
                                                        type="text"
                                                        id="nameBasic"
                                                        class="form-control"
                                                        placeholder="Nội dung câu hỏi"
                                                        name="question" required=""
                                                        />
                                                </div>
                                                <div class="mb-3" name="answer_div">
                                                    <label for="emailBasic" class="form-label"
                                                           >Đáp án A</label
                                                    >
                                                    <input
                                                        type="text"
                                                        id="emailBasic"
                                                        class="form-control"
                                                        name="answerA" value="A. " required=""
                                                        />
                                                </div>
                                                <div class="mb-3" name="answer_div">
                                                    <label for="emailBasic" class="form-label"
                                                           >Đáp án B</label
                                                    >
                                                    <input
                                                        type="text"
                                                        id="emailBasic"
                                                        class="form-control"
                                                        name="answerA" value="B. " required=""
                                                        />
                                                </div>
                                                <div class="mb-3" name="answer_div">
                                                    <label for="emailBasic" class="form-label"
                                                           >Đáp án C</label
                                                    >
                                                    <input
                                                        type="text"
                                                        id="emailBasic"
                                                        class="form-control"
                                                        name="answerA" value="C. " required=""
                                                        />
                                                </div>
                                                <div class="mb-3" name="answer_div">
                                                    <label for="emailBasic" class="form-label"
                                                           >Đáp án D</label
                                                    >
                                                    <input
                                                        type="text"
                                                        id="emailBasic"
                                                        class="form-control"
                                                        name="answerA" value="D. " required=""
                                                        />
                                                </div>

                                                <div class="mb-3">
                                                    <div class="btn-group">
                                                        <label>
                                                            Chọn số đáp án
                                                        </label>
                                                        <select name="answer_options" style="cursor: pointer"  required="">
                                                            <option value="0" disabled="">Chọn 1 lựa chọn!</option>
                                                            <option value="2">Có 2 đáp án</option>
                                                            <option value="3">Có 3 đáp án</option>
                                                            <option value="4">Có 4 đáp án</option>
                                                        </select>
                                                    </div>
                                                    <div class="btn-group">
                                                        <label>
                                                            Chọn đáp án đúng
                                                        </label>
                                                        <select name="correct_answer" style="cursor: pointer" required="">
                                                            <option value="A">A</option>
                                                            <option value="B">B</option>
                                                            <option value="C">C</option>
                                                            <option value="D">D</option>
                                                        </select>
                                                    </div>

                                                </div>
                                                <div class="mb-3">
                                                    <label for="formFile" class="form-label"
                                                           >Chọn đường dẫn hình ảnh</label
                                                    >
                                                    <input
                                                        class="form-control"
                                                        type="file"
                                                        id="formFile"
                                                        />
                                                </div>

                                                <button type="submit" class="btn btn-primary">
                                                    Thêm mới
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- / Content -->

                        <div class="content-backdrop fade"></div>
                    </div>
                    <!-- Content wrapper -->
                </div>
                <!-- / Layout page -->
            </div>
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

        <!-- Main JS -->
        <script src="./assets/js/main.js"></script>

        <!-- Page JS -->

        <!-- Place this tag in your head or just before your close body tag. -->
        <script async defer src="https://buttons.github.io/buttons.js"></script>
    </body>
</html>

