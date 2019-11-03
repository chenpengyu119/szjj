package com.bjsxt.sys.service;

import com.bjsxt.pojo.Menu;
import com.bjsxt.sys.pojo.GrantMenu;

import java.util.List;

/**
 * 系统菜单操作
 */
public interface MenuService {
    /**
     * 显示主页面菜单
     * @param uid 用户uid
     * @param pid 父菜单id
     * @return 一层菜单
     */
    List<Menu> showMenu(Long uid, Long pid);

    /**
     * 查询全部菜单，具有操作权限的菜单被勾选
     * @param rid
     * @return
     */
    List<GrantMenu> showMenuAll(Long rid);
}
