package com.bjsxt.sys.controller;

import com.bjsxt.commons.pojo.DataResult;
import com.bjsxt.commons.pojo.EasyUIDataGrid;
import com.bjsxt.sys.pojo.RoleCheckbox;
import com.bjsxt.sys.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    @RequestMapping("/list")
    @ResponseBody
    public EasyUIDataGrid showRole(@RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "5") int rows,@RequestParam(defaultValue = "") String choice){
        return  roleService.showRole(page,rows,choice);
    }


    @RequestMapping("/delete")
    @ResponseBody
    public DataResult delete(String ids){
        return roleService.deleteByIds(ids);
    }


    @RequestMapping("/menu/update")
    @ResponseBody
    public DataResult roleMenuUpdate(String mids,Long rid){
        return roleService.updgrant(mids,rid);
    }

//    @RequestMapping("/check")
//    public List<RoleCheckbox> showRoleWithCheck(Long uid){
//        return roleService.showRoleWithCheck(uid);
//    }



}
