package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import vo.ActionForward;
import vo.GalBoardDto;
import svc.GalDetailService;

public class GalModifyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 	ActionForward forward = new ActionForward();
			int GB_NUM=Integer.parseInt(request.getParameter("GB_NUM"));
			GalDetailService galDetailService
			= new GalDetailService();	
			GalBoardDto article = galDetailService.getArticle(GB_NUM);
		   	request.setAttribute("article", article);
	   		forward.setPath("/gal_board_modify.jsp");
	   		return forward;
	   		
	 }
	 
}