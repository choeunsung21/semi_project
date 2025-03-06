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

/**
 * Servlet implementation class SelectOrderType
 */
@WebServlet("/selectOrderType")
public class SelectOrderType extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SelectOrderType() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderType = request.getParameter("ordertype");
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!"+orderType);
		List<Board> list = new BoardService().selectOrderType(orderType);
//		System.out.println(list);
		request.setAttribute("list", list);
		request.setAttribute("orderType", orderType);
		RequestDispatcher view = request.getRequestDispatcher("/views/board/list.jsp");
		view.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
