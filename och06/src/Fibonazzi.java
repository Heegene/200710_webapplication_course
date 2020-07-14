

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Fibonazzi")
public class Fibonazzi extends HttpServlet {
	private static final long serialVersionUID = 1L;
    BigInteger[] arr = new BigInteger[100];
    
    
	@Override
    public void init() throws ServletException {
    	super.init();
    	System.out.println("init() 호출 ");
    	arr[0] = new BigInteger("1");
    	arr[1] = new BigInteger("1");
    		for (int i = 2; i < arr.length; i++ ) {
    			arr[i] = arr[i-2].add(arr[i-1]);
    		} // 피보나치수열 100개 구현해놓음 
    	
    }
    
    
    public Fibonazzi() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("doGet() 호출 , num is "+ num);
		if (num > 100) {
			num = 100;
		}
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print("<html> <body> <h2> 피보나치 수열 </h2> ");
		for (int i = 0; i < num; i ++) {
			out.print(arr[i] + "<br>"); // 구현된 수열을 num의 개수만큼 보여줌 
			
		}
		out.print("</body> </html>");
		out.close();
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
