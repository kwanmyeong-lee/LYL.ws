<%@page import="java.text.DecimalFormat"%>
<%@page import="src.myuser.MyuserService"%>
<%@page import="src.myuser.MyuserVO"%>
<%@page import="video.VideoVO"%>
<%@page import="java.util.List"%>
<%@page import="video.VideoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../css/videoStyles.css" rel="stylesheet">
<%@ include file="/startbootstrap-sb-admin-gh-pages/inc/top.jsp"%>

   
	
<script>
	var vidCnt=5;
	var vidTitle="${param.vidTitle}";
    $(window).scroll(function() {
		
    	if ($(window).scrollTop() == $(document).height() - $(window).height()) {
    		
    		$.ajax({

    			url : "videoSelect_ok.jsp",

    			type : "post", //get post둘중하나

    			data : {"vidCnt":vidCnt, "vidTitle":vidTitle},
    			

    			success : function(data) {
    				var videoinfo= '<div class="video_info"></div>';
    				
    				var obj = JSON.parse(data);

    				var vidList = obj.vidList;
    				var vidListSize = obj.vidListSize;
    				if(vidListSize==0){
    					return;
    				}
    				
    				for(var i=0; i<vidListSize; i++){
    					
	    				var scVidImg='<img class="search_Thumbnail" src="'+vidList[i].vidImg+'">';
	    		    	var scVidTitle='<p class="search_video_tilte">'+vidList[i].vidTitle+'</p>';
	    		    	var scVidUserId='<p class="video_uploaderid">'+vidList[i].vidUserId+'</p>';
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
<%
	String vidTitle = request.getParameter("vidTitle");
	VideoService sv = new VideoService();
	List<VideoVO> list = sv.videoSearch(vidTitle, 0);
	DecimalFormat df = new DecimalFormat("#,###.#");
	MyuserService msv = new MyuserService();
	
	for(int i=0; i<list.size(); i++){
		VideoVO vo = list.get(i);
		String VidWatch ="videoWatch.jsp?vidNo="+vo.getVidNo();
		String title=vo.getVidTitle();
		/* if(title.length()>15){
			title=title.substring(0, 15);
			title+="...";
		} */
		
		String svidHits="";
		long hits= vo.getVidHits();		
		if(hits>=100000000){
			hits/= 10000000;
			float fhits= hits/10.f;
			svidHits=df.format(fhits)+"억회";
		}
		else if(hits>=10000){
			hits /=1000;
			float fhits= hits/10.f;
			svidHits=df.format(fhits)+"만회";
		}else{
			svidHits=df.format(hits)+"회";
		}
		
		String userno=String.valueOf(vo.getUserNo());
		MyuserVO mvo = msv.selectMyuserByVidNo(userno);
		
		%>
		<a class="awatch" href=<%=VidWatch%>>
   			<div class="video_info">
	   			<div class="video_search_list">
			   		<img class="search_Thumbnail" src=<%=vo.getVidThu() %>>
			   		<p class="search_video_tilte"><%=title%></p>
			   		<p class="video_uploaderid"><%=mvo.getUserId() %></p>
			   		<p class="video_hits"><%=svidHits %></p>
			   </div>
   			</div>
		</a>
		
	<%}
%>
	
   
  
   
   


<%@ include file="/../startbootstrap-sb-admin-gh-pages/inc/bottom.jsp" %>