

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Add3")
public class Add3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Add3() {
        super();
    }

	// request parameter 를 받아서 response 내용 작성 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num")); // html에서 입력한 num으로부터 받아서 정수화
		int sum = 0;
		
		for (int i=1; i<=num; i++) {
			sum += i;
		}
		response.setContentType("text/html;charset=utf-8"); // 응답의 content 타입과 인코딩방식 지정
		PrintWriter out = response.getWriter(); // web화면에 출력하는 객체
		out.print("<html> <body>");
		out.print("<h1> 1부터 "+num+"까지의 합계 <h1> <br>");
		// formatted print로도 가능
		out.printf("<h1> 1부터 %d 까지의 합계 </h1> <br>", num);
		out.print(sum);
		out.print("</body> </html>");
		out.close();
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
