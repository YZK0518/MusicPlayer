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
import Dao.MusicPlayerDao;
import java.util.*;
import java.text.*;
import VO.Music;

public class SearchMusicServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = this.getServletContext();
		PrintWriter out = response.getWriter();
		String SearchText = (String)request.getParameter("SearchText");
		ArrayList searchmusicarray = (ArrayList)application.getAttribute("SearchMusicArray");
		ArrayList<String> musicarray = (ArrayList)application.getAttribute("MusicArray");
		searchmusicarray.clear();
		for(int i=0;i<musicarray.size();i++){
			String str = musicarray.get(i);
			int start = str.lastIndexOf("/");
			String strname = str.substring(start+1);
			if(strname.contains(SearchText)){
				searchmusicarray.add(str);
			}
		}
		application.setAttribute("SearchMusicArray", searchmusicarray);
		response.sendRedirect("/MusicPlayer/SearchMusicList.jsp");
	}
}
