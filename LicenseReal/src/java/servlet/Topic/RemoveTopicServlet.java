package servlet.Topic;

import dao.TopicDAO;
import dto.TopicDTO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RemoveTopicServlet", urlPatterns = {"/RemoveTopicServlet"})
public class RemoveTopicServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String topicID = request.getParameter("id");
        TopicDAO dao = new TopicDAO();
        boolean check = false;
        String message = "remove_fail";
        try {
            check = dao.removeTopicByID(topicID);
            if (check) {
                message = "remove_success";
            }
            ArrayList<TopicDTO> list = dao.getAllTopic();
            request.setAttribute("topic", list);
        } catch (Exception e) {
        }
        request.setAttribute("message", message);
        request.getRequestDispatcher("staff/topicManagement.jsp").forward(request, response);
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
