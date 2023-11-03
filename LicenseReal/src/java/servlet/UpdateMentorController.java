/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.DrivingProfileDAO;
import dto.MemberDTO;
import dto.MentorDTO;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author HOANG ANH
 */
@WebServlet(name = "UpdateMentorController", urlPatterns = {"/updateMentor"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class UpdateMentorController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String ID = request.getParameter("id");
        int id = 0; // Giá trị mặc định
        String action = request.getParameter("action");

        if (ID != null && !ID.isEmpty()) {
            try {
                id = Integer.parseInt(ID);
            } catch (NumberFormatException e) {
                // Xử lý lỗi NumberFormatException tại đây
            }
        }

        // Gọi hàm getMemberById từ lớp DrivingProfileDAO
        MentorDTO mentor = DrivingProfileDAO.getMentorById(id);
        session.setAttribute("action", action);
        session.setAttribute("load_profile", mentor);

        request.setAttribute("load_profile", mentor);

        // Chuyển hướng đến trang updateprofile.jsp
        request.getRequestDispatcher("updateProfileMentor.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        int ID = Integer.parseInt(id);
        String message = "";

        // Lấy các giá trị từ request parameter
        String name = new String(request.getParameter("name").getBytes("ISO-8859-1"), "UTF-8");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String dobString = request.getParameter("dob");
        LocalDate dob = LocalDate.parse(dobString);
        LocalDate currentDate = LocalDate.now();
        LocalDate minValidDate = currentDate.minusYears(25);
        String cccd = request.getParameter("cccd");
        String address = new String(request.getParameter("address").getBytes("ISO-8859-1"), "UTF-8");
        String certificate = new String(request.getParameter("certificate").getBytes("ISO-8859-1"), "UTF-8");
        String experience = new String(request.getParameter("experience").getBytes("ISO-8859-1"), "UTF-8");

        String image = "";
        boolean success = false;

        // Tạo đối tượng Mentor
        MentorDTO mentor = new MentorDTO();
        mentor.setUserID(ID);
        mentor.setName(name);
        mentor.setPhone(phone);
        mentor.setEmail(email);
        mentor.setDob(dob);
        mentor.setCccd(cccd);
        mentor.setAddress(address);
        mentor.setCertificate(certificate);
        mentor.setExperience(experience);

        String avatar = mentor.getAvatar();
        List<Part> fileParts = new ArrayList<>();
        for (Part part : request.getParts()) {
            String partName = new String(part.getName().getBytes("iso-8859-1"), "UTF-8");
            if (partName.equals("avatar")) {
                fileParts.add(part);
            }
        }
        for (Part filePart : fileParts) {
            String filename = filePart.getSubmittedFileName();
            InputStream fileContent = filePart.getInputStream();
            byte[] imageBytes = IOUtils.toByteArray(fileContent);
            String data = Base64.getEncoder().encodeToString(imageBytes);
            if (data.isEmpty()) {
                MentorDTO img = DrivingProfileDAO.getMentorById(ID);
                image = img.getAvatar();
            }

            if (filePart.getName().equals("avatar")) {
                avatar = data;
            }
            mentor.setAvatar(avatar);

            if (dob.isAfter(currentDate) || dob.isAfter(minValidDate)) {
                // Ngày sinh không hợp lệ, xử lý thông báo lỗi
                message = "notenough";
            } else {
                if (avatar.isEmpty()) {
                    success = DrivingProfileDAO.updateMentor(mentor, image);
                } else {
                    success = DrivingProfileDAO.updateMentor(mentor, avatar);
                }

                if (success) {
                    // Cập nhật thành công
                    // Thực hiện các thao tác khác sau khi cập nhật
                    message = "success";
                } else {
                    // Cập nhật không thành công
                    // Xử lý lỗi hoặc hiển thị thông báo lỗi cho người dùng
                    message = "fail";
                }
            }
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("updateProfileMentor.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
