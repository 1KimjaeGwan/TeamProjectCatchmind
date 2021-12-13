<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionLogin.jsp</title>
</head>
<body>
	<form action="sessionCheck.jsp" method="POST">
		아이디 : <input type="text" name="id"/> <br/>
		비밀번호 : <input type="password" name="pw"/> <br/>
		<button>로그인</button>
	</form>
</body>
</html>