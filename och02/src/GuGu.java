

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/GuGu")
public class GuGu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public GuGu() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num")); // html에서 입력한 num으로부터 받아서 정수화
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html> <body>");
		out.print("<h1> 구구단 " + num + " 단 </h1>");
		
		for (int i = 1; i < 10; i++) {
			out.print(num + " * " + i + " = " + num*i + "<br>");
			// 이렇게도 가능
			// out.printf("%d * %d = %d", num*i, num, (num*i));
		}
		
		out.print("</body> </html>");
		out.close();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
