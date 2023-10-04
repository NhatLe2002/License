package servlet;

import dao.QuestionDAO;
import dto.AnswerDTO;
import dto.QuestionDTO;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
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
@WebServlet(name = "UpdateQuestionController", urlPatterns = {"/UpdateQuestionController"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
public class UpdateQuestionController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String message = "";
        QuestionDAO dao = new QuestionDAO();
        try {
            QuestionDTO list = dao.getQuestionByID(id);
            request.setAttribute("question", list);

            ArrayList<AnswerDTO> answers = list.getAnswer();
            request.setAttribute("answers", answers);

            for (AnswerDTO answer : answers) {
                String result = Arrays.toString(answer.getAnswer().split("\n"));
                String[] resultArray = result.substring(1, result.length() - 1).split(", ");

                int answerCount = resultArray.length;

                if (answerCount >= 2) {
                    String answer1 = resultArray[0].trim();
                    String answer2 = resultArray[1].trim();
                    request.setAttribute("answerA", answer1);
                    request.setAttribute("answerB", answer2);
                }

                if (answerCount >= 3) {
                    String answer3 = resultArray[2].trim();
                    request.setAttribute("answerC", answer3);
                }

                if (answerCount >= 4) {
                    String answer4 = resultArray[3].trim();
                    request.setAttribute("answerD", answer4);
                }

                if (answerCount >= 5) {
                    String answer5 = resultArray[4].trim();
                    request.setAttribute("answerE", answer5);
                }

                if (answerCount >= 6) {
                    String answer6 = resultArray[5].trim();
                    request.setAttribute("answerF", answer6);
                }

            }
        } catch (Exception e) {
            message = "ERROR: " + e.getMessage();
        }
        request.setAttribute("message", message);
        request.getRequestDispatcher("updateQuestion.jsp").forward(request, response);
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
        String queID = request.getParameter("id");

        //Khoi tao DAO de xu ly logic
        QuestionDAO dao = new QuestionDAO();
        //Tao ham kiem tra ket qua 
        boolean checkUpdate;
        boolean checkDuplicate;
        //Thong bao duoc hien thi de fix bug, gui thong bao den nguoi dung,...
        String message = "";
        String image = "";

        try {
            //Kiem tra xem cau hoi vua nhap da ton tai hay chua
            checkDuplicate = dao.checkQuestionDuplicate(question);
            if (checkDuplicate) {
                int id = Integer.parseInt(queID);
                checkDuplicate = dao.checkDuplicateID(question, id);
                if (checkDuplicate) {
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
                        //Lay questionID de them vao bang AnswerDTO trong DB
                        int questionID = dao.getQuestionID(question);
                        if (data.isEmpty()) {
                            QuestionDTO question1 = dao.getQuestionByID(Integer.toString(questionID));
                            image = question1.getImage();
                        }

                        //Kiem tra cac file gui len tu jsp co phai la file anh hay khong
                        if (fileName.endsWith(".png") || fileName.endsWith(".PNG") || fileName.isEmpty()) {
                            //Ghep cac dap an A B C D E F lai voi nhau thanh 1 chuoi cach nhau boi "\n"
                            String answer_text = dao.concatenatedString(answerA, answerB, answerC, answerD, answerE, answerF);
                            //Kiem tra chuoi co bi trong hay khong
                            if (answer_text.isEmpty()) {
                                message = "Please enter answer!";
                            } else {
                                if (!data.isEmpty()) {
                                    //Goi den ham them cau hoi va kiem tra xem da cap nhat du lieu vao bang QuestionDTO va AnswerDTO trong DB thanh cong hay chua
                                    checkUpdate = dao.UpdateQuestion(questionID, answer_options, answer_text, isCorrect, question, data, question_type);
                                    if (checkUpdate) {
                                        System.out.println("Update question successfully!");
                                        message = "Update question '" + question + "' successfully!";
                                    } else {
                                        message = "Can't update question!";
                                    }
                                } else {
                                    //Goi den ham them cau hoi va kiem tra xem da cap nhat du lieu vao bang QuestionDTO va AnswerDTO trong DB thanh cong hay chua
                                    checkUpdate = dao.UpdateQuestion(questionID, answer_options, answer_text, isCorrect, question, image, question_type);
                                    if (checkUpdate) {
                                        System.out.println("Update question successfully!");
                                        message = "Update question '" + question + "' successfully!";
                                    } else {
                                        message = "Can't update question!";
                                    }
                                }
                            }
                        } else {
                            message = "Please select the image file as PNG file!";
                        }
                    }
                } else {
                    message = "This question already exists! Please check and try again!";
                }
            } else {
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
                    //Lay questionID de them vao bang AnswerDTO trong DB
                    int questionID = dao.getQuestionID(question);
                    if (data.isEmpty()) {
                        QuestionDTO question1 = dao.getQuestionByID(Integer.toString(questionID));
                        image = question1.getImage();
                    }

                    //Kiem tra cac file gui len tu jsp co phai la file anh hay khong
                    if (fileName.endsWith(".png") || fileName.endsWith(".PNG") || fileName.isEmpty()) {
                        //Ghep cac dap an A B C D E F lai voi nhau thanh 1 chuoi cach nhau boi "\n"
                        String answer_text = dao.concatenatedString(answerA, answerB, answerC, answerD, answerE, answerF);
                        //Kiem tra chuoi co bi trong hay khong
                        if (answer_text.isEmpty()) {
                            message = "Please enter answer!";
                        } else {
                            if (!data.isEmpty()) {
                                //Goi den ham them cau hoi va kiem tra xem da cap nhat du lieu vao bang QuestionDTO va AnswerDTO trong DB thanh cong hay chua
                                checkUpdate = dao.UpdateQuestion(questionID, answer_options, answer_text, isCorrect, question, data, question_type);
                                if (checkUpdate) {
                                    System.out.println("Update question successfully!");
                                    message = "Update question '" + question + "' successfully!";
                                } else {
                                    System.out.println("Can't update question!");
                                }
                            } else {
                                //Goi den ham them cau hoi va kiem tra xem da cap nhat du lieu vao bang QuestionDTO va AnswerDTO trong DB thanh cong hay chua
                                checkUpdate = dao.UpdateQuestion(questionID, answer_options, answer_text, isCorrect, question, image, question_type);
                                if (checkUpdate) {
                                    System.out.println("Update question successfully!");
                                    message = "Update question '" + question + "' successfully!";
                                } else {
                                    System.out.println("Can't update question!");
                                }
                            }
                        }
                    } else {
                        message = "Please select the image file as PNG file!";
                    }
                }
            }

        } catch (Exception e) {
            message = "ERROR: " + e.getMessage();
        }
        //Luu thong bao vao message va gui den trang addQuestion.jsp
        request.setAttribute("message", message);
        request.getRequestDispatcher("QuestionController").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
