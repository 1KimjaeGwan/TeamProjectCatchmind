package lifeCycle;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lifeCycle")
public class LifeCycleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LifeCycleServlet() {
        super();
        System.out.println("LifeCycleServlet 생성자 호출");
    }

	public void init(ServletConfig config) throws ServletException {
		System.out.println("init 호출");
		String contextPath = config.getServletContext().getContextPath();
		System.out.println("contextPath : " + contextPath);
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Service 호출");
		String method = request.getMethod();
		System.out.println("전송방식 : " + method);
		// 대소문자 구분없이 문자열을 비교
		if(method.equalsIgnoreCase("get")) {
			doGet(request,response);
		}else {
			doPost(request,response);
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 호출");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost 호출");
	}

}
