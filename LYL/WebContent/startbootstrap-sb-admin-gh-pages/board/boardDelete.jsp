boardDelete.jsp<%@page import="java.sql.SQLException"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String boNo=request.getParameter("boNo");
	
		//2
		BoardDAO dao = new BoardDAO();
		
		try{
			int cnt=dao.deleteBoard(Integer.parseInt(boNo));
			if(cnt>0){ %>
			<script type="text/javascript">
			 	alert('�ۻ��� ó�� ����');
		        location.href="boardList.jsp";
	        </script>
		<%}else{ %>
			<script type="text/javascript">
				alert('�ۻ��� ó�� ����');
				history.back();
			</script>
		<%}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>