package com.bjsxt.sys.mapper;

import com.bjsxt.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户表所有操作
 */
public interface UserMapper {
    /*
    根据用户名和密码进行查询用户信息
     */
    User selectByUser(User user);


    /**
     * 动态条件查询
     * @param pageStart
     * @param pageSize
     * @param choice
     * @return
     */
    List<User> selectByChoicePage(@Param("pageStart") int pageStart, @Param("pageSize") int pageSize, @Param("choice") String choice);

    /**
     * 执行条件的总条数
     * @param choice
     * @return
     */
    long selectCountByChoice(@Param("choice") String choice);

    /**
     * 根据用户id删除role_user表中数据
     * @param uid
     * @return
     */
    int deleteRoleUserByUid(Long uid);

    /**
     * 查询用户在role_User表中数据个数
     * @param uid
     * @return
     */
    long selectRoleUserCountByUid(Long uid);

    /**
     * 批量新增
     * @param rids
     * @param uid
     * @return
     */
    int insertRoleUser(@Param("rids") List<Long> rids,@Param("uid") Long uid);
}
