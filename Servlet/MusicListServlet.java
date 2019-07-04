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

public class MusicListServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = this.getServletContext();
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String musicpath = (String)request.getParameter("musicpath");
		String listtype = (String)request.getParameter("listtype");
		ArrayList<String> musicarray = null;
		if(listtype.equals("SaveMusicArray")){
			LinkedHashMap SaveMusicList = (LinkedHashMap)application.getAttribute("SaveMusicList");
			String username = (String)session.getAttribute("username");
			musicarray = (ArrayList)SaveMusicList.get(username);
		}
		else{
			musicarray = (ArrayList)application.getAttribute(listtype);
		}
		int presentnumber = musicarray.indexOf(musicpath);
		int previousnumber = presentnumber-1;
		int nextnumber = presentnumber+1;
		String previousaudio = null;
		String nextaudio = null;
		if(previousnumber>=0&&previousnumber<musicarray.size()){
			previousaudio = (String)musicarray.get(previousnumber);
			out.print(previousaudio);
		}
		out.print("%%");
		if(nextnumber>=0&&nextnumber<musicarray.size()){
			nextaudio = (String)musicarray.get(nextnumber);
			out.print(nextaudio);
		}
	}
}
