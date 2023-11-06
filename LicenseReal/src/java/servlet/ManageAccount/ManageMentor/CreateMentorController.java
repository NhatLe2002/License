/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.ManageAccount.ManageMentor;

import dao.AccountDAO;
import dao.DrivingProfileDAO;
import dao.MentorDAO;
import dao.UserDAO;
import dto.AccountDTO;
import dto.DrivingProfile;
import dto.MentorDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author HOANG ANH
 */
@WebServlet(name = "CreateMentorController", urlPatterns = {"/creatementor"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class CreateMentorController extends HttpServlet {

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
        request.getRequestDispatcher("admin/manageMentor/createMentor.jsp").forward(request, response);
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
        String message = "";
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirm_password = request.getParameter("confirm_password");
        String name = new String(request.getParameter("name").getBytes("ISO-8859-1"), "UTF-8");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String dob = request.getParameter("dob");
        String cccd = request.getParameter("cccd");
        String address = new String(request.getParameter("address").getBytes("ISO-8859-1"), "UTF-8");
        boolean check = false;
        try {
            check = AccountDAO.createAccount(username, password);
            if (check) {
                AccountDTO newAccount = AccountDAO.getAccount(username, password);

                List<Part> fileParts = new ArrayList<>();
                for (Part part : request.getParts()) {
                    String partName = new String(part.getName().getBytes("iso-8859-1"), "UTF-8");
                    if (partName.startsWith("avatar")) {
                        fileParts.add(part);
                    }
                }

                for (Part filePart : fileParts) {
                    String filename = filePart.getSubmittedFileName();
                    InputStream fileContent = filePart.getInputStream();
                    InputStream content1 = fileContent;
                    byte[] imageBytes = IOUtils.toByteArray(content1);
                    String avatar = Base64.getEncoder().encodeToString(imageBytes);
                    boolean createMentor = UserDAO.createMentor(name, phone, email, dob, cccd, address, newAccount.getId(), avatar);
                    UserDTO userMentor = UserDAO.getUserbyAccountID(newAccount.getId());
                    boolean addMentor = MentorDAO.createMentor(userMentor.getId());
                    if (addMentor) {
                        message = "success";
                    } else {
                        message = "fail";
                    }
                }
            }else {
                message = "exist";
            }

        } catch (Exception e) {
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("mentorStaff").forward(request, response);
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
