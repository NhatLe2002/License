/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.ManageAccount.ManageStaff;

import dao.AccountDAO;
import dao.UserDAO;
import dto.AccountDTO;
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
 * @author Admin
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class CreateStaffServlet extends HttpServlet {

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
            boolean check = false;
            if (request.getParameter("username") != null) {
                String actionManage = request.getParameter("actionManage");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String confirm_password = request.getParameter("confirm_password");
                String name = new String(request.getParameter("name").getBytes("ISO-8859-1"), "UTF-8");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String dob = request.getParameter("dob");
                String cccd = request.getParameter("cccd");
                String address = new String(request.getParameter("address").getBytes("ISO-8859-1"), "UTF-8");
                String message = "";
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
                            boolean success = UserDAO.createStaff(name, phone, email, dob, cccd, address, newAccount.getId(), avatar);
                        }
                    } else {
                        message = "exist";
                        request.setAttribute("message", message);
                    }
                } catch (Exception e) {
                }

                request.setAttribute("actionManage", actionManage);
                request.getRequestDispatcher("ListStaff").forward(request, response);
            } else {
                ArrayList<AccountDTO> listAccount = AccountDAO.getAllAccount();
                String actionManage = request.getParameter("actionManage");
                request.setAttribute("listAccount", listAccount);
                request.setAttribute("actionManage", actionManage);
                request.getRequestDispatcher("admin/manageStaff/manageStaff.jsp").forward(request, response);
            }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
