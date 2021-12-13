package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/choiceDog")
public class ChoiceDogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ChoiceDogServlet POST 요청");
		String[] dogs = request.getParameterValues("dog");
		System.out.println(Arrays.toString(dogs));
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='utf-8'/>");
		out.println("</head>");
		out.println("<body>");
		for(String dog : dogs) {
			out.println(dog+"<br/>");
			out.println("<img src='images/"+dog+"' /><br/>");
		}
		out.println("</body>");
		out.println("</html>");
	}
}
