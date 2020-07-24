package control;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	// 그냥 버전표시(없어도 돌아는 감)
	private static final long serialVersionUID = 1L;
	
	// mapper로 key, value string, object로 되어있는 commandMap 만들고 인스턴스를 생성
	private Map<String, Object> commandMap = new HashMap<String, Object>();
	
    public Controller() {
        super();
    }

    // init 에서 메모리 쓸 일 있으면 init 에서 선언 
    // web.xml 에서 선언한 parameter 안에 command.properties 파일로 선언한 "config"가 인자로 init 에 들어가게 됨 
    
    // -----------------init method----------------------------------------
    public void init(ServletConfig config) throws ServletException { 
		// web.xml 에서 propertyConfig에 해당하는 init-param 값 읽어옴
		String props = config.getInitParameter("config"); // init parameter 를 받아와서 props로 String 선언
		
		// 명령어와 처리 클래스의 매핑 정보를 저장할 Properties 객체 생성
		Properties pr = new Properties(); // properties라는 class가 있음. 그걸 인스턴스화
		FileInputStream f = null; // 파일생성을 위한 fileinputsystem 객체 초기화 
		
		try {
			String configFilePath = config.getServletContext().getRealPath(props); // props 정보 path 가져옴
			f = new FileInputStream(configFilePath); // 파일로 만들어냄 command.properties가 파일로 만들어지게 됨 
			// command.properties 파일의 정보를 Properties 객체에 저장 
			pr.load(f); // properties에 위에서 만들어진 파일을 로드시킴 
		} catch (IOException e) {
			throw new ServletException(e);
		} finally {
			if (f != null) {
				try {
					f.close();
				} catch (IOException e2) {
					e2.printStackTrace();
				}
			}
		} 
		// iterator 객체는 enumaration 객체를 확장시킨 개념의 객체
		Iterator keyIter = pr.keySet().iterator(); // list.do는 service.listaction 이런 key, value로 되어있음
		// 그래서 properties의 keyset을 각각 꺼낼 수 있게 iterator 를 사용 
		// iterator 쓰면 키만 모아서 배열처럼 만들고 뽑아쓰게되어있음 
		// 객체를 하나씩 꺼내서 그 객체명으로 Properties 객체에 저장된 객체에 접근
		
		while (keyIter.hasNext()) {
			String command = (String)keyIter.next(); //   /list.do가 값이 될 것 (하나넣어놨음) 
			String className = pr.getProperty(command); // service.ListAction - getproperty하면 아까 그 key의 value를 가져옴
			// string으로 가져오므로 service.ListAction 이라는 값이 String className으로 저장되게 됨 
			
			try {
				Class commandClass = Class.forName(className); // Class.forName으로 "service.ListAction"을 클래스화
				Object commandInstance = commandClass.newInstance(); // 해당 클래스를 강제로 인스턴스화(객체 생김)
				commandMap.put(command, commandInstance); // 그 객체를 commandMap 에 command(List.do) string으로 넣고
				// object 형태로 만들어진 객체인 service.ListAction의 object를 value로 해서 집어넣음
				// -> commandMap 안에 <String, Object> 형태로 <list.do = service.ListAction> 이렇게 들어감
				// 이건 한번만 하면 되는 작업이므로 init 안에 넣어줌
				// 아무튼 WHILE문 안에 있으므로 쭉 다같이 들어가있음 listaction, contentaction... 
				
			} catch (Exception e) {
				// TODO: handle exception
				throw new ServletException(e);
			}
			
		}
		
		
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
		// get방식으로 가져가면 list action을 가지고 requestPro를 실행시키게 됨 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	
	// 사용자의 요청을 분석해서 해당 작업 처리(get호출하든 post호출하든 requestPro 실행)
	
	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = null;
		CommandProcess com = null;
		try {
			String command = request.getRequestURI(); // localhost:8085/och16/list.do 
			System.out.println(command); // /ch16/list.do   위의 URI를 command로 한번 콘솔에 출력
			System.out.println(request.getContextPath()); 
			System.out.println(command.indexOf(request.getContextPath()));
			
			if (command.indexOf(request.getContextPath()) == 0) {
				command = command.substring(request.getContextPath().length()); // contextPath만 짜르면 list.do 만 나옴 
			}
			
			com = (CommandProcess)commandMap.get(command); // com에는 service.ListAction@3c83dfc0 이렇게 들어감
			// object이므로 주소값이 나오게 됨 
			// get을 사용해서 해당 map에서 꺼내지는 건 아무튼 service.ListAction인 것 
			// com = ListAction 객체의 값 
			
			System.out.println("command => " + command); // list.do
			System.out.println("com => " + com); // service.ListAction@3c83dfc0
			view = com.requestPro(request, response); // service.ListAction에서 requestPro 호출 
			// 뭘 넣어주든지 requestPro를 부르게 되어있음 ListAction에있는 requestPro가 실행되게됨(오버라이딩된 requestPro) 
			// requestPro는 interface로 균일하게 항상 오버라이딩하도록 되어있으므로 view는 각 페이지별로 담기게됨 
			System.out.println("view => " + view);
			
		} catch (Throwable e) {
			throw new ServletException(e);
			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view); // view로 이동시킴 
		// listaction의 return 은 return "list.jsp"; 이므로 해당 주소로 이동하게 됨 
		dispatcher.forward(request, response);
	}

}
