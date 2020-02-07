package svc;

import java.sql.Connection;
import dao.BoardDAO;
import vo.BoardBean;
import vo.G_BoardBean;

import static db.JdbcUtil.*;
public class G_BoardWriteProService {

	public boolean registArticle(G_BoardBean boardBean) throws Exception{
		System.out.println("BoardWriteProService.registArticle(BoardBean article)");
		
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
