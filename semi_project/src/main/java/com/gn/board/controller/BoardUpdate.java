package com.gn.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.board.service.BoardService;
import com.gn.board.vo.Board;


@WebServlet("/boardUpdate")
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public BoardUpdate() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("boardNo");
		int boardNo = 0;
		if(temp != null) {
			boardNo = Integer.parseInt(temp);
		}
//		System.out.println("수정중!!!!!!!!!!!!" +boardNo);

		Board board = new BoardService().selectBoardOne(boardNo);
		request.setAttribute("board", board);
	
		RequestDispatcher view = request.getRequestDispatcher("/views/board/boardUpdate.jsp");
		view.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
