package com.bjsxt.sys.service;

import com.bjsxt.commons.pojo.DataResult;
import com.bjsxt.commons.pojo.EasyUIDataGrid;
import com.bjsxt.pojo.Dept;

/**
 * 所有部门的业务
 */
public interface DeptService {

    /**
     * 分页显示
     * @param page 当前第几页
     * @param rows 一页几行
     * @return
     */
    EasyUIDataGrid showDept(int page,int rows);

    /**
     * 新增
     * @param dept 客户端参数
     * @return 交互模板
     */
    DataResult insert(Dept dept);

    /**
     * 条件查询
     * @param page 页码
     * @param rows 行数
     * @param choice 条件
     * @return 显示数据
     */
    EasyUIDataGrid showDeptByChoice(int page,int rows,String choice);

    /**
     * 多条删除
     * @param ids
     * @return
     */
    DataResult delete(String ids);

    /**
     * 修改
     * @param dept
     * @return
     */
    DataResult update(Dept dept);
}
