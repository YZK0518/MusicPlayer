<%@ page language="java" import="java.sql.*" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="bootstrap.css">
	<style>
	.bg{
		background: url(ImageFile/image2.jpg) no-repeat;
		background-size: cover;
		width: 100%;
		height: 100%;
		position: absolute;
		text-align:center;
		line-height: 10px;
		font-family: "仿宋";
	}
	.demo{
		position:relative;
		margin-top: 10%;
		margin-left: 25%;
		margin-right: 25%;
		padding-left:10%;
		padding-right:10%;
		text-align: center;
		border-radius: 10px;
    	border:1px solid #333;
    	box-shadow:inset 0 0 5px 5px #ccccff;
	}
	</style>
  </head>
  
  <body>
  	<%
		String username = "";
		String userpassword = "";
		Cookie[] cookies = request.getCookies();
		for(int i=0;i<cookies.length;i++){
			if(cookies[i].getName().equals("username")){
				username = cookies[i].getValue();
			}
			else if(cookies[i].getName().equals("userpassword")){
				userpassword = cookies[i].getValue();
			}
		}
  	 %>
    <form method="post" class="bg navbar-form" style="overflow-x: auto;overflow-y: auto">
  		<div class="demo">
  			<table width="100%" align="center">
  				<tr><td>&nbsp</td></tr>
  	  			<tr align="center">
  	  				<td align="right">用户名：</td>
  	  				<td align="left"><input type="text" ID="username" name="username" class="form-control" value="<%= username %>"></td>
  	  			</tr>
  	  			<tr align="center"><td align="right" ID="usernames">&nbsp</td></tr>
  	  			
  	  			<tr align="center">
  					<td align="right">密码：</td>
  					<td align="left"><input type="password" ID="password" name="password" class="form-control" value="<%= userpassword %>"></td>
  	  			</tr>
  	  			<tr align="center"><td align="right" ID="passwordset">&nbsp</td></tr>
  	  			
  	  			<tr align="center">
  					<td align="right">验证码：</td>
  					<td align="left"><input type="text" ID="code" name="code" class="form-control"></br>
  					<img name="imgValidate" src="validate.jsp">
  					<a href="#" onclick="Login()"></a></td>
  	  			</tr>
  	  			<tr align="center"><td align="right" ID="codes">&nbsp</td></tr>
  	  			
  	  			<tr align="center">
  					<td align="right"><input type="checkbox" ID="checkbox" name="checkbox" class="form-control"></td>
  					<td align="left">记住用户名</td>
  	  			</tr>
  	  			<tr align="center"><td align="right" ID="passwordresetting">&nbsp</td></tr>
  	  		</table>
  			<input type="button" ID="LoginSubmit" name="LoginSubmit" value="登陆" class="btn btn-default" onclick="HandleLoginSubmitClick()"></br></br></br>
  		</div></br>
  	 </form>
  </body>
</html>
