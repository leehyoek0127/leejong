package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class BranchDetail_Action {
	static BranchDetail_Action model = new BranchDetail_Action();
	public static BranchDetail_Action instance(){
		return model;
	}

		private SqlSessionFactory factory = SqlMapConfig.getSqlSession();


		public List<GroundDto> getGroundDetail(String branch_no){
			List<GroundDto> GroundList = null;
			SqlSession sqlSession = factory.openSession();			
			GroundList = sqlSession.selectList("grounddetail_view",branch_no);
			sqlSession.close();
			return GroundList;
		}
		
		public List<BranchDto> getBranchDetail(String branch_no){
			List<BranchDto> BranchList = null;
			SqlSession sqlSession = factory.openSession();			
			BranchList = sqlSession.selectList("branchdetail_view",branch_no);
			sqlSession.close();
			return BranchList;
		}
}
