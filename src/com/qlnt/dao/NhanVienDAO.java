/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlnt.dao;

import com.qlnt.entity.NhanVien;
import com.qlnt.util.XJdbc;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author monst
 */
public class NhanVienDAO extends qlntDAO<NhanVien, String> {

    @Override
    public void insert(NhanVien nhanvien) {
        String sql = "INSERT into NhanVien (MaNV, TenNV, MatKhau, GioiTinh, VaiTro, Email, SDT, hinh) values(?,?,?,?,?,?,?,?)";
        XJdbc.update(sql,
                nhanvien.getMaNV(),
                nhanvien.getHoTen(),
                nhanvien.getMatKhau(),
                nhanvien.isGioiTinh(),
                nhanvien.isVaiTro(),
                nhanvien.getEmail(),
                nhanvien.getSDT(),
                nhanvien.getHinh()
        );
    }

    @Override
    public void update(NhanVien nhanvien) {
        String sql = "UPDATE NhanVien SET TenNV=?, MatKhau=?,GioiTinh=?, VaiTro=?, Email=?, SDT=?, Hinh=? WHERE MaNV=?";
        XJdbc.update(sql,
                nhanvien.getHoTen(),
                nhanvien.getMatKhau(),
                nhanvien.isGioiTinh(),
                nhanvien.isVaiTro(),
                nhanvien.getEmail(),
                nhanvien.getSDT(),
                nhanvien.getHinh(),
                nhanvien.getMaNV()
        );
    }

    @Override
    public void delete(String id) {
        String sql = "DELETE FROM NhanVien WHERE MaNV=?";
        XJdbc.update(sql, id);
    }

    @Override
    public NhanVien selectById(String id) {
        String sql = "SELECT * FROM NhanVien WHERE MaNV =?";
        List<NhanVien> list = this.selectBySql(sql, id);
        return list.size() > 0 ? list.get(0) : null;
    }
    public NhanVien selectByEmail(String id) {
        String sql = "SELECT * FROM NhanVien WHERE Email =?";
        List<NhanVien> list = this.selectBySql(sql, id);
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public List<NhanVien> selectAll() {
        String sql = "SELECT * FROM NhanVien";
        return this.selectBySql(sql);
    }

    @Override
    protected List<NhanVien> selectBySql(String sql, Object... args) {
        List<NhanVien> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = XJdbc.query(sql, args);
                while (rs.next()) {
                    NhanVien nv = new NhanVien();
                    nv.setMaNV(rs.getString("MaNV"));
                    nv.setHoTen(rs.getString("TenNV"));
                    nv.setMatKhau(rs.getString("MatKhau"));
                    nv.setVaiTro(rs.getBoolean("VaiTro"));
                    nv.setSDT(rs.getString("SDT"));
                    nv.setEmail(rs.getString("Email"));
                    nv.setGioiTinh(rs.getBoolean("GioiTinh"));
                    nv.setHinh(rs.getString("Hinh"));
                    list.add(nv);
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
    public List<NhanVien> selectNotInCourse(String keyword) {
        String sql="SELECT * FROM NhanVien WHERE TenNV LIKE ?";                
        return this.selectBySql(sql, "%"+keyword+"%");
    }

}
