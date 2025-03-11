package com.gn.team.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gn.user.vo.User;

// 팀 생성
@WebServlet("/insertTeam")
public class InsertTeamServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public InsertTeamServlet() {
    	super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// cjs : 세션의 유저정보를 바로 못 가져다 쓰기 때문에 넘어가기 전에 같이 넘겨줌
    	HttpSession session = request.getSession(false);

		if(session != null && session.getAttribute("user") != null) {
			/* 로그인 과정에서 만들어진 세션이 정상적으로 존재하는 경우 */
			User user = (User)session.getAttribute("user");
	    	
			RequestDispatcher view = request.getRequestDispatcher("/views/team/insertTeam.jsp");
			request.setAttribute("userNo", user.getUserNo());
	    	view.forward(request, response); 
		
		} else {
	    	RequestDispatcher view = request.getRequestDispatcher("/views/team/insertTeam.jsp");
	    	view.forward(request, response); 
		}
    	

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doGet(request, response);
    }
}
