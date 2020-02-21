package model;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class BranchList_Action {

	static BranchList_Action model = new BranchList_Action();

	public static BranchList_Action instance() {
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public List<BranchDto> getBranchList() {
		System.out.println("¾×¼Ç±îÁö¿È");
		List<BranchDto> BranchList = null;
		SqlSession sqlSession = factory.openSession();
		BranchList = sqlSession.selectList("branchlist_view");
		sqlSession.close();
		return BranchList;
	}

}
