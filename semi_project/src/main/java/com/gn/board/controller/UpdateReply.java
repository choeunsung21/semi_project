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
		int replyNo = 0;
		if(temp != null) {
			replyNo = Integer.parseInt(temp);
		}
		
		System.out.println("======================"+replyNo);
		System.out.println("======================"+replyContent);
		request.setAttribute("replyNo", replyNo);
		request.setAttribute("replyContent", replyContent);
		RequestDispatcher view = request.getRequestDispatcher("/views/board/replyUpdate.jsp");
		view.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
