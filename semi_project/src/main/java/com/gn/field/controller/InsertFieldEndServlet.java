package com.gn.field.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.field.service.FieldService;
import com.gn.field.vo.Field;

@WebServlet("/insertFieldEnd")
public class InsertFieldEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertFieldEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = null;
		
		String fieldName = (String)request.getParameter("field_name");
		String fieldAddr = (String)request.getParameter("field_addr");

		int fieldLimit = 0;
		temp = (String)request.getParameter("field_limit");
		if(temp != null && temp.length() != 0) {
			fieldLimit = Integer.parseInt(temp);
		}
		
		String fieldSize = "";
		temp = (String)request.getParameter("field_size_width");
		if(temp != null && temp.length() != 0) {
			fieldSize += temp;
			temp = (String)request.getParameter("field_size_height");
			if(temp != null) fieldSize += "*"+temp;			
		}
		
		String isIndoor = "실내";
		temp = (String)request.getParameter("is_indoor");
		if("1".equals(temp)) {
			isIndoor = "실외";
		}
		
		String fieldType = "인조잔디";
		temp = (String)request.getParameter("field_type");
		if("1".equals(temp)) {
			fieldType = "천연잔디";
		}
		
		boolean isPark = false;
		temp = (String)request.getParameter("is_park");
		if("1".equals(temp)) {
			isPark = true;
		}
		
		boolean isShower = false;
		temp = (String)request.getParameter("is_shower");
		if("1".equals(temp)) {
			isShower = true;
		}
		
		String message = "";
		temp = (String)request.getParameter("message");
		if(temp != null && temp.length() != 0) {
			message += temp;
		}
		
		Field field = Field.builder()
				.fieldName(fieldName)
				.fieldAddr(fieldAddr)
				.fieldLimit(fieldLimit)
				.fieldSize(fieldSize)
				.isIndoor(isIndoor)
				.fieldType(fieldType)
				.isPark(isPark)
				.isShower(isShower)
				.message(message)
				.build();
		
		temp = (String)request.getParameter("rent_price");
		if(temp != null && temp.length() != 0) {
			int rentPrice = Integer.parseInt(temp);
			field.setRentPrice(rentPrice);
		}
		
		String[] tempArr = (String[])request.getParameterValues("chk_dayoff");		
		
		if(tempArr != null && tempArr.length != 0) {
			int[] chkDayoff = new int[tempArr.length];
			
			for(int i=0; i<tempArr.length; i++) {
				chkDayoff[i] = Integer.parseInt(tempArr[i]);
			}
			
			field.setDayoffNo(chkDayoff);
		}
		
		int result = new FieldService().insertField(field);
		System.out.println("InsertFieldEndServlet : " + result);
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
; 