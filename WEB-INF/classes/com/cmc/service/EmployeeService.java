package com.cmc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmc.bean.Employee;
import com.cmc.bean.EmployeeExample;
import com.cmc.bean.EmployeeExample.Criteria;
import com.cmc.dao.EmployeeMapper;

@Service
public class EmployeeService {
	@Autowired
	private EmployeeMapper employeeMapper;
	public List<Employee> getAll() {
		// TODO Auto-generated method stub
		return employeeMapper.selectByExampleWithDept(null);
	}
	public void saveEmp(Employee emp) {
		// TODO Auto-generated method stub
		employeeMapper.insertSelective(emp);
	}
	public boolean checkUser(String empName) {
		// TODO Auto-generated method stub
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long result = employeeMapper.countByExample(example);
		return result == 0;
	}
	public Employee getEmp(Integer id) {
		// TODO Auto-generated method stub
		Employee employee = employeeMapper.selectByPrimaryKey(id);
		return employee;
	}
	public void updateEmp(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.updateByPrimaryKey(employee);
	}
	public void deleteEmp(Integer id) {
		// TODO Auto-generated method stub
		employeeMapper.deleteByPrimaryKey(id);
	}
	public void deleteEmpBatch(List<Integer> list_ids) {
		// TODO Auto-generated method stub
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpIdIn(list_ids);
		employeeMapper.deleteByExample(example);
	}

}
