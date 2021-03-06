<%@page import="java.util.List"%>
<%@page import="bocomment.BoCommentVO"%>
<%@page import="bocomment.BoCommentDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/../startbootstrap-sb-admin-gh-pages/inc/top.jsp"%>
<style>
	.listBody{
		width: 1000px;
		height: auto;
		margin: 10px 13%;
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
		margin-top: 5px;
		font-weight: bold;
		margin-left: 50px;
		float: left;
	}
	.userIdLabel{
		margin-top: 5px;
		font-weight: bold;
		font-size: 15px;
		margin-left: 35px;
		float: left;
	}
	#title{
		background: white;
		border: none;
	}
	.title{
		margin: 10px auto;
		padding: 7px;
		width: 700px;
		height:40px;
		background: white;
		border-radius: 10px;
	}
	.userName{
		float:left;
		font-size: 15px;
		width: 150px;
		height:20px;
		margin: 6px 0px 5px 15px;
		border: none;
		background: none;
	}
	.regdateLabel{
		float: right;
	}
	.regdate{
		width: 110px;
		height:20px;
		margin: 2px 10px;
		float: right;
		font-size: 12px;
		background: none;
		border: none;
	}
	.contentDiv{
		margin: 0 auto;
		width:850px;
	}
	.content{
		margin: 0 auto;
		padding: 10px;
		width:850px;
		background: white;
		height: 500px;
		border-radius: 10px;
		resize: none;
	}
	
	button{
		border-radius: 10px;
	}
	.btn11{
		margin: 0 400px;
	}
	.btn22{
		border-radius: 10px;
		background: #0d6efd;
		color:white;
		border:none;
	}
	.commentList > h5{
		margin-left: 75px;
	}
	
	.commentInsert{
		margin: 0 80px 20px 80px;
	}
	
	.submit{
		float:right;
		width: 100px;
		height: 80px;
		border-radius: 10px;
		background: #0d6efd;
		color: white;
		border:none;
	}
	
	#content{
		width: 790px;
		height: 450px;
		margin:20px;
		border-radius: 10px;
		border: none;
		font-size: 15px;
		resize: none;
	}
	
	.commentList{
		width: 840px;
		margin: 15px 80px;
		background: #A3A3A3;
		border-radius: 15px;
		padding: 15px;
	}
	table{
		width:800px;
	}
	td{
		background: white;
		height: 60px;
		border-bottom: 1px solid gray;
		text-align: center;
	}
	.commentTd{
		text-align: left;
		padding-left: 15px;
	}
	textarea{
		background: white;
		resize: none;
	}
	
	.bcDeleteBtn{
		font-size:12px;
		font-weight:bold;
		float:right;
		background: rgb(242, 242, 242);
		border-radius:4px;
		border:none;
		margin: 5px;
		
	}
</style>
<%
	String userId=(String)session.getAttribute("userid");
	String boNo = request.getParameter("boNo");
	String userNo = request.getParameter("userNo");
	
	if(boNo==null || boNo.isEmpty()){ %>
		<script type="text/javascript">
			alert("????????? url?????????.");
			location.back();
		</script>	
	<% return;
	}
	//2
	BoardDAO dao = new BoardDAO();
	BoardVO vo = null;
	try{
		vo=dao.selectByNo(Integer.parseInt(boNo));
	} catch(SQLException e){
		e.printStackTrace();
	}
	//3
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm"); 
	
	//===============comment
	//2
	BoCommentDAO commDao = new BoCommentDAO();
	List<BoCommentVO> list = null;
	try{
		list= commDao.selectByBoComment(Integer.parseInt(boNo));
	} catch(SQLException e){
		e.printStackTrace();
	}
%>
<script type="text/javascript" src="/../js/datatables-simple-demo.js"></script>
<script type="text/javascript">
	$(function(){
		$('#boardEdit').click(function(){
			location.href="boardEdit.jsp?boNo=<%=vo.getBoNo()%>&userNo=<%=userNo%>";
		});
		$('#boardDelete').click(function(){
			location.href="boardDelete.jsp?boNo=<%=vo.getBoNo()%>&userNo=<%=userNo%>";
		});
		$('#boardList').click(function(){
			location.href="boardList.jsp?boNo=<%=vo.getBoNo()%>&userNo=<%=userNo%>";
		});
		
		
		$('.bcDeleteBtn').click(function(){
			var delComm=confirm('????????? ??????????????????????');
			var vvvv =$(this).next('.hiddenbcNo').val();
			if(!delComm){
				event.preventDefault();
				location.href="boardDetail.jsp?boNo=<%=boNo%>&userNo=<%=userNo%>"
				return false;
			}else{
				location.href="bo_CommentDelete_ok.jsp?bcNo="+vvvv+"&boNo=<%=boNo%>&userNo=<%=userNo%>";
			}
			
		});
		
		
		
	});
</script>
<div class="listBody">
<input type="hidden" name="boNo" value="<%=boNo%>">
	<div class="titleH"><h3>?????????</h3></div>
		<div class="detailBlock">
			<label class="titleLabel">?????? : </label>
			<div class="title">
				<input type="text" name="title" id="title" value="<%=vo.getBoTitle() %>" disabled>
			</div>
				<label class="userIdLabel">????????? : </label>
				<input type="text" name="userid" class="userName" value="<%=vo.getUserId() %>" disabled>
				<input type="text" name="regdate" class="regdate" value="<%=sdf.format(vo.getBoDate()) %>" disabled>
				<label class="regdateLabel"> ????????? : </label><br><br>
			<div class="contentDiv">
				<div class="content" >
					<textarea rows="114" cols="30" name="content" id="content" disabled><%=vo.getBoCon() %></textarea> 
				</div>
			</div>
		</div>
		<div class="btn11">
			<input type="button" value="??????" id="boardEdit" class="btn22">
			<input type="button" value="??????" id="boardDelete" class="btn22">
			<input type="button" value="??????" id="boardList" class="btn22">
		</div>
		<div class="commentList">
			<!-- ?????? ?????? ?????? -->
			<!-- ???????????? ?????????@@@@@@@@ -->
			<table>
				<colgroup>
					<col style="width:20%;"/>
					<col style="width:60%;"/>
					<col style="wdith:10%;"/>
				</colgroup>
				<tbody>
				<%for(int i=0;i<list.size(); i++){ 
					BoCommentVO commVo = list.get(i);
				%>
					<tr>
						<td><%=commVo.getUserId() %></td>
						<td class="commentTd">
							<%=commVo.getBcCom() %>
							<%if(userId.equals(commVo.getUserId())) {%>
								<input type="button" class="bcDeleteBtn" value="??????">
								<input type="hidden" class="hiddenbcNo" value="<%=commVo.getBcNo()%>">
							<%}else{ %>
								<input type="hidden" class="bcDeleteBtn">
							<%} %>
						</td>
						<td><%=sdf.format(commVo.getBcDate()) %></td>
						
					</tr>
				<%} %>
				</tbody>
			</table>
		</div>
		<div class="commentInsert">
			<form action="bo_CommentWrite_ok.jsp" method="post" id="frmComm">
				<input type="hidden" value="<%=userNo %>" name="userNo">
				<input type="hidden" value="<%=boNo %>" name="boNo">
				<!-- ?????? ?????? -->
				<span class="comment">
				<textarea rows="3" cols="100" class="comment" name="comment" ></textarea> 
					<input type="submit" class="submit" value="??????">
				</span>
			</form>
		</div>
</div>
	
<%@ include file="/../startbootstrap-sb-admin-gh-pages/inc/bottom.jsp" %>