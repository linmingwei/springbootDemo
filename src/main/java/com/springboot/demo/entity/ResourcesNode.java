package com.springboot.demo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Auther: mingweilin
 * @Date: 5/22/2019 19:58
 * @Description:
 */
public class ResourcesNode {
    private boolean parent;
    private boolean checked;
    private String title;
    private Integer id;

    private String name;

    private String type;

    private String url;

    private String permission;

    private Integer pid;

    private Integer sort;

    private Byte available;

    private String icon;

    private Date createTime;

    private Date updateTime;

    private String alias;

    private List<ResourcesNode> children = new ArrayList<>();

    public ResourcesNode(Resources resources) {
        this.id = resources.getId();

        this.name = resources.getName();

        this.type = resources.getType();

        this.url = resources.getUrl();

        this.permission = resources.getPermission();

        this.pid = resources.getPid();

        this.sort = resources.getSort();

        this.available = resources.getAvailable();

        this.icon = resources.getIcon();

        this.createTime = resources.getCreateTime();

        this.updateTime = resources.getUpdateTime();

        this.alias = resources.getAlias();
        List<Resources> children = resources.getChildren();
        List<ResourcesNode> resourcesNodes = new ArrayList<>();
        children.forEach(child -> resourcesNodes.add(new ResourcesNode(child)));
        this.children = resourcesNodes;

    }

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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Byte getAvailable() {
        return available;
    }

    public void setAvailable(Byte available) {
        this.available = available;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public List<ResourcesNode> getChildren() {
        return children;
    }

    public void setChildren(List<ResourcesNode> children) {
        this.children = children;
    }
}

