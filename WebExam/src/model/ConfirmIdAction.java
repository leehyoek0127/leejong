package model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class ConfirmIdAction {
	static ConfirmIdAction model = new ConfirmIdAction();
	public static ConfirmIdAction instance(){ //instance�޼ҵ尡 ��ü�� �׻� ��. �̱�������, static(����) �ѹ������ϸ� ��ü�������Ű�°�ó�� ������
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession(); //SqlMapConfig�� ����ϰڴ�

	public List<MemberDto> selectID(String id){ //mapper���� dto�� resulttype���� �Ѱ�������, �޾��ٶ� �̰����� List***�� ���·� �޾��� 
		List<MemberDto> checkuser=null;
		SqlSession sqlSession = factory.openSession();
		checkuser = sqlSession.selectList("IDCheck",id);
		sqlSession.close();
		return checkuser;
	}

}
