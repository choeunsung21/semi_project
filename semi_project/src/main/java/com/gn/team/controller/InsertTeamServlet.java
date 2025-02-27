package com.gn.team.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.team.service.TeamService;
import com.gn.team.vo.Team;

// 팀 생성
@WebServlet("/insertTeam")
public class InsertTeamServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public InsertTeamServlet() {
    	super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	RequestDispatcher view = request.getRequestDispatcher("/views/team/insertTeam.jsp");
    	view.forward(request, response); 
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doGet(request, response);
    }
}
// 여기까지가 맞는 코드