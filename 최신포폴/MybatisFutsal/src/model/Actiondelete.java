package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class Actiondelete {
	static Actiondelete model = new Actiondelete();

	public static Actiondelete instance() {
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public void deleteinform(Mdto Mdto) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.delete("deleteData", Mdto);
		sqlSession.commit();

		sqlSession.close();
	}
}
