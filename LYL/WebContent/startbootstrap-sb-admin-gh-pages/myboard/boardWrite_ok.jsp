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

		String userid = (String) session.getAttribute("userid");

		//write.jsp���� post������� �����
		//1.
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		//ip �о����
		String ip = request.getRemoteAddr();
		String ip2 = request.getRemoteHost();
		System.out.println("ip="+ip+", ip2="+ip2);
		
		//2.
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		vo.setBoTitle(title);
		/* vo.setUserNo(userNo); */ //userid�� �޾ƿð����� no�� �޾ƿð�����
		vo.setBoCon(content);
		try{
			int cnt = dao.insertBoard(vo);
			
			//3.
			if(cnt>0){ %>
				<script type="text/javascript">
				 	alert('���ۼ� �Ϸ� �Ǿ����ϴ�.');
			        location.href="boardList.jsp";
		        </script>
			<%}else{ %>
				<script type="text/javascript">
					alert('���ۼ� ���� �Ǿ����ϴ�.');
					history.back();
				</script>
			<%}
		}catch (SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>