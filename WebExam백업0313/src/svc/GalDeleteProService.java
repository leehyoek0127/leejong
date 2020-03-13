package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.BoardDAO;

public class GalDeleteProService {

	public boolean isArticleWriter(int GB_NUM, String GB_ID) throws Exception {
		// TODO Auto-generated method stub
		
		boolean isArticleWriter = false;
		Connection con = getConnection();
		BoardDAO GBdao = BoardDAO.getInstance();
		GBdao.setConnection(con);
		isArticleWriter = GBdao.isArticleBoardWriter(GB_NUM, GB_ID);
		close(con);
		return isArticleWriter;
		
	}

	public boolean removeArticle(int GB_NUM) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isRemoveSuccess = false;
		Connection con = getConnection();
		BoardDAO GBdao = BoardDAO.getInstance();
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
