package com.cmc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cmc.bean.Employee;
import com.cmc.bean.EmployeeExample;

public interface EmployeeMapper {
    long countByExample(EmployeeExample example);

    int deleteByExample(EmployeeExample example);
    
    int deleteByPrimaryKey(Integer empId);

    int insert(Employee record);

    int insertSelective(Employee record);

    List<Employee> selectByExample(EmployeeExample example);
    
    Employee selectByPrimaryKey(Integer empId);

    List<Employee> selectByExampleWithDept(EmployeeExample example);
    
    int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);
    
    int updateByPrimaryKey(@Param("record") Employee record);
}