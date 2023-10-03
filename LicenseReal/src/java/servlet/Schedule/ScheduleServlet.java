/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.Schedule;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class ScheduleServlet extends HttpServlet {

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

    public static ArrayList<LocalDate> getWeek(LocalDate day) {
        ArrayList<LocalDate> week = new ArrayList<>();
        for (int i = 1; i <= 7; i++) {
            week.add(day);
            day = day.plusDays(1);
        }
        return week;
    }

    public static LocalDate getMondayOfWeek(LocalDate now) {
        // Create a LocalDate object for the specific date
        LocalDate date = now;

        // Get the day of the week for the given date
        DayOfWeek dayOfWeek = date.getDayOfWeek();

        // Calculate the number of days to subtract to get to Monday (assuming Monday is the first day of the week)
        int daysToSubtract = (dayOfWeek.getValue() - DayOfWeek.MONDAY.getValue() + 7) % 7;

        // Subtract the calculated number of days from the given date to get the Monday of the week
        LocalDate mondayOfWeek = date.minusDays(daysToSubtract);
        return mondayOfWeek;
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
            LocalDate currentDate = LocalDate.now();
            if (request.getParameter("selectMondayOfWeek") != null) {
                String selectMondayOfWeek = request.getParameter("selectMondayOfWeek");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                currentDate = LocalDate.parse(selectMondayOfWeek, formatter);
            }

            ArrayList<LocalDate> mondays = getAllMonday();
            LocalDate mondayOfWeek = getMondayOfWeek(currentDate);
            ArrayList<LocalDate> week = getWeek(mondayOfWeek);
            
            
            //Dung de check Date cua currentdate
            request.setAttribute("currentMonday", mondayOfWeek);
            request.setAttribute("week", week);
            request.setAttribute("mondays", mondays);
            request.getRequestDispatcher("mentor/regisScheduleOfMentor.jsp").forward(request, response);
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
