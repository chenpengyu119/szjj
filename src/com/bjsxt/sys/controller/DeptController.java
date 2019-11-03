package com.bjsxt.sys.controller;

import com.bjsxt.commons.pojo.DataResult;
import com.bjsxt.commons.pojo.EasyUIDataGrid;
import com.bjsxt.pojo.Dept;
import com.bjsxt.sys.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/// @RestController 表示当前控制器中所有方法都有@ResponseBody
@RestController
@RequestMapping("/dept")
public class DeptController {
    @Autowired
    private DeptService deptService;

    @RequestMapping("/list")
    public EasyUIDataGrid showDept(int page,int rows){
        return deptService.showDept(page,rows);
    }

    @RequestMapping("/add")
    public DataResult insert(Dept dept){
        return deptService.insert(dept);
    }

    @RequestMapping("/listByChoice")
    public EasyUIDataGrid showDeptByChoice(int page,int rows,String choice){
        return deptService.showDeptByChoice(page,rows,choice);
    }

    @RequestMapping("/delete")
    public DataResult delete(String ids){
        return deptService.delete(ids);
    }


    @RequestMapping("/update")
    public DataResult update(Dept dept){
        return deptService.update(dept);
    }
}
