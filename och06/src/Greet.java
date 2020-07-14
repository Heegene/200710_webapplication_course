
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Greet")
public class Greet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter log; // 로그를 미리 선언하고 나중에 인스턴스를 만들어줌 
	
	
	public Greet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void init() throws ServletException {
		try {
			System.out.println("greet init... ");
			log = new PrintWriter(new FileWriter("c:/log/log.txt", true)); // log.txt 
		} catch (IOException e) {
			System.out.println("IO exception 발생 ");
		}
	}

	@Override
	public void destroy() {
		System.out.println("greet destroy...");
		if (log != null) {
			log.close(); // 이렇게 하면 destroy 가 호출되었을 때만 log가 txt 파일로 전달됨 
		}
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("greet doget...");
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		PrintWriter out = response.getWriter();
		String msg = name + " 님 반갑습니다 \r\n";
		
		GregorianCalendar gc = new GregorianCalendar();
		String date = String.format("%TF %TT \r\n", gc, gc); // 이런식으로 나타남 2020-07-14 11:50:35 
		
		log.print(date + msg);
		// log.flush(); 그때그때 저장하고싶을때 flush 처리 
		
		out.print("<html> <body>");
		out.print("<h1> 인사 </h1>");
		out.print(msg + "<br>");

		out.print("</body> </html>");
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
