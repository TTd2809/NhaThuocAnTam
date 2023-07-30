/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlnt.ui;

import com.qlnt.dao.ThongKeDAO;
import com.qlnt.util.XDate;
import java.awt.CardLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import javax.swing.table.DefaultTableModel;
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
public class TongQuanJPanel extends javax.swing.JPanel {

    /**
     * Creates new form TongQuanJPannel
     */
    public TongQuanJPanel() {
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

        lblHomNay = new javax.swing.JLabel();
        pnlBaocaotrongngay = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        lblHoadon = new javax.swing.JLabel();
        lblDoanhthu = new javax.swing.JLabel();
        jPanel4 = new javax.swing.JPanel();
        jLabel10 = new javax.swing.JLabel();
        lblHethan = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        lblHethang = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        pnlBieuDo = new javax.swing.JPanel();
        lblThu = new javax.swing.JLabel();
        btnRefresh = new javax.swing.JButton();

        setBackground(new java.awt.Color(255, 255, 255));
        setMaximumSize(new java.awt.Dimension(1000, 570));
        setMinimumSize(new java.awt.Dimension(1000, 570));
        setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        lblHomNay.setFont(new java.awt.Font("Tahoma", 1, 16)); // NOI18N
        lblHomNay.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        lblHomNay.setText("abc");
        add(lblHomNay, new org.netbeans.lib.awtextra.AbsoluteConstraints(109, 11, 138, -1));

        pnlBaocaotrongngay.setBackground(new java.awt.Color(51, 140, 180));

        jLabel3.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(255, 255, 255));
        jLabel3.setText("Báo cáo trong ngày");

        jLabel4.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText("Hóa đơn:");

        jLabel5.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel5.setForeground(new java.awt.Color(255, 255, 255));
        jLabel5.setText("Doanh thu:");

        lblHoadon.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        lblHoadon.setForeground(new java.awt.Color(255, 255, 255));
        lblHoadon.setText("0");

        lblDoanhthu.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        lblDoanhthu.setForeground(new java.awt.Color(255, 255, 255));
        lblDoanhthu.setText("0");

