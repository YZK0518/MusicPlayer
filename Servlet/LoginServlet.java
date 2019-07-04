package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;

public class LoginServlet extends HttpServlet{

	public String names = null;
	public String getname(){
		return names;
	}
//	public Cookies
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ServletContext application = this.getServletContext();
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		Connection conn = null;
		String driverClassName = (String)application.getInitParameter("driverClassName");
  		String SQLurl = (String)application.getInitParameter("url");
  		String SQLusername = (String)application.getInitParameter("username");
  		String SQLpassword = (String)application.getInitParameter("password");
  		try{
  			Class.forName(driverClassName);
  			conn = DriverManager.getConnection(SQLurl, SQLusername, SQLpassword);
  			Statement state = conn.createStatement();
  			String username = request.getParameter("username");
  			names = username;
  	  		String userpassword = request.getParameter("password");
  	  		String[] checkboxs = request.getParameterValues("checkbox");
  	  		session.setAttribute("username", username);
  	  		String url = "/Register.jsp";
  	  		/*使用Cookie存储用户名和密码，并设置失效时间  */
  	  		if(checkboxs!=null&&checkboxs[0].equals("remember")){
  	  			Cookie namecookie = new Cookie("username",username);
  	  			Cookie passwordcookie = new Cookie("userpassword",userpassword);
  	  			namecookie.setPath("/");
  	  			passwordcookie.setPath("/");
  	  			namecookie.setMaxAge(200);
  	  			passwordcookie.setMaxAge(200);
  	  			response.addCookie(namecookie);
  	  			response.addCookie(passwordcookie);
  	  		}
	  	  	String code = request.getParameter("code");
			String randStr = (String)session.getAttribute("randStr");
  	  		String name = "";
  	  		boolean flag = false;
  	  		String sql = "SELECT * FROM MUSICPLAYERUSER WHERE pwdcompare('"+userpassword+"', USERPASSWORD)=1";
  	  		ResultSet rset = state.executeQuery(sql);
  	  		while(rset.next()){
  	  			name = rset.getString("USERNAME");
  	  		}
  	  		name = name.replace(" ", "");
  	  		if(username.equals("")||userpassword.equals("")){
  	  			url = "/Login.jsp";
  	  		}
  	  		else if(!code.equals(randStr)){
  	  			url = "/Login.jsp";
  	  		}
  	  		else if(username.equals(name)){
  	  			/*将在线的用户名存入ArrayList中，并加入到application对象中，使得对整个服务器可见  */
  	  			ArrayList<String> names = (ArrayList)application.getAttribute("names");
  	  			if(names == null){
  	    			names = new ArrayList();
  	    			names.add(username);
  	  				application.setAttribute("names", names);
  	    		}
  	    		else if(!names.contains(username)){
  	    			names.add(username);
  	  				application.setAttribute("names", names);
  	    		}
  	  			session.setAttribute("username", username);
  	  			url = "/MusicList.jsp";
  	  	 	}
  	  	 	else{
  	  	 		url = "/Login.jsp";
  	  	 	}
//  	  		out.print(randStr);
//  	  		out.print(code);
  	  		RequestDispatcher rd = application.getRequestDispatcher(url);
	   	 	rd.forward(request, response);
  	  	 	state.close();
  	  		conn.close();
  		}
  		catch(Exception e)
  		{
  			e.printStackTrace();
  		}
	}
}