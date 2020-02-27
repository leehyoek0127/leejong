package model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class TeamboarddeleteAction {
	static TeamboarddeleteAction model = new TeamboarddeleteAction();

	public static TeamboarddeleteAction instance() { // instance�޼ҵ尡 ��ü�� �׻� ��. �̱�������, static(����) �ѹ������ϸ� ��ü�������Ű�°�ó�� ������
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public void teamboarddelete(TeamBoardListDto teamBoardListDto) {
		
		SqlSession sqlSession = factory.openSession();
		sqlSession.delete("teamboarddelete", teamBoardListDto);
		
		
		sqlSession.commit();

		sqlSession.close();
	}
}