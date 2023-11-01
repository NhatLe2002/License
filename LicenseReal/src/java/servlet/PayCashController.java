/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.PaymentDAO;
import dto.PaymentDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "PayCash", urlPatterns = {"/PayCashController"})
public class PayCashController extends HttpServlet {

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
        boolean check_cash_type = true;
        String message = "";
        String url = "";
        String type = request.getParameter("type");
        float price = Float.parseFloat(request.getParameter("price"));
        String cash_type = request.getParameter("cash_type");
        int memberID = Integer.parseInt(session.getAttribute("memberID").toString());
        if (cash_type.equalsIgnoreCase("VNPAY")) {
            check_cash_type = true;
        } else {
            check_cash_type = false;
        }

        try {
            if (type.equals("regisTest")) {
                if (session.getAttribute("profile") == null) {
                    message = "Bạn cần bổ sung hồ sơ thi trước khi đăng ký";
                    url = "MainController?action=paymentPage";
                } else {
                    if (!check_cash_type) {
                        PaymentDAO.createPayment(memberID, price, type, false, check_cash_type);
                        message = "Đăng ký gói thành công, mời quý khách hàng tới quầy để thanh toán";
                        url = "MainController?action=ViewTransactions";

                    } else {
                        session.setAttribute("cash_type", cash_type);
                        session.setAttribute("type", type);
                        session.setAttribute("amount", request.getParameter("price"));
                        session.setAttribute("language", request.getParameter("language"));
                        url = "PaymentController";
                    }
                }

            } else {
                if (!check_cash_type) {
                    PaymentDAO.createPayment(memberID, price, type, false, check_cash_type);
                    message = "Đăng ký gói thành công, mời quý khách hàng tới quầy để thanh toán";
//              
                    url = "MainController?action=ViewTransactions";

                } else {
                    session.setAttribute("cash_type", cash_type);
                    session.setAttribute("type", type);
                    session.setAttribute("amount", request.getParameter("price"));
                    session.setAttribute("language", request.getParameter("language"));
                    url = "PaymentController";
                }
            }

//            int amount = (Integer.parseInt(request.getParameter("amount")) / 100);
        } catch (Exception e) {
        }
        request.setAttribute("message", message);
        request.getRequestDispatcher(url).forward(request, response);
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
