package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.TeamBoardListAction;
import model.BranchDto;
import model.BranchList_Action;
import model.TeamBoardListDto;

public class TeamBoardListService implements Cominterface {
	static TeamBoardListService impl = new TeamBoardListService();

	public static TeamBoardListService instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		TeamBoardListAction teamboardlistaction = TeamBoardListAction.instance();
		ArrayList<TeamBoardListDto> teamboardlist = (ArrayList<TeamBoardListDto>) teamboardlistaction.getTeamBoardList();

		request.setAttribute("teamboardlist", teamboardlist);
		return "team_board_list.jsp";

	}

}
