package com.bjsxt.sys.mapper;

import com.bjsxt.pojo.Menu;

import java.util.List;

public interface MenuMapper {
    List<Menu> selctByPidUid(Long pid, Long uid);

    /**
     * 查询角色所有能操作菜单的id
     * @param rid
     * @return
     */
    List<Long> selectByRid(Long rid);

    /**
     * 根据pid查询每层所有菜单
     */
    List<Menu> selectByPid(Long pid);
}
