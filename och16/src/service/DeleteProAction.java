package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class DeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		try 
		
		
		
		{
			request.setCharacterEncoding("utf-8");
			String pageNum = request.getParameter("pageNum");
			Board board = new Board();
			BoardDao bd = BoardDao.getInstance();
			
			board.setNum(Integer.parseInt(request.getParameter("num")));
			board.setPasswd(request.getParameter("passwd"));
			
			
			
			int result = bd.delete(board);
			
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
					
			
		} catch (Exception e) {
			
		}
		
		return "deletePro.jsp";
	}
}
