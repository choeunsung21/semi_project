package com.gn.team.service;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.gn.team.dao.TeamDao;
import com.gn.team.vo.Team;

public class TeamService {
	public int insertTeam(Team team) {
	    SqlSession session = getSqlSession();
	    if (session == null) {
	        throw new RuntimeException("SqlSession이 null입니다."); // 예외 처리
	    }
	    int result = 0;

	    try {
	        result = new TeamDao().insertTeam(session, team);
	        if (result > 0) {
	            session.commit();
	        } else {
	            session.rollback();
	        }
	    } catch (Exception e) {
	        session.rollback();
	        e.printStackTrace();
	    } finally {
	        session.close(); // 세션 종료
	    }

	    return result;
	}

	private SqlSession getSqlSession() {
		return sqlSessionFactory.openSession();
	}
	private SqlSessionFactory sqlSessionFactory;

	public void init() {
	    try {
	        // MyBatis 설정 파일 로드
	        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
	        sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}
	public TeamService() {
        try {
            InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (IOException e) {
        	 // 오류 로그 출력
            e.printStackTrace();
            throw new RuntimeException("MyBatis 설정 파일을 로드하는 데 실패했습니다.");
        }
	}
	    public List<Team> receiveTeamListServlet() {
	    	SqlSession session = getSqlSession();
	        TeamDao teamDao = new TeamDao();
	        session.close();
	     // 받은 가입 신청 목록 조회
	        return teamDao.receiveTeamListServlet(); 
	    }
	    
	    public List<Team> sendTeamListServlet() {
	    	SqlSession session = getSqlSession();
	        TeamDao teamDao = new TeamDao();
	        session.close();
	     // 보낸 가입 신청 목록 조회
	        return teamDao.sendTeamListServlet(); 
	    }
	}




