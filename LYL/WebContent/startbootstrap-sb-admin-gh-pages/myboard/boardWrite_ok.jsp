<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//write.jsp에서 post방식으로 서브밋
	//1.
	request.setCharacterEncoding("utf-8");
	String userNo = request.getParameter("userNo");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String userId =(String) session.getAttribute("userid");
	 
	//2.
	BoardDAO dao = new BoardDAO();
	BoardVO vo =  new BoardVO();
	vo.setBoTitle(title);
	vo.setBoCon(content);
	vo.setUserNo(Integer.parseInt(userNo));
	vo.setUserId(userId);
	try {
		int cnt=dao.insertBoard(vo, Integer.parseInt(userNo));
		//3.
		if (cnt > 0) {
			%>
			<script type="text/javascript">
				alert('글쓰기 처리 되었습니다');
				location.href = "boardList.jsp?userNo="+<%=userNo%>;
			</script>
		<%} else {%>
			<script type="text/javascript">
				alert('글쓰기처리 실패');
				history.back();
			</script>
		<%}
	} catch (SQLException e) {
		e.printStackTrace();
	}%>
</body>
</html>