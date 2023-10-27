<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
            />

        <title>Quản lí bộ đề</title>

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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
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
                        <!-- Navbar -->
                        <nav
                            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                            id="layout-navbar"
                            >
                            <div
                                class="layout navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none"
                                >
                                <a
                                    class="nav-item nav-link px-0 me-xl-4"
                                    href="javascript:void(0)"
                                    >
                                    <i class="bx bx-menu bx-sm"></i>
                                </a>
                            </div>

                            <div
                                class="navbar-nav-right d-flex align-items-center"
                                id="navbar-collapse"
                                >
                                <!-- Search -->
                                <div class="navbar-nav align-items-center">
                                    <div class="nav-item d-flex align-items-center">
                                        <i class="bx bx-search fs-4 lh-0"></i>
                                        <input
                                            type="text"
                                            class="form-control border-0 shadow-none ps-1 ps-sm-2"
                                            placeholder="Tìm kiếm.."
                                            aria-label="Tìm kiếm.."
                                            />
                                    </div>
                                </div>
                                <!-- /Search -->
                            </div>
                        </nav>
                        <!-- / Navbar -->

                        <!-- Content -->
                        <div class="container-xxl flex-grow-1 container-p-y">
                            <!-- Basic Bootstrap Table -->
                            <div class="card">
                                <h5
                                    class="card-header"
                                    style="display: flex; justify-content: space-between"
                                    >
                                    <div>Danh sách bộ đề</div>
                                    <!-- Button trigger modal -->
                                    <div>
                                        <a class="dropdown-item"
                                           data-toggle="tooltip" title="Thêm bộ đề"
                                           data-bs-toggle="modal" 
                                           data-bs-target="#modalConfirmCreate" 
                                           onclick="showCreate()"> 
                                            <button type="button" class="btn btn-primary" style="padding: 0.8rem"><i class="fas fa-plus"></i></button>
                                        </a>
                                    </div>
                                </h5>

                                <div class="table-responsive text-nowrap">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Bộ đề</th>
                                                <th>Số câu hỏi</th>
                                                <th>Trạng thái</th>
                                                <th>Tính năng</th>
                                            </tr>
                                        </thead>
                                        <tbody class="table-border-bottom-0" >
                                            <c:choose>
                                                <c:when test="${empty topic}">
                                                    <tr>
                                                        <td><span class="fw-medium">Rỗng</span></td>
                                                        <td><span class="fw-medium">Chưa có bộ đề</span></td>
                                                        <td><span class="fw-medium">Chưa có bộ đề</span></td>
                                                        <td><span class="fw-medium">Chưa có bộ đề</span></td>
                                                        <td><span class="fw-medium">Chưa có bộ đề</span></td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach var="T" items="${topic}" varStatus="counter">
                                                        <tr>
                                                            <td>
                                                                <span class="fw-medium">${counter.count}</span>
                                                            </td>
                                                            <td style="align-content: center">
                                                                <span class="badge bg-label-primary me-1">${T.topicName}</span>
                                                            </td>
                                                            <td>
                                                                <span class="fw-medium">${T.numberOfQuestion}/35</span>
                                                            </td>
                                                            <td>
                                                                <c:if test="${T.status eq 'true'}">
                                                                    <span class="fw-medium" style="color:#fba265">Đang mở</span>
                                                                </c:if>
                                                                <c:if test="${T.status eq 'false'}">
                                                                    <span class="fw-medium">Đang đóng</span>
                                                                </c:if>
                                                            </td>

                                                            <td>
                                                                <div class="dropdown">
                                                                    <button title="Tính năng"
                                                                            type="button"
                                                                            class="btn p-0 dropdown-toggle hide-arrow"
                                                                            data-bs-toggle="dropdown"
                                                                            >
                                                                        <i class="bx bx-dots-vertical-rounded"></i>
                                                                    </button>
                                                                    <div class="dropdown-menu">
                                                                        <a
                                                                            class="dropdown-item"
                                                                            href="MainController?action=details&id=${T.topicID}"
                                                                            ><i class="fa-solid fa-eye me-1"></i>Xem chi tiết</a
                                                                        >
                                                                        <c:if test="${T.status eq 'true'}">
                                                                            <a  style="cursor: pointer"
                                                                                class="dropdown-item"
                                                                                data-toggle="tooltip"
                                                                                data-bs-toggle="modal" 
                                                                                data-bs-target="#modalConfirmDeactive" 
                                                                                onclick="showDeactive('${T.topicID}')"
                                                                                ><i class="fa-solid fa-ban me-1"></i> Đóng bộ đề</a
                                                                            >
                                                                        </c:if>
                                                                        <c:if test="${T.status eq 'false' && T.numberOfQuestion == 35}">
                                                                            <a style="cursor: pointer"
                                                                               class="dropdown-item"
                                                                               data-toggle="tooltip"
                                                                               data-bs-toggle="modal" 
                                                                               data-bs-target="#modalConfirmActive" 
                                                                               onclick="showActive('${T.topicID}')"
                                                                               ><i class="fa-solid fa-arrow-rotate-left me-1"></i> Mở bộ đề</a
                                                                            >
                                                                        </c:if>
                                                                        <c:if test="${T.status eq 'false' && T.numberOfQuestion < 35}">
                                                                            <div class="dropdown-item text-black-50" 
                                                                               ><i class="fa-solid fa-arrow-rotate-left me-1"></i> Mở bộ đề</div
                                                                            >
                                                                        </c:if>
                                                                        <a style="cursor: pointer"
                                                                           class="dropdown-item"
                                                                           data-toggle="tooltip"
                                                                           data-bs-toggle="modal" 
                                                                           data-bs-target="#modalConfirmRemove" 
                                                                           onclick="showRemove('${T.topicID}')"
                                                                           ><i class="fa-solid fa-trash me-1"></i> Xóa bộ đề</a
                                                                        >
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="modalConfirmDeactive" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                             aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">XÁC NHẬN ĐÓNG BỘ ĐỀ</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Bạn có chắc muốn đóng bộ đề này?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                        <button type="button" class="btn btn-primary" id="btn-toast-deactive" class="btn-close"
                                                data-bs-dismiss="modal" aria-label="Close">Xác nhận</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="modalConfirmActive" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                             aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">XÁC NHẬN MỞ BỘ ĐỀ</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Bạn có chắc muốn mở bộ đề này?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                        <button type="button" class="btn btn-primary" id="btn-toast-active" class="btn-close"
                                                data-bs-dismiss="modal" aria-label="Close">Xác nhận</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="modalConfirmRemove" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                             aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">XÁC NHẬN XÓA BỘ ĐỀ</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Bộ đề sẽ <span class="fw-bold">không thể khôi phục</span> sau khi xóa bộ đề. <br>
                                        Bạn có chắc chắn muốn xóa?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                        <button type="button" class="btn btn-primary" id="btn-toast-remove" class="btn-close"
                                                data-bs-dismiss="modal" aria-label="Close">Xác nhận</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="modalConfirmCreateTopic" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                             aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">ĐẶT TÊN CHO BỘ ĐỀ</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="mb-3" >
                                            <label for="emailBasic" class="form-label">Tên bộ đề</label>
                                            <input
                                                type="text"
                                                id="emailBasic"
                                                class="form-control"
                                                name="topicName" placeholder="Nhập tên bộ đề..." required=""
                                                />
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <a 
                                            data-toggle="tooltip"
                                            data-bs-toggle="modal" 
                                            data-bs-target="#modalConfirmCreate" >
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                        </a>
                                        <button type="button" class="btn btn-primary" id="btn-toast-choose" class="btn-close"
                                                data-bs-dismiss="modal" aria-label="Choose">Xác nhận</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="modalConfirmCreate" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                             aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">XÁC NHẬN TẠO BỘ ĐỀ</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Tạo bộ đề bao gồm 35 câu hỏi (30 câu hỏi thường và 5 câu hỏi liệt). <br>
                                        Chọn 1 trong 2 cách để tạo bộ đề.
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                        <button type="button" class="btn btn-primary" id="btn-toast-random" class="btn-close"
                                                data-bs-dismiss="modal" aria-label="Random">Ngẫu nhiên</button>
                                        <a 
                                            data-toggle="tooltip"
                                            data-bs-toggle="modal" 
                                            data-bs-target="#modalConfirmCreateTopic"
                                            onclick="showCreateChoose()">
                                            <button type="button" class="btn btn-primary" id="btn-toast-create" class="btn-close"
                                                    data-bs-dismiss="modal" aria-label="">Tự chọn
                                            </button> 
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- toast thông báo thành công-->
                        <c:if test="${not empty message}">
                            <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
                                <div id="toast-notification" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
                                    <div class="toast-header">
                                        <c:if test="${message eq 'success' || message eq 'success_topic' || message eq 'create_success' || message eq 'remove_success'}">
                                            <strong id="toast-message" class="me-auto text-success"></strong>
                                        </c:if>
                                        <c:if test="${message eq 'fail' || message eq 'fail_topic' || message eq 'create_fail' || message eq 'duplicate' || message eq 'remove_fail'}">
                                            <strong id="toast-message" class="me-auto text-danger"></strong>
                                        </c:if>
                                        <c:if test="${message eq 'exist'}">
                                            <strong id="toast-message" class="me-auto text-danger"></strong>
                                        </c:if>
                                        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function showDeactive(id) {
                var btnToastDelete = document.querySelector('#btn-toast-deactive');
                btnToastDelete.addEventListener('click', function () {
                    var deleteUrl = 'TopicController?action=deactive&status=1&id=' + id;
                    window.location.href = deleteUrl;
                    // Nếu bạn muốn ẩn modal sau khi xác nhận, bạn có thể sử dụng đoạn mã sau:
                    document.getElementById('modalConfirmDeactive').style.display = 'none';
                });
            }
            function showActive(id) {
                var btnToastDelete = document.querySelector('#btn-toast-active');
                btnToastDelete.addEventListener('click', function () {
                    var deleteUrl = 'TopicController?action=active&status=0&id=' + id;
                    window.location.href = deleteUrl;
                    // Nếu bạn muốn ẩn modal sau khi xác nhận, bạn có thể sử dụng đoạn mã sau:
                    document.getElementById('modalConfirmActive').style.display = 'none';
                });
            }
            function showCreate() {
                var btnToastDelete = document.querySelector('#btn-toast-random');
                btnToastDelete.addEventListener('click', function () {
                    var deleteUrl = 'TopicController?action=random';
                    window.location.href = deleteUrl;
                    // Nếu bạn muốn ẩn modal sau khi xác nhận, bạn có thể sử dụng đoạn mã sau:
                    document.getElementById('modalConfirmCreate').style.display = 'none';
                });
            }
            function showRemove(id) {
                var btnToastDelete = document.querySelector('#btn-toast-remove');
                btnToastDelete.addEventListener('click', function () {
                    var deleteUrl = 'RemoveTopicServlet?id=' + id;
                    window.location.href = deleteUrl;
                    // Nếu bạn muốn ẩn modal sau khi xác nhận, bạn có thể sử dụng đoạn mã sau:
                    document.getElementById('modalConfirmCreate').style.display = 'none';
                });
            }

            function showCreateChoose() {
                var btnToastChoose = document.querySelector('#btn-toast-choose');
                btnToastChoose.addEventListener('click', function () {
                    var topicNameInput = document.getElementById('emailBasic');
                    var topicName = topicNameInput.value;

                    if (topicName.trim() === '') {
                        showToast('blank');
                        return;
                    }

                    var encodedTopicName = encodeURI(topicName);
                    var createUrl = 'CreateTopicServlet?id=0&topicName=' + encodedTopicName;
                    window.location.href = createUrl;

                    // Nếu bạn muốn ẩn modal sau khi xác nhận, bạn có thể sử dụng đoạn mã sau:
                    document.getElementById('modalConfirmCreate').style.display = 'none';
                });
            }



            window.addEventListener('DOMContentLoaded', (event) => {
                const message = '${message}'; // Lấy giá trị thông báo từ servlet
                if (message) {
                    showToast(message); // Gọi hàm hiển thị thông báo
                }
            });

            function showToast(message) {
                const toast = document.getElementById('toast-notification');
                const toastMessage = document.getElementById('toast-message');
                if (message === 'success') {
                    var success = 'Cập nhật trạng thái thành công!';
                    toastMessage.textContent = success;
                } else if (message === 'fail') {
                    var fail = 'Không thể cập nhật trạng thái!';
                    toastMessage.textContent = fail;
                } else if (message === 'success_topic') {
                    var success_topic = 'Tạo bộ đề thành công!';
                    toastMessage.textContent = success_topic;
                } else if (message === 'fail_topic') {
                    var fail_topic = 'Không thể tạo bộ đề!';
                    toastMessage.textContent = fail_topic;
                } else if (message === 'create_success') {
                    var create_success = 'Tạo bộ đề thành công!';
                    toastMessage.textContent = create_success;
                } else if (message === 'duplicate') {
                    var duplicate = 'Tên bộ đề đã tồn tại!';
                    toastMessage.textContent = duplicate;
                } else if (message === 'create_fail') {
                    var create_fail = 'Không thể tạo bộ đề!';
                    toastMessage.textContent = create_fail;
                } else if (message === 'remove_success') {
                    var remove_success = 'Xóa bộ đề thành công!';
                    toastMessage.textContent = remove_success;
                } else if (message === 'remove_fail') {
                    var remove_fail = 'Không thể xóa bộ đề!';
                    toastMessage.textContent = remove_fail;
                } else {
                    var blank = 'Tên bộ đề không được bỏ trống!';
                    toastMessage.textContent = blank;
                }
                toast.classList.remove('hide');
                toast.classList.add('show');
                setTimeout(() => {
                    toast.classList.remove('show');
                }, 3000);
            }
        </script>
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

