<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attrTest4.jsp</title>
</head>
<body>
	<%
		pageContext.setAttribute("aaa","1111");
		request.setAttribute("bbb","2222");
	%>
	
pageContext : <%=pageContext.getAttribute("aaa") %>
request : <%=request.getAttribute("bbb") %>
session : <%=session.getAttribute("email") %>
application : <%=application.getAttribute("id") %>
	
	<%
		RequestDispatcher rd = request.getRequestDispatcher(
				"attrResult.jsp"
		);
		rd.forward(request,response);
	%>
	<!-- <a href="attrResult.jsp">결과 확인</a> -->
</body>
</html>