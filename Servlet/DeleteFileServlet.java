package Servlet;

import java.io.File;
import java.io.IOException;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

public class DeleteFileServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext application = this.getServletContext();
		String UpLoadFile = request.getParameter("UpLoadFile");
		ArrayList UpLoadFileArray = (ArrayList)application.getAttribute("UpLoadFile");
		String filepath = getServletContext().getRealPath("/MusicFile")+"\\"+UpLoadFile;
		if(UpLoadFileArray!=null){
			UpLoadFileArray.remove(UpLoadFile);
		}
		File file = new File(filepath);
		if(file.exists()){
			file.delete();
		}
		response.sendRedirect("/MusicPlayer/ShowUploadFile.jsp");
	}
}
