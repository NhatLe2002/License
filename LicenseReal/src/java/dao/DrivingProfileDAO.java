/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.UserDTO;
import dto.MemberDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Month;
import utils.DBUtils;

/**
 *
 * @author HOANG ANH
 */
public class DrivingProfileDAO {

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

    // cập nhật thông tin member
    public static boolean updateMember(MemberDTO member) {
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                // Cập nhật thông tin trong bảng User
                String userSql = "UPDATE [User] SET [name] = ?, [phone] = ?, [email] = ?, [dob] = ?, [cccd] = ?, [address] = ?, [avatar] = ? WHERE id = ?";
                PreparedStatement userPst = cn.prepareStatement(userSql);
                userPst.setString(1, member.getName());
                userPst.setString(2, member.getPhone());
                userPst.setString(3, member.getEmail());
                userPst.setDate(4, java.sql.Date.valueOf(member.getDob()));
                userPst.setString(5, member.getCccd());
                userPst.setString(6, member.getAddress());
                userPst.setString(7, member.getAvatar());
                userPst.setInt(8, member.getId());
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

    public static boolean addtodrivingprofile(int memberID, String img_cccd, String img_user) {
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String drivingSql = "INSERT INTO [DrivingProfile](memberID,img_cccd,img_user,status) VALUES ("+memberID+",'"+img_cccd+"','"+img_user+"',0)";
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

    public static void main(String[] args) {
        // Tạo một đối tượng Member mới với thông tin cần cập nhật
        MemberDTO member = new MemberDTO();
        member.setId(1);
        member.setName("Hoàng Anh");
        member.setPhone("0987654321");
        member.setEmail("john.smith@example.com");
        member.setDob(LocalDate.of(2002, Month.APRIL, 3));
        member.setCccd("123456789");
        member.setAddress("123 Main Street");
        member.setAvatar("avatar.jpg");
        member.setRole(1);
        member.setHealth("Đã có");

        String imgCCCD = "isdasdg";
        String imgUser = "img_user.jpg";

        // Gọi hàm addtodrivingprofile để thêm thông tin thành viên và hồ sơ lái xe
//        boolean success = addtodrivingprofile(memberID, imgCCCD, imgUser);

        // Kiểm tra kết quả thêm thông tin
//        if (success) {
//            System.out.println("Thêm thông tin thành viên và hồ sơ lái xe thành công.");
//        } else {
//            System.out.println("Thêm thông tin thành viên và hồ sơ lái xe thất bại.");
//        }
    }

}
