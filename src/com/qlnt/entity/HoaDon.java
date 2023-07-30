/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlnt.entity;

import java.util.Date;

/**
 *
 * @author monst
 */
public class HoaDon {
    String maHD, maNV, maKH, tenKH, tenNV;
    Date ngayBan = new Date();
    double  tongTien;

    public HoaDon() {
    }

    public HoaDon(String maHD, String maNV, String maKH, double tongTien, String tenKH, String tenNV) {
        this.maHD = maHD;
        this.maNV = maNV;
        this.maKH = maKH;
        this.tongTien = tongTien;
        this.tenKH = tenKH;
        this.tenNV = tenNV;
    }

    public String getTenNV() {
        return tenNV;
    }

    public void setTenNV(String tenNV) {
        this.tenNV = tenNV;
    }

    public String getTenKH() {
        return tenKH;
    }

    public void setTenKH(String tenKH) {
        this.tenKH = tenKH;
    }

    public String getMaHD() {
        return maHD;
    }

    public void setMaHD(String maHD) {
        this.maHD = maHD;
    }

    public String getMaNV() {
        return maNV;
    }

    public void setMaNV(String maNV) {
        this.maNV = maNV;
    }

    public String getMaKH() {
        return maKH;
    }

    public void setMaKH(String maKH) {
        this.maKH = maKH;
    }

    public Date getNgayBan() {
        return ngayBan;
    }

    public void setNgayBan(Date ngayBan) {
        this.ngayBan = ngayBan;
    }

    public double getTongTien() {
        return tongTien;
    }

    public void setTongTien(double tongTien) {
        this.tongTien = tongTien;
    }
    
    
}
