package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class WriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
				// num, writer, subject, content, email, readcount, passwd, ref, re_step, re_level, ip, reg_date
				
				try {
					request.setCharacterEncoding("utf-8");
					String pageNum = request.getParameter("pageNum");
					Board board = new Board();
					
					board.setNum(Integer.parseInt(request.getParameter("num")));
					board.setWriter(request.getParameter("writer"));
					board.setEmail(request.getParameter("email"));
					board.setSubject(request.getParameter("subject"));
					board.setPasswd(request.getParameter("passwd"));
					board.setRef(Integer.parseInt(request.getParameter("ref")));
					board.setRe_step(Integer.parseInt(request.getParameter("re_step")));
					board.setRe_level(Integer.parseInt(request.getParameter("re_level")));
					board.setContent(request.getParameter("content"));
					board.setIp(request.getRemoteAddr());
					
					BoardDao bd = BoardDao.getInstance(); // 싱글턴 객체 생성
					
					int result = bd.insert(board);
					

					request.setAttribute("num", board.getNum());
					request.setAttribute("result", result);
					request.setAttribute("pageNum", pageNum); // pagenum은 나중에 다시 해당페이지로 돌아가기위해 들고다님

				} catch (Exception e) {
					e.printStackTrace();
				}

				return "writePro.jsp";
		
		
		
		
	}

}
