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
public class HangHoa {

    String maHH, maThuoc, soLo, dvGoc, dvQuiDoi, ghiChu;
    Date HSD, ngayTao = new Date();
    double slGoc, slSauQuiDoi, giaVon, giaBan;   

    public HangHoa(String maHH, String maThuoc, String soLo, String dvGoc, String dvQuiDoi, String ghiChu, Date HSD, double slGoc, double slSauQuiDoi, double giaVon, double giaBan) {
        this.maHH = maHH;
        this.maThuoc = maThuoc;
        this.soLo = soLo;
        this.dvGoc = dvGoc;
        this.dvQuiDoi = dvQuiDoi;
        this.ghiChu = ghiChu;
        this.HSD = HSD;
        this.slGoc = slGoc;
        this.slSauQuiDoi = slSauQuiDoi;
        this.giaVon = giaVon;
        this.giaBan = giaBan;
    }

    public HangHoa() {
    }

    public String getMaHH() {
        return maHH;
    }

    public void setMaHH(String maHH) {
        this.maHH = maHH;
    }

    public String getMaThuoc() {
        return maThuoc;
    }

    public void setMaThuoc(String maThuoc) {
        this.maThuoc = maThuoc;
    }

    public String getSoLo() {
        return soLo;
    }

    public void setSoLo(String soLo) {
        this.soLo = soLo;
    }

    public String getDvGoc() {
        return dvGoc;
    }

    public void setDvGoc(String dvGoc) {
        this.dvGoc = dvGoc;
    }

    public String getDvQuiDoi() {
        return dvQuiDoi;
    }

    public void setDvQuiDoi(String dvQuiDoi) {
        this.dvQuiDoi = dvQuiDoi;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    public Date getHSD() {
        return HSD;
    }

    public void setHSD(Date HSD) {
        this.HSD = HSD;
    }

    public Date getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(Date ngayTao) {
        this.ngayTao = ngayTao;
    }

    public double getSlGoc() {
        return slGoc;
    }

    public void setSlGoc(double slGoc) {
        this.slGoc = slGoc;
    }

    public double getSlSauQuiDoi() {
        return slSauQuiDoi;
    }

    public void setSlSauQuiDoi(double slSauQuiDoi) {
        this.slSauQuiDoi = slSauQuiDoi;
    }

    public double getGiaVon() {
        return giaVon;
    }

    public void setGiaVon(double giaVon) {
        this.giaVon = giaVon;
    }

    public double getGiaBan() {
        return giaBan;
    }

    public void setGiaBan(double giaBan) {
        this.giaBan = giaBan;
    }
    
    
}
