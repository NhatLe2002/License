package servlet.Topic;

import dao.TopicDAO;
import dto.TopicDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "TopicController", urlPatterns = {"/TopicController"})
public class TopicController extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("deactive") || action.equals("active")) {
            String status = request.getParameter("status");
            String topicID = request.getParameter("id");
            request.setAttribute("status", status);
            request.setAttribute("topicID", topicID);
            doPost(request, response);
        } else if (action.equals("random")) {
            TopicDAO dao = new TopicDAO();
            String message = "";
            try {
                boolean checkInsert = dao.createTopic();
                if (checkInsert) {
                    message = "success_topic";
                } else {
                    message = "fail_topic";
                }
                ArrayList<TopicDTO> list = dao.getAllTopic();
                request.setAttribute("topic", list);
            } catch (Exception e) {
            }
            request.setAttribute("message", message);
            request.getRequestDispatcher("staff/topicManagement.jsp").forward(request, response);
        } else {
            String message = (String) request.getAttribute("message");
            try {
                TopicDAO dao = new TopicDAO();
                ArrayList<TopicDTO> list = dao.getAllTopic();
                request.setAttribute("topic", list);
            } catch (Exception e) {
            }
            request.setAttribute("message", message);
            request.getRequestDispatcher("staff/topicManagement.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String status = (String) request.getAttribute("status");
        String topicID = (String) request.getAttribute("topicID");
        TopicDAO dao = new TopicDAO();
        String message = "";
        try {
            boolean checkUpdate = dao.updateStatusTopic(topicID, status);
            if (checkUpdate) {
                message = "success";
            } else {
                message = "fail";
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
