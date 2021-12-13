<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="page_error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page_04_error.jsp</title>
</head>
<body>
	<!--
		errorPage : jsp에서 생성된 servlet class에서
		exception가 발생했을때 사용자에게 오류에 대한 정보를
		출력할 수 있는 페이지를 지정하는 속성
	 -->
	 <%
		String str = request.getParameter("name");
	 	out.println(str.toString());
	 %>
</body>
</html>