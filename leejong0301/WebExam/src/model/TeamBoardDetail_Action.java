package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class TeamBoardDetail_Action {
	static TeamBoardDetail_Action model = new TeamBoardDetail_Action();
	public static TeamBoardDetail_Action instance(){
		return model;
	}
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();


	public TeamBoardListDto teamBoardDetail(int teamBoardNo){
		TeamBoardListDto teamBoardOne = null;
		SqlSession sqlSession = factory.openSession();
		sqlSession.update("teamboardreadcount", teamBoardNo);
		teamBoardOne = sqlSession.selectOne("teamboarddetail",teamBoardNo);
		sqlSession.commit();
		sqlSession.close();
		return teamBoardOne;
	}

}
