package com.gn.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.gn.user.service.UserService;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteUserServlet() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// [cjs] 비밀번호 유효성 끝난 상황에서 유저아이디 기준으로 조회되는 객체를 딜리트하는 절차
		String userId = request.getParameter("user_id");
		
		int result = new UserService().deleteUser(userId);
		
		JSONObject obj = new JSONObject();
		
		if(result > 0) {
			// 삭제가 된 상황이라면 세션 만료 시켜줌 - 만약 도중에 문제가 생긴다? 사실 로그아웃 되기때문에 문제될게 없음
			HttpSession session = request.getSession(false);
			if(session != null && session.getAttribute("user") != null){
				session.removeAttribute("user");
				session.invalidate();
			}
			
			// 유지보수 측면에서 확인하기 편하라고 일단 JSON객체에 담아주긴 했는데 딱히 사용하진 않음
			obj.put("msg_delete_user", "탈퇴완료");
		} else {
			obj.put("msg_delete_user", "탈퇴실패");
		}
		
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
