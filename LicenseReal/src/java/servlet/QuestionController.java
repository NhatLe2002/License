package servlet;

import dao.AnswerDAO;
import dao.QuestionDAO;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author HP Pro
 */
@WebServlet(name = "QuestionController", urlPatterns = {"/QuestionController"})
public class QuestionController extends HttpServlet {

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
        String question = new String(request.getParameter("question").getBytes("ISO-8859-1"), "UTF-8");
        String question_type = request.getParameter("question_type");
        String answer_options = request.getParameter("answer_options");
        String answerA = new String(request.getParameter("answerA").getBytes("ISO-8859-1"), "UTF-8");
        String answerB = new String(request.getParameter("answerB").getBytes("ISO-8859-1"), "UTF-8");
        String answerC = new String(request.getParameter("answerC").getBytes("ISO-8859-1"), "UTF-8");
        String answerD = new String(request.getParameter("answerD").getBytes("ISO-8859-1"), "UTF-8");
        String answerE = new String(request.getParameter("answerE").getBytes("ISO-8859-1"), "UTF-8");
        String answerF = new String(request.getParameter("answerF").getBytes("ISO-8859-1"), "UTF-8");
        String isCorrect = request.getParameter("correct_answer");

        QuestionDAO dao = new QuestionDAO();
        AnswerDAO answerDAO = new AnswerDAO();
        boolean checkInsert;
        String message;
        
        try {
            List<Part> fileParts = new ArrayList<>();
                for (Part part : request.getParts()) {
                    String partName = new String(part.getName().getBytes("iso-8859-1"), "UTF-8");
                    if (partName.startsWith("image")) {
                        fileParts.add(part);
                    }
                }

                for (Part filePart : fileParts) {
//                    String fileName = filePart.getSubmittedFileName();
                    InputStream fileContent = filePart.getInputStream();

                    InputStream content = fileContent;
                    byte[] imageBytes = IOUtils.toByteArray(content);
                    String data = Base64.getEncoder().encodeToString(imageBytes);
                    
            String answer_text = dao.concatenatedString(answerA, answerB, answerC, answerD, answerE, answerF);
            if (answer_text.isEmpty()) {
                System.out.println("ERROR: String is empty!");
            } else {
                    checkInsert = dao.insertQuestions(question, data, question_type);
                    if (checkInsert) {
                        System.out.println("Insert question to DB successfully!");
                        int questionID = dao.getQuestionID(question);
                        checkInsert = answerDAO.insertAnswer(questionID, answer_options, answer_text, isCorrect);
                        if (checkInsert) {
                            System.out.println("Insert answer to DB successfully!");
                            message = "Insert question '" + question + "' successfully!";
                            request.setAttribute("message", message);
                            request.getRequestDispatcher("MainController?action=insertQ&A").forward(request, response);
                        } else {
                            System.out.println("Can't insert answer to DB!");
                        }
                    } else {
                        System.out.println("Can't insert question to DB!");
                    }
                }
            }

        } catch (Exception e) {
            log(e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
