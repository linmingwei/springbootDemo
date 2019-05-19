package com.springboot.demo.framework.tag;

import com.springboot.demo.entity.Article;
import com.springboot.demo.entity.Resources;
import com.springboot.demo.entity.Tag;
import com.springboot.demo.entity.Type;
import com.springboot.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
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
    @Autowired
    private ResourcesService resourcesService;

    @Autowired
    private CommentService commentService;

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
    public Map<String,String> website(Map map) {
        Map<String,String> info = new HashMap<>();
        int articleNum = articleService.count();
        int tagNum = tagService.count();
        int typeNum = typeService.count();
        int commentNum = commentService.count();
        info.put("articleNum",String.valueOf(articleNum));
        info.put("tagNum",String.valueOf(tagNum));
        info.put("typeNum",String.valueOf(typeNum));
        info.put("commentNum",String.valueOf(commentNum));
        info.put("days", String.valueOf(ChronoUnit.DAYS.between(LocalDate.of(2018, 11, 1), LocalDate.now())));
        info.put("updateTime", LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy年M月dd日 HH点")));
        return info;
    }
    public List<Resources> resources(Map map) {
        return resourcesService.getParentWithChildren();
    }
}
