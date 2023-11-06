/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.User;

import dao.MemberDAO;
import dto.MemberDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MemberController", urlPatterns = {"/memberStaff"})
public class MemberController extends HttpServlet {

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String message = (String) request.getAttribute("message");
            String action = request.getParameter("action");
            if (action.equals("deactive") || action.equals("active")) {
                String status = request.getParameter("status");
                String memberID = request.getParameter("id");
                request.setAttribute("status", status);
                request.setAttribute("memberID", memberID);
                doPost(request, response);
            } else {
                ArrayList<MemberDTO> list = MemberDAO.getAllMember();
                request.setAttribute("list_member", list);
                request.setAttribute("message", message);
            }
            request.setAttribute("message", message);
        } catch (Exception e) {
        }
        request.getRequestDispatcher("staff/memberManagement.jsp").forward(request, response);

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
        String memberID = (String) request.getAttribute("memberID");
        MemberDAO dao = new MemberDAO();
        String message = "";
        try {
            boolean checkUpdate = dao.updateStatusMember(memberID, status);
            if (checkUpdate) {
                message = "success";
            } else {
                message = "fail";
            }
            ArrayList<MemberDTO> list = MemberDAO.getAllMember();
            request.setAttribute("list_member", list);
        } catch (Exception e) {
        }
        request.setAttribute("message", message);
        request.getRequestDispatcher("staff/memberManagement.jsp").forward(request, response);
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
