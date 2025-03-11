package com.gn.team.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.team.service.TeamService;
import com.gn.team.vo.Team;


@WebServlet("/updateTeam")
public class UpdateTeamServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateTeamServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 String teamNoParam = request.getParameter("team_no");

         // 팀 번호가 제공되지 않은 경우 에러 처리
         if (teamNoParam == null || teamNoParam.isEmpty()) {
             request.setAttribute("message", "팀 번호가 제공되지 않았습니다.");
             RequestDispatcher view = request.getRequestDispatcher("/views/team/error.jsp");
             view.forward(request, response);
             return; // 더 이상 진행하지 않음
         }

         // 팀 번호를 정수로 변환
         int teamNo = Integer.parseInt(teamNoParam);

         // TeamService를 사용하여 팀 정보를 조회
         TeamService teamService = new TeamService();
         Team team = teamService.selectTeamNo(teamNo);

         // 팀 정보가 존재하지 않는 경우 에러 처리
         if (team == null) {
             request.setAttribute("message", "팀 정보를 찾을 수 없습니다.");
             RequestDispatcher view = request.getRequestDispatcher("/views/team/error.jsp");
             view.forward(request, response);
             return; // 더 이상 진행하지 않음
         }

         // 팀 정보를 request에 저장
         request.setAttribute("team", team);

         // 팀 수정 페이지로 포워드
         RequestDispatcher view = request.getRequestDispatcher("/views/team/updateTeam.jsp");
         view.forward(request, response);
     }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}