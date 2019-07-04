<%@ page language="java" import="java.sql.*" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  	<meta charset="UTF-8">
	<meta name="viewport" id="view" content="width=device-width,initial-scale=0.85, minimum-scale=0.85, maximum-scale=1, user-scalable=no" /> 
	<link rel="stylesheet" href="bootstrap.css">
	<link rel="stylesheet" type="text/css" href="index.css">
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
	<script type="text/javascript" src="index.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
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
		margin:0;
	}
	.demo{
		position:relative;
		margin-top: 15%;
		margin-left: 30%;
		margin-right: 30%;
		padding-left:10%;
		padding-right:10%;
		text-align: center;
	}
	.button{
	    background: Alpha(14);
	    width: 50px;
	    height: 30px;
	    border: none;
    }
	</style>
  </head>
  
  <body style="margin:0 auto;overflow:hidden;">
  	<!-- <canvas id="canvas" class="canvas"></canvas> -->
    <form action="Servlet/InitServlet" method="get" class="bg navbar-form" style="overflow-x: auto;overflow-y: auto">
  		<!-- <audio src="MusicFile/LolitaVoice.mp3" autoplay></audio> -->
  		<div class="demo header">
  			<input type="submit" ID="submit" name="submits" value="开始体验" class="btn btn-link" style="font-size: 35px;color: yellow"></br></br></br>
  		</div></br>
  	 </form>
  </body>
</html>
