/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlnt.util;

import com.qlnt.entity.NhanVien;
import javax.swing.JLabel;

/**
 *
 * @author monst
 */
public class Auth {
    public static NhanVien user = null;
    
    public static void clear(){
        Auth.user = null;
    }
    
    public static boolean isLogin(){
        return Auth.user != null;
    }
    
    public static boolean isManager(){
        return Auth.isLogin() && user.isVaiTro();
    }
    public static void loginSuccess(JLabel ten, JLabel vaitro){
        ten.setText(Auth.user.getHoTen());
        if (Auth.isManager()) {
            vaitro.setText("Quản lý");
        } else if (Auth.isManager() == false) {
            vaitro.setText("Nhân viên");
        }
    }
}
