/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlnt.ui;

import com.qlnt.dao.DanhMucThuocDAO;
import com.qlnt.dao.ThongKeDAO;
import com.qlnt.entity.DanhMucThuoc;
import java.awt.Color;
import java.awt.Cursor;
import java.awt.Font;
import static java.awt.Frame.HAND_CURSOR;
import java.awt.Image;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultListModel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.table.DefaultTableModel;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;

/**
 *
 * @author monst
 */
public class TKTonKhoJPanel extends javax.swing.JPanel {

    /**
     * Creates new form TongQuanJPannel
     */
    public TKTonKhoJPanel() {
        initComponents();
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

        popup = new javax.swing.JPopupMenu();
        pnlTim = new javax.swing.JPanel();
        jScrollPane3 = new javax.swing.JScrollPane();
        lstTim = new javax.swing.JList<>();
        jPanel1 = new javax.swing.JPanel();
        cboHSD = new javax.swing.JComboBox<>();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        cboTinhTrang = new javax.swing.JComboBox<>();
        jLabel11 = new javax.swing.JLabel();
        txtTimKiem = new javax.swing.JTextField();
        lblTim = new javax.swing.JLabel();
        jSeparator1 = new javax.swing.JSeparator();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblTonKho = new javax.swing.JTable();
        btnXuatExcel = new javax.swing.JButton();
        btnTimKiem = new javax.swing.JButton();
        btnRefresh = new javax.swing.JButton();

        popup.setFocusable(false);

        lstTim.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                lstTimMouseClicked(evt);
            }
        });
        jScrollPane3.setViewportView(lstTim);

        javax.swing.GroupLayout pnlTimLayout = new javax.swing.GroupLayout(pnlTim);
        pnlTim.setLayout(pnlTimLayout);
        pnlTimLayout.setHorizontalGroup(
            pnlTimLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane3, javax.swing.GroupLayout.DEFAULT_SIZE, 271, Short.MAX_VALUE)
        );
        pnlTimLayout.setVerticalGroup(
            pnlTimLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        setBackground(new java.awt.Color(255, 255, 255));
        setMaximumSize(new java.awt.Dimension(1000, 570));
        setMinimumSize(new java.awt.Dimension(1000, 570));

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Thống kê tồn kho", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 0, 14))); // NOI18N

        cboHSD.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Tất cả", "Sử dụng tốt", "Sắp hết hạn", "Đã hết hạn" }));
        cboHSD.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                cboHSDMouseClicked(evt);
            }
        });
        cboHSD.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cboHSDActionPerformed(evt);
            }
        });

        jLabel6.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel6.setText("Hạn sử dụng");

        jLabel7.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel7.setText("Tình trạng:");

        cboTinhTrang.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Tất cả", "Còn hàng", "Sắp hết hàng", "Đã hết hàng" }));
        cboTinhTrang.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                cboTinhTrangMouseClicked(evt);
            }
        });
        cboTinhTrang.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cboTinhTrangActionPerformed(evt);
            }
        });

        jLabel11.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel11.setText("Từ khóa tìm kiếm:");

        txtTimKiem.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        txtTimKiem.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 0, 1, 0, new java.awt.Color(0, 0, 0)));
        txtTimKiem.setOpaque(false);
        txtTimKiem.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txtTimKiemFocusGained(evt);
            }
            public void focusLost(java.awt.event.FocusEvent evt) {
                txtTimKiemFocusLost(evt);
            }
        });
        txtTimKiem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtTimKiemActionPerformed(evt);
            }
        });
        txtTimKiem.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txtTimKiemKeyReleased(evt);
            }
        });

        lblTim.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/qlnt/icon/btnSearch.png"))); // NOI18N
        lblTim.setMaximumSize(new java.awt.Dimension(30, 30));
        lblTim.setMinimumSize(new java.awt.Dimension(30, 30));
        lblTim.setPreferredSize(new java.awt.Dimension(30, 30));

        tblTonKho.setAutoCreateRowSorter(true);
        tblTonKho.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null}
            },
            new String [] {
                "Mã hàng hóa", "Tên hàng hóa", "Số lô", "Hạn sử dụng", "Số lượng", "Đơn vị gốc"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Double.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tblTonKho.setFocusable(false);
        tblTonKho.setOpaque(false);
        tblTonKho.setRowHeight(25);
        tblTonKho.setRowMargin(0);
        tblTonKho.setShowHorizontalLines(false);
        tblTonKho.setShowVerticalLines(false);
        tblTonKho.getTableHeader().setReorderingAllowed(false);
        jScrollPane1.setViewportView(tblTonKho);

        btnXuatExcel.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/qlnt/icon/btnXuatExcel.png"))); // NOI18N
        btnXuatExcel.setBorder(null);
        btnXuatExcel.setContentAreaFilled(false);
        btnXuatExcel.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                btnXuatExcelMouseEntered(evt);
            }
            public void mouseExited(java.awt.event.MouseEvent evt) {
                btnXuatExcelMouseExited(evt);
            }
        });
        btnXuatExcel.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnXuatExcelActionPerformed(evt);
            }
        });

        btnTimKiem.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/qlnt/icon/btnTimKiem.png"))); // NOI18N
        btnTimKiem.setBorder(null);
        btnTimKiem.setContentAreaFilled(false);
        btnTimKiem.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                btnTimKiemMouseEntered(evt);
            }
            public void mouseExited(java.awt.event.MouseEvent evt) {
                btnTimKiemMouseExited(evt);
            }
        });
        btnTimKiem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTimKiemActionPerformed(evt);
            }
        });

        btnRefresh.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/qlnt/icon/refresh.png"))); // NOI18N
        btnRefresh.setBorder(null);
        btnRefresh.setContentAreaFilled(false);
        btnRefresh.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                btnRefreshMouseEntered(evt);
            }
            public void mouseExited(java.awt.event.MouseEvent evt) {
                btnRefreshMouseExited(evt);
            }
        });
        btnRefresh.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRefreshActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addGap(71, 71, 71)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(cboHSD, javax.swing.GroupLayout.PREFERRED_SIZE, 151, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel6))
                .addGap(93, 93, 93)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(cboTinhTrang, javax.swing.GroupLayout.PREFERRED_SIZE, 164, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel7))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(lblTim, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txtTimKiem, javax.swing.GroupLayout.PREFERRED_SIZE, 203, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(btnTimKiem)
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(jLabel11)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnRefresh)
                        .addGap(38, 38, 38))))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(btnXuatExcel, javax.swing.GroupLayout.PREFERRED_SIZE, 190, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 926, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(42, 42, 42))
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(38, 38, 38)
                .addComponent(jSeparator1, javax.swing.GroupLayout.PREFERRED_SIZE, 884, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel7)
                            .addComponent(jLabel6))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(cboHSD, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(cboTinhTrang, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup()
                        .addGap(14, 14, 14)
                        .addComponent(jLabel11)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(lblTim, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(txtTimKiem, javax.swing.GroupLayout.PREFERRED_SIZE, 26, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(4, 4, 4))))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(btnRefresh)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnTimKiem)
                        .addGap(7, 7, 7)))
                .addGap(18, 18, 18)
                .addComponent(jSeparator1, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 331, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(btnXuatExcel, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(54, 54, 54))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void txtTimKiemFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtTimKiemFocusGained
        if (txtTimKiem.getText().equals("Nhập tên hàng hóa cần tìm")) {
            txtTimKiem.setText("");
        }
    }//GEN-LAST:event_txtTimKiemFocusGained

    private void txtTimKiemFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtTimKiemFocusLost
        if (txtTimKiem.getText().equals("")) {
            txtTimKiem.setText("Nhập tên hàng hóa cần tìm");
        }
    }//GEN-LAST:event_txtTimKiemFocusLost

    private void txtTimKiemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtTimKiemActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtTimKiemActionPerformed

    private void cboHSDActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cboHSDActionPerformed
