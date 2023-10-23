package servlet.feedback;

import dao.RatingDAO;
import dto.RatingDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
        RatingDAO dao = new RatingDAO();
        String message = (String) request.getAttribute("message");
        try {
            ArrayList<RatingDTO> listFeedback = dao.getAllRatingAndMentorName();
            request.setAttribute("listFeedback", listFeedback);
            
        } catch (Exception e) {
        }
        request.setAttribute("message", message);
        request.getRequestDispatcher("staff/feedbackManagement.jsp").forward(request, response);
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
