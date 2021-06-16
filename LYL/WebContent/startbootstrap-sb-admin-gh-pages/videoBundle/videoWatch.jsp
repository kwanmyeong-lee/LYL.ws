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
	
</style>

<script>
    $(window).scroll(function() {
    	var otherUserId='<p class="otherUserId">아이디</p>';
    	var otherContent='<p class="otherContent">내용</p>';
    	var otherBtCommentLike='<button class="btn btn-primary" type="button">좋아요 </button>';
    	var otherCommentLikeCnt='<span id="vidCommentLikeCnt">111</span>';
    	var otherBtComment2='<button class="btn btn-primary" type="button">답글</button>';
		
    	if ($(window).scrollTop() == $(document).height() - $(window).height()) {
        	$('.vidComment').last().after('<div class="vidComment">');
        	$('.vidComment').last().append("<br>");
        	$('.vidComment').last().append(otherUserId);
        	$('.vidComment').last().append(otherContent);
        	$('.vidComment').last().append(otherBtCommentLike);
        	$('.vidComment').last().append(otherCommentLikeCnt);
        	$('.vidComment').last().append(otherBtComment2);
        	
        }
    });
</script>

<body>
   <header>
   </header>
   <iframe id="player" width="1200" height="650" src="http://www.youtube.com/embed/lgPi5GhEj0c?autoplay=1&mute=1" allowfullscreen=""></iframe>
	<p id='vidTitle'>title</p>
	<p id='vidHits'>조회수0회 2012.12.12.</p>
	<hr>
	<p id='vidUploaderId'>ID</p>
	<p id='vidG'>구독자11명</p>
    <p id='vidContent'>내용</p>
    <hr>
    <div id='vidCommentCnt'>
    	<span>댓글 </span><span>0</span><span>개</span>
    </div>
    <div class='vidComment' id ='myComment'>
    	<textarea rows="2" cols="100"></textarea>
   	 	<button type="button">댓글</button>
    </div>
    <!-- <div class='vidComment'>
    	<p class="otherUserId">아이디</p>
    	<p class="otherContent">내용</p>
    	<button class="btCommentLike" type="button">좋아요</button>
    	<span id="vidCommentLikeCnt">111</span>
    	<button type="button">답글</button>
    </div> -->
    
   


<%@ include file="/../startbootstrap-sb-admin-gh-pages/inc/bottom.jsp" %>