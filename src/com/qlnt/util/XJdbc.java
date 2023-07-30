/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlnt.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author monst
 */
public class XJdbc {

    private static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static String dbUrl = "jdbc:sqlserver://localhost:1433;database=quanlynhathuoc1";
    private static String username = "sa";
    private static String password = "123";
    public static Connection con;

    static {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            throw new RuntimeException(ex);
        }

    }

    public static PreparedStatement getStm(String sql, Object... args) throws SQLException {
        con = DriverManager.getConnection(dbUrl, username, password);
        PreparedStatement pstm = null;
        if (sql.trim().startsWith("{")) {
            pstm = con.prepareCall(sql);
        } else {
            pstm = con.prepareStatement(sql);
        }
        for (int i = 0; i < args.length; i++) {
            pstm.setObject(i + 1, args[i]);
        }
        return pstm;
    }

    public static void update(String sql, Object... args) {
        try {
            PreparedStatement pstm = XJdbc.getStm(sql, args);
            try {
                pstm.executeUpdate();
            } finally {
                pstm.getConnection().close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }

    }

    public static ResultSet query(String sql, Object... args) {
        try {
            PreparedStatement pstm = XJdbc.getStm(sql, args);
            return pstm.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public static Object value(String sql, Object... args) {
        try {
            ResultSet rs = XJdbc.query(sql, args);
            while (rs.next()) {
                return rs.getObject(0);
            }
            rs.getStatement().getConnection().close();
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public static Connection getConnection() {
        Connection conn = null;
        try {
            String dbUrl = "jdbc:sqlserver://localhost:1433;database=QuanLyNhaThuoc";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String user = "sa";
            String password = "123";
            conn = DriverManager.getConnection(dbUrl, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
