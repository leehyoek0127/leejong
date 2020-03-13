package svc;

import java.sql.Connection;
import dao.BoardDAO;

import vo.GalBoardDto;

import static db.JdbcUtil.*;
public class GalWriteProService {

	public boolean registArticle(GalBoardDto boardBean) throws Exception{
		
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int insertCount = boardDAO.G_insertArticle(boardBean);
		
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
