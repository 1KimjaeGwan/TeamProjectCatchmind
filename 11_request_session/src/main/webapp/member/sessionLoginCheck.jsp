<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberId = (String)session.getAttribute("MEMBERUID");
	boolean isLogin = (memberId != null) ? true : false;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionLoginCheck.jsp</title>
</head>
<body>
	<% if(isLogin){ %>
		아이디 : <%=memberId %> 로그인 상태 |
		<a href="sessionLogOut.jsp">로그아웃</a>
	<% }else{ %>
		<script>
			alert("로그인 하지 않은 상태");
			location.href='sessionLogin.jsp';
		</script>
	<% } %>	
</body>
</html>