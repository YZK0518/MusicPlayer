<%@ page language="java" import="java.sql.*" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "VO.Music"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="bootstrap.css">
	<script src="MusicPlayer.js"></script>
	<script src="HashMap.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
	<script type="text/javascript" src="index.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<style>
	.bg{
		/* background: url(ImageFile/image0.jpg) no-repeat; */
		background-size: cover;
		position: absolute;
		text-align:center;
		line-height: 10px;
	}
	.bg1{
		background-size: cover;
		position: relative;
		padding-top:5%;
		text-align:center;
		line-height: 10px;
	}
	
	.bg2{
		background-size: cover;
		position: relative;
		padding-bottom:20%;
		text-align:center;
		line-height: 10px;
	}
	
	.bg3{
		height:45%;
	}
	.demo{
		position:relative;
		margin-top: 35%;
		margin-left: 10%;
		margin-right: 60%;
		padding-left:10%;
		padding-right:10%;
		text-align: center;
	}
	
	.btn-w3r {
    	background: #cb60b3; /* Old browsers */
    	background: -moz-linear-gradient(top,  #cb60b3 0%, #ad1283 50%, #de47ac 100%); /* FF3.6+ */
    	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#cb60b3), color-stop(50%,#ad1283), color-stop(100%,#de47ac)); /*   Chrome,Safari4+ */
    	background: -webkit-linear-gradient(top,  #cb60b3 0%,#ad1283 50%,#de47ac 100%); /* Chrome10+,Safari5.1+ */
    	background: -o-linear-gradient(top,  #cb60b3 0%,#ad1283 50%,#de47ac 100%); /* Opera 11.10+ */
    	background: -ms-linear-gradient(top,  #cb60b3 0%,#ad1283 50%,#de47ac 100%); /* IE10+ */
    	background: linear-gradient(to bottom,  #cb60b3 0%,#ad1283 50%,#de47ac 100%); /* W3C */
    	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cb60b3', endColorstr='#de47ac',GradientType=0 ); /* IE6-9 */
    	width: 50px;
    	height: 50px;
    	-moz-border-radius: 50%;
    	-webkit-border-radius: 50%;
    	border-radius: 50%;
    }
    .btns {
    	width: 50px;
    	height: 50px;
    	-moz-border-radius: 50%;
    	-webkit-border-radius: 50%;
    	border-radius: 50%;
    	background:rgba(73,80，79,0.1);
    }
    .button{
	    background: url("ImageFile/lucency.png") no-repeat;
	    width: 50px;
	    height: 30px;
	    border: none;
    }
    input[name="points"] {
        -webkit-box-shadow: 0 1px 0 0px #424242, 0 1px 0 #060607 inset, 0px 2px 10px 0px black inset, 1px 0px 2px rgba(0, 0, 0, 0.4) inset, 0 0px 1px rgba(0, 0, 0, 0.6) inset;
        margin-top: 2px;
        background-color: #272728;
        border-radius: 15px;
        width: 400px;
        -webkit-appearance: none;
        height:10px;
    }
    input[name="points"]::-webkit-slider-thumb {
        -webkit-appearance: none;
        cursor: default;
        top: -5px;
        height: 30px;
        width: 20px;
        transform: translateY(-4px);
        background: none repeat scroll 0 0 #777;
        border-radius: 15px;
        -webkit-box-shadow: 0 -1px 1px black inset;
    }
	</style>
  </head>
  
  <body style="margin:0 auto;overflow:hidden;">
  	
  	
  	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<nav class="navbar navbar-default" role="navigation">
					<div class="navbar-header">
						 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">MusicPlayer</a>
					</div>
					
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li id="LiRegister">
								 <a href="#" onclick="Register()">注册</a>
							</li>
							<li id="LiLogin">
								 <a href="#" onclick="Login()">登陆</a>
							</li>
						</ul>
						<form class="navbar-form navbar-left" id="searchform">
							<div class="form-group">
								<input type="text" id="SearchText" name="SearchText" class="form-control" />
							</div>
							 <button type="button" class="btn btn-default" onclick="HandleSearchClick()">搜索</button>
						</form>
						<form class="navbar-form navbar-left" id="searchform">
							<div class="form-group">
								<input type="text" id="musictext" name="musictext" value="" class="form-control" disabled>
							</div>
						</form>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">上传下载<strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li>
										 <a href="#" onclick="UpLoad()">上传</a>
									</li>
									<li class="divider">
									</li>
									<li>
										 <a href="#" onclick="DownLoad()">下载</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-10 column bg3" id="resultDiv">
				<form class="form-horizontal" role="form">
					<jsp:include page="Default.jsp"/>
				</form>
			</div>
			<div class="col-md-2 column bg2">
				<div class="btn-group btn-group-vertical btn-group-lg">
					 <button class="btn btn-default" type="button" id="playlist" name="playlist" onclick="HandlePlayListClick()"><em class="glyphicon glyphicon-th-list"></em> 播放列表</button> 
					 <button class="btn btn-default" type="button" onclick="HandleSaveMusicListClick()"><em class="glyphicon glyphicon-save"></em> 收藏</button> 
					 <button class="btn btn-default" type="button" onclick="HandleShowLrcClick()"><em class="glyphicon glyphicon-tasks"></em> 歌词</button> 
					 <button class="btn btn-default" type="button" onclick="Comment()"><em class="glyphicon glyphicon-comment"></em> 评论</button>
				</div>
			</div>
		</div>
		<div class = "bg1">
			<form name = "musicform">
				<%
			  		HashMap threemusic = (HashMap)application.getAttribute("ThreeMusic");
			  		String formermusic=null;
					String presentmusic=null;
					String lattermusic=null;
			  		formermusic= "MusicFile/Epic%20Score-Freedom%20Is%20Ours.mp3";
					presentmusic= "MusicFile/Take%20me%20hand.mp3";
					lattermusic="MusicFile/Sara%20Farell%20-%20Faded.mp3";
			  		String musicsource = presentmusic;
			  		
			  	%>
				<input type="hidden" id="presentlist" name="presentlist" value=<%= "musiclist"%>>
		  		<input type="hidden" id="formermusic" name="formermusic" value=<%= formermusic %>>
		  		<input type="hidden" id="presentmusic" name="presentmusic" value=<%= presentmusic %>>
		  		<input type="hidden" id="lattermusic" name="lattermusic" value=<%= lattermusic %>>
		  		<input type="hidden" id="currenttime" name="currenttime" value=<%= 0 %>>
		  		<input type="hidden" id="duration" name="duration" value=<%= 0 %>>
		  		<table align="left" width="25%">
		  			<tr>
		  				<td align = "center">
		  					<audio src= <%= musicsource %> id="music" loop></audio>
					  		<button type="button" id="formerbutton" onclick="HandleFormerButtonClick()" 
					  		class="btns btn-w3r">
					  			<span class="glyphicon glyphicon-backward" id="former"></span>
					  		</button>
					  		<button type="button" id="playbutton" onclick="HandlePlayButtonClick()" 
					  		class="btns btn-w3r">
					  			<span class="glyphicon glyphicon-play" id="play"></span>
					  		</button>
					  		<button type="button" id="latterbutton" onclick="HandleLatterButtonClick()" 
					  		class="btns btn-w3r">
					  			<span class="glyphicon glyphicon-forward" id="latter"></span>
					  		</button>
		  				</td>
		  			</tr>
		  		</table>
		  		
		  		<table align="left" width="25%">
		  			<tr align="center">
		  				<td align = "left">
		  					<h4 id="starttime"></h4>
		  				</td>
		  				<td align = "left">
		  					<input type="range" id="points" name="points" min="0" max="100">
		  				</td>
		  				<td align = "left">
		  					<h4 id="endtime"></h4>
		  				</td>
		  			</tr>
		  		</table>
		  		
		  		<table align="left" width="30%">
		  			<tr align="right">
		  				<td align = "right">
		  					<span class="glyphicon glyphicon-volume-up" id="volumeup"></span>&nbsp
		  				</td>
		  				<td align = "left" width="100">
		  					<input type="range" id="volume" name="volume" min="0" max="20">&nbsp
		  				</td>
		  				<td align = "right">
		  					<button type="button" id="sequence" onclick="HandleSequenceClick()" 
					  		class="button">
					  			<span class="glyphicon glyphicon-repeat" id="sequenceicon"></span>
					  		</button>
		  				</td>
		  			</tr>
		  		</table>
		  	</form>
		</div>
	</div>
  </body>
</html>
