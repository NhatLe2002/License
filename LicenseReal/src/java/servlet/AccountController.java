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
import dao.UserDAO;
import dto.AccountDTO;
import dto.UserDTO;
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
        AccountDTO account = new AccountDTO();
        UserDTO user = new UserDTO();
        String username;
        String password;
        String confirmPassword;
        boolean check;
        String url = "";
        String message = "";
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        try {
            switch (action) {
                case "login":
                    username = request.getParameter("username");
                    password = request.getParameter("password");
                    account = AccountDAO.getAccount(username, password);

                    if (account == null) {
                        message = "Sai mật khẩu hoặc tài khoản";
                        url = "login.jsp";
                    } else {
                        user = UserDAO.getUser(account.getId());
                        message = "Đăng nhập thành công";
                        url = "home.jsp";
                    }
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
                        if (check == false) {
                            url = "register.jsp";
                            message = "Tài khoản đã tồn tại";
                        } else {
                            account = AccountDAO.getAccount(username, password);
                            user = UserDAO.getUser(account.getId());
                            if (check) {
                                url = "user-infor.jsp";
                                message = "Tạo tài khoản thành công, bạn hãy nhập thông tin cá nhân";
                            } else {
                                message = "Đăng ký thất bại";
                            }
                        }
                    }
                    break;
            }
        } catch (Exception e) {

        } finally {
            session.setAttribute("account", account);
            session.setAttribute("user", user);
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
