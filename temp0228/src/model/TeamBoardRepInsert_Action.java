package model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;
import svc.GalDetailService;
import vo.ActionForward;
import vo.GalBoardDto;
import vo.GalRepDto;

public class TeamBoardRepInsert_Action {
	static TeamBoardRepInsert_Action model = new TeamBoardRepInsert_Action();

	public static TeamBoardRepInsert_Action instance() {
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public int TeamRepInsert(TeamBoardRepDto teamboardrep) {
		
		
		
		SqlSession sqlSession = factory.openSession();
//		int num = 0;
//		System.out.println("ddddd111");
//		TeamBoardRepDto maxrep=sqlSession.selectOne("teamboardrepmax");
//		System.out.println("ddddd");
//		if (maxrep.getTb_rep_no()>0)
//			num = maxrep.getTb_rep_no() + 1;
//		else
//			num = 1;
//		System.out.println(num);
//		teamboardrep.setTb_rep_no(num);
		int count=sqlSession.insert("teamboardrepinsert", teamboardrep);
		sqlSession.commit();
		sqlSession.close();
		return count;
	}
}
