package com.springboot.demo.framework.tag;

import com.springboot.demo.entity.Article;
import com.springboot.demo.entity.Tag;
import com.springboot.demo.entity.Type;
import com.springboot.demo.service.ArticleService;
import com.springboot.demo.service.TagService;
import com.springboot.demo.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: mingweilin
 * @Date: 4/26/2019 13:33
 * @Description:
 */
@Component
public class CustomTag extends BaseTag {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private TypeService typeService;
    @Autowired
    private TagService tagService;

    public CustomTag() {
        super(CustomTag.class.getName());
    }

    public List<Type> types(Map map) {
        return typeService.withChildren();
    }

    public List<Tag> tags(Map map) {
        return tagService.list();
    }

    public List<Article> recentArticle(Map map) {
        Map<String,String> params = new HashMap<>();
        params.put("order","createTime");
        params.put("type","desc");
        params.put("limit","6");
        return articleService.list(params);
    }
    public List<Article> recommendArticle(Map map) {
        Map<String,String> params = new HashMap<>();
        params.put("order","look");
        params.put("type","desc");
        params.put("limit","6");
        return articleService.list(params);
    }
    public List<Article> randomArticle(Map map) {
        Map<String,String> params = new HashMap<>();
        params.put("limit","6");
        return articleService.list(params);
    }
}
