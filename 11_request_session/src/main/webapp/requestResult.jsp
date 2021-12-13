<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>requestResult.jsp</title>
</head>
<body>
<%
	String encoding = request.getCharacterEncoding();
	out.println("encoding : " + encoding+"<br/>");
	
	request.setCharacterEncoding("UTF-8");
	encoding = request.getCharacterEncoding();
	out.println("encoding : " + encoding+"<br/>");
	
	String contextPath = request.getContextPath();
	out.print("contextPath : "+ contextPath);
	out.print("<br/>");
	
	String requestURI = request.getRequestURI();
	out.print("requestURI : " + requestURI);
	out.print("<br/>");
	
	String queryString = request.getQueryString();
	out.println("query String : " + queryString);
	out.print("<br/>");
	
	String contentType = request.getContentType();
	out.println("contentType : " + contentType);
	out.print("<br/>");
	
	String ip = request.getRemoteAddr();
	out.print(ip + "<br/>");
	
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String[] hobbys = request.getParameterValues("hobby");
%>
이름은 : <%=name%> <br/>
성별은 : <% if(gender.equals("male")){ %>
남성
<%}else{ %>
여성
<%} %>
<br/>
취미는 : 
<% for(String s : hobbys){ %>
	<%=s%>&nbsp;&nbsp;&nbsp; 
<%} %>
<br/>
<%
	Enumeration<String> names = request.getParameterNames();
	// 검색할 요소(name)가 존재하면 true 
	while(names.hasMoreElements()){
		out.print(names.nextElement()+"<br/>");
	}
	
	Map<String, String[]> parameterMap = request.getParameterMap();
	
	for(String key : parameterMap.keySet()){
		out.println(key+" : "+Arrays.toString(parameterMap.get(key)));
		out.println("<br/>");
	}
%>
</body>
</html>