package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TeamBoardListDto;
import model.TeamboardListWriteAction;
import model.TeamboardmodifyAction;

public class Teamboardmodify_Service implements Cominterface{

	static Teamboardmodify_Service teamregi = new Teamboardmodify_Service();
	public static Teamboardmodify_Service instance() { 
		return teamregi;

	}
	
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		String id = request.getParameter("GB_ID");
		int T_B_NO=Integer.parseInt(request.getParameter("T_B_NO"));
		String subject = request.getParameter("GB_SUBJECT");
		subject = new String(subject.getBytes("8859_1"), "utf-8");
		System.out.println(subject);
		String contents = request.getParameter("GB_CONTENTS");
		contents = new String(contents.getBytes("8859_1"), "utf-8");
		TeamBoardListDto teamBoardListDto = new TeamBoardListDto();
		teamBoardListDto.setId(id);
		teamBoardListDto.setT_B_NO(T_B_NO);
		teamBoardListDto.setT_B_SUBJECT(subject);
		teamBoardListDto.setT_B_CONTENTS(contents);
		
		

		TeamboardmodifyAction model = TeamboardmodifyAction.instance();
		model.teamboardmodify(teamBoardListDto);
		return "teamboarddetail.do?command=teamboarddetail&teamBoardNo="+T_B_NO;
	}

}