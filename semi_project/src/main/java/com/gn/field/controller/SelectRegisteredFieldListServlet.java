package com.gn.field.controller;

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

@WebServlet("/selectRegisteredFieldList")
public class SelectRegisteredFieldListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectRegisteredFieldListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션에서 유저정보 가져오기
		HttpSession session = request.getSession(false);
				
		if(session != null && session.getAttribute("user") != null) {
			/* 로그인 과정에서 만들어진 세션이 정상적으로 존재하는 경우 */
			User user = (User)session.getAttribute("user");
			String nowPage = request.getParameter("nowPage");
			
			Field option = new Field();
			option.setUserNo(user.getUserNo());
			
			if(nowPage != null) {
				option.setNowPage(Integer.parseInt(nowPage));
			}
			
			int totalData = new FieldService().selectFieldCount(option);
			
			option.setTotalData(totalData);
			
			List<Field> registeredFieldList = new FieldService().selectFieldByField(option);
			
			RequestDispatcher view = request.getRequestDispatcher("/views/field/selectRegisteredFieldList.jsp");
			request.setAttribute("registeredFieldList", registeredFieldList);
			request.setAttribute("fieldPaging", option);
			view.forward(request, response);
			
		} else {
			RequestDispatcher view = request.getRequestDispatcher("/login");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
