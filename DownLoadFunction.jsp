<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
		String file = request.getParameter("file");
		response.setHeader("Content-Disposition","attachment;filename="+file);    
		response.setContentType("audio/mp3");
		RequestDispatcher rd = request.getRequestDispatcher("MusicFile/" + file);
		rd.forward(request, response);
 %>