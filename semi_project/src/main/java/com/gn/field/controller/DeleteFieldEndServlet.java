package com.gn.field.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.field.service.FieldService;
import com.gn.field.vo.Field;
import com.gn.field.vo.FieldAttach;
import com.gn.plan.service.PlanService;
import com.gn.plan.vo.Plan;

@WebServlet("/deleteFieldEnd")
public class DeleteFieldEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public DeleteFieldEndServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tmp = request.getParameter("field_no");
		
		if(tmp != null) {
			int fieldNo = Integer.parseInt(tmp);
			Field field = new FieldService().selectFieldOneByFieldNo(fieldNo);

			List<Plan> planList = new PlanService().selectPlanListByFieldNo(fieldNo);
			
			if(planList.size() == 0 || planList == null) {
				// 해당 구장에 오늘 이후로 등록된 일정이 없는 경우는 삭제 가능함
				
				FieldAttach fieldAttach = new FieldService().selectFieldAttachByFieldNo(fieldNo);
				String deletePath = fieldAttach.getFilePath();
				
				int result = new FieldService().deleteFieldByField(field);
				
				if(result > 0) {
					// 삭제가 제대로 이루어진 상황 - 파일 삭제해줘야함
					File deleteFile = new File(deletePath);
					
					if(deleteFile.exists()) {
						deleteFile.delete();
					}
					
					// 삭제가 제대로 이루어진 상황 - 성공페이지
					RequestDispatcher view = request.getRequestDispatcher("/views/field/deleteField_success.jsp");
					view.forward(request, response);
					
				} else {
					// 알 수 없는 이유로 삭제가 제대로 이루어지지 않은 상황 - 네트워크 또는 서버 이슈일 가능성이 높음
					
				}
				
			} else {
				// 해당 구장에 오늘 이후로 등록된 일정이 있는 경우는 확인이 필요함
				RequestDispatcher view = request.getRequestDispatcher("/views/field/deleteField_fail.jsp");
				view.forward(request, response);
			}
			
		} else {
			/* 
			 * fieldNo가 제대로 넘어오지 않은 경우 - 제대로된 절차대로라면 이쪽으로 절대 넘어올 수 없음
			 * 네트워크 문제, DB 서버 연결 문제 등 정말 문제 상황들임
			 * 다시 시도해보고 그래도 안 되면 관리자에게 문의해야하는 상황임
			 */ 
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
