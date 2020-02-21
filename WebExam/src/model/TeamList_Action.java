package model;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class TeamList_Action {
	
	static TeamList_Action model = new TeamList_Action();
	public static TeamList_Action instance(){
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();


	public List<TeamDto> getTeamList(){
		List<TeamDto> TeamList = null;
		SqlSession sqlSession = factory.openSession();			
		TeamList = sqlSession.selectList("teamlist_view");
		sqlSession.close();
		return TeamList;
	}
	
	public List<TeamDto> getRegistPlayer(){
		List<TeamDto> TeamList = null;
		SqlSession sqlSession = factory.openSession();			
		TeamList = sqlSession.selectList("registplayer_view");
		sqlSession.close();
		return TeamList;
	}
	
	public List<TeamDto> selectTeamOne(TeamDto team){ //team 클릭 시 해당 팀 보기
		List<TeamDto> list = null;
		TeamDto obb = team;
		System.out.println("obb에 teamcode 담기는지 확인"+obb.getT_code());
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("teamone", obb);  
		
		System.out.println("접근 및 사이즈"+list.size());
		sqlSession.close();
		return list;
	}


}
