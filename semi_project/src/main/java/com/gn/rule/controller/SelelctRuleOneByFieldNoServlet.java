package com.gn.rule.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.gn.rule.service.PlanRuleService;
import com.gn.rule.vo.PlanRule;

@WebServlet("/selectRuleEnd")
public class SelelctRuleOneByFieldNoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelelctRuleOneByFieldNoServlet() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		

		// 셀렉트 창에서 넘어오기 때문에 null 일 수가 없는 데이터이긴 함
		String tmp = request.getParameter("fieldNo");
		
		if(tmp != null) {
			int fieldNo = Integer.parseInt(tmp);
			
			// 필드 넘버를 기준으로 등록된 룰이 있는지 없는지 살펴볼예정 - SELECT * FROM `rule` WHERE `field_no` = #{fieldNo};
			PlanRule pr = new PlanRuleService().selectRuleOneByFieldNo(fieldNo);
			
			JSONObject obj = new JSONObject();
			obj.put("printMsg", "");
			obj.put("printFlag", "null");
			
			if(pr != null) {
				obj.put("printMsg", "*선택하신 구장은 이미 등록된 규칙이 있습니다.");
				obj.put("printFlag", "not null");
			}
			
			response.setContentType("application/json;charset=utf-8");
			response.getWriter().print(obj);
			
			
		} else {
			// 넘어온 데이터가 없다면 아무런 동작도 하지 않습니다.
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
