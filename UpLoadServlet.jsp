<%@page import="java.util.*"%>
<%@ page language="java" import="com.jspsmart.upload.*" pageEncoding="utf-8"%>
<%
	SmartUpload smartUpload = new SmartUpload();
	//初始化	
	smartUpload.initialize(config, request, response);
	try {
		smartUpload.upload(); 
		File smartFile = smartUpload.getFiles().getFile(0);
		String FileN = smartFile.getFileName();
		String FileName=new String(FileN.getBytes(),"utf-8");
		smartFile.saveAs("/MusicFile/" + FileName,
				smartUpload.SAVE_VIRTUAL);
		String msg = FileName + "已经成功上传!";
		String MusicPath = "/MusicFile/"+FileName;
		ArrayList UpLoadFileArray = (ArrayList)application.getAttribute("UpLoadFile");
		if(UpLoadFileArray==null){
			UpLoadFileArray = new ArrayList();
			UpLoadFileArray.add(FileName);
		}
		else{
			UpLoadFileArray.add(smartFile.getFileName());
		}
		application.setAttribute("UpLoadFile", UpLoadFileArray);
		String filepath = getServletContext().getRealPath("/MusicFile")+"/"+smartFile.getFileName();
		//out.println(msg);
		//out.println(FileName);
		response.sendRedirect("ShowUploadFile.jsp");
	} 
	catch (SmartUploadException e) {
		e.printStackTrace();
	}
%>