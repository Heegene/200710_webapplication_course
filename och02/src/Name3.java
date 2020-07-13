

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Name3")
public class Name3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Name3() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				response.setContentType("text/html;charset=utf-8");
				request.setCharacterEncoding("UTF-8");
				// 여러개의 값이므로 String 배열로 받음 
				String name = request.getParameter("name"); 
				String addr = request.getParameter("addr");
				PrintWriter out = response.getWriter();
				out.print("<html> <body>");
				out.print(name + "님은 " + addr + " 에 사시는군요.");
				out.print("</body> </html>");
				out.close();
			}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
}
