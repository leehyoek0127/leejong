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
	
	public List<TeamDto> selectTeamOne(TeamDto team){ //team Ŭ�� �� �ش� �� ����
		List<TeamDto> list = null;
		TeamDto obb = team;
		System.out.println("obb�� teamcode ������ Ȯ��"+obb.getT_code());
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("teamone", obb);  
		
		System.out.println("���� �� ������"+list.size());
		sqlSession.close();
		return list;
	}


}
