package com.gn.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/boardUpdate")
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public BoardUpdate() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardNo = request.getParameter("boardNo");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String writerNo = request.getParameter("writerNo");
		String attachNo = request.getParameter("attachNo");
		String oriName = request.getParameter("oriName");
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + oriName);
		System.out.println("수정중!!!!!!!!!!!!" + boardTitle);
		System.out.println("수정중!!!!!!!!!!!!" +boardContent);
		System.out.println("수정중!!!!!!!!!!!!" +boardNo);
		System.out.println("수정중!!!!!!!!!!!!" +writerNo);
		System.out.println("수정중!!!!!!!!!!!!" +attachNo);
		request.setAttribute("boardNo", boardNo);
		request.setAttribute("boardTitle", boardTitle);
		request.setAttribute("boardContent", boardContent);
		request.setAttribute("writerNo", writerNo);
		request.setAttribute("attachNo", attachNo);
		request.setAttribute("oriName", oriName);
		RequestDispatcher view = request.getRequestDispatcher("/views/board/boardUpdate.jsp");
		view.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
