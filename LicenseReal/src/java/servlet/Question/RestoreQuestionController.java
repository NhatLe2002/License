package servlet.Question;

import dao.QuestionDAO;
import dto.AnswerDTO;
import dto.QuestionDTO;
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
 * @author HP Pro
 */
@WebServlet(name = "RestoreQuestionController", urlPatterns = {"/RestoreQuestionController"})
public class RestoreQuestionController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String message = (String) request.getAttribute("message");
        String questionID = request.getParameter("id");

        if (questionID.equals("0")) {
            try {
                QuestionDAO dao = new QuestionDAO();
                ArrayList<QuestionDTO> listQ = dao.getAllQuestion("0");
                ArrayList<AnswerDTO> listA = new ArrayList<>();

                for (QuestionDTO question : listQ) {
                    listA.addAll(question.getAnswer());
                }

                request.setAttribute("listA", listA);
                request.setAttribute("listQ", listQ);

            } catch (Exception e) {
                message = "ERROR: " + e.getMessage();
            }

            request.setAttribute("message", message);
            request.getRequestDispatcher("staff/restoreQuestion.jsp").forward(request, response);
        } else {
            request.setAttribute("id", questionID);
            doPost(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String questionID = (String) request.getAttribute("id");
        boolean checkRestore;
        String message = "";

        try {
            QuestionDAO dao = new QuestionDAO();
            checkRestore = dao.restoreQuestion(questionID);
            if (checkRestore) {
                message = "success";
            } else {
                message = "fail";
            }
            ArrayList<QuestionDTO> listQ = dao.getAllQuestion("0");
            ArrayList<AnswerDTO> listA = new ArrayList<>();

            for (QuestionDTO question : listQ) {
                listA.addAll(question.getAnswer());
            }

            request.setAttribute("listA", listA);
            request.setAttribute("listQ", listQ);
        } catch (Exception e) {
        }
        request.setAttribute("message", message);
        request.getRequestDispatcher("staff/restoreQuestion.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
