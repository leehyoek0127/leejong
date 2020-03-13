package model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;


public class TeamboardmodifyAction {
	static TeamboardmodifyAction model = new TeamboardmodifyAction();

	public static TeamboardmodifyAction instance() { // instance�޼ҵ尡 ��ü�� �׻� ��. �̱�������, static(����) �ѹ������ϸ� ��ü�������Ű�°�ó�� ������
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public void teamboardmodify(TeamBoardListDto teamBoardListDto) {
		
		SqlSession sqlSession = factory.openSession();
		sqlSession.update("teamboardmodify", teamBoardListDto);
		
		sqlSession.commit();

		sqlSession.close();
	}
}