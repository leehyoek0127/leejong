package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BranchDto;
import model.League_BranchList_Action;

public class League_team_step1_Service implements Cominterface {
	static League_team_step1_Service impl = new League_team_step1_Service();

	public static League_team_step1_Service instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
//		LeagueList_Action leaguemodel = LeagueList_Action.instance();
//		ArrayList<LeagueDto> LeagueList = (ArrayList<LeagueDto>) leaguemodel.getLeagueList();
		League_BranchList_Action leaguebranchmodel = League_BranchList_Action.instance();
		ArrayList<BranchDto> LeagueBranchList = (ArrayList<BranchDto>) leaguebranchmodel.getLeagueBranchList();
		
		request.setAttribute("LeagueBranchList", LeagueBranchList);
		return "league_team_step1.jsp";

	}
}