<<<<<<< HEAD
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Answer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dto.Question;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author HP Pro
 */
public class QuestionDAO {

    private Connection conn;
    private PreparedStatement ptm;
    private ResultSet rs;

    //Ham lay ngau nhien 30 cau hoi binh thuong va 5 cau hoi liet
    public ArrayList<Question> getRandomQuestionAndAnswer() throws SQLException {
        ArrayList<Question> list = new ArrayList<>();
        try {
            conn = null;
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM (SELECT TOP(30) * FROM Question WHERE question_type = 'B2' ORDER BY RAND()) AS qus\n"
                        + "JOIN Answer AS ans ON ans.questionID = qus.id\n"
                        + "UNION ALL\n"
                        + "SELECT * FROM (SELECT TOP(5) * FROM Question WHERE question_type = 'B2' ORDER BY RAND()) AS kqus\n"
                        + "JOIN Answer AS kans ON kans.questionID = kqus.id";
                //cau sql lay ngau nhien 30 cau hoi binh thuong + 5 cau hoi liet
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    ArrayList<Answer> answer = new ArrayList<>();
                    answer.add(new Answer(rs.getInt("questionID"), rs.getInt("answer_options"), rs.getString("answer_text").trim(), rs.getString("isCorrect")));
                    //luu dap an vao entity answer, muc dich la de lay dap an cung luc voi cau hoi cho tien viec truy van
                    list.add(new Question(rs.getInt("questionID"), rs.getString("question_text"), rs.getString("image"),
                            rs.getString("question_type"), answer));
                    //luu cau hoi + dap an vao entity question
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    //Ham dung de kiem tra ket qua lay duoc tu DB
//    public static void main(String[] args) throws SQLException {
//        QuestionDAO dao = new QuestionDAO();
//        ArrayList<Question> list = dao.getRandomQuestionAndAnswer();
//        for (Question question : list) {
//            ArrayList<Answer> answers = question.getAnswer();
//            for (Answer answer : answers) {
//                String result = Arrays.toString(answer.getAnswer().split("\n"));
//                System.out.println(result);
//
//                String[] resultArray = result.substring(1, result.length() - 1).split(", ");
//
//                int answerCount = resultArray.length;
//
//                if (answerCount >= 2) {
//                    String answer1 = resultArray[0].trim();
//                    String answer2 = resultArray[1].trim();
//                    System.out.println("answer1: " + answer1);
//                    System.out.println("answer2: " + answer2);
//                }
//
//                if (answerCount >= 3) {
//                    String answer3 = resultArray[2].trim();
//                    System.out.println("answer3: " + answer3);
//                }
//
//                if (answerCount >= 4) {
//                    String answer4 = resultArray[3].trim();
//                    System.out.println("answer4: " + answer4);
//                }
//
//                if (answerCount >= 5) {
//                    String answer5 = resultArray[4].trim();
//                    System.out.println("answer5: " + answer5);
//                }
//
//                if (answerCount >= 6) {
//                    String answer6 = resultArray[5].trim();
//                    System.out.println("answer6: " + answer6);
//                }
//            }
//        }
//    }
    //Ham lay bo cau hoi theo ma de
    public ArrayList<Question> getTopic(String topic) throws SQLException {
        ArrayList<Question> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT tp.topicID AS TopicID, que.id AS QuestionID, que.question_text AS Questions,\n"
                        + "que.image AS Image, que.questiontype AS QuestionType, ans.answer_options AS Options,\n"
                        + "ans.answer AS Answer, ans.isCorrect FROM Question AS que\n"
                        + "JOIN Topic AS tp ON que.id = tp.questionID\n"
                        + "JOIN Answer AS ans ON ans.questionID = que.id\n"
                        + "WHERE tp.topicID = " + topic;
                //Cau sql lay tat ca cac cau hoi va dap an trong ma de duoc yeu cau
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
//                    ArrayList<Answer> answer = new ArrayList<>();
//                    answer.add(new Answer(rs.getInt("QuestionID"), rs.getInt("Options").trim(), rs.getString("Answer"), rs.getString("isCorrect")));
//                    //Gan dap an lay duoc vaof entity Answer
//                    list.add(new Question(rs.getInt("QuestionID"), rs.getString("Questions"), rs.getString("Image"),
//                            answer, rs.getBoolean("QuestionType"), rs.getInt("TopicID")));
//                    //Gan tat ca cau hoi va dap an cua ma de duoc yeu cau vao Entity Question
                }
            }
        } catch (Exception e) {
        }
        return list;
    }

    //Ham lay cac topic khong trung nhau trong DB
    public List<Question> getTopicID() throws SQLException {
        List<Question> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT DISTINCT topicID FROM Topic";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new Question(rs.getInt("topicID")));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public String concatenatedString(String answerA, String answerB, String answerC, String answerD, String answerE, String answerF) {
        String result = "";
        try {
            StringBuilder concatenated = new StringBuilder();
            if (!answerA.endsWith("A. ")) {
                concatenated.append(answerA).append("\n");
            }
            if (!answerB.endsWith("B. ")) {
                concatenated.append(answerB).append("\n");
            }
            if (!answerC.endsWith("C. ")) {
                concatenated.append(answerC).append("\n");
            }
            if (!answerD.endsWith("D. ")) {
                concatenated.append(answerD).append("\n");
            }
            if (!answerE.endsWith("E. ")) {
                concatenated.append(answerE).append("\n");
            }
            if (!answerF.endsWith("F. ")) {
                concatenated.append(answerF).append("\n");
            }
            result = concatenated.toString();
        } catch (Exception e) {
        }
        return result;
    }

    public boolean insertQuestions(String question, String image, String question_type) throws SQLException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Question (question_text, image, question_type) VALUES (N'" + question + "','" + image + "','" + question_type + "')";
                ptm = conn.prepareStatement(sql);
                int row = ptm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }

    public int getQuestionID(String question) throws SQLException {
        int questionID = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT id FROM Question WHERE question_text = N'" + question + "'";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    questionID = rs.getInt("id");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return questionID;
    }

    public boolean checkQuestionDuplicate(String question) throws SQLException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM Question WHERE question_text = N'" + question + "'";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return true;
                }
            }
        } catch (Exception e) {
        }
        return false;
    }
    public boolean checkDuplicateID(String question, int id) throws SQLException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM Question WHERE question_text = N'" + question + "'";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int comparID = rs.getInt("id");
                    if (id == comparID) {
                        return true;
                    } else {
                        return false;
                    }
                }
            }
        } catch (Exception e) {
        }
        return false;
    }

    public ArrayList<Question> getAllQuestion() throws SQLException {
        ArrayList<Question> list = new ArrayList<>();
        try {
            conn = null;
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM Question AS que\n"
                        + "JOIN Answer AS ans ON que.id = ans.questionID";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    ArrayList<Answer> answer = new ArrayList<>();
                    answer.add(new Answer(rs.getInt("questionID"), rs.getInt("answer_options"), rs.getString("answer_text").trim(), rs.getString("isCorrect")));
                    //luu dap an vao entity answer, muc dich la de lay dap an cung luc voi cau hoi cho tien viec truy van
                    list.add(new Question(rs.getInt("questionID"), rs.getString("question_text"), rs.getString("image"),
                            rs.getString("question_type"), answer));
                    //luu cau hoi + dap an vao entity question
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public Question getQuestionByID(String id) throws SQLException {
        Question question = new Question();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM Question AS que\n"
                        + "JOIN Answer AS ans ON que.id = ans.questionID\n"
                        + "WHERE que.id = " + id;
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    ArrayList<Answer> answer = new ArrayList<>();
                    answer.add(new Answer(rs.getInt("questionID"), rs.getInt("answer_options"), rs.getString("answer_text").trim(), rs.getString("isCorrect")));
                    //luu dap an vao entity question, muc dich la de luu dap an cung luc voi cau hoi cho tien viec truy van
                    question.setId(rs.getInt("questionID"));
                    question.setQuestion(rs.getString("question_text"));
                    question.setQuestionType(rs.getString("question_type"));
                    question.setImage(rs.getString("image"));
                    question.setAnswer(answer);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return question;
    }

    public boolean UpdateQuestion(int questionID, String answer_options, String answer_text, String isCorrect, String question_text, String image, String question_type) throws SQLException {
        String sql;
        int row;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                sql = "UPDATE Question SET question_text = N'" + question_text + "', image = '" + image + "' WHERE id = " + questionID;
                ptm = conn.prepareStatement(sql);
                row = ptm.executeUpdate();
                if (row > 0) {
                    sql = "UPDATE Answer SET answer_options = " + answer_options + ", answer_text = N'" + answer_text + "', isCorrect = '" + isCorrect + "' WHERE questionID = " + questionID;
                    ptm = conn.prepareStatement(sql);
                    row = ptm.executeUpdate();
                    if (row > 0) {
                        return true;
                    }
                } else {
                    System.out.println("Can't update table Question!");
                    return false;
                }
            }
        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }

    public static void main(String[] args) throws SQLException {
        QuestionDAO dao = new QuestionDAO();
        boolean result = dao.checkDuplicateID("Tuyền nè", 22);
        System.out.println(result);
    }
}
=======
///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package dao;
//
//import dto.Answer;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import dto.Question;
//import java.util.List;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//import utils.DBUtils;
//
///**
// *
// * @author HP Pro
// */
//public class QuestionDAO {
//
//    private Connection conn;
//    private PreparedStatement ptm;
//    private ResultSet rs;
//
//    //Ham lay ngau nhien 30 cau hoi binh thuong va 5 cau hoi liet
//    public ArrayList<Question> getRandomQuestionAndAnswer() throws SQLException {
//        ArrayList<Question> list = new ArrayList<>();
//        try {
//            conn = null;
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                String sql = "SELECT * FROM (SELECT TOP(30) * FROM Question WHERE questionType = 1 ORDER BY RAND()) AS qus\n"
//                        + "JOIN Answer AS ans ON ans.questionID = qus.id\n"
//                        + "UNION ALL\n"
//                        + "SELECT * FROM (SELECT TOP(5) * FROM Question WHERE questionType = 0 ORDER BY RAND()) AS kqus\n"
//                        + "JOIN Answer AS kans ON kans.questionID = kqus.id";
//                //cau sql lay ngau nhien 30 cau hoi binh thuong + 5 cau hoi liet
//                ptm = conn.prepareStatement(sql);
//                rs = ptm.executeQuery();
//                while (rs.next()) {
//                    ArrayList<Answer> answer = new ArrayList<>();
//                    answer.add(new Answer(rs.getInt(5), rs.getInt(6), rs.getString(7).trim(), rs.getBoolean(8)));
//                    //luu dap an vao entity answer, muc dich la de lay dap an cung luc voi cau hoi cho tien viec truy van
//                    list.add(new Question(rs.getInt(1), rs.getString(2), rs.getString(3),
//                            rs.getBoolean(4), answer));
//                    //luu cau hoi + dap an vao entity question
//                }
//            }
//        } catch (Exception e) {
//        }
//        return list;
//    }
//
//    //Ham dung de kiem tra ket qua lay duoc tu DB
//    public static void main(String[] args) {
//        try {
//            QuestionDAO dao = new QuestionDAO();
//            List<Question> list = dao.getTopicID();
//            for (Question question : list) {
//                System.out.println(question);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//
//    //Ham lay bo cau hoi theo ma de
//    public ArrayList<Question> getTopic(String topic) throws SQLException {
//        ArrayList<Question> list = new ArrayList<>();
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                String sql = "SELECT tp.topicID AS TopicID, que.id AS QuestionID, que.question_text AS Questions,\n"
//                        + "que.image AS Image, que.questiontype AS QuestionType, ans.answer_options AS Options,\n"
//                        + "ans.answer AS Answer, ans.isCorrect FROM Question AS que\n"
//                        + "JOIN Topic AS tp ON que.id = tp.questionID\n"
//                        + "JOIN Answer AS ans ON ans.questionID = que.id\n"
//                        + "WHERE tp.topicID = " + topic;
//                //Cau sql lay tat ca cac cau hoi va dap an trong ma de duoc yeu cau
//                ptm = conn.prepareStatement(sql);
//                rs = ptm.executeQuery();
//                while (rs.next()) {
//                    ArrayList<Answer> answer = new ArrayList<>();
//                    answer.add(new Answer(rs.getInt("QuestionID"), rs.getString("Options").trim(), rs.getString("Answer"), rs.getBoolean("isCorrect")));
//                    //Gan dap an lay duoc vaof entity Answer
//                    list.add(new Question(rs.getInt("QuestionID"), rs.getString("Questions"), rs.getString("Image"),
//                    answer, rs.getBoolean("QuestionType"), rs.getInt("TopicID")));
//                    //Gan tat ca cau hoi va dap an cua ma de duoc yeu cau vao Entity Question
//                }
//            }
//        } catch (Exception e) {
//        }
//        return list;
//    }
//    
//    //Ham lay cac topic khong trung nhau trong DB
//    public List<Question> getTopicID() throws SQLException{
//        List<Question> list = new ArrayList<>();
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                String sql = "SELECT DISTINCT topicID FROM Topic";
//                ptm = conn.prepareStatement(sql);
//                rs = ptm.executeQuery();
//                while (rs.next()) {                    
//                    list.add(new Question(rs.getInt("topicID")));
//                }
//            }
//        } catch (Exception e) {
//        }
//        return list;
//    }
//}
>>>>>>> 3e9169492944ced8d11dec20c2320d5adee62204
