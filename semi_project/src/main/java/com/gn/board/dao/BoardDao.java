package com.gn.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.board.vo.Attach;
import com.gn.board.vo.Board;

public class BoardDao {
	
	
	//게시판 목록 조회
	public List<Board> selectBoardList(SqlSession session,Board board){
		return session.selectList("boardMapper.boardList",board);
	}
	
	/*
	 * //게시판 검색 버튼에 제목을 입력했을때 public Board searchList(SqlSession session , String
	 * boardTitle) { return session.selectOne(boardTitle); }
	 */
	
	//행을 구하는 메소드
	public int selectBoardCount(SqlSession session, Board board) {
		return session.selectOne("boardMapper.selectBoardCount",board);
	}
	
	public int insertBoard(Board board,SqlSession session) {
		int result =  session.insert("boardMapper.boardWrite",board);
		System.out.println("인선트write : " + board.getBoardNo());
		return result;
	}
	
	public int insertAttach(Attach attach, SqlSession session ) {
		return session.insert("boardMapper.attachFile",attach);
		
		
	}

}
