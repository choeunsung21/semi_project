package com.gn.apply.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.team.service.TeamService;
import com.gn.team.vo.Team;

// 가입 신청
@WebServlet("/insertApply")
public class InsertApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertApplyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		/* cjs 팀 신청 데이터 넘기는 과정 */
		
		String strUserNo = request.getParameter("userNo");
		String strTeamNo = request.getParameter("teamNo");
		
		
		if(strTeamNo != null && strUserNo != null) {
			int userNo = Integer.parseInt(strUserNo);
			int teamNo = Integer.parseInt(strTeamNo);
			
			Team team = new TeamService().selectTeamByTeamNo(teamNo);

			List<Team> myTeamList = new TeamService().selectMyTeamAll(userNo);
			
			RequestDispatcher view = request.getRequestDispatcher("/views/apply/insertApply.jsp");
			request.setAttribute("userNo", userNo);
			request.setAttribute("teamNo", teamNo);
			request.setAttribute("team", team);
			request.setAttribute("myTeamList", myTeamList);
			view.forward(request, response);
		} else {
			/* 상세보기 버튼을 눌렀을 때 제대로 안 들어오는 경우임 - 앞단이 제대로 구성되어있다면 이쪽으로 올 수 없음 */
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
}


