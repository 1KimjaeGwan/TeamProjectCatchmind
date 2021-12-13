<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result.jsp</title>
</head>
<body>
	<h1>Result Test</h1>
	<h3>pageContext : <%= pageContext.getAttribute("aaa") %></h3>
	<h3>request : <%= request.getAttribute("aaa") %></h3>
	<h3>request id : <%= request.getAttribute("id") %></h3>
</body>
</html>