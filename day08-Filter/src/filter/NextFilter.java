package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Encoding 필터 다음 단계에서 작동하도록 할 필터
 * 요청 주소가 /next/ 이하로 들어오는 모든 케이스에 대해서 작동하는 필터 클래스
 */
@WebFilter(filterName = "nextFilter", urlPatterns = {"/next/*"})
public class NextFilter implements Filter {
	

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("next 필터 init() 이 호출되었습니다.");
	}
	
	/**
	 * 앞선 EncodingFilter 의 doFilter() 메소드의
	 * chain.dofilter() 호출 결과가 전달되는 메소드
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// 1. 전처리 위치
		System.out.println("==============2. (1) next 필터 시작 ==============");
		
		// 다음 필터 호출 혹은 다음 서블릿으로 진입
		chain.doFilter(request, response);
		
		// 2. 후처리 위치
		System.out.println("=== 2. (2) next 필터 종료 ===");
	}
	
	@Override
	public void destroy() {
		// 딱히 진행할 내용이 없으나 구현 메소드 상태로 둔다.
	}





}
