<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>xmlGenerator.jsp</title>
<style>
	cgg{
		padding:10px;
	}
	#cggId{
		color:white;
	}
	.cggClass{
		background-color:black;
	}
</style>
</head>
<body>
	<!-- custom tag 추가 -->
	
	<jsp:element name="cgg">
		<jsp:attribute name="id">
			cggId
		</jsp:attribute>
		<jsp:attribute name="class">
			cggClass
		</jsp:attribute>
		<jsp:body>
			cgg id 속성 값은 cggId
		</jsp:body>
	</jsp:element>
	<!-- 
		<cgg id="cggId" class="cggClass">cgg id 속성 값은 cggId</cgg>
	 -->
</body>
</html>