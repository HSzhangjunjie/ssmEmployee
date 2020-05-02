package com.test.controller;

import com.test.bean.Department;
import com.test.bean.Msg;
import com.test.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @ProjectName: ssmTest2
 * @Package: com.test.controller
 * @ClassName: DepartmentController
 * @Author: ZhangJunjie
 * @Description:
 * @Date: 2020/4/30 12:33
 * @Version: 1.0
 */
@Controller
public class DepartmentController {
    @Autowired
    private DepartmentService service;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts() {

        List<Department> departments = service.getAll();

        return Msg.success().add("depts", departments);
    }
}
