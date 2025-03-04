package com.gn.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.gn.board.service.BoardService;
import com.gn.board.vo.Reply;


@WebServlet("/selectReplyList")
public class SelectReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SelectReplyList() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("boardNo");
		int boardNo = 0;
		if(temp != null) {
			boardNo = Integer.parseInt(temp);
		}
		//정보가 잘 넘어온다!
//		System.out.println(boardNo);
		List<Reply> reply = new BoardService().selctReplyList(boardNo);
		System.out.println("(나는 selectReplyLIST에 있어)" + reply);
		//reply를 set해준다 그리고 넘겨준다
		//jason오브젝트로
		JSONObject obj = new JSONObject();
		for(Reply replylist : reply) {
			obj.put("writerNo", replylist.getBoardNo());
			obj.put("boardNo", replylist.getBoardNo());
			obj.put("replyContent", replylist.getReplyContent());
		}
		
		response.setContentType("application/json; charset = utf-8");
		response.getWriter().print(obj);
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
