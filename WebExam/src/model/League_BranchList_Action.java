package model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class League_BranchList_Action {

	static League_BranchList_Action model = new League_BranchList_Action();

	public static League_BranchList_Action instance() {
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public List<BranchDto> getLeagueBranchList() {
		
		
		
		
		
		List<BranchDto> leagueBranchList = null;
		SqlSession sqlSession = factory.openSession();
		leagueBranchList = sqlSession.selectList("leaguebranchlist");
		sqlSession.close();
		return leagueBranchList;
	}

}