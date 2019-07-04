package Servlet;

import java.io.IOException;
import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Dao.MusicPlayerDao;
import java.util.*;
import java.text.*;
import VO.Music;

public class SaveServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = this.getServletContext();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("username");
		String musicpath = (String)request.getParameter("musicpath");
		LinkedHashMap SaveMusicList = (LinkedHashMap)application.getAttribute("SaveMusicList");
		ArrayList SaveMusicArray = null;
		if(username==""){
			response.sendRedirect("/MusicPlayer/Default.jsp");
		}
		else{
			if(SaveMusicList.containsKey(username)){
				SaveMusicArray = (ArrayList)SaveMusicList.get(username);
			}
			else{
				SaveMusicArray = new ArrayList();
			}
			if(SaveMusicArray.contains(musicpath)){
				SaveMusicArray.remove(musicpath);
			}
			SaveMusicArray.add(musicpath);
			SaveMusicList.put(username, SaveMusicArray);
			application.setAttribute("SaveMusicList", SaveMusicList);
			out.print(true);
		}
//		out.print(username);
	}
}
