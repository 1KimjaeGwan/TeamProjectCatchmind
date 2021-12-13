<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>includeTest2.jsp</title>
</head>
<body>
	<hr/>
	<h1>여기는 include test2.jsp 입니다.</h1>
	<%
		request.setCharacterEncoding("UTF-8");
		String name= request.getParameter("name");
		out.println("name : " + name);
	%>
</body>
</html>