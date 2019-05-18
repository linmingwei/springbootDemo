package com.springboot.demo;

import com.springboot.demo.entity.Article;
import com.springboot.demo.entity.Resources;
import com.springboot.demo.entity.Role;
import com.springboot.demo.entity.RoleResources;
import com.springboot.demo.mapper.ArticleMapper;
import com.springboot.demo.mapper.ResourcesMapper;
import com.springboot.demo.mapper.RoleMapper;
import com.springboot.demo.mapper.RoleResourcesMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.pegdown.PegDownProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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
    @Autowired
    private ResourcesMapper resourcesMapper;
    @Autowired
    private RoleResourcesMapper roleResourcesMapper;
    @Autowired
    private RoleMapper roleMapper;
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

    @Test
    public void roleAddResources() {
        List<Role> roles = roleMapper.selectAll();
        List<Resources> resources = resourcesMapper.selectAll();
        List<Resources> first = resources.stream().
                filter(resource -> resource.getPid() != null && resource.getPid() == 0).
                collect(Collectors.toList());
        resources.forEach(resource ->{
            first.forEach(f->{
                if (resource.getPid() != null && resource.getPid() == f.getId()) {
                    f.getChildren().add(resource);
                }
            });
        } );
        resources.forEach(resource ->{
            first.forEach(f->{
                f.getChildren().forEach(c->{
                    if (resource.getPid() != null && resource.getPid() == c.getId()) {
                        c.getChildren().add(resource);
                    }
                });
            });
        } );
        roles.forEach(role ->{
            if (role.getId() == 1) {
                addResources(role,first);
            } else if (role.getId() == 2) {
                List<Resources> second = first.stream().limit(2).collect(Collectors.toList());
                addResources(role,second);
            }else {
                List<Resources> third = new ArrayList<>();
                third.add(first.get(0));
                addResources(role,third);
            }
        });

    }

    private void addResources(Role role,List<Resources> resources) {
        List<Integer> ids = new ArrayList<>();
        resources.forEach(r ->{
            ids.add(r.getId());
            if (r.getChildren() != null && r.getChildren().size() != 0) {
                r.getChildren().forEach(c1 ->{
                    ids.add(c1.getId());
                    if (c1.getChildren() != null && c1.getChildren().size() != 0) {
                        c1.getChildren().forEach(d1 ->{
                            ids.add(d1.getId());
                        });
                    }
                });
            }
        });
        ids.forEach(id ->{
            roleResourcesMapper.insert(new RoleResources(role.getId(),id));
        });

    }
}
