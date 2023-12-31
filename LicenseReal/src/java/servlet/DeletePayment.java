/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.MemberDAO;
import dao.PaymentDAO;
import dto.MemberDTO;
import dto.PaymentDTO;
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
 * @author emcua
 */
@WebServlet(name = "DeletePayment", urlPatterns = {"/DeletePayment"})
public class DeletePayment extends HttpServlet {

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
        int idPayment = Integer.parseInt(request.getParameter("id"));
        PaymentDAO pay = new PaymentDAO();
        ArrayList<PaymentDTO> listP = new ArrayList<>();
        ArrayList<String> memberNames = new ArrayList<>();

        try {
            pay.deletePayment(idPayment);
            listP = PaymentDAO.getAllPayment();
            String memberID = request.getParameter("id");

            for (PaymentDTO paylist : listP) {
                int memberid = paylist.getMemberID();
                MemberDTO member = MemberDAO.getNameByMemberID(memberid);
                memberNames.add(member.getName()); // Thêm tên vào danh sách tên thành viên
            }
        } catch (Exception e) {
            // Xử lý ngoại lệ
        }

        request.setAttribute("memberNames", memberNames);
        request.setAttribute("listP", listP);
        request.getRequestDispatcher("historyTransactions.jsp").forward(request, response);

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
