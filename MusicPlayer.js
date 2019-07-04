var currentTime = 0.;
var duration = 0;
var current = 0;
var dura = 0;

function HandlePlayButtonClick(){
	var play = document.getElementById("play");
	var music = document.getElementById("music");
	if(play.getAttribute("class")=="glyphicon glyphicon-pause"){
		currentTime = musicform.currenttime.value;
		duration = musicform.duration.value;
		music.pause();
		play.setAttribute("class", "glyphicon glyphicon-play");
	}
	else if(play.getAttribute("class")=="glyphicon glyphicon-play"){
		music.currentTime = currentTime;
		music.play();
		play.setAttribute("class", "glyphicon glyphicon-pause");
	}
}
function HandleFormerButtonClick(){
	var button = document.getElementById("formerbutton");
	var music = document.getElementById("music");
	var formermusic = musicform.formermusic.value;
	var play = document.getElementById("play");
	var xmlHttp = new XMLHttpRequest();
	var listtype = musicform.presentlist.value;
	var url = "Servlet/MusicListServlet?listtype="+listtype+"&musicpath="+formermusic;
	var xmltext = 0;
	var preend = 0;
	var nextend = "";
	var pre = "";
	var next = "";
	musicform.presentmusic.value = formermusic;
	music.src = formermusic;
	play.setAttribute("class", "glyphicon glyphicon-pause");
	music.play();
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4){
			xmltext = xmlHttp.responseText;
			preend = xmltext.indexOf("%%");
			nextend = xmltext.length;
			pre = xmltext.substr(0, preend);
			next = xmltext.substr(preend+2, nextend);
			musicform.formermusic.value = pre;
			musicform.lattermusic.value = next;
			alert(pre+" "+next);
		}
		else{
			//resultDiv.innerHTML += "正在登陆...";
		}
	}
	xmlHttp.send();
}
function HandleLatterButtonClick(){
	var button = document.getElementById("latterbutton");
	var music = document.getElementById("music");
	var lattermusic = musicform.lattermusic.value;
	var playbutton = document.getElementById("playbutton");
	var xmlHttp = new XMLHttpRequest();
	var listtype = musicform.presentlist.value;
	var url = "Servlet/MusicListServlet?listtype="+listtype+"&musicpath="+lattermusic;
	var xmltext = 0;
	var preend = 0;
	var nextend = "";
	var pre = "";
	var next = "";
	musicform.presentmusic.value = lattermusic;
	music.src = lattermusic;
	play.setAttribute("class", "glyphicon glyphicon-pause");
	music.play();
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4){
			xmltext = xmlHttp.responseText;
			preend = xmltext.indexOf("%%");
			nextend = xmltext.length;
			pre = xmltext.substr(0, preend);
			next = xmltext.substr(preend+2, nextend);
			musicform.formermusic.value = pre;
			musicform.lattermusic.value = next;
			alert(pre+" "+next);
		}
		else{
			//resultDiv.innerHTML += "正在登陆...";
		}
	}
	xmlHttp.send();
}
function HandleSequenceClick(){
	var sequence = document.getElementById("sequenceicon");
	var music = document.getElementById("music");
	if(sequence.getAttribute("class")=="glyphicon glyphicon-arrow-right"){
		music.loop = true;
		sequence.setAttribute("class","glyphicon glyphicon-repeat");
	}
	else{
		music.loop = false;
		sequence.setAttribute("class","glyphicon glyphicon-arrow-right");
	}
}

function VolumeChange(){
	var volume = document.getElementById("volume");
	var volumeup = document.getElementById("volumeup");
	var music = document.getElementById("music");
	music.volume = volume.value/volume.max;
	if(volume.value==0){
		volumeup.setAttribute("class", "glyphicon glyphicon-volume-off");
	}
	else if(volume.value<10&&volume.value>0){
		volumeup.setAttribute("class", "glyphicon glyphicon-volume-down");
	}
	else if(volume.value>=10){
		volumeup.setAttribute("class", "glyphicon glyphicon-volume-up");
	}
	window.setTimeout("VolumeChange()","1");
}

function RangeChange(){
	var points = document.getElementById("points");
	var music = document.getElementById("music");
	var p1 = document.getElementById("starttime");
	var p2 = document.getElementById("endtime");
	current = musicform.currenttime.value;
	dura = musicform.duration.value;
	if(music.paused){
		current = currentTime;
		dura = duration;
	}
	p1.innerHTML = timestampToTime(current);
	p2.innerHTML = timestampToTime(dura);
	points.value = current*100/dura;
	points.defaultValue = current*100/dura;
	window.setTimeout("RangeChange()","1");
}

function timestampToTime(timestamp) {
    var date = new Date(timestamp * 1000);
    var Y = date.getFullYear() + '-';
    var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
    var D = date.getDate() + ' ';
    var h = date.getHours() + ':';
    var m = date.getMinutes() + ':';
    var s = date.getSeconds();
    if(s<10){
    	s="0"+s;
    }
    return m+s;
}

