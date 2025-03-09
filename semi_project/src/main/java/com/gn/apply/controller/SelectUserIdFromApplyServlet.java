package com.gn.apply.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.gn.apply.service.ApplyService;
import com.gn.user.vo.User;

@WebServlet("/SelectUserIdFromApply")
public class SelectUserIdFromApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectUserIdFromApplyServlet() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strApplyNo = request.getParameter("apply_no"); 
		String[] applyNoList = strApplyNo.split(",");
		
		JSONArray jsonArray = new JSONArray();
		
		for (String tmp : applyNoList) {
            
            // apply_no를 기준으로 user_id를 추출해옴
            if(tmp != null && tmp.length() != 0) {
            	int applyNo = Integer.parseInt(tmp);
            	User user = new ApplyService().selectUserByApplyNo(applyNo);
            	
            	if (user != null) {
                    jsonArray.add(user.getUserId());  // JSONArray에 userId 추가
                }
            }
        }
		
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().write(jsonArray.toString());	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
