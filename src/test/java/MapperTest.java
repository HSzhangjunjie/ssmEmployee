import com.test.bean.Department;
import com.test.bean.Employee;
import com.test.dao.DepartmentMapper;
import com.test.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * @ProjectName: ssmTest2
 * @Package: PACKAGE_NAME
 * @ClassName: MapperTest
 * @Author: ZhangJunjie
 * @Description:
 * @Date: 2020/4/28 22:32
 * @Version: 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/config/applicationConfig.xml"})
public class MapperTest {
    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private SqlSession sqlSession;

    @Test
    public void addTest() {
        //插入几个部门
        departmentMapper.insertSelective(new Department(null, "开发部"));
        departmentMapper.insertSelective(new Department(null, "测试部"));
        //插入几个员工数据
        employeeMapper.insertSelective(new Employee(null, "张三", "M", "zhangsan@qq.com", 1));
        employeeMapper.insertSelective(new Employee(null, "李四", "M", "lisi@qq.com", 2));
        //批量插入多个员工
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 1000; i++) {
            String name = UUID.randomUUID().toString().substring(0, 5) + i;
            String gender;
            int did;
            if (i % 2 == 0) {
                gender = "M";
                did = 1;
            } else {
                gender = "W";
                did = 2;
            }
            mapper.insertSelective(new Employee(null, name, gender, name + "@qq.com", did));
        }
    }

}
