package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.BoardDAO;
import vo.BoardBean;
import vo.G_BoardBean;

public class BoardListService {

	public int getListCount() throws Exception{
		System.out.println("BoardListService.getListCount()");
		int listCount = 0;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		listCount = boardDAO.selectListCount();
		close(con);
		return listCount;
		
	}

	public ArrayList<G_BoardBean> getArticleList(int page, int limit) throws Exception{
		System.out.println("BoardListService.getArticleList(int page, int limit)");
		ArrayList<G_BoardBean> articleList = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		System.out.println("페이지랑리미트"+page+"그리고"+limit);
		articleList = boardDAO.selectArticleList(page,limit);
		System.out.println("아티클리스트"+articleList);
		
		close(con);
		return articleList;
		
	}

}
