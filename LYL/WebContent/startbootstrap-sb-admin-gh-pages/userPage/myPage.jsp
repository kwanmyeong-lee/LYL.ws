<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="src.myuser.MyuserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/startbootstrap-sb-admin-gh-pages/inc/top.jsp"%>
<link href="../css/myPageStyles.css" rel="stylesheet">
<jsp:useBean id="myuserService" class="src.myuser.MyuserService" scope="session" ></jsp:useBean>
<% 
String userid =(String) session.getAttribute("userid");
userid = "admin"; //임시로 admin 해둔거
MyuserVO vo = null;
vo = myuserService.selectMyuser(userid);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String joindate = sdf.format(vo.getUserJoin());


%>

<script>
	$(window)
			.scroll(
					function() {
						var videoinfo = '<div class="video_info"></div>';
						var a = '<img class="main_Thumbnail" src="http://img.youtube.com/vi/lgPi5GhEj0c/maxresdefault.jpg">';
						var videotitle = '<p class="video_tilte">title</p>';
						var uploaderid = '<p class="video_uploaderid">id</p>';
						var videohits = '<p class="video_hits">조회수</p>';

						if ($(window).scrollTop() == $(document).height()
								- $(window).height()) {
							$("#video").append('<div class="video_main_list">');
							for (var i = 0; i < 4; i++) {
								$('.video_main_list').last().append(videoinfo);
								$('.video_info').last().append(a);
								$('.video_info').last().append(videotitle);
								$('.video_info').last().append(uploaderid);
								$('.video_info').last().append(videohits);
							}
						}
					});
</script>

<h1 class="mt-4">마이페이지</h1>
<div class="container position-relative px-4 px-lg-5">
	<div class="row gx-4 gx-lg-5 justify-content-center">
		<div class="col-md-10 col-lg-8 col-xl-7">
			<img id="userImg" src="../img/200x200.jpg" class="img-thumbnail" alt="...">
			
			<div class="d-inline-flex position-relative start-50">
				<button type="button" class="btn btn-primary me-2">영상 업로드</button>
				<button type="button" class="btn btn-primary">게시판</button>
			</div>
			<div class="userInfo">
				<h4 id="userid">userid :&nbsp;<%=vo.getUserId() %></h4>
				<p id="userEmail">userEmail :&nbsp;<%=vo.getUserEmail()%></p>
				<p id="userJoin">userJoin :&nbsp;<%=joindate %></p>
				<p id="userSub">userSub :&nbsp;<%=vo.getUserSub() %> </p>
			</div>
		</div>
	</div>
</div>

<div class="container">
	<div class="justify-content-center">
		<div class="col-me-10">
			<div class="d-inline-flex me-5">

				<iframe class="col me-2" id="player" width="640" height="360"
					src="http://www.youtube.com/embed/lgPi5GhEj0c?autoplay=1&mute=1"></iframe>

				<iframe id="player" width="640" height="360"
					src="http://www.youtube.com/embed/lgPi5GhEj0c?autoplay=1&mute=1"></iframe>
			</div>
		</div>
	</div>
</div>
<hr>
<h1>영상</h1>
<hr>
<div class="container ">
	<div class="justify-content ms-5">
		<div id="video"></div>
	</div>
</div>




<%@ include file="/../startbootstrap-sb-admin-gh-pages/inc/bottom.jsp" %>