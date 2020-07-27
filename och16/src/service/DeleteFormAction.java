package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class DeleteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		try {

			int num = Integer.parseInt(request.getParameter("num"));
			String pageNum = request.getParameter("pageNum");
			BoardDao bd = BoardDao.getInstance(); // 싱글턴 객체 생성
			Board board = bd.select(num); // select에 num을 넣어줌 
			
			
			request.setAttribute("num", num);
			request.setAttribute("pageNum", pageNum); // pagenum은 계속 가지고다님
			request.setAttribute("board", board);
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "deleteForm.jsp";
		
	}

}
