<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, vo.*" %>
<!-- loginCheck.jsp -->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="memberList" class="java.util.ArrayList" 
			 type="List<MemberVO>" scope="application"/>
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session"/>
<jsp:setProperty name="loginMember" property="*"/>

<%
	String login = request.getParameter("login");


	int index = memberList.indexOf(loginMember);
	MemberVO sessionMember = (index >= 0) ? memberList.get(index) : null;
	System.out.println(sessionMember);
	System.out.println(loginMember);
	if(sessionMember != null 
			&& 
	loginMember.getPass().equals(sessionMember.getPass())){
		// 로그인 성공
		System.out.println("login : "+ login);
		if(login != null){
			String id = loginMember.getEncoder(loginMember.getId());
			System.out.println("encoded id : " + id);
			System.out.println("decoded id : " + loginMember.getDecoder(id));
			Cookie cookie = new Cookie("id",id);
			cookie.setMaxAge(60 * 60 * 24 * 7);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
		session.setAttribute("loginMember", sessionMember);
		out.print("<script>alert('로그인 성공');location.href='index.jsp';</script>");
	}else{
		// 로그인 실패
		session.removeAttribute("loginMember");
		out.print("<script>alert('로그인 실패');history.go(-1);</script>");
	}
%>
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 