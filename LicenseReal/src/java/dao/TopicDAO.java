package dao;

import dto.AnswerDTO;
import dto.QuestionDTO;
import dto.TopicDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

public class TopicDAO {

    private Connection conn;
    private PreparedStatement ptm;
    private ResultSet rs;

    public static void main(String[] args) throws SQLException {
        TopicDAO tDao = new TopicDAO();
        boolean check = tDao.checkDuplicateTopicName("Võ Thanh Tuyền");
        System.out.println(check);
    }

    public ArrayList<TopicDTO> getAllTopic() throws SQLException {
        ArrayList<TopicDTO> listTopic = new ArrayList<>();
        ResultSet rs1 = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT DISTINCT topicID, name, status FROM Topic";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int count = 0;
                    ArrayList<TopicDTO> listQuestion = new ArrayList<>();
                    sql = "SELECT id, questionID FROM Topic WHERE topicID = " + rs.getInt("topicID");
                    ptm = conn.prepareStatement(sql);
                    rs1 = ptm.executeQuery();
                    while (rs1.next()){
                        listQuestion.add(new TopicDTO(rs1.getInt("id"), rs1.getInt("questionID")));
                    }
                    for(int i = 0; i < listQuestion.size(); i++){
                        count++;
                    }
                    listTopic.add(new TopicDTO(rs.getInt("topicID"), rs.getString("name"), count, rs.getBoolean("status")));
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
        return listTopic;
    }

    public ArrayList<TopicDTO> getAllQuestionInTopic(String topicID) throws SQLException {
        ArrayList<TopicDTO> listTopic = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT id, questionID FROM Topic WHERE topicID = " + topicID + " AND status = 1";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    listTopic.add(new TopicDTO(rs.getInt("id"), rs.getInt("questionID")));
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
        return listTopic;
    }

    public boolean updateStatusTopic(String topicID, String status) throws SQLException {
        boolean result = false;
        String sql;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                if (status.equals("1")) {
                    sql = "UPDATE Topic SET status = 0 WHERE topicID = " + topicID;
                } else {
                    sql = "UPDATE Topic SET status = 1 WHERE topicID = " + topicID;
                }
                ptm = conn.prepareStatement(sql);
                int row = ptm.executeUpdate();
                if (row > 0) {
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
        }
        return result;
    }

    public boolean createTopic() throws SQLException {
        QuestionDAO dao = new QuestionDAO();
        TopicDAO tDao = new TopicDAO();
        boolean result = false;
        String sql;
        int row = 0, numberOfTopic = 1;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ArrayList<TopicDTO> topic = tDao.getAllTopic();
                if (!topic.isEmpty()) {
                    numberOfTopic = topic.size() + 1;
                }
                ArrayList<QuestionDTO> listQuestion = dao.getRandomQuestionAndAnswer();
                for (QuestionDTO questionDTO : listQuestion) {
                    sql = "INSERT INTO Topic (questionID, topicID, name, status) VALUES ("
                            + questionDTO.getId() + ", " + numberOfTopic + ", N'Bộ đề số " + numberOfTopic + "' ,1)";
                    ptm = conn.prepareStatement(sql);
                    row = ptm.executeUpdate();
                }
                if (row > 0) {
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
        }
        return result;
    }

    public boolean createTopicChoose(String topicName, String numberOfTopic, String questionID) throws SQLException {
        QuestionDAO dao = new QuestionDAO();
        boolean result = false;
        String sql;
        int row = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                sql = "INSERT INTO Topic (questionID, topicID, name, status) VALUES ("
                        + questionID + ", " + numberOfTopic + ", N'" + topicName + "' ,1)";
                ptm = conn.prepareStatement(sql);
                row = ptm.executeUpdate();
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
        return result;
    }

    public boolean checkParalyze(String numberOfTopic) throws SQLException {
        boolean result = false;
        String sql;
        int row = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                sql = "SELECT * FROM Topic AS tp\n"
                        + "JOIN Question AS qe ON qe.id = tp.questionID\n"
                        + "WHERE qe.question_type = 1 AND topicID = " + numberOfTopic;
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                int count = 0;
                while (rs.next()) {
                    count++;
                }
                if (count == 5) {
                    result = true;
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
        return result;
    }

    public boolean checkNormal(String numberOfTopic) throws SQLException {
        boolean result = false;
        String sql;
        int row = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                sql = "SELECT * FROM Topic AS tp\n"
                        + "JOIN Question AS qe ON qe.id = tp.questionID\n"
                        + "WHERE qe.question_type = 0 AND topicID = " + numberOfTopic;
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                int count = 0;
                while (rs.next()) {
                    count++;
                }
                if (count == 30) {
                    result = true;
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
        return result;
    }

    public boolean checkDuplicateTopicName(String topicName) throws SQLException {
        boolean result = false;
        String sql;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                sql = "SELECT * FROM Topic WHERE name = N'" + topicName +"'";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    result = true;
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
        return result;
    }
}
