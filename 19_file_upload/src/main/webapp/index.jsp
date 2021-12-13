<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  
		application/x-www-form-urlencoded
		기본 값 , 모든 문자들을 서버로 보내기 전에 인코딩 됨을 명시함.
		multipart/form-data
		모든 문자를 인코딩하지 않음을 명시.
		이 방식은 form 요소에서 파일이나 이미지 를 서버에 전송 할때 사용됨.
		text/plain
		공백문자(space)는+기호기호로 변환 되지만 
		나머지 문자는 인코딩 되지 않음을 명시
	-->
	<h3>single file - cos</h3>
	<form action="upload.cos" method="POST" enctype="multipart/form-data">
		<input type="file" name="file" accept="image/*" />
		<input type="text" name="test"/>
		<input type="submit" />
	</form>
	<br/>
	<h3>multiple file - cos</h3>
	<form action="multiple.cos" method="POST" 
		enctype="multipart/form-data">
		<input type="file" name="file" multiple/>
		<input type="text" name="test" />
		<input type="submit" value="upload" />
	</form>
	<br/>
	<h3>single file non multipart- commons</h3>
	<form action="test.comm" method="POST">
		<input type="file" name="file" />
		<input type="text" name="test" />
		<input type="submit" value="upload" />
	</form>
	<br/>
	<h3>single file - commons</h3>
	<form action="single.comm" method="POST" 
		  enctype="multipart/form-data">
		<input type="file" name="file" />
		<input type="text" name="test" />
		<input type="submit" value="upload" />
	</form>
</body>
</html>




