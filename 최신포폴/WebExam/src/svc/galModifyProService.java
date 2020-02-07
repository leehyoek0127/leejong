package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import vo.G_BoardBean;
import dao.BoardDAO;


public class galModifyProService {

	public boolean isArticleWriter(int GB_NUM, String GB_ID) throws Exception {
		boolean isArticleWriter = false;
		Connection con = getConnection();
		BoardDAO GBdao = BoardDAO.getInstance();
		GBdao.setConnection(con);
		isArticleWriter = GBdao.isArticleBoardWriter(GB_NUM, GB_ID);
		close(con);
		return isArticleWriter;
		
	}

	public boolean modifyArticle(G_BoardBean article) throws Exception {
		
		boolean isModifySuccess = false;
		Connection con = getConnection();
		BoardDAO GBdao = BoardDAO.getInstance();
		GBdao.setConnection(con);
		int updateCount = GBdao.updateArticle(article);
		
		if(updateCount > 0){
			commit(con);
			isModifySuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isModifySuccess;
		
	}

}
