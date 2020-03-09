package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class League_join_step3_Action {

	static League_join_step3_Action model = new League_join_step3_Action();

	public static League_join_step3_Action instance() {
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public int playerregist(PlayerRegistDto playerRegistDto) {
		System.out.println("액션까지옴");
		
		SqlSession sqlSession = factory.openSession();
		System.out.println("여기나오나?");
		int playerregistresult1 = sqlSession.insert("leagueplayerregist", playerRegistDto);
		
		
		
		sqlSession.commit();
		sqlSession.close();
		return playerregistresult1;
	}
	

}