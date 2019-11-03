package com.bjsxt.sys.controller;

import com.bjsxt.pojo.Menu;
import com.bjsxt.pojo.User;
import com.bjsxt.sys.pojo.GrantMenu;
import com.bjsxt.sys.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MenuController {
    @Autowired
    private MenuService menuService;

    /**
     * 显示系统菜单
     * @param id
     * @param session
     * @return
     */
    @RequestMapping("/showMenu")
    @ResponseBody
    public List<Menu> showMenu(@RequestParam(defaultValue = "0") Long id, HttpSession session){
        User user = (User) session.getAttribute("user");
        return menuService.showMenu(user.getId(),id);
    }

    @RequestMapping("/menu/showAllWithGrant")
    @ResponseBody
    public List<GrantMenu> showAllMenuWithGrant(Long rid){
        return menuService.showMenuAll(rid);
    }
}
