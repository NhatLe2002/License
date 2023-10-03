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
    </head>
    <body>
        <div class="table-name">
            <h1>CHỈNH SỬA THÔNG TIN</h1>
        </div>
        <form action="updateProfile" method="POST">
            <div class="update-box">
                <input value="${load_profile.id}" type="text" name="id" id="id" hidden="" />
                <div class="update-title">
                    <label for="name">Tên</label>
                    <input value="${load_profile.name}" type="text" name="name" id="name" />
                </div>
                <div class="update-title">
                    <label for="phone">Số điện thoại</label>
                    <input value="${load_profile.phone}" type="text" name="phone" id="phone" />
                </div>
                <div class="update-title">
                    <label for="email">Email</label>
                    <input value="${load_profile.email}" type="text" name="email" id="email" />
                </div>
                <div class="update-title">
                    <label for="dob">Ngày sinh</label>
                    <input value="${load_profile.dob}" type="date" name="dob" id="dob" />
                </div>
                <div class="update-title">
                    <label for="cccd">CCCD</label>
                    <input value="${load_profile.cccd}" type="text" name="cccd" id="cccd" />
                </div>
                <div class="update-title">
                    <label for="address">Địa chỉ</label>
                    <input value="${load_profile.address}" type="text" name="address" id="address" />
                </div>
                <div class="update-title">
                    <label for="avatar">Avatar</label>
    <!--                <input value="${load_profile.avatar}" type="text" name="avatar" id="avatar" />-->
                    <input type="file" name="avatar" id="fileInput" onchange="previewImage(event)" accept="image/*" />
                    <div class="file-img">
                        <img id="preview" src="data:image;base64,${ns.data}" width="50px" height="50px" alt="Preview">
                    </div>
                </div>
                <div class="update-title">
                    <label for="health">Tình trạng sức khỏe</label>
                    <input value="${load_profile.health}" type="text" name="health" id="health" />
                </div>
            </div>
            <a href="addtodrivingpro?id=?">Add to drivingprofile</a>                                   
            <div class="table-btn">
                <button type="submit">UPDATE</button>
            </div>
        </form>
    </body>
</html>
