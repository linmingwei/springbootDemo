package com.springboot.demo.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: mingweilin
 * @Date: 5/22/2019 19:58
 * @Description:
 */
public class ResourcesNode extends Resources {
    private boolean parent;
    private boolean checked;
    private String title;

    public boolean isParent() {
        return parent;
    }

    public void setParent(boolean parent) {
        this.parent = parent;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<ResourcesNode> getChildren() {
        List<Resources> children = super.getChildren();
        List<ResourcesNode> tree = new ArrayList<>();
        children.forEach(child ->{
            tree.add((ResourcesNode)child);
        });
        return tree;
    }
}
