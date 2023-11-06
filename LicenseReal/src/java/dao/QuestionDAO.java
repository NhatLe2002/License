/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.AnswerDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dto.QuestionDTO;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
    public ArrayList<QuestionDTO> getRandomQuestionAndAnswer() throws SQLException {
        ArrayList<QuestionDTO> list = new ArrayList<>();
        try {
            conn = null;
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM (\n"
                        + "SELECT TOP(30) qus.id AS qus_id, qus.question_text, qus.image, qus.question_type AS question_type, qus.status AS qus_status, ans.*\n"
                        + "FROM Question AS qus\n"
                        + "JOIN Answer AS ans ON ans.questionID = qus.id\n"
                        + "WHERE qus.question_type = 0 AND qus.status = 1 \n"
                        + "ORDER BY NEWID()\n"
                        + "UNION ALL\n"
                        + "SELECT TOP(5) kqus.id AS kqus_id, kqus.question_text, kqus.image, kqus.question_type AS question_type, kqus.status AS kqus_status, kans.*\n"
                        + "FROM Question AS kqus\n"
                        + "JOIN Answer AS kans ON kans.questionID = kqus.id\n"
                        + "WHERE kqus.question_type = 1 AND kqus.status = 1\n"
                        + ") AS qus_kans\n"
                        + "ORDER BY NEWID();";
                //cau sql lay ngau nhien 30 cau hoi binh thuong + 5 cau hoi liet
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    ArrayList<AnswerDTO> answer = new ArrayList<>();
                    answer.add(new AnswerDTO(rs.getInt("questionID"), rs.getInt("answer_options"), rs.getString("answer_text").trim(), rs.getString("isCorrect")));
                    //luu dap an vao entity answer, muc dich la de lay dap an cung luc voi cau hoi cho tien viec truy van

                    list.add(new QuestionDTO(rs.getInt("questionID"), rs.getString("question_text"), rs.getString("image"),
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

    //Ham lay bo cau hoi theo ma de
    public ArrayList<QuestionDTO> getTopic(String topic) throws SQLException {
        ArrayList<QuestionDTO> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT tp.topicID, que.id AS questionID, que.question_text,\n"
                        + "que.image, que.question_type, ans.answer_options,\n"
                        + "ans.answer_text, ans.isCorrect FROM Question AS que\n"
                        + "JOIN Topic AS tp ON que.id = tp.questionID\n"
                        + "JOIN Answer AS ans ON ans.questionID = que.id\n"
                        + "WHERE tp.topicID = " + topic
                        + "ORDER BY NEWID()";
                //Cau sql lay tat ca cac cau hoi va dap an trong ma de duoc yeu cau
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    ArrayList<AnswerDTO> answer = new ArrayList<>();
                    answer.add(new AnswerDTO(rs.getInt("questionID"), rs.getInt("answer_options"), rs.getString("answer_text").trim(), rs.getString("isCorrect")));
                    //luu dap an vao entity answer, muc dich la de lay dap an cung luc voi cau hoi cho tien viec truy van

                    list.add(new QuestionDTO(rs.getInt("questionID"), rs.getString("question_text"), rs.getString("image"),
                            rs.getString("question_type"), answer));
                    //luu cau hoi + dap an vao entity question  
                }
            }
        } catch (Exception e) {
        }
        return list;
    }

    //Ham lay cac topic khong trung nhau trong DB
    public List<QuestionDTO> getTopicID() throws SQLException {
        List<QuestionDTO> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT DISTINCT topicID, name FROM Topic WHERE status = 1";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new QuestionDTO(rs.getInt("topicID"), rs.getString("name")));
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

    public String concatenatedString(String answerA, String answerB, String answerC, String answerD) {
        String result = "";
        try {
            StringBuilder concatenated = new StringBuilder();
            if (!answerA.endsWith("A. ") && !answerA.isEmpty()) {
                concatenated.append(answerA).append("/");
            }
            if (!answerB.endsWith("B. ") && !answerB.isEmpty()) {
                concatenated.append(answerB).append("/");
            }
            if (!answerC.endsWith("C. ") && !answerC.isEmpty()) {
                concatenated.append(answerC).append("/");
            }
            if (!answerD.endsWith("D. ") && !answerD.isEmpty()) {
                concatenated.append(answerD).append("/");
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
                String sql = "INSERT INTO Question (question_text, image, question_type, status) VALUES (N'" + question + "','" + image + "','" + question_type + "', 1)";
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

    public ArrayList<QuestionDTO> getAllQuestion(String status) throws SQLException {
        ArrayList<QuestionDTO> list = new ArrayList<>();
        try {
            conn = null;
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM Question AS que\n"
                        + "JOIN Answer AS ans ON que.id = ans.questionID\n"
                        + "WHERE que.status = " + status;
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    ArrayList<AnswerDTO> answer = new ArrayList<>();
                    answer.add(new AnswerDTO(rs.getInt("questionID"), rs.getInt("answer_options"), rs.getString("answer_text").trim(), rs.getString("isCorrect")));
                    //luu dap an vao entity answer, muc dich la de lay dap an cung luc voi cau hoi cho tien viec truy van
                    list.add(new QuestionDTO(rs.getInt("questionID"), rs.getString("question_text"), rs.getString("image"),
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

    public QuestionDTO getQuestionByID(String id) throws SQLException {
        QuestionDTO question = new QuestionDTO();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM Question AS que\n"
                        + "JOIN Answer AS ans ON que.id = ans.questionID\n"
                        + "WHERE que.id = " + id;
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    ArrayList<AnswerDTO> answer = new ArrayList<>();
                    answer.add(new AnswerDTO(rs.getInt("questionID"), rs.getInt("answer_options"), rs.getString("answer_text").trim(), rs.getString("isCorrect")));
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
                sql = "UPDATE Question SET question_text = N'" + question_text + "', image = '" + image + "', question_type = '" + question_type + "', status = 1 WHERE id = " + questionID;
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

    public boolean deleleQuestion(String questionID) throws SQLException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Question SET status = 0 WHERE id = " + questionID;
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

    public boolean restoreQuestion(String questionID) throws SQLException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Question SET status = 1 WHERE id = " + questionID;
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

    public static void main(String[] args) {
        QuestionDAO dao = new QuestionDAO();
        try {
            ArrayList<QuestionDTO> list = dao.getAllQuestion("1");
            System.out.println(list.size());
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
