package model;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class PlayerRegist_Action {
	
	static PlayerRegist_Action model = new PlayerRegist_Action();
	public static PlayerRegist_Action instance(){
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();


	public List<PlayerRegistDto> getPlayerList(PlayerRegistDto Player){
		List<PlayerRegistDto> PlayerList = null;
		System.out.println("PlayerRegist_Ation ���� Player �� �Ѿ�Դ��� Player�� �� �ڵ�"+Player.getT_code());
		PlayerRegistDto obb = Player;
		System.out.println("obb�� teamcode ������ Ȯ��"+obb.getT_code());
		SqlSession sqlSession = factory.openSession();			
		PlayerList = sqlSession.selectList("player_list",obb);
		sqlSession.close();
		return PlayerList;
	}
	
	


}
