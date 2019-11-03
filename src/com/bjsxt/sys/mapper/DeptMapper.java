package com.bjsxt.sys.mapper;

import com.bjsxt.pojo.Dept;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 部门所有数据操作
 */
public interface DeptMapper {
    /**
     * 分页查询
     * @param pageStart 起始行
     * @param pageSize 数量
     * @return
     */
    List<Dept> selectByPage(int pageStart, int pageSize);

    /**
     * 查询总条数
      * @return 总条数
     */
    long selectCount();

    /**
     * 新增
     * @param dept 客户端参数
     * @return 受影响行数
     */
    int insert(Dept dept);

    /**
     * 根据编号查询或根据名称模糊查询
     * @param choice 可能是编号，也可能是名称
     * @return 查询结果
     */
    List<Dept> selectByNameId(@Param("choice") String choice,@Param("pageStart") int pageStart,@Param("pageSize") int pageSize);

    /**
     * 指定条件的行数
     * @param choice
     * @return
     */
    long selectCountByChoice(@Param("choice") String choice);

    /**
     * 多行删除
     * @param ids
     * @return
     */
    int deleteByIds(String[] ids);

    /**
     * 修改表中所有数据
     * @param dept
     * @return
     */
    int updateById(Dept dept);

}
