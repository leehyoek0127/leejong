package model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class League_team_step3_Action {

	static League_team_step3_Action model = new League_team_step3_Action();

	public static League_team_step3_Action instance() {
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public int teamregist(PlayerRegistDto playerRegistDto, LeagueResultDto leagueResultDto) {
		System.out.println("�׼Ǳ�����");
		
		SqlSession sqlSession = factory.openSession();
		System.out.println("���⳪����?");
		int playerregistresult1 = sqlSession.insert("leagueteamregist", leagueResultDto);
		int playerregistresult2 = sqlSession.insert("leagueteamregistseoul", playerRegistDto);
		int playerregistresult3 = playerregistresult1+playerregistresult2;
		
		sqlSession.commit();
		sqlSession.close();
		return playerregistresult3;
	}
	

}