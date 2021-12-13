<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forwardTest.jsp</title>
</head>
<body>
	<form action="forwardTest2.jsp" method="POST">
		<input type="hidden" name="resultPage" value="forwardTest1.jsp" />
		<table border="1" cellspacing="0">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" name="age" /></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="확인"/>
				</td>
			</tr>		
		</table>
	</form>
</body>
</html>