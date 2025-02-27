package com.gn.user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.user.service.UserService;
import com.gn.user.vo.User;

@WebServlet("/createEnd")
public class CreateEndUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public CreateEndUserServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		String checkPw = request.getParameter("check_user_pw"); 
		String name = request.getParameter("user_name");
		String gender = request.getParameter("user_gender");
		String phone = request.getParameter("user_phone");
		String email = request.getParameter("user_email");
		int type = Integer.parseInt(request.getParameter("user_type"));
		
		 if (!pw.equals(checkPw)) {
	          System.out.println("비밀번호 불일치");
	          // 수정 해야 함
	        }

		User createUser = new User();
		createUser.setUserId(id);
		createUser.setUserPw(pw);
		//createUser.setCheckUserPw(checkPw);
		createUser.setUserName(name);
		createUser.setUserGender(gender);
		createUser.setUserPhone(phone);
		createUser.setUserEmail(email);
		createUser.setUserType(type);
		 
		int result = new UserService().createUser(createUser);	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
	


}
