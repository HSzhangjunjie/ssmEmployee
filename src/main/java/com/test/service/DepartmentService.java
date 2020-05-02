package com.test.service;

import com.test.bean.Department;
import com.test.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ProjectName: ssmTest2
 * @Package: com.test.service
 * @ClassName: DepartmentServices
 * @Author: ZhangJunjie
 * @Description:
 * @Date: 2020/4/30 12:34
 * @Version: 1.0
 */
@Service
public class DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    /**
     * description: 查询所有部门
     * create time: 23:44 2020/4/28
     */
    public List<Department> getAll() {
        return departmentMapper.selectByExample(null);
    }
}
