package com.gn.user.myPageController;

import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.gn.board.vo.Board;
import com.gn.user.service.UserService;
import com.gn.user.vo.User;

@WebServlet("/MyPageBoardServlet")
public class MyPageBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyPageBoardServlet() {
        super();
      
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		if(user == null) {
			response.sendRedirect("/login.jsp");
			return;
		}

		List<Board> boardList = new UserService().selectBoardsByUse(user.getUserNo());
		
		JSONArray arr = new JSONArray();
		for(Board list : boardList) {
			JSONObject obj = new JSONObject();
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yy-MM-dd HH:mm");
			obj.put("writerNo", list.getWriterNo());
			obj.put("boardNo", list.getBoardNo());
			obj.put("boardTitle", list.getBoardTitle());
			obj.put("userId", list.getUserId());
			obj.put("regDate", list.getRegDate().format(dtf));
			arr.add(obj);
		}
		JSONObject obj1 = new JSONObject();
		obj1.put("list", arr);
		
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().print(obj1);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
