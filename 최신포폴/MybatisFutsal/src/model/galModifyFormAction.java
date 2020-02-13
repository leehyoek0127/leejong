package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.galDetailService;

public class galModifyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 	ActionForward forward = new ActionForward();
			int GB_NUM=Integer.parseInt(request.getParameter("GB_NUM"));
			galDetailService galDetailService
			= new galDetailService();	
		   	GBbean article = galDetailService.getArticle(GB_NUM);
		   	request.setAttribute("article", article);
	   		forward.setPath("/gal_board_modify.jsp");
	   		return forward;
	   		
	 }
	 
}