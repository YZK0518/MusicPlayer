<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
	<body>
		<%
			String filename = request.getParameter("file");
			int start = filename.lastIndexOf("/");
			String file = filename.replace("%20", " ").substring(start+1);
		%>
		<a href="DownLoadFunction.jsp?file=<%= file%>">下载<%= file %></a>
	</body>
</html>
