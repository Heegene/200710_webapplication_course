

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Movie")
public class Movie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Movie() {
        super();
        // TODO Auto-generated constructor stub
    }

	// 여러개의 parameter를 한꺼번에 묶어서 보내는 경우의 서블릿 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		// 여러개의 값이므로 String 배열로 받음 
		String[] movie = request.getParameterValues("movie"); // html에서 입력한 num으로부터 받아서 정수화
		PrintWriter out = response.getWriter();
		out.print("<html> <body>");
		out.print("<h1> 당신이 좋아하는 영화는 </h1>" );
		for (int i = 0; i < movie.length; i++) {
			out.print(movie[i] + "<br>");
		}
		out.print("</body> </html>");
		out.close();
	}
		

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
