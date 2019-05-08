package com.springboot.demo.controller;

import com.springboot.demo.vo.ResponseVo;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * @Auther: mingweilin
 * @Date: 5/7/2019 09:02
 * @Description:
 */
@Controller
@RequestMapping("/upload")
public class UploadController {

    @PostMapping("/img")
    @ResponseBody
    public ResponseVo uploadImg(@RequestParam("image") MultipartFile file) throws IOException {
        String imgsDirStr = "d:\\articleImg";
        Path imgsPath = Paths.get(imgsDirStr);
        if (!Files.exists(imgsPath)) {
            Files.createDirectories(imgsPath);
        }
        String[] temp = file.getOriginalFilename().split("\\.");
        String fileType = temp[temp.length - 1];
        String toImgName = new StringBuilder(imgsDirStr).append("\\").append(System.currentTimeMillis()).append(".").append(fileType).toString();
        try {
            file.transferTo(Paths.get(toImgName));
            return ResponseVo.success();
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseVo.fail("图片上传失败！");
        }


    }

    private void renameFile(MultipartFile file) {
        file.getOriginalFilename();
    }
}
