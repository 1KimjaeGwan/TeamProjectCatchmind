<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index JSP</title>
</head>
<body>
	<a href="attrForm.jsp">속성 테스트</a>
	<h3>애플리케이션 id : <%= application.getAttribute("id") %></h3>
	<h3>pageContext id : <%= pageContext.getAttribute("pageContextId") %></h3>
</body>
</html>