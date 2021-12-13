<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SECOND</title>
</head>
<body>
	<h2>SECOND</h2>
	<%
		// 자바가 작성되는 공간
		String num = request.getParameter("name");
		out.print("num : " + num);
	%>
</body>
</html>