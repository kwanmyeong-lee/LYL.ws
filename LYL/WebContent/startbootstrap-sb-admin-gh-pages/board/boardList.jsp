<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="board.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/startbootstrap-sb-admin-gh-pages/inc/top.jsp"%>

<style>
	.listBody{
		width: 1000px;
		height: 700px;
		margin: 10px auto;
		padding-top: 20px;
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

	table{
		width: 1000px;
		border-collapse: collapse;
	}
	
	th{
		text-align: center;
	}
	
	th > div{
		background: lightgray;
		height: 35px;
		padding-top: 5px;
		margin: 10px 5px;
		border-radius: 30px;
		
	}
	
	td{
		height: 40px;
		background: rgb(242, 242, 242);
		border-radius: 30px;
		text-align: center;
	}
	
	.upload{
		width: 90px;
		height: 40px;
		float: right;
		color: white;
		font-weight: bold;
		border-radius: 30px;
		background: #0d6efd;
		border: 0px;
		
	}
</style>

<%
	//[1] myPage.jsp���� [�Խ���]��ư Ŭ���ؼ� get������� �̵�
	// 1. �Ķ���� �о����
	
	// 2. DB
	BoardDAO dao = new BoardDAO();
	List<BoardVO> list = null;
	try{
		list=dao.selectAllBoard();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3.
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");   
	
%>
<div class="listBody">
	<button class="upload">�۾���</button>
	<div class="titleH"><h3>�Խ���</h3></div>
	<table class="box2">
		<colgroup>
			<col style="width:9%;" />
			<col style="width:54%;" />
			<col style="width:14%;" />
			<col style="width:9%;" />
			<col style="width:9%;" />      
		</colgroup>
		<thead>
			<tr>
				<th scope="col"><div>��ȣ</div></th>
				<th scope="col"><div>����</div></th>
				<th scope="col"><div>�ۼ���</div></th>
				<th scope="col"><div>�ۼ���</div></th>
				<th scope="col"><div>��ȸ��</div></th>
			</tr>
		</thead> 
		<tbody>
			<!-- �Խñ��� ���� ��� -->
			<%if(list==null || list.isEmpty()){ %>
		         <tr>
		            <td colspan="5" class="align_center">�����Ͱ� �����ϴ�.</td>
		         </tr>
	     	 <%}else{ %>
					<!-- �Խñ��� ���� ��� -->
				<% for(int i=0;i<list.size() ;i++){ 
	     	 		BoardVO vo = list.get(i); %>
					<tr>
						<td><%=vo.getBoMyNo() %></td>
						<td><%=vo.getBoTitle() %></td>
						<td><%=vo.getUserNo() %></td>
						<td><%=sdf.format(vo.getBoDate()) %></td>
						<td><%=vo.getBoHits() %></td>
					</tr>
				<% } //for%>
			<%}//if %>
		</tbody>
	</table>
</div>
   <%@ include file="/../startbootstrap-sb-admin-gh-pages/inc/bottom.jsp" %>