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
        boolean checkInsert = tDao.createTopic();
        if (checkInsert) {
            System.out.println("Success");
        } else {
            System.out.println("Fail");
        }
    }

    public ArrayList<TopicDTO> getAllTopic() throws SQLException {
        ArrayList<TopicDTO> listTopic = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT DISTINCT topicID, status FROM Topic";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    listTopic.add(new TopicDTO(rs.getInt("topicID"), rs.getBoolean("status")));
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
        int row = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ArrayList<TopicDTO> topic = tDao.getAllTopic();
                int numberOfTopic = topic.size() + 1;
                ArrayList<QuestionDTO> listQuestion = dao.getRandomQuestionAndAnswer();
                for (QuestionDTO questionDTO : listQuestion) {
                    sql = "INSERT INTO Topic (questionID, topicID, status) VALUES (" + questionDTO.getId() + ", " + numberOfTopic + ",1)";
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
}