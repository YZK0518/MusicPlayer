package VO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Music {
	private int musicno;
	private String musicname;
	private String musicpath;
	
	public int getMusicno(){
		return musicno;
	}
	
	public void setMusicno(int musicno){
		this.musicno = musicno;
	}
	
	public String getMusicname(){
		return musicname;
	}
	
	public void setMusicname(String musicname){
		this.musicname = musicname;
	}
	
	public String getMusicpath(){
		return musicpath;
	}
	
	public void setMusicpath(String musicpath){
		this.musicpath = musicpath;
	}
	
}
