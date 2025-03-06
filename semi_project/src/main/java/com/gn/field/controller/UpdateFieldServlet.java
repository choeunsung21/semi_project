package com.gn.field.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gn.field.service.FieldService;
import com.gn.field.vo.Field;

@WebServlet("/updateField")
public class UpdateFieldServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public UpdateFieldServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tmp = request.getParameter("field_no");
		int fieldNo = 0;
		
		if(tmp != null) {
			// 규칙 목록 조회에서 들어올 것이기 때문에 반드시 null 값이 아님
			fieldNo = Integer.parseInt(tmp);
		}
		
		HttpSession session = request.getSession(false);
		
		if(session != null && session.getAttribute("user") != null) {
			/* 로그인 과정에서 만들어진 세션이 정상적으로 존재하는 경우 */
			Field field = new FieldService().selectFieldOneByFieldNo(fieldNo);
			
			String fieldSize = field.getFieldSize();
			String[] numbers = fieldSize.replaceAll("[^0-9 ]", "").split("\\s+");
			int fieldWidth = 0;
			int fieldHeight = 0;
			if(numbers != null) {
				fieldWidth = Integer.parseInt(numbers[0]);
				fieldHeight = Integer.parseInt(numbers[1]);
			}
			
			boolean sun = field.isSun();
			boolean mon = field.isMon();
			boolean tue = field.isTue();
			boolean wed = field.isWed();
			boolean thu = field.isThu();
			boolean fri = field.isFri();
			boolean sat = field.isSat();

			RequestDispatcher view = request.getRequestDispatcher("/views/field/updateField.jsp");
			
			request.setAttribute("field", field);
			request.setAttribute("fieldWidth", fieldWidth);
			request.setAttribute("fieldHeight", fieldHeight);
			request.setAttribute("sun", sun);
			request.setAttribute("mon", mon);
			request.setAttribute("tue", tue);
			request.setAttribute("wed", wed);
			request.setAttribute("thu", thu);
			request.setAttribute("fri", fri);
			request.setAttribute("sat", sat);
			
			view.forward(request, response);
			
		} else {
			/* 
			 * 로그인 과정에서 만들어진 세션이 정상적으로 존재하지 않는 경우
			 * 이미 로그아웃, 세션만료 과정에서 처리가 이루어졌기 때문에 이 조건문 안에 들어올 수 없음   
			 */
			System.out.println("InsertRuleServlet : 세션에 유저정보가 존재하지 않습니다.");
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
