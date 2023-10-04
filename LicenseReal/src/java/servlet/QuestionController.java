package servlet;

import dao.AnswerDAO;
import dao.QuestionDAO;
import dto.AnswerDTO;
import dto.QuestionDTO;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
public class QuestionController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String message = "";

        try {
            QuestionDAO dao = new QuestionDAO();
            ArrayList<QuestionDTO> listQ = dao.getAllQuestion();
            ArrayList<AnswerDTO> listA = new ArrayList<>();

            for (QuestionDTO question : listQ) {
                listA .addAll(question.getAnswer());
            }

            request.setAttribute("listA", listA);
            request.setAttribute("listQ", listQ);
        } catch (Exception e) {
            message = "ERROR: " + e.getMessage();
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("showListQuestion.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Lay cac du lieu duoc gui tu file jsp len servlet thong qua method POST
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

        //Khoi tao DAO de xu ly logic
        QuestionDAO dao = new QuestionDAO();
        AnswerDAO answerDAO = new AnswerDAO();
        //Tao ham kiem tra ket qua 
        boolean checkInsert;
        boolean checkDuplicate;
        //Thong bao duoc hien thi de fix bug, gui thong bao den nguoi dung,...
        String message = "";

        try {
            //Kiem tra xem cau hoi vua nhap da ton tai hay chua
            checkDuplicate = dao.checkQuestionDuplicate(question);
            if (!checkDuplicate) {
                //Doan code xu ly cac file anh png duoc gui len tu jsp
                List<Part> fileParts = new ArrayList<>();
                for (Part part : request.getParts()) {
                    String partName = new String(part.getName().getBytes("iso-8859-1"), "UTF-8");
                    if (partName.startsWith("image")) {
                        fileParts.add(part);
                    }
                }

                for (Part filePart : fileParts) {
                    String fileName = filePart.getSubmittedFileName();
                    InputStream fileContent = filePart.getInputStream();

                    //Chuyen file tu inputStream sang Base64 de luu vao DB
                    InputStream content = fileContent;
                    byte[] imageBytes = IOUtils.toByteArray(content);
                    String data = Base64.getEncoder().encodeToString(imageBytes);

                    //Kiem tra cac file gui len tu jsp co phai la file anh hay khong
                    if (fileName.endsWith(".png") || fileName.endsWith(".PNG") || fileName.isEmpty()) {
                        //Ghep cac dap an A B C D E F lai voi nhau thanh 1 chuoi cach nhau boi "\n"
                        String answer_text = dao.concatenatedString(answerA, answerB, answerC, answerD, answerE, answerF);
                        //Kiem tra chuoi co bi trong hay khong
                        if (answer_text.isEmpty()) {
                            message = "Please enter answer!";
                        } else {
                            //Goi den ham them cau hoi va kiem tra xem da them du lieu vao bang QuestionDTO trong DB thanh cong hay chua
                            checkInsert = dao.insertQuestions(question, data, question_type);
                            if (checkInsert) {
                                System.out.println("Insert question to DB successfully!");
                                //Lay questionID de them vao bang AnswerDTO trong DB
                                int questionID = dao.getQuestionID(question);
                                //Goi den ham them dap an vao DB va kiem tra da them thanh cong hay chua
                                checkInsert = answerDAO.insertAnswer(questionID, answer_options, answer_text, isCorrect);
                                if (checkInsert) {
                                    System.out.println("Insert answer to DB successfully!");
                                    message = "Insert question '" + question + "' successfully!";
                                } else {
                                    System.out.println("Can't insert answer to DB!");
                                }
                            } else {
                                System.out.println("Can't insert question to DB!");
                            }
                        }
                    } else {
                        message = "Please select the image file as PNG file!";
                    }
                }
            } else {
                message = "This question already exists! Please check and try again!";
            }

        } catch (Exception e) {
            message = "ERROR: " + e.getMessage();
        }
        //Luu thong bao vao message va gui den trang addQuestion.jsp
        request.setAttribute("message", message);
        request.getRequestDispatcher("addQuestion.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
