package com.gn.field.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.field.service.FieldService;
import com.gn.field.vo.Field;

@WebServlet("/updateFieldEnd")
public class UpdateFieldEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateFieldEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tmp = request.getParameter("field_no");
		
		if(tmp != null) {
			// 이 페이지로 넘어온 이상 무조건 fieldNu를 지니고 있을 수밖에 없음
			int fieldNo = Integer.parseInt(tmp);
			
			Field field = new FieldService().selectFieldOneByFieldNo(fieldNo);
			
			System.out.println("UpdateFieldEndServlet 수정전 : "+field);
			
			// 구장명을 입력한 경우에만 해당 값을 객체에 담아줌
			if(!(request.getParameter("field_name_after") == null || "".equals(request.getParameter("field_name_after")))) {
				field.setFieldName(request.getParameter("field_name_after"));
			}
			
			// 주소를 입력한 경우에만 해당 값을 객체에 담아줌
			if(!(request.getParameter("field_addr") == null || "".equals(request.getParameter("field_addr")))) {
				field.setFieldAddr(request.getParameter("field_addr"));
			}
			
			// 수용인원을 입력한 경우에만 해당 값을 객체에 담아줌
			if(!(request.getParameter("field_limit") == null || "".equals(request.getParameter("field_limit")))) {
				field.setFieldLimit(Integer.parseInt(request.getParameter("field_limit")));
			}
			
			// 구장크기 : 가로와 세로 를 모두 입력했을 경우에만 해당 값을 객체에 담아줌
			if(!(request.getParameter("field_size_width") == null || "".equals(request.getParameter("field_size_width"))) && !(request.getParameter("field_size_height") == null || "".equals(request.getParameter("field_size_height")))) {
				field.setFieldSize(request.getParameter("field_size_width") + "(m) x " + request.getParameter("field_size_height") + "(m)");
			}
			
			// 실내/실외 선택된대로 객체에 담아줌
			switch(request.getParameter("is_indoor")) {
			case "0": 
				field.setIsIndoor("실내");
				break;
			case "1":
				field.setIsIndoor("실외");
				break;
			}
			
			// 인조잔디/천연잔디 선택된대로 객체에 담아줌
			switch(request.getParameter("field_type")) {
			case "0":
				field.setFieldType("인조잔디");
				break;
			case "1":
				field.setFieldType("천연잔디");
				break;
			}
			
			// 주차장여부 선택된대로 객체에 담아줌
			switch(request.getParameter("is_park")) {
			case "0":
				field.setIsPark(false);
				break;
			case "1":
				field.setIsPark(true);
				break;
			}
			
			// 샤워실여부 선택된대로 객체에 담아줌
			switch(request.getParameter("is_shower")) {
			case "0":
				field.setIsShower(false);
				break;
			case "1":
				field.setIsShower(true);
				break;
			}
			
			// 풋살화 대여 여부 관련하여 입력하면 입력한 값 / 비우면 null 을 객체에 담아줌 
			if("".equals(request.getParameter("rent_price"))) {
				field.setRentPrice(null);
			} else if(!(request.getParameter("rent_price") == null)) {
				field.setRentPrice(request.getParameter("rent_price"));
			} 
			
			// 특이사항을 입력하면 입력한 갑을 객체에 담아줌
			if(!(request.getParameter("message") == null || "".equals(request.getParameter("message")))) {
				field.setMessage(request.getParameter("message"));
			}
			
			// 휴무요일 정보를 객체에 담아줌
			field.setSun(false);
			field.setMon(false);
			field.setTue(false);
			field.setWed(false);
			field.setThu(false);
			field.setFri(false);
			field.setSat(false);
			
			for(int i=0; i<request.getParameterValues("dayoff_list").length; i++) {
				switch(request.getParameterValues("dayoff_list")[i]) {
				case "1":
					field.setSun(true);
					break;
				case "2":
					field.setMon(true);
					break;
				case "3":
					field.setTue(true);
					break;
				case "4":
					field.setWed(true);
					break;
				case "5":
					field.setThu(true);
					break;
				case "6":
					field.setFri(true);
					break;
				case "7":
					field.setSat(true);
					break;
				}
			}
					
//			int result = new FieldService().updateField(field);
//			
//			if(result > 0) {
//				// 수정이 정상적으로 이루어진 상황
//			} else {
//				// 수정 도중 문제가 발생한 상황 = 네트워크, 서버 등의 문제일 가능성 높음
//			}
			
			System.out.println("UpdateFieldEndServlet 수정후 : "+field);
			
		} else {
			// 만에 하나 이 조건문 안에 들어간다면 네트워크, 서버 등의 문제라고 예상됨
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
