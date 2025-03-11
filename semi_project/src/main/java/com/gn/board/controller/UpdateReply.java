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


@WebServlet("/updateReply")
public class UpdateReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public UpdateReply() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("replyNo");
		String replyContent = request.getParameter("replyContent");
		String test = request.getParameter("boardNo");
		int boardNo = 0;
		if(test != null) {
			boardNo = Integer.parseInt(test);
		}
		
		
		
		int replyNo = 0;
		if(temp != null) {
			replyNo = Integer.parseInt(temp);
		}
//		System.out.println(boardNo);
//		System.out.println(replyContent);
//		System.out.println(replyNo);
		Reply reply = new Reply();
		reply.setBoardNo(boardNo);
		reply.setReplyNo(replyNo);
		reply.setReplyContent(replyContent);
		int result = new BoardService().updateReply(reply);
//		System.out.println(result);
//		
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
		doGet(request, response);
	}

}