        javax.swing.GroupLayout pnlBaocaotrongngayLayout = new javax.swing.GroupLayout(pnlBaocaotrongngay);
        pnlBaocaotrongngay.setLayout(pnlBaocaotrongngayLayout);
        pnlBaocaotrongngayLayout.setHorizontalGroup(
            pnlBaocaotrongngayLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnlBaocaotrongngayLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(pnlBaocaotrongngayLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(pnlBaocaotrongngayLayout.createSequentialGroup()
                        .addComponent(jLabel5)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(lblDoanhthu, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(pnlBaocaotrongngayLayout.createSequentialGroup()
                        .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 127, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 80, Short.MAX_VALUE))
                    .addGroup(pnlBaocaotrongngayLayout.createSequentialGroup()
                        .addComponent(jLabel4)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(lblHoadon, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                .addContainerGap())
        );
        pnlBaocaotrongngayLayout.setVerticalGroup(
            pnlBaocaotrongngayLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnlBaocaotrongngayLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(pnlBaocaotrongngayLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(lblHoadon))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(pnlBaocaotrongngayLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(lblDoanhthu))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        add(pnlBaocaotrongngay, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 42, 227, -1));

        jPanel4.setBackground(new java.awt.Color(24, 116, 168));

        jLabel10.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel10.setForeground(new java.awt.Color(255, 255, 255));
        jLabel10.setText("Sắp hết hàng:");

        lblHethan.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        lblHethan.setForeground(new java.awt.Color(255, 255, 255));
        lblHethan.setText("0");

        jLabel9.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel9.setForeground(new java.awt.Color(255, 255, 255));
        jLabel9.setText("Sắp hết hạn:");

        lblHethang.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        lblHethang.setForeground(new java.awt.Color(255, 255, 255));
        lblHethang.setText("0");

        jLabel8.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel8.setForeground(new java.awt.Color(255, 255, 255));
        jLabel8.setText("Cảnh báo hàng hóa");

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel8, javax.swing.GroupLayout.PREFERRED_SIZE, 127, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addComponent(jLabel10)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(lblHethang, javax.swing.GroupLayout.PREFERRED_SIZE, 119, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addComponent(jLabel9)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(lblHethan, javax.swing.GroupLayout.PREFERRED_SIZE, 138, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(225, Short.MAX_VALUE))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel8)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel9)
                    .addComponent(lblHethan))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel10)
                    .addComponent(lblHethang))
                .addContainerGap())
        );

        add(jPanel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(317, 42, 458, -1));

        jLabel2.setFont(new java.awt.Font("Tahoma", 0, 16)); // NOI18N
        jLabel2.setText("Doanh số bán hàng tháng này");
        add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 145, 227, -1));

        javax.swing.GroupLayout pnlBieuDoLayout = new javax.swing.GroupLayout(pnlBieuDo);
        pnlBieuDo.setLayout(pnlBieuDoLayout);
        pnlBieuDoLayout.setHorizontalGroup(
            pnlBieuDoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 940, Short.MAX_VALUE)
        );
        pnlBieuDoLayout.setVerticalGroup(
            pnlBieuDoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 360, Short.MAX_VALUE)
        );

        add(pnlBieuDo, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 183, 940, 360));

        lblThu.setFont(new java.awt.Font("Tahoma", 1, 16)); // NOI18N
        lblThu.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        lblThu.setText("Thứ năm, 15/07/2021");
        add(lblThu, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 11, 83, -1));

        btnRefresh.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/qlnt/icon/refresh.png"))); // NOI18N
        btnRefresh.setContentAreaFilled(false);
        btnRefresh.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRefreshActionPerformed(evt);
            }
        });
        add(btnRefresh, new org.netbeans.lib.awtextra.AbsoluteConstraints(870, 20, 80, -1));
    }// </editor-fold>//GEN-END:initComponents

    private void btnRefreshActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRefreshActionPerformed
        doanhThuNgay();
        hangHoaNgay();
        loadBieuDo();
    }//GEN-LAST:event_btnRefreshActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnRefresh;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JLabel lblDoanhthu;
    private javax.swing.JLabel lblHethan;
    private javax.swing.JLabel lblHethang;
    private javax.swing.JLabel lblHoadon;
    private javax.swing.JLabel lblHomNay;
    private javax.swing.JLabel lblThu;
    private javax.swing.JPanel pnlBaocaotrongngay;
    private javax.swing.JPanel pnlBieuDo;
    // End of variables declaration//GEN-END:variables
    void init() {
        lblHomNay.setText(XDate.toString(new Date(), "dd/MM/yyyy"));
        Calendar cal = Calendar.getInstance();        
        DateFormat formatter = new SimpleDateFormat("EEEE", Locale.getDefault());        
        lblThu.setText(formatter.format(cal.getTime()));
        doanhThuNgay();
        hangHoaNgay();
        loadBieuDo();
    }
    Locale localeVN = new Locale("vi", "VN");
    NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
    ThongKeDAO tkdao = new ThongKeDAO();

    void doanhThuNgay() {
        String ngay = lblHomNay.getText();       
        double doanhThu = 0;
        int hoadon = 0;
        List<Object[]> list = tkdao.getDoanhThu_Ngay(ngay);
        for (Object[] data : list) {
            doanhThu = (double) data[2];  
            if(doanhThu > 0){
                System.out.println(doanhThu);
            lblDoanhthu.setText(currencyVN.format(doanhThu));
            }
            else if(String.valueOf(doanhThu).equals("")){
                lblDoanhthu.setText(currencyVN.format(0));
            }
        } 
        for (Object[] data : list) {            
            hoadon = (int) data[1];
            if(hoadon > 0){
                lblHoadon.setText(String.valueOf(hoadon));
            }
            else if(String.valueOf(hoadon)==null){
                lblHoadon.setText("0");
            }
        }
    }

    void hangHoaNgay() {
        List<Object[]> listSapHet = tkdao.getHangHoaSapHet();
        List<Object[]> listCanDate = tkdao.getHangHoaCanDate();
        lblHethang.setText(String.valueOf(listSapHet.size()));
        lblHethan.setText(String.valueOf(listCanDate.size()));
    }

    void loadBieuDo() {
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        String thangHienTai = String.valueOf(new Date().getMonth() + 1);
        String thangTruoc = String.valueOf(new Date().getMonth());        
        List<Object[]> listHT = tkdao.getDoanhThu(thangHienTai);
        List<Object[]> listTruoc = tkdao.getDoanhThu(thangTruoc);
//        int ngayHT = 0;
//        int ngayTruoc = 0;

        for (Object[] data : listTruoc) {
//            ngayTruoc++;
            String ngay = (String) data[0];            
            String ngayTruoc = String.valueOf(ngay.charAt(0))+String.valueOf(ngay.charAt(1));
            double doanhthu = (double) data[2];
            dataset.addValue(doanhthu, "Tháng "+thangTruoc, ngayTruoc);
        }
        for (Object[] data : listHT) {
//            ngayHT++;
            String ngay = (String) data[0];            
            String ngayTruoc = String.valueOf(ngay.charAt(0))+String.valueOf(ngay.charAt(1));
            double doanhthu = (double) data[2];
            dataset.addValue(doanhthu, "Tháng "+thangHienTai, ngayTruoc);
        }

        JFreeChart barchart = ChartFactory.createBarChart("Biểu đồ doanh thu", "", "", dataset, PlotOrientation.VERTICAL, true, true, true);        
        ChartPanel chartpanel = new ChartPanel(barchart);
        chartpanel.setPreferredSize(new Dimension(900, 400));

        CategoryPlot plot = (CategoryPlot) barchart.getPlot();
        plot.setBackgroundPaint(new Color(255, 255, 255));

        BarRenderer renderer = (BarRenderer) plot.getRenderer();
        renderer.setSeriesPaint(0, new Color(30, 96, 146));
        renderer.setSeriesPaint(1, new Color(20, 64, 97));
        renderer.setShadowVisible(false);

        renderer.setItemMargin(0);

        pnlBieuDo.removeAll();
        pnlBieuDo.setLayout(new CardLayout());
        pnlBieuDo.add(chartpanel);
        pnlBieuDo.validate();
        pnlBieuDo.repaint();
        pnlBieuDo.setVisible(true);
    }
}