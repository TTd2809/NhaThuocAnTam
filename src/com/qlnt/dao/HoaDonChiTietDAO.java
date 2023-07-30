/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlnt.dao;

import com.qlnt.entity.HoaDonChiTiet;
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
public class HoaDonChiTietDAO extends qlntDAO<HoaDonChiTiet, String> {

    @Override
    public void insert(HoaDonChiTiet hdct) {
        String sql = "INSERT INTO HoaDonChiTiet (MaHDCT, MaHH, SoLuong, DonGia) VALUES (?,?,?,?)";
        XJdbc.update(sql,
                hdct.getMaHD(),
                hdct.getMaHH(),
                hdct.getSoLuong(),
                hdct.getDonGia()
        );

    }

    @Override
    public void update(HoaDonChiTiet hdct) {
        
    }
    public void updateHDCT(double SoLuong, String maHDCT, String maHH ){
        String sql = "UPDATE HoaDonChiTiet SET SoLuong =? WHERE MaHDCT=? AND MaHH=?";
        XJdbc.update(sql, 
                SoLuong,
                maHDCT,
                maHH
                );
    }

    @Override
    public void delete(String id) {
        String sql = "DELETE FROM HoaDonChiTiet WHERE MaHDCT=?";
        XJdbc.update(sql, id);
    }
    public void deleteSP(String maHDCT, String maHH){
        String sql = "DELETE FROM HoaDonChiTiet WHERE MaHDCT=? AND MaHH=?";
        XJdbc.update(sql,
                maHDCT,
                maHH
                );
    }

    @Override
    public HoaDonChiTiet selectById(String id) {
        String sql = "SELECT * FROM HoaDonChiTiet WHERE MaHDCT =?";
        List<HoaDonChiTiet> list = this.selectBySql(sql, id);
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public List<HoaDonChiTiet> selectAll() {
        String sql = "SELECT * FROM HoaDonChiTiet";
        return this.selectBySql(sql);
    }

    @Override
    protected List<HoaDonChiTiet> selectBySql(String sql, Object... args) {
        List<HoaDonChiTiet> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = XJdbc.query(sql, args);
                while (rs.next()) {
                    HoaDonChiTiet hdct = new HoaDonChiTiet();
                    hdct.setMaHD(rs.getString("MaHDCT"));
                    hdct.setMaHH(rs.getString("MaHH"));
                    hdct.setDonGia(rs.getDouble("DonGia"));
                    hdct.setSoLuong(rs.getDouble("SoLuong"));
                    list.add(hdct);
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
    public List<HoaDonChiTiet> selectNotInCourse(String keyword) {
        String sql = "SELECT * FROM HoaDonChiTiet WHERE MaHDCT Like ?";
        return this.selectBySql(sql, "%" + keyword + "%");
    }
}
