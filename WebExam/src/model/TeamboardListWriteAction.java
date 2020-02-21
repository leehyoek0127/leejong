package model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class TeamboardListWriteAction {
	static TeamboardListWriteAction model = new TeamboardListWriteAction();

	public static TeamboardListWriteAction instance() { // instance�޼ҵ尡 ��ü�� �׻� ��. �̱�������, static(����) �ѹ������ϸ� ��ü�������Ű�°�ó�� ������
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public void insertinform(TeamBoardListDto teamBoardListDto) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.insert("teamboardinsert", teamBoardListDto); // mapper.xml�� ,<select> id
		sqlSession.commit();

		sqlSession.close();
	}
}
