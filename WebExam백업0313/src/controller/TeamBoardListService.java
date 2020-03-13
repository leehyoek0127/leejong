package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.BranchDto;
import model.BranchList_Action;
import model.TeamBoardListAction;
import model.TeamBoardListDto;
import vo.PageInfo;

public class TeamBoardListService implements Cominterface {
	static TeamBoardListService impl = new TeamBoardListService();

	public static TeamBoardListService instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		int page=1;
		int limit=10;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		if(request.getParameter("page")==null){
			page=1;
		}
		TeamBoardListAction teamboardlistaction = TeamBoardListAction.instance();
		ArrayList<TeamBoardListDto> teamboardlist = (ArrayList<TeamBoardListDto>) teamboardlistaction.getTeamBoardList(page);
		
		
		int listCount = teamboardlistaction.getListCount();
		//총 페이지 수.
   		int maxPage=(int)((double)listCount/limit+0.95); //0.95를 더해서 올림 처리.
   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		//현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
   	        int endPage = startPage+10-1;

   		if (endPage> maxPage) endPage= maxPage;
   		
   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("teamboardlist", teamboardlist);
		return "team_board_list.jsp";

	}

}
