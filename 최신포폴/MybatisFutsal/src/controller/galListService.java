package controller;

import static model.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import model.GBbean;
import mybatis.GBDAO;

public class galListService {

	public int getListCount() throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		GBDAO GBdao = GBDAO.getInstance();
		GBdao.setConnection(con);
		listCount = GBdao.selectListCount();
		close(con);
		return listCount;
		
	}

	public ArrayList<GBbean> getArticleList(int page, int limit) throws Exception{
		
		ArrayList<GBbean> articleList = null;
		Connection con = getConnection();
		GBDAO GBdao = GBDAO.getInstance();
		GBdao.setConnection(con);
		articleList = GBdao.selectArticleList(page,limit);
		close(con);
		return articleList;
		
	}

}
