/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.AccountDAO;
import dto.Account;
import javax.servlet.http.HttpSession;

/**
 *
 * @author emcua
 */
public class AccountController extends HttpServlet {

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
        Account account = new Account();
        String username;
        String password;
        String confirmPassword;
        boolean check;
        String url = "home.jsp";
        String message = "";
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        try {
            switch (action) {
                case "login":
                    username = request.getParameter("username");
                    password = request.getParameter("password");
                    account = AccountDAO.getAccount(username, password);
                    message = "Đăng nhập thành công";
                    
                    break;
                case "register":
                    username = request.getParameter("username");
                    password = request.getParameter("password");
                    confirmPassword = request.getParameter("confirmPassword");
                    if (!confirmPassword.equals(password)) {
                        message = "Xác nhận mật khẩu sai";
                        url = "register.jsp";
                    } else {
                        check = AccountDAO.createAccount(username, password);
                        if (check) {
                            message = "Đăng ký thành công";
                        } else {
                            message = "Đăng ký thất bại";
                        }
                    }
                    break;
            }
        } catch (Exception e) {
            message = "Incorrect password or username";
        } finally {
            session.setAttribute("account", account);
            request.setAttribute("message", message);
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
