<%@page import="video.VideoVO"%>
<%@page import="java.util.List"%>
<%@page import="video.VideoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../css/videoStyles.css" rel="stylesheet">
<%@ include file="/startbootstrap-sb-admin-gh-pages/inc/top.jsp"%>

   
	
<script>
	var vidCnt=0;
	var vidTitle="${param.vidTitle}";
    $(window).scroll(function() {
		
    	if ($(window).scrollTop() == $(document).height() - $(window).height()) {
    		
    		$.ajax({

    			url : "videosearch_ok.jsp",

    			type : "post", //get post둘중하나

    			data : {"vidCnt":vidCnt, "vidTitle":vidTitle},
    			

    			success : function(data) {
    				var videoinfo= '<div class="video_info"></div>';
    				
    				var obj = JSON.parse(data);

    				var vidList = obj.vidList;
    				var vidListSize = obj.vidListSize;
    				
    				for(var i=0; i<vidListSize; i++){
    					
	    				var scVidImg='<img class="search_Thumbnail" src="'+vidList[i].vidImg+'">';
	    		    	var scVidTitle='<p class="search_video_tilte">'+vidList[i].vidTitle+'</p>';
	    		    	var scVidUserId='<p class="video_uploaderid">'+vidList[i].vidUserNo+'</p>';
	    		    	var scVidHits='<p class="video_hits">'+vidList[i].vidHits+'</p>';
	    				var scVidNo=vidList[i].vidNo;
						
	    		    	$("main").children().first().append('<a class="awatch" href="videoWatch.jsp?vidNo='+scVidNo+'">');
	    		    	$(".awatch").last().append('<div class="video_info">');
	    	        	$(".video_info").last().append('<div class="video_search_list">');
	    	        	$('.video_search_list').last().append(scVidImg);
	    	        	$('.video_search_list').last().append(scVidTitle);
	    	        	$('.video_search_list').last().append(scVidUserId);
	    	        	$('.video_search_list').last().append(scVidHits);
	    	        	
    				}
    				vidCnt+=5;
    			}

    		});
    		
    		
    		
	        
    		
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