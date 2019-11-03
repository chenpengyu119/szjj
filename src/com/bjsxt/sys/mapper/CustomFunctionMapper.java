package com.bjsxt.sys.mapper;

import com.bjsxt.pojo.CustomFunction;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomFunctionMapper {
    /**
     * 分页显示
     * @return
     */
    List<CustomFunctionMapper> selectByChoicePage(@Param("pageStart") int pageStart, @Param("pageSize") int pageSize, @Param("choice") String choice);

    /**
     * 根据条件查询数量
     * @param choice
     * @return
     */
    long selectCountByChoice(String choice);

    int insert(CustomFunction cf);
}
