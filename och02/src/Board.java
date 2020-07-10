

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Board")
public class Board extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Board() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		PrintWriter out = response.getWriter();
		
		out.print("<html> <body>");
		out.print("<h1> 게시판 </h1> <br>" );
		out.print("제목 : " + title + "<br>");
		out.print("작성자 : " + writer + "<br>");
		out.print("작성일 : " + new Date() + "<br>");
		out.print("내용  <br>"+ content);
		out.print("</body> </html>");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
