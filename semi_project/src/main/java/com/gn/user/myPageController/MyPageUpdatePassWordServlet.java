package com.gn.user.myPageController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.gn.user.service.UserService;
import com.gn.user.vo.User;

@WebServlet("/MyPageUpdatePassWordServlet")
public class MyPageUpdatePassWordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyPageUpdatePassWordServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		
		User user = new User();
		user.setUserId(id);
		user.setUserPw(pw);
		
		int result = new UserService().MyPageUpdatePw(user);
		
		JSONObject obj = new JSONObject();
		
		if(result > 0) {
			obj.put("success", true);
			obj.put("message","수정 완료");
		}else {
			obj.put("success", false);
			obj.put("message","수정 실패");
		}
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
