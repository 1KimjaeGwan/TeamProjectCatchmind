<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- javax.servlet.http.Part -->
<%@ page import="javax.servlet.http.*" %>
<!-- java.util.UUID -->
<!-- java.util.Collections -->
<%@ page import="java.util.*" %>
<!-- java.io.File -->
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result.jsp</title>
</head>
<body>
<%!
	public String getFileName(Part part){
		// 36개의 문자조합으로 랜덤한 문자열을 생성하는 객체
		UUID uid = UUID.randomUUID();
		// -(대쉬) 4개를 포함
		// 32개의 랜덤한 문자를 생성
		// -(대쉬) 4개를 공백으로 변환하여 32개의 문자조합으로 생성
		System.out.println(uid);
		String replace = uid.toString().replace("-","");
		System.out.println(replace);
		return replace+"_"+part.getSubmittedFileName();
	}
%>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getServletContext().getRealPath("upload");
	File file = new File(path);
	if(!file.exists()){
		file.mkdirs();
		System.out.println("생성 완료");
	}
	System.out.printf("path : %s \n",path);
	
	/* form fild data를 각 Part로 나눠서 리스트 형태로 전달 */
	Collection<Part> parts = request.getParts();
	if(parts != null){
		for(Part part : parts){
			System.out.printf("파라미터 명 : %s, contentType : %s, size : %d bytes \n",
								part.getName(),part.getContentType(),part.getSize()
							 );
			System.out.println(part.getHeader("Content-Disposition"));
			if(part.getHeader("Content-disposition").contains("filename=")){
				System.out.println("--- file Data --- ");
				if(part.getSize() > 0){
					// 넘겨받은 파일 이름
					String submitFileName = part.getSubmittedFileName();
					System.out.println("submitFileName : " + submitFileName);
					// 파일 이름 중복 방지용 메소드
					String fileName = getFileName(part);
					System.out.println("fileName : " + fileName);
					part.write(path + File.separator + fileName);
					//part.delete();
					out.print("<a href='upload/"+fileName+"' download='"+submitFileName+"' target='_blank'>"+submitFileName+"</a><br/>");
					out.print("<hr/>");
					out.print("<a href='fileDown.jsp?fileName="+fileName+"&original="+submitFileName+"'>"+submitFileName+"</a><br/>");
				}
			}else{
				System.out.println("--- form data --- ");
				String formValue = request.getParameter(part.getName());
				out.print(part.getName()+" : "+formValue);
			}
		}
	}
%>
</body>
</html>









