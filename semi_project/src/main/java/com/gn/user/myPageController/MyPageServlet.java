package com.gn.user.myPageController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gn.user.vo.User;

@WebServlet("/myPage")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyPageServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		// [cjs] myPage.jsp 에 세션정보 넘겨줌
		if(session != null && session.getAttribute("user") != null) {
			User user = (User)session.getAttribute("user");
			
			RequestDispatcher view = request.getRequestDispatcher("/views/user/myPage.jsp");
			request.setAttribute("user", user);
			view.forward(request, response);			
		} else {
			// 세션이 만료가 되었는데 혹시 이동하려하려는 행위가 있으면 이쪽으로 보냄 
			RequestDispatcher view = request.getRequestDispatcher("/views/user/login.jsp");
			view.forward(request, response);			
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
