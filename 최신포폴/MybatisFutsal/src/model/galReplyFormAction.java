package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.galDetailService;

public class galReplyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		 	ActionForward forward = new ActionForward();
	   		String nowPage = request.getParameter("page");
	   		int GB_NUM=Integer.parseInt(request.getParameter("GB_NUM"));
	   		galDetailService galDetailService = new galDetailService();
	   		GBbean article=galDetailService.getArticle(GB_NUM);	
	   		request.setAttribute("article", article);
	   		request.setAttribute("page", nowPage);
	   		forward.setPath("gal_board_reply.jsp");
	   		return forward;
	   		
	}
	 
}