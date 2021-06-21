<%@page import="video.VideoVO"%>
<%@page import="video.VideoDAO"%>
<%@page import="src.common.Utility"%>
<%@page import="java.sql.SQLException"%>
<%@page import="src.myuser.MyuserVO"%>
<%@page import="src.myuser.MyuserDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String saveDir = application.getRealPath(Utility.VIDEO_UPLOAD_PATH);

int maxSize = 100 * 1024 * 1024;
String msg = "업로드 실패", url = "/startbootstrap-sb-admin-gh-pages/userPage/videoUp.jsp";
try {
	MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "utf-8", new DefaultFileRenamePolicy());
	System.out.println("업로드 완료");

	String fileName = mr.getFilesystemName("upfile");
	String originalFileName = "";
	long fileSize = 0;
	if (fileName != null && !fileName.isEmpty()) {
		originalFileName = mr.getOriginalFileName("upfile");
		File file = mr.getFile("upfile");
		fileSize = file.length();
	}
	
	String vidTitle = mr.getParameter("title");
	String vidurl = mr.getParameter("vidurl");
	String vidEx = mr.getParameter("content");
	String vidTheme = mr.getParameter("theme");
	String userNo =(String) session.getAttribute("userNo");
	String vidThu = mr.getParameter("vidurl");
	
	VideoDAO dao = new VideoDAO();
	VideoVO vo = new VideoVO();
	
	vo.setVidTitle(vidTitle);
	vo.setVidurl(vidurl);
	vo.setVidEx(vidEx);
	vo.setVidTheme(Integer.parseInt(vidTheme));
	vo.setUserNo(Integer.parseInt(userNo));
	vo.setVidThu(vidThu);
	
	
	int cnt = 0;
	System.out.println("회원 수정 여부" + cnt);
	
	if(cnt>0){
		msg = "비디오 업로드 성공!";
		url = "/startbootstrap-sb-admin-gh-pages/login/login.jsp";
	}
} catch (SQLException e) {
	e.printStackTrace();
}

request.setAttribute("msg", msg);
request.setAttribute("url", url);
%>

<jsp:forward page="/startbootstrap-sb-admin-gh-pages/common/message.jsp"></jsp:forward>
