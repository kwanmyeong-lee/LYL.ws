<%@page import="board.BoardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>countUpdate.jsp</title>
</head>
<body>
<%
   //list.jsp에서 [제목]클릭하면 get방식으로 이동
   //=> http://localhost:9090/mystudy/board/countUpdate.jsp?no=5
   //1
   String boNo=request.getParameter("boNo");
   String userNo=request.getParameter("userNo");
   System.out.println(userNo);
   if(boNo==null || boNo.isEmpty()){ %>
      <script type="text/javascript">
         alert('잘못된 url입니다.');
         location.back();
      </script>
      
   <%   return;
   }
   
   //2
   BoardDAO dao = new BoardDAO();
   
   try{
      int cnt=dao.updateReadCount(Integer.parseInt(boNo));   
      //3
      if(cnt>0){
         response.sendRedirect("boardDetail.jsp?boNo="+boNo+"&userNo="+userNo);
      }else{ %>
         <script type="text/javascript">
            alert('조회수 증가 실패');
            history.back();
         </script>   
   <%   }
   }catch(SQLException e){
      e.printStackTrace();
   }
   
   
%>
</body>
</html>