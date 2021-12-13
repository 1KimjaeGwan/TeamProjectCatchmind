<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="joinMember" class="vo.UserVO" scope="session"/>     
<jsp:useBean id="loginMember" class="vo.UserVO" scope="session"/>
<%
	request.setCharacterEncoding("UTF-8");
	Cookie[] cookies = request.getCookies();
	if(cookies != null && joinMember.getId() != null && loginMember.getId() != null){
		for(int i=0; i<cookies.length; i++){
			System.out.println(cookies[i].getName()+":"+cookies[i].getValue());
			if(cookies[i].getName().equals("id") && cookies[i].getValue().equals(joinMember.getId())){
				session.setAttribute("loginMember", joinMember);
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>index.jsp</h1>
	<%
		String name = loginMember.getName();
		if(name != null){
	%>
		<%=name%>님 방가방가 | <a href="logOut.jsp">로그아웃</a>	
	<%
		}else{
    %>
	<a href="login.jsp">로그인</a> | <a href="join.jsp">회원가입</a>    
    <%	
		}
	%>
	
</body>
</html>