package com.gn.apply.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.apply.service.ApplyService;

@WebServlet("/approveApply")
public class ApproveApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ApproveApplyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int applyNo = Integer.parseInt(request.getParameter("applyNo"));
        String status = request.getParameter("action"); // "APPROVED" 또는 "REJECTED"

        ApplyService applyService = new ApplyService();
        boolean success = applyService.updateApplyStatus(applyNo, status);

        if (success) {
            request.getSession().setAttribute("message", "가입 신청이 " + status + "되었습니다.");
        } else {
            request.getSession().setAttribute("message", "처리 중 오류 발생!");
        }
        response.sendRedirect(request.getContextPath() + "/applyList.jsp");
    }
}

