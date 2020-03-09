package model;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class LeagueResult_Action {
	
	static LeagueResult_Action model = new LeagueResult_Action();
	public static LeagueResult_Action instance(){
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();


	public List<LeagueResultDto> getLeagueResult(LeagueResultDto leagueresult){
		List<LeagueResultDto> LeagueResult = null;
		System.out.println("LeagueResult_Ation ���� leagueresult �� �Ѿ�Դ��� leagueresult�� �� �ڵ�"+leagueresult.getT_code());
		LeagueResultDto obb = leagueresult;
		System.out.println("obb�� teamcode ������ Ȯ��"+obb.getT_code());
		SqlSession sqlSession = factory.openSession();			
		LeagueResult = sqlSession.selectList("league_result",obb);
		sqlSession.close();
		return LeagueResult;
	}
	
	


}
