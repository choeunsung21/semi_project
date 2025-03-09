package com.gn.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.gn.user.service.UserService;
import com.gn.user.vo.User;

@WebServlet(name="selectUserByIdAndPw", urlPatterns="/selectUserByIdAndPw")
public class SelectUserByIdAndPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectUserByIdAndPwServlet() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("user_id");
		String userPw = request.getParameter("user_pw");
		
		/* 
		 * [cjs] userId, userPw 기준으로 User 객체가 조회되면 입력한 비밀번호가 맞는 것임
		 * 맞았을 때와 틀렸을 때 각각 JSON에 담아서 보내주면 됨
		 */
		
		User opt = User.builder()
				.userId(userId)
				.userPw(userPw)
				.build();
		
		User user = new UserService().selectUserByIdAndPw(opt);
		
		JSONObject obj = new JSONObject();
		
		if(user != null) {
			// 입력한 비밀번호가 맞는 경우 - 탈퇴가 가능한 상황
			obj.put("resultMsg", "탈퇴가능");
		} else {
			// 입력한 비밀번호가 틀린 경우 - 탈퇴가 불가능한 상황
			obj.put("resultMsg", "탈퇴불가능");
		}
		
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
