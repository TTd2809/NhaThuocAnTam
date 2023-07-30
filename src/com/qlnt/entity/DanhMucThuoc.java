/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlnt.entity;

/**
 *
 * @author monst
 */
public class DanhMucThuoc {

    String tenThuoc, soDK, hangSX, noiSX, donViGoc, donViQuiDoi, dongGoi, maNT, hoatChat;
    String maThuoc;
    double soLuongQuiDoi;

    public DanhMucThuoc() {
    }

    public DanhMucThuoc(String tenThuoc, String soDK, String hangSX, String noiSX, String donViGoc, String donViQuiDoi, String dongGoi, String maNT, String hoatChat, String maThuoc, double soLuongQuiDoi) {
        this.tenThuoc = tenThuoc;
        this.soDK = soDK;
        this.hangSX = hangSX;
        this.noiSX = noiSX;
        this.donViGoc = donViGoc;
        this.donViQuiDoi = donViQuiDoi;
        this.dongGoi = dongGoi;
        this.maNT = maNT;
        this.hoatChat = hoatChat;
        this.maThuoc = maThuoc;
        this.soLuongQuiDoi = soLuongQuiDoi;

    }

    public String getTenThuoc() {
        return tenThuoc;
    }

    public void setTenThuoc(String tenThuoc) {
        this.tenThuoc = tenThuoc;
    }

    public String getSoDK() {
        return soDK;
    }

    public void setSoDK(String soDK) {
        this.soDK = soDK;
    }

    public String getHangSX() {
        return hangSX;
    }

    public void setHangSX(String hangSX) {
        this.hangSX = hangSX;
    }

    public String getNoiSX() {
        return noiSX;
    }

    public void setNoiSX(String noiSX) {
        this.noiSX = noiSX;
    }

    public String getDonViGoc() {
        return donViGoc;
    }

    public void setDonViGoc(String donViGoc) {
        this.donViGoc = donViGoc;
    }

    public String getDonViQuiDoi() {
        return donViQuiDoi;
    }

    public void setDonViQuiDoi(String donViQuiDoi) {
        this.donViQuiDoi = donViQuiDoi;
    }

    public String getDongGoi() {
        return dongGoi;
    }

    public void setDongGoi(String dongGoi) {
        this.dongGoi = dongGoi;
    }

    public String getMaNT() {
        return maNT;
    }

    public void setMaNT(String maNT) {
        this.maNT = maNT;
    }

    public String getHoatChat() {
        return hoatChat;
    }

    public void setHoatChat(String hoatChat) {
        this.hoatChat = hoatChat;
    }

    public String getMaThuoc() {
        return maThuoc;
    }

    public void setMaThuoc(String maThuoc) {
        this.maThuoc = maThuoc;
    }

    public double getSoLuongQuiDoi() {
        return soLuongQuiDoi;
    }

    public void setSoLuongQuiDoi(double soLuongQuiDoi) {
        this.soLuongQuiDoi = soLuongQuiDoi;
    }
    
}
