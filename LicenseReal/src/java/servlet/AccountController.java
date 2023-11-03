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
import dao.DrivingProfileDAO;
import dao.MemberDAO;
import dao.UserDAO;
import dto.AccountDTO;
import dto.MemberDTO;
import dto.UserDTO;
import javax.servlet.http.Cookie;
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
        MemberDTO member = new MemberDTO();
        UserDTO user = new UserDTO();
        String username;
        String password;
        String confirmPassword;
        boolean check;
        boolean checkBan;
        String url = "";
        String message = "";
        String raw_idAccount = "";
        String action = request.getParameter("action");
       
        HttpSession session = request.getSession();
        int idAccount = 0;
        try {
            switch (action) {
                case "login":

                    username = request.getParameter("username");
                    password = request.getParameter("password");
                    account = AccountDAO.getAccount(username, password);
                    checkBan = AccountDAO.checkBanAccount(username);

                    if (!checkBan) {
                        message = "Tài khoản của bạn đã bị khóa!";
                        request.setAttribute("message", message);
                        request.getRequestDispatcher("MainController?action=loginPage").forward(request, response);
                    }
                    if (account == null) {
                        message = "Sai mật khẩu hoặc tài khoản";
                        url = "login.jsp";
                    } else {
                        user = UserDAO.getUser(account.getId());
                        if (user == null) {
                            url = "user-infor.jsp";
                            message = "Bạn cần cập nhật thông tin!";
                        } else {
                            session.setAttribute("user", user);
                        }
                        if (account != null) {
                            session.setAttribute("idAccount", account.getId());
                            session.setAttribute("account", account);
                            Cookie cookie = new Cookie("userId", Integer.toString(user.getId()));
                            cookie.setMaxAge(60 * 60);
                            response.addCookie(cookie);
                        }
                        member = DrivingProfileDAO.getMemberById(user.getId());
                        if (member != null) {
                            session.setAttribute("memberID", member.getId());
                            session.setAttribute("profile", DrivingProfileDAO.getDrivingProfileById(member.getId()));
                        }

                        switch (user.getRole()) {
                            case 1:
                                session.setAttribute("ROLE", "US");
                                url = "MainController?action=member";
                                break;
                            case 2:
                                session.setAttribute("ROLE", "MT");
                                url = "MainController?action=mentor";
                                break;
                            case 3:
                                session.setAttribute("ROLE", "ST");
                                url = "MainController?action=staff";
                                break;
                            case 4:
                                session.setAttribute("ROLE", "AD");
                                url = "MainController?action=admin";
                                break;
                            default:
                                url = "login.jsp";
                                break;
                        }
                        message = "Đăng nhập thành công";
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
                            message = "Đăng ký thật bại, vui lòng nhập tài khoản khác";
                        } else {

                            account = AccountDAO.getAccount(username, password);
                            user = UserDAO.getUser(account.getId());

                            session.setAttribute("account", account);
                            session.setAttribute("user", user);
//                            if (account != null) {
//                                Cookie cookie = new Cookie("userId", Integer.toString(user.getId()));
//                                cookie.setMaxAge(60 * 60);
//                                response.addCookie(cookie);
//                            }
                            url = "user-infor.jsp";
                            message = "Tạo tài khoản thành công, bạn hãy nhập thông tin cá nhân";
                        }
                    }
                    break;
                case "getOTP":
                    username = request.getParameter("username");
                    idAccount = AccountDAO.getAccountID(username);
                    if (idAccount == -1) {
                        message = "Tài khoản không tồn tại";
                        url = "forgotPassword.jsp";
                    } else {
                        String receiveEmail = UserDAO.getEmailByID(idAccount);
                        if (receiveEmail == null) {
                            message = "Tài khoản không tồn tại";
                            url = "forgotPassword.jsp";
                        } else {
                            String newOTP = vnpay.common.Config.getRandomNumber(6);
                            url = "confirmOTP.jsp";
                            utils.Util.sendEmail(receiveEmail, newOTP);
                            session.setAttribute("email", receiveEmail);
                            session.setAttribute("OTP", newOTP);
                            session.setAttribute("idAccount", idAccount);
                            session.setAttribute("username", username);
                            int expirationTimeInSeconds = 60;
                            long expirationTimeInMillis = System.currentTimeMillis() + (expirationTimeInSeconds * 1000);
                            session.setAttribute("OTPExpirationTime", expirationTimeInMillis);
                        }
                    }
                    break;
                case "resendOTP":
                    username = request.getParameter("username");
                    idAccount = AccountDAO.getAccountID(username);
                    if (idAccount == -1) {
                        message = "Tài khoản không tồn tại" + username;
                        url = "confirmOTP.jsp";
                    } else {
                        String receiveEmail = UserDAO.getEmailByID(idAccount);
                        if (receiveEmail == null) {
                            message = "Tài khoản không tồn tại aa a" + username;
                            url = "confirmOTP.jsp";
                        } else {
                            String newOTP = vnpay.common.Config.getRandomNumber(6);
                            url = "confirmOTP.jsp";
                            utils.Util.sendEmail(receiveEmail, newOTP);
                            session.setAttribute("email", receiveEmail);
                            session.setAttribute("OTP", newOTP);
                            session.setAttribute("idAccount", idAccount);
                            session.setAttribute("username", username);
                            int expirationTimeInSeconds = 60;
                            long expirationTimeInMillis = System.currentTimeMillis() + (expirationTimeInSeconds * 1000);
                            session.setAttribute("OTPExpirationTime", expirationTimeInMillis);
                        }
                    }
                    break;
                case "confirmOTP":

                    url = "changePassword.jsp";

                    break;

                case "changePassword":
                    password = request.getParameter("password");
                    confirmPassword = request.getParameter("confirmPassword");
                    raw_idAccount = session.getAttribute("idAccount").toString();
                    idAccount = Integer.parseInt(raw_idAccount);
                    if (!confirmPassword.equals(password)) {
                        message = "Xác nhận mật khẩu sai";
                        url = "changePassword.jsp";
                    } else {
                        if (AccountDAO.changePassword(idAccount, password)) {
                            url = "login.jsp";
                            message = "Thay đổi mật khẩu thành công";
                        } else {
                            message = "Thay đổi mật khẩu thất bại";
                            url = "changePassword.jsp";
                        }
                    }
                    break;
                case "changePasswordProfile":
                    password = request.getParameter("new-password");
                    confirmPassword = request.getParameter("confirm-password");
                    raw_idAccount = session.getAttribute("idAccount").toString();
                    idAccount = Integer.parseInt(raw_idAccount);
                    if (!confirmPassword.equals(password)) {
                        message = "Xác nhận mật khẩu sai";
                        url = "passwordProfile.jsp";
                    } else {
                        if (AccountDAO.changePassword(idAccount, password)) {
                            url = "passwordProfile.jsp";
                            message = "Thay đổi mật khẩu thành công,vui lòng đăng nhập lại";
                        } else {
                            message = "Thay đổi mật khẩu thất bại";
                            url = "passwordProfile.jsp";
                        }
                    }
                    break;
                case "logout":
                    session = request.getSession();
                    if (session != null) {
                        session.invalidate();
                    }
                    url = "home.jsp";
                    break;
            }

        } catch (Exception e) {
        } finally {
            if (url.equals("MainController?action=admin")) {
                response.sendRedirect(url);
            } else {
                request.setAttribute("message", message);
                request.getRequestDispatcher(url).forward(request, response);
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