function MusicChange(){
	var points = document.getElementById("points");
	var music = document.getElementById("music");
	var musictext = document.getElementById("musictext");
	var presentmusictext = "";
	var time = current;
	var changetime = (points.value*dura/100);
	presentmusictext = music.src;
	var start = presentmusictext.lastIndexOf("/");
	presentmusictext = presentmusictext.substring(start+1);
	while(presentmusictext.includes("%20")){
		presentmusictext = presentmusictext.replace("%20", " ");
	}
	musictext.value = presentmusictext;
	if(time-changetime>2||changetime-time>2){
		music.currentTime = (points.value*dura/100);
	}
	window.setTimeout("MusicChange()","1");
}

function MusicEnd(){
	var play = document.getElementById("play");
	var music = document.getElementById("music");
	if(music.ended==true){
		play.setAttribute("class", "glyphicon glyphicon-play");
	}
	window.setTimeout("MusicEnd()","1");
}

function Login(){
	//alert("登陆");
	var xmlHttp = new XMLHttpRequest();
	var url = "Login.jsp";
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4){
			resultDiv.innerHTML = xmlHttp.responseText;
		}
		else{
			//resultDiv.innerHTML += "正在登陆...";
		}
	}
	xmlHttp.send();
}

function Register(){
	//alert("注册");
	var xmlHttp = new XMLHttpRequest();
	var url = "Register.jsp";
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4){
			resultDiv.innerHTML = xmlHttp.responseText;
		}
		else{
			//resultDiv.innerHTML += "正在注册...";
		}
	}
	xmlHttp.send();
}

function ResetButtonClick(){
	var text1 = document.getElementById("username");
	var text2 = document.getElementById("password");
	var text3 = document.getElementById("passwordreset");
	text1.value = "";
	text2.value = "";
	text3.value = "";
}

function HandleRegisterSubmitClick(){
	var text1 = document.getElementById("username");
	var text2 = document.getElementById("password");
	var text3 = document.getElementById("passwordreset");
	var text1value = text1.value;
	var text2value = text2.value;
	var text3value = text3.value;
	var xmlHttp = new XMLHttpRequest();
	var url = "Servlet/RegisterServlet?username="+text1value+"&password="+text2value+"&passwordreset="+text3value;
	if(text1value == ""){
		alert("请输入用户名");
	}
	else if(text2value == ""){
		alert("请输入密码");
	}
	else if(text3value == ""){
		alert("请再次输入密码");
	}
	else if(text2value != text3value){
		alert("两次输入的密码不一致");
	}
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4){
			resultDiv.innerHTML = xmlHttp.responseText;
		}
		else{
			//resultDiv.innerHTML += "正在注册...";
		}
	}
	xmlHttp.send();
}

function HandleLoginSubmitClick(){
	var text1 = document.getElementById("username");
	var text2 = document.getElementById("password");
	var checkbox = document.getElementById("checkbox");
	var code = document.getElementById("code");
	var text1value = text1.value;
	var text2value = text2.value;
	var checkboxvalue = "";
	var codevalue = code.value;
	if(checkbox.checked){
		checkboxvalue = "remember";
	}
	var xmlHttp = new XMLHttpRequest();
	var url = "Servlet/LoginServlet?username="+text1value+"&password="+text2value+"&checkbox="+checkboxvalue+"&code="+codevalue;
	if(text1value == ""){
		alert("请输入用户名");
	}
	else if(text2value == ""){
		alert("请输入密码");
	}
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4){
			resultDiv.innerHTML = xmlHttp.responseText;
		}
		else{
			resultDiv.innerHTML += "正在登陆...";
		}
	}
	xmlHttp.send();
}

function HandlePlayListClick(){//播放列表按钮触发事件
	var xmlHttp = new XMLHttpRequest();
	var url = "MusicList.jsp";
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4){
			resultDiv.innerHTML = xmlHttp.responseText;
		}
		else{
			//resultDiv.innerHTML += "正在登陆...";
		}
	}
	xmlHttp.send();
}

function HandleMusicListPlayClick(listtype,musicpath){
	var music = document.getElementById("music");
	var play = document.getElementById("play");
	var xmlHttp = new XMLHttpRequest();
	var url = "Servlet/MusicListServlet?listtype="+listtype+"&musicpath="+musicpath;
	var xmltext = 0;
	var preend = 0;
	var nextend = "";
	var pre = "";
	var next = "";
	musicform.presentlist.value = listtype;
	musicform.presentmusic.value = musicpath;
	music.src = musicpath;
	play.setAttribute("class", "glyphicon glyphicon-pause");
	music.play();
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4){
			xmltext = xmlHttp.responseText;
			preend = xmltext.indexOf("%%");
			nextend = xmltext.length;
			pre = xmltext.substr(0, preend);
			next = xmltext.substr(preend+2, nextend);
			musicform.formermusic.value = pre;
			musicform.lattermusic.value = next;
			//alert(pre+" "+next);
		}
		else{
			//resultDiv.innerHTML += "正在登陆...";
		}
	}
	xmlHttp.send();
}