//        cboTinhTrang.setSelectedIndex(0);
        filtForHSD();
    }//GEN-LAST:event_cboHSDActionPerformed

    private void cboTinhTrangActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cboTinhTrangActionPerformed
//        cboHSD.setSelectedIndex(0);
        filtForTinhTrang();
    }//GEN-LAST:event_cboTinhTrangActionPerformed

    private void btnTimKiemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTimKiemActionPerformed
        timKiem();
    }//GEN-LAST:event_btnTimKiemActionPerformed

    private void cboHSDMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_cboHSDMouseClicked
        cboTinhTrang.setSelectedIndex(0);
    }//GEN-LAST:event_cboHSDMouseClicked

    private void cboTinhTrangMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_cboTinhTrangMouseClicked
        cboHSD.setSelectedIndex(0);
    }//GEN-LAST:event_cboTinhTrangMouseClicked

    private void lstTimMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_lstTimMouseClicked
        txtTimKiem.setText(lstTim.getSelectedValue());
        popup.setVisible(false);
    }//GEN-LAST:event_lstTimMouseClicked

    private void txtTimKiemKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtTimKiemKeyReleased
        String keyDMT = txtTimKiem.getText().trim();
        if (!keyDMT.equals("")) {
            List<DanhMucThuoc> list = dmtdao.selectNotInCourse(keyDMT);
            DefaultListModel model = new DefaultListModel();
            model.setSize(0);
            for (DanhMucThuoc dmt : list) {
                model.addElement(dmt.getTenThuoc());
                lstTim.setModel(model);
            }
            popup.show(txtTimKiem, 0, txtTimKiem.getHeight());
        }
    }//GEN-LAST:event_txtTimKiemKeyReleased

    private void btnXuatExcelActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnXuatExcelActionPerformed
        try {
            xuatExcel();
        } catch (IOException ex) {
            Logger.getLogger(TKTonKhoJPanel.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_btnXuatExcelActionPerformed

    private void btnTimKiemMouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_btnTimKiemMouseEntered
        changeIcon(1, btnTimKiem, "src//com//qlnt//icon//btnTimKiem_hover.png");
    }//GEN-LAST:event_btnTimKiemMouseEntered

    private void btnTimKiemMouseExited(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_btnTimKiemMouseExited
        changeIcon(2, btnTimKiem, "src//com//qlnt//icon//btnTimKiem.png");
    }//GEN-LAST:event_btnTimKiemMouseExited

    private void btnXuatExcelMouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_btnXuatExcelMouseEntered
        changeIcon(1, btnXuatExcel, "src//com//qlnt//icon//btnXuatExcel_hover.png");
    }//GEN-LAST:event_btnXuatExcelMouseEntered

    private void btnXuatExcelMouseExited(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_btnXuatExcelMouseExited
        changeIcon(2, btnXuatExcel, "src//com//qlnt//icon//btnXuatExcel.png");
    }//GEN-LAST:event_btnXuatExcelMouseExited

    private void btnRefreshMouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_btnRefreshMouseEntered
        // TODO add your handling code here:
    }//GEN-LAST:event_btnRefreshMouseEntered

    private void btnRefreshMouseExited(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_btnRefreshMouseExited
        // TODO add your handling code here:
    }//GEN-LAST:event_btnRefreshMouseExited

    private void btnRefreshActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRefreshActionPerformed
         fillTable();
    }//GEN-LAST:event_btnRefreshActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnRefresh;
    private javax.swing.JButton btnTimKiem;
    private javax.swing.JButton btnXuatExcel;
    private javax.swing.JComboBox<String> cboHSD;
    private javax.swing.JComboBox<String> cboTinhTrang;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JLabel lblTim;
    private javax.swing.JList<String> lstTim;
    private javax.swing.JPanel pnlTim;
    private javax.swing.JPopupMenu popup;
    private javax.swing.JTable tblTonKho;
    private javax.swing.JTextField txtTimKiem;
    // End of variables declaration//GEN-END:variables
    void init() {
        txtTimKiem.setText("Nhập tên hàng hóa cần tìm");
        tblTonKho.getTableHeader().setFont(new Font("Tahoma", Font.BOLD, 12));
        tblTonKho.getTableHeader().setForeground(Color.BLACK);
        popup.add(pnlTim);
        fillTable();
        
    }
    void changeIcon(int so, JButton btn, String url) {
        if (so == 1) {
            Image img = getToolkit().createImage(url);
            btn.setIcon(new ImageIcon(img));
            btn.setCursor(new Cursor(HAND_CURSOR));
        } else {
            Image img = getToolkit().createImage(url);
            btn.setIcon(new ImageIcon(img));
        }
    }
    ThongKeDAO tkdao = new ThongKeDAO();
    DanhMucThuocDAO dmtdao = new DanhMucThuocDAO();
    void fillTable() {
        DefaultTableModel model = (DefaultTableModel) tblTonKho.getModel();
        model.setRowCount(0);
        List<Object[]> list = tkdao.getTonKho();
        for (Object[] row : list) {
            model.addRow(row);
        }
    }

    private void filtForHSD() {
        String HSD = (String) cboHSD.getSelectedItem();
        DefaultTableModel model = (DefaultTableModel) tblTonKho.getModel();
        model.setRowCount(0);
        if (HSD.equals("Tất cả")) {
            fillTable();
        } else if (HSD.equals("Sắp hết hạn")) {
            List<Object[]> list = tkdao.getHangHoaCanDate();
            for (Object[] row : list) {
                model.addRow(row);
            }
        } else if (HSD.equals("Đã hết hạn")) {
            List<Object[]> list = tkdao.getHangHoaHetDate();
            for (Object[] row : list) {
                model.addRow(row);
            }
        } else if (HSD.equals("Sử dụng tốt")){
            List<Object[]> list = tkdao.getHangHoaSDTot();
            for (Object[] row : list) {
                model.addRow(row);
            }
        }
    }

    private void filtForTinhTrang() {
        String tinhTrang = (String) cboTinhTrang.getSelectedItem();
        DefaultTableModel model = (DefaultTableModel) tblTonKho.getModel();
        model.setRowCount(0);
        if(tinhTrang.equals("Tất cả")){
            fillTable();
        }else if(tinhTrang.equals("Sắp hết hàng")){
            List<Object[]> list = tkdao.getHangHoaSapHet();
            for (Object[] row : list) {
                model.addRow(row);
            }
        }else if(tinhTrang.equals("Đã hết hàng")){
            List<Object[]> list = tkdao.getHangHoaDaHet();
            for (Object[] row : list) {
                model.addRow(row);
            }
        }else if(tinhTrang.equals("Còn hàng")){
            List<Object[]> list = tkdao.getHangHoaConHang();
            for (Object[] row : list) {
                model.addRow(row);
            }
        }
    }

    private void timKiem() {
        DefaultTableModel model = (DefaultTableModel) tblTonKho.getModel();
        model.setRowCount(0);
        List<Object[]> list = tkdao.getTonKho_Tim(txtTimKiem.getText());
        for (Object[] row : list) {
            model.addRow(row);
        }
    }
    private static HSSFCellStyle styleHeader(HSSFWorkbook workbook) {
        HSSFFont font = workbook.createFont();
        font.setBold(true);
        font.setFontName("Times new roman");
        font.setFontHeightInPoints((short) 14);
        font.setColor(IndexedColors.DARK_BLUE.getIndex());
        HSSFCellStyle style = workbook.createCellStyle();
        style.setFont(font);
        return style;
    }
    private static HSSFCellStyle styleContent(HSSFWorkbook workbook) {
        HSSFFont font = workbook.createFont();
        font.setFontHeightInPoints((short) 14);
        font.setFontName("Times new roman");
        HSSFCellStyle stylenoidung = workbook.createCellStyle();
        stylenoidung.setFont(font);
        return stylenoidung;
    }
    private static HSSFCellStyle styleFooter(HSSFWorkbook workbook) {
        HSSFFont font = workbook.createFont();
        font.setFontHeightInPoints((short) 14);
        font.setBold(true);
        font.setFontName("Times new roman");
        HSSFCellStyle styleFooter = workbook.createCellStyle();
        styleFooter.setFont(font);
        return styleFooter;
    }

    private void xuatExcel() throws IOException {        
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("Ton Kho");
        int rownum = 0;
        Cell cell;
        Row row;
        
        HSSFCellStyle style = styleHeader(workbook);     
        HSSFCellStyle styleNoiDung = styleContent(workbook);
        HSSFCellStyle styleFooter = styleFooter(workbook);

        row = sheet.createRow(rownum);
        cell = row.createCell(0, CellType.STRING);
        cell.setCellValue("MÃ HÀNG HÓA");
        cell.setCellStyle(style);

        cell = row.createCell(1, CellType.STRING);
        cell.setCellValue("TÊN HÀNG HÓA");
        cell.setCellStyle(style);

        cell = row.createCell(2, CellType.STRING);
        cell.setCellValue("SỐ LÔ");
        cell.setCellStyle(style);

        cell = row.createCell(3, CellType.STRING);
        cell.setCellValue("HẠN SỬ DỤNG");
        cell.setCellStyle(style);

        cell = row.createCell(4, CellType.STRING);
        cell.setCellValue("SỐ LƯỢNG");
        cell.setCellStyle(style);
        
        cell = row.createCell(4, CellType.STRING);
        cell.setCellValue("ĐƠN VỊ GỐC");
        cell.setCellStyle(style);

        for (int i = 0; i < tblTonKho.getRowCount(); i++) {
            rownum++;
            row = sheet.createRow(rownum);
            cell = row.createCell(0, CellType.STRING);
            cell.setCellValue((String) tblTonKho.getValueAt(i, 0));
            cell.setCellStyle(styleNoiDung);

            cell = row.createCell(1, CellType.STRING);
            cell.setCellValue((String) tblTonKho.getValueAt(i, 1));
            cell.setCellStyle(styleNoiDung);

            cell = row.createCell(2, CellType.STRING);
            cell.setCellValue((String) tblTonKho.getValueAt(i, 2));
            cell.setCellStyle(styleNoiDung);

            cell = row.createCell(3, CellType.STRING);
            cell.setCellValue((String) tblTonKho.getValueAt(i, 3));
            cell.setCellStyle(styleNoiDung);

            cell = row.createCell(4, CellType.NUMERIC);
            cell.setCellValue((double) tblTonKho.getValueAt(i, 4));
            cell.setCellStyle(styleNoiDung);

            cell = row.createCell(5, CellType.STRING);
            cell.setCellValue((String) tblTonKho.getValueAt(i, 5));
            cell.setCellStyle(styleNoiDung);
        }        
        
        JFileChooser fchooser = new JFileChooser();
        int result = fchooser.showSaveDialog(null);
        if (result == JFileChooser.APPROVE_OPTION) {
            File fname = fchooser.getSelectedFile();
            try {
                FileOutputStream file = new FileOutputStream(fname + ".xls");
                workbook.write(file);
                workbook.close();
                file.close();
            } catch (Exception e) {
            }
        }

    }

}
