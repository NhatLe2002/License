/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.MemberDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class MemberDAO {

    public static MemberDTO getMemberByUserID(int id) {
        MemberDTO member = new MemberDTO();
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
                        int idMember = rs.getInt(1);
                        String health = rs.getString(2);
                        boolean status = rs.getBoolean(3);
                        int userID = rs.getInt(4);
                        member = new MemberDTO(idMember, health, status, userID);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return member;
    }
    public static void main(String[] args) {
        System.out.println(getMemberByUserID(1).getId());
    }
}
