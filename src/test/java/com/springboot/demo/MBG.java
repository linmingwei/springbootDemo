package com.springboot.demo;

import org.junit.Test;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author ldd
 * @desc
 * @create 2019-04-14 20:31
 **/
public class MBG {
    @Test
    public void generator() throws IOException, XMLParserException, InvalidConfigurationException, SQLException, InterruptedException {
        List<String> warnings = new ArrayList<String>();
        boolean overwrite = true;
        File file = new File("h");
        String apath = file.getAbsolutePath();
        String parent = apath.substring(0, apath.length() - 2);

        File configFile = new File(parent+"\\generatorConfig.xml");
        ConfigurationParser cp = new ConfigurationParser(warnings);
        Configuration config = cp.parseConfiguration(configFile);
        DefaultShellCallback callback = new DefaultShellCallback(overwrite);
        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
        myBatisGenerator.generate(null);

    }

    @Test
    public void testFile2() {
        File file = new File("h");
        String apath = file.getAbsolutePath();
        String parent = apath.substring(0, apath.length() - 2);
        System.out.println(parent+"\\generatorConfig.xml");



    }
}
