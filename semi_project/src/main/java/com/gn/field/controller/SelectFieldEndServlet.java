package com.gn.field.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.gn.field.service.FieldService;
import com.gn.field.vo.Field;
import com.gn.user.vo.User;

@WebServlet("/selectFieldEnd")
public class SelectFieldEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectFieldEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userNo = request.getParameter("userNo");
		String fieldIndex = request.getParameter("fieldIndex");
		
		User user = null;
		
		HttpSession session = request.getSession(false);
		
		if(session != null && session.getAttribute("user") != null) {
			/* 로그인 과정에서 만들어진 세션이 정상적으로 존재하는 경우 */
			user = (User)session.getAttribute("user");
		}
		
		System.out.println("SelectFieldEndServlet : " + user);
		System.out.println("SelectFieldEndServlet : " + fieldIndex);
		
		List<Field> fieldList = new FieldService().selectFieldListByUser(user);
		
		System.out.println("SelectFieldEndServlet : " + fieldList);
		
		JSONObject obj = new JSONObject();
		

		
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
