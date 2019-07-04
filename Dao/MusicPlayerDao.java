package Dao;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.*;
import VO.Music;
import VO.User;

public class MusicPlayerDao{
	private  Connection conn = null;
	private String driverClassName = null;
	private	String SQLurl = null;
	private	String SQLusername = null;
	private	String SQLpassword = null;
	public MusicPlayerDao(String driverClassName,String SQLurl,String SQLusername,String SQLpassword){
		this.driverClassName = driverClassName;
		this.SQLurl = SQLurl;
		this.SQLusername = SQLusername;
		this.SQLpassword = SQLpassword;
	}
	
	public void initConnection() throws Exception{
  		Class.forName(driverClassName);
		conn = DriverManager.getConnection(SQLurl,SQLusername,SQLpassword);
		
	}
	public HashMap getMusicList() throws Exception{
		HashMap hm = new HashMap();
		this.initConnection();
		Statement state = conn.createStatement();
		String musicsql = "SELECT MUSICNO,MUSICNAME,MUSICPATH FROM MUSICPLAYERMUSIC";
		ResultSet musicrs = state.executeQuery(musicsql);
		while(musicrs.next()){
			Music music = new Music();
			music = new Music();
			music.setMusicno(musicrs.getInt("MUSICNO"));
			music.setMusicname(musicrs.getString("MUSICNAME"));
			music.setMusicpath(musicrs.getString("MUSICPATH"));
			hm.put(music.getMusicname(), music);
		}
		this.closeConnection();
		return hm;
	}
	
	public ArrayList<String> getMusicArray() throws Exception{
		ArrayList<String> musicarray = new ArrayList();
		this.initConnection();
		Statement state = conn.createStatement();
		String musicsql = "SELECT MUSICPATH FROM MUSICPLAYERMUSIC";
		ResultSet musicrs = state.executeQuery(musicsql);
		while(musicrs.next()){
			String musicpath = musicrs.getString("MUSICPATH");
			musicpath = musicpath.replace(" ", "");
			musicpath = musicpath.replace("%%", " ");
			if(!musicarray.contains(musicpath)){
				musicarray.add(musicpath);
			}
		}
		this.closeConnection();
		return musicarray;
	}
	
	public HashMap getUserList() throws Exception{
		HashMap hm = new HashMap();
		this.initConnection();
		Statement state = conn.createStatement();
		String usersql = "SELECT USERNAME FROM MUSICPLAYERUSER";
		ResultSet userrs = state.executeQuery(usersql);
		while(userrs.next()){
			User user = new User();
			user = new User();
			user.setUsername(userrs.getString("USERNAME"));
			hm.put(user.getUsername(), user);
		}
		this.closeConnection();
		return hm;
	}
	
	public void closeConnection() throws Exception{
		conn.close();
	}
}
