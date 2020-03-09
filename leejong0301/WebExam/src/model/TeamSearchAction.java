package model;

import java.util.List;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class TeamSearchAction {
	static TeamSearchAction model = new TeamSearchAction();

	public static TeamSearchAction instance() { // instance메소드가 객체를 항상 뱉어냄. 싱글톤패턴, static(정적) 한번실행하면 전체를실행시키는것처럼 느껴짐
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public List<TeamDto> searchinform(TeamDto teamlist) {
		System.out.println("TeamRegistAction 접근");
		List<TeamDto> list = null;
		TeamDto obb = teamlist;
		System.out.println("obb에 teamlist가 담기는지 확인 컨텐츠"+obb.getTeamtype()+obb.getBranchcode()+obb.getWord());
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("searchteamlist", obb);       // sqlSession 을 불러온 DB를 쓸건데 거기서 selectList 쓴다. mapper 파일에서 태그 이름 ! 
	
		System.out.println("검색게시물 사이즈 : "+list.size());
		sqlSession.close();
		return list;	
	}
	public List<TeamDto> getRegistPlayer(){
		List<TeamDto> TeamList = null;
		SqlSession sqlSession = factory.openSession();			
		TeamList = sqlSession.selectList("registplayer_view");
		sqlSession.close();
		return TeamList;
	}
}