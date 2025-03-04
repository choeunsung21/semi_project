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
    private SqlSessionFactory sqlSessionFactory;

    public TeamService() {
        try {
            InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("MyBatis 설정 파일을 로드하는 데 실패했습니다.");
        }
    }
    // 팀 생성
    public int insertTeam(Team team) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            int result = new TeamDao().insertTeam(session, team);
            if (result > 0) session.commit();
            return result;
        }
    }
    public List<Team> selectTeamList(Team team) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            // 전체 데이터 개수를 가져와 설정
            int totalData = new TeamDao().selectTeamCount(session, team);
            team.setTotalData(totalData);
            return new TeamDao().selectTeamList(session, team);
        }
    }

    // 전체 팀 개수 조회 (페이징 처리용)
    public int selectTeamCount(Team team) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return new TeamDao().selectTeamCount(session, team);
        }
    }

    // 특정 팀 상세 조회
    public Team selectTeamNo(int teamNo) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return new TeamDao().selectTeamNo(session, teamNo);
        }
    }
    // 팀 신청 (일반 사용자)
    public int createTeam(Team team) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            int result = new TeamDao().createTeam(session, team);
            if (result > 0) session.commit();
            return result;
        }
    }
    // 받은 신청 목록 조회 (팀장용)
    public List<Team> receiveTeamList(int leaderNo) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return new TeamDao().receiveTeamList(session, leaderNo);
        }
    }
    // 보낸 신청 목록 조회 (사용자용)
    public List<Team> sendTeamList(int userNo) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return new TeamDao().sendTeamList(session, userNo);
        }
    }
    // 팀 수정 (팀장용)
    public boolean updateTeam(Team team) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            int result = new TeamDao().updateTeam(session, team);
            if (result > 0) session.commit();
            return result > 0;
        }
    }
    // 팀 삭제
    public boolean deleteTeam(int teamNo) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            int result = new TeamDao().deleteTeam(session, teamNo);
            if (result > 0) session.commit();
            return result > 0;
        }
    }
}


		
		
	




