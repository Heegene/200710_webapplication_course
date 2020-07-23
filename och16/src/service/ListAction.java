package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class ListAction implements CommandProcess {
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardDao bd = BoardDao.getInstance();
		// 자원절감을 위해 Singleton 패턴을 이용해 instance를 하나만 생성
		
		try {
			int totCnt = bd.getTotalCnt();
			// board 개수를 구하는 method(dao에 구현해야 함) 38개 나와야함
			// board의 row 개수 
			// 이렇게 외부에서 뭐 받아오는 경우 try catch 로 감싸줄 것 
			
			// 페이징작업부 
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.equals("") ) {
				pageNum = "1";
			}
			
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10, blockSize = 10;
			
			int startRow = (currentPage - 1) * pageSize + 1; // 기본 1
			int endRow = startRow + pageSize - 1; // 기본 10
			
			int startNum = totCnt - startRow + 1;
			
			// List<Board> list = bd.list(startRow, endRow);
			
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize); // ceil해주는 이유: 31개라도 페이지는 4페이지 해야하므로
			int startPage = (int)(currentPage-1) / blockSize*blockSize + 1; // 1
			
			int endPage = startPage + blockSize - 1; // 10나오는데
			
			if (endPage > pageCnt) {
				endPage = pageCnt; // 10페이ㅈㅣ말고 4페이지로 정해줌 있는페이지만 보여주기위해 
			}
			
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			// request.setAttribute("list", list);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			
			System.out.println("----------------------------------------------"); // 콘솔로 보기위한 내용 
			System.out.println("startNum --> " + startNum); // /ch16/list.do
			System.out.println("totCnt --> " + totCnt); // /ch16/list.do
			System.out.println("currentPage --> " + currentPage); // /ch16/list.do
			System.out.println("blockSize --> " + blockSize); // /ch16/list.do
			System.out.println("pageSize --> " + pageSize); // /ch16/list.do
			System.out.println("pageCnt --> " + pageCnt); // /ch16/list.do
			System.out.println("startPage --> " + startPage); // /ch16/list.do
			System.out.println("endPage --> " + endPage); // /ch16/list.do
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "list.jsp";
	}
	
}
