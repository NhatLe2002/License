/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.PaymentDTO;
import dto.ScheduleDTO;
import java.sql.Connection;
import java.sql.Date;
import static java.sql.JDBCType.NULL;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class ScheduleDAO {

    private Connection conn;
    private PreparedStatement ptm;
    private ResultSet rs;

    public static ArrayList<ScheduleDTO> getScheduleByMentorID(int id) {
        ArrayList<ScheduleDTO> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select * from Schedule where mentorID = ?";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int idSche = rs.getInt("id");
                        int type = rs.getInt("type");
                        Date day = rs.getDate("day");
                        int time = rs.getInt("time");
                        int idMentor = rs.getInt("mentorID");
                        int idMember = rs.getInt("memberID");
                        ScheduleDTO schedule = new ScheduleDTO(idSche, idMentor, idMember, type, day, time);
                        list.add(schedule);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static ScheduleDTO getScheduleById(int id) {
        ScheduleDTO schedule = new ScheduleDTO();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select * from Schedule where id = ?";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        schedule = new ScheduleDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getDate(5), rs.getInt(6));
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return schedule;
    }

    public static ArrayList<ScheduleDTO> getScheduleNotTeach() {
        ArrayList<ScheduleDTO> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT * FROM Schedule WHERE memberID IS NULL";

                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int idSche = rs.getInt("id");
                        int type = rs.getInt("type");
                        Date day = rs.getDate("day");
                        int time = rs.getInt("time");
                        int idMentor = rs.getInt("mentorID");
                        int idMember = rs.getInt("memberID");
                        ScheduleDTO schedule = new ScheduleDTO(idSche, idMentor, idMember, type, day, time);
                        list.add(schedule);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static ArrayList<ScheduleDTO> getScheduleCanRegis(int userId) {
        ArrayList<ScheduleDTO> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT * FROM Schedule \n"
                        + "WHERE memberID IS NULL \n"
                        + "AND CONCAT(day, '_', time) NOT IN (\n"
                        + "    SELECT CONCAT(day, '_', time) FROM Schedule WHERE memberID = ?\n"
                        + ")";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, userId);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int idSche = rs.getInt("id");
                        int type = rs.getInt("type");
                        Date day = rs.getDate("day");
                        int time = rs.getInt("time");
                        int idMentor = rs.getInt("mentorID");
                        int idMember = rs.getInt("memberID");
                        ScheduleDTO schedule = new ScheduleDTO(idSche, idMentor, idMember, type, day, time);
                        list.add(schedule);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static ArrayList<ScheduleDTO> getScheduleByMemberID(int id) {
        ArrayList<ScheduleDTO> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select * from Schedule where memberID = ?";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int idSche = rs.getInt("id");
                        int type = rs.getInt("type");
                        Date day = rs.getDate("day");
                        int time = rs.getInt("time");
                        int idMentor = rs.getInt("mentorID");
                        int idMember = rs.getInt("memberID");
                        ScheduleDTO schedule = new ScheduleDTO(idSche, idMentor, idMember, type, day, time);
                        list.add(schedule);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static ArrayList<ScheduleDTO> getScheduleByDateAndMemberId(LocalDate date, int memberId) {
        ArrayList<ScheduleDTO> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "  SELECT * FROM Schedule \n"
                        + "  WHERE day >= ?\n"
                        + "  AND memberID = ?";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setDate(1, java.sql.Date.valueOf(date));
                pst.setInt(2, memberId);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int idSche = rs.getInt("id");
                        int type = rs.getInt("type");
                        Date day = rs.getDate("day");
                        int time = rs.getInt("time");
                        int idMentor = rs.getInt("mentorID");
                        int idMember = rs.getInt("memberID");
                        ScheduleDTO schedule = new ScheduleDTO(idSche, idMentor, idMember, type, day, time);
                        list.add(schedule);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static boolean insertSchedule(ScheduleDTO schedule) {
        String sql = "insert into Schedule values(?,?,?,?,?)";
        Connection cn = null;
        boolean check = false;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                PreparedStatement st = cn.prepareStatement(sql);
                st.setInt(1, schedule.getMentorID());
                if (schedule.getMemberID() == null) {
                    st.setNull(2, Types.INTEGER);
                } else {
                    st.setInt(2, schedule.getMemberID());
                }
                if (schedule.getType() == null) {
                    st.setNull(3, Types.INTEGER);
                } else {
                    st.setInt(3, schedule.getType());
                }
                st.setDate(4, schedule.getDay());
                st.setInt(5, schedule.getTime());
                st.executeUpdate();
                check = true;
            }
        } catch (Exception e) {

        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        return check;
    }

    public static boolean updateMenberIDInSchedule(int ScheID, int memberID) {
        String sql = "update Schedule set memberID = ? where id = ?";
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                PreparedStatement st = cn.prepareStatement(sql);
                st.setInt(1, memberID);
                st.setInt(2, ScheID);
                st.executeUpdate();
                return true;
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
        return false;
    }

    public static boolean updateScheduleById(int ScheID) {
        String sql = "update Schedule set memberID = NULL where id = ?";
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                PreparedStatement st = cn.prepareStatement(sql);
                st.setInt(1, ScheID);
                st.executeUpdate();
                return true;
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
        return false;
    }

    public static boolean deleteSchedule(int scheduleId) {
        boolean result = false;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "DELETE FROM Schedule WHERE id = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, scheduleId);
                int rowsDeleted = pst.executeUpdate(); // Sử dụng executeUpdate() thay vì executeQuery()

                if (rowsDeleted > 0) {
                    result = true;
                } else {
                    System.out.println("No rows were deleted for scheduleId: " + scheduleId);
                }
            } else {
                System.out.println("Cannot delete order");
            }
        } catch (Exception e) {
            try {
                if (cn != null) {
                    cn.rollback();
                }
            } catch (Exception a) {
                e.printStackTrace();
            }
            e.printStackTrace();
            result = false;
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public static int getNumOfRemaining(int memberId) {
        PaymentDAO paymentDao = new PaymentDAO();
        //Lấy tất cả thanh toán trong 1 tháng
        ArrayList<PaymentDTO> paymentList = paymentDao.getPaymentIn1Month(memberId);
        int tong = 0;
        for (PaymentDTO paymentDTO : paymentList) {
            int type = Character.getNumericValue(paymentDTO.getType().charAt(0));
            if (type == 3) {
                tong += 3;
            } else if (type == 5) {
                tong += 5;
            }
        }
        LocalDate mindate = paymentDao.getDateMin(memberId);
        ArrayList<ScheduleDTO> schedule = getScheduleByDateAndMemberId(mindate, memberId);
        return tong - schedule.size();
    }

    public static void main(String[] args) {

//        for (ScheduleDTO arg : getScheduleByMemberID(MemberDAO.getMemberByUserID(5).getId())) {
//            System.out.println(arg.getMentorID());
//        }
//        insertSchedule(new ScheduleDTO(1, 1, 0, 0, java.sql.Date.valueOf("2023-10-07"), 2));
//        if (insertSchedule(new ScheduleDTO(1, 1, null, null, java.sql.Date.valueOf("2023-10-07"), 2))) {
//            System.out.println("oke");
//        } else {
//            System.out.println("sai");
//        }
//        if (updateMenberIDInSchedule(2, 19)) {
//            System.out.println("oke");
//        }else{
//            System.out.println("chua dc");
//        }
//        ArrayList<ScheduleDTO> mentorScheduleNotTeache = ScheduleDAO.getScheduleNotTeach();
//        ArrayList<ScheduleDTO> scheduleMemberCanRegis = mentorScheduleNotTeache;
//        for (ScheduleDTO mentorSche : mentorScheduleNotTeache) {
//            for (ScheduleDTO memberSche : ScheduleDAO.getScheduleByMemberID(1)) {
//                if (mentorSche.getDay() == memberSche.getDay() && mentorSche.getTime() == memberSche.getTime()) {
//                    scheduleMemberCanRegis.remove(memberSche);
//                    for (ScheduleDTO scheduleMemberCanRegi : scheduleMemberCanRegis) {
//                        System.out.println(scheduleMemberCanRegi.getDay());
//                    }
//                }
//            }
//        }
//        for (ScheduleDTO scheduleMemberCanRegi : scheduleMemberCanRegis) {
//            System.out.println(scheduleMemberCanRegi.getDay());
//        }
//        if (updateMenberIDInSchedule(1, 5)) {
//            System.out.println("oke");
//        }else{
//            System.out.println("chua dc");
//        }
//        System.out.println(getScheduleById(4).getDay());
//        ScheduleDAO dao = new ScheduleDAO();
//        ArrayList<ScheduleDTO> list;
//        try {
//            list = dao.getAllMentorRevenue(2023);
//            System.out.println(list);
//        } catch (SQLException ex) {
//            Logger.getLogger(ScheduleDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
        System.out.println(deleteSchedule(67));

    }

    public ArrayList<ScheduleDTO> getAllMentorRevenue(int year) throws SQLException {
        ArrayList<ScheduleDTO> list = new ArrayList<>();
        try {
            conn = null;
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT us.name, SUM(sc.mentorID) * 0.3 AS total\n"
                        + "FROM Mentor AS mt\n"
                        + "JOIN [User] AS us ON us.id = mt.userID\n"
                        + "JOIN Schedule AS sc ON sc.mentorID = mt.id\n"
                        + "WHERE YEAR(sc.day) = '" + year + "'\n"
                        + "GROUP BY us.name\n"
                        + "ORDER BY total DESC;";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new ScheduleDTO(rs.getString("name"), rs.getFloat("total")));
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
        return list;
    }
}
