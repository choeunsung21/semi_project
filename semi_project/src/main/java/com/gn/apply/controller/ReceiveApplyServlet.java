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

@WebServlet("/receiveApply")
public class ReceiveApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReceiveApplyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		if(session != null && session.getAttribute("user") != null) {
			/* 로그인 과정에서 만들어진 세션이 정상적으로 존재하는 경우 - 접근 자체가 로그인을 해야함 */
			User user = (User)session.getAttribute("user");
			
			int leaderNo = user.getUserNo();
			
			// 어플라이 리스트를 보여줘야함 = 어떤거? 팀의 리더넘버가 세션의 유저넘버여야함
			List<Apply> applyList = new ApplyService().selectApplyAllByLeaderNo(leaderNo);
			
			RequestDispatcher view = request.getRequestDispatcher("/views/apply/receiveApply.jsp");
			request.setAttribute("user", user);
			request.setAttribute("applyList", applyList);
			view.forward(request, response);

		} else {
			/* 특수한 경우 - session이 만료되었는데 어떤 동작을 취하는 경우에만 이쪽으로 옴 */
			RequestDispatcher view = request.getRequestDispatcher("/login");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
