package model;

import java.util.List;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class TeamSearchAction {
	static TeamSearchAction model = new TeamSearchAction();

	public static TeamSearchAction instance() { // instance�޼ҵ尡 ��ü�� �׻� ��. �̱�������, static(����) �ѹ������ϸ� ��ü�������Ű�°�ó�� ������
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public List<TeamDto> searchinform(TeamDto teamlist) {
		System.out.println("TeamRegistAction ����");
		List<TeamDto> list = null;
		TeamDto obb = teamlist;
		System.out.println("obb�� teamlist�� ������ Ȯ�� ������"+obb.getTeamtype()+obb.getBranchcode()+obb.getWord());
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("searchteamlist", obb);       // sqlSession �� �ҷ��� DB�� ���ǵ� �ű⼭ selectList ����. mapper ���Ͽ��� �±� �̸� ! 
	
		System.out.println("�˻��Խù� ������ : "+list.size());
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