//function MusicListChange(){
//	var play = document.getElementById("play");
//	var music = document.getElementById("music");
//	var text = document.getElementById("text");
//	var musicname = music.src;
//	if(music.ended==true){
//		play.setAttribute("class", "glyphicon glyphicon-play");
//	}
//	window.setTimeout("MusicListChange()","1");
//}

function DownLoad(){
	var xmlHttp = new XMLHttpRequest();
	var url = "DownLoad.jsp?file="+music.src;
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4){
			resultDiv.innerHTML = xmlHttp.responseText;
		}
		else{
			//resultDiv.innerHTML += "正在下载...";
		}
	}
	xmlHttp.send();
}

function UpLoad(){
	var xmlHttp = new XMLHttpRequest();
	var url = "UpLoad.jsp";
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4){
			resultDiv.innerHTML = xmlHttp.responseText;
		}
		else{
			//resultDiv.innerHTML += "正在上传...";
		}
	}
	xmlHttp.send();
}


function HandleSearchClick(){//播放列表按钮触发事件
	var text = document.getElementById("SearchText");
	var textvalue = text.value;
	var xmlHttp = new XMLHttpRequest();
	var url = "Servlet/SearchMusicServlet?SearchText="+textvalue;
	var xmltext="";
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4){
			resultDiv.innerHTML = xmlHttp.responseText;
		}
		else{
			//resultDiv.innerHTML += "正在登陆...";
		}
	}
	xmlHttp.send();
}

function HandleShowLrcClick(){//播放列表按钮触发事件
	var music = document.getElementById("music");
	var musicpath = music.src;
	var xmlHttp = new XMLHttpRequest();
	var url = "Servlet/ShowLrcServlet?MusicPath="+musicpath;
	var xmltext="";
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4){
			resultDiv.innerHTML = xmlHttp.responseText;
		}
		else{
			//resultDiv.innerHTML += "正在登陆...";
		}
	}
	xmlHttp.send();
}

function Comment(){//播放列表按钮触发事件
	var xmlHttp = new XMLHttpRequest();
	var url = "Servlet/CommentServlet";
	var xmltext="";
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4){
			resultDiv.innerHTML = xmlHttp.responseText;
//			alert(xmltext);
		}
		else{
			//resultDiv.innerHTML += "正在登陆...";
		}
	}
	xmlHttp.send();
}

function HandleCommentClick(){//播放列表按钮触发事件
	var CommentContent = document.getElementById("CommentContent");
	var CommentContentValue = CommentContent.value;
	var xmlHttp = new XMLHttpRequest();
	var url = "CommentServlet.jsp?CommentContent="+CommentContentValue;
	var xmltext="";
//	alert();
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4){
			resultDiv.innerHTML = xmlHttp.responseText;
		}
		else{
			//resultDiv.innerHTML += "正在登陆...";
		}
	}
	xmlHttp.send();
}

function HandleSaveMusicListClick(){//播放列表按钮触发事件
	var xmlHttp = new XMLHttpRequest();
	var url = "Servlet/SaveMusicListServlet";
	var xmltext="";
//	alert();
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4){
			resultDiv.innerHTML = xmlHttp.responseText;
		}
		else{
			//resultDiv.innerHTML += "正在登陆...";
		}
	}
	xmlHttp.send();
}

function Save(musicpath){//播放列表按钮触发事件
	var SaveMusic = document.getElementById("SaveMusicButton");
	var xmlHttp = new XMLHttpRequest();
	var url = "Servlet/SaveServlet?musicpath="+musicpath;
	var xmltext="";
//	alert();
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4){
			xmltext = xmlHttp.responseText;
			if(xmltext == "true"){
//				alert(xmltext);
//				SaveMusic.setAttribute("class", "glyphicon glyphicon-star");
			}
			else{
				resultDiv.innerHTML = xmltext;
			}
		}
		else{
			//resultDiv.innerHTML += "正在登陆...";
		}
	}
	xmlHttp.send();
}

function init(){
	music.src = musicform.presentmusic.value;
	//music.play();
	music.addEventListener('timeupdate', function () {
    	musicform.currenttime.value = music.currentTime;
    	musicform.duration.value = music.duration;
	}, false);
	window.setTimeout("MusicChange()","1");
	window.setTimeout("RangeChange()","1");
	window.setTimeout("VolumeChange()","1");
	window.setTimeout("MusicEnd()","1");
}

window.onload = init;