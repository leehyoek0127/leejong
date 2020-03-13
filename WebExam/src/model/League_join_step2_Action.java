package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class League_join_step2_Action {

	static League_join_step2_Action model = new League_join_step2_Action();

	public static League_join_step2_Action instance() {
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public List<LeagueDto> getLeaguecode(int branch_no) {
		System.out.println("액션까지옴");
		List<LeagueDto> leaguecode = null;
		SqlSession sqlSession = factory.openSession();
		leaguecode = sqlSession.selectList("leagueselectone",branch_no);
		
		sqlSession.close();
		return leaguecode;
	}
	public List<TeamDto> getTeamList(String id) {
		System.out.println("액션까지옴");
		List<TeamDto> teamlist = null;
		SqlSession sqlSession = factory.openSession();
		teamlist = sqlSession.selectList("teamleaguelist",id);
		
		sqlSession.close();
		return teamlist;
	}

}