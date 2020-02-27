package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TeamBoardDetail_Action;
import model.TeamBoardListDto;
import model.TeamBoardRepDto;
import model.TeamBoardRep_Action;




public class TeamBoardDetail_Service implements Cominterface {
	static TeamBoardDetail_Service impl = new TeamBoardDetail_Service();

	public static TeamBoardDetail_Service instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		int teamBoardNo=Integer.parseInt(request.getParameter("teamBoardNo"));
		String page = request.getParameter("page");
		
		TeamBoardDetail_Action teamBoardDetailModel = TeamBoardDetail_Action.instance();
		TeamBoardListDto teamBoardDetailOne = (TeamBoardListDto) teamBoardDetailModel.teamBoardDetail(teamBoardNo);
		
		
		TeamBoardRep_Action teamBoardRepModel = TeamBoardRep_Action.instance();
		ArrayList<TeamBoardRepDto> teamBoardDetailRep = (ArrayList<TeamBoardRepDto>) teamBoardRepModel.teamBoardRep(teamBoardNo);
		
		request.setAttribute("teamBoardDetailOne", teamBoardDetailOne);
		request.setAttribute("teamBoardDetailRep", teamBoardDetailRep);
		
		return "teamboarddetail.jsp";

	}
}
