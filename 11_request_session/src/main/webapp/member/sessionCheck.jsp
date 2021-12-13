<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionCheck.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if(id.equals(pw)){
			// 로그인 성공
			session.setAttribute("MEMBERUID", id);
	%>
	<a href="sessionLogout.jsp">로그 아웃</a>	|
	<a href="sessionLoginCheck.jsp">로그인 체크</a>
	
	<%	}else{ 	// 로그인 실패 %>
		<script>
			alert("로그인 실패");
			history.go(-1);
		</script>
<% 		}%>
</body>
</html>