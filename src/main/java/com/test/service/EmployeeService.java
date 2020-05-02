package com.test.service;

import com.test.bean.Employee;
import com.test.bean.EmployeeExample;
import com.test.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ProjectName: ssmTest2
 * @Package: com.test.service
 * @ClassName: EmployeeService
 * @Author: ZhangJunjie
 * @Description:
 * @Date: 2020/4/28 23:39
 * @Version: 1.0
 */
@Service
public class EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;

    /**
     * description: 查询所有员工
     * create time: 23:44 2020/4/28
     */
    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    /**
     * description: 保存员工信息
     * create time: 23:44 2020/4/28
     */
    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    /**
     * description: 检查员工姓名
     * create time: 16:38 2020/4/30
     */
    public boolean checkUse(String empName) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(example);
        return count == 0;
    }

    /**
     * description:获取员工信息
     * create time: 14:44 2020/5/1
     */
    public Employee getEmp(Integer empId) {
        return employeeMapper.selectByPrimaryKey(empId);
    }

    /**
     * description: 删除员工信息
     * create time: 19:09 2020/5/2
     */
    public void update(Employee employee){
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    /**
     * description: 删除单个员工信息
     * create time: 19:09 2020/5/2
     */
    public void delete(Integer empId){
        employeeMapper.deleteByPrimaryKey(empId);
    }

    /**
     * description: 批量删除的实现
     * create time: 0:27 2020/5/3
     */
    public void deleteBatch(List<Integer> ids){
        EmployeeExample employeeExample=new EmployeeExample();
        EmployeeExample.Criteria criteria=employeeExample.createCriteria();
        //Delete from id in()
        criteria.andEmpIdIn(ids);
        employeeMapper.deleteByExample(employeeExample);
    }
}
