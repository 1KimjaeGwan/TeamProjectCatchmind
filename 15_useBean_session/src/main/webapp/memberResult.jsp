<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberResult.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");
		vo.MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPw(pw);
		vo.setName(name);
		vo.setEmail(email);
		vo.setAddr(addr);
		session.setAttribute("vo",vo);
	%>
	
	<%= session.getAttribute("vo") %>
	<br/>
	<jsp:useBean id="sessionMember" class="vo.MemberVO" scope="session" >
		<%-- <jsp:setProperty name="sessionMember" property="id" />
		<jsp:setProperty name="sessionMember" property="pw" />
		<jsp:setProperty name="sessionMember" property="name" />
		<jsp:setProperty name="sessionMember" property="email" />
		<jsp:setProperty name="sessionMember" property="addr" /> --%>
	</jsp:useBean>
	<jsp:setProperty property="*" name="sessionMember"/>
	
	<a href="memberSession.jsp">session 확인</a>
</body>
</html>