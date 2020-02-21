package action;

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

	public List<TeamBoardListDto> getTeamBoardList() {
		List<TeamBoardListDto> teamboardlist = null;
		SqlSession sqlSession = factory.openSession();
		teamboardlist = sqlSession.selectList("teamboardlist");
		sqlSession.close();
		return teamboardlist;
	}
}
