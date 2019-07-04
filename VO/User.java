package VO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class User {
	private String username;
	private String userpassword;
	public String getUsername(){
		return username;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	public String getUserpassword(){
		return userpassword;
	}
	
	public void setUserpassword(String userpassword){
		this.userpassword = userpassword;
	}
	
}
