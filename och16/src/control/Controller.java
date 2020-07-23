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
	private static final long serialVersionUID = 1L;
	private Map<String, Object> commandMap = new HashMap<String, Object>();
	
    public Controller() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		// web.xml 에서 propertyConfig에 해당하는 init-param 값 읽어옴
		String props = config.getInitParameter("config");
		// 명령어와 처리 클래스의 매핑 정보를 저장할 Properties 객체 생성
		Properties pr = new Properties();
		FileInputStream f = null;
		
		try {
			String configFilePath = config.getServletContext().getRealPath(props);
			f = new FileInputStream(configFilePath);
			// command.properties 파일의 정보를 Properties 객체에 저장 
			pr.load(f);
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
		Iterator keyIter = pr.keySet().iterator();
		// 객체를 하나씩 꺼내서 그 객체명으로 Properties 객체에 저장된 객체에 접근
		
		while (keyIter.hasNext()) {
			String command = (String)keyIter.next(); //   /list.do
			String className = pr.getProperty(command); // service.ListAction
			try {
				Class commandClass = Class.forName(className);
				Object commandInstance = commandClass.newInstance();
				commandMap.put(command, commandInstance);
				
			} catch (Exception e) {
				// TODO: handle exception
				throw new ServletException(e);
			}
			
		}
		
		
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	
	// 사용자의 요청을 분석해서 해당 작업 처리(get호출하든 post호출하든 requestPro 실행)
	
	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = null;
		CommandProcess com = null;
		try {
			String command = request.getRequestURI();
			System.out.println(command); // /ch16/list.do
			System.out.println(request.getContextPath());
			System.out.println(command.indexOf(request.getContextPath()));
			
			if (command.indexOf(request.getContextPath()) == 0) {
				command = command.substring(request.getContextPath().length());
			}
			
			com = (CommandProcess)commandMap.get(command);
			System.out.println("command => " + command);
			System.out.println("com => " + com);
			view = com.requestPro(request, response);
			System.out.println("view => " + view);
			
		} catch (Throwable e) {
			throw new ServletException(e);
			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

}
