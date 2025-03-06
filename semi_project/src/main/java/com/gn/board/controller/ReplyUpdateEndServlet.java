package com.gn.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.gn.board.service.BoardService;
import com.gn.board.vo.Reply;


@WebServlet("/replyUpdateEndServlet")
public class ReplyUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ReplyUpdateEndServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("replyNo");
		String replyContent = request.getParameter("replyContent");
		int replyNo = 0;
		if(temp != null) {
			replyNo = Integer.parseInt(temp);
		}
		Reply reply = new Reply();
		reply.setReplyNo(replyNo);
		reply.setReplyContent(replyContent);
		int result = new BoardService().updateReply(reply);
		/*
		 * System.out.println(replyNo + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		 * System.out.println(replyContent + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		 */
		JSONObject obj = new JSONObject();
		if(result > 0) {
			obj.put("res_code", 200);
			obj.put("res_msg", "정상적으로 댓글이 등록되었습니다");				
		}else {
			obj.put("res_code",500);
			obj.put("res_msg", "댓글 등록 중 오류가 발생하였습니다");		
		}
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);		
				
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
