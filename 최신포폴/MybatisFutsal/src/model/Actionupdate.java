package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class Actionupdate {
	static Actionupdate model = new Actionupdate();

	public static Actionupdate instance() { 
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public List<Mdto> updateinform(Mdto Mdto) {
		List<Mdto> list = null;
		SqlSession sqlSession = factory.openSession();
		sqlSession.update("updateData", Mdto); //mapper.xml¿« ,<select> id
		sqlSession.commit();
		
		
		
		
		list = sqlSession.selectList("selectData");
		sqlSession.close();
		return list;
	}

}
