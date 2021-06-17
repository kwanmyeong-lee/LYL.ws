<%@page import="video.VideoVO"%>
<%@page import="java.util.List"%>
<%@page import="video.VideoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../css/videoStyles.css" rel="stylesheet">
<%@ include file="/startbootstrap-sb-admin-gh-pages/inc/top.jsp"%>
<%
   VideoService vs = new VideoService();

	String vidTitle = request.getParameter("vidTitle");
	vidTitle="게임";

   List<VideoVO> vidList = vs.videoSearch(vidTitle);
   %>
   
   <script type="text/javascript">
	var scVidImg = new Array();
	var scVidTitle = new Array();
	var scVidUserId = new Array();
	var scVidHits = new Array();
	var scVidSize = <%=vidList.size()%>
	var scSize=0;
   </script>
   
   <%		
	for(int j=0; j<vidList.size(); j++){
		VideoVO vvo =vidList.get(j);
		String title= vvo.getVidTitle();
		if(title.length()>15){
			title=title.substring(0, 15);
			title+="...";
		}
		%>
		<script type="text/javascript">
			scVidTitle.push("<p class='search_video_tilte'><%=title%></p>");
			scVidImg.push("<img class='search_Thumbnail' src=<%=vvo.getVidThu()%>>");
			scVidUserId.push("<p class='video_uploaderid'><%=vvo.getUserNo()%></p>");
			scVidHits.push("<p class='video_hits'>조회수 <%=vvo.getVidHits() %></p>");
		</script>
			
		<%
	}
   
%>


<script>
    $(window).scroll(function() {
        var videoinfo= '<div class="video_info"></div>';
		
    	if ($(window).scrollTop() == $(document).height() - $(window).height()) {
    		if(scSize<scVidSize){    			
	        	$("main").children().first().append('<div class="video_info">');
	        	$(".video_info").last().append('<div class="video_search_list">');
	        	$('.video_search_list').last().append(scVidImg[scSize]);
	        	$('.video_search_list').last().append(scVidTitle[scSize]);
	        	$('.video_search_list').last().append(scVidUserId[scSize]);
	        	$('.video_search_list').last().append(scVidHits[scSize]);
	        	scSize++;
    		}
        }
    });
</script>
<body>
   <header>
    <h1>찾기</h1>
   </header>
   <div class="video_info">
	   <div class="video_search_list">
	   		<img class="search_Thumbnail" src="http://img.youtube.com/vi/lgPi5GhEj0c/maxresdefault.jpg">
	   		<p class="search_video_tilte">title</p>
	   		<p class="video_uploaderid">id</p>
	   		<p class="video_hits">조회수</p>
	   </div>
   </div>
   <div class="video_info">
	   <div class="video_search_list">
	   		<img class="search_Thumbnail" src="http://img.youtube.com/vi/lgPi5GhEj0c/maxresdefault.jpg">
	   		<p class="search_video_tilte">title</p>
	   		<p class="video_uploaderid">id</p>
	   		<p class="video_hits">조회수</p>
	   </div>
   </div>
   <div class="video_info">
	   <div class="video_search_list">
	   		<img class="search_Thumbnail" src="http://img.youtube.com/vi/lgPi5GhEj0c/maxresdefault.jpg">
	   		<p class="search_video_tilte">title</p>
	   		<p class="video_uploaderid">id</p>
	   		<p class="video_hits">조회수</p>
	   </div>
   </div>
   <div class="video_info">
	   <div class="video_search_list">
	   		<img class="search_Thumbnail" src="http://img.youtube.com/vi/lgPi5GhEj0c/maxresdefault.jpg">
	   		<p class="search_video_tilte">title</p>
	   		<p class="video_uploaderid">id</p>
	   		<p class="video_hits">조회수</p>
	   </div>
   </div>
   <div class="video_info">
	   <div class="video_search_list">
	   		<img class="search_Thumbnail" src="http://img.youtube.com/vi/lgPi5GhEj0c/maxresdefault.jpg">
	   		<p class="search_video_tilte">title</p>
	   		<p class="video_uploaderid">id</p>
	   		<p class="video_hits">조회수</p>
	   </div>
   </div>
   
   


<%@ include file="/../startbootstrap-sb-admin-gh-pages/inc/bottom.jsp" %>