/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.Schedule;

import dao.MentorDAO;
import dao.ScheduleDAO;
import dto.ScheduleDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static servlet.Schedule.RegistScheduleByMentorServlet.getMondayOfWeek;
import static servlet.Schedule.RegistScheduleByMentorServlet.getWeek;

/**
 *
 * @author Admin
 */
public class ViewScheduleMentorServlet extends HttpServlet {

    public static List<Date> convertLocalDateToDate(List<LocalDate> localDateList) {
        List<Date> dateList = new ArrayList<>();
        for (LocalDate localDate : localDateList) {
            dateList.add(java.sql.Date.valueOf(localDate));
        }
        return dateList;
    }

    public ArrayList<LocalDate> getAllMonday() {
        int year = 2023; // Năm bạn muốn lấy các ngày đầu tiên và cuối cùng của tuần

        List<LocalDate> firstDaysOfWeek = new ArrayList<>();

        LocalDate date = LocalDate.of(year, 1, 1);

        // Lặp qua từng ngày trong năm
        while (date.getYear() == year) {
            DayOfWeek dayOfWeek = date.getDayOfWeek();
            // Kiểm tra nếu ngày đó là ngày đầu tiên của tuần
            if (dayOfWeek == DayOfWeek.MONDAY) {
                firstDaysOfWeek.add(date);
            }
            date = date.plusDays(1);
        }
        return (ArrayList<LocalDate>) firstDaysOfWeek;
    }

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
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ViewScheduleMentorServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ViewScheduleMentorServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
            Cookie[] c = request.getCookies();
            String userId = "";
            if (c != null) {
                for (Cookie aCookie : c) {
                    if (aCookie.getName().equals("userId")) {
                        userId = aCookie.getValue();
                    }
                }
            }
            LocalDate currentDate = LocalDate.now();
            if (request.getParameter("selectMondayOfWeek") != null) {
                String selectMondayOfWeek = request.getParameter("selectMondayOfWeek");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                currentDate = LocalDate.parse(selectMondayOfWeek, formatter);
            }

            ArrayList<LocalDate> mondays = getAllMonday();
            LocalDate mondayOfWeek = getMondayOfWeek(currentDate);
            ArrayList<LocalDate> week = getWeek(mondayOfWeek);
            ArrayList<ScheduleDTO> mentorSchedule = new ArrayList<>();
            if (userId != "") {
                mentorSchedule = ScheduleDAO.getScheduleByMentorID(MentorDAO.getMentorByUserID(Integer.parseInt(userId)).getId());
            } else {
                mentorSchedule = null;
            }

            //Schedule of mentor check by action
            //request.setAttribute("message", request.getParameter("action"));
            request.setAttribute("scheduleOfMentor", mentorSchedule);
            request.setAttribute("currentDay", Date.valueOf(LocalDate.now()));
            request.setAttribute("currentMonday", mondayOfWeek);
            request.setAttribute("week", convertLocalDateToDate(week));
            request.setAttribute("mondays", mondays);
            request.getRequestDispatcher("mentor/viewSchedule.jsp").forward(request, response);
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
