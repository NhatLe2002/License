/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.DrivingProfileDAO;
import dto.MemberDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HOANG ANH
 */
@WebServlet(name = "UpdateProfileController", urlPatterns = {"/updateProfile"})
public class UpdateProfileController extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProfileController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
//        int id = Integer.parseInt(request.getParameter("id"));
        int id = 1;

        // Gọi hàm getMemberById từ lớp DrivingProfileDAO
        MemberDTO member = DrivingProfileDAO.getMemberById(id);
        HttpSession session = request.getSession();
        session.setAttribute("load_profile", member);

        // Chuyển hướng đến trang updateprofile.jsp
        response.sendRedirect("updateProfile.jsp");

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
//        int id = Integer.parseInt(request.getParameter("id"));
            String id = request.getParameter("id");
            int ID = Integer.parseInt(id);

        // Lấy các giá trị từ request parameter
        String name = new String(request.getParameter("name").getBytes("ISO-8859-1"), "UTF-8");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String dobString = request.getParameter("dob");
        LocalDate dob = LocalDate.parse(dobString);
        String cccd = request.getParameter("cccd");
        String address = request.getParameter("address");
        String avatar = request.getParameter("avatar");
//        int role = Integer.parseInt(request.getParameter("role"));
        String health = new String(request.getParameter("health").getBytes("ISO-8859-1"), "UTF-8");

        // Tạo đối tượng Member
        MemberDTO member = new MemberDTO();
        member.setId(ID);
        member.setName(name);
        member.setPhone(phone);
        member.setEmail(email);
        member.setDob(dob);
        member.setCccd(cccd);
        member.setAddress(address);
        member.setAvatar(avatar);
        member.setHealth(health);
        // Đặt các giá trị khác cho đối tượng member

        // Gọi hàm updateMember
        boolean success = DrivingProfileDAO.updateMember(member);

        if (success) {
            // Cập nhật thành công
            // Thực hiện các thao tác khác sau khi cập nhật

            // Chuyển hướng hoặc hiển thị thông báo thành công cho người dùng
            response.sendRedirect("home.jsp");
        } else {
            // Cập nhật không thành công
            // Xử lý lỗi hoặc hiển thị thông báo lỗi cho người dùng

            // Chuyển hướng hoặc hiển thị thông báo lỗi cho người dùng
            response.sendRedirect("error.jsp");
        }
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
