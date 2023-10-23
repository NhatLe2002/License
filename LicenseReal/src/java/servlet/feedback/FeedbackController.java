package servlet.feedback;

import dao.RatingDAO;
import dto.RatingDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FeedbackController", urlPatterns = {"/FeedbackController"})
public class FeedbackController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            RatingDAO dao = new RatingDAO();
            String message = (String) request.getAttribute("message");
            String action = (String) request.getAttribute("action");
            String feedbackID = (String) request.getAttribute("id");
            boolean check;
            switch (action) {
                case "accept":
                    check = dao.acceptFeedback(feedbackID);
                    if (check) {
                        message = "success";
                    } else {
                        message = "fail";
                    }
                    break;
                case "delete":
                    check = dao.deleteFeedback(feedbackID);
                    if (check) {
                        message = "success_feedback";
                    } else {
                        message = "fail_feedback";
                    }
                    break;
                default:
                    break;
            }
            ArrayList<RatingDTO> listFeedback = dao.getAllRatingAndMentorName();
            request.setAttribute("listFeedback", listFeedback);
            request.setAttribute("message", message);
            request.getRequestDispatcher("staff/feedbackManagement.jsp").forward(request, response);
        } catch (SQLException ex) {
        }
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
