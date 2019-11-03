package com.bjsxt.sys.controller;

import com.bjsxt.commons.pojo.DataResult;
import com.bjsxt.commons.pojo.EasyUIDataGrid;
import com.bjsxt.pojo.CustomFunction;
import com.bjsxt.sys.service.CustomFunctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
public class CustomFunctionController {
    @Autowired
    private CustomFunctionService customFunctionService;

    @RequestMapping("/custom/list")
    @ResponseBody
    public EasyUIDataGrid showCustomFunction(int page,int rows,String choice){
        return customFunctionService.showCustomFunction(page,rows,choice);
    }

    @RequestMapping("/custom/insert")
    @ResponseBody
    public DataResult insert(CustomFunction cf, MultipartFile file, HttpServletRequest request){
        try {
            return customFunctionService.insert(cf,file,request);
        } catch (IOException e) {
            e.printStackTrace();
            return DataResult.error("图片上传失败");
        } catch (Exception e){
            return DataResult.error("服务器异常");
        }
    }
}
