package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDto;
import model.SigninsertAction;
import model.TeamBoardListDto;
import model.TeamboardListWriteAction;

public class TeamboardListWriteService implements Cominterface{

	static TeamboardListWriteService teamregi = new TeamboardListWriteService();
	public static TeamboardListWriteService instance() { 
		return teamregi;

	}
	
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		String id = request.getParameter("GB_ID");
		
		String subject = request.getParameter("GB_SUBJECT");
		subject = new String(subject.getBytes("8859_1"), "utf-8");
		System.out.println(subject);
		String contents = request.getParameter("GB_CONTENTS");
		contents = new String(contents.getBytes("8859_1"), "utf-8");
		TeamBoardListDto teamBoardListDto = new TeamBoardListDto();
		teamBoardListDto.setId(id);
		teamBoardListDto.setT_B_SUBJECT(subject);
		teamBoardListDto.setT_B_CONTENTS(contents);
		
		

		TeamboardListWriteAction model = TeamboardListWriteAction.instance();
		model.insertinform(teamBoardListDto);
		return "teamboardlist.do?command=teamboardlist";
	}

}
