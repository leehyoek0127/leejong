package svc;

import java.sql.Connection;
import dao.BoardDAO;
import vo.BoardBean;
import vo.G_BoardBean;
import vo.G_BoardRepBean;

import static db.JdbcUtil.*;
public class G_BoardRepWriteProService {

	public boolean registArticle(G_BoardRepBean boardBean) throws Exception{
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
