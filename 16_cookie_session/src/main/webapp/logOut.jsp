<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logOut.jsp</title>
</head>
<body>
	<%
		// session.removeAttribute("loginMember");
		// CDC77E1A0BBC42DF101B8317DB13B5D5
		session.invalidate();
		// 73637A354D85D0C7030CCC86879588F7
		System.out.println(session.getId());
		// 73637A354D85D0C7030CCC86879588F7
		// Cookie 삭제
		Cookie cookie = new Cookie("id","");
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
	%>
	<script>
		alert('로그아웃 성공');
		location.href="index.jsp";
	</script>
</body>
</html>