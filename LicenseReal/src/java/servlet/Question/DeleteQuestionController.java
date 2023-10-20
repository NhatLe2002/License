/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.Question;

import dao.QuestionDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP Pro
 */
@WebServlet(name = "DeleteQuestionController", urlPatterns = {"/DeleteQuestionController"})
public class DeleteQuestionController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String questionID = request.getParameter("id");
        boolean checkDelete;
        String message = "";
        try {
            QuestionDAO dao = new QuestionDAO();
            checkDelete = dao.deleleQuestion(questionID);
            if (checkDelete) {
                message = "success";
            } else {
                message = "fail";
            }
        } catch (Exception e) {
        }
        request.setAttribute("message", message);
        request.getRequestDispatcher("QuestionController").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
