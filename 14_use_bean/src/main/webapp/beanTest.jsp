<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>beanTest.jsp</title>
</head>
<body>
	<h1>Bean Test</h1>
	<%
		test.Member m = null;
		if(pageContext.findAttribute("m") == null){
			m = new test.Member();
			System.out.println(m.getName());
			m.setName("쉬면석");
			pageContext.setAttribute("m",m);
		}else{
			m = (test.Member)pageContext.findAttribute("m");
		}
	%>
	
	<%= ((test.Member)pageContext.getAttribute("m")).getName() %>
	
	<jsp:useBean id="aaa" class="test.Member" scope="page" />
	<jsp:useBean id="bbb" class="test.Member" scope="request" />
	<jsp:useBean id="ccc" class="test.Member" scope="session" />
	<jsp:useBean id="ddd" class="test.Member" scope="application" />
	<br/>
	<%-- <% aaa.setName("쉬면석"); %> --%>
	<jsp:setProperty property="name" name="aaa" value="김유신"/>
	<%-- <%= "aaa name : "+aaa.getName() %> --%>
	aaa name : <jsp:getProperty property="name" name="aaa"/>
	
</body>
</html>











