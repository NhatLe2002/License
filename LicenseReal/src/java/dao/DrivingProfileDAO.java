/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.UserDTO;
import dto.MemberDTO;
import dto.DrivingProfile;
import dto.MentorDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import utils.DBUtils;

/**
 *
 * @author HOANG ANH
 */
public class DrivingProfileDAO {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
  
        MemberDTO mdto = getMemberById(1);
        System.out.println(mdto);
}

    // lấy member theo userID
    public static MemberDTO getMemberById(int id) {
        Connection cn = null;
        MemberDTO member = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT U.[id], U.[name], U.[phone], U.[email], U.[dob], U.[cccd], U.[address], U.[avatar], U.[role], M.[health], M.[userID]\n"
                        + "FROM [User] U \n"
                        + "JOIN [Member] M ON U.id = M.userID \n"
                        + "WHERE M.status = 1 AND M.userID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int userId = rs.getInt("userID");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    java.sql.Date dob = rs.getDate("dob");
                    LocalDate localDate = dob.toLocalDate();
                    String cccd = rs.getString("cccd");
                    String address = rs.getString("address");
                    String avatar = rs.getString("avatar");
                    int role = rs.getInt("role");
                    String health = rs.getString("health");
                    UserDTO user = new UserDTO(id, name, phone, email, localDate, cccd, address, avatar, role, true);
                    member = new MemberDTO(id, user, health);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return member;
    }
        public static MentorDTO getMentorById(int id) {
        Connection cn = null;
        MentorDTO mentor = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT U.[id], U.[name], U.[phone], U.[email], U.[dob], U.[cccd], U.[address], U.[avatar], U.[role], M.[certificate],M.[experience], M.[userID]\n" +
"                        FROM [User] U \n" +
"                        JOIN [Mentor] M ON U.id = M.userID \n" +
"                        WHERE M.status = 1 AND M.userID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int userId = rs.getInt("userID");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    java.sql.Date dob = rs.getDate("dob");
                    LocalDate localDate = dob.toLocalDate();
                    String cccd = rs.getString("cccd");
                    String address = rs.getString("address");
                    String avatar = rs.getString("avatar");
                    int role = rs.getInt("role");
                    String certificate = rs.getString("certificate");
                    String experience = rs.getString("experience");
                    UserDTO user = new UserDTO(id, name, phone, email, localDate, cccd, address, avatar, role, true);
                    mentor = new MentorDTO(id, user, certificate, experience);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return mentor;
    }

    // cập nhật thông tin member
    public static boolean updateMember(MemberDTO member, String avatar) {
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                // Cập nhật thông tin trong bảng User
                String userSql = "UPDATE [User] SET [name] = N'" + member.getName() + "', [phone] = '" + member.getPhone() + "', [email] = '" + member.getEmail() + "', [dob] = '" + java.sql.Date.valueOf(member.getDob()) + "', [cccd] = '" + member.getCccd() + "',"
                        + " [address] = '" + member.getAddress() + "', [avatar] = '" + avatar + "' WHERE id = '" + member.getId() + "'";
                PreparedStatement userPst = cn.prepareStatement(userSql);
//                userPst.setString(1, member.getName());
//                userPst.setString(2, member.getPhone());
//                userPst.setString(3, member.getEmail());
//                userPst.setDate(4, java.sql.Date.valueOf(member.getDob()));
//                userPst.setString(5, member.getCccd());
//                userPst.setString(6, member.getAddress());
//                userPst.setString(7, member.getAvatar());
//                userPst.setInt(8, member.getId());
                userPst.executeUpdate();

                // Cập nhật thông tin trong bảng Member
                String memberSql = "UPDATE [Member] SET [health] = ? WHERE userID = ?";
                PreparedStatement memberPst = cn.prepareStatement(memberSql);
                memberPst.setString(1, member.getHealth());
                memberPst.setInt(2, member.getId());
                memberPst.executeUpdate();

                return true;
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (SQLException e) {
                }
            }
        }
        return false;
    }
    
    // member nộp hồ sơ để thi 
    public static boolean addtodrivingprofile(int memberID, String img_cccd, String img_user) {
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String drivingSql = "INSERT INTO [DrivingProfile](memberID,img_cccd,img_user,status) VALUES (" + memberID + ",'" + img_cccd + "','" + img_user + "',0)";
                PreparedStatement drivingPst = cn.prepareStatement(drivingSql);
//                drivingPst.setInt(1, memberID);
//                drivingPst.setString(2, img_cccd);
//                drivingPst.setString(3, img_user);
                drivingPst.executeUpdate();
                return true;
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (SQLException e) {
                }
            }
        }
        return false;
    }
    private static final String CHECK_DUPLICATE_MEMBERID = "SELECT memberID from DrivingProfile WHERE memberID = ?";

    // check trùng lặp hồ sơ
    public boolean checkDuplicateMemberID(int memberID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                statement = conn.prepareStatement(CHECK_DUPLICATE_MEMBERID);
                statement.setInt(1, memberID);
                rs = statement.executeQuery();
                if (rs.next()) {
                    result = true;
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (statement != null) {
                statement.close();
            };
            if (conn != null) {
                conn.close();
            };

        }
        return result;
    }
       //hàm lấy tất cả hồ sơ lấy xe để staff quản lí
    public static ArrayList<DrivingProfile> getAllDrivingProfile() throws SQLException, ClassNotFoundException {
        ArrayList<DrivingProfile> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        conn = DBUtils.getConnection();
        try{
        if (conn != null) {
            String sql = "SELECT m.id AS member_id, u.id AS user_id, u.name, u.phone, u.email, u.cccd, d.img_user, d.status \n" +
"                    FROM DrivingProfile d\n" +
"                    JOIN Member m ON d.memberID = m.id\n" +
"                    JOIN [User] u ON u.id = m.userID\n" +
"                    WHERE d.status = 0";
            ptm = conn.prepareStatement(sql);
            rs = ptm.executeQuery();
            while (rs.next()) {
            int memberId = rs.getInt("member_id");
            int userId = rs.getInt("user_id");
            String name = rs.getString("name");
            String phone = rs.getString("phone");
            String email = rs.getString("email");
            String cccd = rs.getString("cccd");
            String imgUser = rs.getString("img_user");
            boolean status = rs.getBoolean("status");
            UserDTO userDTO = new UserDTO(userId, name, phone, email, cccd);
            MemberDTO memberDTO = new MemberDTO(memberId, userDTO);
            DrivingProfile drivingProfile = new DrivingProfile(memberDTO, imgUser, status);          
            list.add(drivingProfile);
        }
        }
        }catch(SQLException e){
            
        }finally {
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
    //hàm lấy tất cả hồ sơ lấy xe để staff quản lí
    public static boolean getAllDrivingProfile1() throws SQLException, ClassNotFoundException {
        ArrayList<DrivingProfile> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        conn = DBUtils.getConnection();
        try{
        if (conn != null) {
            String sql = "SELECT m.id AS member_id, u.id AS user_id, u.name, u.phone, u.email, u.cccd, d.img_user, d.status \n" +
"                    FROM DrivingProfile d\n" +
"                    JOIN Member m ON d.memberID = m.id\n" +
"                    JOIN [User] u ON u.id = m.userID\n" +
"                    WHERE d.status = 0";
            ptm = conn.prepareStatement(sql);
            rs = ptm.executeQuery();
            if (rs.next()) {
                return true;
            }
        
        }
        }catch(SQLException e){
            
        }finally {
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
    


}

