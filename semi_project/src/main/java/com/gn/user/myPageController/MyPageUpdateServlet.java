package com.gn.user.myPageController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gn.user.vo.User;

@WebServlet("/myPageUpdateServlet")
public class MyPageUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyPageUpdateServlet() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		if(user != null) {
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String phone = request.getParameter("user_phone");
			String gender = request.getParameter("user_gender");
			
			user.setUserName(name);
			user.setUserEmail(email);
			user.setUserPhone(phone);
			user.setUserGender(gender);
			
			request.setAttribute("user", user);
		}
			response.sendRedirect("myPage");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
