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
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;
import static utils.DBUtils.getConnection;
import utils.Util;

/**
 *
 * @author emcua
 */
public class UserDAO extends DBUtils {

    public static int createUser(String name, String phone, String email, Date dob, String cccd,
            String address, int accountID) {

        try {
            if (!Util.validateAllDigits(phone.trim())) {
                return 1; // khong dung dinh dang phone
            } else if (!Util.validateEmail(email)) {
                return 2; // khong dung dinh dang email
            } else if (!Util.validateNotFutureDate(dob.toLocalDate())) {
                return 3; // ngay o? tuong lai
            } else if (!Util.validateAge(dob.toLocalDate())) {
                return 4; // duoi 18 t
            } else {
                String sql = "INSERT INTO [User] (name,phone,email,dob,cccd,address,role,status,accountID,avatar)"
                        + "values(?,?,?,?,?,?,1,1,?,'no')";
                PreparedStatement ps = getConnection().prepareStatement(sql);
                ps.setString(1, name);
                ps.setString(2, phone);
                ps.setString(3, email);
                ps.setDate(4, dob);
                ps.setString(5, cccd);
                ps.setString(6, address);
                ps.setInt(7, accountID);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

        public static UserDTO getUserbyAccountID(int accountID) {
        UserDTO user = new UserDTO();
        try {
            String sql = "  select * from [dbo].[User] where accountID = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, accountID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return user = new UserDTO(rs.getInt("id"), accountID);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
        
    public static boolean createStaff(String name, String phone, String email, String dobString, String cccd,
            String address, int accountID, String avatar) {

        try {
            java.sql.Date dob = java.sql.Date.valueOf(dobString); // Giá trị ngày sinh dưới dạng java.sql.Date

// Chuyển đổi sang java.time.LocalDate
            LocalDate localDate = dob.toLocalDate();
            Date date = java.sql.Date.valueOf(localDate);
            
            if (!Util.validateAllDigits(phone.trim())) {
                return false; // khong dung dinh dang phone
            } else if (!Util.validateEmail(email)) {
                return false; // khong dung dinh dang email
            } else if (!Util.validateNotFutureDate(dob.toLocalDate())) {
                return false; // ngay o? tuong lai
            } else if (!Util.validateAge(dob.toLocalDate())) {
                return false; // duoi 18 t
            } else {
                String sql = "  INSERT INTO [User] (name,phone,email,dob,cccd,address,role,status,accountID,avatar) values(?,?,?,?,?,?,3,1,?,?)";
                PreparedStatement ps = getConnection().prepareStatement(sql);
                ps.setString(1, name);
                ps.setString(2, phone);
                ps.setString(3, email);
                ps.setDate(4, dob);
                ps.setString(5, cccd);
                ps.setString(6, address);
                ps.setInt(7, accountID);
                ps.setString(8, avatar);
                ps.executeUpdate();
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    
        public static boolean createMentor(String name, String phone, String email, String dobString, String cccd,
            String address, int accountID, String avatar) {

        try {
            java.sql.Date dob = java.sql.Date.valueOf(dobString); // Giá trị ngày sinh dưới dạng java.sql.Date

// Chuyển đổi sang java.time.LocalDate
            LocalDate localDate = dob.toLocalDate();
            Date date = java.sql.Date.valueOf(localDate);
            
            if (!Util.validateAllDigits(phone.trim())) {
                return false; // khong dung dinh dang phone
            } else if (!Util.validateEmail(email)) {
                return false; // khong dung dinh dang email
            } else if (!Util.validateNotFutureDate(dob.toLocalDate())) {
                return false; // ngay o? tuong lai
            } else if (!Util.validateAge(dob.toLocalDate())) {
                return false; // duoi 18 t
            } else {
                String sql = "  INSERT INTO [User] (name,phone,email,dob,cccd,address,role,status,accountID,avatar) values(?,?,?,?,?,?,2,1,?,?)";
                PreparedStatement ps = getConnection().prepareStatement(sql);
                ps.setString(1, name);
                ps.setString(2, phone);
                ps.setString(3, email);
                ps.setDate(4, dob);
                ps.setString(5, cccd);
                ps.setString(6, address);
                ps.setInt(7, accountID);
                ps.setString(8, avatar);
                ps.executeUpdate();
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public static int updateUser(String name, String phone, String email, Date dob, String cccd,
            String address, int accountID) {
        try {
            if (!Util.validateAllDigits(phone.trim())) {
                return 1; // khong dung dinh dang phone
            } else if (!Util.validateEmail(email)) {
                return 2; // khong dung dinh dang email
            } else if (!Util.validateNotFutureDate(dob.toLocalDate())) {
                return 3; // ngay o? tuong lai
            } else if (!Util.validateAge(dob.toLocalDate())) {
                return 4; // duoi 18 t
            } else {
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
            }
        } catch (Exception e) {
            System.out.println(e);

        }
        return 0;
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
            return null;
        }
        return null;
    }

    public static String getEmailByID(int accountID) {
        String email = null;
        try {
            String sql = "select * from [User] where accountID = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, accountID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return email = rs.getString("email");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return email;
    }

    public static List<UserDTO> getListByRole(int role) {
        List<UserDTO> list = new ArrayList<>();
        UserDTO user = new UserDTO();
        try {
            String sql = "select * from [User] where role = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, role);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new UserDTO(rs.getInt("id"),
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
                list.add(user);
            }
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
        return list;
    }

    public static void main(String[] args) {
//        System.out.println(UserDAO.getListByRole(2));
//        List<UserDTO> list = UserDAO.getListByRole(2);
//        System.out.println(list.size());
    }

}
