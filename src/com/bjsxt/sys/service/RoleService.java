package com.bjsxt.sys.service;

import com.bjsxt.commons.pojo.DataResult;
import com.bjsxt.commons.pojo.EasyUIDataGrid;
import com.bjsxt.sys.pojo.RoleCheckbox;

import java.util.List;

public interface RoleService {
    /**
     * 分页查询带有条件查询
     * @param page
     * @param rows
     * @param choice
     * @return
     */
    EasyUIDataGrid showRole(int page,int rows,String choice);

    /**
     * 多条删除
     * @param ids
     * @return
     */
    DataResult deleteByIds(String ids);

    /**
     * 授权功能
     * @param mid
     * @param rid
     * @return
     */
    DataResult updgrant(String mids,Long rid);


    List<RoleCheckbox> showRoleWithCheck(Long uid);
}
