<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../error/error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page_error.jsp</title>
</head>
<body>
	<%
		String s = request.getParameter("aa");
		out.println(Integer.parseInt(s));
	%>
</body>
</html>