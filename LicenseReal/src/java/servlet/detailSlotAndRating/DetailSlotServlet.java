/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.detailSlotAndRating;

import dao.MentorDAO;
import dao.RatingDAO;
import dao.ScheduleDAO;
import dto.MentorDTO;
import dto.RatingDTO;
import dto.ScheduleDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class DetailSlotServlet extends HttpServlet {

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
            // Trích xuất thông tin từ đường dẫn URL
            String scheduleID = request.getParameter("scheduleId");
            String ratingString = request.getParameter("ratingMember");
            String description = request.getParameter("description");
            ScheduleDTO schedule = ScheduleDAO.getScheduleById(Integer.parseInt(scheduleID));
            if (ratingString != null) {
                float ratingMember = Float.parseFloat(ratingString);
                RatingDTO ratingDTO = new RatingDTO(1, schedule.getMentorID(), schedule.getMemberID(), ratingMember, description);
                try {
                    RatingDAO.insertRating(ratingDTO);
                } catch (Exception ex) {
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    ex.printStackTrace();
                    throw ex;
                }
            }
            MentorDTO mentorAndUSer = MentorDAO.getMentorAndUserByMentorID(schedule.getMentorID());
            float ratingMentor = 0;
            ArrayList<RatingDTO> rating = RatingDAO.getRatingByMentorID(schedule.getMentorID());
            for (RatingDTO object : rating) {
                ratingMentor += object.getStar();
            }

            ratingMentor = ratingMentor / RatingDAO.getRatingByMentorID(schedule.getMentorID()).size();
            RatingDTO ratingCheck = RatingDAO.getRatingByMemberAndMentorID(schedule.getMemberID(), schedule.getMentorID());
            request.setAttribute("test", ratingString);
            request.setAttribute("ratingList", rating);
            request.setAttribute("ratingCheck", ratingCheck);
            request.setAttribute("ratingMentor", ratingMentor);
            request.setAttribute("Schedule", schedule);
            request.setAttribute("scheduleID", scheduleID);
            request.setAttribute("mentorAndUser", mentorAndUSer);
            request.getRequestDispatcher("member/detailSlotAndRating.jsp").forward(request, response);
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
