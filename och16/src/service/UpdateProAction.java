package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class UpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// parameter -> pageNum, num, writer, email, subject, passwd, content
		// Boarddao 인스턴스 생성
		// int result = bd.update(board) 보드 통으로 넣어서 update dao에 넣기 
		// 저장 -> result, pageNum, num
		// view-> updatePro.jsp
		
		try {
			request.setCharacterEncoding("utf-8");
			String pageNum = request.getParameter("pageNum");
			Board board = new Board();

			int num = Integer.parseInt(request.getParameter("num"));
			String writer = request.getParameter("writer");
			String email = request.getParameter("email");
			String subject = request.getParameter("subject");
			String passwd = request.getParameter("passwd");
			String content = request.getParameter("content");
			// 다음번에는 board.setnum(request.get~~)이렇게 한줄로 쓰기 
			
			board.setNum(num);
			board.setWriter(writer);
			board.setEmail(email);
			board.setSubject(subject);
			board.setPasswd(passwd);
			board.setContent(content);
			board.setIp(request.getRemoteAddr());
			
			BoardDao bd = BoardDao.getInstance(); // 싱글턴 객체 생성
			
			int result = bd.update(board);
			

			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum); // pagenum은 나중에 다시 해당페이지로 돌아가기위해 들고다님
			request.setAttribute("num", board.getNum());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "updatePro.jsp";
		
		
		
	}

}
