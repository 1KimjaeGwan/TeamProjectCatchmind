<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
</head>
<body>
	<h3>Error Page</h3>
	<h3>알 수 없는 오류가 발생하였습니다. ㅈㅅㅈㅅ ㅃㅃ</h3>
	<a href="index.jsp">메인으로 돌아가기</a>
	<%= exception.getMessage() %>
</body>
</html>