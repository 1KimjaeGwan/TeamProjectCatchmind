package fileupload;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
/*
@WebServlet("/result")
@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 10,
	maxFileSize = -1,
	maxRequestSize = -1
)
*/
public class PartFileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("result doPost 호출");
		request.setCharacterEncoding("UTF-8");
		String fileFolder = "upload";
		String filePath = request.getServletContext().getRealPath(fileFolder);
		File saveDir = new File(filePath);
		if(!saveDir.exists()) {
			saveDir.mkdirs();
		}
		String fileName = null;
		for(Part part : request.getParts()) {
			if(part.getHeader("Content-Disposition").contains("filename=")) {
				if(part.getSize() > 0 ) {
					String original = part.getSubmittedFileName();
					fileName = getFileName(original);
					pringLog(part);
					part.write(filePath+File.separator+fileName);
					response.setContentType("text/html;charset=utf-8");
					PrintWriter pw = response.getWriter();
					pw.println("original : " + original+"<br/>");
					pw.println("uploadfileName : " + fileName+"<br/>");
				}
			}else {
				String formField = request.getParameter(part.getName());
				System.out.println("formField :"+part.getName()+":"+formField);
			}
		}
	}

	private String getFileName(String original) {
		// ss : 초
		// SS : 1000 1초 단위아래의 값을 000~999까지 표현
		SimpleDateFormat sdf = new SimpleDateFormat("ssSS");
		long currentTime = System.currentTimeMillis();
		String uniqueFileName = sdf.format(new Date(currentTime));
		return uniqueFileName+"_"+original;
	}
	
	public void pringLog(Part part) {
		System.out.println("-----------------------------------------------------------------------------------");
		System.out.println("LOG :: [HTML태그의 name] ::"+part.getName());
		System.out.println("LOG :: [파일 사이즈] ::"+part.getSize());
		// header에 등록 된 key값의 묶음
		for(String name : part.getHeaderNames()) {
			System.out.printf("LOG :: HeaderName : %s, Header Value %s \n", name, part.getHeader(name));
		}
		System.out.println("-----------------------------------------------------------------------------------");
	}
	
}
