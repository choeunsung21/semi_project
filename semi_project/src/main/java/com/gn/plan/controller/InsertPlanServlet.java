package com.gn.plan.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gn.field.service.FieldService;
import com.gn.field.vo.Field;
import com.gn.user.vo.User;

@WebServlet("/insertPlan")
public class InsertPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertPlanServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		// 세션확인
		if(session != null && session.getAttribute("user") != null) {
			User user = (User)session.getAttribute("user");
			
			List<Field> fieldList = new FieldService().selectFieldListByUser(user);
			
			RequestDispatcher view = request.getRequestDispatcher("/views/plan/insertPlan.jsp");
			request.setAttribute("fieldList", fieldList);
			view.forward(request, response);
			
		} else {
			request.getRequestDispatcher("/views/user/login.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
