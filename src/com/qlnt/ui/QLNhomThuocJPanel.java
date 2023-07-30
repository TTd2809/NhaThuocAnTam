/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlnt.ui;

import com.qlnt.dao.NhomThuocDAO;
import com.qlnt.entity.NhomThuoc;
import com.qlnt.util.Auth;
import com.qlnt.util.MsgBox;
import java.awt.Color;
import java.awt.Cursor;
import java.awt.Font;
import static java.awt.Frame.HAND_CURSOR;
import java.util.List;
import javax.swing.ImageIcon;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author monst
 */
public class QLNhomThuocJPanel extends javax.swing.JPanel {

    /**
     * Creates new form TongQuanJPannel
     */
    public QLNhomThuocJPanel() {
        init();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        grGioiTinh = new javax.swing.ButtonGroup();
        grVaiTro = new javax.swing.ButtonGroup();
        jPanel2 = new javax.swing.JPanel();
        jLabel4 = new javax.swing.JLabel();
        txtTenNT = new javax.swing.JTextField();
        txtMaNT = new javax.swing.JTextField();
        btnThem = new javax.swing.JButton();
        btnSua = new javax.swing.JButton();
        btnXoa = new javax.swing.JButton();
        btnMoi = new javax.swing.JButton();
        btnDau = new javax.swing.JButton();
        btnLui = new javax.swing.JButton();
        btnKe = new javax.swing.JButton();
        btnCuoi = new javax.swing.JButton();
        jLabel7 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        txtMoTa = new javax.swing.JTextArea();
        jPanel3 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblNhomThuoc = new javax.swing.JTable();
        lblTim = new javax.swing.JLabel();
        txtTimkiem = new javax.swing.JTextField();

        setBackground(new java.awt.Color(255, 255, 255));
        setMaximumSize(new java.awt.Dimension(1000, 570));
        setMinimumSize(new java.awt.Dimension(1000, 570));
        setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel2.setBackground(new java.awt.Color(51, 140, 180));
        jPanel2.setMaximumSize(new java.awt.Dimension(400, 436));
        jPanel2.setMinimumSize(new java.awt.Dimension(400, 436));
        jPanel2.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel4.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText("Mã nhóm thuốc:");
        jPanel2.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 51, -1, -1));

        txtTenNT.setBackground(new java.awt.Color(51, 140, 180));
        txtTenNT.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        txtTenNT.setForeground(new java.awt.Color(255, 255, 255));
        txtTenNT.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 0, 1, 0, new java.awt.Color(255, 255, 255)));
        txtTenNT.setOpaque(false);
        jPanel2.add(txtTenNT, new org.netbeans.lib.awtextra.AbsoluteConstraints(153, 90, 220, 25));

        txtMaNT.setEditable(false);
        txtMaNT.setBackground(new java.awt.Color(222, 225, 229));
        txtMaNT.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        txtMaNT.setForeground(new java.awt.Color(153, 153, 153));
        txtMaNT.setText("Mã tự động");
        txtMaNT.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 0, 1, 0, new java.awt.Color(255, 255, 255)));
        txtMaNT.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtMaNTActionPerformed(evt);
            }
        });
        jPanel2.add(txtMaNT, new org.netbeans.lib.awtextra.AbsoluteConstraints(134, 42, 250, 26));

        btnThem.setBackground(new java.awt.Color(59, 151, 203));
        btnThem.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/qlnt/icon/btnThem.png"))); // NOI18N
        btnThem.setBorder(null);
        btnThem.setContentAreaFilled(false);
        btnThem.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                btnThemMouseEntered(evt);
            }
        });
        btnThem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnThemActionPerformed(evt);
            }
        });
        jPanel2.add(btnThem, new org.netbeans.lib.awtextra.AbsoluteConstraints(27, 442, -1, -1));

        btnSua.setBackground(new java.awt.Color(59, 151, 203));
        btnSua.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/qlnt/icon/btnSua.png"))); // NOI18N
        btnSua.setBorder(null);
        btnSua.setContentAreaFilled(false);
        btnSua.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                btnSuaMouseEntered(evt);
            }
        });
        btnSua.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSuaActionPerformed(evt);
            }
        });
        jPanel2.add(btnSua, new org.netbeans.lib.awtextra.AbsoluteConstraints(114, 442, -1, -1));

        btnXoa.setBackground(new java.awt.Color(59, 151, 203));
        btnXoa.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/qlnt/icon/btnXoa.png"))); // NOI18N
        btnXoa.setBorder(null);
        btnXoa.setContentAreaFilled(false);
        btnXoa.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                btnXoaMouseEntered(evt);
            }
        });
        btnXoa.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnXoaActionPerformed(evt);
            }
        });
        jPanel2.add(btnXoa, new org.netbeans.lib.awtextra.AbsoluteConstraints(205, 442, -1, -1));

        btnMoi.setBackground(new java.awt.Color(59, 151, 203));
        btnMoi.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/qlnt/icon/btnMoi.png"))); // NOI18N
        btnMoi.setBorder(null);
        btnMoi.setContentAreaFilled(false);
        btnMoi.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                btnMoiMouseEntered(evt);
            }
        });
        btnMoi.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnMoiActionPerformed(evt);
            }
        });
        jPanel2.add(btnMoi, new org.netbeans.lib.awtextra.AbsoluteConstraints(292, 442, -1, -1));

        btnDau.setBackground(new java.awt.Color(59, 151, 203));
        btnDau.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/qlnt/icon/btnDau.png"))); // NOI18N
        btnDau.setBorder(null);
        btnDau.setContentAreaFilled(false);
        btnDau.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                btnDauMouseEntered(evt);
            }
        });
        btnDau.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDauActionPerformed(evt);
            }
        });
        jPanel2.add(btnDau, new org.netbeans.lib.awtextra.AbsoluteConstraints(27, 479, -1, -1));

        btnLui.setBackground(new java.awt.Color(59, 151, 203));
        btnLui.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/qlnt/icon/btnLui.png"))); // NOI18N
        btnLui.setBorder(null);
        btnLui.setContentAreaFilled(false);
        btnLui.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                btnLuiMouseEntered(evt);
            }
        });
        btnLui.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnLuiActionPerformed(evt);
            }
        });
        jPanel2.add(btnLui, new org.netbeans.lib.awtextra.AbsoluteConstraints(114, 479, -1, -1));

        btnKe.setBackground(new java.awt.Color(59, 151, 203));
        btnKe.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/qlnt/icon/btnKeTiep.png"))); // NOI18N
        btnKe.setBorder(null);
        btnKe.setContentAreaFilled(false);
        btnKe.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                btnKeMouseEntered(evt);
            }
        });
        btnKe.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnKeActionPerformed(evt);
            }
        });
        jPanel2.add(btnKe, new org.netbeans.lib.awtextra.AbsoluteConstraints(205, 479, -1, -1));

        btnCuoi.setBackground(new java.awt.Color(59, 151, 203));
        btnCuoi.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/qlnt/icon/btnCuoi.png"))); // NOI18N
        btnCuoi.setBorder(null);
        btnCuoi.setContentAreaFilled(false);
        btnCuoi.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                btnCuoiMouseEntered(evt);
            }
        });
        btnCuoi.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCuoiActionPerformed(evt);
            }
        });
        jPanel2.add(btnCuoi, new org.netbeans.lib.awtextra.AbsoluteConstraints(292, 479, -1, -1));

        jLabel7.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel7.setForeground(new java.awt.Color(255, 255, 255));
        jLabel7.setText("Tên nhóm thuốc * :");
        jPanel2.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 98, -1, -1));

        jLabel9.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel9.setForeground(new java.awt.Color(255, 255, 255));
        jLabel9.setText("Mô tả:");
        jPanel2.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 147, -1, -1));

        txtMoTa.setBackground(new java.awt.Color(51, 140, 180));
        txtMoTa.setColumns(20);
        txtMoTa.setForeground(new java.awt.Color(255, 255, 255));
        txtMoTa.setRows(5);
        txtMoTa.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(255, 255, 255), 1, true));
        jScrollPane2.setViewportView(txtMoTa);

        jPanel2.add(jScrollPane2, new org.netbeans.lib.awtextra.AbsoluteConstraints(72, 147, 306, -1));

        add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 400, 610));

        jPanel3.setBackground(new java.awt.Color(255, 255, 255));
        jPanel3.setFocusable(false);
        jPanel3.setMaximumSize(new java.awt.Dimension(600, 576));
        jPanel3.setMinimumSize(new java.awt.Dimension(600, 576));
        jPanel3.setOpaque(false);
        jPanel3.setRequestFocusEnabled(false);
        jPanel3.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        tblNhomThuoc.setAutoCreateRowSorter(true);
        tblNhomThuoc.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "STT", "Mã nhóm thuốc", "Tên nhóm thuốc", "Mô tả"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tblNhomThuoc.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        tblNhomThuoc.setFocusable(false);
        tblNhomThuoc.setOpaque(false);
        tblNhomThuoc.setRowHeight(25);
        tblNhomThuoc.setRowMargin(0);
        tblNhomThuoc.setShowHorizontalLines(false);
        tblNhomThuoc.setShowVerticalLines(false);
        tblNhomThuoc.getTableHeader().setReorderingAllowed(false);
        tblNhomThuoc.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblNhomThuocMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tblNhomThuoc);

        jPanel3.add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 70, 570, 440));

        lblTim.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/qlnt/icon/btnSearch.png"))); // NOI18N
        lblTim.setMaximumSize(new java.awt.Dimension(30, 30));
        lblTim.setMinimumSize(new java.awt.Dimension(30, 30));
        lblTim.setPreferredSize(new java.awt.Dimension(30, 30));
        jPanel3.add(lblTim, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 20, -1, -1));

        txtTimkiem.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        txtTimkiem.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 0, 1, 0, new java.awt.Color(0, 0, 0)));
        txtTimkiem.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txtTimkiemFocusGained(evt);
            }
            public void focusLost(java.awt.event.FocusEvent evt) {
                txtTimkiemFocusLost(evt);
            }
        });
        txtTimkiem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtTimkiemActionPerformed(evt);
            }
        });
        txtTimkiem.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txtTimkiemKeyReleased(evt);
            }
        });
        jPanel3.add(txtTimkiem, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 20, 500, 32));

        add(jPanel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(400, 0, 610, 610));
    }// </editor-fold>//GEN-END:initComponents

    private void txtMaNTActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtMaNTActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtMaNTActionPerformed

    private void btnSuaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSuaActionPerformed
        update();
    }//GEN-LAST:event_btnSuaActionPerformed

    private void btnXoaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnXoaActionPerformed
        delete();
    }//GEN-LAST:event_btnXoaActionPerformed

    private void btnMoiActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnMoiActionPerformed
        clearForm();
    }//GEN-LAST:event_btnMoiActionPerformed

    private void txtTimkiemFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtTimkiemFocusGained
        if (txtTimkiem.getText().equals("Nhập tên nhóm thuốc cần tìm")) {
            txtTimkiem.setText("");
        }
    }//GEN-LAST:event_txtTimkiemFocusGained

    private void txtTimkiemFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtTimkiemFocusLost
        if (txtTimkiem.getText().equals("")) {
            txtTimkiem.setText("Nhập tên nhóm thuốc cần tìm");
        }
    }//GEN-LAST:event_txtTimkiemFocusLost

    private void btnThemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnThemActionPerformed
        insert();
    }//GEN-LAST:event_btnThemActionPerformed

    private void tblNhomThuocMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblNhomThuocMouseClicked

            this.row = tblNhomThuoc.getSelectedRow();
            this.edit();
        
    }//GEN-LAST:event_tblNhomThuocMouseClicked

    private void txtTimkiemKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtTimkiemKeyReleased
        timKiem();
    }//GEN-LAST:event_txtTimkiemKeyReleased

    private void btnDauActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDauActionPerformed
        first();
    }//GEN-LAST:event_btnDauActionPerformed

    private void btnLuiActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnLuiActionPerformed
        prev();
    }//GEN-LAST:event_btnLuiActionPerformed

    private void btnKeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnKeActionPerformed
        next();
    }//GEN-LAST:event_btnKeActionPerformed

    private void btnCuoiActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCuoiActionPerformed
        last();
    }//GEN-LAST:event_btnCuoiActionPerformed

    private void btnThemMouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_btnThemMouseEntered
        btnThem.setCursor(new Cursor(HAND_CURSOR));
    }//GEN-LAST:event_btnThemMouseEntered

    private void btnSuaMouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_btnSuaMouseEntered
        btnSua.setCursor(new Cursor(HAND_CURSOR));
    }//GEN-LAST:event_btnSuaMouseEntered

    private void btnXoaMouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_btnXoaMouseEntered
        btnXoa.setCursor(new Cursor(HAND_CURSOR));
    }//GEN-LAST:event_btnXoaMouseEntered

    private void btnMoiMouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_btnMoiMouseEntered
        btnMoi.setCursor(new Cursor(HAND_CURSOR));
    }//GEN-LAST:event_btnMoiMouseEntered

    private void btnDauMouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_btnDauMouseEntered
        btnDau.setCursor(new Cursor(HAND_CURSOR));
    }//GEN-LAST:event_btnDauMouseEntered

    private void btnLuiMouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_btnLuiMouseEntered
        btnLui.setCursor(new Cursor(HAND_CURSOR));
    }//GEN-LAST:event_btnLuiMouseEntered

    private void btnKeMouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_btnKeMouseEntered
        btnKe.setCursor(new Cursor(HAND_CURSOR));
    }//GEN-LAST:event_btnKeMouseEntered

    private void btnCuoiMouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_btnCuoiMouseEntered
        btnCuoi.setCursor(new Cursor(HAND_CURSOR));
    }//GEN-LAST:event_btnCuoiMouseEntered

    private void txtTimkiemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtTimkiemActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtTimkiemActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCuoi;
    private javax.swing.JButton btnDau;
    private javax.swing.JButton btnKe;
    private javax.swing.JButton btnLui;
    private javax.swing.JButton btnMoi;
    private javax.swing.JButton btnSua;
    private javax.swing.JButton btnThem;
    private javax.swing.JButton btnXoa;
    private javax.swing.ButtonGroup grGioiTinh;
    private javax.swing.ButtonGroup grVaiTro;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JLabel lblTim;
    private javax.swing.JTable tblNhomThuoc;
    private javax.swing.JTextField txtMaNT;
    private javax.swing.JTextArea txtMoTa;
    private javax.swing.JTextField txtTenNT;
    private javax.swing.JTextField txtTimkiem;
    // End of variables declaration//GEN-END:variables
   void init() {
        initComponents();
        txtTimkiem.setText("Nhập tên nhóm thuốc cần tìm");
        designTable();
        fillTable();
        this.updateStatus();
    }
   void designTable() {        
        tblNhomThuoc.getTableHeader().setFont(new Font("Tahoma", Font.BOLD, 12));
        tblNhomThuoc.getTableHeader().setForeground(Color.BLACK);
    }
    int row = -1;
    NhomThuocDAO dao = new NhomThuocDAO();

    void fillTable() {
        DefaultTableModel model = (DefaultTableModel) tblNhomThuoc.getModel();
        model.setRowCount(0);
        int i = 1;
        try {
            List<NhomThuoc> list = dao.selectAll();
            for (NhomThuoc nt : list) {
                Object[] data = {
                    i++,
                    nt.getMaNT(),
                    nt.getTenNT(),
                    nt.getMoTa()
                };
                model.addRow(data);
            }
        } catch (Exception e) {
            MsgBox.alert(this, "Lỗi truy vấn dữ liệu");
        }
    }

    void setForm(NhomThuoc nt) {
        txtMaNT.setText(nt.getMaNT());
        txtTenNT.setText(nt.getTenNT());
        txtMoTa.setText(nt.getMoTa());
    }

    NhomThuoc getForm() {
        NhomThuoc nt = new NhomThuoc();
        nt.setMaNT(txtMaNT.getText());
        nt.setTenNT(txtTenNT.getText());
        nt.setMoTa(txtMoTa.getText());

        return nt;
    }

    void updateStatus() {
        boolean edit = (this.row >= 0);
        boolean first = (this.row == 0);
        boolean last = (this.row == (tblNhomThuoc.getRowCount() - 1));

        txtMaNT.setEnabled(!edit);
        btnThem.setEnabled(!edit);
        btnSua.setEnabled(edit);
        btnXoa.setEnabled(edit);

        btnDau.setEnabled(edit && !first);
        btnLui.setEnabled(edit && !first);
        btnCuoi.setEnabled(edit && !last);
        btnKe.setEnabled(edit && !last);
    }

    void clearForm() {
        NhomThuoc nt = new NhomThuoc();
        this.setForm(nt);
        txtMaNT.setText("Mã tự động");
        this.row = -1;
        this.updateStatus();
    }

    void edit() {
        String maNT = (String) tblNhomThuoc.getValueAt(row, 1);
        tblNhomThuoc.setRowSelectionInterval(row, row);
        NhomThuoc nt = dao.selectById(maNT);
        this.setForm(nt);
        this.updateStatus();
    }

    boolean kiemtra() {
        NhomThuoc nt = this.getForm();
        if (nt.getTenNT().equals("")) {
            MsgBox.alert(this, "Vui lòng nhập đầy đủ thông tin nhóm thuốc");
            return false;
        }
        return true;
    }

    void insert() {
        if (kiemtra()) {
            NhomThuoc nt = this.getForm();
            try {
                dao.insert(nt);
                this.fillTable();
                this.clearForm();
                MsgBox.alert(this, "Thêm nhóm thuốc thành công");
            } catch (Exception e) {
                MsgBox.alert(this, "Thêm nhóm thuốc thất bại");
            }

        }
    }

    void update() {
        if (kiemtra()) {
            NhomThuoc nt = this.getForm();
            try {
                dao.update(nt);
                this.fillTable();
                MsgBox.alert(this, "Cập nhật nhóm thuốc thành công");
            } catch (Exception e) {
                MsgBox.alert(this, "Cập nhật nhóm thuốc thất bại");
            }
        }

    }

    void delete() {
        String maNT = txtMaNT.getText();
        String tenNT = txtTenNT.getText();
        if (!Auth.isManager()) {
            MsgBox.alert(this, "Chỉ quản lý mới được xóa nhóm thuốc!");
        } else if (MsgBox.confirm(this, "Bạn có muốn xóa nhóm thuốc " + tenNT + " ?")) {
            try {
                dao.delete(maNT);
                this.fillTable();
                this.clearForm();
                MsgBox.alert(this, "Xóa nhóm thuốc thành công");
            } catch (Exception e) {
                MsgBox.alert(this, "Xóa nhóm thuốc thất bại");
            }

        }
    }

    void first() {
        this.row = 0;
        tblNhomThuoc.setRowSelectionInterval(row, row);
        this.edit();
    }

    void next() {
        if (row < tblNhomThuoc.getRowCount() - 1) {
            tblNhomThuoc.setRowSelectionInterval(row, row);
            this.row++;
            this.edit();
        }
    }

    void prev() {
        if (row > 0) {
            tblNhomThuoc.setRowSelectionInterval(row, row);
            this.row--;
            this.edit();
        }
    }

    void last() {
        tblNhomThuoc.setRowSelectionInterval(row, row);
        this.row = tblNhomThuoc.getRowCount() - 1;
        this.edit();
    }

    private void timKiem() {
        DefaultTableModel model = (DefaultTableModel) tblNhomThuoc.getModel();
        model.setRowCount(0);
        int i = 1;
        String keyword = txtTimkiem.getText();
        List<NhomThuoc> list = dao.selectNotInCourse(keyword);
        for (NhomThuoc nt : list) {
            model.addRow(new Object[]{
                i++,
                nt.getMaNT(),
                nt.getTenNT(),
                nt.getMoTa(),
            });
        }
    }
}
