<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
	<h1>Hello World!</h1>

<table border="1">
	<tr>
		<td>ID</td>
		<td>Username</td>
		<td>Password</td>
		<td>Role</td>
		<td class="chChildren"><input type="checkbox" name="checkbox"
			value="1" class="styled" /></td>
		<td>
			<div class="controls center">
				<a href="#" title="Edit User" class="tip"><span
					class="icon12 icomoon-icon-pencil"></span></a> <a href="#"
					title="Remove User" class="tip"><span
					class="icon12 icomoon-icon-remove"></span></a>
			</div>
		</td>
	</tr>
	<tr>
	<%
		Class.forName("org.apache.hive.jdbc.HiveDriver");
		int count=0;
		Connection con = DriverManager.getConnection("jdbc:hive2://161.246.38.15:10000/dw", "parinya",
				"parinyabat");
		Statement stmt = con.createStatement();
		System.out.println(con);
		System.out.println(stmt);
		String sql = "select * from dw.staff_account";
		System.out.println("Running: " + sql);
		ResultSet res = stmt.executeQuery(sql);
		System.out.println(res);
		while (res.next()) {
			count=count+1;
			String username = res.getString(1);
		    String password = res.getString(2);
		    String role = res.getString(3);
		    request.setAttribute("count",count);
		    request.setAttribute("username",username);
		    request.setAttribute("password",password);
		    request.setAttribute("role",role);
	%>
	
	<tr >
		<td>${count}</td>
		<td>${username}</td>
		<td>${password}</td>
		<td>${role}</td>
		<td class="chChildren"><input type="checkbox" name="checkbox"
			value="1" class="styled" /></td>
		<td>
			<div class="controls center">
				<a href="#" title="Edit User" class="tip"><span
					class="icon12 icomoon-icon-pencil"></span></a> <a href="#"
					title="Remove User" class="tip"><span
					class="icon12 icomoon-icon-remove"></span></a>
			</div>
		</td>
	</tr>
	<tr>
	
		<%
			
			}
		%>
	</table>
</body>
</html>