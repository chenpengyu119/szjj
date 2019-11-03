package com.bjsxt.sys.controller;

import com.bjsxt.pojo.User;
import com.bjsxt.sys.mapper.RoleMapper;
import com.bjsxt.sys.pojo.RoleCheckbox;
import com.bjsxt.sys.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class PageController {


    @RequestMapping("/")
    public String welcome(){
        return "index";
    }

    @RequestMapping("/main")
    public String showMain(){
        return "main";
    }

    @RequestMapping("/page/sys/{page}")
    public String showPage(@PathVariable String page){
        System.out.println("执行了----");
        return "sys/"+page;
    }

    @Autowired
    private RoleService roleService;
    @RequestMapping("/page/sys/permission-role")
    public String showPermissionRole(Long uid, Model model){
        List<RoleCheckbox> list = roleService.showRoleWithCheck(uid);
        model.addAttribute("roles",list);
        System.out.println("=================================="+list);
        return "sys/permission-role";
    }

//    @RequestMapping("/page/sys/role-grant")
//    public String showRoleGrant(Model model, HttpSession session){
//        User user = (User) session.getAttribute("user");
//        long [] ids = new long[user.getRoles().size()];
//        for(int i =0 ;i<user.getRoles().size();i++){
//            ids[i] = user.getRoles().get(i).getId();
//        }
//        model.addAttribute("roleids",ids);
//        return "sys/role-grant";
//    }


}
