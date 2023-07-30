/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlnt.dao;

import com.qlnt.entity.HangHoa;
import com.qlnt.util.XDate;
import com.qlnt.util.XJdbc;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author monst
 */
public class HangHoaDAO extends qlntDAO<HangHoa, String>{

    @Override
    public void insert(HangHoa hanghoa) {
        String sql = "INSERT INTO HANGHOA (MaThuoc, SoLo, HSD, SoLuongGoc, DonViGoc, "
                + "SLSauQuiDoi, DonViQUiDoi, GiaVon, GiaBan, GhiChu, NgayTao) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        XJdbc.update(sql, 
                hanghoa.getMaThuoc(),
                hanghoa.getSoLo(),
                XDate.toString(hanghoa.getHSD(), "MM/dd/yyyy"),
                hanghoa.getSlGoc(),
                hanghoa.getDvGoc(),
                hanghoa.getSlSauQuiDoi(),
                hanghoa.getDvQuiDoi(),
                hanghoa.getGiaVon(),
                hanghoa.getGiaBan(),
                hanghoa.getGhiChu(),
                XDate.toString(hanghoa.getNgayTao(), "MM/dd/yyyy")
                );        
    }

    @Override
    public void update(HangHoa hanghoa) {
        String sql = "UPDATE HANGHOA SET MaThuoc=?, SoLo=?, HSD=?, SoLuongGoc=?, DonViGoc=?, SLSauQuiDoi=?, "
                + "DonViQuiDoi=?, GiaVon=?, GiaBan=?, GhiChu=?, NgayTao=? WHERE MaHH=?";
        XJdbc.update(sql, 
                hanghoa.getMaThuoc(),
                hanghoa.getSoLo(),
                XDate.toString(hanghoa.getHSD(), "MM/dd/yyyy"),
                hanghoa.getSlGoc(),
                hanghoa.getDvGoc(),
                hanghoa.getSlSauQuiDoi(),
                hanghoa.getDvQuiDoi(),
                hanghoa.getGiaVon(),
                hanghoa.getGiaBan(),
                hanghoa.getGhiChu(),
                XDate.toString(hanghoa.getNgayTao(), "MM/dd/yyyy"),
                hanghoa.getMaHH()
                );
    }

    @Override
    public void delete(String id) {
        String sql = "DELETE FROM HangHoa WHERE MaHH=?";
        XJdbc.update(sql, id);
    }

    @Override
    public HangHoa selectById(String id) {
        String sql = "SELECT * FROM HANGHOA WHERE MAHH =?";
        List<HangHoa> list = this.selectBySql(sql, id);
        return list.size() > 0 ? list.get(0) : null;
                
    }

    @Override
    public List<HangHoa> selectAll() {
        String sql = "SELECT * FROM HANGHOA";
        return this.selectBySql(sql);
    }

    @Override
    protected List<HangHoa> selectBySql(String sql, Object... args) {
        List<HangHoa> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = XJdbc.query(sql, args);                
                while (rs.next()) {
                    HangHoa hh = new HangHoa();
                    hh.setMaHH(rs.getString("MAHH"));
                    hh.setMaThuoc(rs.getString("MaThuoc"));
                    hh.setSoLo(rs.getString("SoLo"));
                    hh.setHSD(rs.getDate("HSD"));
                    hh.setSlGoc(rs.getDouble("SoLuongGoc"));
                    hh.setDvGoc(rs.getString("DonViGoc"));
                    hh.setSlSauQuiDoi(rs.getDouble("SLSauQuiDoi"));
                    hh.setDvQuiDoi(rs.getString("DonViQuiDoi"));
                    hh.setGiaVon(rs.getDouble("GiaVon"));
                    hh.setGiaBan(rs.getDouble("GiaBan"));
                    hh.setGhiChu(rs.getString("GhiChu"));
                    hh.setNgayTao(rs.getDate("NgayTao"));              
                    list.add(hh);                    
                }
            } finally {
                rs.getStatement().getConnection().close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return list;
    }
    public List<HangHoa> selectNotInCourse(String keyword) {
        String sql = "SELECT * FROM HangHoa WHERE MaThuoc LIKE ?";        
        return this.selectBySql(sql, "%" + keyword + "%");
    }
}
