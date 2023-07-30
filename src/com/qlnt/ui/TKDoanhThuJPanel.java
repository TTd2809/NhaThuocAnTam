/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlnt.ui;

import com.qlnt.dao.HoaDonDAO;
import com.qlnt.dao.ThongKeDAO;
import com.qlnt.util.XDate;
import com.qlnt.util.XJdbc;
import java.awt.CardLayout;
import java.awt.Color;
import java.awt.Cursor;
import java.awt.Dimension;
import java.awt.Font;
import static java.awt.Frame.HAND_CURSOR;
import java.awt.Image;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultComboBoxModel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.table.DefaultTableModel;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.data.category.DefaultCategoryDataset;

/**
 *
 * @author monst
 */
public class TKDoanhThuJPanel extends javax.swing.JPanel {

    /**
     * Creates new form TongQuanJPannel
     */
    public TKDoanhThuJPanel() {
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

        jPanel2 = new javax.swing.JPanel();
        cboThang = new javax.swing.JComboBox<>();
        lblTongDoanhThu = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        txtTimKiem = new javax.swing.JTextField();
        jSeparator1 = new javax.swing.JSeparator();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblDoanhThu = new javax.swing.JTable();
        btnXuatExcel = new javax.swing.JButton();
        btnTimKiem = new javax.swing.JButton();
        pnlBieuDo = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        lblTongLoiNhuan = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();
        jLabel13 = new javax.swing.JLabel();
        btnRefresh = new javax.swing.JButton();

        setBackground(new java.awt.Color(255, 255, 255));
        setMaximumSize(new java.awt.Dimension(1000, 570));
        setMinimumSize(new java.awt.Dimension(1000, 570));

        jPanel2.setBackground(new java.awt.Color(255, 255, 255));
        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Thống kê doanh thu", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 0, 14))); // NOI18N
        jPanel2.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        cboThang.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cboThangActionPerformed(evt);
            }
        });
        jPanel2.add(cboThang, new org.netbeans.lib.awtextra.AbsoluteConstraints(78, 58, 151, 30));

        lblTongDoanhThu.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        lblTongDoanhThu.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        lblTongDoanhThu.setToolTipText("Tổng doanh thu");
        lblTongDoanhThu.setBorder(javax.swing.BorderFactory.createTitledBorder(""));
        jPanel2.add(lblTongDoanhThu, new org.netbeans.lib.awtextra.AbsoluteConstraints(89, 438, 125, 30));

        jLabel6.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel6.setText("Tháng");
        jPanel2.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(78, 30, -1, -1));

        jLabel11.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel11.setText("Tổng DT:");
        jPanel2.add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(24, 438, -1, 30));

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
        jPanel2.add(txtTimKiem, new org.netbeans.lib.awtextra.AbsoluteConstraints(291, 58, 203, 26));
        jPanel2.add(jSeparator1, new org.netbeans.lib.awtextra.AbsoluteConstraints(44, 99, 924, 10));

        tblDoanhThu.setAutoCreateRowSorter(true);
        tblDoanhThu.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null}
            },
            new String [] {
                "Thời gian", "Tổng HD", "Doanh thu", "Tổng giá vốn", "Lợi nhuận"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.Integer.class, java.lang.Double.class, java.lang.Double.class, java.lang.Double.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tblDoanhThu.setFocusable(false);
        tblDoanhThu.setOpaque(false);
        tblDoanhThu.setRowHeight(25);
        tblDoanhThu.setRowMargin(0);
        tblDoanhThu.setShowHorizontalLines(false);
        tblDoanhThu.setShowVerticalLines(false);
        tblDoanhThu.getTableHeader().setReorderingAllowed(false);
        jScrollPane1.setViewportView(tblDoanhThu);

        jPanel2.add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(24, 120, 425, 300));

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
        jPanel2.add(btnXuatExcel, new org.netbeans.lib.awtextra.AbsoluteConstraints(260, 480, 190, 30));

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
        jPanel2.add(btnTimKiem, new org.netbeans.lib.awtextra.AbsoluteConstraints(512, 61, -1, -1));

        javax.swing.GroupLayout pnlBieuDoLayout = new javax.swing.GroupLayout(pnlBieuDo);
        pnlBieuDo.setLayout(pnlBieuDoLayout);
        pnlBieuDoLayout.setHorizontalGroup(
            pnlBieuDoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 500, Short.MAX_VALUE)
        );
        pnlBieuDoLayout.setVerticalGroup(
            pnlBieuDoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 0, Short.MAX_VALUE)
        );

        jPanel2.add(pnlBieuDo, new org.netbeans.lib.awtextra.AbsoluteConstraints(468, 120, 500, 380));

        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/qlnt/icon/btnSearch.png"))); // NOI18N
        jPanel2.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(265, 58, -1, 30));

        lblTongLoiNhuan.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        lblTongLoiNhuan.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        lblTongLoiNhuan.setToolTipText("Tổng doanh thu");
        lblTongLoiNhuan.setBorder(javax.swing.BorderFactory.createTitledBorder(""));
        jPanel2.add(lblTongLoiNhuan, new org.netbeans.lib.awtextra.AbsoluteConstraints(324, 438, 125, 30));

        jLabel12.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel12.setText("Từ khóa tìm kiếm:");
        jPanel2.add(jLabel12, new org.netbeans.lib.awtextra.AbsoluteConstraints(291, 30, -1, -1));

        jLabel13.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel13.setText("Tổng LN:");
        jPanel2.add(jLabel13, new org.netbeans.lib.awtextra.AbsoluteConstraints(257, 438, -1, 30));

        btnRefresh.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/qlnt/icon/refresh.png"))); // NOI18N
        btnRefresh.setContentAreaFilled(false);
        btnRefresh.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRefreshActionPerformed(evt);
            }
        });
        jPanel2.add(btnRefresh, new org.netbeans.lib.awtextra.AbsoluteConstraints(900, 20, 80, -1));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel2, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, 527, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(44, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void txtTimKiemFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtTimKiemFocusGained
        if (txtTimKiem.getText().equals("Nhập thời gian cần tìm")) {
            txtTimKiem.setText("");
        }
    }//GEN-LAST:event_txtTimKiemFocusGained

    private void txtTimKiemFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtTimKiemFocusLost
        if (txtTimKiem.getText().equals("")) {
            txtTimKiem.setText("Nhập thời gian cần tìm");
        }
    }//GEN-LAST:event_txtTimKiemFocusLost

    private void txtTimKiemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtTimKiemActionPerformed
        timKiem();
    }//GEN-LAST:event_txtTimKiemActionPerformed

    private void cboThangActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cboThangActionPerformed
        fillTableDoanhThu();
        loadBieuDo();
    }//GEN-LAST:event_cboThangActionPerformed

    private void btnTimKiemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTimKiemActionPerformed
        timKiem();
    }//GEN-LAST:event_btnTimKiemActionPerformed

    private void btnXuatExcelActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnXuatExcelActionPerformed
        try {
            xuatExcel();
        } catch (IOException ex) {
            Logger.getLogger(TKDoanhThuJPanel.class.getName()).log(Level.SEVERE, null, ex);
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

    private void btnRefreshActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRefreshActionPerformed
        fillComboBoxThang();
        fillTableDoanhThu();
        loadBieuDo();
    }//GEN-LAST:event_btnRefreshActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnRefresh;
    private javax.swing.JButton btnTimKiem;
    private javax.swing.JButton btnXuatExcel;
    private javax.swing.JComboBox<String> cboThang;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JLabel lblTongDoanhThu;
    private javax.swing.JLabel lblTongLoiNhuan;
    private javax.swing.JPanel pnlBieuDo;
    private javax.swing.JTable tblDoanhThu;
    private javax.swing.JTextField txtTimKiem;
    // End of variables declaration//GEN-END:variables
    void init() {
        txtTimKiem.setText("Nhập thời gian cần tìm");
        tblDoanhThu.getTableHeader().setFont(new Font("Tahoma", Font.BOLD, 12));
        tblDoanhThu.getTableHeader().setForeground(Color.BLACK);

        fillComboBoxThang();
        fillTableDoanhThu();
        loadBieuDo();
    }
    Locale localeVN = new Locale("vi", "VN");
    NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);

    ThongKeDAO tkdao = new ThongKeDAO();
    HoaDonDAO hddao = new HoaDonDAO();
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
    void fillComboBoxThang() {
        DefaultComboBoxModel model = (DefaultComboBoxModel) cboThang.getModel();
        model.removeAllElements();
        List<String> listThang = hddao.selectMonth();
        for (String month : listThang) {
            model.addElement(month);
        }
    }

    void fillTableDoanhThu() {
        DefaultTableModel model = (DefaultTableModel) tblDoanhThu.getModel();
        model.setRowCount(0);
        double TongDT = 0;
        double TongLN = 0;
        String thang = (String) cboThang.getSelectedItem();
        List<Object[]> list = tkdao.getDoanhThu(thang);
        for (Object[] row : list) {
            model.addRow(row);
        }
        for (int i = 0; i < model.getRowCount(); i++) {
            double doanhthu = (double) tblDoanhThu.getValueAt(i, 2);
            TongDT += doanhthu;
        }
        lblTongDoanhThu.setText(currencyVN.format(TongDT));
        for (int i = 0; i < model.getRowCount(); i++) {
            double loinhuan = (double) tblDoanhThu.getValueAt(i, 4);
            TongLN += loinhuan;
        }
        lblTongLoiNhuan.setText(currencyVN.format(TongLN));
    }

    private void timKiem() {
        String keyWord = txtTimKiem.getText();
        double TongDT = 0;
        double TongLN = 0;
        DefaultTableModel model = (DefaultTableModel) tblDoanhThu.getModel();
        model.setRowCount(0);
        System.out.println(keyWord);
        List<Object[]> list = tkdao.getDoanhThu_Ngay(keyWord);
        for (Object[] row : list) {
            model.addRow(row);
        }
        for (int i = 0; i < model.getRowCount(); i++) {
            double doanhthu = (double) tblDoanhThu.getValueAt(i, 2);
            TongDT += doanhthu;
        }
        lblTongDoanhThu.setText(currencyVN.format(TongDT));
        
        for (int i = 0; i < model.getRowCount(); i++) {
            double loinhuan = (double) tblDoanhThu.getValueAt(i, 4);
            TongLN += loinhuan;
        }
        lblTongLoiNhuan.setText(currencyVN.format(TongLN));
    }

    public void loadBieuDo() {
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        DefaultTableModel model = (DefaultTableModel) tblDoanhThu.getModel();
        String thang = "tháng " + (String) cboThang.getSelectedItem();
        for (int i = 0; i < model.getRowCount(); i++) {
            double value = (double) tblDoanhThu.getValueAt(i, 2);
            String ngay = ((String) tblDoanhThu.getValueAt(i, 0));
            dataset.addValue(value, thang, ngay);
        }
        JFreeChart barchart = ChartFactory.createBarChart("Biểu đồ doanh thu", "Tháng", "", dataset, PlotOrientation.VERTICAL, true, true, true);

        ChartPanel chartpanel = new ChartPanel(barchart);
        chartpanel.setPreferredSize(new Dimension(550, 400));

        CategoryPlot plot = (CategoryPlot) barchart.getPlot();
        plot.setBackgroundPaint(new Color(255, 255, 255));

        BarRenderer renderer = (BarRenderer) plot.getRenderer();
        renderer.setSeriesPaint(0, new Color(30, 96, 146));
        renderer.setShadowVisible(false);

        renderer.setItemMargin(0);

        pnlBieuDo.removeAll();
        pnlBieuDo.setLayout(new CardLayout());
        pnlBieuDo.add(chartpanel);
        pnlBieuDo.validate();
        pnlBieuDo.repaint();
        pnlBieuDo.setVisible(true);
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
        String thang = (String) cboThang.getSelectedItem();
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("Thang " + thang);
        int rownum = 0;
        Cell cell;
        Row row;
        
        HSSFCellStyle style = styleHeader(workbook);     
        HSSFCellStyle styleNoiDung = styleContent(workbook);
        HSSFCellStyle styleFooter = styleFooter(workbook);

        row = sheet.createRow(rownum);
        cell = row.createCell(0, CellType.STRING);
        cell.setCellValue("THỜI GIAN");
        cell.setCellStyle(style);

        cell = row.createCell(1, CellType.STRING);
        cell.setCellValue("TỔNG HÓA ĐƠN");
        cell.setCellStyle(style);

        cell = row.createCell(2, CellType.STRING);
        cell.setCellValue("DOANH THU");
        cell.setCellStyle(style);

        cell = row.createCell(3, CellType.STRING);
        cell.setCellValue("TỔNG GIÁ VỐN");
        cell.setCellStyle(style);

        cell = row.createCell(4, CellType.STRING);
        cell.setCellValue("LỢI NHUẬN");
        cell.setCellStyle(style);

        for (int i = 0; i < tblDoanhThu.getRowCount(); i++) {
            rownum++;
            row = sheet.createRow(rownum);
            cell = row.createCell(0, CellType.STRING);
            cell.setCellValue((String) tblDoanhThu.getValueAt(i, 0));
            cell.setCellStyle(styleNoiDung);

            cell = row.createCell(1, CellType.NUMERIC);
            cell.setCellValue((int) tblDoanhThu.getValueAt(i, 1));
            cell.setCellStyle(styleNoiDung);

            cell = row.createCell(2, CellType.NUMERIC);
            cell.setCellValue((double) tblDoanhThu.getValueAt(i, 2));
            cell.setCellStyle(styleNoiDung);

            cell = row.createCell(3, CellType.NUMERIC);
            cell.setCellValue((double) tblDoanhThu.getValueAt(i, 3));
            cell.setCellStyle(styleNoiDung);

            cell = row.createCell(4, CellType.NUMERIC);
            cell.setCellValue((double) tblDoanhThu.getValueAt(i, 4));
            cell.setCellStyle(styleNoiDung);
        }
        String rowLast = String.valueOf(tblDoanhThu.getRowCount()-1);
        System.out.println(rowLast);
        row = sheet.createRow(tblDoanhThu.getRowCount());
        cell = row.createCell(0,CellType.STRING);
        cell.setCellValue("TỔNG");
        cell.setCellStyle(styleFooter);
        
        cell = row.createCell(1,CellType.FORMULA);
        cell.setCellFormula("SUM(B2:B"+rowLast+")");
        cell.setCellStyle(styleFooter);
        
        cell = row.createCell(2,CellType.FORMULA);
        cell.setCellFormula("SUM(C2:C"+rowLast+")");
        cell.setCellStyle(styleFooter);
        
        cell = row.createCell(3,CellType.FORMULA);
        cell.setCellFormula("SUM(D2:D"+rowLast+")");
        cell.setCellStyle(styleFooter);
        
        cell = row.createCell(4,CellType.FORMULA);
        cell.setCellFormula("SUM(E2:E"+rowLast+")");
        cell.setCellStyle(styleFooter);
        
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
