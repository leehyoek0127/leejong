package controller;

import static model.JdbcUtil.*;

import java.sql.Connection;

import model.GBbean;
import mybatis.GBDAO;

public class galReplyProService {

	public boolean replyArticle(GBbean article) throws Exception{
		
		boolean isReplySuccess = false;
		int insertCount = 0;
		Connection con = getConnection();
		GBDAO GBdao = GBDAO.getInstance();
		GBdao.setConnection(con);
		insertCount = GBdao.insertReplyArticle(article);
		
		if(insertCount > 0){
			commit(con);
			isReplySuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isReplySuccess;
		
	}

}
