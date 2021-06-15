<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp" %>
<style>
	.listBody{
		background: lightgray;
		width: 1000px;
		height: 100%;
		margin: 10px auto;
		padding-top: 20px;
		border-radius: 10px;
	}

	#titleH{
		width: 300px;
		height: 50px;
		margin: 20px auto;
		background: #212529;
		border-radius: 30px;
	}

	h2{
		font-weight: bold;
		color: white;
		text-align: center;
		padding-top: 8px;
	}
	
	.titleDiv{
		text-align:center;
	}
	
	label{
		margin: 0 10px;
		font-weight: bold;
	}
	
	.title{
		width: 350px;
		height: 30px;
		border-radius: 10px;
		border:none;
	}
	
	#content{
		margin:20px 90px;
		border-radius: 10px;
		border: none;
		font-size: 15px;
		resize: none;
	}

	.submit{
		height: 40px;
		width: 100px;
		margin: 0 450px 20px 450px;
		color: white;
		font-weight: bold;
		background: #0d6efd;
		border: none;
		border-radius: 10px;
		cursor: pointer;
	}
	
	#pwd{
		width: 200px;
		margin-left: 670px;
	}
	.pwd{
		width: 100px;
		font-size: 13px;
	}

</style>

<div class="listBody">
	<div id="titleH"><h2>���ۼ�</h2></div>
	<div>
		<div class="titleDiv">
			<label>���� : </label>
			<input type="text" name="title" class="title">&nbsp;
			<input type="checkbox" name="private" id="private">&nbsp;�����
			<div id="pwd">��й�ȣ : <input type="password" name="pwd" class="pwd"></div>
		</div>
		<textarea name="content" id="content" cols="114" rows="30"></textarea>
	</div>
	<input type="submit" value="���ε�" class="submit">
</div>
<%@ include file="bottom.jsp" %>
