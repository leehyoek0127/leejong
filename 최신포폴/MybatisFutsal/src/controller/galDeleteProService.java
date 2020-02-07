package controller;

import static model.JdbcUtil.close;
import static model.JdbcUtil.commit;
import static model.JdbcUtil.getConnection;
import static model.JdbcUtil.rollback;

import java.sql.Connection;

import mybatis.GBDAO;

public class galDeleteProService {

	public boolean isArticleWriter(int GB_NUM, String GB_ID) throws Exception {
		// TODO Auto-generated method stub
		
		boolean isArticleWriter = false;
		Connection con = getConnection();
		GBDAO GBdao = GBDAO.getInstance();
		GBdao.setConnection(con);
		isArticleWriter = GBdao.isArticleBoardWriter(GB_NUM, GB_ID);
		close(con);
		return isArticleWriter;
		
	}

	public boolean removeArticle(int GB_NUM) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isRemoveSuccess = false;
		Connection con = getConnection();
		GBDAO GBdao = GBDAO.getInstance();
		GBdao.setConnection(con);
		int deleteCount = GBdao.deleteArticle(GB_NUM);
		
		if(deleteCount > 0){
			commit(con);
			isRemoveSuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isRemoveSuccess;
	}

}
