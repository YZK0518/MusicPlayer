<%@ page language="java" import="java.sql.*" import="java.util.*" import="java.text.*" pageEncoding="UTF-8"%>
<%@ page import = "VO.Music"%>
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
		      	<th>音乐标题</th>
		      	<th>喜欢</th>
		  </thead>
		  <%
		  	ArrayList<String> musicarray = (ArrayList)application.getAttribute("MusicArray");
	  		int presentnumber = 1;
	  		String musicpath = null;
	  		String musicname = null;
	  	  %>
		  <tbody>
			<%
				for(;presentnumber<musicarray.size()+1;presentnumber++){
					musicpath = (String)musicarray.get(presentnumber-1);
					int start = musicpath.lastIndexOf("/");
					musicname = musicpath.substring(start+1);
			%>
		    <tr>
		    	<td width="10%"><%=  presentnumber%></td>
		      	<td width="70%"><a href="#" onclick="HandleMusicListPlayClick('<%= "MusicArray"%>','<%= musicpath%>')"  id="musiclistmusic"><%=  musicname%></a></td>
		      	<td><a href="#" onclick="Save('<%= musicpath%>')"><em id="SaveMusicButton" name="SaveMusicButton" class="glyphicon glyphicon-star-empty"></a></td>
		    </tr>
			<%
				}
		  	%>
		  	</tbody>
		</table>
  	 </form>
  </body>
</html>
