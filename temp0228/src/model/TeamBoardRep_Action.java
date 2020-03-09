package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class TeamBoardRep_Action {
	static TeamBoardRep_Action model = new TeamBoardRep_Action();
	public static TeamBoardRep_Action instance(){
		return model;
	}
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();


	public List<TeamBoardRepDto> teamBoardRep(int teamBoardNo){
		List<TeamBoardRepDto> teamBoardRep = null;
		SqlSession sqlSession = factory.openSession();			
		teamBoardRep = sqlSession.selectList("teamboardrep",teamBoardNo);
		sqlSession.close();
		return teamBoardRep;
	}
}
