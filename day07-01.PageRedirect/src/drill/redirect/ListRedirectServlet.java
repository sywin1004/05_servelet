package drill.redirect;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 */
@WebServlet("/listRedirect")
public class ListRedirectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> fruits = new ArrayList<>();
		fruits.add("복숭아");
		fruits.add("사과");
		fruits.add("자두");
		fruits.add("모과");
		fruits.add("수박");
		
		request.setAttribute("fruits", fruits);
		
		response.sendRedirect("listJsp");
	}

}
