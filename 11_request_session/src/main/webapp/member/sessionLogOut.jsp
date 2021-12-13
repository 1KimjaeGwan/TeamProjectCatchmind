<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.text.*" %>
<%
	long max = session.getMaxInactiveInterval();
	System.out.println(max);
	// session 객체의 유지 시간 설정
	// 초단위 == 30초 유지
	session.setMaxInactiveInterval(30);
	
	max = session.getMaxInactiveInterval();
	System.out.println(max);
	
	// session 생성 시간
	long create = session.getCreationTime();
	// 마지막으로 요청을 보낸 시간
	long last = session.getLastAccessedTime();
	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
	out.print("max : " + max); 
	out.print("create : " + sdf.format(new Date(create)));
	out.print("last : " + sdf.format(new Date(last)));
	// 각 session 객체 마다 부여되는 아이디 값
	String sessionId = session.getId();
	out.print("sessionId : " + sessionId+"<br/>");
	// session 영역객체에 키값으로 존재하는 속성 값 삭제
	session.removeAttribute("MEMBERUID");
	// session 객체 삭제
	// session.invalidate();
	sessionId = session.getId();
	out.print("sessionId : " + sessionId+"<br/>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionLogout.jsp</title>
</head>
<body>
	
</body>
</html>