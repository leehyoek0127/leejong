package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BoardDAO;



import vo.GalBoardDto;
import vo.GalRepDto;

import static db.JdbcUtil.*;

public class GalDetailService {

	public GalBoardDto getArticle(int board_num) throws Exception{
		// TODO Auto-generated method stub
		System.out.println("BoardDetailService.getArticle(int board_num)");
		GalBoardDto article = null;
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
	public ArrayList<GalRepDto> getArticleRep(int board_num) throws Exception{
		// TODO Auto-generated method stub
		System.out.println("BoardDetailService.getArticleRep(int board_num)");
		ArrayList<GalRepDto> articlerep = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		
		
		articlerep = boardDAO.selectArticleRepList(board_num);
		close(con);
		return articlerep;
		
	}

}
