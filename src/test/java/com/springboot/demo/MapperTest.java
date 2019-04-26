package com.springboot.demo;

import com.springboot.demo.entity.Article;
import com.springboot.demo.mapper.ArticleMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.pegdown.PegDownProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 * @Auther: mingweilin
 * @Date: 4/15/2019 15:15
 * @Description:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(
        classes = DemoApplication.class,
        webEnvironment = SpringBootTest.WebEnvironment.DEFINED_PORT
)

public class MapperTest {
    @Autowired
    private ArticleMapper articleMapper;
    @Test
    public void insert() {
        Article article = articleMapper.selectByPrimaryKey(1);
        article.setId(null);
        article.setTop(false);
        for (int i = 2; i <= 100; i++) {
            article.setDescription("这是第"+i+"篇文章");
            articleMapper.insert(article);
        }
        System.out.println("end");

    }

    @Test
    public void testTime() {
        Article article = articleMapper.selectByPrimaryKey(1);
        DateFormat format= new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
        System.out.println(format.format(article.getCreateTime()));

    }

    @Test
    public void testMD() {
        Article article = articleMapper.selectByPrimaryKey(110);
        PegDownProcessor pdp = new PegDownProcessor(Integer.MAX_VALUE);
        String html = pdp.markdownToHtml(article.getContent());
        System.out.println(html);
    }
}
