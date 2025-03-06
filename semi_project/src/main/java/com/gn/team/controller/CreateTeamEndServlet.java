package com.gn.team.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.team.service.TeamService;
import com.gn.team.vo.Team;

// 팀 가입 신청
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
		  	String teamNoParam = request.getParameter("team_no");
	        String userNoParam = request.getParameter("user_no"); // 수정: userNoParam에서 "user_no"로 변경

	        if (teamNoParam == null || userNoParam == null || teamNoParam.trim().isEmpty() || userNoParam.trim().isEmpty()) {
	            response.sendRedirect(request.getContextPath() + "/views/team/error.jsp");
	            return;
	        }

	        int teamNo = Integer.parseInt(teamNoParam);
	        int userNo = Integer.parseInt(userNoParam);

	        TeamService teamService = new TeamService();
	        boolean isJoined = teamService.insertPlayer(userNo, teamNo); // 팀 가입 신청
	        
	        System.out.println(teamNo);
	        System.out.println(userNo);

	        // 삽입 성공 시 성공 페이지로 이동
	        if (isJoined) {
	            response.sendRedirect(request.getContextPath() + "/views/team/success.jsp"); // 성공 페이지로 이동
	        } else {
	            response.sendRedirect(request.getContextPath() + "/views/team/error.jsp"); // 실패 시 에러 페이지로 이동
	        }
	    }
	}