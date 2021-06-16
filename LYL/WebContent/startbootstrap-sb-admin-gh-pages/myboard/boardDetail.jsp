<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/../startbootstrap-sb-admin-gh-pages/inc/top.jsp"%>
<style>
	.listBody{
		width: 1000px;
		height: auto;
		margin: 10px auto;
		padding-top: 20px;
		background: rgb(242, 242, 242);
		border-radius: 30px;
	}
	.titleH{
		clear: both;
		width: 300px;
		height: 50px;
		margin: 10px auto;
		background: #212529;
		border-radius: 30px;
	}
	.titleH h3{
		font-weight: bold;
		color: white;
		text-align: center;
		padding-top: 8px;
	}
	.detailBlock{
		width:900px;
		margin: 20px auto;
	}
	.titleLabel{
		margin: 5px 30px;
		float: left;
	}
	.title{
		margin: 10px 90px;
		width: 700px;
		height:40px;
		background: black;
	}
	.userName{
		position:absolute;
		top:178px;
		left: 450px;
		float:left;
		font-size: 12px;
		width: 150px;
		height:20px;
		margin: 0 10px;
		background: white;
	}
	.regdateLabel{
		position:absolute;
		left: 1110px;
		top:175px;
	
	}
	.regdate{
		position:absolute;
		left: 1170px;
		top:178px;
		width: 110px;
		height:20px;
		margin: 0 10px;
		background: white;
		float: right;
		font-size: 12px;
	}
	.contentDiv{
		margin: 0 auto;
		width:850px;
	}
	.content{
		margin: 0 auto;
		width:850px;
		height: 500px;
		border-radius: 10px;
	}
	
	.btn{
		margin: 0 400px;
	}
	
	.commentList > h5{
		margin-left: 70px;
	}
</style>
<div class="listBody">
	<div class="titleH"><h3>게시판</h3></div>
		<div class="detailBlock">
			<label class="titleLabel">제목 : </label>
			<div class="title"><!-- 제목 --></div>
			<div class="userName"><a><!-- 유저이름 --></a></div>
			<div class="regdate"><!-- 등록일 --></div>
			<label class="regdateLabel"> 등록일 : </label><br><br>
			<div class="contentDiv">
				<textarea class="content" name="content"><!-- 내용 --></textarea>
			</div>
		</div>
		<div class="btn">
			<button>수정</button>
			<button>삭제</button>
			<button>목록</button>
		</div>
		<div class="commentList">
			<h5>댓글</h5>
			<!-- 댓글 목록 반복 -->
			<!-- 테이블로 만들기@@@@@@@@ -->
		</div>
		<div class="commentInsert">
			<!-- 댓글 입력 -->
			<span class="commentUser"><!-- 댓글 달 유저이름 --></span>
			<span class="comment">
			<textarea rows="3" cols="100"></textarea> 
			input
			</span>
		</div>
</div>
<%@ include file="/../startbootstrap-sb-admin-gh-pages/inc/bottom.jsp" %>