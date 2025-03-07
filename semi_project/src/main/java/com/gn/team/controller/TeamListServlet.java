package com.gn.team.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gn.team.service.TeamService;
import com.gn.team.vo.Team;
import com.gn.user.vo.User;

// 전체 팀 목록
@WebServlet("/teamList")
public class TeamListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public TeamListServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	    	
    	String teamNo = request.getParameter("team_no");
    	String nowPage = request.getParameter("nowPage");

        Team team = new Team();
        if(teamNo != null) {
        	team.setTeamNo(Integer.parseInt(teamNo));
        } else if(nowPage != null) {
            team.setNowPage(Integer.parseInt(nowPage));
        } else {
            team.setNowPage(1);  // 기본값 설정
        }

        // 전체 데이터 조회
        List<Team> list = new TeamService().selectTeamList(team);
        request.setAttribute("list", list);
        request.setAttribute("page", team);
        RequestDispatcher view = request.getRequestDispatcher("/views/team/teamList.jsp");
        view.forward(request, response);
    }
    	  	 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request,response);
    	
    }
}
