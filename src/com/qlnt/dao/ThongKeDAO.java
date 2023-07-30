/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlnt.dao;

import com.qlnt.util.XJdbc;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author monst
 */
public class ThongKeDAO {

    private List<Object[]> getListArray(String sql, String[] cols, Object... args) {
        try {
            List<Object[]> list = new ArrayList<>();
            ResultSet rs = XJdbc.query(sql, args);
            while (rs.next()) {
                Object[] vals = new Object[cols.length];
                for (int i = 0; i < cols.length; i++) {
                    vals[i] = rs.getObject(cols[i]);
                }
                list.add(vals);
            }
            rs.getStatement().getConnection().close();
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public List<Object[]> getDoanhThu(String thang) {
        String sql = "{CALL sp_DoanhThu(?)}";
        String[] cols = {"NgayBan", "TongHoaDon", "DoanhThu", "TongGiaVon", "LoiNhuan"};
        return this.getListArray(sql, cols, thang);
    }
    public List<Object[]> getDoanhThu_Ngay(String ngay) {
        String sql = "{CALL sp_DoanhThu_Ngay(?)}";
        String[] cols = {"NgayBan", "TongHoaDon", "DoanhThu", "TongGiaVon", "LoiNhuan"};
        return this.getListArray(sql, cols, ngay);
    }    
    
    public List<Object[]> getKhachHangTT() {
        String sql = "{CALL sp_KhachHangThanThiet}";
        String[] cols = {"MaKH", "TenKH", "SDT", "SoLanMua", "Diem"};
        return this.getListArray(sql, cols);
    }
    public List<Object[]> getKhachHangTT_Thang(String thang) {
        String sql = "{CALL sp_KhachHangThanThiet_TheoThang(?)}";
        String[] cols = {"MaKH", "TenKH", "SDT", "SoLanMua", "Diem"};
        return this.getListArray(sql, cols, thang);
    }
    public List<Object[]> getKhachHangTT_Ten(Object[] keyword) {
        String sql = "{CALL sp_KhachHangThanThiet_Ten(?,?)}";
        String[] cols = {"MaKH", "TenKH", "SDT", "SoLanMua", "Diem"};
        return this.getListArray(sql, cols, keyword);
    }
    public List<Object[]> getKhachHangTT_Ten_TatCa(String khachhang) {
        String sql = "{CALL sp_KhachHangThanThiet_Ten_TatCa(?)}";
        String[] cols = {"MaKH", "TenKH", "SDT", "SoLanMua", "Diem"};
        return this.getListArray(sql, cols, khachhang);
    }
    public List<Object[]> getThuocNoiBat() {
        String sql = "{CALL sp_ThuocNoiBat}";
        String[] cols = {"MaHH", "TenThuoc", "SoLanBan"};
        return this.getListArray(sql, cols);
    }
    public List<Object[]> getThuocNoiBat_Thang(String thang) {
        String sql = "{CALL sp_ThuocNoiBat_Thang(?)}";
        String[] cols = {"MaHH", "TenThuoc", "SoLanBan"};
        return this.getListArray(sql, cols, thang);
    }
    public List<Object[]> getThuocNoiBat_Thuoc(Object[] keyword) {
        String sql = "{CALL sp_ThuocNoiBat_Thuoc(?,?)}";
        String[] cols = {"MaHH", "TenThuoc", "SoLanBan"};
        return this.getListArray(sql, cols, keyword);
    }
    public List<Object[]> getThuocNoiBat_Thuoc_TatCa(String thuoc) {
        String sql = "{CALL sp_ThuocNoiBat_Thuoc_TatCa(?)}";
        String[] cols = {"MaHH", "TenThuoc", "SoLanBan"};
        return this.getListArray(sql, cols, thuoc);
    }
    public List<Object[]> getTonKho() {
        String sql = "{CALL sp_TonKho}";
        String[] cols = {"MaHH", "TenThuoc", "SoLo", "HSD", "SoLuongGoc", "DonViGoc"};
        return this.getListArray(sql, cols);
    }
    public List<Object[]> getTonKho_Tim(String tenThuoc) {
        String sql = "{CALL sp_TonKho_Tim(?)}";
        String[] cols = {"MaHH", "TenThuoc", "SoLo", "HSD", "SoLuongGoc", "DonViGoc"};
        return this.getListArray(sql, cols, tenThuoc);
    }
    public List<Object[]> getHangHoaCanDate() {
        String sql = "{CALL sp_HanSuDung_SapHetHan}";
        String[] cols = {"MaHH", "TenThuoc", "SoLo", "HSD", "SoLuongGoc", "DonViGoc"};
        return this.getListArray(sql, cols);
    }
    public List<Object[]> getHangHoaHetDate() {
        String sql = "{CALL sp_HanSuDung_HetHan}";
        String[] cols = {"MaHH", "TenThuoc", "SoLo", "HSD", "SoLuongGoc", "DonViGoc"};
        return this.getListArray(sql, cols);
    }
    public List<Object[]> getHangHoaSDTot() {
        String sql = "{CALL sp_HanSuDung_Tot}";
        String[] cols = {"MaHH", "TenThuoc", "SoLo", "HSD", "SoLuongGoc", "DonViGoc"};
        return this.getListArray(sql, cols);
    }
    public List<Object[]> getHangHoaSapHet() {
        String sql = "{CALL sp_HangHoa_SapHet}";
        String[] cols = {"MaHH", "TenThuoc", "SoLo", "HSD", "SoLuongGoc", "DonViGoc"};
        return this.getListArray(sql, cols);
    }
    public List<Object[]> getHangHoaDaHet() {
        String sql = "{CALL sp_HangHoa_DaHet}";
        String[] cols = {"MaHH", "TenThuoc", "SoLo", "HSD", "SoLuongGoc", "DonViGoc"};
        return this.getListArray(sql, cols);
    }
    public List<Object[]> getHangHoaConHang() {
        String sql = "{CALL sp_HangHoa_ConHang}";
        String[] cols = {"MaHH", "TenThuoc", "SoLo", "HSD", "SoLuongGoc", "DonViGoc"};
        return this.getListArray(sql, cols);
    }
}
