<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertForm.jsp</title>
</head>
<body>
	<form action="insert.jsp" method="POST">
		<table>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" />
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" name="addr" />
				</td>
			</tr>
			<tr>
				<td colspan=2 align="center">
					<button>등록</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>