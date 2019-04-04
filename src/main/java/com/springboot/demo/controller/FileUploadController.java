package com.springboot.demo.controller;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * @Auther: mingweilin
 * @Date: 4/1/2019 10:35
 * @Description:
 */
@Controller
public class FileUploadController {
    @PostMapping(value = "/upload")
    @ResponseBody
    public String upload(MultipartFile file) throws IOException {
        if (file != null) {
            String uploadDir = "d:\\upload";
            String[] temp = file.getOriginalFilename().split("\\.");
            String fileType = temp[temp.length - 1];
            Path uploadPath = Paths.get(uploadDir);
            String uploadFile = uploadDir+"\\"+System.currentTimeMillis()+"."+fileType;
            System.out.println("上传前文件是否存在："+Files.exists(Paths.get(uploadFile)));
            if (!Files.exists(uploadPath)) {
                Files.createDirectory(uploadPath);
            }
            file.transferTo(Paths.get(uploadFile));
            System.out.println("上传后文件是否存在："+Files.exists(Paths.get(uploadFile)));
//            FileUtils.writeByteArrayToFile();
            if (Files.exists(Paths.get(uploadFile))) {
                return "文件上传成功";
            }else {
                return "文件上传失败";
            }
//            System.out.println(file.getName());
        }else {
            return "文件为空";
        }
    }
}
