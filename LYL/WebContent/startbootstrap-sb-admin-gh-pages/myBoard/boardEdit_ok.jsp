<%@page import="java.sql.SQLException"%>
<%@page import="board.BoardVO"%>
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
	//session으로 사용자아이디 받기
		String userId = "이름";
		String boNo = request.getParameter("boNo");
		String title = request.getParameter("title");
		//String pwd = request.getParameter("pwd");
		String pwd = "0";
		String content = request.getParameter("content");
			
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		vo.setBoNo(Integer.parseInt(boNo));
		vo.setBoTitle(title);
		vo.setBoCon(content);
		vo.setUserId(userId);
		vo.setBoPwd(Integer.parseInt(pwd));
		
		try{
			dao.editBoard(vo);
		} catch(SQLException e){
			e.printStackTrace();
		}
%>
</body>
</html>