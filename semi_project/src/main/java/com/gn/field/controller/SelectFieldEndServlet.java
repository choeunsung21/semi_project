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

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tmp = request.getParameter("fieldIndex");
		
		int fieldIndex = 0;
		if(tmp == null) {
			/* 셀렉트 태그이기 때문에 null 넘어올 수가 없긴 함 */
			return;
		}
		fieldIndex = Integer.parseInt(tmp);

		HttpSession session = request.getSession(false);
		
		if(session != null && session.getAttribute("user") != null) {
			/* 로그인 과정에서 만들어진 세션이 정상적으로 존재하는 경우 */
			User user = (User)session.getAttribute("user");

			List<Field> fieldList = new FieldService().selectFieldListByUser(user);
			
			if(!(fieldList == null || fieldList.size() == 0)) {
				Field field = null;
				
				for(int i=0; i<fieldList.size(); i++) {
					/* 입력받은 fieldIndex와 객체의 fieldNo 가 같을 때 해당 field를 뽑아내고 싶음 */
					if(fieldIndex == fieldList.get(i).getFieldNo()) {
						field = fieldList.get(i);
					}
				}
				
				if(field != null) {
					String isPark = "";
					if(field.getIsPark()) {
						isPark = "주차장 있음";
					} else {
						isPark = "주차장 없음";
					}
					
					String isShower = "";
					if(field.getIsShower()) {
						isShower = "샤워실 있음";
					} else {
						isShower = "샤워실 없음";
					}
					
					String rentPrice = "";
					if(field.getRentPrice() == null) {
						rentPrice = "대여 불가";
					} else {
						rentPrice = field.getRentPrice() + "원";
					}
					
					JSONObject obj = new JSONObject();
					obj.put("fieldName", field.getFieldName());
					obj.put("fieldAddr", field.getFieldAddr());
					obj.put("fieldSize", field.getFieldSize());
					obj.put("fieldLimit", field.getFieldLimit()+"명");
					obj.put("fieldType", field.getFieldType());
					obj.put("isIndoor", field.getIsIndoor());
					obj.put("isPark", isPark);
					obj.put("isShower", isShower);
					obj.put("rentPrice", rentPrice);
					
					response.setContentType("application/json;charset=utf-8");
					response.getWriter().print(obj);
				}

			} else {
				/* 
				 * 로그인 되어있는 유저가 구장을 등록하지 않은 상황임
				 * 프론트에서 구장을 등록하지 않았으면 스케줄 등록 자체가 보이지 않을 것이므로
				 * 이 조건문 안으로 들어오지 않게 됨
				 */
				
				System.out.println("SelectFieldEndServlet : 해당 유저는 구장을 등록하지 않았습니다.");
			}
			
		} else {
			/* 
			 * 로그인 과정에서 만들어진 세션이 정상적으로 존재하지 않는 경우
			 * 이미 로그아웃, 세션만료 과정에서 처리가 이루어졌기 때문에 이 조건문 안에 들어올 수 없음
			 */
			System.out.println("SelectFieldEndServlet : 세션에 유저정보가 존재하지 않습니다.");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
