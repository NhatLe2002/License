package servlet.Topic;

import dao.QuestionDAO;
import dao.TopicDAO;
import dto.AnswerDTO;
import dto.QuestionDTO;
import dto.TopicDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateTopicServlet", urlPatterns = {"/UpdateTopicServlet"})
public class UpdateTopicServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String topicID = request.getParameter("id");
        TopicDAO dao = new TopicDAO();
        QuestionDAO qDao = new QuestionDAO();
        try {
            ArrayList<TopicDTO> list = dao.getAllQuestionInTopic(topicID);
            ArrayList<QuestionDTO> listQ = qDao.getAllQuestion("1");
            ArrayList<AnswerDTO> listA = new ArrayList<>();

            for (QuestionDTO question : listQ) {
                listA.addAll(question.getAnswer());
            }

            request.setAttribute("listA", listA);
            request.setAttribute("listQ", listQ);
            request.setAttribute("topicID", topicID);
            request.setAttribute("listQuestionID", list);
            request.setAttribute("totalSize", listQ.size());

        } catch (Exception e) {
        }
        request.getRequestDispatcher("staff/updateTopic.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String topicID = request.getParameter("id");
        String[] selectedIDs = request.getParameterValues("checkbox");
        TopicDAO dao = new TopicDAO();
        String topicName = "";
        boolean check = false;
        String message = "update_fail";
        try {
            ArrayList<TopicDTO> listQuestion = dao.getAllQuestionInTopic(topicID);
            for (TopicDTO topicDTO : listQuestion) {
                topicName = topicDTO.getTopicName();
            }
            check = dao.removeTopicByID(topicID);
            if (check) {
                for (String questionID : selectedIDs) {
                    check = dao.createTopicChoose(topicName, topicID, questionID);
                }
                if (check) {
                    message = "update_success";
                }
            }
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
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
