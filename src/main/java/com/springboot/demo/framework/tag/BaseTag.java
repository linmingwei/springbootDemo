package com.springboot.demo.framework.tag;

import com.springboot.demo.service.TypeService;
import freemarker.core.Environment;
import freemarker.template.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;

/**
 * @Auther: mingweilin
 * @Date: 4/26/2019 12:05
 * @Description:
 */
public abstract class BaseTag implements TemplateDirectiveModel {


    private String clazzPath = null;

    public BaseTag(String clazzPath) {
        this.clazzPath = clazzPath;
    }

    @Autowired
    private TypeService typeService;

    private TemplateModel getModel(Object o) throws TemplateModelException {
        DefaultObjectWrapperBuilder builder = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25);
        return builder.build().wrap(o);
    }

    @Override
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
        if (map.containsKey("method") && map.get("method") != null) {
            String methodName = map.get("method").toString();
            Method method = null;
            try {
                Class<?> clazz = Class.forName(clazzPath);
                method = clazz.getDeclaredMethod(methodName, Map.class);
                if (clazz != null && method != null) {
                    Object res = method.invoke(this, map);
                    environment.setVariable(methodName, getModel(res));
                }
            } catch (ClassNotFoundException | NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
                e.printStackTrace();

            }
            templateDirectiveBody.render(environment.getOut());
        }
    }
}