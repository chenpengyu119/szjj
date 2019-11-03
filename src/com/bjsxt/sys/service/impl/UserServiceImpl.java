package com.bjsxt.sys.service.impl;

import com.bjsxt.commons.exception.DaoException;
import com.bjsxt.commons.pojo.DataResult;
import com.bjsxt.commons.pojo.EasyUIDataGrid;
import com.bjsxt.sys.mapper.RoleMapper;
import com.bjsxt.sys.mapper.UserMapper;
import com.bjsxt.pojo.User;
import com.bjsxt.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public DataResult login(User user) {
        User selectByUser = userMapper.selectByUser(user);
        if(selectByUser!=null){
            selectByUser.setRoles(roleMapper.selectByUid(selectByUser.getId()));
            return DataResult.ok(selectByUser);
        }
        return DataResult.error("登录失败");
    }

    @Override
    public EasyUIDataGrid showUser(int page, int rows, String choice) {
        long total = userMapper.selectCountByChoice(choice);
        List<User> list = userMapper.selectByChoicePage(rows * (page - 1), rows, choice);
        for(User user :list){
            user.setRoles(roleMapper.selectByUid(user.getId()));
        }
        return new EasyUIDataGrid(total,list);
    }

    @Override
    public DataResult updUserRole(Long uid, List<Long> rids) {
        long count = userMapper.selectRoleUserCountByUid(uid);
        int index = userMapper.deleteRoleUserByUid(uid);
        if(index==count){
            if(rids!=null&&rids.size()>0){
                int indexInsert = userMapper.insertRoleUser(rids, uid);
                if (indexInsert==rids.size()){
                    return DataResult.ok();
                }
                throw new DaoException("修改用户角色失败 - 新增数据失败");
            }
            return DataResult.ok();
        }
        throw new DaoException("修改用户角色失败 - 删除数据失败");
    }
}
