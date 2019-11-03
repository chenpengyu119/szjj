package com.bjsxt.sys.service;

import com.bjsxt.commons.pojo.DataResult;
import com.bjsxt.commons.pojo.EasyUIDataGrid;
import com.bjsxt.pojo.User;

import java.util.List;

/**
用户业务逻辑
 */
public interface UserService {
    /**
     * 用户登录
     * @param user 客户端参数
     * @return 查询结果
     */
    DataResult login(User user);

    /**
     * 分页显示用户信息（带有条件）
     * @param page
     * @param rows
     * @param choice
     * @return
     */
    EasyUIDataGrid showUser(int page,int rows,String choice);

    /**
     * 修改用户角色
     * @param uid
     * @param rids
     * @return
     */
    DataResult updUserRole(Long uid, List<Long> rids);
}
