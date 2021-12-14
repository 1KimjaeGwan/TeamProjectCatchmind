<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!-- connection.jsp -->
<%
	Connection conn = null;
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/smartWeb";
	String user = "smartWeb";
	String pass = "12345";
	Class.forName(driver);
	conn = DriverManager.getConnection(url,user,pass);
%>