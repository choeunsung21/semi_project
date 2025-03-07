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
		Integer userNo = (Integer) request.getSession().getAttribute("user_no");
        String teamNoStr = request.getParameter("team_no");
        String position = request.getParameter("position");
        String applyArea = request.getParameter("apply_area");
        String applyExplanation = request.getParameter("apply_explanation");

        // 로그인 체크 제거 (이미 로그인된 상태 가정)
        if (teamNoStr == null || teamNoStr.trim().isEmpty()) {
            request.getSession().setAttribute("message", "팀 번호가 유효하지 않습니다.");
            response.sendRedirect(request.getContextPath() + "/views/team/error.jsp");
            return;
        }

        int teamNo = Integer.parseInt(teamNoStr);
        Apply apply = Apply.builder()
                .userNo(userNo)
                .teamNo(teamNo)
                .position(position)
                .applyArea(applyArea)
                .applyExplanation(applyExplanation)
                .status("PENDING")
                .build();
        
        request.setAttribute("apply", apply);

        int result = new ApplyService().insertApply(apply);

        if (result > 0) {
            request.getSession().setAttribute("message", "가입 신청이 완료되었습니다.");
            response.sendRedirect(request.getContextPath() + "/views/team/teamList.jsp");
        } else {
            request.getSession().setAttribute("message", "가입 신청에 실패했습니다.");
            response.sendRedirect(request.getContextPath() + "/views/team/error.jsp");
        }
    }
}


