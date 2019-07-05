# MusicPlayer
个人开发作品--网页版音乐播放器

开发环境：MyEclipse
数据库管理系统：Microsoft SQL Server

主要应用技术：
JSP、JavaScript、Servlet、html、css、Ajax（bootstrap、jQuery涉及较少）

基本功能：
上一首下一首、点击播放、进度条快进快退、注册登录、上传下载、模糊搜索、评论、收藏、播放列表等

详细描述：
前端：利用Div+css并结合JavaScript负责播放器的前端开发和页面设计，实现简单注册登陆界面、音乐列表界面以及讨论区的显示功能，与客户进行互动，获取用户需求并将数据通过Ajax异步传递到后台进行处理，同时将处理数据后的结果反馈给用户。 （由于jsp的便利性，绝大多数html代码都以jsp文件显示，）
后台：基于Servlet以及JSP等相关技术， 包括初始化播放列表，Web 服务器接收会话中来自于用户的请求，并将请求处理后的结果反馈到前端，处理结果时可能需要与数据库进行交互
数据库： 通过Microsoft SQL Server进行数据管理，存储用户信息、相关文件（音乐文件、歌词文件等）的路径以及评论内容。

![image](https://github.com/YZK0518/MusicPlayer/blob/master/MavenImages/%E6%92%AD%E6%94%BE%E5%88%97%E8%A1%A8.PNG)
![image](https://github.com/YZK0518/MusicPlayer/blob/master/MavenImages/%E6%B3%A8%E5%86%8C%E7%95%8C%E9%9D%A2.PNG)
![image](https://github.com/YZK0518/MusicPlayer/blob/master/MavenImages/%E8%AF%84%E8%AE%BA.PNG)
