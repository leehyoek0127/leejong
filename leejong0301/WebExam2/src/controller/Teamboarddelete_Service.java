package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TeamBoardListDto;
import model.TeamboarddeleteAction;
import model.TeamboardmodifyAction;

public class Teamboarddelete_Service implements Cominterface{

	static Teamboarddelete_Service teamregi = new Teamboarddelete_Service();
	public static Teamboarddelete_Service instance() { 
		return teamregi;

	}
	
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		
		int T_B_NO=Integer.parseInt(request.getParameter("teamBoardNo"));

		TeamBoardListDto teamBoardListDto = new TeamBoardListDto();
		
		teamBoardListDto.setT_B_NO(T_B_NO);
		
		
		

		TeamboarddeleteAction model = TeamboarddeleteAction.instance();
		model.teamboarddelete(teamBoardListDto);
		return "teamboarddetail.do?command=teamboardlist";
	}

}