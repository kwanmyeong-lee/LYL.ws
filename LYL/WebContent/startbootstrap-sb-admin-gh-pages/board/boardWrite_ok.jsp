<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.SQLException"%>
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
	//write.jsp���� post������� �����
	//1.
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String content = request.getParameter("content");

	//ip �о����
	String ip = request.getRemoteAddr();
	String ip2 = request.getRemoteHost();
	System.out.println("ip=" + ip + ", ip2=" + ip2);

	//2.
	BoardDAO dao = new BoardDAO();
	BoardVO vo =  new BoardVO();
	vo.setBoTitle(title);
	vo.setBoCon(content);
	try {

		//3.
		if (cnt > 0) {
	%>
	<script type="text/javascript">
		alert('�۾��� ó�� �Ǿ����ϴ�');
		location.href = "list.jsp";
	</script>
	<%
	} else {
	%>
	<script type="text/javascript">
		alert('�۾���ó�� ����');
		history.back();
	</script>
	<%
	}
	} catch (SQLException e) {
	e.printStackTrace();
	}
	%>
</body>
</html>