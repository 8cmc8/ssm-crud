<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("path", path);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>员工列表</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</head>

<body>
	<!-- Modal -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工添加</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">name</label>
							<div class="col-sm-10">
								<input type="text" name="empName" class="form-control"
									id="empName_add_input" placeholder="name"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<input type="text" name="email" class="form-control"
									id="email_add_input" placeholder="email@qq.com"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender1_add_input" value="m"
									checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="gender2_add_input" value="f"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">department</label>
							<div class="col-sm-4">
								<select class="form-control" name="dId" id="dept_add_name">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">name</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="empName_update_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<input type="text" name="email" class="form-control"
									id="email_update_input" placeholder="email@qq.com"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender1_update_input" value="m"
									checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="gender2_update_input" value="f"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">department</label>
							<div class="col-sm-4" id="dept">
								<select class="form-control" name="dId" id="dept_update_name">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 标题 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-10">
				<button class="btn btn-info" id="emp_add_modal_btn">新增</button>
				<button class="btn btn-danger" id="emp_deleteall_btn">删除</button>
			</div>
		</div>
		<!-- 表格 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all"/>
							</th>
							<th>id</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>department</th>
							<th>operating</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		</div>
		<!-- 分页 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6" id="page_info"></div>
			<!-- 分页条信息 -->
			<div class="col-md-6 col-md-offset-8" id="page_nav"></div>
		</div>
	</div>
	<script type="text/javascript">
		var totalpage,currentPage;
		$(function() {
			to_page(1);
		});
	
		function to_page(pn) {
			$.ajax({
				url : "${path}/emps",
				data : "pn=" + pn,
				type : "get",
				success : function(result) {
					//	console.log(result);
					build_emps_table(result);
					build_page_info(result);
					build_page_nav(result);
				}
			});
		}
		function build_emps_table(result) {
			//emps_table tbody
			$("#emps_table tbody").empty();
			var emps = result.extend.pageInfo.list;
			$.each(emps, function(index, item) {
				var checkBox = $("<td></td>").append("<input type='checkbox' class='check_item'/>");
				var empIdTd = $("<td></td>").append(item.empId);
				var empNameTd = $("<td></td>").append(item.empName);
				var genderTd = $("<td></td>").append(item.gender == "m" ? "男" : "女");
				var emailTd = $("<td></td>").append(item.email);
				var deptNameTd = $("<td></td>").append(item.department.deptName);
				var editBtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn").append($("<span></span>")).addClass("glyphicon glyphicon-pencil").append(" ").append("编辑");
				editBtn.attr("emp_id",item.empId);
				var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>")).addClass("glyphicon glyphicon-trash").append(" ").append("删除");
				delBtn.attr("emp_id",item.empId);
				var BtnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
				$("<tr></tr>").append(checkBox)
					.append(empIdTd)
					.append(empNameTd)
					.append(genderTd)
					.append(emailTd)
					.append(deptNameTd)
					.append(BtnTd)
					.appendTo("#emps_table tbody");
			})
			console.log(emps);
		}
	
		function build_page_info(result) {
			//page_info
			$("#page_info").empty();
			$("#page_info").append("当前第" + result.extend.pageInfo.pageNum + "页，总页数：" + result.extend.pageInfo.pages + "，总记录数：" + result.extend.pageInfo.total);
			totalpage = result.extend.pageInfo.total;
			currentPage = result.extend.pageInfo.pageNum;
		}
	
		function build_page_nav(result) {
			//page_nav
			$("#page_nav").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
			var prePageLi = $("<li></li>").append($("<a></a>").attr("href", "#").append("&laquo;"));
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				firstPageLi.click(function() {
					to_page(1);
				});
				prePageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum - 1);
				})
			}
			var nextPageLi = $("<li></li>").append($("<a></a>").attr("href", "#").append("&raquo;"));
			var lastPageLi = $("<li></li>").append($("<a></a>").attr("href", "#").append("末页"));
			if (result.extend.pageInfo.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			} else {
				nextPageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum + 1);
				});
				lastPageLi.click(function() {
					to_page(result.extend.pageInfo.pages);
				})
			}
			ul.append(firstPageLi).append(prePageLi);
			$.each(result.extend.pageInfo.navigatepageNums, function(index, item) {
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					to_page(item);
				})
				ul.append(numLi);
			})
			ul.append(nextPageLi).append(lastPageLi);
			var nav = $("<nav></nav>").append(ul);
			nav.appendTo("#page_nav");
		}
		function reset_form(ele) {
			$(ele)[0].reset();
			$(ele).find("*").removeClass("has-success has-error");
			$(ele).find(".help-block").text("");
		}
	
		function getDepts(ele) {
			$(ele).empty();
			$.ajax({
				url : "${path}/depts",
				type : "get",
				async: false,//同步
				success : function(result) {
					$.each(result.extend.depts, function() {
						var dept = $("<option></option>").append(this.deptName).attr("value", this.deptId);
						dept.appendTo(ele);
					})
	
				}
			});
		}
		function getEmp(id) {
			$.ajax({
				url : "${path}/emp/"+id,
				type : "get",
				success : function(result) {
				var empData = result.extend.emp;
					$("#empName_update_static").text(empData.empName);
					$("#email_update_input").val(empData.email);
					$("#empUpdateModal input[name=gender]").val([empData.gender]);
					$("#empUpdateModal select").val([empData.dId]);
				}
			});
		}
		//表单校验
		function validate_add_form() {
			var empName = $("#empName_add_input").val();
			var regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
			if (!regName.test(empName)) {
				//alert("用户名为2到5位中文或者3到16位英文字母、数字");
				show_validate_msg("#empName_add_input", "error", "用户名为2到5位中文或者3到16位英文字母、数字");
				return false;
			} else {
				show_validate_msg("#empName_add_input", "success", "");
			}
	
			var email = $("#email_add_input").val();
			var regEmail = /^([a-zA-Z0-9_\.-]+)@([\da-zA-Z\.-]+)\.([a-zA-Z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				//alert("邮箱格式错误");
				show_validate_msg("#email_add_input", "error", "邮箱格式错误");
				return false;
			} else {
				show_validate_msg("#email_add_input", "success", "");
			}
			return true;
			;
		}
		function show_validate_msg(ele, status, msg) {
			//清除当前元素的校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			} else if ("error" == status) {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		$("#emp_update_btn").click(function(){
			//验证邮箱格式
			var email = $("#email_update_input").val();
			var regEmail = /^([a-zA-Z0-9_\.-]+)@([\da-zA-Z\.-]+)\.([a-zA-Z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				//alert("邮箱格式错误");
				show_validate_msg("#email_update_input", "error", "邮箱格式错误");
				return false;
			} else {
				show_validate_msg("#email_update_input", "success", "");
			}
			//发送ajax请求
			$.ajax({
				url : "${path}/emp/" +$(this).attr("emp_update_id"),
				type : "put",
				data : $("#empUpdateModal form").serialize(),
				success : function(result) {
					//关闭modal
					$("#empUpdateModal").modal("hide")
					//页面跳转
					to_page(currentPage);
				}
			});
		})
		$(document).on("click", ".edit_btn", function() {
			//获取员工信息
			//getEmp($(this).attr("emp_id"));
			//获取部门信息
			getDepts("#dept_update_name");
			getEmp($(this).attr("emp_id"));
			$("#emp_update_btn").attr("emp_update_id",$(this).attr("emp_id"));
			$("#empUpdateModal").modal({
				backdrop : "static"
			})
			
		})
		$(document).on("click", ".delete_btn", function() {
			var empName = $(this).parents("tr").find("td:eq(2)").text();
			var empId = $(this).attr("emp_id")
			if(confirm("确定删除 "+ empName +" 吗？")){
				$.ajax({
					url : "${path}/emp/" + empId,
					type : "delete",
					success : function(result){
						alert(result.msg);
						to_page(currentPage);
					}
				})
			}
		//alert($(this).parents("tr").find("td:eq(1)").text());			
		})
		$("#emp_add_modal_btn").click(function() {
			reset_form("#empAddModal form");
			//获取部门信息
			getDepts("#dept_add_name");
			$("#empAddModal").modal({
				backdrop : "static"
			})
		})
		//校验用户名是否可用
		$("#empName_add_input").change(function() {
			var empName = this.value;
			$.ajax({
				url : "${path}/checkuser",
				type : "post",
				data : "empName=" + empName,
				success : function(result) {
					if (result.code == 100) {
						show_validate_msg("#empName_add_input", "success", "用户名可用");
						$("#emp_save_btn").attr("ajax-va", "success");
					} else {
						show_validate_msg("#empName_add_input", "error", result.extend.va_msg);
						$("#emp_save_btn").attr("ajax-va", "error");
					}
				}
			});
		});
		$("#emp_save_btn").click(function() {
	
			if (!validate_add_form()) {
				return false;
			}
			;
	
			if ($(this).attr("ajax-va") == "error") {
				return false;
			}
			$.ajax({
				url : "${path}/emp",
				type : "post",
				data : $("#empAddModal form").serialize(),
				success : function(result) {
					if (result.code == 100) {
						//关闭modal
						$("#empAddModal").modal("hide")
						//页面跳到左后一页
						to_page(totalpage);
					} else {
						if (undefined != result.extend.errorFields.empName) {
							show_validate_msg("#empName_add_input", "error", result.extend.errorFields.empName)
						}
						if (undefined != result.extend.errorFields.email) {
							show_validate_msg("#email_add_input", "error", result.extend.errorFields.email)
						}
					}
				}
			});
		})
		
		$("#check_all").click(function(){
			$(".check_item").prop("checked",$(this).prop("checked"));
		})
		$(document).on("click",".check_item",function(){
			var flag = $(".check_item:checked").length == $(".check_item").length;
			$("#check_all").prop("checked",flag);
		})
		$("#emp_deleteall_btn").click(function(){
			var empNames = "";
			var del_ids = "";
			$.each($(".check_item:checked"),function(){
				empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
				del_ids += $(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			empNames = empNames.substring(0,empNames.length-1);
			del_ids = del_ids.substring(0,del_ids.length-1);
			if(!empNames == ""){
				if(confirm("确定删除 "+ empNames +" 吗？")){
					$.ajax({
						url : "${path}/emp/" + del_ids,
						type : "delete",
						success : function(result){
							alert(result.msg);
							to_page(currentPage);
						}
					})
				}
			}else{
				alert("请选择要删除的员工！");
			}
		})
	</script>
</body>
</html>
