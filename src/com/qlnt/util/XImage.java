/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlnt.util;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;

/**
 *
 * @author monst
 */
public class XImage {

    public static Image getAppIcon() {
        String file = "/com/qlnt/icon/QuanLyNhaThuoc.png";
        return new ImageIcon(XImage.class.getResource(file)).getImage();
    }

    public static void save(File src) {
        File dst = new File("logos", src.getName());
        if (!dst.getParentFile().exists()) {
            dst.getParentFile().mkdirs();
        }
        try {
            Path from = Paths.get(src.getAbsolutePath());
            Path to = Paths.get(dst.getAbsolutePath());
            Files.copy(from, to, StandardCopyOption.REPLACE_EXISTING);
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    public static ImageIcon read(String fileName) {
//        File path = new File("logos", fileName);        
//        return new ImageIcon(path.getAbsolutePath());
        ImageIcon imgicon = null;
        try {
            BufferedImage img = null;
            img = ImageIO.read(new File("logos", fileName));
            Image scaleimg = img.getScaledInstance(128, 128, Image.SCALE_SMOOTH);
            imgicon = new ImageIcon(scaleimg);
        } catch (Exception e) {
        }
        return imgicon;
    }
}
