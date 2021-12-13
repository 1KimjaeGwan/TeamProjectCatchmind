<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- logOut.jsp -->
<%
	Cookie cookie = new Cookie("id","");
	cookie.setMaxAge(0);
	cookie.setPath("/");
	response.addCookie(cookie);
	session.removeAttribute("loginMember");
%>
<script>
	alert("처리 완료");
	location.href="index.jsp";
</script>







