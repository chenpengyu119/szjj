package com.bjsxt.sys.service.impl;

import com.bjsxt.commons.pojo.DataResult;
import com.bjsxt.commons.pojo.EasyUIDataGrid;
import com.bjsxt.pojo.Role;
import com.bjsxt.sys.mapper.RoleMapper;
import com.bjsxt.sys.pojo.RoleCheckbox;
import com.bjsxt.sys.service.RoleService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;
    @Override
    public EasyUIDataGrid showRole(int page, int rows, String choice) {
        long total = roleMapper.selectCountByChoice(choice);
        List<Role> list = roleMapper.selectByChoicePage(rows * (page - 1), rows, choice);
        return new EasyUIDataGrid(total,list);
    }

    @Override
    public DataResult deleteByIds(String ids) {
        String[] idArr = ids.split(",");
        int index = roleMapper.deleteByIds(idArr);
        if(index==idArr.length){
            return DataResult.ok();
        }
        return DataResult.error("删除失败");
    }

    @Override
    public DataResult updgrant(String mids, Long rid) {
        long count = roleMapper.selectCountByRid(rid);
        int index = roleMapper.deleteRoleMenuByRid(rid);
        if(index==count){
            if(mids!=null&&!mids.equals("")){
                String[] idArr = mids.split(",");
                int indexInsert = roleMapper.insertRoleMenu(idArr, rid);
                if(indexInsert==idArr.length){
                    return DataResult.ok();
                }else{
                    return DataResult.error("授权失败 - 新增数据失败");
                }
            }
            return DataResult.ok();
        }
        return DataResult.error("授权失败 - 删除失败");
    }

    @Override
    public List<RoleCheckbox> showRoleWithCheck(Long uid) {
        //查询全部
        List<Role> list = roleMapper.selectAll();
        //查询出所有用户角色的角色
        List<Long> listIds = roleMapper.selectIdsByUid(uid);
        //最终要的效果
        List<RoleCheckbox> listCheck = new ArrayList<>();
        for(Role r :list){
            RoleCheckbox checkbox = new RoleCheckbox();
            BeanUtils.copyProperties(r,checkbox);
            checkbox.setChecked(listIds.contains((long)r.getId()));
            listCheck.add(checkbox);
        }
        return listCheck;
    }
}
