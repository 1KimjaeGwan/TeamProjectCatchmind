<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index JSP</title>
</head>
<body>
	<!-- 
		디렉티브 include 지시어
		한개의 Servlet 파일에 작성되어
		파일이 틀려도 변수를 같이 사용할 수 있음. 
	-->
	<%@ include file="common/header.jsp" %>
	<h1> INDEX JSP | <%=s%></h1>
	<%@ include file="default.jsp" %>
	<%@ include file="common/footer.jsp" %>
</body>
</html>