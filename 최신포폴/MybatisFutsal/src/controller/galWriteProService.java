package controller;

import static model.JdbcUtil.*;

import java.sql.Connection;

import model.GBbean;
import mybatis.GBDAO;
public class galWriteProService {

	public boolean registArticle(GBbean GBbean) throws Exception{
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		GBDAO GBdao = GBDAO.getInstance();
		GBdao.setConnection(con);
		
		int insertCount = GBdao.insertArticle(GBbean);
		
		if(insertCount > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isWriteSuccess;
		
	}

}
