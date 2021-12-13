<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 선언부 class block -->
<%!
	String s = "test";
	int count = 0;
	String getStr(String str){
		s += str;
		count++;
		return s;
	}
%>
<h1>TIME JSP</h1>
<!-- 표현문 response 응답 객체를 이용하여 출력 -->
<%= getStr(" 컴퓨터 바보 멍청이 !!! \t ") + count %>
<!-- 스크립틀릿(scriptlet) java code 작성 부 -->
<%
	java.text.SimpleDateFormat sdf 
		= new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
%>

기본 시간 : <%= new java.util.Date() %> <br/>
현재 시간 : <%= sdf.format(new java.util.Date()) %> <br/>

<%
	int sum = 0; // 로컬 변수
	for(int i=1; i<=100; i++){
		sum += i;
%>
	sum : <%= sum %> <br/>
<%
	}
%>
 1부터 100까지의 합은 : <%= sum %> 입니다.
</body>
</html>

















