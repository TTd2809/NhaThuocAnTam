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
public class NhomThuoc {
    String maNT, tenNT, moTa;

    public NhomThuoc() {
    }

    public NhomThuoc(String maNT, String tenNT, String moTa) {
        this.maNT = maNT;
        this.tenNT = tenNT;
        this.moTa = moTa;
    }

    public String getMaNT() {
        return maNT;
    }

    public void setMaNT(String maNT) {
        this.maNT = maNT;
    }

    public String getTenNT() {
        return tenNT;
    }

    public void setTenNT(String tenNT) {
        this.tenNT = tenNT;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }
    
}
