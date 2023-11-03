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

//    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//
//<<<<<<< HEAD
//        MemberDTO mdto = getMemberById(11);
//        System.out.println(mdto);
//=======
//        
//        MemberDTO member = getMemberById(4);
//        if (member != null) {
//            int memberIdValue = member.getId(); // Lấy giá trị memberID từ đối tượng MemberDTO
//            System.out.println("MemberID: " + memberIdValue);
//            // Tiếp tục xử lý thông tin thành viên khác
//        } else {
//            System.out.println("Không tìm thấy thành viên có ID " );
//        }
//
//>>>>>>> 6a16a5a6b925d224ee3e5740d927b808877d60b1
//    }
    // lấy member theo userID
    public static MemberDTO getMemberById(int userId) {
        Connection cn = null;
        MemberDTO member = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT U.[id], U.[name], U.[phone], U.[email], U.[dob], U.[cccd], U.[address], U.[avatar], U.[role],M.[id] AS memberID, M.[health], M.[userID]\n"
                        + "FROM [User] U \n"
                        + "JOIN [Member] M ON U.id = M.userID \n"
                        + "WHERE M.status = 1 AND M.userID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, userId);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int id = rs.getInt("memberID");
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
                    UserDTO user = new UserDTO(userId, name, phone, email, localDate, cccd, address, avatar, role, true);
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
    


    public static MemberDTO getMemberByMemberId(int id) {
        Connection cn = null;
        MemberDTO member = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT U.[id], U.[name], U.[phone], U.[email], U.[dob], U.[cccd], U.[address], U.[avatar], U.[role], M.[health], M.[userID]\n"
                        + "FROM [User] U \n"
                        + "JOIN [Member] M ON U.id = M.userID \n"
                        + "WHERE M.status = 1 AND M.id = ?";
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

    public static boolean checkAge(LocalDate dob) {
        LocalDate currentDate = LocalDate.now();
        LocalDate eighteenYearsAgo = currentDate.minusYears(18);

        return dob.isBefore(eighteenYearsAgo);
    }

    public static MentorDTO getMentorById(int userId) {
        Connection cn = null;
        MentorDTO mentor = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT U.[id], U.[name], U.[phone], U.[email], U.[dob], U.[cccd], U.[address], U.[avatar], U.[role],M.[id] AS mentorID, M.[certificate],M.[experience], M.[userID]\n"
                        + "                        FROM [User] U \n"
                        + "                        JOIN [Mentor] M ON U.id = M.userID \n"
                        + "                        WHERE M.status = 1 AND M.userID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, userId);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int id = rs.getInt("mentorID");
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
                    UserDTO user = new UserDTO(userId, name, phone, email, localDate, cccd, address, avatar, role, true);
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
                        + " [address] = '" + member.getAddress() + "', [avatar] = '" + avatar + "' WHERE id = '" + member.getUserID() + "'";
                PreparedStatement userPst = cn.prepareStatement(userSql);
                userPst.executeUpdate();

                // Cập nhật thông tin trong bảng Member
                String memberSql = "UPDATE [Member] SET [health] = ? WHERE userID = ?";
                PreparedStatement memberPst = cn.prepareStatement(memberSql);
                String heo = "";
                if ("yes".equals(member.getHealth())) {
                    heo = "Đã có";
                } else {
                    heo = "Chưa có";
                }
                memberPst.setString(1, heo);
                memberPst.setInt(2, member.getUserID());
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
    // cập nhật thông tin mentor
    public static boolean updateMentor(MentorDTO mentor, String avatar) {
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                // Cập nhật thông tin trong bảng User
                String userSql = "UPDATE [User] SET [name] = N'" + mentor.getName() + "', [phone] = '" + mentor.getPhone() + "', [email] = '" + mentor.getEmail() + "', [dob] = '" + java.sql.Date.valueOf(mentor.getDob()) + "', [cccd] = '" + mentor.getCccd() + "',"
                        + " [address] = '" + mentor.getAddress() + "', [avatar] = '" + avatar + "' WHERE id = '" + mentor.getUserID() + "'";
                PreparedStatement userPst = cn.prepareStatement(userSql);
                userPst.executeUpdate();

                // Cập nhật thông tin trong bảng Member
                String mentorSql = "UPDATE [Mentor] SET certificate = N'" + mentor.getCertificate() +"', experience = N'"+ mentor.getExperience() +"' WHERE userID = " + mentor.getUserID();
                PreparedStatement memberPst = cn.prepareStatement(mentorSql);
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
    public static boolean addtodrivingprofile(int memberID, String img_cccd, String img_user, boolean gender, boolean flag) {
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String drivingSql = "INSERT INTO [DrivingProfile](memberID,img_cccd,img_user,gender,flag,status) VALUES (" + memberID + ",'" + img_cccd + "','" + img_user + "','" + gender + "' , '" + flag + "', 0)";
                PreparedStatement drivingPst = cn.prepareStatement(drivingSql);
//                drivingPst.setInt(1, memberID);
//                drivingPst.setString(2, img_cccd);
//                drivingPst.setString(3, img_user);
                int row = drivingPst.executeUpdate();
                if (row > 0) {
                    return true;
                }
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

    
    public static DrivingProfile getDrivingProfileById(int id) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        DrivingProfile drivingProfile = null;
        conn = DBUtils.getConnection();
        try {

            String sql = "SELECT m.id AS member_id, u.id AS user_id, u.name, u.phone, u.email, u.cccd, u.dob, u.address, d.img_user, d.img_cccd, m.health,d.gender, d.flag , d.status \n"
                    + "                    FROM DrivingProfile d\n"
                    + "                    JOIN Member m ON d.memberID = m.id\n"
                    + "                    JOIN [User] u ON u.id = m.userID WHERE m.id = " + id;
            ptm = conn.prepareStatement(sql);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int memberId = rs.getInt("member_id");
                int userId = rs.getInt("user_id");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String cccd = rs.getString("cccd");
                java.sql.Date dob = rs.getDate("dob");
                LocalDate localDate = dob.toLocalDate();
                String address = rs.getString("address");
                String imgUser = rs.getString("img_user");
                String imgCCCD = rs.getString("img_cccd");
                String health = rs.getString("health");
                boolean gender = rs.getBoolean("gender");
                boolean flag = rs.getBoolean("flag");
                boolean status = rs.getBoolean("status");
                UserDTO userDTO = new UserDTO(userId, name, phone, email, localDate, cccd, address);
                MemberDTO memberDTO = new MemberDTO(id, userDTO, health);
                drivingProfile = new DrivingProfile(memberDTO, imgCCCD, imgUser, gender, flag, status);
            }

        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return drivingProfile;
    }

    public static DrivingProfile getDrivingProfileByUserId(int userId) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        DrivingProfile drivingProfile = null;
        conn = DBUtils.getConnection();
        try {
            String sql = "SELECT m.id AS member_id, u.id AS user_id, u.name, u.phone, u.email, u.cccd, u.dob, u.address, d.img_user, d.img_cccd, m.health,d.gender, d.flag , d.status \n"
                    + "FROM DrivingProfile d\n"
                    + "JOIN Member m ON d.memberID = m.id\n"
                    + "JOIN [User] u ON u.id = m.userID\n"
                    + "WHERE u.id = ?";
            ptm = conn.prepareStatement(sql);
            ptm.setInt(1, userId);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int memberId = rs.getInt("member_id");
                int id = rs.getInt("user_id");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String cccd = rs.getString("cccd");
                java.sql.Date dob = rs.getDate("dob");
                LocalDate localDate = dob.toLocalDate();
                String address = rs.getString("address");
                String imgUser = rs.getString("img_user");
                String imgCCCD = rs.getString("img_cccd");
                String health = rs.getString("health");
                boolean gender = rs.getBoolean("gender");
                boolean flag = rs.getBoolean("flag");
                boolean status = rs.getBoolean("status");
                UserDTO userDTO = new UserDTO(id, name, phone, email, localDate, cccd, address);
                MemberDTO memberDTO = new MemberDTO(memberId, userDTO, health);
                drivingProfile = new DrivingProfile(memberDTO, imgCCCD, imgUser, gender, flag, status);
            }
        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return drivingProfile;
    }

    //hàm lấy tất cả hồ sơ lấy xe để staff quản lí
    public static ArrayList<DrivingProfile> getAllDrivingProfile() throws SQLException, ClassNotFoundException {
        ArrayList<DrivingProfile> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        conn = DBUtils.getConnection();
        try {
            if (conn != null) {
                String sql = "SELECT m.id AS member_id, u.id AS user_id, u.name, u.phone, u.email, u.cccd, d.img_user,d.gender, d.flag , d.status \n"
                        + "                    FROM DrivingProfile d\n"
                        + "                    JOIN Member m ON d.memberID = m.id\n"
                        + "                    JOIN [User] u ON u.id = m.userID\n";
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
                    boolean gender = rs.getBoolean("gender");
                    boolean flag = rs.getBoolean("flag");
                    boolean status = rs.getBoolean("status");
                    UserDTO userDTO = new UserDTO(userId, name, phone, email, cccd);
                    MemberDTO memberDTO = new MemberDTO(memberId, userDTO);
                    DrivingProfile drivingProfile = new DrivingProfile(memberDTO, memberId, imgUser, gender, flag, status);
                    list.add(drivingProfile);
                }
            }
        } catch (SQLException e) {

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
        return list;
    }

    // update status hồ sơ lái xe
    public boolean updateStatusDriving(String memberID, String status) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        boolean result = false;
        String sql;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                if (status.equals("1")) {
                    sql = "UPDATE DrivingProfile SET status = 0 WHERE memberID = " + memberID;
                } else {
                    sql = "UPDATE DrivingProfile SET status = 1 WHERE memberID = " + memberID;
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

    //hàm lấy tất cả hồ sơ lấy xe để staff quản lí
    public static boolean getAllDrivingProfile1() throws SQLException, ClassNotFoundException {
        ArrayList<DrivingProfile> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        conn = DBUtils.getConnection();
        try {
            if (conn != null) {
                String sql = "SELECT m.id AS member_id, u.id AS user_id, u.name, u.phone, u.email, u.cccd, d.img_user, d.status \n"
                        + "                    FROM DrivingProfile d\n"
                        + "                    JOIN Member m ON d.memberID = m.id\n"
                        + "                    JOIN [User] u ON u.id = m.userID\n"
                        + "                    WHERE d.status = 0";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return true;
                }

            }
        } catch (SQLException e) {

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
        return false;
    }

}
