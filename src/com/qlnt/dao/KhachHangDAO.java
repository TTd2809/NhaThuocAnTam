/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlnt.dao;

import com.qlnt.entity.KhachHang;
import com.qlnt.util.XJdbc;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author monst
 */
public class KhachHangDAO extends qlntDAO<KhachHang, String> {

    @Override
    public void insert(KhachHang khachhang) {
        String sql = "INSERT into KhachHang (TenKH, GioiTinh, SDT, NamSinh, Diem) values(?,?,?,?,?)";
        XJdbc.update(sql,                
                khachhang.getHoTen(),
                khachhang.isGioiTinh(),
                khachhang.getSdt(),
                khachhang.getNamSinh(),
                khachhang.getDiem()
        );
    }

    @Override
    public void update(KhachHang khachhang) {
        String sql = "UPDATE KhachHang SET TenKH=?, GioiTinh=?, Diem=?, NamSinh=?, SDT=? WHERE MaKH=?";
        XJdbc.update(sql,
                khachhang.getHoTen(),
                khachhang.isGioiTinh(),
                khachhang.getDiem(),
                khachhang.getNamSinh(),
                khachhang.getSdt(),
                khachhang.getMaKH()
        );
    }

    @Override
    public void delete(String id) {
        String sql = "DELETE FROM KhachHang WHERE MaKH=?";
        XJdbc.update(sql, id);
    }

    @Override
    public KhachHang selectById(String id) {
        String sql = "SELECT * FROM KhachHang WHERE MaKH =?";
        List<KhachHang> list = this.selectBySql(sql, id);
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public List<KhachHang> selectAll() {
        String sql = "SELECT * FROM KhachHang";
        return this.selectBySql(sql);
    }

    @Override
    protected List<KhachHang> selectBySql(String sql, Object... args) {
        List<KhachHang> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = XJdbc.query(sql, args);
                while (rs.next()) {
                    KhachHang kh = new KhachHang();
                    kh.setMaKH(rs.getString("MaKH"));
                    kh.setHoTen(rs.getString("TenKH"));
                    kh.setDiem(Double.valueOf(rs.getString("Diem")));                    
                    kh.setSdt(rs.getString("SDT"));
                    kh.setNamSinh(Integer.valueOf(rs.getString("NamSinh")));
                    kh.setGioiTinh(rs.getBoolean("GioiTinh"));
                    list.add(kh);
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
    public List<KhachHang> selectNotInCourse(String keyword) {
        String sql="SELECT * FROM KhachHang WHERE TenKH LIKE ?";                
        return this.selectBySql(sql, "%"+keyword+"%");
    }
}
