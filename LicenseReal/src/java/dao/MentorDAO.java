/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.MentorDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class MentorDAO {
    public static MentorDTO getMentorByUserID(int id) {
        MentorDTO mentor = new MentorDTO();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select * from Mentor where userID = ?";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int idMentor = rs.getInt("id");
                        String cer = rs.getString("certificate");
                        String exp = rs.getString("experience");
                        boolean status = rs.getBoolean("status");
                        int userID = id;
                        mentor = new MentorDTO(idMentor, cer, exp, status, userID);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return mentor;
    }
    public static void main(String[] args) {
        System.out.println(getMentorByUserID(1).getId());
    }
}
