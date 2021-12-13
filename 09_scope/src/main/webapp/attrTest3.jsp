<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attrTest3.jsp</title>
</head>
<body>
	application id : <%=application.getAttribute("id") %> <br/>
	session email : <%=session.getAttribute("email") %> <br/>
	pageContext : <%=pageContext.getAttribute("pageContextId") %>
	<br/>
	<a href="attrTest4.jsp">pageContext &amp;&amp; request</a>
</body>
</html>