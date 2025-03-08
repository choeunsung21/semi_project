package com.gn.apply.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.apply.service.ApplyService;
import com.gn.apply.vo.Apply;
import com.gn.team.service.TeamService;
import com.gn.team.vo.Team;

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
		// cjs - 굳이 post에 쓸 필요 없었다고 생각함 - 중요하지 않으므로 일단 진행
		try {
	        String userNoStr = request.getParameter("user_no");
	        String teamNoStr = request.getParameter("team_no");
      
	        // cjs - null 체크
	        if (userNoStr == null || teamNoStr == null) {
	        	RequestDispatcher view = request.getRequestDispatcher("/views/apply/apply_fail.jsp");
	        	view.forward(request, response);
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
	        	RequestDispatcher view = request.getRequestDispatcher("/views/apply/apply_fail_duple.jsp");
	        	view.forward(request, response);
	        	return;
	        }
	        
	        /* 본인 팀은 가입이 안 되어야함 */
	        List<Team> chkTeamList = new TeamService().selectTeamListByUser(userNo);
	        
	        for(int i=0; i<chkTeamList.size(); i++) {
	        	int leaderNo = chkTeamList.get(i).getLeaderNo();
	        	
	        	if(leaderNo == userNo) {
	        		// 일단 프론트에서 가입신청 버튼이 아예 안 눌리게 막아놓긴 했음 - 여기는 만약을 위해 대비하는 느낌임
	        		RequestDispatcher view = request.getRequestDispatcher("/views/apply/apply_fail.jsp");
		        	view.forward(request, response);
		        	return;
	        	}
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
	        	RequestDispatcher view = request.getRequestDispatcher("/views/apply/apply_success.jsp");
	        	view.forward(request, response);
	        } else {
	        	/* 
	        	 * 중복신청인 경우 앞에서 return 시켜버렸기 때문에 올 수 없긴함
	        	 * 만약을 위해 에러 페이지로 넘겨주는 것도 좋을듯
	        	 */
	        	RequestDispatcher view = request.getRequestDispatcher("/views/apply/apply_fail.jsp");
	        	view.forward(request, response);
	        }
	    } catch (Exception e) {
	    	RequestDispatcher view = request.getRequestDispatcher("/views/apply/apply_fail.jsp");
        	view.forward(request, response);
	    }
	}
}