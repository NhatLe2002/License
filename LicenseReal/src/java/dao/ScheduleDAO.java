/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ScheduleDTO;
import java.sql.Connection;
import java.sql.Date;
import static java.sql.JDBCType.NULL;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class ScheduleDAO {

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
                        ScheduleDTO schedule = new ScheduleDTO(id, idMentor, idMember, type, day, time);
                        list.add(schedule);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
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
                        ScheduleDTO schedule = new ScheduleDTO(1, idMentor, idMember, type, day, time);
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
                        ScheduleDTO schedule = new ScheduleDTO(id, idMentor, idMember, type, day, time);
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

    public static void main(String[] args) {

//        for (ScheduleDTO arg : getScheduleNotTeach()) {
//            System.out.println(arg.getMentorID());
//        }
//        insertSchedule(new ScheduleDTO(1, 1, 0, 0, java.sql.Date.valueOf("2023-10-07"), 2));
//        if (insertSchedule(new ScheduleDTO(1, 1, null, null, java.sql.Date.valueOf("2023-10-07"), 2))) {
//            System.out.println("oke");
//        } else {
//            System.out.println("sai");
//        }
        if (updateMenberIDInSchedule(2, 19)) {
            System.out.println("oke");
        }else{
            System.out.println("chua dc");
        }
    }
}