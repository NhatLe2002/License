<%-- 
    Document   : adddriprofile
    Created on : Oct 3, 2023, 9:22:48 AM
    Author     : HOANG ANH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="table-name">
            <h1>CHỈNH SỬA THÔNG TIN</h1>
        </div>
        <form  id="myForm" action="addtodrivingpro" method="POST" enctype="multipart/form-data">
            <div class="update-box">
                <label for="name">ID: </label><input value="${load_profile.id}" type="text" name="id" id="id" />
                <div class="update-title">
                    <label for="name">Tên</label>
                    <input value="${load_profile.name}" type="text" name="name" id="name" readonly/>
                </div>
                <div class="update-title">
                    <label for="phone">Số điện thoại</label>
                    <input value="${load_profile.phone}" type="text" name="phone" id="phone" readonly/>
                </div>
                <div class="update-title">
                    <label for="email">Email</label>
                    <input value="${load_profile.email}" type="text" name="email" id="email" readonly/>
                </div>
                <div class="update-title">
                    <label for="dob">Ngày sinh</label>
                    <input value="${load_profile.dob}" type="date" name="dob" id="dob" readonly/>
                </div>
                <div class="update-title">
                    <label for="cccd">CCCD</label>
                    <input value="${load_profile.cccd}" type="text" name="cccd" id="cccd" readonly/>
                </div>
                <div class="update-title">
                    <label for="address">Địa chỉ</label>
                    <input value="${load_profile.address}" type="text" name="address" id="address" readonly/>
                </div>
                <div class="update-title">
                    <label for="health">Tình trạng sức khỏe</label>
                    <input value="${load_profile.health}" type="text" name="health" id="health" readonly/>
                </div>
                <div class="update-title">
                    <label for="img_cccd">Ảnh CCCD</label>
                    <input type="file" name="img_cccd" id="fileInputCCCD" onchange="previewImage(event, 'previewCCCD')" accept="image/*" />
                    <div class="file-img">
                        <img id="previewCCCD" src="data:image;base64," width="50px" height="50px" alt="Preview">
                    </div>
                </div>
                <div class="update-title">
                    <label for="img_user">Ảnh 3x4</label>
                    <input type="file" name="img_user" id="fileInputUser" onchange="previewImage(event, 'previewUser')" accept="image/*" />
                    <div class="file-img">
                        <img id="previewUser" src="data:image;base64," width="50px" height="50px" alt="Preview">
                    </div>
                </div>
            </div>
            <!--<a href="addtodrivingpro?id=?">Add to drivingprofile</a>-->                                   
            <div class="table-btn">
                <button type="submit">UPDATE</button>
            </div>
        </form>
    </body>
    <script>
        function previewImage(event, previewId) {
            var reader = new FileReader();
            reader.onload = function () {
                var output = document.getElementById(previewId);
                output.src = reader.result;
            };

            var fileInput = event.target;
            var files = fileInput.files;

            if (files.length > 0) {
                reader.readAsDataURL(files[0]);
            } else {
                var output = document.getElementById(previewId);
                output.src = ""; // Xóa ảnh xem trước khi không có tệp được chọn
            }
        }
    </script>
    <script>
        document.getElementById("myForm").addEventListener("submit", function () {
            var idValue = document.getElementById("id").value;
            console.log("ID value: " + idValue);
        });
    </script>
</html>
