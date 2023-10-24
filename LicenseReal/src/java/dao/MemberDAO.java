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
                String sql = "select * from Member where userID = ?";

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

    public static boolean createMember(int userID) {
        boolean check = false;
        try {

            String sql = "INSERT INTO Member(status,userID)"
                    + "values(1,?)";
            PreparedStatement ps = DBUtils.getConnection().prepareStatement(sql);
            ps.setInt(1, userID);
            int row = ps.executeUpdate();
            if (row > 0) {
                check = true;
            } else {
                check = false;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return check;

    }

//    public static void main(String[] args) {
//        System.out.println(createAccount(1));
//    }
}
