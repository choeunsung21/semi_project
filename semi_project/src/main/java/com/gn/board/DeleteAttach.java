package com.gn.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.gn.board.service.BoardService;


@WebServlet("/deleteAttach")
public class DeleteAttach extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DeleteAttach() {
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("attachNo");
		int attachNo = 0;
		if(temp != null) {
			attachNo = Integer.parseInt(temp);
		}
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + attachNo+"!!!!!!!!!!!!!!!!!!!!!");
		int result = new BoardService().deleteAttachNo(attachNo);
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
