/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.DrivingProfile;

import dao.DrivingProfileDAO;
import dao.PaymentDAO;
import dto.DrivingProfile;
import dto.PaymentDTO;
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

/**
 *
 * @author HOANG ANH
 */
@WebServlet(name = "DrivingProfileStaffController", urlPatterns = {"/drivingstaff"})
public class DrivingProfileStaffController extends HttpServlet {

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
            out.println("<title>Servlet DrivingProfileStaffController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DrivingProfileStaffController at " + request.getContextPath() + "</h1>");
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

        String action = request.getParameter("action");
        if (action.equals("deactive") || action.equals("active")) {
            String status = request.getParameter("status");
            String memberID = request.getParameter("id");
            request.setAttribute("status", status);
            request.setAttribute("memberID", memberID);
            doPost(request, response);
        } else {
            String message = (String) request.getAttribute("message");
            try {

                boolean status1 = false;
                ArrayList<DrivingProfile> list = DrivingProfileDAO.getAllDrivingProfile();
                for (DrivingProfile drivingProfile : list) {
                    int memberid = drivingProfile.getMemberID();
                    DrivingProfile mem = DrivingProfileDAO.getDrivingProfileById(memberid);
                    boolean flag = mem.isFlag();
                    ArrayList<PaymentDTO> listpay = PaymentDAO.getPaymentByID(memberid);
                    for (PaymentDTO payment : listpay) {
                        status1 = payment.isStatus();
                    }
                    if (flag == status1) {
                        // xử lí kết quả thanh toán tại đây 
                        flag = true;
                        drivingProfile.setFlag(flag);
                    } else {
                        flag = false;
                        drivingProfile.setFlag(flag);
                    }
                }

                request.setAttribute("list_driving", list);
            } catch (Exception ex) {
            }
            request.setAttribute("message", message);
            request.getRequestDispatcher("staff/drivingprofileManagement.jsp").forward(request, response);

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
//        processRequest(request, response);
        String status = (String) request.getAttribute("status");
        String memberID = (String) request.getAttribute("memberID");
        DrivingProfileDAO dao = new DrivingProfileDAO();
        String message = "";
        try {
            boolean checkUpdate = dao.updateStatusDriving(memberID, status);
            if (checkUpdate) {
                message = "success";
            } else {
                message = "fail";
            }
            ArrayList<DrivingProfile> list = DrivingProfileDAO.getAllDrivingProfile();
            request.setAttribute("list_driving", list);
        } catch (Exception e) {
        }
        request.setAttribute("message", message);
        request.getRequestDispatcher("staff/drivingprofileManagement.jsp").forward(request, response);
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
