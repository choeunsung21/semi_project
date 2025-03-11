package com.gn.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.user.service.UserService;
import com.gn.user.vo.User;

@WebServlet(name="createEndServlet", urlPatterns="/createEnd")
public class CreateEndUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public CreateEndUserServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
//		String checkPw = request.getParameter("check_user_pw"); 
		String name = request.getParameter("user_name");
		String gender = request.getParameter("user_gender");
		String phone = request.getParameter("user_phone");
		String email = request.getParameter("user_email");
		int type = Integer.parseInt(request.getParameter("user_type"));
		
		
		
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
