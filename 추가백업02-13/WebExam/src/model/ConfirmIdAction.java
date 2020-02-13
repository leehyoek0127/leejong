package model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class ConfirmIdAction {
	static ConfirmIdAction model = new ConfirmIdAction();
	public static ConfirmIdAction instance(){ //instance메소드가 객체를 항상 뱉어냄. 싱글톤패턴, static(정적) 한번실행하면 전체를실행시키는것처럼 느껴짐
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession(); //SqlMapConfig를 사용하겠다

	public List<MemberDto> selectID(String id){ //mapper에서 dto의 resulttype으로 넘겨줬으면, 받아줄때 이곳에서 List***의 형태로 받아줌 
		List<MemberDto> checkuser=null;
		SqlSession sqlSession = factory.openSession();
		checkuser = sqlSession.selectList("IDCheck",id);
		sqlSession.close();
		return checkuser;
	}

}
