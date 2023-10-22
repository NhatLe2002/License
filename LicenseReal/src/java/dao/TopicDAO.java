package dao;

import dto.AnswerDTO;
import dto.QuestionDTO;
import dto.TopicDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.DBUtils;

public class TopicDAO {

    private Connection conn;
    private PreparedStatement ptm;
    private ResultSet rs;

    public static void main(String[] args) throws SQLException {
        TopicDAO dao = new TopicDAO();
        ArrayList<TopicDTO> listTopic = new ArrayList<TopicDTO>();
        ArrayList<TopicDTO> list = dao.getAllQuestionInTopic("1");
        QuestionDAO questionDAO = new QuestionDAO();
        for (TopicDTO topicDTO : list) {
            String questionID = String.valueOf(topicDTO.getQuestionID());
            QuestionDTO questionDTO = questionDAO.getQuestionByID(questionID);
            listTopic.add(new TopicDTO(questionDTO));
        }
        for (TopicDTO topicDTO : listTopic) {
            System.out.println(topicDTO.getList());
        }
    }

    public ArrayList<TopicDTO> getAllTopic() throws SQLException {
        ArrayList<TopicDTO> listTopic = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT DISTINCT topicID FROM Topic WHERE status = 1";
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
                String sql = "SELECT id, questionID FROM Topic WHERE topicID = 1 AND status = 1";
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

}
