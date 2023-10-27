package servlet.Topic;

import dao.QuestionDAO;
import dao.TopicDAO;
import dto.AnswerDTO;
import dto.QuestionDTO;
import dto.TopicDTO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DetailsTopicServlet", urlPatterns = {"/DetailsTopicServlet"})
public class DetailsTopicServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String topicID = request.getParameter("id");
        String message = (String) request.getAttribute("message");
        try {
            TopicDAO dao = new TopicDAO();
            ArrayList<QuestionDTO> listQ = new ArrayList<>();
            ArrayList<AnswerDTO> listA = new ArrayList<>();

            ArrayList<TopicDTO> list = dao.getAllQuestionInTopic(topicID);
            QuestionDAO questionDAO = new QuestionDAO();
            for (TopicDTO topicDTO : list) {
                String questionID = String.valueOf(topicDTO.getQuestionID());
                QuestionDTO questionDTO = questionDAO.getQuestionByID(questionID);
                listQ.add(questionDTO);
            }
            for (QuestionDTO question : listQ) {
                listA.addAll(question.getAnswer());

            }
            request.setAttribute("listA", listA);
            request.setAttribute("listQ", listQ);
        } catch (Exception e) {
        }
        request.setAttribute("message", message);
        request.setAttribute("topicID", topicID);
        request.getRequestDispatcher("staff/detailsTopic.jsp").forward(request, response);
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
