package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.BranchDto;
import model.BranchList_Action;
import model.TeamBoardListDto;
import mybatis.SqlMapConfig;

public class TeamBoardListAction {
	static TeamBoardListAction model = new TeamBoardListAction();

	public static TeamBoardListAction instance() {
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public int getListCount() {
		int listCount = 0;
		SqlSession sqlSession = factory.openSession();
		listCount=sqlSession.selectOne("getteamboardcount");
		sqlSession.close();
		return listCount;
	}

	public List<TeamBoardListDto> getTeamBoardList(int page) {
		int startrow = (page - 1) * 9;
		List<TeamBoardListDto> teamboardlist = null;
		SqlSession sqlSession = factory.openSession();
		teamboardlist = sqlSession.selectList("teamboardlist",startrow);
		sqlSession.close();
		return teamboardlist;
	}
}
