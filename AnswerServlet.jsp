<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  
  <body>
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
  		String mysql = "SELECT * FROM PERSON";
  		ResultSet rset = stat.executeQuery(mysql);
  		String name = (String)session.getAttribute("username");
  		String email = "1479236364@qq.com";
  		String content = request.getParameter("content");
  		String IDstr = "180339";
  		String str = request.getParameter("rownumber");
  		int count = Integer.parseInt(str);
  		int ID = Integer.parseInt(IDstr);
  		int rownumber=0;
//  		int linknumber=0;
		int linknumber=count;
  		String time="";
  		String message="";
  		String sql="";
  		while(rset.next()){
  			rownumber = rset.getRow();
  		}
  		rownumber++;
  		if(name!=""&&email!=""&&content!="")
  			sql = "INSERT INTO PERSON VALUES('"+rownumber+"','"+linknumber+"','"+ID+"','"+name+"','"+email+"','"+content+"',GETDATE())";
  		int i = stat.executeUpdate(sql);
  		if(i==-1){
  	 %>
  		<jsp:forward page="Comment.jsp"></jsp:forward>
  	 <%
  		}
  		else{
  	  %>
  	 	 <jsp:forward page="Comment.jsp"></jsp:forward>
  	  <%
  		}
  	   %>
  	 <%
  	 	stat.close();
  		conn.close();
  	  %>
  </body>
</html>
