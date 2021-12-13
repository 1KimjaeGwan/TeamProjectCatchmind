<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberSession.jsp</title>
</head>
<body>
	<%
		vo.MemberVO vo = (vo.MemberVO)session.getAttribute("vo");
		out.println(vo);
	%>
	<br/>
	<jsp:useBean id="sessionMember" class="vo.MemberVO" scope="session" />
	아이디 : <jsp:getProperty property="id" name="sessionMember"/> <br/>
	비밀번호 : <jsp:getProperty property="pw" name="sessionMember"/> <br/>
	이름 : <jsp:getProperty property="name" name="sessionMember"/> <br/>
	이메일 : <jsp:getProperty property="email" name="sessionMember"/> <br/>
	주소 : <jsp:getProperty property="addr" name="sessionMember"/> <br/>
	
	<a href="member.jsp">돌아가기</a>
</body>
</html>