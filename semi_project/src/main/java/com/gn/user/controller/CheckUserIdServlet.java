package com.gn.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.gn.user.service.UserService;

@WebServlet("/checkIdServlet")
public class CheckUserIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public CheckUserIdServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String id = request.getParameter("user_id");
		
		int result = new UserService().checkIdUser(id);
		
		JSONObject obj = new JSONObject();
		obj.put("res_cods","사용 가능한 아이디다잉~");
		obj.put("res_msg", "사용 가능한 아이디 입니다.");
		
		if(result > 0) {
			obj.put("res_cods", "아이디 중복된다잉~");
			obj.put("res_msg", "아이디가 중복됩니다.");
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
