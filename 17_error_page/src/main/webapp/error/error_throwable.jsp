<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error_throwable.jsp</title>
</head>
<body>
	<h1>Throwable Error</h1>
	<h3><%=exception.getMessage() %></h3>
	<a href="../index.jsp">메인으로</a>
</body>
</html>