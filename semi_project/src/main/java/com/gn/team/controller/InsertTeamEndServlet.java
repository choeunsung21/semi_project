package com.gn.team.controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.team.service.TeamService;
import com.gn.team.vo.Team;

// 팀 생성 프론트
@WebServlet("/insertTeamEnd")
public class InsertTeamEndServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public InsertTeamEndServlet() {
    	super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // 한글 인코딩 설정

        int leaderNo = Integer.parseInt(request.getParameter("user_no")); // 팀장 번호
        String teamName = request.getParameter("team_name"); // 팀 이름
        String teamArea = request.getParameter("team_area"); // 팀 지역
        String preferGender = request.getParameter("prefer_gender"); // 성별

        int teamLevel = 1; // 기본값 설정
        String temp = request.getParameter("team_level");
        if (temp != null && !temp.isEmpty()) {
            teamLevel = Integer.parseInt(temp); // 팀 실력 파싱
        }

        int teamCount = 0; // 기본값 설정
        temp = request.getParameter("team_count");
        if (temp != null && !temp.isEmpty()) {
            teamCount = Integer.parseInt(temp); // 팀 인원 파싱
        }

        int teamLimit = 0; // 기본값 설정
        temp = request.getParameter("team_limit");
        if (temp != null && !temp.isEmpty()) {
            teamLimit = Integer.parseInt(temp); // 팀 정원 파싱
        }

        String teamExplanation = request.getParameter("team_explanation"); // 팀 설명

        // Team 객체 생성
        Team team = Team.builder()
                .leaderNo(leaderNo)
                .teamName(teamName)
                .teamArea(teamArea)
                .preferGender(preferGender)
                .teamLevel(teamLevel)
                .teamCount(teamCount)
                .teamLimit(teamLimit)
                .teamExplanation(teamExplanation)
                .build();

        // 서비스 호출
        int result = new TeamService().insertTeam(team);

        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/views/team/success.jsp"); // 성공 페이지로 리다이렉트
        } else {
            response.sendRedirect(request.getContextPath() + "/views/team/error.jsp"); // 실패 페이지로 리다이렉트
        }
    }
}
// 여기까지가 맞는 코드