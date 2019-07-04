<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title></title>
	<link rel="stylesheet" href="bootstrap.css">
	<script src="MusicPlayer.js"></script>
	<style>
	.bg{
		background: url(tobiichi.jpg) no-repeat;
		background-size: cover;
		width: 100%;
		height: 100%;
		position: absolute;
		text-align:center;
		line-height: 10px;
		font-family: "仿宋";
	}
	.demo2{
		position:relative;
		margin-left: 15%;
		margin-right: 15%;
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
    <form action="AnswerServlet.jsp" method="post" class="bg navbar-form" style="overflow-x: auto;overflow-y: auto">
  		<%
	  		String str = request.getParameter("rownumber");
	  		int rownumber = Integer.parseInt(str);
	  	 %>
  		<div class="demo2">
  			<table width="100%" align="center">
  				<tr><td>&nbsp</td></tr>
  	  			<tr><td>&nbsp</td></tr>
  	  			<tr align="center">
  					<td align="right">内容：</td>
  					<td align="left"><textarea name="content" rows="5" cols="30" class="form-control"></textarea></td>
  	  			</tr>
  	  			<tr><td>&nbsp</td></tr>
  	  		</table>
  	  		<input type="hidden" value=<%= rownumber %> name="rownumber">
  			<input type="submit" name="submit" value="提交" class="btn btn-default"></br></br></br>
  		</div></br>
  	</form>
  </body>
</html>
