<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*, java.util.*" %>
 <!-- header.jsp -->
 <% request.setCharacterEncoding("UTF-8"); %>
 <jsp:useBean id="loginMember" class="vo.MemberVO" scope="session"/>
 <jsp:useBean id="memberList" class="java.util.ArrayList" 
 type="List<MemberVO>" scope="application"/>
 
 <%
 	Cookie[] cookies = request.getCookies();
 	if(loginMember.getId() == null 
 			&&
	   !memberList.isEmpty() 
 		   &&
	   cookies != null){
 		for(Cookie c : cookies){
 			if(c.getName().equals("id")){
 				String id = c.getValue();
 				System.out.println("id : " + id);
 				String decodeId = loginMember.getDecoder(id);
 				System.out.println("decodeId : " + decodeId);
 				int index = memberList.indexOf(new MemberVO(decodeId));
 				if(index >= 0){
 					loginMember = memberList.get(index);
 					session.setAttribute("loginMember",loginMember);
 					break;
 				}
 			}
 		}
 		
 	}
 %>
 
 <ul>
 	<li><a href="index.jsp">home</a></li>
 	<%
 		if(loginMember.getName() != null){
 			// 로그인 상태
	%>
	<li><a href="index.jsp?page=info"><%=loginMember.getName()%></a>님 반갑습니다.</li>
	<li><a href="logOut.jsp">로그 아웃</a></li>
 	<%	}else{ // 비로그인 상태 %>
	<li><a href="index.jsp?page=login">로그인</a></li>
 	<li><a href="index.jsp?page=join">회원가입</a></li>
	<%
 		}
 	%>
 </ul>
 
 
 
 
 
 
 
 
 