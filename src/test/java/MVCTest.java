import com.github.pagehelper.PageInfo;
import com.test.bean.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * @ProjectName: ssmTest2
 * @Package: PACKAGE_NAME
 * @ClassName: MVCTest
 * @Author: ZhangJunjie
 * @Description:
 * @Date: 2020/4/29 0:06
 * @Version: 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:/config/applicationConfig.xml",
        "classpath:/config/spring_mvcConfig.xml"})
public class MVCTest {
    //传入Spring MVC的ioc
    @Autowired
    WebApplicationContext context;

    //虚拟的MVC请求,获取处理结果
    private MockMvc mockMvc;

    @Before
    public void initMockMvc() {
        mockMvc = MockMvcBuilders.standaloneSetup(context).build();
    }

    @Test
    public void testPage() {
        try {
            //模拟请求，拿到返回值
            MockHttpServletRequestBuilder builder=MockMvcRequestBuilders.
                    get("/emps").param("pn", "1");
            MvcResult result = mockMvc.perform(builder).andReturn();
            MockHttpServletRequest request=result.getRequest();
            PageInfo info = (PageInfo) request.getAttribute("pageInfo");
            System.out.println("当前页码：" + info.getPageNum());
            System.out.println("总页码：" + info.getPages());
            System.out.println("总记录数：" + info.getTotal());
            System.out.println("在页面中需要连续显示的页码：");
            int[] nums = info.getNavigatepageNums();
            for (int i : nums) {
                System.out.println(" " + i);
            }
            //获取员工数据
            List<Employee> employees = info.getList();
            for (Employee employee : employees) {
                System.out.println(" ID: " + employee.getdId() + " Name :" + employee.getEmpName());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
