<%-- 
    Document   : updateProfile
    Created on : Oct 2, 2023, 4:36:04 PM
    Author     : HOANG ANH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="editProfile.css" />
    </head>
    <body>
        <div id="content">
            <div class="container bootstrap snippets bootdey">
                <h1 class="text-primary">Edit Profile</h1>
                <form action="updateProfile" method="POST" enctype="multipart/form-data">
                    <hr />
                    <div class="row">
                        <!-- left column -->
                        <div class="col-md-3">
                            <div class="text-center">
                                <input class="avatar img-circle img-thumbnail" type="file" name="avatar" id="fileInput" onchange="previewImage(event)" accept="image/*" />
                                <h3 style="font-weight: 700; margin-top: 10px;">ADMIN</h3>
                                <div class="file-img">
                                    <img id="preview" src="data:image;base64,${load_profile.avatar}" alt="Preview">
                                </div>
                            </div>
                        </div>

                        <!-- edit form column -->
                        <div class="col-md-9 personal-info">
                            <h2>Personal Information</h2>


                            <div class="form-group">
                                <h4>Information</h4>
                                <input value="${load_profile.id}" type="text" name="id" id="id" hidden="" />
                                <div class="form-group-item">
                                    <label class="col-lg-3 control-label">Tên :</label>
                                    <div class="col-lg-9">
                                        <input type="text" class="form-control" oninput="validateFullName()" id="input-fullname" name="name" value="${load_profile.name}" required=""/>
                                    </div>
                                    <span id="error-fullname" class="error-message" style="color: red;"></span>
                                </div>
                                <div class="form-group-item">
                                    <label class="col-lg-3 control-label"
                                           >Phone :</label>
                                    <div class="col-lg-9">
                                        <input type="tel" class="form-control" oninput="validatePhone()" maxlength="10" id="input-phone" name="phone" value="${load_profile.phone}" required/>
                                    </div>
                                </div>
                                <div class="form-group-item">
                                    <label class="col-lg-3 control-label">Ngày sinh :</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="date" name="dob" value="${load_profile.dob}" />
                                    </div>
                                </div>
                                <div class="form-group-item">
                                    <label class="col-lg-3 control-label">Email :</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="text" name="email" value="${load_profile.email}" />
                                    </div>
                                </div>

                                <div class="form-group-item">
                                    <label class="col-lg-3 control-label">CCCD :</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="text" name="cccd" value="${load_profile.cccd}"  />
                                    </div>
                                </div>
                                <div class="form-group-item">
                                    <label class="col-lg-3 control-label">Địa chỉ :</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="text" name="address" value="${load_profile.address}" />
                                    </div>
                                </div>
                                <div class="form-group-item">
                                    <label class="col-lg-3 control-label" for="health">Giấy khám sức khỏe</label>
                                    <select  class="col-lg-9" name="health" id="health">
                                        <option value="Đã có" ${load_profile.health == 'Đã có' ? 'selected' : ''}>Đã có</option>
                                        <option value="Chưa có" ${load_profile.health == 'Chưa có' ? 'selected' : ''}>Chưa có</option>
                                    </select>
                                </div>
                            </div>
                            <a href="addtodrivingpro?id=?">Add to drivingprofile</a>                                   
                            <div class="table-btn">
                                <button type="submit">UPDATE</button>
                                </form>

                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </body>
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
                reader.readAsDataURL(files[0]);
            } else {
                // Nếu không có file được chọn, đặt lại ảnh về trạng thái ban đầu
                var output = document.getElementById("preview");
                output.src = "#";
            }
        }
        var checkFullName = true;
        function validatePhone() {
            var input = document.getElementById('input-phone');
            var value = input.value;

            // Remove any non-numeric characters
            var numericValue = value.replace(/[^0-9]/g, '');

            // Truncate the value if it exceeds the maximum length
            if (numericValue.length > 10) {
                numericValue = numericValue.substring(0, 10);
            }

            // Update the input value
            input.value = numericValue;
        }

        var pwd = true;
        var confirmPwd = true;

        function validateFullName() {
            var input = document.getElementById('input-fullname');
            var value = input.value;
            var isValid = /^[a-zA-Z\s]+$/.test(value); // Check for only alphabet characters and blank spaces
            if (!isValid) {
                checkFullName = false;
                // Invalid input
                document.getElementById('error-fullname').textContent = "Input must contain only alphabet characters and blank space";
            } else {
                checkFullName = true;
                // Clear the error message
                document.getElementById('error-fullname').textContent = "";
            }
        }

        function submitForm() {
            if (checkFullName) {
                if (document.getElementById('oldPwd').value !== '') {
                    if (document.getElementById('input-pwd').value !== '') {
                        if (pwd && confirmPwd) {
                            document.getElementById('frm-edit').submit();
                        } else {
                            alert("Please check your information again!");
                        }
                    } else {
                        alert("Please input your new password!");
                    }
                } else {
                    document.getElementById('frm-edit').submit();
                }
            } else {
                alert("Please check your information again!");
            }
        }

    </script>
</html>
