<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- info.jsp -->
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session"/>
<%
	if(loginMember.getId() == null){
		out.print("<script>");
		out.print("alert('접근 권한이 없습니다. 로그인후 이용해주세요.');");
		out.print("location.href='index.jsp?page=login';");
		out.print("</script>");
		return;
	}
%>
<table>
	<tr>
		<td colspan="2"><h1>회원정보</h1></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><jsp:getProperty name="loginMember" property="id"/></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><jsp:getProperty name="loginMember" property="name"/></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><%=loginMember.getAddr()%></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><%=loginMember.getPhone()%></td>
	</tr>
	<tr>
		<td>성별</td>
		<td>
			<input type="radio" 
			<%=loginMember.getGender().equals("남성") ? "checked" : "disabled" %> /> 남성
			<input type="radio" 
			<%=loginMember.getGender().equals("여성") ? "checked" : "disabled" %> /> 여성
		</td>
	</tr>
	<tr>
		<td>나이</td>
		<td><%=loginMember.getAge() %></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" 
			onclick="loacation.href='index.jsp';">메인으로</button>
			<button type="button" 
			onclick="withdraw();">회원탈퇴</button>
		</td>
	</tr>
</table>
<script>
	function withdraw(){
		var bool = confirm("정말로 탈퇴하시겠습니까?");
		if(bool){
			location.href="withdraw.jsp";
		}
	}
</script>























