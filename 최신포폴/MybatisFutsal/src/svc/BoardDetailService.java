package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BoardDAO;
import vo.BoardBean;
import vo.G_BoardBean;
import vo.G_BoardRepBean;

import static db.JdbcUtil.*;

public class BoardDetailService {

	public G_BoardBean getArticle(int board_num) throws Exception{
		// TODO Auto-generated method stub
		System.out.println("BoardDetailService.getArticle(int board_num)");
		G_BoardBean article = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int updateCount = boardDAO.updateReadCount(board_num);
		
		if(updateCount > 0){
			commit(con);
		}
		else{
			rollback(con);
		}
		
		article = boardDAO.selectArticle(board_num);
		close(con);
		return article;
		
	}
	public ArrayList<G_BoardRepBean> getArticleRep(int board_num) throws Exception{
		// TODO Auto-generated method stub
		System.out.println("BoardDetailService.getArticleRep(int board_num)");
		ArrayList<G_BoardRepBean> articlerep = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		
		
		articlerep = boardDAO.selectArticleRepList(board_num);
		close(con);
		return articlerep;
		
	}

}
