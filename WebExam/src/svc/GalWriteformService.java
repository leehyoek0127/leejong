package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BoardDAO;
import model.TeamDto;
import vo.GalBoardDto;

public class GalWriteformService {
	public ArrayList<TeamDto> getteamlistid(String id) throws Exception{
		// TODO Auto-generated method stub
		System.out.println("BoardDetailService.getArticle(int board_num)");
		
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		ArrayList<TeamDto> teamlist = boardDAO.selectTeamListId(id);

		close(con);
		return teamlist;
		
	}
}
