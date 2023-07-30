/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlnt.dao;

import com.qlnt.entity.HoaDon;
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
public class HoaDonDAO extends qlntDAO<HoaDon, String> {

    @Override
    public void insert(HoaDon hd) {
        String sql = "INSERT INTO HoaDon (MaNV, NgayBan, MaKH, TongTien) values (?,?,?,?)";
        XJdbc.update(sql,                 
                hd.getMaNV(),
                XDate.toString(hd.getNgayBan(), "MM/dd/yyyy"),
                hd.getMaKH(),
                hd.getTongTien()
                );
    }

    @Override
    public void update(HoaDon hd) {
        
    }
    public void updateHD(String tongTien, String maHD){
        String sql = "UPDATE HoaDon SET TongTien=? WHERE MaHD=?";
        XJdbc.update(sql,
                tongTien,
                maHD
                );
    }
    @Override
    public void delete(String id) {
        String sql = "DELETE FROM HoaDon WHERE MaHD=?";
        XJdbc.update(sql, id);
    }

    @Override
    public HoaDon selectById(String id) {
        String sql = "SELECT * FROM HoaDon INNER JOIN KhachHang ON HoaDon.MaKH = "
                + "KhachHang.MaKH INNER JOIN NhanVien ON HoaDon.MaNV = NhanVien.MaNV WHERE MaHD =?";
        List<HoaDon> list = this.selectBySql(sql, id);
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public List<HoaDon> selectAll() {
        String sql = "SELECT * FROM HoaDon INNER JOIN KhachHang ON HoaDon.MaKH ="
                + " KhachHang.MaKH INNER JOIN NhanVien ON HoaDon.MaNV = NhanVien.MaNV";
        return this.selectBySql(sql);
    }

    @Override
    protected List<HoaDon> selectBySql(String sql, Object... args) {
        List<HoaDon> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = XJdbc.query(sql, args);
                while (rs.next()) {
                    HoaDon hd = new HoaDon();
                    hd.setMaHD(rs.getString("MaHD"));
                    hd.setMaNV(rs.getString("MaNV"));
                    hd.setMaKH(rs.getString("MaKH"));
                    hd.setNgayBan(rs.getDate("NgayBan"));
                    hd.setTongTien(rs.getDouble("TongTien"));
                    hd.setTenKH(rs.getString("TenKH"));
                    hd.setTenNV(rs.getString("TenNV"));
                    list.add(hd);
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

    public List<HoaDon> selectNotInCourse(String maHD, String tenKH) {
        String sql = "SELECT * FROM HoaDon INNER JOIN KhachHang ON HoaDon.MaKH = "
                + "KhachHang.MaKH INNER JOIN NhanVien ON HoaDon.MaNV = NhanVien.MaNV WHERE HoaDon.MAHD LIKE ? AND KhachHang.TenKH LIKE ?";
        return this.selectBySql(sql, "%" + maHD + "%", "%"+tenKH+"%");
    }
    public HoaDon lastMaHD(){
        String sql = "SELECT TOP 1 MaHD, HoaDon.MaNV, NgayBan, HoaDon.MaKH, TongTien, KhachHang.TenKH, NhanVien.TenNV FROM HoaDon INNER JOIN KhachHang ON HoaDon.MaKH = KhachHang.MaKH INNER JOIN NhanVien ON HoaDon.MaNV = NhanVien.MaNV ORDER BY MaHD DESC";
        List<HoaDon> list = this.selectBySql(sql);
        return list.size()>0 ? list.get(0) : null;
    }
    public List<String> selectMonth() {
        String sql="SELECT DISTINCT month(NgayBan) Month FROM HoaDon ORDER BY Month DESC";
        List<String> list=new ArrayList<>();
        try {
           ResultSet rs = XJdbc.query(sql);
           while(rs.next()){
                 list.add(rs.getString(1));
            }
            rs.getStatement().getConnection().close();
            return list;
        } 
        catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
}
