package com.gn.team.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.team.service.TeamService;
import com.gn.team.vo.Team;


@WebServlet("/updateTeamEnd")
public class UpdateTeamEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateTeamEndServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int teamNo = Integer.parseInt(request.getParameter("team_no"));
        String teamName = request.getParameter("team_name");
        String teamArea = request.getParameter("team_area");

        // 팀 객체 생성 및 값 설정
        Team team = new Team();
        team.setTeamNo(teamNo);
        team.setTeamName(teamName);
        team.setTeamArea(teamArea);

        int result = 0;
        try {
            // 팀 수정 서비스 호출
            result = new TeamService().updateTeam(team);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "팀 수정 중 오류가 발생했습니다. 관리자에게 문의하세요.");
            request.getRequestDispatcher("/views/team/error.jsp").forward(request, response);
            return;
        }

        // 수정 결과에 따른 처리
        if (result > 0) {
            // 성공적으로 수정된 경우, 팀 정보를 세션에 저장
            request.getSession().setAttribute("updatedTeam", team);
            response.sendRedirect(request.getContextPath() + "/teamList?nowPage=1"); // 팀 목록 페이지로 리다이렉트
        } else {
            request.setAttribute("message", "팀 수정에 실패했습니다.");
            request.getRequestDispatcher("/views/team/error.jsp").forward(request, response);
        }
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
