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
import javax.servlet.http.HttpSession;

@WebServlet(name = "CreateTopicServlet", urlPatterns = {"/CreateTopicServlet"})
public class CreateTopicServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String topicName = request.getParameter("topicName");
        session.setAttribute("topicName", topicName);

        String topicID = request.getParameter("id");
        TopicDAO dao = new TopicDAO();
        boolean check;
        String message = "fail";
        try {
            if (topicID.equals("0")) {
                check = dao.checkDuplicateTopicName(topicName);
                if (!check) {
                    message = "";
                    topicID = String.valueOf(dao.getMaxTopic());
                } else {
                    message = "duplicate";
                }
            }
            if (!message.equals("duplicate")) {
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
            }
        } catch (Exception e) {
        }
        session.setAttribute("topicID", topicID);
        request.setAttribute("message", message);
        if (!message.equals("duplicate")) {
            request.getRequestDispatcher("staff/createTopic.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("TopicController?action=getAll").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String[] selectedIDs = request.getParameterValues("checkbox");
        String topicName = (String) session.getAttribute("topicName");
        String topicID = (String) session.getAttribute("topicID");
        TopicDAO dao = new TopicDAO();
        boolean check = false;
        String message = "create_fail";
        try {
            ArrayList<TopicDTO> listQuestionInTopic = dao.getAllQuestionInTopic(topicID);
            if (listQuestionInTopic.size() < 35) {
                for (String questionID : selectedIDs) {
                    check = dao.createTopicChoose(topicName, topicID, questionID);
                }
                if (check) {
                    message = "create_success";
                }
            }
            ArrayList<TopicDTO> list = dao.getAllTopic();
            request.setAttribute("topic", list);
        } catch (Exception e) {
        }
        request.setAttribute("message", message);
        request.getRequestDispatcher("staff/topicManagement.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
