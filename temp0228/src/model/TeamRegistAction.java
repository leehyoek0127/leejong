package model;

import java.util.List;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class TeamRegistAction {
	static TeamRegistAction model = new TeamRegistAction();

	public static TeamRegistAction instance() { // instance메소드가 객체를 항상 뱉어냄. 싱글톤패턴, static(정적) 한번실행하면 전체를실행시키는것처럼 느껴짐
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public void insertinform(TeamDto TeamDto) {
		System.out.println("TeamRegistAction 접근");
		Random random = new Random();
		SqlSession sqlSession = factory.openSession();
		int result = 0; // mapper.xml의 ,<select> id
		while(result!=1) {
			TeamDto.setT_code(random.nextInt(1000000));
			result = sqlSession.insert("Teaminsert", TeamDto);
		}
			sqlSession.commit();
			sqlSession.close();
		
	}

}
