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
            Xem chi tiết
        </title>

        <meta name="description" content="" />

        <!-- Favicon -->
        <link
            rel="icon"
            type="image/x-icon"
            href="https://cdn-icons-png.flaticon.com/512/6556/6556219.png"
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
                <c:import url="../menu.jsp"/>

                <!-- Layout container -->
                <div class="layout-page">
                    <!-- Content wrapper -->
                    <div class="content-wrapper">
                        <!-- Content -->

                        <div class="container-xxl flex-grow-1 container-p-y">
                            <h4 class="py-3 mb-4">
                                <span class="text-muted fw-light">Forms/</span> Xem chi tiết thông tin hồ sơ
                            </h4>

                            <!-- Basic Layout -->
                            <div class="row">
                                <div class="col-xl">
                                    <div class="card mb-4" id="textContent">
                                        <div
                                            class="card-header d-flex justify-content-between align-items-center"
                                            >
                                            <h5 class="mb-0">Thông tin hồ sơ</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-3" id="image3x4">
                                                    <label for="formFile" class="form-label">Ảnh 3x4</label>
                                                    <div class="file-img" id="image" style="padding-top: 1rem">
                                                        <img id="preview" src="data:image;base64,${load_profile.img_user}" alt="Preview" style="max-height: 15rem; max-width: 20rem;" />
                                                    </div>
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="mb-3">
                                                        <label for="nameBasic" class="form-label"
                                                               >Số điện thoại</label
                                                        >
                                                        <input
                                                            type="number"
                                                            id="nameBasic"
                                                            class="form-control"
                                                            name="phone"  value="${load_profile.phone}" readonly=""
                                                            />
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="emailBasic" class="form-label"
                                                               >Email</label
                                                        >
                                                        <input
                                                            type="text"
                                                            id="emailBasic"
                                                            class="form-control"
                                                            name="email" value="${load_profile.email}" readonly=""
                                                            />
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="emailBasic" class="form-label"
                                                               >Họ và tên</label
                                                        >
                                                        <input
                                                            type="text"
                                                            id="emailBasic"
                                                            class="form-control"
                                                            name="name" value="${load_profile.name}" readonly=""
                                                            />
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="emailBasic" class="form-label"
                                                               >Ngày tháng năm sinh</label
                                                        >
                                                        <input
                                                            type="text"
                                                            id="emailBasic"
                                                            class="form-control"
                                                            name="dob" value="${load_profile.dob}" readonly=""
                                                            />
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="emailBasic" class="form-label"
                                                               >Giới tính</label
                                                        >
                                                        <input
                                                            type="text"
                                                            id="emailBasic"
                                                            class="form-control"
                                                            name="gender" <c:if test="${load_profile.gender == 'true'}">value="Nam"</c:if>
                                                            <c:if test="${load_profile.gender == 'false'}">value="Nữ"</c:if>  readonly=""
                                                                />
                                                        </div>
                                                        <div class="mb-3" >
                                                            <label for="emailBasic" class="form-label"
                                                                   >Quốc tịch</label
                                                            >
                                                            <input
                                                                type="text"
                                                                id="emailBasic"
                                                                class="form-control"
                                                                name="hometown" value="Việt Nam" readonly=""
                                                                />
                                                        </div>
                                                        <div class="mb-3" >
                                                            <label for="emailBasic" class="form-label"
                                                                   >Căn cước công dân</label
                                                            >
                                                            <input
                                                                type="text"
                                                                id="emailBasic"
                                                                class="form-control"
                                                                name="cccd" value="${load_profile.cccd}" readonly=""
                                                            />
                                                    </div>
                                                    <div class="mb-3" >
                                                        <label for="formFile" class="form-label"
                                                               >Ảnh căn cước công dân</label
                                                        >
                                                        <div class="file-img" id="image" style="padding-top: 1rem">
                                                            <img id="preview" src="data:image;base64,${load_profile.img_cccd}" alt="Preview" style="max-height: 10rem; max-width: 25rem;"/>
                                                        </div>
                                                    </div>
                                                    <div class="mb-3" >
                                                        <label for="emailBasic" class="form-label"
                                                               >Địa chỉ thường trú</label
                                                        >
                                                        <input
                                                            type="text"
                                                            id="emailBasic"
                                                            class="form-control"
                                                            name="address" value="${load_profile.address}" readonly=""
                                                            />
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="emailBasic" class="form-label"
                                                               >Giấy khám sức khỏe</label
                                                        >
                                                        <input
                                                            type="text"
                                                            id="emailBasic"
                                                            class="form-control"
                                                            name="health" value="${load_profile.health}" readonly=""
                                                            />
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>           
                        </div>
                    </div>
                </div>
                <!-- Content wrapper -->
            </div>
            <!-- / Layout page -->
        </div>
        <script>
            function previewImage(event) {
                var reader = new FileReader();
                reader.onload = function () {
                    var output = document.getElementById("preview");
                    output.src = reader.result;
                };

                var fileInput = event.target;
                var files = fileInput.files;

                if (files.length > 0) {
                    var img = document.getElementById("image");
                    reader.readAsDataURL(files[0]);
                    img.style.display = 'inline-grid';
                } else {
                    // Nếu không có file được chọn, đặt lại ảnh về trạng thái ban đầu
                    var output = document.getElementById("preview");
                    output.src = "#";
                }
            }
            function resetImage() {
                // Lấy thẻ <input> theo id
                var inputElement = document.getElementById("fileInput");

                // Đặt lại giá trị của thẻ <input> thành rỗng
                inputElement.value = "";

                // Lấy thẻ <img> theo id
                var imgElement = document.getElementById("preview");

                // Đặt lại giá trị src của thẻ <img> thành giá trị mặc định
                imgElement.src = "#";

                // Ẩn thẻ <img>
                var imageContainer = document.getElementById("image");
                imageContainer.style.display = "none";
            }

        </script>
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

