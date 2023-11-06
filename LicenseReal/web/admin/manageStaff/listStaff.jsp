<%-- 
    Document   : listStaff
    Created on : Nov 3, 2023, 12:05:45 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
        <div class="container-xxl flex-grow-1 container-p-y">
            <div class="card">
                <h5
                    class="card-header"
                    style="display: flex; justify-content: space-between"
                    >
                    <div>Danh sách nhân viên</div>
                    <!-- Button trigger modal -->
                    <div>
                        <a href="MainController?action=manageStaff&actionManage=create">
                            <button type="button" class="btn btn-primary" style="padding: 0.8rem"><i class="fas fa-plus"></i></button>
                        </a>
                    </div>
                </h5>
                <div class="table-responsive text-nowrap">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>Tên</th>
                                <th>Số điện thoại</th>
                                <th>Email</th>
                                <th>Căn cước</th>
                                <th>Tình trạng nhân viên</th>
                                <th>Tính năng</th>
                            </tr>
                        </thead>
                        <tbody class="table-border-bottom-0" >
                            <c:forEach var="list" items="${listStaff}" varStatus="counter">
                                <tr>
                                    <td>
                                        <span class="fw-medium">${counter.count}</span>
                                    </td>
                                    <td> ${list.name}</td>
                                    <td>${list.phone}</td>
                                    <td>${list.email}</td>
                                    <td>
                                        ${list.cccd}
                                    </td>
                                    <td>
                                        <c:if test="${list.status eq 'true'}">
                                            <span class="text-success fw-medium" style="color:#fba265">Đang hoạt động</span>
                                        </c:if>
                                        <c:if test="${list.status eq 'false'}">
                                            <span class="text-danger fw-medium">Đã bị chặn</span>
                                        </c:if>
                                    </td>
                                    <td>
                                        <div class="dropdown">
                                            <button
                                                type="button"
                                                class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown"
                                                >
                                                <i class="bx bx-dots-vertical-rounded"></i>
                                            </button>
                                            <div class="dropdown-menu">

                                                <c:if test="${list.status eq 'true'}">
                                                    <a  style="cursor: pointer"
                                                        class="dropdown-item"
                                                        data-toggle="tooltip"
                                                        data-bs-toggle="modal" 
                                                        data-bs-target="#modalConfirmDeactive" 
                                                        onclick="showDeactive('${list.id}')"
                                                        ><i class="fa-solid fa-ban me-1"></i> Chặn người dùng</a
                                                    >
                                                </c:if>
                                                <c:if test="${list.status eq 'false'}">
                                                    <a style="cursor: pointer"
                                                       class="dropdown-item"
                                                       data-toggle="tooltip"
                                                       data-bs-toggle="modal"
                                                       data-bs-target="#modalConfirmActive" 
                                                       onclick="showActive('${list.id}')"
                                                       ><i class="fa-solid fa-arrow-rotate-left me-1"></i> Bỏ chặn người dùng</a
                                                    >
                                                </c:if>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
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
                        <h5 class="modal-title" id="staticBackdropLabel">XÁC NHẬN CHẶN NHÂN VIÊN</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Bạn có chắc muốn chặn nhân viên này?
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
                        <h5 class="modal-title" id="staticBackdropLabel">XÁC NHẬN BỎ CHẶN NHÂN VIÊN</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Bạn có chắc muốn bỏ chặn nhân viên này?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <button type="button" class="btn btn-primary" id="btn-toast-active" class="btn-close"
                                data-bs-dismiss="modal" aria-label="Close">Xác nhận</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- toast thông báo thành công-->
        <c:if test="${not empty message}">
            <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
                <div id="toast-notification" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
                    <div class="toast-header">
                        <c:if test="${message eq 'success'}">
                            <strong id="toast-message" class="me-auto text-success"></strong>
                        </c:if>
                        <c:if test="${message eq 'fail'}">
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
        <script>
            function showDeactive(id) {
                var btnToastDelete = document.querySelector('#btn-toast-deactive');
                btnToastDelete.addEventListener('click', function () {
                    var deleteUrl = 'ListStaff?status=1&id=' + id;
                    window.location.href = deleteUrl;
                    // Nếu bạn muốn ẩn modal sau khi xác nhận, bạn có thể sử dụng đoạn mã sau:
                    document.getElementById('modalConfirmDeactive').style.display = 'none';
                });
            }
            function showActive(id) {
                var btnToastDelete = document.querySelector('#btn-toast-active');
                btnToastDelete.addEventListener('click', function () {
                    var deleteUrl = 'ListStaff?status=0&id=' + id;
                    window.location.href = deleteUrl;
                    // Nếu bạn muốn ẩn modal sau khi xác nhận, bạn có thể sử dụng đoạn mã sau:
                    document.getElementById('modalConfirmActive').style.display = 'none';
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
                    var fail = 'Cập nhật trạng thái thất bại!';
                    toastMessage.textContent = fail;
                } else {
                    var exist = 'Tài khoản đã tồn tại!';
                    toastMessage.textContent = exist;
                }
                toast.classList.remove('hide');
                toast.classList.add('show');
                setTimeout(() => {
                    toast.classList.remove('show');
                }, 3000);
            }
        </script>
    </body>
</html>
