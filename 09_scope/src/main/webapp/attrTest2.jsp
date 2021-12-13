<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attrTest2.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		session.setAttribute("email", email);
	%>
	<h3>request param : <%=email %></h3>
	<h3><%= session.getAttribute("email") %> : session 저장 완료</h3>
	<h3>pageContext 정보 확인 : <%= pageContext.getAttribute("pageContextId") %></h3>
	<a href="attrTest3.jsp">확인하러 가기</a>
</body>
</html>