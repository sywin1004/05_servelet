package drill.include;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 과일을 include 방식으로 전달하는 서블릿
 */
@WebServlet("/listInclude")
public class ListIncludeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8");
		
		List<String> fruits = new ArrayList<>();
		fruits.add("복숭아");
		fruits.add("사과");
		fruits.add("자두");
		fruits.add("모과");
		fruits.add("수박");
		
		request.setAttribute("fruits", fruits);
		
		RequestDispatcher reqd = request.getRequestDispatcher("listJsp");
		
		reqd.include(request, response);
	}

}
