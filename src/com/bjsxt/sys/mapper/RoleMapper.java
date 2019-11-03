package com.bjsxt.sys.mapper;

import com.bjsxt.pojo.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {
    /**
     * 把条件查询写成动态SQL
     * @param pageStart 起始行
     * @param pageSize 行数
     * @param choice 条件，添加注解，在<bind></bind>能获取到该属性。
     * @return
     */
    List<Role> selectByChoicePage(@Param("pageStart") int pageStart,@Param("pageSize") int pageSize,@Param("choice") String choice);

    /**
     * 根据条件查询
     * @param choice
     * @return
     */
    long selectCountByChoice(@Param("choice") String choice);

    /**
     * 角色多条删除
     * @param ids
     * @return
     */
    int deleteByIds(String [] ids);

    /**
     * 删除角色-菜单表中数据
     * @param rid
     * @return
     */
    int deleteRoleMenuByRid(Long rid);

    /**
     * 批量新增
     * @param mids
     * @param rid
     * @return
     */
    int insertRoleMenu(@Param("mids") String[] mids,@Param("rid") Long rid);

    /**
     * 查询角色的菜单个数
     * @param rid
     * @return
     */
    long selectCountByRid(Long rid);


    /**
     * 根据用户id查询角色信息
     * @param uid
     * @return
     */
    List<Role> selectByUid(Long uid);

    /**
     * 查询全部
     * @return
     */
    List<Role> selectAll();

    /**
     * 查询用户包含的角色id
     * @param uid
     * @return
     */
    List<Long> selectIdsByUid(Long uid);
}
