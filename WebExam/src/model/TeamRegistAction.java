package model;

import java.util.List;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class TeamRegistAction {
	static TeamRegistAction model = new TeamRegistAction();

	public static TeamRegistAction instance() { // instance�޼ҵ尡 ��ü�� �׻� ��. �̱�������, static(����) �ѹ������ϸ� ��ü�������Ű�°�ó�� ������
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public void insertinform(TeamDto TeamDto) {
		System.out.println("TeamRegistAction ����");
		Random random = new Random();
		SqlSession sqlSession = factory.openSession();
		int result = 0; // mapper.xml�� ,<select> id
		while(result!=1) {
			TeamDto.setT_code(random.nextInt(1000000));
			result = sqlSession.insert("Teaminsert", TeamDto);
		}
			sqlSession.commit();
			sqlSession.close();
		
	}

}
