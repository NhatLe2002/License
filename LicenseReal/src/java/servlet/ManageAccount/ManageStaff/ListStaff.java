/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.ManageAccount.ManageStaff;

import dao.MemberDAO;
import dao.UserDAO;
import dto.MentorDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class ListStaff extends HttpServlet {

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
        String message = (String) request.getAttribute("message");
        if (message == null || message.isEmpty()) {
            message = "";
        }
        request.setAttribute("message", message);
        try (PrintWriter out = response.getWriter()) {
            String actionManage = request.getParameter("actionManage");
            List<UserDTO> listStaff = UserDAO.getListByRole(3);
            request.setAttribute("actionManage", actionManage);
            request.setAttribute("listStaff", listStaff);
            request.getRequestDispatcher("admin/manageStaff/manageStaff.jsp").forward(request, response);
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
        String actionManage = request.getParameter("actionManage");
        if (actionManage == null) {
            String status = request.getParameter("status");
            String staffID = request.getParameter("id");
            MemberDAO dao = new MemberDAO();
            String message = "";
            try {
                boolean checkUpdate = dao.updateStatusStaff(staffID, status);
                if (checkUpdate) {
                    message = "success";
                } else {
                    message = "fail";
                }
            } catch (Exception e) {
            }
            request.setAttribute("message", message);
            request.getRequestDispatcher("MainController?action=manageStaff&actionManage=read").forward(request, response);
        } else {
            request.setAttribute("actionManage", actionManage);
            processRequest(request, response);
        }

    }

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
