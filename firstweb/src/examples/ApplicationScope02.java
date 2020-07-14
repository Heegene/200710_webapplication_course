package examples;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ApplicationScope02")
public class ApplicationScope02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ApplicationScope02() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		ServletContext application = getServletContext();
		// 꺼내온다음 값에 1을 더함
		
		try { // 혹시 02를 먼저실행시켜 nullpointer뜰경우 대비 try
			
			// obj 형태로 넘어오므로 형변환 해주고 +1함
			int value = (int)application.getAttribute("value");
			value++;
			// 증가시킨 값을 맡김 
			application.setAttribute("value", value);
			
			out.print("<h1>value : " + value + " </h1>");
			
		} catch (NullPointerException e) {
			out.print("value의 값이 설정되지 않았습니다.");
			e.printStackTrace();
			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
