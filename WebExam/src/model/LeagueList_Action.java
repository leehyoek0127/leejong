package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class LeagueList_Action {

	static LeagueList_Action model = new LeagueList_Action();

	public static LeagueList_Action instance() {
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public List<LeagueDto> getLeagueList() {
		System.out.println("¾×¼Ç±îÁö¿È");
		List<LeagueDto> leagueList = null;
		SqlSession sqlSession = factory.openSession();
		leagueList = sqlSession.selectList("leaguelist");
		sqlSession.close();
		return leagueList;
	}

}