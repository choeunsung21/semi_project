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

// 팀 목록 상세 페이지
@WebServlet("/teamDetail")
public class TeamDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TeamDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String teamNoStr = request.getParameter("teamNo");

        if (teamNoStr == null || teamNoStr.isEmpty()) {
            response.sendRedirect("/teamTeamList"); // 잘못된 접근 시 목록으로 이동
            return;
        }

        int teamNo = Integer.parseInt(teamNoStr);
        Team team = new TeamService().selectTeamNo(teamNo);

        if (team == null) {
            response.sendRedirect("/teamTeamList"); // 조회 실패 시 목록으로 이동
            return;
        }

        request.setAttribute("team", team);
        RequestDispatcher view = request.getRequestDispatcher("/views/team/teamDetail.jsp");
        view.forward(request, response);
    }
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
