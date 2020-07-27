package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class WriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		try {
			int num = 0;
			int ref = 0;
			int re_level = 0; // 댓글, 대댓글 ,,,
			int re_step = 0; // 같은 reference 안의 순서. 처음 입력할 땐 다 0로 만듦
			
			
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null ) {
				pageNum = "1";
			}
			
			// 댓글일 때의 가공 
			if (request.getParameter("num") != null ) {
				
			num = Integer.parseInt(request.getParameter("num"));
			
			BoardDao bd = BoardDao.getInstance();
			Board board = bd.select(num);
			
			ref = board.getRef();
			re_level = board.getRe_level();
			re_step = board.getRe_step();
			}
			
			request.setAttribute("num", num);
			request.setAttribute("ref", ref);
			request.setAttribute("re_level", re_level);
			request.setAttribute("re_step", re_step);
			request.setAttribute("pageNum", pageNum);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "writeForm.jsp";
	}

}
