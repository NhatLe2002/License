/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.DrivingProfileDAO;
import dto.MemberDTO;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
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

@WebServlet(name = "AddDrivingProfileController", urlPatterns = {"/addtodrivingpro"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class AddDrivingProfileController extends HttpServlet {

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
            out.println("<title>Servlet AddDrivingProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddDrivingProfileController at " + request.getContextPath() + "</h1>");
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

        // Chuyển hướng đến trang adddrivingprofile.jsp
        response.sendRedirect("adddrivingprofile.jsp");
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
        
        String id = request.getParameter("id");
        System.out.println("ID value received: " + id);
        int memberID = Integer.parseInt(id);
        // Tạo đối tượng Member
        boolean checkDuplicate;
        String message = "";

        try {
            DrivingProfileDAO dao = new DrivingProfileDAO();
            checkDuplicate = dao.checkDuplicateMemberID(memberID);
            if (!checkDuplicate) {
                List<Part> fileParts = new ArrayList<>();
                for (Part part : request.getParts()) {
                    String partName = new String(part.getName().getBytes("iso-8859-1"), "UTF-8");
                    if (partName.equals("img_cccd") || partName.equals("img_user")) {
                        fileParts.add(part);
                    }
                }

                String img_cccd = null;
                String img_user = null;

                for (Part filePart : fileParts) {
                    String filename = filePart.getSubmittedFileName();
                    InputStream fileContent = filePart.getInputStream();
                    byte[] imageBytes = IOUtils.toByteArray(fileContent);
                    String data = Base64.getEncoder().encodeToString(imageBytes);

                    if (filePart.getName().equals("img_cccd")) {
                        img_cccd = data;
                    } else if (filePart.getName().equals("img_user")) {
                        img_user = data;
                    }
                }

                boolean checkInsert = DrivingProfileDAO.addtodrivingprofile(memberID, img_cccd, img_user);
                if (checkInsert) {
                    message = "Create driving profile successfully!";
                } else {
                    message = "Can't create driving profile!";
                }
            } else {
                message = "Duplicate member ID!";
            }
        } catch (SQLException ex) {
            response.getWriter().println("ERROR: " + ex.getMessage());
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
