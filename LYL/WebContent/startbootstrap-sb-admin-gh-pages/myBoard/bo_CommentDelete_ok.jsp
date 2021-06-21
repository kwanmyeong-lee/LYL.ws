<%@page import="java.sql.SQLException"%>
<%@page import="bocomment.BoCommentVO"%>
<%@page import="bocomment.BoCommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1
	request.setCharacterEncoding("utf-8");
	String boNo=request.getParameter("boNo");
	String bcNo=request.getParameter("bcNo");
	String userId="textComm";
	
	System.out.println(boNo);
	//2 
	BoCommentDAO dao = new BoCommentDAO();
	
	try{
		int cnt = dao.deleteBoComment(userId, Integer.parseInt(bcNo));
		if(cnt>0){ %>
			<script type="text/javascript">
				confirm('댓글을 삭제 하시겠습니까?');
				location.href="boardDetail.jsp?boNo=<%=boNo%>";
			</script>
		<%}else{%>
			<script type="text/javascript">
				alert("댓글 삭제 처리에 실패하였습니다.");
				location.back();
			</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
