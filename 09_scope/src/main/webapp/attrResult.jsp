<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attrResult.jsp</title>
</head>
<body>
	pageContext : <%=pageContext.getAttribute("aaa") %>
	request : <%=request.getAttribute("bbb") %>
	session : <%=session.getAttribute("email") %>
	application : <%=application.getAttribute("id") %>
</body>
</html>