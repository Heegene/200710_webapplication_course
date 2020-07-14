

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Cal2")
public class Cal2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Cal2() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		// request.setCharacterEncoding("UTF-8");
		int num1 = Integer.parseInt(request.getParameter("num1")); 
		int num2 = Integer.parseInt(request.getParameter("num2"));
		PrintWriter out = response.getWriter();
		out.print("<html> <body>");
		out.print("<h1> 연산결과 </h1>");
		
		try {
			out.print(num1 + " + " + num2 + " = " + (num1+num2) + "<br>");
			
			out.print(num1 + " - " + num2 + " = " + (num1 - num2) + "<br>");
			
			out.print(num1 + " * " + num2 + " = " + num1*num2 + "<br>");
			
			out.print(num1 + " / " + num2 + " = " + num1/num2 + "<br>");
			
			
		} catch (Exception e) {
			// TODO: handle exception
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
		}
		out.print("</body> </html>");
		out.close();
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
