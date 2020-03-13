package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class SelectgroundAction {
	
	static SelectgroundAction model = new SelectgroundAction();
	public static SelectgroundAction instance(){ 
		return model;
	}
	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession(); 

	public List<GroundDto> selectGroundname(String ground_name){ 
		List<GroundDto> GroundList=null;
		SqlSession sqlSession = factory.openSession();
		GroundList = sqlSession.selectList("GroundCheck",ground_name);
		sqlSession.close();
		return GroundList;
	}


}
