/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.ManageAccount.ManageMentor;

import dao.MemberDAO;
import dto.MentorDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HOANG ANH
 */
@WebServlet(name = "MentorController", urlPatterns = {"/mentorStaff"})
public class MentorController extends HttpServlet {

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
            out.println("<title>Servlet MenterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MenterController at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        String message = (String) request.getAttribute("message");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        if (action.equals("deactive") || action.equals("active")) {
            String status = request.getParameter("status");
            String mentorID = request.getParameter("id");
            request.setAttribute("status", status);
            request.setAttribute("mentorID", mentorID);
            doPost(request, response);
        } else {
            try {
                ArrayList<MentorDTO> list = MemberDAO.getAllMentor();
                request.setAttribute("list_member", list);
            } catch (Exception ex) {
            }
            request.setAttribute("message", message);
            request.getRequestDispatcher("staff/mentorManagement.jsp").forward(request, response);
        }
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
        String status = (String) request.getAttribute("status");
        String mentorID = (String) request.getAttribute("mentorID");
        MemberDAO dao = new MemberDAO();
        String message = (String) request.getAttribute("message");
        if (message != null) {
            request.setAttribute("message", message);
            doGet(request, response);
        } else {
            try {
                boolean checkUpdate = dao.updateStatusMentor(mentorID, status);
                if (checkUpdate) {
                    message = "success";
                } else {
                    message = "fail";
                }
                ArrayList<MentorDTO> list = MemberDAO.getAllMentor();
                request.setAttribute("list_member", list);
            } catch (Exception e) {
            }
            request.setAttribute("message", message);
            request.getRequestDispatcher("staff/mentorManagement.jsp").forward(request, response);
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
