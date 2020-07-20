package och17;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import com.sun.net.httpserver.Filter.Chain;

public class SimpleFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) // 알아보기쉽게 이름 request, response, chain으로
	// argument 명을 바꿔줌
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		System.out.println("필터 시작 ");
		chain.doFilter(request, response);
		System.out.println("필터 끝");
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
