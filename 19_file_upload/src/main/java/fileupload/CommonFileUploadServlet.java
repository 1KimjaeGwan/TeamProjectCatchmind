package fileupload;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/*
 * commons-fileupload, commons-io API 활용
 */
@WebServlet("*.comm")
public class CommonFileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY
					= "upload"+File.separator+"comm";
	// 업로드에 사용될(임시데이터) 메모리 크기 제한
	private final int MEMORY_THRESHOLD = 1024*1024*3; // 3MB
	// 업로드되는 한계의 파일 크기 제한
	private final int MAX_FILE_SIZE = 1024*1024*20;	  // 20MB
	// request에 전달된 전체 데이터 크기 제한
	private final int MAX_REQUEST_SIZE = 1024*1024*50;// 50MB
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String file = request.getParameter("file");
		System.out.println("file : " + file);
		String test = request.getParameter("test");
		System.out.println("test : " + test);
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.write("오류 : multipart-formdata 타입이 아닙니다.");
			pw.flush();
			return;
		}
		// 업로드된 파일을 저장할 저장소의 설정값이 포함된 클래스
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		// 임시 저장소 위치 지정
		// 임시 저장소의 파일은 실제 파일이 업로드 완료되고 나면 삭제됨.
		String tmpDir = System.getProperty("java.io.tmpdir");
		System.out.println("tmpDir : " + tmpDir);
		factory.setRepository(new File(tmpDir));
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		// upload.setFileItemFactory(factory);
		upload.setFileSizeMax(MAX_FILE_SIZE);
		upload.setHeaderEncoding("utf-8");
		upload.setSizeMax(MAX_REQUEST_SIZE);
		String uploadPath 
			= request.getServletContext().getRealPath("/")
			+File.separator+UPLOAD_DIRECTORY;
		System.out.println("uploadPath : "+ uploadPath);
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		try {
			List<FileItem> formItems = upload.parseRequest(request);
			// form tag를 통해 넘겨받은 정보가 존재하면 
			if(formItems != null && formItems.size() > 0) {
				for(FileItem item : formItems) {
					if(!item.isFormField()) {
						// 파일정보
						String fileName = new File(item.getName()).getName();
						String filePath = uploadPath + File.separator+fileName;
						File storeFile = new File(filePath);
						// 매개변수로 넘겨받은 경로와 파일이름으로
						// 바이너리로 넘겨받은 파일 업로드
						item.write(storeFile);
						request.setAttribute("request", "File upload Succeded!");
						request.setAttribute("original", fileName);
						request.setAttribute("upload", filePath);
					}else {
						// 일반 폼 필드
						test = item.getFieldName();
						System.out.println("param name : " + test);
						String req = item.getString("UTF-8");
						System.out.println("req : " + req);
					}
				}
			}
		} catch (Exception e) {
			request.setAttribute("message", "Error message : " + e.getMessage());
		}
		request.getRequestDispatcher("result.jsp").forward(request, response);
	}
}
