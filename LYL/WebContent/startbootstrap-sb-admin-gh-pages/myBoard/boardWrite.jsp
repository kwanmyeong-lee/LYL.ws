<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/startbootstrap-sb-admin-gh-pages/inc/top.jsp"%>
<style>
	.listBody{
		background: rgb(242, 242, 242);
		width: 1000px;
		height: auto;
		margin: 10px auto;
		padding-top: 20px;
		border-radius: 10px;
	}

	#titleH{
		width: 300px;
		height: 50px;
		margin: 20px auto;
		background: #212529;
		border-radius: 30px;
	}

	h2{
		font-weight: bold;
		color: white;
		text-align: center;
		padding-top: 8px;
	}
	
	.titleDiv{
		text-align:center;
	}
	
	label{
		margin: 0 10px;
		font-weight: bold;
	}
	
	.title{
		width: 350px;
		height: 30px;
		border-radius: 10px;
		border:none;
	}
	
	#content{
		margin:20px 90px;
		border-radius: 10px;
		border: none;
		font-size: 15px;
		resize: none;
	}

	.btnList{
		margin: 10px 390px;
	}
	
	.btn11{
		height: 40px;
		width: 100px;
		color: white;
		font-weight: bold;
		background: #0d6efd;
		border: none;
		border-radius: 10px;
		cursor: pointer;
	}
	
	#pwd{
		width: 200px;
		margin-left: 670px;
	}
	.pwd{
		width: 100px;
		font-size: 13px;
	}

</style>
<script type="text/javascript" src="/../js/datatables-simple-demo.js"></script>
<script type="text/javascript">
	$(function(){
		$('#boardList').click(function(){
			location.href="boardList.jsp";
		});
		$('#submit').submit(function(){
			
		});
	});
</script>
<div class="listBody">
	<form action="boardWrite_ok.jsp" method="post" >
		<div id="titleH"><h2>게시글 작성</h2></div>
		<div class="titleDiv">
			<label>제목 : </label>
			<input type="text" name="title" class="title">&nbsp;
			<input type="checkbox" name="private" id="private">&nbsp;비공개
			<div id="pwd">비밀번호 : <input type="password" name="pwd" class="pwd" value="0"></div>
		</div>
		<textarea name="content" id="content" cols="114" rows="30"></textarea>
		<div class="btnList">
			<input type="submit" value="확인" class="btn11" id="submit">
			<input type="button" value="취소" class="btn11" id="btnCancle">
		</div>
	</form>
</div>
<%@ include file="/../startbootstrap-sb-admin-gh-pages/inc/bottom.jsp" %>
