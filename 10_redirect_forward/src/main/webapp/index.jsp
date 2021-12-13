<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INDEX JSP</title>
</head>
<body>
	<!--
		response : sendRedirect
		request(dispatcher) : forward
	-->
	<%
		pageContext.setAttribute("aaa","11111");
		request.setAttribute("aaa","2222");
	%>
	
		<h3><%= pageContext.getAttribute("aaa") %></h3>
		<h3><%= request.getAttribute("aaa") %></h3>
		<a href="response?id=chlrlrms">response send redirect</a>
		<br/>
		<form action="response" method="POST">
			<input type="text" name="id" value="chlrlrms"/>
			<button>확인</button>
		</form>
		<br/>
		<a href="dispatcher?id=chlrlrms">dispatcher forward</a>
</body>
</html>