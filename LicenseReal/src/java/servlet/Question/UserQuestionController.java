/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.Question;

import dao.QuestionDAO;
import dto.AnswerDTO;
import dto.QuestionDTO;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP Pro
 */
@WebServlet(name = "UserQuestionController", urlPatterns = {"/UserQuestionController"})
public class UserQuestionController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullname = new String(request.getParameter("fullname").getBytes("ISO-8859-1"), "UTF-8");
        String topic = request.getParameter("topic");
        String message = "";
        QuestionDAO dao = new QuestionDAO();
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        String date = dateFormat.format(Date.valueOf(LocalDate.now()));
        String status = "Đang thi";
        ArrayList<QuestionDTO> listQ;
        ArrayList<AnswerDTO> listA;
        try {
            if (topic.equals("0")) {
                listQ = dao.getRandomQuestionAndAnswer();
                listA = new ArrayList<>();

                for (QuestionDTO question : listQ) {
                    listA.addAll(question.getAnswer());
                }

                request.setAttribute("listA", listA);
                request.setAttribute("listQ", listQ);
            } else {
                listQ = dao.getTopic(topic);
                listA = new ArrayList<>();

                for (QuestionDTO question : listQ) {
                    listA.addAll(question.getAnswer());
                }

                request.setAttribute("listA", listA);
                request.setAttribute("listQ", listQ);
            }
        } catch (Exception e) {
        }
        request.setAttribute("fullname", fullname);
        request.setAttribute("message", message);
        request.setAttribute("date", date);
        request.setAttribute("status", status);
        request.getRequestDispatcher("test_exam.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
