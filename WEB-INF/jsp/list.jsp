<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<button class="btn btn-info">新增</button>
			<button class="btn btn-danger">删除</button>
		</div>
	</div>
	<!-- 表格 -->
	<div class="row">
		<div class="col-md-12">
			<table class="table table-hover">
				<tr>
					<th>id</th>
					<th>empName</th>
					<th>gender</th>
					<th>email</th>
					<th>department</th>
					<th>operating</th>
				</tr>
				<c:forEach items="${pageInfo.list}" var="emp">
				<tr>
					<th>${emp.empId }</th>
					<th>${emp.empName }</th>
					<th>${emp.gender=="m"?"男":"女" }</th>
					<th>${emp.email }</th>
					<th>${emp.department.deptName }</th>
					<th>
						<button class="btn btn-info btn-sm">
						 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							编辑
						</button>
						<button class="btn btn-danger btn-sm">
						 <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
							删除
						</button>
					</th>
				</tr>
				</c:forEach>
			</table>	
		</div>
	</div>
	<!-- 分页 -->
	<div class="row">
		<!-- 分页文字信息 -->
		<div class="col-md-6">
			当前第${pageInfo.pageNum }页，总页数：${pageInfo.pages }，总记录数：${pageInfo.total }
		</div>
		<!-- 分页条信息 -->
		<div class="col-md-6 col-md-offset-8">
			<nav aria-label="Page navigation">
			  <ul class="pagination">
			  	<li><a href="${path }/emps?pn=1">首页</a></li>
			  	<c:if test="${pageInfo.hasPreviousPage }">
				    <li>
				      <a href="${path }/emps?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
			    </c:if>
			    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
			    	<c:if test="${page_Num == pageInfo.pageNum }">
			    		<li class="active"><a href="#">${page_Num }</a></li>
			    	</c:if>
			    	<c:if test="${page_Num != pageInfo.pageNum }">
			    		<li ><a href="${path }/emps?pn=${page_Num }">${page_Num }</a></li>
			    	</c:if>
			    </c:forEach>
			    <c:if test="${pageInfo.hasNextPage }">
				    <li>
				      <a href="${path }/emps?pn=${pageInfo.pageNum+1 }" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
			    </c:if>
			    <li><a href="${path }/emps?pn=${pageInfo.pages}">末页</a></li>
			  </ul>
			</nav>
		</div>
	</div>
	</div>
</body>
</html>
