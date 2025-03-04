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
    	  try {
              int leaderNo = Integer.parseInt(request.getParameter("user_no"));
              String teamName = request.getParameter("team_name");
              String teamArea = request.getParameter("team_area");
              String preferGender = request.getParameter("prefer_gender");
              int teamLevel = Integer.parseInt(request.getParameter("team_level"));
              int teamLimit = Integer.parseInt(request.getParameter("team_limit"));
              String teamExplanation = request.getParameter("team_explanation");

              // Team 객체 생성
              Team team = Team.builder()
                      .leaderNo(leaderNo)
                      .teamName(teamName)
                      .teamArea(teamArea)
                      .preferGender(preferGender)
                      .teamLevel(teamLevel)
                      .teamCount(1) // 팀 생성 시 팀장 1명 포함
                      .teamLimit(teamLimit)
                      .teamExplanation(teamExplanation)
                      .build();

              // 서비스 호출
              int result = new TeamService().insertTeam(team);

              if (result > 0) {
                  response.sendRedirect(request.getContextPath() + "/teamList?nowPage=1"); // 목록 페이지로 이동
              } else {
                  response.sendRedirect(request.getContextPath() + "/views/team/error.jsp");
              }
          } catch (Exception e) {
              e.printStackTrace();
              response.sendRedirect(request.getContextPath() + "/views/team/error.jsp");
          }
      }
  }
        