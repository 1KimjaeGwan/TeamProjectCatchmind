<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.net.URLEncoder" %>
<!-- fileDown.jsp -->
<%
	request.setCharacterEncoding("UTF-8");
	String fileName = request.getParameter("fileName");
	String original = request.getParameter("original");
	String savePath = "upload";
	String downloadPath = request.getServletContext().getRealPath(savePath);
	String filePath = downloadPath+File.separator+fileName;
	byte[] bytes = new byte[1024];
	FileInputStream fis = new FileInputStream(filePath);
	String mimeType = getServletContext().getMimeType(filePath);
	if(mimeType == null){
		// 확인할 수 없는 파일 // 이진데이터 파일로 지정
		// 브라우저는 확인할 수 없는 파일일 경우 무조건 다운로드 진행
		mimeType = "application/octet-stream";
	}
	response.setContentType(mimeType);
	String agent = request.getHeader("User-Agent");
	System.out.println(agent);
	boolean isBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident") > -1);
	if(isBrowser){
		// IE 일때는 공백이 +기호로 날라옴
		// 브라우저가 인식 할 수 있게 +기호를 %20(공백유니코드)로 변경
		original = URLEncoder.encode(original,"UTF-8").replaceAll("\\+","%20");
	}else{
		original = new String(original.getBytes("UTF-8"),"iso-8859-1"); 
	}
			
	response.setHeader("Content-Disposition","attachment; filename="+original);
	OutputStream os = response.getOutputStream();
	int numRead = 0;
	while((numRead = fis.read(bytes,0, bytes.length)) != -1){
		os.write(bytes,0,numRead);
	}
	os.flush();
	os.close();
	fis.close();
%>

<%=fileName%> <br/>
<%=original%> <br/>
<%=filePath%> <br/>