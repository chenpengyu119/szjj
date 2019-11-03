package com.bjsxt.sys.service;

import com.bjsxt.commons.pojo.DataResult;
import com.bjsxt.commons.pojo.EasyUIDataGrid;
import com.bjsxt.pojo.CustomFunction;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public interface CustomFunctionService {
    EasyUIDataGrid showCustomFunction(int page,int rows,String choice);


    DataResult insert(CustomFunction cf, MultipartFile file, HttpServletRequest request) throws IOException;
}
