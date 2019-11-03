package com.bjsxt.sys.service.impl;

import com.bjsxt.commons.pojo.DataResult;
import com.bjsxt.commons.pojo.EasyUIDataGrid;
import com.bjsxt.pojo.Dept;
import com.bjsxt.sys.mapper.DeptMapper;
import com.bjsxt.sys.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeptServiceImpl  implements DeptService {
    @Autowired
    private DeptMapper deptMapper;
    @Override
    public EasyUIDataGrid showDept(int page, int rows) {
        EasyUIDataGrid dataGrid = new EasyUIDataGrid();
        dataGrid.setTotal(deptMapper.selectCount());
        dataGrid.setRows(deptMapper.selectByPage(rows*(page-1),rows));
        return dataGrid;
    }

    @Override
    public DataResult insert(Dept dept) {
        int index = deptMapper.insert(dept);
        if(index==1){
            return DataResult.ok();
        }
        return DataResult.error("新增失败");
    }

    @Override
    public EasyUIDataGrid showDeptByChoice(int page, int rows, String choice) {
        EasyUIDataGrid dataGrid = new EasyUIDataGrid();
        dataGrid.setTotal(deptMapper.selectCountByChoice(choice));
        dataGrid.setRows(deptMapper.selectByNameId(choice,rows*(page-1),rows));
        return dataGrid;
    }

    @Override
    public DataResult delete(String ids) {
        String[] idsArr = ids.split(",");
        int index = deptMapper.deleteByIds(idsArr);
        if(index==idsArr.length){
            return DataResult.ok();
        }
        return DataResult.error("删除失败");
    }

    @Override
    public DataResult update(Dept dept) {
        int index = deptMapper.updateById(dept);
        if(index==1){
            return DataResult.ok();
        }
        return DataResult.error("修改失败");
    }
}
