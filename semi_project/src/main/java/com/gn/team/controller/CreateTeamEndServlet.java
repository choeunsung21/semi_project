package com.gn.team.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.team.service.TeamService;
import com.gn.team.vo.Team;

// 팀 가입 신청(일반 사용자)
@WebServlet("/createTeamEnd")
public class CreateTeamEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CreateTeamEndServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int teamLevel = 1; // 기본값 설정
		String level = request.getParameter("team_level");
		if (level != null && !level.isEmpty()) {
			teamLevel = Integer.parseInt(level); // 팀 실력 파싱
		}
		String teamArea = request.getParameter("team_area"); // 활동 지역
		String preferGender = request.getParameter("prefer_gender"); // 성별
		String teamExplanation = request.getParameter("team_explanation"); // 소개글
		
		Team team = Team.builder()
				.teamLevel(teamLevel)
				.teamArea(teamArea)
				.preferGender(preferGender)
				.teamExplanation(teamExplanation)
				.build();
		// 서비스 호출
		 int result = new TeamService().createTeam(team);
		 
		 if(result > 0) {
			 response.sendRedirect(request.getContextPath() +"/views/team/teamList.jsp"); 
		 } else {
			 response.sendRedirect(request.getContextPath() + "/views/team/teamDetail.jsp"); 
		}
	}
}
