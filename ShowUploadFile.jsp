<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="bootstrap.css">
	<script src="MusicPlayer.js"></script>
	<script src="HashMap.js"></script>
	<style>
	.bg{
		background: url(ImageFile/image0.jpg) no-repeat;
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
	a:link { 
		font-size: 16px; 
		color: #000000; 
		text-decoration: none; 
	} 
	a:visited { 
		font-size: 16px; 
		color: #000000; 
		text-decoration: none; 
	} 
	a:hover { 
		font-size: 16px; 
		color: #999999; 
		text-decoration:none; 
	}
	</style>
  </head>
  
  <body>
    <form name="musiclistform" method="post" class="bg navbar-form" style="overflow-x: auto;overflow-y: auto">
    	<table class="table table-condensed table-hover">
		  <thead>
		    <tr>
		    	<th></th>
		      	<th>文件名称</th>
		      	<th>操作</th>
		  </thead>
		  <tbody>
			<%
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
		  		String driverName="XSN";
		  		String dbURL="jdbc:sqlserver://localhost:1433;DatabaseName=XSN";
		  		String userName="sa";
		  		String userPwd="180339";
		  		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		  		Connection conn = DriverManager.getConnection(dbURL,userName,userPwd);
		  		Statement stat = conn.createStatement();
		  		String mysql = "SELECT * FROM MUSICPLAYERMUSIC";
		  		ResultSet rset = stat.executeQuery(mysql);
		  		String sql="";
		  		int rownumber=0;
		  		while(rset.next()){
		  			rownumber = rset.getRow();
		  		}
		  		rownumber++;
		  		
				ArrayList UpLoadFileArray = (ArrayList)application.getAttribute("UpLoadFile");
				if(UpLoadFileArray!=null){
					for(int i=0;i<UpLoadFileArray.size();i++){
						String UpLoadFile = (String)UpLoadFileArray.get(i);
						if(UpLoadFile.contains(".mp3")){
							String MusicPath = "MusicFile/"+UpLoadFile;
					  		MusicPath = MusicPath.replace(" ", "%%");
					  		int start = MusicPath.lastIndexOf("/");
					  		String MusicName = MusicPath.substring(start+1);
					  		sql = "INSERT INTO MUSICPLAYERMUSIC VALUES('"+rownumber+"','"+MusicName+"','"+MusicPath+"')";
			  				stat.executeUpdate(sql);
			  				stat.close();
	  						conn.close();
						}
			%>
			<tr>
				<td></td>
				<td><%= UpLoadFile%></td>
				<td><a href="/MusicPlayer/Servlet/DeleteFileServlet?UpLoadFile=<%= UpLoadFile%>">删除</a></td>
			</tr>
			<%
					}
				}
			%>
		  	</tbody>
		</table>
  	 </form>
  </body>
</html>
