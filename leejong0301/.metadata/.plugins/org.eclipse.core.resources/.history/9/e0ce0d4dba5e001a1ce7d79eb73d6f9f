package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class League_join_teamcheck_Action {

	static League_join_teamcheck_Action model = new League_join_teamcheck_Action();

	public static League_join_teamcheck_Action instance() {
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public List<LeagueResultDto> leagueteamcheck(LeagueResultDto leagueResultDto) {
		System.out.println("액션까지옴");
		List<LeagueResultDto> leagueteamcheck = null;
		SqlSession sqlSession = factory.openSession();
		leagueteamcheck = sqlSession.selectList("leagueteamcheck",leagueResultDto);
		
		sqlSession.close();
		return leagueteamcheck;
	}
	public List<PlayerRegistDto> playerleaguecheck(PlayerRegistDto playerRegistDto) {
		System.out.println("액션까지옴");
		List<PlayerRegistDto> playerleaguecheck = null;
		SqlSession sqlSession = factory.openSession();
		System.out.println("앞에서온 아이디 "+playerRegistDto.getId());
		playerleaguecheck = sqlSession.selectList("playerleaguecheck",playerRegistDto);
		System.out.println("가져온아이디: "+playerleaguecheck.get(0).getId());
		sqlSession.close();
		return playerleaguecheck;
	}
	
	

}