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

@WebServlet(name = "CreateTopicServlet", urlPatterns = {"/CreateTopicServlet"})
public class CreateTopicServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String topicName = new String(request.getParameter("topicName").getBytes("ISO-8859-1"), "UTF-8");
        String topicID = request.getParameter("id");
        TopicDAO dao = new TopicDAO();
        boolean check;
        String message = "fail";
        try {
            if (topicID.equals("0")) {
                ArrayList<TopicDTO> topic = dao.getAllTopic();
                int numberOfTopic = topic.size() + 1;
                topicID = String.valueOf(numberOfTopic);
            } else {
                String questionID = request.getParameter("questionID");
                check = dao.checkNormal(topicID);
                if (!check) {
                    check = dao.createTopicChoose(topicName, topicID, questionID);
                    if (check) {
                        message = "success";
                    }
                } else {
                    message = "normal_full";
                }
                
                check = dao.checkParalyze(topicID);
                if (!check) {
                    check = dao.createTopicChoose(topicName, topicID, questionID);
                    if (check) {
                        message = "success";
                    }
                } else {
                    message = "paralyze_full";
                }
            }

            QuestionDAO qDao = new QuestionDAO();
            ArrayList<QuestionDTO> listQ = qDao.getAllQuestion("1");
            ArrayList<AnswerDTO> listA = new ArrayList<>();

            for (QuestionDTO question : listQ) {
                listA.addAll(question.getAnswer());
            }

            request.setAttribute("listA", listA);
            request.setAttribute("listQ", listQ);
            request.setAttribute("totalSize", listQ.size());
            
            ArrayList<TopicDTO> listQuestionInTopic = dao.getAllQuestionInTopic(topicID);
            request.setAttribute("listQuestionInTopic", listQuestionInTopic);
        } catch (Exception e) {
        }
        request.setAttribute("topicID", topicID);
        request.setAttribute("message", message);
        request.setAttribute("topicName", topicName);
        request.getRequestDispatcher("staff/createTopic.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
