<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>direct.jsp</title>
</head>
<body>
	<%
		String num = request.getParameter("num");
		response.getWriter().print("<h1>"+num+"</h1>");
		out.print("<h2>"+num+"</h2>");
	%>
	다이렉트 num = <%= num %>
</body>
</html>