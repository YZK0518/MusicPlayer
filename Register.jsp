<%@ page language="java" import="java.sql.*" import="java.text.*" pageEncoding="UTF-8"%>
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
    <form method="post" class="bg navbar-form" style="overflow-x: auto;overflow-y: auto">
  		<div class="demo">
  			<table width="100%" align="center">
  				<tr><td>&nbsp</td></tr>
  	  			<tr align="center">
  	  				<td align="right">用户名：</td>
  	  				<td align="left"><input type="text" ID="username" name="username" class="form-control"></td>
  	  			</tr>
  	  			<tr align="center"><td align="right" ID="usernames">&nbsp</td></tr>
  	  			
  	  			<tr align="center">
  					<td align="right">设置密码：</td>
  					<td align="left"><input type="password" ID="password" name="password" class="form-control"></td>
  	  			</tr>
  	  			<tr align="center"><td align="right" ID="passwordset">&nbsp</td></tr>
  	  			
  	  			<tr align="center">
  					<td align="right">确认密码：</td>
  					<td align="left"><input type="password" ID="passwordreset" name="passwordreset" class="form-control"></td>
  	  			</tr>
  	  			<tr align="center"><td align="right" ID="passwordresetting">&nbsp</td></tr>
  	  		</table>
  	  		<input type="button" ID="ResetButton" name="ResetButton" value="重置" class="btn btn-default" onclick="ResetButtonClick()">
  			<input type="button" ID="RegisterSubmit" name="RegisterSubmit" value="提交" class="btn btn-default"  onclick="HandleRegisterSubmitClick()"></br></br></br>
  		</div></br>
	<%
  	 %>
  	 </form>
  </body>
</html>
