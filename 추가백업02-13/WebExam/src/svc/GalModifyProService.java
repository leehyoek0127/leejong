package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BoardDAO;
import vo.GalBoardDto;;

public class GalModifyProService {

	public boolean isArticleWriter(int GB_NUM, String GB_ID) throws Exception {
		boolean isArticleWriter = false;
		Connection con = getConnection();
		BoardDAO GBdao = BoardDAO.getInstance();
		GBdao.setConnection(con);
		isArticleWriter = GBdao.isArticleBoardWriter(GB_NUM, GB_ID);
		close(con);
		return isArticleWriter;
		
	}

	public boolean modifyArticle(GalBoardDto article) throws Exception {
		
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
