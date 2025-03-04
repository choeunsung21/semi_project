package com.gn.user.myPageController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gn.user.vo.User;

@WebServlet("/MyPageCheckServlet")
public class MyPageCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyPageCheckServlet() {
        super();
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if(user != null) {
        	String name = user.getUserName();
        	String email = user.getUserEmail();
        	String phone = user.getUserPhone();
        	String gender = user.getUserGender();
        	
        	request.setAttribute("userName", name);
            request.setAttribute("userEmail", email);
            request.setAttribute("userPhone", phone);
            request.setAttribute("userGender", gender);
            
            //request.getRequestDispatcher("/myPage.jsp").forward(request, response);
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
