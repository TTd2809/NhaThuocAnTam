/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlnt.dao;

import com.qlnt.entity.NhomThuoc;
import com.qlnt.util.XJdbc;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author monst
 */
public class NhomThuocDAO extends qlntDAO<NhomThuoc, String>{

    @Override
    public void insert(NhomThuoc nhomthuoc) {
        String sql = "INSERT into NhomThuoc (TenNT, MoTa) values(?,?)";
        XJdbc.update(sql,                
                nhomthuoc.getTenNT(),                
                nhomthuoc.getMoTa()
        );
    }

    @Override
    public void update(NhomThuoc nhomthuoc) {
        String sql = "UPDATE NhomThuoc SET TenNT=?, MoTa=? WHERE MaNT=?";
        XJdbc.update(sql,
                nhomthuoc.getTenNT(),
                nhomthuoc.getMoTa(),
                nhomthuoc.getMaNT()
        );
    }

    @Override
    public void delete(String id) {
        String sql = "DELETE FROM NhomThuoc WHERE MaNT=?";
        XJdbc.update(sql, id);
    }

    @Override
    public NhomThuoc selectById(String id) {
        String sql = "SELECT * FROM NhomThuoc WHERE MaNT =?";
        List<NhomThuoc> list = this.selectBySql(sql, id);
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public List<NhomThuoc> selectAll() {
        String sql = "SELECT * FROM NhomThuoc";
        return this.selectBySql(sql);
    }

    @Override
    protected List<NhomThuoc> selectBySql(String sql, Object... args) {
        List<NhomThuoc> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = XJdbc.query(sql, args);
                while (rs.next()) {
                    NhomThuoc kh = new NhomThuoc();
                    kh.setMaNT(rs.getString("MaNT"));
                    kh.setTenNT(rs.getString("TenNT"));  
                    kh.setMoTa(rs.getString("MoTa"));
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
    public List<NhomThuoc> selectNotInCourse(String keyword) {
        String sql="SELECT * FROM NhomThuoc WHERE TenNT LIKE ?";                
        return this.selectBySql(sql, "%"+keyword+"%");
    }
    
}
