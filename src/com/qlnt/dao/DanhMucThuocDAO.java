/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlnt.dao;

import com.qlnt.entity.DanhMucThuoc;
import com.qlnt.entity.DanhMucThuoc;
import com.qlnt.util.XJdbc;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author monst
 */
public class DanhMucThuocDAO extends qlntDAO<DanhMucThuoc, String> {

    @Override
    public void insert(DanhMucThuoc danhmucthuoc) {
        String sql = "INSERT into DanhMucThuoc (TenThuoc, SoDK, HangSX, NoiSX, DonViGoc, DonViQuiDoi, DongGoi"
                + ", MaNT, HoatChat, SoLuongQuiDoi) values(?,?,?,?,?,?,?,?,?,?)";
        XJdbc.update(sql,
                danhmucthuoc.getTenThuoc(),
                danhmucthuoc.getSoDK(),
                danhmucthuoc.getHangSX(),
                danhmucthuoc.getNoiSX(),
                danhmucthuoc.getDonViGoc(),
                danhmucthuoc.getDonViQuiDoi(),
                danhmucthuoc.getDongGoi(),
                danhmucthuoc.getMaNT(),
                danhmucthuoc.getHoatChat(),
                danhmucthuoc.getSoLuongQuiDoi()
        );
    }

    @Override
    public void update(DanhMucThuoc danhmucthuoc) {
        String sql = "UPDATE DanhMucThuoc SET TenThuoc=?, SoDK=?, HangSX=?, NoiSX=?, DonViGoc=?, DonViQuiDoi=?"
                + ", DongGoi=?, MaNT=?, HoatChat=?, SoLuongQuiDoi=? WHERE MaThuoc=?";
        XJdbc.update(sql,
                danhmucthuoc.getTenThuoc(),
                danhmucthuoc.getSoDK(),
                danhmucthuoc.getHangSX(),
                danhmucthuoc.getNoiSX(),
                danhmucthuoc.getDonViGoc(),
                danhmucthuoc.getDonViQuiDoi(),
                danhmucthuoc.getDongGoi(),
                danhmucthuoc.getMaNT(),
                danhmucthuoc.getHoatChat(),
                danhmucthuoc.getSoLuongQuiDoi(),
                danhmucthuoc.getMaThuoc()
        );
    }

    @Override
    public void delete(String id) {
        String sql = "DELETE FROM DanhMucThuoc WHERE MaThuoc=?";
        XJdbc.update(sql, id);
    }

    @Override
    public DanhMucThuoc selectById(String id) {
        String sql = "SELECT * FROM DanhMucThuoc WHERE MaThuoc=? ";
        List<DanhMucThuoc> list = this.selectBySql(sql, id);
        return list.size() > 0 ? list.get(0) : null;
    }
    
    @Override
    public List<DanhMucThuoc> selectAll() {
        String sql = "SELECT * FROM DanhMucThuoc";
        return this.selectBySql(sql);
    }

    @Override
    protected List<DanhMucThuoc> selectBySql(String sql, Object... args) {
        List<DanhMucThuoc> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = XJdbc.query(sql, args);                
                while (rs.next()) {
                    DanhMucThuoc dmt = new DanhMucThuoc();
                    dmt.setMaThuoc(rs.getString("MaThuoc"));
                    dmt.setTenThuoc(rs.getString("TenThuoc"));
                    dmt.setSoDK(rs.getString("SoDK"));
                    dmt.setNoiSX(rs.getString("NoiSX"));
                    dmt.setHangSX(rs.getString("HangSX"));
                    dmt.setDonViGoc(rs.getString("DonViGoc"));
                    dmt.setDonViQuiDoi(rs.getString("DonViQuiDoi"));
                    dmt.setSoLuongQuiDoi(Double.valueOf(rs.getString("SoLuongQuiDoi")));
                    dmt.setDongGoi(rs.getString("DongGoi"));
                    dmt.setMaNT(rs.getString("MaNT"));
                    dmt.setHoatChat(rs.getString("HoatChat"));
                    list.add(dmt);
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

    public List<DanhMucThuoc> selectNotInCourse(String keyword) {
        String sql = "SELECT * FROM DanhMucThuoc WHERE TenThuoc LIKE ?";        
        return this.selectBySql(sql, "%" + keyword + "%");
    }
}
