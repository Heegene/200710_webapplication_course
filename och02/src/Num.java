

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Num")
public class Num extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Num() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		int num1 = Integer.parseInt(request.getParameter("num1")); 
		int num2 = Integer.parseInt(request.getParameter("num2"));
		PrintWriter out = response.getWriter();
		out.print("<html> <body>");
		out.print("덧셈 : " + num1 + " + " + num2 + " = " + (num1+num2) + "<br>");
		
		
		out.print("뺄셈 : " + num1 + " - " + num2 + " = " + (num1 - num2) + "<br>");
		
		out.print("곱셈 : " + num1 + " * " + num2 + " = " + num1*num2 + "<br>");
		
		out.print("나눗셈 : " + num1 + " / " + num2 + " = " + num1/num2 + "<br>");
		
		out.print("</body> </html>");
		out.close();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
