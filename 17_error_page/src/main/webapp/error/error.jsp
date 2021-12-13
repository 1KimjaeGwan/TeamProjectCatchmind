<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error.jsp</title>
</head>
<body>
	<h1>Error Page</h1>
	<h2>내부 공사중...</h2>
	<h3>서비스 진행 중 문제가 있습니다. 이용에 불편을 드려 죄송합니다.</h3>
	<h3><%=exception.getMessage() %></h3>
	<h3><%=exception.toString() %></h3>
	<a href="../index.jsp">메인으로</a>
</body>
</html>