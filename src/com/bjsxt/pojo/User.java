package com.bjsxt.pojo;

import java.util.List;

public class User {
    private Long id;
    private String username;
    private String password;

    //系统中多次需要使用登录用户的角色
    //设置到User实体类中，当登录时查询一次，以后多次使用。
    private List<Role> roles;

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
