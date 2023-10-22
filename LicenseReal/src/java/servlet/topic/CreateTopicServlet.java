package servlet.topic;

import dao.TopicDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
        TopicDAO tDao = new TopicDAO();
        String message = "";
        try {
            boolean checkInsert = tDao.createTopic();
            if (checkInsert) {
                message = "success_topic";
            } else {
                message = "fail_topic";
            }
        } catch (Exception e) {
        }
        request.setAttribute("message", message);
        request.getRequestDispatcher("TopicController").forward(request, response);
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
