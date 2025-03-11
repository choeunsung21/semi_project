package com.gn.user.myPageController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;
import org.json.simple.JSONObject;

import com.gn.user.service.UserService;
import com.gn.user.vo.User;
import com.gn.user.vo.Player;
import com.gn.team.vo.Team;

@WebServlet("/MyPageMyTeamBtnServlet")
public class MyPageMyTeamBtnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyPageMyTeamBtnServlet() {
        super();
        
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		 request.setCharacterEncoding("UTF-8");
		 
		 HttpSession session = request.getSession();
		 User user = (User) session.getAttribute("user");
		 
		 int userNo = Integer.parseInt(request.getParameter("userNo"));
		 int teamNo = Integer.parseInt(request.getParameter("teamNo"));
		
		 Player player = Player.builder()
				 .userNo(userNo)
				 .teamNo(teamNo)
				 .build();
		 
		 //int result = new UserService().leaveTeam(player);
		
		 //JSON 응답 설정
		 response.setContentType("application/json; charset=UTF-8");
	     response.setCharacterEncoding("UTF-8");
		 
		 JSONObject obj = new JSONObject();
		 //obj.put("success", result > 0);
		 
		 PrintWriter out = response.getWriter();
	     out.write(obj.toString());
		 out.flush();
		 out.close();
		
		
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		doGet(request, response);
	}

}
