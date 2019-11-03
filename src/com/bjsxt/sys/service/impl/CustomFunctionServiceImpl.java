package com.bjsxt.sys.service.impl;

import com.bjsxt.commons.pojo.DataResult;
import com.bjsxt.commons.pojo.EasyUIDataGrid;
import com.bjsxt.pojo.CustomFunction;
import com.bjsxt.sys.mapper.CustomFunctionMapper;
import com.bjsxt.sys.service.CustomFunctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class CustomFunctionServiceImpl implements CustomFunctionService {
    @Autowired
    private CustomFunctionMapper customFunctionMapper;

    @Override
    public EasyUIDataGrid showCustomFunction(int page, int rows, String choice) {
        long total = customFunctionMapper.selectCountByChoice(choice);
        List<CustomFunctionMapper> list = customFunctionMapper.selectByChoicePage(rows * (page - 1), rows, choice);
        return new EasyUIDataGrid(total, list);
    }

    @Override
    public DataResult insert(CustomFunction cf, MultipartFile file, HttpServletRequest request) throws IOException {
        String oldName = file.getOriginalFilename();
        String fileName = UUID.randomUUID().toString() + oldName.substring(oldName.lastIndexOf("."));
        String path = request.getServletContext().getRealPath("/WEB-INF/images");
        file.transferTo(new File(path, fileName));

        cf.setPhoto("/images/" + fileName);
        int index = customFunctionMapper.insert(cf);
        if (index == 1) {
            return DataResult.ok();
        }
        return DataResult.error("新增失败");
    }
}
