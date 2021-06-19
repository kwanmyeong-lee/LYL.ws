<%@page import="java.sql.SQLException"%>
<%@page import="src.watchrecord.watchrecordService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="myuserService" class="src.myuser.MyuserService" scope="session"></jsp:useBean>
	<%
	String userNo = (String) session.getAttribute("userNo");
	System.out.println(userNo);
	String vidNo = request.getParameter("vidno");
	watchrecordService watService = new watchrecordService();

	int cnt = 0;
	String msg = "다시보기 목록에 저장실패!", url = "/startbootstrap-sb-admin-gh-pages/videoBundle/videoWatch.jsp?vidno=" + vidNo;
	try {
		cnt = watService.insertWatchrecord(userNo, vidNo);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	if (cnt > 0) {
		msg = "다시보기 목록에 저장완료!";
		url = "/startbootstrap-sb-admin-gh-pages/videoBundle/videoWatch.jsp?vidno=" + vidNo;
	}
	%>
	<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>