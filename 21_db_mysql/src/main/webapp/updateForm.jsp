<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="connection.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String mNum = request.getParameter("num");
	System.out.println(mNum);
	int num = 0;
	if(mNum == null){
		out.print("<script>alert('안됨');history.back();</script>");
		return;
	}
	num = Integer.parseInt(mNum);
	Statement stmt = conn.createStatement();
	String sql = "SELECT * FROM member WHERE num ="+num;
	ResultSet rs = stmt.executeQuery(sql);
	String name = "";
	String addr = "";
	if(rs.next()){
		name = rs.getString("name");
		addr = rs.getString("addr");
	}
	rs.close();
	stmt.close();
	conn.close();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateForm.jsp</title>
</head>
<body>
	<form action="update.jsp" method="POST">
		<input type="hidden" name="num" value="<%=num%>" />
		<table>
			<tr>
				<td>번호</td>
				<td><%=num%></td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" value=<%=name%> />
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" name="addr" value=<%=addr%> />
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button>수정</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
