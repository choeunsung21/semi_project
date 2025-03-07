package com.gn.user.myPageController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.gn.team.vo.Team;
import com.gn.user.service.UserService;
import com.gn.user.vo.User;


@WebServlet("/MyPageMyTeamServlet")
public class MyPageMyTeamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MyPageMyTeamServlet() {
        super();
        
    }

	
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		if(user == null) {
			response.sendRedirect("/login.jsp");
			return;
		}
		
		List<Team> teamList = new UserService().selectMyTeam(user.getUserNo());
		
		JSONArray arr = new JSONArray();
		for(Team list : teamList) {
			JSONObject obj = new JSONObject();
			obj.put("teamName", list.getTeamName());
			obj.put("teamArea", list.getTeamArea());
			obj.put("teamLevel", list.getTeamLevel());
			obj.put("teamCount", list.getTeamCount());
			obj.put("teamExplanation", list.getTeamExplanation());
			arr.add(obj);
		}
		JSONObject obj1 = new JSONObject();
		obj1.put("list", arr);
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().print(obj1);
 	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
