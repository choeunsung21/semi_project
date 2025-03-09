package com.gn.apply.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gn.apply.service.ApplyService;
import com.gn.apply.vo.Apply;
import com.gn.user.vo.User;

@WebServlet("/sendApply")
public class SendApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SendApplyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션에서 유저 아이디 가지고 이동해야함 - 비로그인 상태면 로그인페이지로 옮겨버릴 것임
		
		HttpSession session = request.getSession(false);
		
		if(session != null && session.getAttribute("user") != null) {
			/* 로그인 과정에서 만들어진 세션이 정상적으로 존재하는 경우 */
			User user = (User)session.getAttribute("user");
			
			List<Apply> applyList = new ApplyService().selectApplyAllByUser(user);
			
			RequestDispatcher view = request.getRequestDispatcher("/views/apply/sendApply.jsp");
			request.setAttribute("applyList", applyList);
			view.forward(request, response);
			
		} else {
			/* 
			 * 보통 정상적인 행동양식대로라면 로그인된 채로 접근하긴 함 
			 * 만약 로그인이 풀린채로 접근된다면 로그인페이지로 넘김 
			 */
			RequestDispatcher view = request.getRequestDispatcher("/login");
			view.forward(request, response);
		}
		
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
