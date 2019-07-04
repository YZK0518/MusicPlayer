package Servlet;

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

public class ShowLrcServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = this.getServletContext();
		PrintWriter out = response.getWriter();
		String musicpath = (String)request.getParameter("MusicPath");
		String musicpathhead = "D:/Workspaces/MyEclipse 2017 CI/MusicPlayer/WebRoot/MusicFile/";
		String lrcstr = "";
		ArrayList<String> musicarray = (ArrayList)application.getAttribute("MusicArray");
		ArrayList<String> ShowLrcArray = (ArrayList)application.getAttribute("ShowLrcArray");
		lrcstr = musicpath.replace("mp3", "lrc");
		int start = lrcstr.lastIndexOf("/");
		lrcstr = lrcstr.substring(start+1);
		lrcstr = musicpathhead + lrcstr;
		ShowLrcArray.clear();
		try{
			File file = new File(lrcstr);
//			Reader reader = new FileReader(file);
//			char [] b = new char [1024];
//            int len = 0;
//            while((len = reader.read(b))!=-1){
//                String str = new String(b,0,len);
//                ShowLrcArray.add(str);
//                out.print(str);
//            }
//			FileInputStream fis = new FileInputStream(file);
//			InputStreamReader isr = new InputStreamReader(fis,"UTF-8");
			FileReader fr = new FileReader(file);
			BufferedReader br = new BufferedReader(fr);
			String str = "";
			while ((str = br.readLine()) != null) {
//				str=new String(str.getBytes(),"utf-8");
				ShowLrcArray.add(str);
//				out.print(str);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		response.sendRedirect("/MusicPlayer/ShowLrc.jsp");
	}
}
