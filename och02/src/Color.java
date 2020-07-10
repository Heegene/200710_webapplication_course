

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Color")
public class Color extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Color() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String color = request.getParameter("color");
		PrintWriter out = response.getWriter();
		out.printf("<html> <body bgcolor='%s'>", color); // body의 배경을 color string 값대로 줌 
		out.println("</body> </html>"); 
		out.close();
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		System.out.println("dopost가 실행되었습니다.");
	}

}
