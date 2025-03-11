package com.gn.apply.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.gn.apply.service.ApplyService;

@WebServlet("/receiveApplyEnd")
public class ReceiveApplyEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReceiveApplyEndServlet() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strApplyNo = request.getParameter("apply_no");
		if(strApplyNo != null) {
			int applyNo = Integer.parseInt(strApplyNo);
			String status = request.getParameter("status");
			
			// 1. applyNo를 기준으로 검색을 해서 status를 바꿔줘야함
			// 2. 바꿔준 후 다시 applyNo를 기준으로 Apply 객체를 셀렉트 한 후 
			// 3. 해당 데이터 자체를 그대로 player 테이블에 옮겨담아줄 것임 - user_no와 team_no가 필요함
			// (1~3번은 트랜잭션으로 한번에 해결할 것임)
			// 4. 셀렉트해온 Apply 객체에서 status를 JSONObject에 담아 옮겨줄 생각임
			
			JSONObject obj = new JSONObject();
			
			if("REJECTED".equals(status)) {
				// REJECTED 일 때는 update만 하면 됨
				int result = new ApplyService().updateApplyToRejected(applyNo);
				
				obj.put("apply_no", applyNo);
				obj.put("status", "REJECTED");
				obj.put("message", (result > 0) ? "거절 처리 완료" : "거절 처리 실패");
				
				response.setContentType("application/json;charset=utf-8");
				response.getWriter().print(obj);
				
			} else if("APPROVED".equals(status)) {
				int result = new ApplyService().updateApplyToApproved(applyNo);
				
				if(result > 0) {
					obj.put("apply_no", applyNo);
					obj.put("status", "APPROVED");
					obj.put("message", "승인 처리 완료");
				} else {
					new ApplyService().updateApplyToPending(applyNo);
					obj.put("apply_no", applyNo);
					obj.put("status", "PENDING");
					obj.put("message","승인 처리 실패");
					obj.put("opt_msg", "정원초과");
				}
				
				response.setContentType("application/json;charset=utf-8");
				response.getWriter().print(obj);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
