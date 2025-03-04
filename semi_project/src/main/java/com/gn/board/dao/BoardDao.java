package com.gn.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.board.vo.Attach;
import com.gn.board.vo.Board;
import com.gn.board.vo.Reply;

public class BoardDao {
	
	
	//게시판 목록 조회
	public List<Board> selectBoardList(SqlSession session,Board board){
		return session.selectList("boardMapper.boardList",board);
	}
	

	//행을 구하는 메소드
	public int selectBoardCount(SqlSession session, Board board) {
		return session.selectOne("boardMapper.selectBoardCount",board);
	}
	
	//게시판 등록 메소드
	public int insertBoard(Board board,SqlSession session) {
		int result =  session.insert("boardMapper.boardWrite",board);
		System.out.println("(BoardDao에 있습니다)인선트write : " + board.getBoardNo());
		return result;
	}
	
	//게시판 이미지 등록 트랜직션
	public int insertAttach(Attach attach, SqlSession session ) {
		return session.insert("boardMapper.attachFile",attach);			
	}
	
	//게시판 상세조회 메소드 -> 아이디,제목,등록일
	public Board selectBoardOne(SqlSession session, int boardNo) {
		return session.selectOne("boardMapper.selectDetail",boardNo);
	}
	
	public Attach selectAttachOne(SqlSession session , int attachNo) {
		return session.selectOne("boardMapper.selectAttach",attachNo);
	}
	
	public int insertReply(SqlSession session, Reply reply) {
		return session.insert("boardMapper.insertReply",reply);
	}
	
	public List<Reply> selctReplyList(SqlSession session, int boardNo) {
		return session.selectList("boardMapper.selectReply",boardNo);
	}
	
	//글 삭제 메소드
	public int deleteBoard(SqlSession session, int boardNo) {
		return session.delete("boardMapper.deleteBoard",boardNo);
	}
	
	//글 삭제 할떄 댓글 테이블도 지워지는 트랜직션 메소드
	public int deleteReply(SqlSession session, int boardNo) {
		return session.delete("boardMapper.deleteReply",boardNo);
	}
	//글 삭제 할떄 file이 있을경우 board_attach테이블이 지워지는 트랜직션 메소드
	public int deleteAttach(SqlSession session, int boardNo) {
		return session.delete("boardMapper.deleteAttach",boardNo);
	}
	
}
