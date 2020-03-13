package model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class TeamboardListWriteAction {
	static TeamboardListWriteAction model = new TeamboardListWriteAction();

	public static TeamboardListWriteAction instance() { // instance메소드가 객체를 항상 뱉어냄. 싱글톤패턴, static(정적) 한번실행하면 전체를실행시키는것처럼 느껴짐
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public void insertinform(TeamBoardListDto teamBoardListDto) {
		
		SqlSession sqlSession = factory.openSession();
		System.out.println("액션에서 제목: "+teamBoardListDto.getT_B_SUBJECT());
		sqlSession.insert("teamboardinsert", teamBoardListDto); // mapper.xml의 ,<select> id
		sqlSession.commit();

		sqlSession.close();
	}
}
