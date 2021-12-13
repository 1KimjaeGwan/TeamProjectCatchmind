<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinCheck.jsp</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="joinMember" class="vo.UserVO" scope="application"/>
	<jsp:setProperty property="*" name="joinMember"/>
	<%= application.getAttribute("joinMember") %>
	<script>
		alert("회원가입 완료");
		location.href="login.jsp";
	</script>
</body>
</html>