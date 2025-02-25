package com.gn.board.service;

import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.board.dao.BoardDao;
import com.gn.board.vo.Board;


public class BoardService {
	//게시글 페이지에 들어갔을 때 보여지는 메소드
	//boardno,boardtitle,boardwriter,regdate
	public List<Board> selectBoardList(Board board){
		SqlSession session = getSqlSession(true);
		List<Board> list = new BoardDao().selectBoardList(session,board);
		session.close();
		return list;
	}
	
	//행을 구하느 메소드
	public int selectBoardCount(Board board) {
		SqlSession session = getSqlSession(true);
		int result = new BoardDao().selectBoardCount(session,board);
		session.close();
		return result;
	}
	


}
