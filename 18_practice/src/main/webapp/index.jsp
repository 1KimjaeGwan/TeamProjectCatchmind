<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String selectPage = request.getParameter("page");
	if(selectPage == null){
		selectPage = "default";
	}
	selectPage += ".jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link href="css/common.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<header>
		<jsp:include page="header.jsp"/>
	</header>
	<section>
		<jsp:include page="<%=selectPage%>"/>
	</section>
	<footer>
		<jsp:include page="footer.jsp"/>
	</footer>
</body>
</html>











