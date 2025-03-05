package com.gn.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/updateReply")
public class UpdateReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public UpdateReply() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("replyNo");
		String replyContent = request.getParameter("replyContent");
		String test = request.getParameter("boardNo");
		int boardNo = 0;
		if(test != null) {
			boardNo = Integer.parseInt(test);
		}
		
		
		System.out.println(boardNo);
		
		int replyNo = 0;
		if(temp != null) {
			replyNo = Integer.parseInt(temp);
		}
//		System.out.println("======================="+boardNo);
//		System.out.println("======================"+replyNo);
//		System.out.println("======================"+replyContent);
		RequestDispatcher view = request.getRequestDispatcher("/views/board/replyUpdate.jsp");
		request.setAttribute("replyNo", replyNo);
		request.setAttribute("replyContent", replyContent);
		request.setAttribute("boardNo", boardNo);
		view.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
