<!-- default : buffer=8kb autoFlush=true -->
<%@ page buffer="1kb" autoFlush="true"%>  <!-- buffer 와 autoFlush의 역할이해 --> 
<%@ page info="Buffer Test용 JSP" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page_02_buffer_info.jsp</title>
</head>
<body>
	<!-- 
		info는 두번 정의 될 수 없고 
		선언부에 메소드 생성하고
		info에 정의된 값을 return 
	-->
	<%= getServletInfo() %>
	<!-- 전체 버퍼 크기 -->
	Buffer size = <%= out.getBufferSize() %> <br/>
	<!-- 버프에 남은 크기 -->
	Remaining size = <%= out.getRemaining() %> <br/>
	Hello!!!
	Remaining size = <%= out.getRemaining() %> <br/>
	<%
		for(int i=0; i<1000; i++){
			out.println("1234");
		}
	%>
	<br/>
	Remaining size = <%= out.getRemaining() %>
</body>
</html>