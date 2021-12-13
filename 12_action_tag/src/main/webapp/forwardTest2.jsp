<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forwardTest2.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String resultPage = request.getParameter("resultPage");
		System.out.println("resultPage : " + resultPage);
		//response.sendRedirect(resultPage);
	%>
	<jsp:forward page="<%= resultPage %>" >
		<jsp:param name="tel" value="010-1234-6789" />
	</jsp:forward>
</body>
</html>









