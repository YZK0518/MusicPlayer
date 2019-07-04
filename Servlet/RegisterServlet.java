package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;

public class RegisterServlet extends HttpServlet{

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ServletContext application = this.getServletContext();
		Connection conn = null;
		String driverClassName = (String)application.getInitParameter("driverClassName");
  		String SQLurl = (String)application.getInitParameter("url");
  		String SQLusername = (String)application.getInitParameter("username");
  		String SQLpassword = (String)application.getInitParameter("password");
  		try{
  			Class.forName(driverClassName);
  			conn = DriverManager.getConnection(SQLurl, SQLusername, SQLpassword);
  			Statement state = conn.createStatement();
  	  		String name = request.getParameter("username");
  	  		String passwordset = request.getParameter("password");
  	  		String passwordreset = request.getParameter("passwordreset");
  	  		String url = "/Register.jsp";
  	  		if(passwordset.equals(passwordreset)&&!name.equals("")&&!passwordset.equals("")){
  	   			String sql = "INSERT INTO MUSICPLAYERUSER VALUES('"+name+"',pwdencrypt('"+passwordset+"'));";
  	   			state.executeUpdate(sql);
  	   			url="/Login.jsp";
  	   	 	}
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