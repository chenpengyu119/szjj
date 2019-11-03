package com.bjsxt.sys.pojo;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

/**
 * 针对授权功能使用的是一个实体类
 */
public class GrantMenu {
    private Long id;
    @JsonProperty("text")
    private String name;
    private Long pid;
    @JsonProperty("attributes")
    private String url;
    private boolean isparent;
    private boolean checked;
    private List<GrantMenu> children;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public boolean isIsparent() {
        return isparent;
    }

    public void setIsparent(boolean isparent) {
        this.isparent = isparent;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public List<GrantMenu> getChildren() {
        return children;
    }

    public void setChildren(List<GrantMenu> children) {
        this.children = children;
    }
}
