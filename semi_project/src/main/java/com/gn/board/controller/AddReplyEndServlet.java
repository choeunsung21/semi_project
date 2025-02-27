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


@WebServlet("/addReplyEndServlet")
public class AddReplyEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AddReplyEndServlet() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardNo = request.getParameter("boardNo");
		String writerNo = request.getParameter("writerNo");
		String replyContent = request.getParameter("replyContent");
		
		System.out.println(boardNo);
		System.out.println(writerNo);
		System.out.println(replyContent);
		
		Reply reply = Reply.builder()
				.boardNo(Integer.parseInt(boardNo))
				.writerNo(Integer.parseInt(writerNo))
				.replyContent(replyContent)
				.build();
		int result = new BoardService().insertReply(reply);
//		if(result > 0) {
//			System.out.println("성공적으로 댓글 성공!");
//		}else {
//			System.out.println("댓글달기 실패 ㅠㅠ");
//		}
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
