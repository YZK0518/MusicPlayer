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
	.demo1{
		margin-left: 2%;
		margin-right:2%;
		margin-bottom:2%;
		text-align: center;
		background: rgba(10,100,10,0.2);
	}
	.demo2{
		position:relative;
		margin-left: 15%;
		margin-right: 15%;
		text-align: center;
		border-radius: 10px;
    	border:1px solid #333;
    	box-shadow:inset 0 0 5px 5px #ccccff;
	}
	.demo3{
		margin-left: 1%;
		margin-right:1%;
		margin-bottom:1%;
		text-align: center;
	}
	.demo4{
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
  	<form method="post" class="bg navbar-form" style="overflow-x: auto;overflow-y: auto">
  		<div class="demo4">
  			<table width="100%" align="center">
  				<tr><td>&nbsp</td></tr>
  	  			<tr><td>&nbsp</td></tr>
  	  			<tr>
  					<td align="right">内容：</td>
  					<td align="left"><textarea id="CommentContent" name="CommentContent" rows="5" cols="30" class="form-control"></textarea></td>
  	  			</tr>
  	  			<tr><td>&nbsp</td></tr>
  	  		</table>
  			<input type="button" id="CommentSubmit" name="CommentSubmit" value="提交" class="btn btn-default" onclick="HandleCommentClick()"></br></br></br>
  		</div></br>
  		<%
  		String driverName="XSN";
  		String dbURL="jdbc:sqlserver://localhost:1433;DatabaseName=XSN";
  		String userName="sa";
  		String userPwd="180339";
  		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
  		Connection conn = DriverManager.getConnection(dbURL,userName,userPwd);
  		Statement stat = conn.createStatement();
  		String name = request.getParameter("name");
  		String content = request.getParameter("content");
  		String time="";
  		String count="";
  		String sname="";
  		String[] date = new String[20];
  		int rownumber=0;
  		int linknumber=0;
  		int ID=0;
  		String names = "";
  		String contents = "";
  		String times="";
  		int rownumbers=0;
  		int linknumbers=0;
  		int IDs=0;
  		String sql = "SELECT * FROM PERSON ORDER BY STIME DESC";
  		ResultSet rs = stat.executeQuery(sql);
  	 	%>
  	 	<%
  	 	while(rs.next()){
  	 		count = rs.getString("ROWNUMBER");
  	 		rownumber = Integer.parseInt(count);
  	 		count = rs.getString("LINKNUMBER");
  	 		linknumber = Integer.parseInt(count);
  	 		count = rs.getString("ID");
  	 		ID = Integer.parseInt(count);
  	 		name = rs.getString("SNAME");
  			content = rs.getString("CONTENT");
  			time = rs.getString("STIME").toString();
  			time = time.substring(0, 19);
  			if(linknumber==0){
  	  	%>
  	  			<div class="demo2">
  	  				<div class="demo3">
  	  					<table width="100%" bgcolor="#999999">
  	  						<tr>
  	  							<td align="left"><h4><font color="#5555ff" size="3px"><%= name %></font></h4></td>
  	  							<td align="right"><h4><font size="3px"><%= time %></font></h4></td>
  	  						</tr>
  	  					</table>
  	  					<h4 align="left"><font size="3px">
  	  						<a href = "Answer.jsp?rownumber=<%= rownumber %>">留言内容：</a><%= content %></font>
  	  					</h4></br>
  	  				</div>
  	  			<% 
  	  				Statement state = conn.createStatement();
  	  				String mysql = "SELECT * FROM PERSON WHERE LINKNUMBER = '"+rownumber+"' ORDER BY STIME DESC";
  					ResultSet rset = state.executeQuery(mysql);
  					while(rset.next()){
  						count = rset.getString("ROWNUMBER");
  	 					rownumber = Integer.parseInt(count);
  	 					count = rset.getString("LINKNUMBER");
  	 					linknumber = Integer.parseInt(count);
  	 					count = rset.getString("ID");
  	 					ID = Integer.parseInt(count);
  	 					sname = rset.getString("SNAME");
  						content = rset.getString("CONTENT");
  						time = rset.getString("STIME").toString();
  						time = time.substring(0, 19);
  	  			%>
  	  					<div class="demo1">
  	  						<table width="100%">
  	  							<tr>
  	  								<td align="left"><h4><font color="#5555ff" size="3px"><%= sname %></font></h4></td>
  	  								<td align="right"><h4><font size="3px"><%= time %></font></h4></td>
  	  							</tr>
  	  						</table>
  	  						<h4 align="left"><font size="3px">
  	  							<a href = "Answer.jsp?rownumber=<%= rownumber %>">回复</a><font color="#5555ff"><%= name %></font>：<%= content %></font>
  	  						</h4></br>
  	  					</div>
  	  			<%
  	  					Statement states = conn.createStatement();
  	  					String mysqls = "SELECT * FROM PERSON WHERE LINKNUMBER = '"+rownumber+"' ORDER BY STIME DESC";
  						ResultSet rsets = states.executeQuery(mysqls);
  						while(rsets.next()){
  							count = rsets.getString("ROWNUMBER");
  	 						rownumbers = Integer.parseInt(count);
  	 						count = rsets.getString("LINKNUMBER");
  	 						linknumbers = Integer.parseInt(count);
  	 						count = rsets.getString("ID");
  	 						IDs = Integer.parseInt(count);
  	 						names = rsets.getString("SNAME");
  							contents = rsets.getString("CONTENT");
  							times = rsets.getString("STIME").toString();
  							times = times.substring(0, 19);
  					%>
  	  						<div class="demo1">
  	  							<table width="100%">
  	  								<tr>
  	  									<td align="left"><h4><font color="#5555ff" size="3px"><%= names %></font></h4></td>
  	  									<td align="right"><h4><font size="3px"><%= times %></font></h4></td>
  	  								</tr>
  	  							</table>
  	  							<h4 align="left"><font size="3px">
  	  								<a href = "Answer.jsp?rownumber=<%= rownumbers %>">回复</a><font color="#5555ff"><%= sname %></font>：<%= contents %></font>
  	  							</h4></br>
  	  						</div>
  	  			<%
  	  					}
  	  				}
  	  			%>
  	  			</div><hr>
  	 	<%
  	 		}
  	 	}
  	  	%>
  	</form>
  	 	<%
  	 	stat.close();
  		conn.close();
  	  	%>
  </body>
</html>
