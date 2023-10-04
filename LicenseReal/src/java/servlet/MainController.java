/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class MainController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private String url = "errorpage.html";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            String message = (String) request.getAttribute("message");
            request.setAttribute("message", message);
            if (action == null || action.equals("")) {
                url = "home.jsp";
            } else if (action.equals("getItem")) {
                url = "LoadItemServlet";
            } else if (action.equals("login")) {
                url = "AccountController";
            } else if (action.equals("register")) {
                url = "AccountController";
            }else if (action.equals("regisSchedule")) {
                url = "RegistScheduleServlet";
            }else if (action.equals("regisScheduleBtn")) {
                url = "RegistScheduleServlet";
            }else if (action.equals("viewSchedule")) {
                url = "ViewScheduleServlet";
            }else if (action.equals("viewScheduleMember")) {
                url = "ViewScheduleMemberServlet";
            }else if (action.equals("regisScheduleByMember")) {
                url = "RegisScheduleByMemberServlet";
            }else if (action.equals("regisScheduleMemberBtn")) {
                url = "RegisScheduleByMemberServlet";
            }
            
//            else if (action.equals("viewScheduleServlet")) {
//                url = "ViewScheduleServlet";
//            }
            else if (action.equals("schedule")) {
                url = "ScheduleServlet";
            } else if (action.equals("QuestionController")) {
                url = "QuestionController";
            } else if (action.equals("insertQ&A")) {
                url = "addQuestion.jsp";
            } else if (action.equals("update")) {
                url = "UserController";
            }
            request.setAttribute("action", action);
            request.getRequestDispatcher(url).forward(request, response);

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
