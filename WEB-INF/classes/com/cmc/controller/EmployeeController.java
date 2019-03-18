package com.cmc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cmc.bean.Employee;
import com.cmc.bean.Msg;
import com.cmc.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class EmployeeController {
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmps(@RequestParam(value="pn" ,defaultValue="1")Integer pn) {
		PageHelper.startPage(pn, 7,"emp_id asc");
		List<Employee> emps = employeeService.getAll();
		PageInfo page = new PageInfo(emps);
		return Msg.success().add("pageInfo", page);
	}
	
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee emp,BindingResult result) {
		if(result.hasErrors()){
			Map<String,Object> map = new HashMap<String,Object>();
			List<FieldError> errors = result.getFieldErrors();
			for(FieldError fieldErrors : errors){
				map.put(fieldErrors.getField(),fieldErrors.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		}else{
			employeeService.saveEmp(emp);
			return Msg.success();
		}
	}
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id") Integer id) {
		Employee employee = employeeService.getEmp(id);
		return Msg.success().add("emp", employee);
	}
	@RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteEmp(@PathVariable("ids") String ids) {
		//批量
		if(ids.contains("-")){
			List<Integer> list_ids = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for(String s:str_ids){
				list_ids.add(Integer.parseInt(s));
			}
			employeeService.deleteEmpBatch(list_ids);
			return Msg.success();
		}
		//单个删除
		else{
			Integer id = Integer.parseInt(ids);
			employeeService.deleteEmp(id);
			return Msg.success();
		}
	}
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
	@ResponseBody
	public Msg getEmp(Employee employee) {
		employeeService.updateEmp(employee);
		return Msg.success();
	}
	@RequestMapping("/checkuser")
	@ResponseBody
	public Msg checkUser(String empName){
		String regx = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5}$)";
		if(!empName.matches(regx)){
			return Msg.fail().add("va_msg", "用户名为2到5位中文或者3到16位英文字母、数字");
		}
		boolean result = employeeService.checkUser(empName);
		if(result){
			return Msg.success();
		}else{
			return Msg.fail().add("va_msg", "用户名不可用");
		}
	}
//	@RequestMapping("/emps")
//	public String getEmps(@RequestParam(value="pn" ,defaultValue="1")Integer pn,Model model) {
//		PageHelper.startPage(pn, 5);
//		List<Employee> emps = employeeService.getAll();
//		PageInfo page = new PageInfo(emps,5);
//		model.addAttribute("pageInfo", page);
//		return "list";
//	}
}
