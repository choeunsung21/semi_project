package com.gn.board.service;

import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.board.dao.BoardDao;
import com.gn.board.vo.Attach;
import com.gn.board.vo.Board;
import com.gn.board.vo.Reply;


public class BoardService {
	//게시글 페이지에 들어갔을 때 보여지는 메소드
	//boardno,boardtitle,boardwriter,regdate
	public List<Board> selectBoardList(Board board){
		SqlSession session = getSqlSession(true);
		List<Board> list = new BoardDao().selectBoardList(session,board);
		session.close();
		return list;
	}
	
	//행을 구하는 메소드
	public int selectBoardCount(Board board) {
		SqlSession session = getSqlSession(true);
		int result = new BoardDao().selectBoardCount(session,board);
		session.close();
		return result;
	}
	
	//게시글 작성 등록 메소드
	public int writeBoard(Board board,Attach attach) {
		SqlSession session = getSqlSession(false);
		int result = 0;
		int attachNo = 0;
		try {
			int boardNo = new BoardDao().insertBoard(board,session);
			
			if(attach != null) {
				attach.setBoardNo(board.getBoardNo());
				attachNo = new BoardDao().insertAttach(attach,session);	
			}
			
			if(attach != null) {
				if(boardNo != 0 && attachNo != 0) {
					result = 1;
					session.commit();
				}else {
					session.rollback();
				}
				
			}else {
				if(boardNo != 0) {
					result = 1;
					session.commit();
				}else {
					session.rollback();
				}
				
			}			
		}catch(Exception e){
			e.printStackTrace();
		}
		session.close();
		return result;
	}
	
	//상세조회를 했을 때의 메소드
	public Board selectBoardOne(int boardNo) {
		SqlSession session = getSqlSession(true);
		Board board = new BoardDao().selectBoardOne(session , boardNo);
		session.close();
		return board;
	}
	
	public Attach selectAttachOne(int attachNo) {
		SqlSession session = getSqlSession(true);
		Attach attach = new BoardDao().selectAttachOne(session,attachNo);
		session.close();
		return attach;
	}
	
	//댓글 등록 메소드
	public int insertReply(Reply reply) {
		SqlSession session = getSqlSession(true);
		int result = new BoardDao().insertReply(session,reply);
		session.close();
		return result;
	}
	
	public List<Reply> selctReplyList(int boardNo) {
		SqlSession session = getSqlSession(true);
		List<Reply> reply = new BoardDao().selctReplyList(session,boardNo);
		session.close();
		return reply;
	}
	
	//댓글 삭제 메소드
	public int deleteBoard(int boardNo) {
		SqlSession session = getSqlSession(false);
		int result = 0;
	
		try {
			int replyDelete = new BoardDao().deleteReply(session,boardNo);
			int attachDelete = new BoardDao().deleteAttach(session,boardNo);
			int boardDelete = new BoardDao().deleteBoard(session, boardNo);
		
			if(boardDelete > 0 && replyDelete >=0 && attachDelete >= 0) {
				result = 1;
				session.commit();
			}else {
				session.rollback();
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		session.close();
		return result;
	}
	



}
