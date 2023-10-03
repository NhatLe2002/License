/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ScheduleDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
                        ScheduleDTO schedule = new ScheduleDTO(id, type, day , time, idMember, idMentor);
                        list.add(schedule);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    public static void main(String[] args) {
        for (ScheduleDTO scheduleDTO : ScheduleDAO.getScheduleByMentorID(1)) {
            System.out.println(scheduleDTO.getDay());
        }
    }
}
