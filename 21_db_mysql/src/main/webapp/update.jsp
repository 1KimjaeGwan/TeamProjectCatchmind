<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- update.jsp -->
<%@ include file="connection.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String mNum = request.getParameter("num");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	
	Statement stmt = null;
	try{
		int num = Integer.parseInt(mNum);
		stmt = conn.createStatement();
		String sql = "UPDATE member SET "
					+" name='"+name+"',"
					+" addr='"+addr+"' "
					+" WHERE num="+num;
		System.out.println("sql : " + sql);
		int result = stmt.executeUpdate(sql);
		out.println("<script>");
		out.println("alert('"+result+"개의 행 수정완료');");
		out.println("location.href='memberList.jsp';");
		out.println("</script>");
	}catch(Exception e){
		out.println("<script>");
		out.println("alert('수정실패');");
		out.println("history.go(-1);");
		out.println("</script>");
	}finally{
		stmt.close();
		conn.close();
	}
%>