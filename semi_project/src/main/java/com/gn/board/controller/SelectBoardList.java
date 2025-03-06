package com.gn.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.board.service.BoardService;
import com.gn.board.vo.Board;


@WebServlet("/selectBoardList")
public class SelectBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public SelectBoardList() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardTitle = request.getParameter("boardTitle");
		String orderType = request.getParameter("ordertype");
//		System.out.println(orderType + "!!!!!!!!!!!!!!!!!!!!!" );
	
		String nowPage = request.getParameter("nowPage");
		Board board = new Board();
		if(nowPage != null) {
			board.setNowPage(Integer.parseInt(nowPage));
		}
		board.setBoardTitle(boardTitle);
		board.setOrderType(orderType);
		
		int result = new BoardService().selectBoardCount(board);
		board.setTotalData(result);
		
		
		//전체 데이터 조회
		List<Board> list = new BoardService().selectBoardList(board);
		request.setAttribute("list", list);
		request.setAttribute("orderType", orderType);
		//검색창에 정보가 넘어오는지 확인
		// System.out.println(boardTitle); 
		//정보가 넘어왔는지 확인
		//System.out.println(list); 
		
		//key는 page value는 board -> board가 paging 클래스를 extends
		request.setAttribute("page", board);
		RequestDispatcher view = request.getRequestDispatcher("/views/board/list.jsp");
		view.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
