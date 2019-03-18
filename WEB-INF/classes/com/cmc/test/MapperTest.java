package com.cmc.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cmc.bean.Employee;
import com.cmc.dao.DepartmentMapper;
import com.cmc.dao.EmployeeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {
	@Autowired
	DepartmentMapper departmentmapper;
	@Autowired
	EmployeeMapper employee;
	@Autowired
	SqlSession sqlsession;
	@Test
	public void testCrud() {
//		departmentmapper.insertSelective(new Department(null,"开发部"));
//		for (int i = 0; i < 10; i++) {
//			String uid = UUID.randomUUID().toString().substring(0, 5)+i;
//			employee.insertSelective(new Employee(null,uid,"m",uid+"@qq.com",1));
//		}
	}
}
