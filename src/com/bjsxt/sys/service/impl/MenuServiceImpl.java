package com.bjsxt.sys.service.impl;

import com.bjsxt.pojo.Menu;
import com.bjsxt.sys.mapper.MenuMapper;
import com.bjsxt.sys.pojo.GrantMenu;
import com.bjsxt.sys.service.MenuService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuMapper menuMapper;
    @Override
    public List<Menu> showMenu(Long uid, Long pid) {
        List<Menu> list = menuMapper.selctByPidUid(pid, uid);
        for (Menu menu:list) {
            menu.setState(menu.isIsparent()?"closed":"open");
        }
        return list;
    }

    @Override
    public List<GrantMenu> showMenuAll(Long rid) {
        // 所有页面要的集合
        List<GrantMenu> listGrant = new ArrayList<>();
        //查询出所有第一层菜单
        List<Menu> list = menuMapper.selectByPid(0L);
        //rid所有能操作的菜单id
        List<Long> listAllId = menuMapper.selectByRid(rid);
        for(Menu menu :list){
            //把Menu转换为GrantMenu
            GrantMenu gm = new GrantMenu();
            //把一个对象中属性赋值给另一个对象的同名属性（get/set方法）
            BeanUtils.copyProperties(menu,gm);
            //gm.setChecked(listAllId.contains((long)gm.getId()));
            //查询当前菜单的所有子菜单
            List<Menu> listChild = menuMapper.selectByPid(gm.getId());
            //把所有List<menu>转换为List<GrantMenu>
            List<GrantMenu> listChildGrant = new ArrayList<>();
            for (Menu child: listChild) {
                GrantMenu gmChild = new GrantMenu();
                BeanUtils.copyProperties(child,gmChild);
                gmChild.setChecked(listAllId.contains(((long)gmChild.getId())));
                listChildGrant.add(gmChild);
            }

            gm.setChildren(listChildGrant);
            listGrant.add(gm);
        }
        return listGrant;
    }
}
