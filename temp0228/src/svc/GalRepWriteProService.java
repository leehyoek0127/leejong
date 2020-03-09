package svc;

import java.sql.Connection;
import dao.BoardDAO;


import vo.GalRepDto;

import static db.JdbcUtil.*;
public class GalRepWriteProService {

	public boolean registArticle(GalRepDto boardBean) throws Exception{
		System.out.println("BoardRepWriteProService.registArticle(BoardRepBean article)");
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int insertCount = boardDAO.G_RepinsertArticle(boardBean);
		
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
