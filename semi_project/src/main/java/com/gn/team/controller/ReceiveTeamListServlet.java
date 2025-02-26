package com.gn.team.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.team.service.TeamService;
import com.gn.team.vo.Team;



@WebServlet("/receiveTeamList")
public class ReceiveTeamListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReceiveTeamListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TeamService teamService = new TeamService(); // doGet 내부에서 teamService 객체 생성
        List<Team> teamList = teamService.receiveTeamList(1); // 예제: teamNo를 1로 설정 (실제 값 필요)
        request.setAttribute("teamList", teamList);
        request.getRequestDispatcher("/receiveTeamList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
