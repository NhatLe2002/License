/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.AccountDTO;
import dto.UserDTO;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import utils.DBUtils;
import static utils.DBUtils.getConnection;

/**
 *
 * @author emcua
 */
public class UserDAO extends DBUtils {

    public static boolean createUser(String name, String phone, String email, Date dob, String cccd,
            String address, int accountID) {
        boolean check = false;
        try {
            String sql = "INSERT INTO [User] (name,phone,email,dob,cccd,address,role,status,accountID)"
                    + "values(?,?,?,?,?,?,1,1,?)";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setDate(4, dob);
            ps.setString(5, cccd);
            ps.setString(6, address);
            ps.setInt(7, accountID);
            int row = ps.executeUpdate();
            if (row > 0) {
                check = true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return check;
    }

    public static int updateUser(String name, String phone, String email, Date dob, String cccd,
            String address, int accountID) {
        try {
            String sql = "UPDATE [User] "
                    + "SET name = ?, "
                    + "phone = ?, "
                    + "email = ?, "
                    + "dob = ?, "
                    + "cccd = ?, "
                    + "address = ? "
                    + "WHERE accountID = ?";

            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setDate(4, dob);
            ps.setString(5, cccd);
            ps.setString(6, address);
            ps.setInt(7, accountID);
            ps.executeUpdate();
            return 1;
        } catch (Exception e) {
            System.out.println(e);
            return 0;
        }
    }

    public static void main(String[] args) {
        System.out.println(getUser(6).getName());
    }

    public static UserDTO getUser(int accountID) {
        UserDTO user = new UserDTO();
        try {
            String sql = "select * from [User] where accountID = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, accountID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return user = new UserDTO(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getDate("dob").toLocalDate(),
                        rs.getString("cccd"),
                        rs.getString("address"),
                        rs.getString("avatar"),
                        rs.getInt("role"),
                        rs.getBoolean("status"),
                        rs.getInt("accountID"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

}
