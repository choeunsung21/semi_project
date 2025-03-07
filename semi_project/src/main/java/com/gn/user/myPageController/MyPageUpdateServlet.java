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

@WebServlet("/MyPageUpdateServlet")
public class MyPageUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyPageUpdateServlet() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("userId");
		String name = request.getParameter("userName");
		String email = request.getParameter("userEmail");
		String phone = request.getParameter("userPhone");
		
		User user = new User();
		user.setUserId(id);
		user.setUserName(name);
		user.setUserEmail(email);
		user.setUserPhone(phone);
		
		System.out.println("서블렛 확인");
		int result = new UserService().changeUserData(user);
	
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
