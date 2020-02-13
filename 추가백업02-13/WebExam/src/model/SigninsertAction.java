package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class SigninsertAction {
	static SigninsertAction model = new SigninsertAction();

	public static SigninsertAction instance() { // instance�޼ҵ尡 ��ü�� �׻� ��. �̱�������, static(����) �ѹ������ϸ� ��ü�������Ű�°�ó�� ������
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public void insertinform(MemberDto MemberDto) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.insert("Signinsert", MemberDto); // mapper.xml�� ,<select> id
		sqlSession.commit();

		sqlSession.close();
	}

}
