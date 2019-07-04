package Servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.MusicPlayerDao;
import java.util.*;

public class InitServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = this.getServletContext();
		HttpSession session = request.getSession();
		String username = "";
		String driverClassName = (String)application.getInitParameter("driverClassName");
  		String SQLurl = (String)application.getInitParameter("url");
  		String SQLusername = (String)application.getInitParameter("username");
  		String SQLpassword = (String)application.getInitParameter("password");
		MusicPlayerDao musicplayerdao = new MusicPlayerDao(driverClassName,SQLurl,SQLusername,SQLpassword);
		HashMap musiclist = null;
		LinkedHashMap SaveMusicList = null;
		ArrayList<String> musicarray = null;
		ArrayList searchmusicarray = null;
		ArrayList ShowLrcArray = null;
		HashMap userlist = null;
		try{
			musiclist = musicplayerdao.getMusicList();
			userlist = musicplayerdao.getUserList();
			musicarray = musicplayerdao.getMusicArray();
			searchmusicarray = new ArrayList();
			ShowLrcArray = new ArrayList();
			SaveMusicList = new LinkedHashMap();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		session.setAttribute("username", username);
		application.setAttribute("MusicList", musiclist);
		application.setAttribute("UserList", userlist);
		application.setAttribute("MusicArray", musicarray);
		application.setAttribute("SearchMusicArray", searchmusicarray);
		application.setAttribute("ShowLrcArray", ShowLrcArray);
		application.setAttribute("SaveMusicList", SaveMusicList);
		response.sendRedirect("/MusicPlayer/index.jsp");
	}

}
