package com.springboot.demo.entity;

import lombok.Data;

/**
 * @Auther: mingweilin
 * @Date: 4/17/2019 18:31
 * @Description:
 */
@Data
public class ArticleForm {
    private String title;
    private String content;
    private Integer type;
    private Integer tag;
    private String description;
    private String comment;
    private String top;

}
