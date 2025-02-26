package com.gn.team.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.gn.team.service.TeamService;
import com.gn.team.vo.Team;

// 팀 생성 프론트 작업할 예정
@WebServlet("/insertTeamEnd")
public class InsertTeamEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertTeamEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  try {
	            // 요청시 전달된 데이터를 담을 바구니
	            String teamName = request.getParameter("team_name");
	            String teamArea = request.getParameter("team_area");
	            String userGender = request.getParameter("user_gender");
	            String teamLevel = request.getParameter("team_level");
	            int teamCount = Integer.parseInt(request.getParameter("team_count"));
	            String teamExplanation = request.getParameter("team_explanation");

	            // Team 객체 생성 및 데이터 세팅
	            Team team = new Team();
	            team.setTeamName(teamName);
	            team.setTeamArea(teamArea);
	            team.setUserGender(userGender);
	            team.setTeamLevel(teamLevel);
	            team.setTeamCount(teamCount);
	            team.setTeamExplanation(teamExplanation);

	            // 팀 생성 서비스 호출
	            int result = new TeamService().insertTeam(team);

	            // 결과 처리
	            if (result > 0) {
	                // 성공적으로 생성된 경우 팀 목록 페이지로 리다이렉트
	                response.sendRedirect("teamList.jsp");
	            } else {
	                // 실패한 경우 에러 페이지로 리다이렉트 또는 에러 메시지 처리
	                request.setAttribute("errorMessage", "팀 생성에 실패했습니다.");
	                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
	            }
	        } catch (NumberFormatException e) {
	            // 숫자 형식 오류 처리
	            request.setAttribute("errorMessage", "최대 인원 수는 숫자여야 합니다.");
	            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
	        } catch (Exception e) {
	            // 기타 오류 처리
	            request.setAttribute("errorMessage", "알 수 없는 오류가 발생했습니다.");
	            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
	        }
	    }
//		// 1. 요청시 전달된 데이터를 담을 바구니
//		String teamName = request.getParameter("team_name");
//		String teamArea = request.getParameter("team_area");
//		String userGender = request.getParameter("user_gender");
//		String teamLevel = request.getParameter("team_level");
//		int teamCount = Integer.parseInt(request.getParameter("team_count"));
//		String teamExplanation = request.getParameter("team_explanation");
//		
//		Team team = new Team();
//		team.setTeamName(teamName);
//		team.setTeamArea(teamArea);
//		team.setUserGender(userGender);
//		team.setTeamLevel(teamLevel);
//		team.setTeamCount(teamCount);
//		team.setTeamExplanation(teamExplanation);
//		int result = new TeamService().insertTeam(team);
//		System.out.println(team);
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
