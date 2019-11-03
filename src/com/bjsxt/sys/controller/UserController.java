package com.bjsxt.sys.controller;

import com.bjsxt.commons.pojo.DataResult;
import com.bjsxt.commons.pojo.EasyUIDataGrid;
import com.bjsxt.pojo.Role;
import com.bjsxt.pojo.User;
import com.bjsxt.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 登录
     *
     * @param user 客户端菜单
     * @return 数据模板
     */
    @RequestMapping("/login")
    @ResponseBody
    public DataResult login(User user, HttpSession session) {
        DataResult dr = userService.login(user);
        if (dr.getStatus() == 200) {
            session.setAttribute("user", dr.getData());
        }
        return dr;
    }

    /**
     * 退出
     *
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping("/user/getRoles")
    @ResponseBody
    public List<Role> getRoles(HttpSession session) {
        User user = (User) session.getAttribute("user");
        return user.getRoles();
    }

    @RequestMapping("/user/list")
    @ResponseBody
    public EasyUIDataGrid showUser(int page, int rows, String choice) {
        return userService.showUser(page, rows, choice);
    }

    @RequestMapping("/user/role/update")
    @ResponseBody
    public DataResult updateUserRole(Long uid, @RequestParam("rid") List<Long> rid) {
        return userService.updUserRole(uid, rid);
    }
}
