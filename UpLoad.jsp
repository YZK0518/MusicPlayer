<%@ page language="java" pageEncoding="utf-8"%>
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
			margin-left: 20%;
			margin-right: 20%;
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
		<form action="UpLoadServlet.jsp" method="post" class="bg navbar-form" 
		style="overflow-x: auto;overflow-y: auto" enctype="multipart/form-data">
			<div class="demo">
				<table class="table">
					<h3>请选择一个文件进行上传：</h3>
					<tbody>
					<tr align="center">
						<td><input type="file" name="myFile"></td>
					</tr>
					<tr align="center">
						<td><input type="submit" value="上传" class="btn btn-default"></td>
					</tr>
				  	</tbody>
				</table>
			</div>
		</form>
	</body>
</html>
