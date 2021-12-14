<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<h3>part - file upload</h3>
	<form action="result.jsp" method="POST" enctype="multipart/form-data" >
		<input type="file" name="file1" accept="image/*,.pdf" /> <br/>
		<input type="file" name="file2" accept="image/*,.pdf" /> <br/>
		<input type="file" name="file3" accept="image/*,.pdf" /> <br/>
		<input type="text" name="test" />
		<input type="submit" value="전송"/>
	</form>
	
	<h3>part servlet - file upload</h3>
	<form action="result" method="POST" enctype="multipart/form-data" >
		<input type="file" name="file1" accept="image/*,.pdf" /> <br/>
		<input type="file" name="file2" accept="image/*,.pdf" /> <br/>
		<input type="file" name="file3" accept="image/*,.pdf" /> <br/>
		<input type="text" name="test" />
		<input type="submit" value="전송"/>
	</form>
</body>
</html>