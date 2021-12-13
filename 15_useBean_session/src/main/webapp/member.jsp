<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member.jsp</title>
</head>
<body>
	<form action="memberResult.jsp" method="POST">
		아이디 : <input type="text" name="id" required /> <br/>
		비밀번호 : <input type="password" name="pw" required/> <br/>
		이름 : <input type="text" name="name" /> <br/>
		이메일 : <input type="email" name="email" /> <br/>
		주소 : <input type="text" name="addr" /> <br/>
		<button>확인</button>
	</form>
</body>
</html>