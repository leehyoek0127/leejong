package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LeagueDto;
import model.League_join_step2_Action;
import model.League_join_step3_Action;
import model.PlayerRegistDto;
import model.TeamDto;

public class League_join_step3_Service implements Cominterface {
	static League_join_step3_Service impl = new League_join_step3_Service();

	public static League_join_step3_Service instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		System.out.println("¼­ºñ½º¿È");
		int t_code = Integer.parseInt(request.getParameter("team_code"));
		System.out.println(1);
		int league_code = Integer.parseInt(request.getParameter("league_code"));
		int player_uniformnum = Integer.parseInt(request.getParameter("uniformnum"));
		String player_position = request.getParameter("position");
		String id = request.getParameter("id");
		System.out.println(t_code);
		System.out.println(league_code);
		System.out.println(id);
		PlayerRegistDto playerRegistDto = new PlayerRegistDto();
		playerRegistDto.setId(id);
		playerRegistDto.setLeague_code(league_code);
		playerRegistDto.setT_code(t_code);
		playerRegistDto.setPlayer_uniformnum(player_uniformnum);
		playerRegistDto.setPlayer_position(player_position);
		
		
		
		
		League_join_step3_Action registmodel = League_join_step3_Action.instance();
		int playerregistresult1 = registmodel.playerregist(playerRegistDto);
		
//		League_BranchList_Action leaguebranchmodel = League_BranchList_Action.instance();
//		ArrayList<BranchDto> LeagueBranchList = (ArrayList<BranchDto>) leaguebranchmodel.getLeagueBranchList();
		
		
		
		request.setAttribute("playerregistresult1", playerregistresult1);
		return "playerRegistResult.jsp";

	}
}