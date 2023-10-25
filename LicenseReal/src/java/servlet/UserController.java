/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.DrivingProfileDAO;
import dao.MemberDAO;
import dao.UserDAO;
import dto.AccountDTO;
import dto.MemberDTO;
import dto.UserDTO;

import java.io.IOException;

import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author emcua
 */
@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

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
        HttpSession session = request.getSession();

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        Date dob = Date.valueOf(request.getParameter("dob"));
        String cccd = request.getParameter("cccd");
        String address = request.getParameter("address");
        int accountID = Integer.parseInt(request.getParameter("accountID"));
        String url = "user-infor.jsp";
        String message = "";
        int check;
        MemberDTO member = new MemberDTO();
        UserDTO user = new UserDTO();

        try {

            if (UserDAO.getUser(accountID) == null) {
                check = UserDAO.createUser(name, phone, email, dob, cccd, address, accountID);
                user = UserDAO.getUser(accountID);
                switch (check) {
                    case 0:
                        message = "Cập nhập thành công";
                        MemberDAO.createMember(user.getId());
                        member = DrivingProfileDAO.getMemberById(user.getId());
                        if (member != null) {
                            session.setAttribute("memberID", member.getId());
                        }
                        session.setAttribute("ROLE", "US");
                        url = "MainController?action=member";
                        break;
                    case 1:
                        message = "Số điện thoại sai định dạng";
                        break;
                    case 2:
                        message = "Email sai định dạng";
                        break;
                    case 3:
                        message = "Chọn ngày không hợp lệ";
                        break;
                    case 4:
                        message = "Yêu cầu số tuổi lớn hơn 18";
                        break;
                }

            } else {
                check = UserDAO.updateUser(name, phone, email, dob, cccd, address, accountID);
                user = UserDAO.getUser(accountID);
                switch (check) {
                    case 0:
                        message = "Cập nhập thành công";
                        MemberDAO.createMember(user.getId());
                        member = DrivingProfileDAO.getMemberById(user.getId());
                        if (member != null) {
                            session.setAttribute("memberID", member.getId());
                        }
                        url = "home.jsp";
                        break;
                    case 1:
                        message = "Số điện thoại sai định dạng";
                        break;
                    case 2:
                        message = "Email sai định dạng";
                        break;
                    case 3:
                        message = "Chọn ngày không hợp lệ";
                        break;
                    case 4:
                        message = "Yêu cầu số tuổi lớn hơn 18";
                        break;
                }

            }
        } catch (Exception e) {
        } finally {
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
