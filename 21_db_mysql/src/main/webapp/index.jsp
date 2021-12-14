<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<%
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/smartWeb";
		String username = "smartWeb";
		String password = "12345";
		Connection conn = null;
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url,username,password);
		}catch(ClassNotFoundException e){
			out.print("DriverClass를 찾을 수 없습니다.");
		}catch(SQLException e){
			out.print("연결 요청 정보 오류"+e.getMessage());
		}finally{
			try{
				if(conn != null) conn.close();
			}catch(Exception e){}
		}
	%>
	<a href="insertForm.jsp">회원정보 입력</a>
	<a href="memberList.jsp">회원목록 확인</a>
</body>
</html>