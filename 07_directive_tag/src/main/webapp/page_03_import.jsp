<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Calendar" %>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page_03_import.jsp</title>
</head>
<body>
<%
	java.util.Calendar cal = Calendar.getInstance();
	int hour = cal.get(Calendar.HOUR_OF_DAY);
	int minute = cal.get(Calendar.MINUTE);
	int second = cal.get(Calendar.SECOND);
	
	SimpleDateFormat sdf = new SimpleDateFormat("HH시 mm분 ss초");
%>
	현재시간(Calendar) : <%= hour %>시 <%= minute %>분 <%= second %>초 <br/>
	현재시간(Formmater) : <%= sdf.format(new Date()) %>
</body>
</html>