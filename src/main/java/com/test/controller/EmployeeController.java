package com.test.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.test.bean.Employee;
import com.test.bean.Msg;
import com.test.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ProjectName: ssmTest2
 * @Package: com.test.controller
 * @ClassName: EmployeeController
 * @Author: ZhangJunjie
 * @Description:
 * @Date: 2020/4/28 23:38
 * @Version: 1.0
 */
@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService service;

    /**
     * description:查询数据（分页查询）JSON方法
     * create time: 23:39 2020/4/28
     */
    @RequestMapping(value = "/res", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        //引入PageHelper分页插件
        PageHelper.startPage(pn, 5);
        //PageHelper之后的查询就是分页查询
        List<Employee> employees = service.getAll();
        //使用PageInfo包装查询后的结果
        //封装了详细的分页信息，包括有查询出来的数据，传入连续显示的页数
        PageInfo<Employee> pageInfo = new PageInfo<>(employees);

        return Msg.success().add("pageInfo", pageInfo);
    }

    /**
     * description:查询数据（分页查询）
     * create time: 23:39 2020/4/28
     */
    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model module) {
        //引入PageHelper分页插件
        PageHelper.startPage(pn, 5);
        //PageHelper之后的查询就是分页查询
        List<Employee> employees = service.getAll();
        //使用PageInfo包装查询后的结果
        //封装了详细的分页信息，包括有查询出来的数据，传入连续显示的页数
        PageInfo<Employee> pageInfo = new PageInfo<>(employees);
        //传递数据
        module.addAttribute("pageInfo", pageInfo);

        return "list";
    }

    /**
     * description: 保存数据
     * create time: 15:05 2020/4/30
     */
    @RequestMapping(value = "/res", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result) {
        if (result.hasErrors()) {
            Map<String, String> res = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError error : errors) {
                String fieldName = error.getField();
                String msg = error.getDefaultMessage();
                System.out.println("错误的字段名：" + fieldName);
                System.out.println("错误的信息：" + msg);
                res.put(fieldName, msg);
            }
            return Msg.fail().add("errorMsg", res);
        }
        try {
            service.saveEmp(employee);
            return Msg.success();
        } catch (Throwable e) {
            return Msg.fail();
        }
    }

    /**
     * description:用户名查重
     * create time: 16:50 2020/4/30
     */
    @RequestMapping("/check")
    @ResponseBody
    public Msg checkUse(String empName) {
        boolean res = service.checkUse(empName);
        if (res) {
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }

    /**
     * description:获取员工信息
     * create time: 14:44 2020/5/1
     */
    @RequestMapping(value = "/res/{empId}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("empId") Integer empId) {
        try {
            Employee employee = service.getEmp(empId);
            return Msg.success().add("emp", employee);
        } catch (Throwable throwable) {
            return Msg.fail().add("msg", throwable.getCause());
        }
    }

    /**
     * description:更新员工信息
     * create time: 15:53 2020/5/1
     */
    @RequestMapping(value = "/res/{empId}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg update(Employee employee) {
        try {
            service.update(employee);
            return Msg.success();
        } catch (Throwable throwable) {
            return Msg.fail().add("msg", throwable.getCause());
        }
    }

    /**
     * description: 删除员工信息
     * create time: 19:12 2020/5/2
     */
    @RequestMapping(value = "/res/{empId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg delete(@PathVariable("empId") String empId) {
        if (empId.contains("-")) {
            try {
                List<Integer> ids = new ArrayList<>();
                String[] empIds = empId.split("-");
                for (String temId : empIds) {
                    Integer id = Integer.parseInt(temId);
                    ids.add(id);
                }
                System.out.println(ids);
                service.deleteBatch(ids);
                return Msg.success();
            } catch (Throwable e) {
                return Msg.fail().add("msg", e.getCause());
            }

        } else {
            try {
                Integer id = Integer.parseInt(empId);
                service.delete(id);
                return Msg.success();
            } catch (Throwable e) {
                return Msg.fail().add("msg", e.getCause());
            }
        }
    }
}
