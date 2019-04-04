package com.springboot.demo;

import org.junit.Test;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * @Auther: mingweilin
 * @Date: 4/1/2019 09:20
 * @Description:
 */

public class FileTest {
    private static void printFile(File file, String space) {
        if (file == null) {
            System.out.println("文件为空");
            return;
        }

        if (file.isDirectory()) {
            System.out.println(space + file.getName());
            File[] files = file.listFiles();
            if (files == null) {
                return;
            } else {
                for (File t : files) {

                    printFile(t, space + "    ");
                }
            }
        } else if (file.isFile()) {
            System.out.println(space + file.getName());
        }

    }

    @Test
    public void testFile() {
        File file = new File("hello");
        System.out.println(file.getAbsolutePath());
        String apath = file.getAbsolutePath();
        String substring = apath.substring(0, apath.length() - file.getName().length() - 1);
        System.out.println(substring);
        File parent = new File(substring);
        printFile(parent, "");
    }

    @Test
    public void testPath() throws IOException {
//        Path path = Paths.get("D:\\ideaProject\\springbootDemo");
        Path path = Paths.get("test.txt");
        if (!Files.exists(path)) {
            Files.createFile(path);
        }
        System.out.println(path.startsWith("D:\\"));
        System.out.println(path.toString());
    }

}