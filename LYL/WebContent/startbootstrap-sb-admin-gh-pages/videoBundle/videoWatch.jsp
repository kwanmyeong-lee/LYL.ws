<%@page import="video.VideoService"%>
<%@page import="src.aftervideo.aftervideoVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="src.myuser.MyuserVO"%>
<%@page import="video.VideoVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/startbootstrap-sb-admin-gh-pages/inc/top.jsp"%>


<style>
	#player{
		padding-top: 10px;
	}
	p{
		margin: 0;
	}
	.ReComDiv{
		padding-left: 50px;
	}
</style>

<script>
	var vidComCnt= 0;
	var vidComCnt2= 1;
	var vidReComCnt=0;
	var vidNo=${param.vidNo};
    $(window).scroll(function() {
    	
    	
    	if ($(window).scrollTop() == $(document).height() - $(window).height()) {
    		
    		$.ajax({

    			url : "videoWatch_ok.jsp",

    			type : "post", //get post둘중하나

    			data : {"vidComCnt":vidComCnt,"vidNo":vidNo, "vidGroup":0},
    			

    			success : function(data) {
    				
    				var obj = JSON.parse(data);

    				var comList = obj.comList;
    				var comListSize = obj.comListSize;
    				
    				for(var i=0; i<comListSize; i++){
    					var otherComNo='<input type="hidden" class="hid1" value="'+comList[i].comNo+'">';
    					var otherComNo2='<input type="hidden" class="hid2" value="'+vidComCnt2+'">';    				
    					var otherReFirstCheck='<input type="hidden" class="reComBtFirstCheck" value=0>';
    					var otherReComSeeMore='<input type="hidden" class="reComSeeMore" value=0>';
    					var otherReComSeeMoreCheck='<input type="hidden" class="reComSeeMoreCheck" value="true">';
	    				var otherUserId='<p class="otherUserId">'+comList[i].comId+'</p>';
	    		    	var otherContent='<p class="otherContent">'+comList[i].comCon+'</p>';
	    		    	var otherBtCommentLike='<button class="btn btn-primary btComLike" type="button">좋아요 </button>';
	    		    	var otherCommentLikeCnt='<span class="vidCommentLikeCnt">&nbsp'+comList[i].comLike+'&nbsp&nbsp&nbsp&nbsp</span>';
	    		    	var otherBtComment2='<button class="btn btn-primary btComRe" type="button">답글</button>';
	    		    	var otherCommentReCnt='<span class="vidCommentReCnt">&nbsp'+comList[i].comRe+'&nbsp&nbsp&nbsp&nbsp</span>';
	    		    	var otherBtComment3='<button class="btn btn-primary btComReply" type="button">답글하기</button>';
	    		    	var otherReplyCom
	    		    	='<div class="ReplyCom" style="display:none"><textarea rows="2" cols="100" class="teReComCon"></textarea><button type="button" class="reComWrite">댓글</button></div>';
	    		    	var otherReComDiv='<div class="ReComDiv" style="display:none"><p></p></div>'
	    				
	
	    				$('.vidComment').last().after('<div class="vidComment">');
	    	        	$('.vidComment').last().append("<br>");
	    	        	$('.vidComment').last().append(otherComNo);
	    	        	$('.vidComment').last().append(otherComNo2);
	    	        	$('.vidComment').last().append(otherReFirstCheck);
	    	        	$('.vidComment').last().append(otherReComSeeMore);
	    	        	$('.vidComment').last().append(otherReComSeeMoreCheck);
	    	        	$('.vidComment').last().append(otherUserId);
	    	        	$('.vidComment').last().append(otherContent);
	    	        	$('.vidComment').last().append(otherBtCommentLike);
	    	        	$('.vidComment').last().append(otherCommentLikeCnt);
	    	        	$('.vidComment').last().append(otherBtComment2);
	    	        	$('.vidComment').last().append(otherCommentReCnt);
	    	        	$('.vidComment').last().append(otherBtComment3);
	    	        	$('.vidComment').last().append(otherReplyCom);
	    	        	$('.vidComment').last().append(otherReComDiv);
    					vidComCnt2++;
    				}
    				vidComCnt+=comListSize;
    				if(vidComCnt==9 || vidComCnt==1){
    					vidComCnt++;
    				}
    				
    			}

    		});//ajax
    		
        	
        }
    });
    
    $(function(){
    	$('body').on('click','button.btComRe',(function(){
    		$(this).parent().children('.ReComDiv').toggle();
    		
    		var reComNo= $(this).parent().children('.hid1').val();
    		var reComNo2= parseInt($(this).parent().children('.hid2').val());
    		
    		var firstCheck = $(this).parent().children('.reComBtFirstCheck').val();
    		var reSeeMore = $(this).parent().children('.reComSeeMore').val();
    		
    		if(firstCheck==0){
    			$.ajax({

        			url : "videoWatch_ok.jsp",

        			type : "post", //get post둘중하나

        			data : {"vidComCnt":vidReComCnt,"vidNo":vidNo, "vidGroup":reComNo},
        			

        			success : function(data) {
        				
        				var obj = JSON.parse(data);

        				var comList = obj.comList;
        				var comListSize = obj.comListSize;
        				
        				if(comListSize>0){
        					$('.vidComment').eq(reComNo2).children('.ReComDiv').append("<br>");
        					$('.vidComment').eq(reComNo2).children('.reComBtFirstCheck').val(1);
        				}
        				for(var i=0; i<comListSize; i++){
    	    				var reotherUserId='<p class="reotherUserId">'+comList[i].comId+'</p>';
    	    		    	var reotherContent='<p class="reotherContent">'+comList[i].comCon+'</p>';
    	    		    	var reotherBtCommentLike='<button class="btn btn-primary rebtComLike" type="button">좋아요 </button>';
    	    		    	var reotherCommentLikeCnt='<span class="revidCommentLikeCnt">&nbsp'+comList[i].comLike+'&nbsp&nbsp&nbsp&nbsp</span>';
    	    				
    	
    	    		    	
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').append(reotherUserId);
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').append(reotherContent);
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').append(reotherBtCommentLike);
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').append(reotherCommentLikeCnt);
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').append("<br>");
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').append("<br>");
        				}
        				if(comListSize==9){
        					var otherBtComment2='<button class="btn btn-primary btComReSeeMore" type="button">더보기</button>';
        					$('.vidComment').eq(reComNo2).children('.ReComDiv').append(otherBtComment2);
        					$('.vidComment').eq(reComNo2).children('.reComSeeMore').val(parseInt(reSeeMore)+10);
        					$('.vidComment').eq(reComNo2).children('.reComSeeMoreCheck').val("false");
        					
        				}
        				
        			}

        		});//ajax
    		}    		
    		
    		
    	}));//btComRe
    	
    	$('body').on('click','button.btComReSeeMore',(function(){
    		$(this).hide();
    		var reComNo= $(this).parent().parent().children('.hid1').val();
    		var reComNo2= parseInt($(this).parent().parent().children('.hid2').val());
    		var reSeeMore = $(this).parent().parent().children('.reComSeeMore').val();
    		
    		
    			$.ajax({

        			url : "videoWatch_ok.jsp",

        			type : "post", //get post둘중하나

        			data : {"vidComCnt":reSeeMore,"vidNo":vidNo, "vidGroup":reComNo},
        			

        			success : function(data) {
        				
        				var obj = JSON.parse(data);

        				var comList = obj.comList;
        				var comListSize = obj.comListSize;
        				
        				for(var i=0; i<comListSize; i++){
    	    				var reotherUserId='<p class="reotherUserId">'+comList[i].comId+'</p>';
    	    		    	var reotherContent='<p class="reotherContent">'+comList[i].comCon+'</p>';
    	    		    	var reotherBtCommentLike='<button class="btn btn-primary rebtComLike" type="button">좋아요 </button>';
    	    		    	var reotherCommentLikeCnt='<span class="revidCommentLikeCnt">&nbsp'+comList[i].comLike+'&nbsp&nbsp&nbsp&nbsp</span>';
    	    				
    	
    	    		    	
    	    		    	
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').append(reotherUserId);
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').append(reotherContent);
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').append(reotherBtCommentLike);
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').append(reotherCommentLikeCnt);
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').append("<br>");
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').append("<br>");
        				}
        				if(comListSize>=9){
        					var otherBtComment2='<button class="btn btn-primary btComReSeeMore" type="button">더보기</button>';        					
        					$('.vidComment').eq(reComNo2).children('.ReComDiv').append(otherBtComment2);
        					$('.vidComment').eq(reComNo2).children('.reComSeeMore').val(parseInt(reSeeMore)+10);
        				}else{
        					$('.vidComment').eq(reComNo2).children('.reComSeeMoreCheck').val("true");
        					
        				}
        				
        			}

        		});//ajax
    		   		
    		
    		
    	}));//btComReSeeMore
    	
    	$('body').on('click','button.btComReply',(function(){
    		$(this).parent().children('.ReplyCom').toggle();
    		   		
    	}));//btComReply
    	
    	
    	
    });
  
