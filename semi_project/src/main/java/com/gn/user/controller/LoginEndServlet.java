package com.gn.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gn.user.service.UserService;
import com.gn.user.vo.User;

@WebServlet("/loginEnd")
public class LoginEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginEndServlet() {
        super();
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = (String)request.getParameter("user_id");
		String pw = (String)request.getParameter("user_pw");
		
		User chkUser = User.builder()
				.userId(id)
				.userPw(pw)
				.build();
		
		User user = new UserService().loginUser(chkUser);
		
		if(user != null) {
			HttpSession session = request.getSession();
			if(session.isNew() || session.getAttribute("user") == null) {
				session.setAttribute("user", user);
//				session.setMaxInactiveInterval(60*1);
				response.sendRedirect("/");
			}
		}else {
			System.out.println("로그인 실패");
			//여기 수정해야 할 필요 있음.
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
