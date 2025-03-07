package com.gn.apply.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.apply.service.ApplyService;
import com.gn.apply.vo.Apply;

// 가입 신청
@WebServlet("/insertApplyEnd")
public class InsertApplyEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public InsertApplyEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
	        String userNoStr = request.getParameter("user_no");
	        String teamNoStr = request.getParameter("team_no");
      
	        // null 체크
	        if (userNoStr == null || teamNoStr == null) {
	            response.sendRedirect(request.getContextPath() + "/views/team/fail.jsp");
	            return; // 처리 중단
	        }

	        int userNo = Integer.parseInt(userNoStr);
	        int teamNo = Integer.parseInt(teamNoStr);
	        
	        Apply opt = Apply.builder()
	        		.userNo(userNo)
	        		.teamNo(teamNo)
	        		.build();
	        
	        /* cjs 프론트에서 버튼이 안 눌러지게 막지만 백엔드에서 한 번 더 같은 팀에 여러번 신청 넣는 것 방지 */
	        Apply chkApply = new ApplyService().selectApplyByOptApply(opt);
	        
	        if(chkApply != null) {
	        	response.sendRedirect(request.getContextPath() + "/views/team/fail.jsp");
	        	return;
	        }
	        
	        String position = request.getParameter("position");
	        String applyArea = request.getParameter("apply_area");
	        String applyExplanation = request.getParameter("apply_explanation");

	        // Apply 객체 생성
	        Apply apply = Apply.builder()
	            .userNo(userNo)
	            .teamNo(teamNo)
	            .position(position)
	            .applyArea(applyArea)
	            .applyExplanation(applyExplanation)
	            .status("PENDING") // 쓰기 너무 어려움
	            .build();

	        // 서비스 호출
	        int result = new ApplyService().insertApply(apply);

	        if (result > 0) {
	            response.sendRedirect(request.getContextPath() + "/views/team/success.jsp");
	        } else {
	            response.sendRedirect(request.getContextPath() + "/views/team/fail.jsp");
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); // 예외 발생 시 로그 출력
	        response.sendRedirect(request.getContextPath() + "/views/team/fail.jsp");
	    }
	}
}