</script>
	<jsp:useBean id="videoService" class="video.VideoService" scope="page"></jsp:useBean>
	<jsp:useBean id="myuserService" class="src.myuser.MyuserService" scope="page"></jsp:useBean>
	<jsp:useBean id="aftervideoService" class="src.aftervideo.aftervideoService" scope="page"></jsp:useBean>
	
	<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String vidno = request.getParameter("vidNo");  //받아올게 없쥬?
		
		VideoVO videoVo = null;
		MyuserVO myuserVo = null;
		aftervideoVO afvideoVo = null;
		try{
			videoVo = videoService.videoSelect(vidno);
			myuserVo = myuserService.selectMyuserByVidNo(vidno); //유저번호, 구독자, 타이틀 밖에 안들어있어요
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		String vidUrl = videoVo.getVidurl();
		if(vidUrl.startsWith("https")){
			vidUrl+="?autoplay=1&mute=1";
		}
	%>

   <header>
   </header>
   <iframe id="player" width="1200" height="650" src=<%=vidUrl%> allowfullscreen=""></iframe>
	<p id='vidTitle'>title : &nbsp;<%=videoVo.getVidTitle() %></p>
	<p id='vidHits'>조회수 <%=videoVo.getVidHits() %> 회 <%=sdf.format(videoVo.getVidDate()) %></p>
	
	<hr>
	<p id='vidUploaderId'>id :&nbsp;<%=myuserVo.getUserId() %> </p>
	<p id='vidG'>구독자<%=myuserVo.getUserSub() %> 명</p>
	
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<button id="subscribe" class="btn btn-primary me-md-2" type="button" value="<%=myuserVo.getUserNo()%>">구독</button>
		<button id="videoSave" class="btn btn-primary" type="button" >다시보기에 저장</button>
	</div>

	<p id='vidContent'>내용 : &nbsp;<%=videoVo.getVidEx() %></p>
    <hr>
    <div id='vidCommentCnt'>
    	<span>댓글 </span><span><%=videoVo.getVidCom() %></span><span>개</span>
    </div>
    <div class='vidComment' id ='myComment'>
    	<textarea rows="2" cols="100" class="teComCon"></textarea>
   	 	<button type="button" class="comWrite">댓글</button>
    </div>
    <input type="hidden" class="vidComCnt" value=0>
    
    <!-- <div class='vidComment'>
    	<p class="otherUserId">아이디</p>
    	<p class="otherContent">내용</p>
    	<button class="btCommentLike" type="button">좋아요</button>
    	<span id="vidCommentLikeCnt">111</span>
    	<button type="button">답글</button>
    </div> -->
    
  </body>
<script type="text/javascript">
	var vidNo=${param.vidNo};
	var userNo = "${sessionScope.userNo}"; //로이그인 해서 들어온 유저
	var userNo2 = $('#subscribe').val(); //영상 올린 유저
	
	$(function() {
		$('#videoSave').click(function() {
			$.ajax({

				url : "aftervideo_ok.jsp", //나중에볼 동영상

				type : "post", //get post둘중하나

				data : {
					"userNo" : userNo,
					"vidNo" : vidNo
				},

				success : function(data) {
					var obj = JSON.parse(data);
					var cnt = obj.cnt;

					if (cnt > 0) {
						$(function() {
							$('#videoSave').css('background', 'red');
						})

					}

				}
			});
		});
		
		$('#subscribe').click(function() {
			
			$.ajax({

				url : "usbscribe_ok.jsp", //나중에볼 동영상

				type : "post", //get post둘중하나

				data : {
					"userNo" : userNo,
					"userNo2" : userNo2
				},

				success : function(data) {
					var obj = JSON.parse(data);
					var cnt = obj.cnt;

					if (cnt > 0) {
						$(function() {
							$('#videoSave').css('background', 'red');
						})

					}

				}
			});
		});
		
		$('.comWrite').click(function(){
			
			if(userNo==""){
    			alert("로그인하세요")
    			return;
    		}
			
			var comCon = $('#myComment').children('.teComCon').val();
			
			$.ajax({

				url : "comWrite_ok.jsp", //나중에볼 동영상

				type : "post", //get post둘중하나

				data : {
					"userNo" : userNo,
					"vidNo" : vidNo,
					"comCon" : comCon,
					"comGroup" : 0
				},

				success : function(data) {
					$('#myComment').children('textarea').val("");
					

				}
			});//ajax
			
			
    	});//comWrite
    	
    	$('body').on('click','button.reComWrite',(function(){
    		if(userNo==""){
    			alert("로그인하세요")
    			return;
    		}
    		var comGroup= $(this).parent().parent().children('input[type=hidden]').val();
    		var comCntNo= $(this).parent().parent().children('.hid2').val();
			var seeMoreCheck= $(this).parent().parent().children('.reComSeeMoreCheck').val();
			var firstCheck = $(this).parent().parent().children('.reComBtFirstCheck').val();
    		var comCon = $(this).parent().children('.teReComCon').val();
    		$.ajax({

				url : "comWrite_ok.jsp", //나중에볼 동영상

				type : "post", //get post둘중하나

				data : {
					"userNo" : userNo,
					"vidNo" : vidNo,
					"comCon" : comCon,
					"comGroup" : comGroup
				},

				success : function(data) {			
 					$('.ReplyCom').eq(comCntNo-1).children('textarea').val(""); 					
 					
 					if(seeMoreCheck=="true" && firstCheck!=0){
 						
	 					var reotherUserId='<p class="reotherUserId"><%=myuserVo.getUserId()%></p>';
	    		    	var reotherContent='<p class="reotherContent">'+comCon+'</p>';
	    		    	var reotherBtCommentLike='<button class="btn btn-primary rebtComLike" type="button">좋아요 </button>';
	    		    	var reotherCommentLikeCnt='<span class="revidCommentLikeCnt">&nbsp0&nbsp&nbsp&nbsp&nbsp</span>';
						
	    		    	$('.vidComment').eq(comCntNo).children('.ReComDiv').append(reotherUserId);
	    		    	$('.vidComment').eq(comCntNo).children('.ReComDiv').append(reotherContent);
	    		    	$('.vidComment').eq(comCntNo).children('.ReComDiv').append(reotherBtCommentLike);
	    		    	$('.vidComment').eq(comCntNo).children('.ReComDiv').append(reotherCommentLikeCnt);
	    		    	$('.vidComment').eq(comCntNo).children('.ReComDiv').append("<br>");
	    		    	$('.vidComment').eq(comCntNo).children('.ReComDiv').append("<br>");
	    		   
 					}
					
				}
			});//ajax
			
    	}));//reComWrite
		
	});
</script>

<%@ include file="/../startbootstrap-sb-admin-gh-pages/inc/bottom.jsp" %>