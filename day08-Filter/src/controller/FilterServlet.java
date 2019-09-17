package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 두 종류의 요청 주소를 순서대로 사용하여 요청해보면서
 * 필터의 조합을 확인하는 서블릿 클래스
 */
@WebServlet({ "/sample", "/next/sample" })
public class FilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 1. name 이라는 속성을 요청객체에 추가
	 * 2. 추가된 이름을 추출해서 보여줄 수 있는 뷰(view) 담당 JSP 파일로 페이지 이동
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 0. 서블릿 에서는 요청객체에 한글 처리를 안함
		
		// 1. name 속성을 요청 객체에 추가
		request.setAttribute("name", "박상용");
		
		// 2. 뷰 담당 JSP로 페이지 이동 : forward
		String view = "/name";
		request.getRequestDispatcher(view).forward(request, response);
	}

}
